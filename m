Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E02E31333D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 14:29:06 +0100 (CET)
Received: from localhost ([::1]:49488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l96at-0006Hc-Ax
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 08:28:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1l90aZ-0005go-1g
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 02:04:10 -0500
Received: from mga17.intel.com ([192.55.52.151]:44498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1l90a8-00058Q-Aj
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 02:03:54 -0500
IronPort-SDR: NLJucU3afKkS+wjhncHXWyn/gAtXFlp4K6GImsuTMDwYrvo/D6Aa5tsw1tP5H9dMKukwGBq6pT
 kmq8n3ZsERig==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="161421059"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="161421059"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 23:03:15 -0800
IronPort-SDR: REcnIa45DJshEo69hUTmw4KedUb0cxah8Muh1oWnLvwHZ7QnZik05WnaV9lVZ3X4A3cnv2gofO
 TDc2/5sKZouA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="398273429"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 07 Feb 2021 23:03:12 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 7 Feb 2021 23:03:11 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 7 Feb 2021 23:03:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sun, 7 Feb 2021 23:03:11 -0800
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.59) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 7 Feb 2021 23:03:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHQQptJkAl4EyYl6ujhEWODTuoxKfnIcohL1h3j3hLnYxgkj1lcy4MkLgFE3ygfZNg3wTbMEBz+47M8wMXQbzATwKBJzOdyMka/Nm1oBfITmP+yrqAZ+MG9P1f1Km5yOJcACkeAoT08UNwTojXPmjyjoc3+ZeXJYHd84m3QaA61LOxS8nPaxdYCEOUJi6WYmvHiwUdqhw6t4sXcInbg5M1f65G049OEv7C3sOVbIUDgMXBSF4xs9T6pml5laWPAsFqu0UtAGd7b5WQXkj4fn9iNnmCkCkvIsMFrmOlfM/i0jvLDNvINjWYdC5Z4ijwftB+pgRsH6/VgQCpF+gulHkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRhE9+aYkiwsZ96sSenl+ozPN5fdunLjr1oUvZLouhY=;
 b=JPt498RRIZVTbiaSmcIzqNBqkYIwjKKROldQdR/QQjCt1nY1Qe3VvIK/rUSB/wS8f7eRjGxLffCLD2HiEkVczlUz2ExCNhmD4FN/MEFwM25PI6Qni2uiISmjjVfYKtWMbM/LKkRDfbS5wGQHGmsYQiAJC4w/c3BPNMUPTFCTHSIGj8gvdN15hoEMwwfwuKIuFnYEVPiMGQda80otvunRFZ9RDmryELsGirZjqDE87f+QAEVLbOUEwblZLnp6oXLI23GTdw8IJsOmbAWyw4jcmSG7PzNhgJSSzUhKQXZJrWLahpNAhVF9PGJKcNF+vq2gMLRkNCawQhPd8yNwk40vfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRhE9+aYkiwsZ96sSenl+ozPN5fdunLjr1oUvZLouhY=;
 b=rumZCQASvAQzYICurmRLzf0TEYZFm4m9ApxZ9ITT/2zbFgHcKM0bUzPl/zHoJjoym4vtgqN9nIgOOKpxDP5R8F2QzpNLuL/nGHI7wbL3Z4jXxpHongE0wHaK28X9rbarUcblRRRc1JpJr2VzEqmHtCxzxVRBd/f1WeyxzqJZnRo=
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Mon, 8 Feb
 2021 07:03:09 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46%6]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 07:03:09 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH] vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support
Thread-Topic: [PATCH] vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support
Thread-Index: AQHW+y09pBuC5UAtHkqkqUwosYfN/KpI5EiAgABYhoCAAHSvgIACskUAgABmI4CAAP2bwA==
Date: Mon, 8 Feb 2021 07:03:08 +0000
Message-ID: <MWHPR11MB1886766DF6F20BC4153918C08C8F9@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <20210204191228.187550-1-peterx@redhat.com>
 <2382a93d-41c1-24fd-144f-87ee18171bc9@redhat.com>
 <213acf9a-d1c0-3a1d-4846-877d90fadc03@redhat.com>
 <20210205153107.GX6468@xz-x1>
 <MWHPR11MB1886DACA066190C94FD2C27F8CB09@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210207144715.GG3195@xz-x1>
