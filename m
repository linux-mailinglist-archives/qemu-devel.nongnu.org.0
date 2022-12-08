Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0BF646A65
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 09:24:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3CAy-0002nN-2y; Thu, 08 Dec 2022 03:22:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1p3CAt-0002lg-Vr
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 03:22:36 -0500
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1p3CAq-0001Z0-Rl
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 03:22:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670487752; x=1702023752;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=4y89vHnK25LtT99h5OZ5HdwOFUkGbvlifyUQ0yZQQOs=;
 b=TkUZQIHXM/S1zXUTfFoMXJtxBKlm5/liNISCj44Hut6d8UpZyS0KRF93
 THYkHBWyf3lKsK1SR6mt+cleiwpZbUKu5h7GJb6XfiI2xnoq+Lu59LOEQ
 LYJrs5P2cv28/OCSUGLD53FwDZzmDEtPpCy9uDCDwLIyob6WAXZ/EqinG
 MDkNGvSspcK6Fo5aR2IghasGPS/LcxEXfX/IZKuJx1llQsOYjkwq8Qp2Z
 JALT8f8FBiL6dx111J5CZIbTMQTJcob9NUoVPHNzMbc67buVcuO04lHtN
 ihoQGbk8iSCPnlwyYPhtFleeyLAYOq7WUgIQ0OpmRfAqN/pSLg70GDxWy Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="318250771"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="318250771"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 00:22:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="789212948"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="789212948"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 08 Dec 2022 00:22:20 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 8 Dec 2022 00:22:20 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 8 Dec 2022 00:22:20 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 8 Dec 2022 00:22:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSAXkVGwzBP/vX4U1Ds0GF7or6OXGS+Od2O54Xq5vbtWUk3QpqThAZfZntPMU4icFbuem8pUv69u21Nu9MIc1uL47diRdbPDuCLmHK4Ngwo0iDll9tCf5j6vRJkgOpCoJ9suSsAfL4jsLHov7O7bMfAK7YFkTEalc3qWwHTRntI2XG5QT7NemiL83fs3r1D3ncFpNyK471/YHsmPn3DnWBqtKZU7zyGBx2jT+bB81jP9n8BJGQGiYTkiF5W/TxWsqi+7+AFBpe0t4pYMgv5FB+FeazKktAK65XFS6Rzick8+yIRvm1s36EqtRdwhmQHqfQ7QNiQciGGWVLkjXbGbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4y89vHnK25LtT99h5OZ5HdwOFUkGbvlifyUQ0yZQQOs=;
 b=F0IJkWKwMT4V3U/cHGHoMlbyhwhlApSXYKhul8YbnWLpXWRP+9Lq2erf7LoUEMlDaSgqIajh4RNclaC9ESaSiU+/v6SDopJWp4/OT48LgvtPfoEBJwpwatFkgwoxptrJfZsj2oCdILob8ixjDMjeDZ9JNvqCx3YU7AdgmhG29nduo3zZTAgw7cUQxEWo8Mb3zT5EFA/Qs/saVxc4/dhelnj5qXar90Y6KKjPHkqofBHAHrXsdu61MqDHYVfzq94VgDeC5YWmyGkBaND6WwgbQPaxe153t+vFmsVWtfynVaF9G6E6KK6KXDXcQ+OiwlkwWwGlBpBwB9+LUNI0D6kXWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4090.namprd11.prod.outlook.com (2603:10b6:5:195::10)
 by DS7PR11MB5989.namprd11.prod.outlook.com (2603:10b6:8:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 08:22:18 +0000
Received: from DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::caa8:f626:10c8:9ae2]) by DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::caa8:f626:10c8:9ae2%2]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 08:22:18 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: haxm-team <haxm-team@intel.com>
Subject: RE: [PATCH] target/i386/hax: Add XCR0 support
Thread-Topic: [PATCH] target/i386/hax: Add XCR0 support
Thread-Index: AdkAvHco0a5CAnUYQy+c+kGSr8NH7wAFo4SAABncpzAB0e1YoAABn9+AAAAL14AAlBNfAA==
Date: Thu, 8 Dec 2022 08:22:18 +0000
Message-ID: <DM6PR11MB40903C099617BF5F1151AA85871D9@DM6PR11MB4090.namprd11.prod.outlook.com>
References: <DM6PR11MB40909B4A33D66A3100F6D219870E9@DM6PR11MB4090.namprd11.prod.outlook.com>
 <4e35a2b6-12ca-e43c-6ee7-7090280c9341@linaro.org>
 <DM6PR11MB40906BFDB7E263064C1BBC4587189@DM6PR11MB4090.namprd11.prod.outlook.com>
 <04484bf1-c6fc-d430-9939-474c0dab158f@linaro.org> 
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4090:EE_|DS7PR11MB5989:EE_
x-ms-office365-filtering-correlation-id: 652cb95b-6adf-41cd-f53b-08dad8f5523d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y+UwbgaTwiG14Xdbj7RPKf0uBf4EHADtTjiLWDhxx/+zfqy3toUYMppLJ6iXsF3SkODGf9HWTR8RoGAmGe+tfOS5ZmLmXLQLqHVjWMFXM1Dn+42vpP+I08W4ohQDMlgFISPNzbgpu2t40vkZKzDSi4EE5odsvMzYtNSKQYMsMuRgztH2cG7Z308ZloQLEksexXZaKAUS8MxHo7QFkoqEJovRttuQy30gpSq5Cj3agRBAuOECVAnfTT/nTmasgFfIbGJ9aGTKcKAbvliyv88TU7JWw8l3VzuymCfcfEr7v+ViHYPFiqMCS8qPNXhtUxigiaZ20RUl96nsPf0eFXvNTzkyhLcKTDswq6Kk8fxx22Jkg9tOkq5pYSeAhL5mH5iwnbZZXjzHhvuxhXkHec6MqlTDx6sGTOKv9iFIvFT0FeeXAkajpz8avC0t5MhFjH4h/eXAm90H1ccLZq/AppR6PXrA041A/3HZmo4on/vbug9P75KcMUKCNFZu6IYNAldYQelOQ473NtF6ScN5OaS6pmbAMxQaHjNOwJB2AoRuMQXcQwX8bbrCFoBofasJUM7EOG7/iELYaomkznf4ZRJ0Y1RLhK2szx0ACVSCUQgrrBhxrKoTGR/9n+w251V1s0qQzCWEjVJeJoVsLsPkpcbGmpiKS4WNpXgEksJnFhTctGbPMqcnFngQbV+Ji2DErankMr58Dufhuhh7Z9BqGegQxXazxxu7SxO4G48jvxc3Shs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4090.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199015)(38100700002)(122000001)(82960400001)(41300700001)(8936002)(38070700005)(4326008)(2906002)(5660300002)(83380400001)(66946007)(86362001)(33656002)(71200400001)(52536014)(66446008)(316002)(110136005)(966005)(478600001)(66476007)(66556008)(55016003)(9686003)(7696005)(76116006)(8676002)(6506007)(53546011)(64756008)(107886003)(26005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TStkcGdMdE5wVm1JSHdJVnVML01kOEduMkdrRnlwWHFhS2hqNjArZWYwSXdQ?=
 =?utf-8?B?WXZMOFlQVDY0Z0MyL0dpRElaZDBlNmNEdmdlMTg3VUJJVEVKVmJId0I3NHNi?=
 =?utf-8?B?Vk8vekdjaU9zUnk3QjZ5TnAvUkZpdzZpWjZ2RlFsbFBtUExSVSt4eTIzUjUr?=
 =?utf-8?B?dHNlNnk2UVpPcGVxK3JmTXBMNFJsMUVqRHp5THdHNnpDTXZxVVhZUFJwQ29s?=
 =?utf-8?B?eURMMmhmM1c5eGMzYys4bWtwRUNOOUlRY3dZZ09Jd29NaEVTeXlwTUh5S2Jr?=
 =?utf-8?B?WGtZdmZMWWJsaXR1UFpkU3orNDQ5UWZCSE5UN1UrWFFMMnNjdnphbnczaFkr?=
 =?utf-8?B?VEMyOUZOcXNoVVU3ZmlnN1NJMlVtc2E0ZjZHSzVEQUp0TWQrWitSUFFTQWFq?=
 =?utf-8?B?WmNBTFpINU4zcDBUa21SZWo1RWtId1lPZjJjVDVkWlF5NWorTUVYb1dRM3l2?=
 =?utf-8?B?SHlWN2t6Vi83RU1oT0RPcHpxdytPVFZrajJEbkZxZDRsZDBHRTFjbndvUHYr?=
 =?utf-8?B?WTVlcWVyVVZxbGt3YklMeE5aUFZobU8wVC9mUmIxMnhydEZKMEUvNXAxbXRw?=
 =?utf-8?B?NTA3RlRwYU1sYlBDRHh2ZHdpRHAyeWxJbW5sS2pOdEhodThyQVZNcU1WTUl2?=
 =?utf-8?B?N04rVGZhNmZDNitWU2tYYVFMcjh0RE1vSjBCeGxQbmpaSkVQUVNORStzYU5L?=
 =?utf-8?B?QmxEbFI1SGRJMVJTbUVEajhLcTh5SDhaQ2R0N3dBUmZPenhucXFBa2x5OFNr?=
 =?utf-8?B?TldmUTY2cG1LYTh1dkhrYUhuYXNOQkJWS3FPZjMwb1BDditObDZOWkZ5T3p4?=
 =?utf-8?B?K1JaelZUSmtPNXZHczhiR0FtK1dGaWswcFBid05OVEdpNXZrYTZjZVJpU0NM?=
 =?utf-8?B?L0JJY2xBOUtzczZLb3orRmVRU2hHQlFOWXExQkVvZ1hKblc3aTIvdnBZNHNs?=
 =?utf-8?B?VHBQbDQ2S2RFSk9VZjMxWHVUSjQxRkNLa1JvcklablhaU05tV2xnT0h6REli?=
 =?utf-8?B?R21xbC9wVlJIRFJ0R05va2htQ2pZNXFjS1JjeGpuUGFueWtaRERSZVA0cGV6?=
 =?utf-8?B?am1tOTJ2RWhFMXJTbDZVQUNKL24reUt2dTUzY1hYZzE5V1ZjKy9CRGQrRlJq?=
 =?utf-8?B?M3J3eDNQNk02bmUrbHh0UzhQcGdYMDlSZmpPYitOYUJabFdDTG1aYjR0M3Fi?=
 =?utf-8?B?MFJXYmFMVGVyM1BMb0RaUGczMGhnYXhJakVjeDZMSGRlbEt5bzlaNWtqc0lj?=
 =?utf-8?B?akpiSytsNlFESTd0RDFKOHBhSldibjlRYVljZ1p2aGNJUHZYc05hS1BzdS9Y?=
 =?utf-8?B?YWNxOFZ6aEJ5ek04Um84d1p4Y2NOd1lIMURZV2YxYW5DVjJ6c3RUQkpWdnhw?=
 =?utf-8?B?RzNtUlQ1SmlQb0RjRit5QmVTR0FCUmYxZytxV200N01BZTRraTFVcFI1bFF1?=
 =?utf-8?B?Si91aE9veloycDhpNExGOUErK1FUWS9XV3pOR2pNb25DYzdNUTZYelJGKytv?=
 =?utf-8?B?Q0RObVByUTM0NG5wOEpMb2FVUWdxbk5KK29welNYS3FmeHBaNC9xb2oveFp6?=
 =?utf-8?B?N3QzSW9mdy9SNEVYdnZXSFF2aUExV2RXYXJxZGFUU00xT3F6WGVRdlN1VlFZ?=
 =?utf-8?B?bmgvWlkwc2hVZi9RSTZEa2JjMGtMTjF5ay82WU9PaWRSSzVKSjF4YW80S094?=
 =?utf-8?B?K0c1cDlCYlZJNWJ2YWcvYVJlMXA4ZmxYTVdDTGVFWmduczVGOGFEM3d3Vmpy?=
 =?utf-8?B?NG0zWXcybVZ3Nm0wZUJqTjB0emxoejJkcVRwSzJUQWNaQU9lMW1HLzlXaG9V?=
 =?utf-8?B?R0hKdWtBdkliMkxaRWhzVjJUWEJwY1BWa0UzZ1NPNGJEZHZGVDJHZkNVdkFS?=
 =?utf-8?B?b0FXbFVRQmdYRm5FcklLSzBEZ0lnS2R3Ti8wWjJqVWYyUm8vaVhkak00ODVk?=
 =?utf-8?B?WmdQWnplT3kxL2o0eUphbDMrMjVraGh5c0xrRmQwVHRETzFoSjVoMFZHMDhX?=
 =?utf-8?B?MGtKRTRjQ1FZZXMrZFV2aWUxKzdHdVVmTUhpS0QzbS9ONVR4WVljQ0c3Q0Z5?=
 =?utf-8?B?NGxoRkhGbUlTeWk5c21XVU1CMGNiUkk3RXVvQWtvY09JODZMMGxBT0xjTys2?=
 =?utf-8?Q?E0xOtQ7pFGgjWzbv/fg+iBRBO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4090.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652cb95b-6adf-41cd-f53b-08dad8f5523d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2022 08:22:18.4413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HJf6+TcTKVufW/WlcjLoDY/gFLTu4i7D6zYNW/7tRfxoo9f+8dOkuAg5IB6CrGV0FSpXhSwWn79LjYJSg5JTNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5989
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=wenchao.wang@intel.com; helo=mga09.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

SGksIFBhb2xvLA0KDQpBcyBIQVhNIHY3LjguMCBpcyByZWxlYXNlZCBhbmQgaXQgYWRkZWQgWENS
MCBzdXBwb3J0LCBjb3VsZCB5b3UgaGVscCB0byBtZXJnZSB0aGlzIHBhdGNoIHRvIGFkZCBjb3Jy
ZXNwb25kaW5nIHN1cHBvcnQgaW50byBIQVggdXNlciBzcGFjZSBvZiBRRU1VPyBUaGUgcGF0Y2gg
aGFzIGJlZW4gYXR0YWNoZWQgYmVsb3cuIFRoYW5rcy4NCg0KDQpCZXN0IFJlZ2FyZHMsDQpXZW5j
aGFvDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpGcm9tIGIxNzg5ZjI1
MjNkMDY3OThiODg4MzY2NGJmYTlhOWRmNzk3YmZjY2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
DQpGcm9tOiBXZW5jaGFvIFdhbmcgPHdlbmNoYW8ud2FuZ0BpbnRlbC5jb20+DQpEYXRlOiBGcmks
IDI1IE5vdiAyMDIyIDE4OjM3OjM0ICswODAwDQpTdWJqZWN0OiBbUEFUQ0hdIHRhcmdldC9pMzg2
L2hheDogQWRkIFhDUjAgc3VwcG9ydA0KDQpJbnRyb2R1Y2UgZXh0ZW5kZWQgY29udHJvbCByZWdp
c3RlciBYQ1IwIHRvIHN1cHBvcnQgWFNBVkUgZmVhdHVyZSBzZXQuDQoNCk5vdGU6IFRoaXMgY2hh
bmdlIHJlcXVpcmVzIGF0IGxlYXN0IEhBWE0gdjcuOC4wIHRvIHN1cHBvcnQuDQoNClJldmlld2Vk
LWJ5OiBIYW5nIFl1YW4gPGhhbmcueXVhbkBpbnRlbC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBXZW5j
aGFvIFdhbmcgPHdlbmNoYW8ud2FuZ0BpbnRlbC5jb20+DQotLS0NCiB0YXJnZXQvaTM4Ni9oYXgv
aGF4LWludGVyZmFjZS5oIHwgMiArKw0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykN
Cg0KZGlmZiAtLWdpdCBhL3RhcmdldC9pMzg2L2hheC9oYXgtaW50ZXJmYWNlLmggYi90YXJnZXQv
aTM4Ni9oYXgvaGF4LWludGVyZmFjZS5oDQppbmRleCA1MzdhZTA4NGU5Li4xZDEzYmIyMzgwIDEw
MDY0NA0KLS0tIGEvdGFyZ2V0L2kzODYvaGF4L2hheC1pbnRlcmZhY2UuaA0KKysrIGIvdGFyZ2V0
L2kzODYvaGF4L2hheC1pbnRlcmZhY2UuaA0KQEAgLTIwMSw2ICsyMDEsOCBAQCBzdHJ1Y3QgdmNw
dV9zdGF0ZV90IHsNCiAgICAgdWludDY0X3QgX2NyMzsNCiAgICAgdWludDY0X3QgX2NyNDsNCiAN
CisgICAgdWludDY0X3QgX3hjcjA7DQorDQogICAgIHVpbnQ2NF90IF9kcjA7DQogICAgIHVpbnQ2
NF90IF9kcjE7DQogICAgIHVpbnQ2NF90IF9kcjI7DQotLSANCjIuMTcuMQ0KDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBXYW5nLCBXZW5jaGFvIA0KU2VudDogTW9uZGF5LCBE
ZWNlbWJlciA1LCAyMDIyIDE3OjEwDQpUbzogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxt
ZEBsaW5hcm8ub3JnPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQpDYzogaGF4bS10ZWFtIDxoYXht
LXRlYW1AaW50ZWwuY29tPjsgUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4NClN1
YmplY3Q6IFJFOiBbUEFUQ0hdIHRhcmdldC9pMzg2L2hheDogQWRkIFhDUjAgc3VwcG9ydA0KDQpU
aGFua3MgZm9yIFBoaWxsaXBwZSdzIHJlcGx5Lg0KDQpIaSwgUGFvbG8sDQoNCkNvdWxkIHlvdSBo
ZWxwIHRvIHJldmlldyB0aGUgcGF0Y2ggb2YgSEFYPyBJZiB0aGVyZSBpcyBhbnkgY29uY2VybiBh
Ym91dCBpdCwgZmVlbCBmcmVlIHRvIGRpc2N1c3Mgd2l0aCBtZS4gVGhhbmtzIGEgbG90Lg0KDQoN
CkJlc3QgUmVnYXJkcywNCldlbmNoYW8NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NClNlbnQ6IE1v
bmRheSwgRGVjZW1iZXIgNSwgMjAyMiAxNzowNQ0KVG86IFdhbmcsIFdlbmNoYW8gPHdlbmNoYW8u
d2FuZ0BpbnRlbC5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCkNjOiBoYXhtLXRlYW0gPGhh
eG0tdGVhbUBpbnRlbC5jb20+OyBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPg0K
U3ViamVjdDogUmU6IFtQQVRDSF0gdGFyZ2V0L2kzODYvaGF4OiBBZGQgWENSMCBzdXBwb3J0DQoN
CkhpIFdlbmNoYW8sDQoNCk9uIDUvMTIvMjIgMDk6MzUsIFdhbmcsIFdlbmNoYW8gd3JvdGU6DQo+
IEhpLCBQaGlsaXBwZSwNCj4gDQo+IERvIHlvdSBhZ3JlZSB3aXRoIG15IG9waW5pb24gYW5kIGlz
IHRoZXJlIGFueSBmdXJ0aGVyIHByb2Nlc3MgdGhhdCBJIG5lZWQgdG8gZm9sbG93IHRvIGdldCB0
aGlzIHBhdGNoIG1lcmdlZD8gVGhhbmtzIGEgbG90Lg0KDQpJIGRvbid0IHVuZGVyc3RhbmQgdGhp
cyBwYXJ0IG9mIEhBWE0gZW5vdWdoLCBidXQgcGVyIHlvdXIgZXhwbGFuYXRpb24sIHlvdXIgY2hh
bmdlIGxvb2tzIGNvcnJlY3QuIEknbGwgbGV0IFBhb2xvIGRlY2lkZSA6KQ0KDQpSZWdhcmRzLA0K
DQpQaGlsLg0KDQo+IEJlc3QgUmVnYXJkcywNCj4gV2VuY2hhbw0KPiANCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2FuZywgV2VuY2hhbw0KPiBTZW50OiBNb25kYXksIE5v
dmVtYmVyIDI4LCAyMDIyIDE2OjExDQo+IFRvOiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhp
bG1kQGxpbmFyby5vcmc+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IGhheG0tdGVhbSA8
aGF4bS10ZWFtQGludGVsLmNvbT47IFBhb2xvIEJvbnppbmkgDQo+IDxwYm9uemluaUByZWRoYXQu
Y29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIXSB0YXJnZXQvaTM4Ni9oYXg6IEFkZCBYQ1IwIHN1
cHBvcnQNCj4gDQo+IEhpLCBQaGlsaXBwZSwNCj4gDQo+IEl0IGlzIGp1c3QgdGhlIGZ1bGwgcGF0
Y2guIEN1cnJlbnRseSwgdGhlIGltcGxlbWVudGF0aW9uIG9mIEhBWE0gaXMgc2ltcGxlLCB3ZSBk
aWQgbm90IHN5bmNocm9uaXplIHRoZSB2Q1BVIHJlZ2lzdGVyIGZvciB4Y3IwIGZyb20gUUVNVS4g
SEFYTSB3aWxsIGhhbmRsZSB0aGUgeGNyMCBzdGF0ZSB3aXRoaW4gdGhlIGtlcm5lbCBzcGFjZSwg
aW5jbHVkaW5nIGluaXRpYWxpemF0aW9uLCB1cGRhdGUsIGV0Yy4gVGhpcyBwYXRjaCBhZGRzIHRo
ZSB4Y3IwIHZhcmlhYmxlIGZvciBhbGxvY2F0aW5nIGV4dHJhIDgtYnl0ZSBidWZmZXIgb2NjdXBh
dGlvbiwgd2hpY2ggd2lsbCBiZSBwYXNzZWQgYmV0d2VlbiBRRU1VIGFuZCBIQVhNIHdoZW4gaGF4
X3N5bmNfdmNwdV9zdGF0ZSgpIGlzIGludm9rZWQuIFdlIGhhdmUgdmVyaWZpZWQgdGhlIHBhdGNo
ZWQgUUVNVSBhbmQgaXQgY2FuIGxhdW5jaCBhbGwgZ3Vlc3QgT1Nlcy4gVGhhbmtzIGZvciB5b3Vy
IGNvbW1lbnRzLg0KPiANCj4gDQo+IEJlc3QgUmVnYXJkcywNCj4gV2VuY2hhbw0KPiANCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
PHBoaWxtZEBsaW5hcm8ub3JnPg0KPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDI1LCAyMDIyIDIx
OjM3DQo+IFRvOiBXYW5nLCBXZW5jaGFvIDx3ZW5jaGFvLndhbmdAaW50ZWwuY29tPjsgcWVtdS1k
ZXZlbEBub25nbnUub3JnDQo+IENjOiBoYXhtLXRlYW0gPGhheG0tdGVhbUBpbnRlbC5jb20+OyBQ
YW9sbyBCb256aW5pIA0KPiA8cGJvbnppbmlAcmVkaGF0LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSF0gdGFyZ2V0L2kzODYvaGF4OiBBZGQgWENSMCBzdXBwb3J0DQo+IA0KPiBIaSwNCj4gDQo+
IE9uIDI1LzExLzIyIDEzOjE4LCBXYW5nLCBXZW5jaGFvIHdyb3RlOg0KPj4gSGksIG1haW50YWlu
ZXJzLA0KPj4NCj4+IEFzIEhBWE0gdjcuOC4wIGlzIHJlbGVhc2VkIGFuZCBpdCBhZGRlZCBYQ1Iw
IHN1cHBvcnQsIGNvdWxkIHlvdSBoZWxwIA0KPj4gdG8gbWVyZ2UgdGhpcyBwYXRjaCB0byBhZGQg
Y29ycmVzcG9uZGluZyBzdXBwb3J0IGludG8gSEFYIHVzZXIgc3BhY2UgDQo+PiBvZiBRRU1VPyBU
aGUgcGF0Y2ggaGFzIGJlZW4gaW5jbHVkZWQgaW4gdGhlIGF0dGFjaG1lbnQuIFRoYW5rcy4NCj4g
DQo+IFNlZQ0KPiBodHRwczovL3d3dy5xZW11Lm9yZy9kb2NzL21hc3Rlci9kZXZlbC9zdWJtaXR0
aW5nLWEtcGF0Y2guaHRtbCNzdWJtaXR0DQo+IGluZy15b3VyLXBhdGNoZXMgb24gaG93IHRvIHNl
bmQgcGF0Y2hlcyB0byBhIG1haWxpbmcgbGlzdC4NCj4gDQo+Pg0KPj4gQmVzdCBSZWdhcmRzLA0K
Pj4NCj4+IFdlbmNoYW8NCj4+DQo+PiAgIEZyb20gYjE3ODlmMjUyM2QwNjc5OGI4ODgzNjY0YmZh
OWE5ZGY3OTdiZmNjZiBNb24gU2VwIDE3IDAwOjAwOjAwDQo+PiAyMDAxDQo+Pg0KPj4gRnJvbTog
V2VuY2hhbyBXYW5nIDx3ZW5jaGFvLndhbmdAaW50ZWwuY29tPg0KPj4NCj4+IERhdGU6IEZyaSwg
MjUgTm92IDIwMjIgMTg6Mzc6MzQgKzA4MDANCj4+DQo+PiBTdWJqZWN0OiBbUEFUQ0hdIHRhcmdl
dC9pMzg2L2hheDogQWRkIFhDUjAgc3VwcG9ydA0KPj4NCj4+IEludHJvZHVjZSBleHRlbmRlZCBj
b250cm9sIHJlZ2lzdGVyIFhDUjAgdG8gc3VwcG9ydCBYU0FWRSBmZWF0dXJlIHNldC4NCj4+DQo+
PiBOb3RlOiBUaGlzIGNoYW5nZSByZXF1aXJlcyBhdCBsZWFzdCBIQVhNIHY3LjguMCB0byBzdXBw
b3J0Lg0KPj4NCj4+IFJldmlld2VkLWJ5OiBIYW5nIFl1YW4gPGhhbmcueXVhbkBpbnRlbC5jb20+
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogV2VuY2hhbyBXYW5nIDx3ZW5jaGFvLndhbmdAaW50ZWwu
Y29tPg0KPj4NCj4+IC0tLQ0KPj4NCj4+IHRhcmdldC9pMzg2L2hheC9oYXgtaW50ZXJmYWNlLmgg
fCAyICsrDQo+Pg0KPj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS90YXJnZXQvaTM4Ni9oYXgvaGF4LWludGVyZmFjZS5oIA0KPj4gYi90YXJnZXQv
aTM4Ni9oYXgvaGF4LWludGVyZmFjZS5oDQo+Pg0KPj4gaW5kZXggNTM3YWUwODRlOS4uMWQxM2Ji
MjM4MCAxMDA2NDQNCj4+DQo+PiAtLS0gYS90YXJnZXQvaTM4Ni9oYXgvaGF4LWludGVyZmFjZS5o
DQo+Pg0KPj4gKysrIGIvdGFyZ2V0L2kzODYvaGF4L2hheC1pbnRlcmZhY2UuaA0KPj4NCj4+IEBA
IC0yMDEsNiArMjAxLDggQEAgc3RydWN0IHZjcHVfc3RhdGVfdCB7DQo+Pg0KPj4gICDCoMKgwqDC
oCB1aW50NjRfdCBfY3IzOw0KPj4NCj4+ICAgwqDCoMKgwqAgdWludDY0X3QgX2NyNDsNCj4+DQo+
PiArwqDCoMKgIHVpbnQ2NF90IF94Y3IwOw0KPj4NCj4+ICsNCj4+DQo+PiAgIMKgwqDCoMKgIHVp
bnQ2NF90IF9kcjA7DQo+Pg0KPj4gICDCoMKgwqDCoCB1aW50NjRfdCBfZHIxOw0KPj4NCj4+ICAg
wqDCoMKgwqAgdWludDY0X3QgX2RyMjsNCj4+DQo+PiAtLQ0KPj4NCj4+IDIuMTcuMQ0KPj4NCj4g
DQo+IElzIHRoYXQgdGhlIGZ1bGwgcGF0Y2g/IEl0IGlzIG1pc3NpbmcgdGhlIHJlZ2lzdGVyIHVz
ZSBpbiBoYXhfc3luY192Y3B1X3JlZ2lzdGVyKCkuLi4NCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBQ
aGlsLg0KDQo=

