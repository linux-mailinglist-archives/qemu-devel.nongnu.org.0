Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7156315796
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:18:46 +0100 (CET)
Received: from localhost ([::1]:58986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZTB-0007I6-TL
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6673de3c3=Dmitry.Fomichev@wdc.com>)
 id 1l9Yr5-0004cG-Px; Tue, 09 Feb 2021 14:39:23 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:23452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6673de3c3=Dmitry.Fomichev@wdc.com>)
 id 1l9Yr1-0005VI-Vn; Tue, 09 Feb 2021 14:39:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612899560; x=1644435560;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MnHRI821V9jG/NQa7NKfDnnFDOnnQORhVN6i8KxbkRg=;
 b=Fj2Hfop5b5STUOHRZE2LhWenedKYUu//jMDUu7mWa5pR74b8D1gsto8N
 V27LHjzsXdvZ7HaBLD2NthXeiU2KvZJnag8JfFfkeyQg65ob2vO6GMOdE
 w9ZWzdmhmHnoAgV34wdKKaZrpqm+b3vfxhpi7doKdTtC5I6NkJE47uumi
 4A3tdPSmYGkxi3j0rsjQyZVd1UhLQYWoBN4I+ogTf3ETtUS7vXcYs2sgn
 gLwF1orVgPnOIs0Q6ZlZq96xpsp+t2fRbw7f6i+EWcWuVjbslpFO/3mLu
 //ECRxCrauXoewXRRJP1WwVPKyf/zn6WPXVYi2gtHGB4tvTH8YcufEBsg g==;
IronPort-SDR: g/XhEfQKX+BNn4INTVFXsMMH60d7OK4YdvX18sjaflAH0nlgmH4Qe0d4PUGDYFw0sImyre9ose
 PnsQmAVR7+BT42zbvl0nOBQUfNe+7EN4wJLHlCuJ1LyxGnfLwET6m/lxU8S2OdU7Dio69lbg3v
 RW+lDncOk6vSYPq1KoPcyDstxJbACwv8wfEXG0TFLKayWfWbPYfDr3E9+poXIiT8KJEIE8Xwt0
 dG9US/mp9/jDguiiEA6J7sSqyFkO1eJMiUjYrGY4K0LBlA1usGlj13PTSJMc+RYEktxKNtzgQP
 wwE=
X-IronPort-AV: E=Sophos;i="5.81,166,1610380800"; d="scan'208";a="160741363"
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2021 03:39:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmlAi2zKJ6cV8IYMqPj9W4ptrrtA1LeWGZd3sZ8ins0uqiU0Me5MopD6Z7N7oCj4+Uabo+mGx4T0gtezajkFgZV8PxfNacH3bK4J+gtqP6GkRbzk/ez+Ub9Icluqhj+FtKOSvxljomd1NjsXriiUooCxI31B8I+buk6EGO6ynfkpgXh5qVFTs+23Wz6gT9RAqYUQW0c+DUTbG244qGmLDH5+8o6HDhJq3ulMP7G19EkrsCxUzIbfQqdbzpSn6kjnje/1WAiXdijZipkTE39+GLnfWHUD4oeBaPNWt7++XObY7VdhLhDra90DIVRgfwBwQ7Q1CgNtKTblqccaA1y+8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnHRI821V9jG/NQa7NKfDnnFDOnnQORhVN6i8KxbkRg=;
 b=F6FdCjo7FUJ8k3H+0FXJvbLhPvWb3YRiLKR6HY1MsKuR8NRr2rS2xdMR2/gXfhMcnT/ecKmb010G3bKSgMjOjzpnWf75WUG/pGITGHVsmZjRT+6LMxD7WAQ7hH4V03sC8ucuXosZOMENbfeSzjYJG4WRKe/D7YFD02TrpNoWsndl9BtCesC8FP4dD1LH83s5OJ3TqwPayMKrB0qUhrdCQfsCusDlIjKzaWQd/eDN7ZMsv7C6zyoBh1fQl0hQxAkIYgAcSVghs59cblrZ1cHF7BwHMH4sgtqxPkfKnxj8ggNSsNjojnqRnybIdW2gVfeKFF3qVHseP7CTMqYWv2D74Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnHRI821V9jG/NQa7NKfDnnFDOnnQORhVN6i8KxbkRg=;
 b=J9IbNTBGop9bvxnoXG0tFlm4S3gq3jNPDH8iTlksCSi5Pr4lolnRLjwq65V+z2EbwC4m+kjQ4LeMOWg9FD7xgYeHdovlpEnz56x4p3rH9Ky2n9cRdwm6FxJpyfvJfgHZfi+eH3824FAsyuQ0ay+qpxq6Pv9ZfLTp2sVQXkiBadE=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by MN2PR04MB5949.namprd04.prod.outlook.com (2603:10b6:208:fe::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Tue, 9 Feb
 2021 19:39:14 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::e99b:29e0:c2df:8617]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::e99b:29e0:c2df:8617%4]) with mapi id 15.20.3846.025; Tue, 9 Feb 2021
 19:39:14 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "its@irrelevant.dk" <its@irrelevant.dk>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/block/nvme: improve invalid zasl value reporting