In-Reply-To: <20210207144715.GG3195@xz-x1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [101.88.226.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1d225e1-73cf-4b69-159d-08d8cbff977a
x-ms-traffictypediagnostic: CO1PR11MB4931:
x-microsoft-antispam-prvs: <CO1PR11MB4931132081B03ABA6B8BEF968C8F9@CO1PR11MB4931.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B5qghKY1sMbLzAgNu+6a4K2pD8/mOFiD8CJgjif9MqaEOWjeDYr9IrZtsSSU8ldCgb2br74w8tHLptHD8RuoxxaovApDmwLfRVdFc+rNVcn7511cA5oEOqITc0OqRmU9UgjYRiebsLXShu336uBtkL4rmMD9WLGQWdAwxoRSFzvANvamsqjfbMdJk3B7DGuHV/a0I1LGzxXTAKMBofm6waMQiie+w817eLeznFrTkTLKdmYXxEckQgWlqDqDshoLiaxbo3ca9gRQJXFpy5Uahxmtug53pHzEESmtxgbyVqPf4L5EtyY82n1IP+l/z6OvImT5y4VUqaMAlf+nrSBL/emJDQvr+EbKkJ2aJjP87qC7lS79dEyUHd7zwaeW2bkyvrwwb0B8sSoaEXQXpxli0Xhpa4a0snSm1oZ+8rHvms3Sim+zJZkWoNvf8/DkpwrWOb4NjYRdPnSM+tEIOH74Dpmrc+OVNtJnnYYrSZIHeYtlZiq0ipBm9/8+iiWQrLhnEC6VmDUxE+Zd90viUgM96A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1886.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(39860400002)(346002)(366004)(396003)(66556008)(64756008)(55016002)(9686003)(66446008)(66476007)(7696005)(316002)(6916009)(76116006)(71200400001)(66946007)(54906003)(6506007)(8936002)(8676002)(33656002)(2906002)(86362001)(26005)(186003)(52536014)(5660300002)(478600001)(83380400001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UzMvZGJ4ekE5eU8zUlQzTk5EeVU0MHNTS0VGSTlmUUtsRDNDWS9mZ0ZPMjlo?=
 =?utf-8?B?Q3FScUtiZXFtUC9vRTBDallFZzcwbVVuRVhMZS9xS0lNSzVLai9RaXJUZHAv?=
 =?utf-8?B?dGpWRktydlZrS0pLTTVRa1VuL01IQklkVERuQ0F5bFRRSTA5SFRpaVk2WjIz?=
 =?utf-8?B?aDZsUmFjclNrdWE5YTd2MEF6Z1BXV0dZck1PNm5wOUZBR2MvanlPY0FneFFN?=
 =?utf-8?B?eXJzcURIMkpsWXU5dTRSeUZxZVNUZVlkUEhHU2YrUjNoSEppcEtHZ2JoRFhG?=
 =?utf-8?B?L29kZ3ZTS3lneEVmTDdwWGN2N3prM3RTbkl6OCtMU09vK0dIbk5yMkllM09N?=
 =?utf-8?B?NVFlMUE1ODkyTDk4ZmRJNWtCNXZROHY3WDRmZzE1QnFUUDlpYk5ZNjFGNTdZ?=
 =?utf-8?B?UkE2MzNMeGFPVVN2dWRXOE1FM1p0TExMNDZFaUxOY0xwM2pmTm9MZHd3SlVZ?=
 =?utf-8?B?TkNTaG9uWktoWDZoc2hIaHEyTmxoOCtTT0tHSk8wejl5NzVsV1p1elVUeURU?=
 =?utf-8?B?MEtGQTBYRVVqK1dJcW44VzhCdUZITGhOaXU4M0orSTJYZ0MrYjdoWjdVN0dU?=
 =?utf-8?B?LzcvYnJvK0hqR253Y3VIUGk5djFrZVlwbzUzUUhaUlVJK0NtS0ZMeDNUaXRm?=
 =?utf-8?B?ajJQclc0U0dHZmdjZlFEQU9nZDNpa0FjYkR0T0RHQXJGOWZKYjM5N1pCQ1dH?=
 =?utf-8?B?VFcxWjFqUmU0TVhoeC9qTmVXR2pPNHpLd3BJRGV5WU5pK0Q1aXlXOXd2VjAz?=
 =?utf-8?B?cC9rTVR2akV0YkxkNDhFSGpRblU5cDlhaXJMQU8zZHN2UEk4cDlMWXRrL1A1?=
 =?utf-8?B?aFRvZm1vQmVJTTZoK0tSZjBIV0hWc3dTbGNpdysxY2NQTUs2Y3lTazlqbUZ5?=
 =?utf-8?B?eWxFSU4xdzl0Q3V1ckhpdExvdWVmTkIyWXlWRXJQdUo1QzExbVU2c3VJc2dS?=
 =?utf-8?B?UXdaNENBS0NDbVhtUGhQc1FDeFB4NGVyTTdCRE56b3J5a04ycVgvYjk3UHcy?=
 =?utf-8?B?RmIvT2ZPMDBLS0taeTBuQzBoSFluUSsrZmV5WVREMzVOSE5wT3F3cUF2MFEv?=
 =?utf-8?B?NCthUFFOYXJ1NXdLNmh0NVBidTl0dEJoVkpFQ1pSVnA3NW1jcHYwbDJObDV6?=
 =?utf-8?B?THYwckcyR1RoZjljbkI0Ui9PY1FONkY0b3p1cDk4VnpWaWp3RzZ3VFpCOFJE?=
 =?utf-8?B?a3lWQzlZa2M0VkpFSWtZbjZxNEhndExwUVc5L2d4Yk0xTW9LbUpNK25HL2F3?=
 =?utf-8?B?SHdjcUJpQkpybERhNWNVNktjRFQxMzVEUTc0SlFLNWZwdmtwR2pIeHNENHho?=
 =?utf-8?B?YTRQNkgzMkRNTjN5aDVyMHVFL1BhVnBWdnNNYlRJQzVaV2FJN3BHY3BUc2lT?=
 =?utf-8?B?aFRFY3AxQktDVjlzSVRhbTlaWjVRNjk5Tis3RnJmVTBoM0IwZkxiMUlzdFFE?=
 =?utf-8?B?MFpYNVNVZmlHblpSSFN1ay8vemg5cjZlYTA1eVh3UGowcC84bTB6VEFobVl4?=
 =?utf-8?B?MFJOeGw1TFdhS0JiWFE2VjRGR3FSbnoyWlhRVTdIUUZ5azJ0TEZ6TmI3SmQ0?=
 =?utf-8?B?NXZSOHczYUY5djVCbW9rdzlVZlc1ZmpLTDZUdUdFS3R5TnlYUllUaURSZ1Uw?=
 =?utf-8?B?NVQybTlQcVpUZ2JqQkV0NVVRVUV3VUVYR0hMak1FVjBtUDBvK0RJTkxCUTFT?=
 =?utf-8?B?S1IrM0dpalhMbjUwcUkvU3NQR29HTGRvcTZpNzBqTkphSFJrMzVYL29PLyt3?=
 =?utf-8?Q?x2pSLfWtj8BGmTyrCHF0GAe4W7jtFmqF0DFPF99?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d225e1-73cf-4b69-159d-08d8cbff977a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 07:03:09.0515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wS0Q+SuxumpMnV2hMLkbEzMY8SnZux+7EzKc2D5RqQgD9T4L6o3H2cmgYVkLjmR6lLEdSmcrWO6rd7M53LL0Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151; envelope-from=kevin.tian@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Jean-Philippe Brucker <Jean-Philippe.Brucker@arm.com>,
 Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Auger Eric <eric.auger@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBQZXRlciBYdSA8cGV0ZXJ4QHJlZGhhdC5jb20+DQo+IFNlbnQ6IFN1bmRheSwgRmVi
cnVhcnkgNywgMjAyMSAxMDo0NyBQTQ0KPiANCj4gSGksIEtldmluLA0KPiANCj4gT24gU3VuLCBG
ZWIgMDcsIDIwMjEgYXQgMDk6MDQ6NTVBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4g
PiBGcm9tOiBQZXRlciBYdQ0KPiA+ID4gU2VudDogRnJpZGF5LCBGZWJydWFyeSA1LCAyMDIxIDEx
OjMxIFBNDQo+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPj4gb3IgdmlydGlv
LWlvbW11DQo+ID4gPiA+ID4+IHNpbmNlIGRldi1pb3RsYiAob3IgUENJZSBBVFMpDQo+ID4gPiA+
ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFdlIG1heSBuZWVkIHRvIGFkZCB0aGlzIGluIHRoZSBm
dXR1cmUuDQo+ID4gPiA+IGFkZGVkIEplYW4tUGhpbGlwcGUgaW4gQ0MNCj4gPiA+DQo+ID4gPiBT
byB0aGF0J3MgdGhlIHBhcnQgSSdtIHVuc3VyZSBhYm91dC4uICBTaW5jZSBldmVyeWJvZHkgaXMg
Y2NlZCBzbyBtYXliZQ0KPiBnb29kDQo+ID4gPiB0aW1lIHRvIGFzay4gOikNCj4gPiA+DQo+ID4g
PiBUaGUgdGhpbmcgaXMgSSdtIHN0aWxsIG5vdCBjbGVhciBvbiB3aGV0aGVyIGRldi1pb3RsYiBp
cyB1c2VmdWwgZm9yIGEgZnVsbA0KPiA+ID4gZW11bGF0aW9uIGVudmlyb25tZW50IGFuZCBob3cg
dGhhdCBzaG91bGQgZGlmZmVyIGZyb20gYSBub3JtYWwgaW90bGIsDQo+IHNpbmNlDQo+ID4gPiBh
ZnRlciBhbGwgbm9ybWFsIGlvdGxiIHdpbGwgYmUgYXR0YWNoZWQgd2l0aCBkZXZpY2UgaW5mb3Jt
YXRpb24gdG9vLg0KPiA+DQo+ID4gZGV2LWlvdGxiIGlzIHVzZWZ1bCBpbiB0d28gbWFubmVycy4g
Rmlyc3QsIGl0J3MgYSBmdW5jdGlvbmFsIHByZXJlcXVpc2l0ZSBmb3INCj4gPiBzdXBwb3J0aW5n
IEkvTyBwYWdlIGZhdWx0cy4NCj4gDQo+IElzIHRoaXMgYWxzbyBhIGhhcmQgcmVxdWlyZW1lbnQg
Zm9yIHZpcnRpby1pb21tdSwgd2hpY2ggaXMgbm90IGEgcmVhbCBoYXJkd2FyZQ0KPiBhZnRlciBh
bGw/DQoNCk5vdCBleGFjdGx5IGJ1dCB3aHkgZG8gd2Ugd2FudCB0byB1c2UgYSBub24tc3RhbmRh
cmQgd2F5IGluIHRoZSB2aXJ0dWFsDQpwbGF0Zm9ybSB3aGVuIFBDSSBBVFMgaXMgYWxyZWFkeSBp
biBwbGFjZT8NCg0KPiANCj4gPiBTZWNvbmQsIGl0IGhhcyBwZXJmb3JtYW5jZSBiZW5lZml0IGFz
IHlvdSBkb24ndA0KPiA+IG5lZWQgdG8gY29udGVuZCB0aGUgbG9jayBvZiBnbG9iYWwgaW90bGIu
DQo+IA0KPiBIbW0uLiBhcmUgeW91IHRhbGtpbmcgYWJvdXQgZS5nLiB2dC1kIGRyaXZlciBvciB2
aXJ0aW8taW9tbXU/DQoNCkl0IGlzIGEgZ2VuZXJhbCBpb21tdSBjb25jZXB0Lg0KDQo+IA0KPiBB
c3N1bWluZyBpdCdzIGFib3V0IHZ0LWQsIHFpX2ZsdXNoX2Rldl9pb3RsYigpIHdpbGwgc3RpbGwg
Y2FsbCBxaV9zdWJtaXRfc3luYygpDQo+IGFuZCB0YWtpbmcgdGhlIHNhbWUgZ2xvYmFsIFFJIGxv
Y2ssIGFzIEkgc2VlIGl0LCBvciBJIGNvdWxkIGJlIHdyb25nDQo+IHNvbWV3aGVyZS4NCj4gSSBk
b24ndCBzZWUgd2hlcmUgZGV2LWlvdGxiIGhhcyBhIHN0YW5kYWxvbmUgY2hhbm5lbCBmb3IgZGVs
aXZlcnkuDQoNCldoYXQgSSByZWZlcnJlZCB0byBpcyBhYm91dCBsb29rdXAsIGluc3RlYWQgb2Yg
aW52YWxpZGF0aW9uLiANCg0KPiANCj4gRm9yIHZpcnRpby1pb21tdSwgd2UgaGF2ZW4ndCBkZWZp
bmVkIGRldi1pb3RsYiwgcmlnaHQ/ICBTb3JyeSBJIG1pc3NlZCB0aGluZ3MNCj4gd2hlbiBJIGNv
bXBsZXRlbHkgZGlkbid0IGZvbGxvdyB2aXJ0aW8taW9tbXUgcmVjZW50bHkgLSBsZXQncyBzYXkg
aWYNCj4gdmlydGlvLWlvbW11IGluIHRoZSBmdXR1cmUgY2FuIHN1cHBvcnQgcGVyLWRldiBkZXYt
aW90bGIgcXVldWUgc28gaXQgZG9lc24ndA0KPiBuZWVkIGEgZ2xvYmFsIGxvY2ssIHdoYXQgaWYg
d2UgbWFrZSBpdCBzdGlsbCBwZXItZGV2aWNlIGJ1dCBzdGlsbCBkZWxpdmVyaW5nDQo+IGlvdGxi
IG1lc3NhZ2U/ICBBZ2FpbiwgaXQncyBzdGlsbCBhIGJpdCB1bmNsZWFyIHRvIG1lIHdoeSBhIGZ1
bGwgZW11bGF0aW9uDQo+IGlvbW11IHdvdWxkIG5lZWQgdGhhdCBkZWZpbml0aW9uIG9mICJpb3Rs
YiIgYW5kICJkZXYtaW90bGIiLg0KDQp3ZWxsLCBteSB2aWV3IG9mIGRlZmluaXRpb24gb2YgImlv
dGxiIiB2cy4gImRldi1pb3RsYiIgaXMgZnJvbSBndWVzdCBzb2Z0d2FyZQ0KcC5vLnYuIEZyb20g
dGhpcyBhbmdsZSB0aGV5IGhhdmUgZGlzdGluY3QgbWVhbmluZyBhbmQgc2VtYW50aWNzIHdoaWNo
DQptdXN0IGJlIHByb3Blcmx5IGVtdWxhdGVkIGFjY29yZGluZyB0byB0aGUgc3BlYywgcmVnYXJk
bGVzcyBvZiB3aGV0aGVyIA0KdGhleSBhcmUgbWFpbnRhaW5lZCBpbiBzZXBhcmF0ZSBvciBzYW1l
IGRhdGEgc3RydWN0dXJlIGluIHRoZSB2aXJ0dWFsIHBsYXRmb3JtLg0KDQo+IA0KPiA+DQo+ID4g
Pg0KPiA+ID4gRm9yIHJlYWwgaGFyZHdhcmVzLCB0aGV5IG1ha2Ugc2Vuc2UgYmVjYXVzZSB0aGV5
IGFzayBmb3IgdHdvIHRoaW5nczoNCj4gaW90bGIgaXMNCj4gPiA+IGZvciBJT01NVSwgYnV0IGRl
di1pb3RsYiBpcyBmb3IgdGhlIGRldmljZSBjYWNoZS4gIEZvciBlbXVsYXRpb24NCj4gPiA+IGVu
dmlyb25tZW50DQo+ID4gPiAodmlydGlvLWlvbW11IGlzIHRoZSBjYXNlKSBkbyB3ZSByZWFsbHkg
bmVlZCB0aGF0IGNvbXBsZXhpdHk/DQo+ID4gPg0KPiA+ID4gTm90ZSB0aGF0IGV2ZW4gaWYgdGhl
cmUncmUgYXNzaWduZWQgZGV2aWNlcyB1bmRlciB2aXJ0aW8taW9tbXUgaW4gdGhlDQo+IGZ1dHVy
ZSwNCj4gPiA+IHdlIGNhbiBzdGlsbCBpc29sYXRlIHRoYXQgYW5kIGlpdWMgd2UgY2FuIGVhc2ls
eSBjb252ZXJ0IGFuIGlvdGxiIChmcm9tDQo+ID4gPiB2aXJ0aW8taW9tbXUpIGludG8gYSBoYXJk
d2FyZSBJT01NVSBkZXYtaW90bGIgbm8gbWF0dGVyIHdoYXQgdHlwZSBvZg0KPiA+ID4gSU9NTVUg
aXMNCj4gPiA+IHVuZGVybmVhdGggdGhlIHZJT01NVS4NCj4gPiA+DQo+ID4NCj4gPiBEaWRuJ3Qg
Z2V0IHRoaXMgcG9pbnQuIEhhcmR3YXJlIGRldi1pb3RsYiBpcyB1cGRhdGVkIGJ5IGhhcmR3YXJl
IChiZXR3ZWVuDQo+ID4gdGhlIGRldmljZSBhbmQgdGhlIElPTU1VKS4gSG93IGNvdWxkIHNvZnR3
YXJlIGNvbnZlcnQgYSB2aXJ0dWFsIGlvdGxiDQo+ID4gZW50cnkgaW50byBoYXJkd2FyZSBkZXYt
aW90bGI/DQo+IA0KPiBJIG1lYW4gaWYgdmlydGlvLWlvbW11IG11c3QgYmUgcnVuIGluIGEgZ3Vl
c3QsIHRoZW4gd2UgY2FuIHRyYXAgdGhhdCBtZXNzYWdlDQo+IGZpcnN0LCByaWdodD8gIElmIHRo
ZXJlJ3JlIGFzc2lnbmVkIGRldmljZSBpbiB0aGUgZ3Vlc3QsIHdlIG11c3QgY29udmVydCB0aGF0
DQo+IGludmFsaWRhdGlvbiB0byB3aGF0ZXZlciBtZXNzYWdlIHJlcXVpcmVkIGZvciB0aGUgaG9z
dCwgdGhhdCBzZWVtcyB0byBub3QNCj4gcmVxdWlyZSB0aGUgdmlydGlvLWlvbW11IHRvIGhhdmUg
ZGV2LWlvdGxiIGtub3dsZWRnZSwgc3RpbGw/DQo+IA0KDQpJdCByZWFsbHkgZGVwZW5kcyBvbiB0
aGUgZGVmaW5pdGlvbiBvZiBkZXYtaW90bGIgaW4gdGhpcyBjb250ZXh0LiBUbyBtZSB0aGUNCmZh
Y3QgdGhhdCB2aXJ0aW8taW9tbXUgbmVlZHMgdG8gbm90aWZ5IHRoZSBrZXJuZWwgZm9yIHVwZGF0
aW5nIHNwbGl0IGNhY2hlDQppcyBhbHJlYWR5IHNvcnQgb2YgZGV2LWlvdGxiIHNlbWFudGljcywg
cmVnYXJkbGVzcyBvZiB3aGV0aGVyIGl0J3MgZGVsaXZlcmVkIA0KdGhyb3VnaCBhIGlvdGxiIG1l
c3NhZ2Ugb3IgZGV2LWlvdGxiIG1lc3NhZ2UgaW4gYSBzcGVjaWZpYyBpbXBsZW1lbnRhdGlvbi4g
8J+Yig0KDQpUaGFua3MNCktldmluDQo=

