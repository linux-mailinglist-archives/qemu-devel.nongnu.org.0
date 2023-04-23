Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F856EBC5A
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 03:56:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqOwh-0000Bp-QA; Sat, 22 Apr 2023 21:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1pqOwe-0000BY-7r; Sat, 22 Apr 2023 21:55:17 -0400
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1pqOwP-0003fh-Gi; Sat, 22 Apr 2023 21:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682214901; x=1713750901;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nDCeVLn2L4QjPAhsWaLgU3w4MQigFOhi+6F3IjquChE=;
 b=WmxC7iao2RGy66FOX9GqYx7/zzMeXjKN1Gjkk9/6MNObvJC/123Egerl
 gSqhzUQcC7JpPGa+78ofM5S8pcbcT+eVzXgvgWIND66DCx3c5XPzckWSs
 usozX+XoXVMzrhEa4qcQO/aspnhHitElLuutqq9K0lrEB6+uDF389nZTB
 pDmVjqbHMWUetXl3dDYm/VabD+r33Ou6P6cQjQUK8KqVJd6Di416vMdYX
 gbX4vrHZZtmwE6xtb9hi7jWilPrfXB310qM6/1lGLOLsnkuwvC0laX/jq
 r2GPoYIi63DDYVvLFyFxt0QSDjKzhVQt39F3WtCFXYxdr5cfDMBOSpuWd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="349022555"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; d="scan'208";a="349022555"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 18:54:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="642911511"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; d="scan'208";a="642911511"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 22 Apr 2023 18:54:51 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 22 Apr 2023 18:54:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sat, 22 Apr 2023 18:54:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sat, 22 Apr 2023 18:54:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpB+IkPxaM2leRAFKtfNKUY6sms86vpjafAgzBD3udrNJfJ6EBPPZaFqyCMcBK7wOOMzLOCNFm6ccopLWvV6XmD1yvy1tu/Txa4NbcFtDdFK/KbMBPrWBVE7Rgh1d+Vz6bHpRH0nbxuMG3rHRH4asRulWYLZ5ybAHmwcxBxOZkPiQzu7JbgQ767hLHf1Bjo1x1blDHFHFK9/MfFFLWMidzyt9rks9Vmt70M1vZM2GT6tMpn73bCUgKUL9ezOrMpkHTymkkvkBkuBNQjrq3M8ySpbc003Ff8ySLj61truAzYIM24sahjVQ+MipacyD0yjkthOEKnchiRw8FRB09j7KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDCeVLn2L4QjPAhsWaLgU3w4MQigFOhi+6F3IjquChE=;
 b=WaHMxAjfrvfXbhGa9ooAMiPq/e/LvyaPEaGc5CU/bodL5qIjd5dSWTgesTMKYjtpOASrkyyM4VU0py8lXZRfkCUadPLAtgiG9BJ8CgLXNjDGajSW9nyvRF27Pn48TX4Gfx7H7bXOiFdDF8bbmdcxtoYvZmc6aW/AmAdux+NDpuj4nrgmhMYudOY1mhwrWrUd/X+BzbziBkZL3SR14GOqqobAqjnFFMGIHgzvlrTc1YMBQoTu9WiO9fu/Ls5i1XdCs+mpGcB6bp0AXCygl9EkTNubuJ9Ekaj6ivEIsc07Yv/78qL011dsOu0/p2XT9uJntgWIpKGQ/CQpY+aZi2LHoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MW5PR11MB5811.namprd11.prod.outlook.com (2603:10b6:303:198::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Sun, 23 Apr
 2023 01:54:39 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::a689:d32a:4e3:de7e%4]) with mapi id 15.20.6319.022; Sun, 23 Apr 2023
 01:54:39 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "michael.roth@amd.com"
 <michael.roth@amd.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>, "Zhang,
 Hailiang" <zhanghailiang@xfusion.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "thuth@redhat.com" <thuth@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "dave@treblig.org" <dave@treblig.org>, "hreitz@redhat.com"
 <hreitz@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
