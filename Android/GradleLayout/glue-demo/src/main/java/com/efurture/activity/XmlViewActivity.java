package com.efurture.activity;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

import com.efurture.XmlViewUtils;
import com.efurture.glue.ui.XmlViewLoadListener;
import com.efurture.glue.ui.XmlView;
import com.google.furture.R;

public class XmlViewActivity extends Activity {

	public static final String ACTIVITY_LISTENER = "activityListener";

	protected XmlView hybridView;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_xmlview);


		Uri uri = getIntent().getData();
		String url = getIntent().getExtras().getString("url");
		if (!TextUtils.isEmpty(url)) {
			uri = Uri.parse(url);
		}

		String title = getIntent().getExtras().getString("title");
		if(title != null){
			getActionBar().setTitle(title);
		}

		hybridView = (XmlView) findViewById(R.id.hybird_view);
		hybridView.setXmlViewLoadListener(new XmlViewLoadListener() {
			@Override
			public void onLoadFailed() {
				Toast.makeText(getBaseContext(), "Load Failed", Toast.LENGTH_SHORT).show();
			}

			@Override
			public void onLoadSuccess() {

			}
		});
		hybridView.loadUrl(uri.toString());
		XmlViewUtils.devTool(hybridView, this);
	}

	@Override
	protected void onResume() {
		super.onResume();
	}


	@Override
	protected void onPause() {
		super.onPause();

	}


	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.xmlview, menu);
		menu.findItem(R.id.action_reload).setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener() {
			@Override
			public boolean onMenuItemClick(MenuItem item) {
				Intent intent = new Intent(getBaseContext(), XmlViewActivity.this.getClass());
				intent.setData(getIntent().getData());
				intent.putExtras(getIntent().getExtras());
				startActivity(intent);
				finish();
				return false;
			}
		});
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		int id = item.getItemId();
		if (id == R.id.action_reload) {
			return true;
		}
		return super.onOptionsItemSelected(item);
	}


	@Override
	protected void onDestroy() {
		super.onDestroy();
	}

}