Thread-Topic: [PATCH] hw/block/nvme: improve invalid zasl value reporting
Thread-Index: AQHW/fP+5P2qqbLKQ0+zKQf2u+zLb6pQOpSA
Date: Tue, 9 Feb 2021 19:39:14 +0000
Message-ID: <4c6a62bf19b79eb7b770aba90425a0ebffbc9fb7.camel@wdc.com>
References: <20210208082532.308435-1-its@irrelevant.dk>
In-Reply-To: <20210208082532.308435-1-its@irrelevant.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.2 (3.38.2-1.fc33) 
authentication-results: irrelevant.dk; dkim=none (message not signed)
 header.d=none;irrelevant.dk; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [100.35.209.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d5cfc968-7e4e-408e-2abd-08d8cd3261df
x-ms-traffictypediagnostic: MN2PR04MB5949:
x-microsoft-antispam-prvs: <MN2PR04MB59497737FB432A4E777EF8F1E18E9@MN2PR04MB5949.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2iB04sErMBQAZMRgOPSV5mfYOK0BuwioYuxdd6EIm0Du9JtlyWB23M4w1rLWC1LOjffZkJntws1/aNJm7xRKzjDAVSfGwO3J/Rhnm3XUh1OmNN0ioFbZiziJAyD1/A7eQVaVCk+w6BmtaBjwC3ygKURZBM6DTqZ6K5OQGvrYPZj1Dh0uN4pHFSploRv3uzetRUN+pOippVRDI6eOBw5SFF/MgL18S3srVoEBQnxJUfdb+kU8b2TTDtAe31xLkVmA3WnIzeeobNZe5EVSsmbfVZNpHZhxQcGAviNMRNd2SOBsNdRMvIj8TZJlI7rqVbxKEjZhFEWD5alJfF5BtgwzylUSlT4zIMXGUIjyWOhLjz6cQWSmmpNUaJ0gKlHZLeZP69C17rKi5KvcD6jxOJbZqVb+bl7/A6nMBAUJMzzlr3v6yk8MA3D0/egQSdN7bmzHbdvchc6932+NLw9IiNEvpxqWS5Fd11A09Dd75+xn8umn8knZHcfxQR+MAiTBQAK0O3jVHAlU3E2CGl0KH51YjQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(83380400001)(6512007)(8936002)(26005)(186003)(8676002)(6486002)(2906002)(76116006)(86362001)(4326008)(110136005)(66446008)(66556008)(2616005)(316002)(66476007)(64756008)(71200400001)(36756003)(54906003)(66946007)(478600001)(5660300002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QmEzdXU3UEMvQktwQm55Mm4xK1k0aWdtaW1sMFVPK0ZqcUVzYStIbDBZWnpn?=
 =?utf-8?B?N3d0UnJqeVEvQmZwVnJQWFNQeEdnRlIxOWRRb2xRV3ozcVE5US8wcFNXU01k?=
 =?utf-8?B?cjl0UW44cmJTZEhFMTZGaS9EZkpMWUVTYkZ1eW9jNEdmM1ZHUFJHS2l6YnMy?=
 =?utf-8?B?QkZIaHJsNGlBaEQ4bytXNENPYkR4cWpqMVBCckdKaUc0akRydDhnNjN0enRI?=
 =?utf-8?B?dmZRRWx5Mk95czh3R2wrTjRFWDMva1V6ZEdoTzhtN1JCVEVTM2NjMEx6cDA5?=
 =?utf-8?B?dmowajZkZ280NW9aUXA3M3ExYW5PbmRJejJKUjBZUUtZSXFmV0xJQllMcnlI?=
 =?utf-8?B?UjJDamUybXloeHJ2N25rdWsvQ3VVVjJIeVdrYjAyRzlXVFRwYUZTNFFNb3R2?=
 =?utf-8?B?YW9YdGV1ZVhSbHRxRVd3Um53YThjaXBmbE12SklxdFZONVoyZE0ydVk1MFNL?=
 =?utf-8?B?R0d0VWJ1TXBBbEhQSU5rNEVZL3R0V0syR0RnNnpmc1h6aWo1Vzd4L1RCMUVa?=
 =?utf-8?B?cmZqZFF5VkdseG5yTjJ1bDN2QmZ6a2x6RS9WZU5zYmIxaklzdnZRZWh1M2Ra?=
 =?utf-8?B?eUlxeDJja0hrb3AxRFhybk5hZXU5bjVtbTcyazVtek1pTFN4QmZ0KzVLbGlQ?=
 =?utf-8?B?UXBWRW1OS1gvQk5nWkhuWExYbkNrdjVzK3VTR0R6MWUyZ1B5RmE5d3VQQkFh?=
 =?utf-8?B?aFl3ZHErMGV3RUJ4bHA0Nk9weGh1eDh0ZTR4a3FTRXJTVFZFZDhiUG44QVM2?=
 =?utf-8?B?WDJtc3VvQ25ibTJJck5JOVRScGdtMGpoMDhCRjJZQ3NNKzBNVncvWTNqaUpR?=
 =?utf-8?B?aFByU3RmSklobXlCckJKbWM0M1ZjS0dLS1ZJemVrQkNlUEJrNHBQMFV5UDdD?=
 =?utf-8?B?ODhvRXVQb1REQTBLNlpkLzh2cncwa0l6TWVzdzhTYnppTExnQVdyNGdQKzVV?=
 =?utf-8?B?VVZSVDlrdnlhZmJ2NU1BUEg3NUNxQlNCM05TSUkrZTJZSWVZTDFBY3RlS2Z3?=
 =?utf-8?B?WXhOWTcydGw1SEc1NytVSTlDNlkwWGJGNnFkVHpmMTYrdXhhazVUdjQ4WWM5?=
 =?utf-8?B?cVV6eStoQWd1NWJ3TlJpS3dQUHpoZ1M2T2RIOEFDSDhnbHpjMWJ3T3F2ZkRp?=
 =?utf-8?B?VEVjWmhQWkpsYkRFMHlnREFoR3hWVmFXaGdHOFBDa0l1L05GTXFjWjV1L3Nt?=
 =?utf-8?B?WjdLK041UUpOWUt0K3ptTU5lZmNvMDhoM3NhRlZhb1BkbXdMSGIzM3FwZEc3?=
 =?utf-8?B?dHBucEN1L0JZTUpUemFlMzJlYTJ1blZ5YWtmdW1QZktLcXpjbWJMSU9NZmp1?=
 =?utf-8?B?MzV2cnBSQkorV3ZRTjdhRnVFQXdNYWltVm0vbjVsdVlsOEE5Kytla1ljL0NE?=
 =?utf-8?B?Z1Boa1hrVElxaUhaKytqS2lzMUFCZlFoQ2xySk9tYTZCZ25Ed1dWUDdYdFQ5?=
 =?utf-8?B?VFpvVS9UdjlHTGZjeVJLNEZvWDRIL2Y0NEFxdlhuQ3ppWUYzdTFKdEErQUph?=
 =?utf-8?B?WW9sL0tDYzlHNDFMdWJoSk1iSzZIQVpITFRWK1BRcVVUVldLLzIrajd5V3dm?=
 =?utf-8?B?Mnc3NTAzOU12cGZPQTAvbTVTSnVHN2J6RU1LN3krMEVoVkE2TnRRekpTaGo2?=
 =?utf-8?B?b1lJWWZsdmF0T0pZQWdlRmMxdnBhbUJxbUZLNlFySmNjOUF1bFRqWCs1WTlT?=
 =?utf-8?B?UXA5WWU3Ky8xZENqcUJlK3drSE9zMzNJNldNek9ZdmI3WHRsZnJGb1VtOU1K?=
 =?utf-8?Q?BUk8rkdF3MNl/ftu/3uKIhJPYWZo2kqIa/ttgE1?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <016DC317DCE2D54FBA793974DA6908EB@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5cfc968-7e4e-408e-2abd-08d8cd3261df
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 19:39:14.6379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Jkg2ysd5gf2j6WjuiBZgPWuoHQXfzidiN7xYXV+pO7FkUe8raFYQyH9EPpcfz4ItUICZ3gGC9/jZUqhFbWeOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5949
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6673de3c3=Dmitry.Fomichev@wdc.com; helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>,
 "info@dantalion.nl" <info@dantalion.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gTW9uLCAyMDIxLTAyLTA4IGF0IDA5OjI1ICswMTAwLCBLbGF1cyBKZW5zZW4gd3JvdGU6DQo+
IEZyb206IEtsYXVzIEplbnNlbiA8ay5qZW5zZW5Ac2Ftc3VuZy5jb20+DQo+IA0KPiBUaGUgWm9u
ZSBBcHBlbmQgU2l6ZSBMaW1pdCAoWkFTTCkgbXVzdCBiZSBhdCBsZWFzdCA0MDk2IGJ5dGVzLCBz
bw0KPiBpbXByb3ZlIHRoZSB1c2VyIGV4cGVyaWVuY2UgYnkgYWRkaW5nIGFuIGVhcmx5IHBhcmFt
ZXRlciBjaGVjayBpbg0KPiBudm1lX2NoZWNrX2NvbnN0cmFpbnRzLg0KPiANCj4gV2hlbiBaQVNM
IGlzIHN0aWxsIHRvbyBzbWFsbCBkdWUgdG8gdGhlIGhvc3QgY29uZmlndXJpbmcgdGhlIGRldmlj
ZSBmb3INCj4gYW4gZXZlbiBsYXJnZXIgcGFnZSBzaXplLCBjb252ZXJ0IHRoZSB0cmFjZSBwb2lu
dCBpbiBudm1lX3N0YXJ0X2N0cmwgdG8NCj4gYW4gTlZNRV9HVUVTVF9FUlIgc3VjaCB0aGF0IHRo
aXMgaXMgbG9nZ2VkIGJ5IFFFTVUgaW5zdGVhZCBvZiBvbmx5DQo+IHRyYWNlZC4NCj4gDQo+IFJl
cG9ydGVkLWJ5OiAiaW5mb0BkYW50YWxpb24ubmwiIDxpbmZvQGRhbnRhbGlvbi5ubD4NCj4gQ2M6
IERtaXRyeSBGb21pY2hldiA8RG1pdHJ5LkZvbWljaGV2QHdkYy5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IEtsYXVzIEplbnNlbiA8ay5qZW5zZW5Ac2Ftc3VuZy5jb20+DQo+IC0tLQ0KPiDCoGh3L2Js
b2NrL252bWUuYyB8IDEyICsrKysrKysrKystLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L2Jsb2NrL252
bWUuYyBiL2h3L2Jsb2NrL252bWUuYw0KPiBpbmRleCBjMmYwYzg4ZmJmMzkuLmQ5Njg4OGNkMjMz
MyAxMDA2NDQNCj4gLS0tIGEvaHcvYmxvY2svbnZtZS5jDQo+ICsrKyBiL2h3L2Jsb2NrL252bWUu
Yw0KPiBAQCAtMzk4Myw4ICszOTgzLDEwIEBAIHN0YXRpYyBpbnQgbnZtZV9zdGFydF9jdHJsKE52
bWVDdHJsICpuKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqBuLT56YXNsID0gbi0+cGFyYW1zLm1kdHM7
DQo+IMKgwqDCoMKgwqB9IGVsc2Ugew0KPiDCoMKgwqDCoMKgwqDCoMKgwqBpZiAobi0+cGFyYW1z
Lnphc2xfYnMgPCBuLT5wYWdlX3NpemUpIHsNCj4gLSAgICAgICAgICAgIHRyYWNlX3BjaV9udm1l
X2Vycl9zdGFydGZhaWxfemFzbF90b29fc21hbGwobi0+cGFyYW1zLnphc2xfYnMsDQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG4tPnBh
Z2Vfc2l6ZSk7DQo+ICsgICAgICAgICAgICBOVk1FX0dVRVNUX0VSUihwY2lfbnZtZV9lcnJfc3Rh
cnRmYWlsX3phc2xfdG9vX3NtYWxsLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIlpv
bmUgQXBwZW5kIFNpemUgTGltaXQgKFpBU0wpIG9mICVkIGJ5dGVzIGlzIHRvbyAiDQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAic21hbGw7IG11c3QgYmUgYXQgbGVhc3QgJWQgYnl0ZXMi
LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgbi0+cGFyYW1zLnphc2xfYnMsIG4tPnBh
Z2Vfc2l6ZSk7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC0xOw0KPiDCoMKg
wqDCoMKgwqDCoMKgwqB9DQo+IMKgwqDCoMKgwqDCoMKgwqDCoG4tPnphc2wgPSAzMSAtIGNsejMy
KG4tPnBhcmFtcy56YXNsX2JzIC8gbi0+cGFnZV9zaXplKTsNCj4gQEAgLTQ1MDMsNiArNDUwNSwx
MiBAQCBzdGF0aWMgdm9pZCBudm1lX2NoZWNrX2NvbnN0cmFpbnRzKE52bWVDdHJsICpuLCBFcnJv
ciAqKmVycnApDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXJyb3Jfc2V0ZyhlcnJwLCAi
em9uZSBhcHBlbmQgc2l6ZSBsaW1pdCBoYXMgdG8gYmUgYSBwb3dlciBvZiAyIik7DQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOw0KPiDCoMKgwqDCoMKgwqDCoMKgwqB9DQo+ICsN
Cj4gKyAgICAgICAgaWYgKG4tPnBhcmFtcy56YXNsX2JzIDwgNDA5Nikgew0KPiArICAgICAgICAg
ICAgZXJyb3Jfc2V0ZyhlcnJwLCAiem9uZSBhcHBlbmQgc2l6ZSBsaW1pdCBtdXN0IGJlIGF0IGxl
YXN0ICINCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIjQwOTYgYnl0ZXMiKTsNCj4gKyAgICAg
ICAgICAgIHJldHVybjsNCj4gKyAgICAgICAgfQ0KPiDCoMKgwqDCoMKgfQ0KPiDCoH0NCg0KVGhl
IGd1ZXN0IGVycm9yIGlzIGxlc3MgY29uZnVzaW5nIHRoYW4gc2ltcGx5IGEgdHJhY2UuIExHVE0u
DQpSZXZpZXdlZC1ieTogRG1pdHJ5IEZvbWljaGV2IDxkbWl0cnkuZm9taWNoZXZAd2RjLmNvbT4N
Cg0KPiDCoA0KPiANCj4gDQo+IA0KDQo=