Subject: RE: [PATCH v2 3/4] build: move COLO under CONFIG_REPLICATION
Thread-Topic: [PATCH v2 3/4] build: move COLO under CONFIG_REPLICATION
Thread-Index: AQHZcxHC5ikhiRjXHUOjE4y+bokfjK81DdIQgABkj4CAArLDEA==
Date: Sun, 23 Apr 2023 01:54:38 +0000
Message-ID: <MWHPR11MB0031A7CE9FB5A6E93AD601A79B669@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230419225232.508121-4-vsementsov@yandex-team.ru>
 <MWHPR11MB00312BC202A9B93E260F58369B609@MWHPR11MB0031.namprd11.prod.outlook.com>
 <b9badd90-6d1f-5d1d-72a1-9c357a1fb9b2@yandex-team.ru>
In-Reply-To: <b9badd90-6d1f-5d1d-72a1-9c357a1fb9b2@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|MW5PR11MB5811:EE_
x-ms-office365-filtering-correlation-id: 621382b9-e7c8-4e01-aea4-08db439db265
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: McA7TZLN8WmoJPLygbD+ZR1vU4gIPviEnJqtSJZXX+VseYqDBUtJIKcmrOsPLy9fE89eFIss7YLmKzmDEmfh/58aGjMaQc2RUF574eNCHeYNDEL47wCxwq6MrClQM3qDxxtmM8lzBPf7SduvijV8zeRtpBrBhEcfzMC3rxG0pF2rR4OSpHUeNLlFZtkBgHg7l6B74HGDaPo7OPPlvkrxdssCIZ4oI9Yl1D8KYgkZwCEO9eCfCEEcofpG8KNWgFBcXfK+erxVpUdmzaSQ+P7pV3QjxC3uoWM5v7ICTTFz9fcFNaukNAw5Ypf1cq+RfECM2frzCsQ5ChLReZYOJ33Rag0sv8vh2yhpk5DYCP7uY1vtOIqIqagW2o7eVvwS/UNiw5tZRvP2/PMoiJDo/wumE14rjYNqxK+1Yq8Pu11Qrt7s6s6GkAcPTO7Il0GLvlhsryTjuedDEpP7sRJF43J9ql+RpBZp1KttLd1KFuW6JSr95ty8E4i24eezS/4SwZSfIzR4fRvko5W3ItOu4EUVloWyEgblwq9zaey9AMaYhpvDa0OWfCux9kfjuSCAb6sv+qHfrNqtvzGZrGUPyHxcgd4o068B88X8UWPtd+gndDXMISW2h/uB+PHpLkfnGqgs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199021)(110136005)(7696005)(71200400001)(122000001)(54906003)(82960400001)(8936002)(8676002)(38070700005)(5660300002)(7416002)(52536014)(2906002)(33656002)(86362001)(76116006)(55016003)(66556008)(66946007)(66446008)(64756008)(66476007)(4326008)(478600001)(38100700002)(41300700001)(316002)(83380400001)(26005)(9686003)(53546011)(6506007)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXBzeUtsYVROUlFjV3orV3llYjZLTnF4ZG1kclFXNmlKMlRKbmFBVnJKS3VY?=
 =?utf-8?B?K0llMzBoTUF0RDdSS3ZkNUd2RllRMmdoc05CUXNLNENEQXIwc1dDK2dMNzhD?=
 =?utf-8?B?SWhPUjYzVXBtSGpCQUIrcWp3bjdVZWRNU2F3alpaeVJmYityYUJHVmNqQm0y?=
 =?utf-8?B?TFJFaGNMeWtSTDRpWXBNVzd6eHQ1NjNGOEJSQ1pKMDM0OW5yZHp5STZ4M2JK?=
 =?utf-8?B?UkpiUmdkdkM0b001aTA3MnZCUW9tY2pjdm1VNlVZZXcyWTI1S3JZM1AwcmxK?=
 =?utf-8?B?ckRHbkFXcEVBaHNlRXhHWjVUK1J4K1JjcDQ4cmQzNW9ja3JsdExJelo3L3pQ?=
 =?utf-8?B?RG5td2FOL0tSYUJCeDdncGlENDFMdmVIVGorN2pwVWJyVGlwZ0RMQ2NYUmFC?=
 =?utf-8?B?blZ3RzVkZWlsNEpTcjFGLzNuajVsWmFwOGJFQy84SXdTeDlLbGljUTZwVXZr?=
 =?utf-8?B?WkgxY0hXS1NMNC8rTlB1SFM4RHdHVVdiZUdqQWJJbGpSNVc2OW1ucnRsM0F3?=
 =?utf-8?B?WTNJY3N0TkowTEplTVNmbzIvYXlLbVgrSjcwRmtsa2IvOFVPbWdiZ0l1bkI1?=
 =?utf-8?B?QU15Mi81Zy9wYS9ZNU0wb0Fzd0N0UkhuL0lzYit4VEFCU3VnaWw1alMza1Vu?=
 =?utf-8?B?dURFcW4yVXUxSjh0VEtzYnA3THVoQkpXcGdTMDlxS0ZRUzNWNnpoQ1NPMnZP?=
 =?utf-8?B?eXY3cEd4bXk3RnJiWHhtbGFSYzBnYXFpZ2c0N1V3MDQxR0Rwc2VMR01XSEZs?=
 =?utf-8?B?eFBwNlFROVNqN1NodVc3WUVqMHVkWHBITWtVREd3ZW5BdTFhSUJ3T21tOFht?=
 =?utf-8?B?QVdpVmg5YndvcGpWWVNYZmJPNXcvZ2J2a3BHTm1CUE5aSkluTm1oWnZramlO?=
 =?utf-8?B?ZWlLem90YS85TGFVY1p4UzFhQmpXSG96ajBhd2t2TTkzekxMSmZXaVg2VnRP?=
 =?utf-8?B?ZFk5cjBkckZ1dWZGRXhVQVVITGZJTEVRVHBNNk5FWjdlZUUrUzRzV085RXlV?=
 =?utf-8?B?M0RncWMxUXR4a0c2OXJZSjA5bWdKcFdIZVdKYzdRRUpGYXNDVW8wKzZRdnRE?=
 =?utf-8?B?b2tnQ2l3WHlnR2VPK0VZUFFLSWFKSjNYK2ZvNUJSSktVcFZYL1pqYmhGQ2hF?=
 =?utf-8?B?azJmak5hVUgybHJLTjhkT25xN2w4NXJ2c1FPUW5senArZmd5ZW9BWkxTa1Ix?=
 =?utf-8?B?ZmtaRFhyUDRkNG1VNDB5WVNXM3hRVTBVOEpZQWl2bEZhR0tMSVlBOEpzeUxZ?=
 =?utf-8?B?d081SDA3cStWQjNTR08rR25IOFZBdnl3Wld5UVdNelhGblpwTmhOdnJXSkxE?=
 =?utf-8?B?S0dLamlLaHVSVVhuWHhBOTYwdTA2dE5kTE9FYU5hTzIwOW83TVJNM1FqUGdG?=
 =?utf-8?B?VE5tT1l6eUtMK1FZK1Zpd242eGRKMWhrWlRrSHBCb0xUVTdqQmw2cXU2dkl0?=
 =?utf-8?B?MUUwVC9FM254eXBXRGliVlhYWWRIakdRc2ZuRm1ZZWRQMzRDRjNRbHFVdlBJ?=
 =?utf-8?B?b29jdGp6SGpnTUl0aFFWeVRnVDJjN2taSkI2MGoyclFkMmtYcG1XUGRmUkJt?=
 =?utf-8?B?WUJnczJBRzNPakovU0NSVVdlbFpRZ2hHaGJ3d09NeU5KWkhQc1ZycUw2a3gv?=
 =?utf-8?B?OFBXUzREQ085TkxyRVVyZWhQRU5SNGV3SnA5WDBYS24yVUErMitqSDR5TlZT?=
 =?utf-8?B?VStBNzJKaTdaTk9JcEtwSlE5T3M2UVJwb3lQV2JCUThyanRIU1M1ZXpRQUFm?=
 =?utf-8?B?OVorK1YrdG9VcTZXamNLU1QrblNCUUNFSHhYYWlDVHJmbVhEVGpSeEtnekNw?=
 =?utf-8?B?WlkvS1RibEdzMHBpNnI5QXRPRzBkVVpneWIyaHp1cmVnMXRnZmQycCszYXdH?=
 =?utf-8?B?cnFqVzlLUTRnYUZFNWhSS0o1bVArYjh3aFEyVjBvVWtVYXVzYWhoNlloRnQx?=
 =?utf-8?B?MGI5RVVZUUxOQnBRNDNYSjhrTVNjSzRMcnJzYVE4bVJLcHJvaXloWTRUbjhZ?=
 =?utf-8?B?eGFVNEwwZ3pUUGtIeDI1QkV3ck9RamFhbGxDS0gxUTRNaVVLcGhhd1ZyZ05z?=
 =?utf-8?B?TEtwS01HSGJTTnBBT0FsY0xxQ2tRYUVCay9oOW0wU3Z5Y2w3MEVvS0pGTkY3?=
 =?utf-8?Q?w9A0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 621382b9-e7c8-4e01-aea4-08db439db265
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2023 01:54:38.4925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ON60DO3K3wQ1gdYNLbiBJWqW/WH+YhxMUxZqyK3lROJJWiL3yJbYcyBS+YlSdCqvEEoFeMDpv26AEjInKKRUvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5811
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVmxhZGltaXIgU2VtZW50
c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB5YW5kZXgtdGVhbS5ydT4NCj4gU2VudDogRnJpZGF5
LCBBcHJpbCAyMSwgMjAyMyA0OjM2IFBNDQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0Bp
bnRlbC5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IHFlbXUtYmxvY2tAbm9uZ251
Lm9yZzsgbWljaGFlbC5yb3RoQGFtZC5jb207IGFybWJydUByZWRoYXQuY29tOw0KPiBlYmxha2VA
cmVkaGF0LmNvbTsgamFzb3dhbmdAcmVkaGF0LmNvbTsgcXVpbnRlbGFAcmVkaGF0LmNvbTsgWmhh
bmcsDQo+IEhhaWxpYW5nIDx6aGFuZ2hhaWxpYW5nQHhmdXNpb24uY29tPjsgcGhpbG1kQGxpbmFy
by5vcmc7DQo+IHRodXRoQHJlZGhhdC5jb207IGJlcnJhbmdlQHJlZGhhdC5jb207IG1hcmNhbmRy
ZS5sdXJlYXVAcmVkaGF0LmNvbTsNCj4gcGJvbnppbmlAcmVkaGF0LmNvbTsgZGF2ZUB0cmVibGln
Lm9yZzsgaHJlaXR6QHJlZGhhdC5jb207DQo+IGt3b2xmQHJlZGhhdC5jb207IGxpemhpamlhbkBm
dWppdHN1LmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDMvNF0gYnVpbGQ6IG1vdmUgQ09M
TyB1bmRlciBDT05GSUdfUkVQTElDQVRJT04NCj4gDQo+IE9uIDIxLjA0LjIzIDA2OjAyLCBaaGFu
ZywgQ2hlbiB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4+IEZyb206IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAeWFu
ZGV4LXRlYW0ucnU+DQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAyMCwgMjAyMyA2OjUzIEFN
DQo+ID4+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gPj4gQ2M6IHFlbXUtYmxvY2tAbm9u
Z251Lm9yZzsgbWljaGFlbC5yb3RoQGFtZC5jb207DQo+IGFybWJydUByZWRoYXQuY29tOw0KPiA+
PiBlYmxha2VAcmVkaGF0LmNvbTsgamFzb3dhbmdAcmVkaGF0LmNvbTsgcXVpbnRlbGFAcmVkaGF0
LmNvbTsNCj4gWmhhbmcsDQo+ID4+IEhhaWxpYW5nIDx6aGFuZ2hhaWxpYW5nQHhmdXNpb24uY29t
PjsgcGhpbG1kQGxpbmFyby5vcmc7DQo+ID4+IHRodXRoQHJlZGhhdC5jb207IGJlcnJhbmdlQHJl
ZGhhdC5jb207DQo+IG1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbTsNCj4gPj4gcGJvbnppbmlA
cmVkaGF0LmNvbTsgZGF2ZUB0cmVibGlnLm9yZzsgaHJlaXR6QHJlZGhhdC5jb207DQo+ID4+IGt3
b2xmQHJlZGhhdC5jb207IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT47DQo+ID4+
IGxpemhpamlhbkBmdWppdHN1LmNvbTsgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeQ0KPiA+
PiA8dnNlbWVudHNvdkB5YW5kZXgtIHRlYW0ucnU+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCB2MiAz
LzRdIGJ1aWxkOiBtb3ZlIENPTE8gdW5kZXIgQ09ORklHX1JFUExJQ0FUSU9ODQo+ID4+DQo+ID4+
IFdlIGRvbid0IGFsbG93IHRvIHVzZSB4LWNvbG8gY2FwYWJpbGl0eSB3aGVuIHJlcGxpY2F0aW9u
IGlzIG5vdA0KPiA+PiBjb25maWd1cmVkLiBTbywgbm8gcmVhc29uIHRvIGJ1aWxkIENPTE8gd2hl
biByZXBsaWNhdGlvbiBpcyBkaXNhYmxlZCwNCj4gPj4gaXQncyB1bnVzYWJsZSBpbiB0aGlzIGNh
c2UuDQo+ID4NCj4gPiBZZXMsIHlvdSBhcmUgcmlnaHQgZm9yIGN1cnJlbnQgc3RhdHVzLiBCZWNh
dXNlIENPTE8gYmVzdCBwcmFjdGljZXMgaXMNCj4gcmVwbGljYXRpb24gKyBjb2xvIGxpdmUgbWln
cmF0aW9uICsgY29sbyBwcm94eS4NCj4gPiBCdXQgZG9lc24ndCBtZWFuIGl0IGhhcyB0byBiZSBk
b25lIGluIGFsbCBzY2VuYXJpb3MgYXMgSSBleHBsYW5hdGlvbiBpbiBWMS4NCj4gPiBUaGUgYmV0
dGVyIHdheSBpcyBhbGxvdyB0byB1c2UgeC1jb2xvIGNhcGFiaWxpdHkgZmlyc3RseSwgYW5kIHNl
cGFyYXRlDQo+ID4gdGhpcyBwYXRjaCB3aXRoIHR3byBjb25maWcgb3B0aW9uczogLS1kaXNhYmxl
LXJlcGxpY2F0aW9uICBhbmQgLS1kaXNhYmxlLXgtDQo+IGNvbG8uDQo+ID4NCj4gDQo+IEJ1dCB3
aGF0IGZvcj8gV2UgZm9yIHN1cmUgZG9uJ3QgaGF2ZSBzdWNoIHNjZW5hcmlvcyBub3cgKENPTE8g
d2l0aG91dA0KPiByZXBsaWNhdGlvbiksIGFzIGl0J3Mgbm90IGFsbG93ZWQgYnkgZmFyIDdlOTM0
ZjViMjdlZWUxYjBkNyAoYnkgeW91IGFuZA0KPiBEYXZpZCkuDQo+IA0KPiBJZiB5b3UgdGhpbmsg
d2UgbmVlZCBzdWNoIHNjZW5hcmlvLCBJIHRoaW5rIGl0IHNob3VsZCBiZSBhIHNlcGFyYXRlIHNl
cmllcw0KPiB3aGljaCByZXZlcnRzIDdlOTM0ZjViMjdlZWUxYjBkNyBhbmQgYWRkcyBjb3JyZXNw
b25kaW5nIHRlc3QgYW5kDQo+IHByb2JhYmx5IGRvY3VtZW50YXRpb24uDQoNCkluIHRoZSBwYXRj
aCA3ZTkzNGY1YjI3ZWVlMWIwZDcgc2FpZCBpdCdzIGZvciBjdXJyZW50IGluZGVwZW5kZW50IGRp
c2sgbW9kZSwNCkFuZCB3aGF0IHdlIHRhbGtlZCBhYm91dCBiZWZvcmUgaXMgdGhlIHNoYXJlZCBk
aXNrIG1vZGUuDQpSZXRoaW5rIGFib3V0IHRoZSBDT0xPIHNoYXJlZCBkaXNrIG1vZGUsIHRoaXMg
ZmVhdHVyZSBzdGlsbCBuZWVkcyBzb21lIGVuYWJsaW5nIHdvcmtzLg0KSXQgbG9va3MgT0sgZm9y
IG5vdyBhbmQgc2VwYXJhdGUgdGhlIGJ1aWxkIG9wdGlvbnMgd2hlbiBlbmFibGluZyBDT0xPIHNo
YXJlZCBkaXNrIG1vZGUuDQoNClRoYW5rcw0KQ2hlbg0KDQo+IA0KPiANCj4gLS0NCj4gQmVzdCBy
ZWdhcmRzLA0KPiBWbGFkaW1pcg0KDQo=

