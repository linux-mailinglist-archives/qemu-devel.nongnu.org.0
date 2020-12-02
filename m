Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E3A2CBB12
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:55:15 +0100 (CET)
Received: from localhost ([::1]:32770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPn0-0003DI-59
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:55:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luwei.kang@intel.com>)
 id 1kkPDi-0000hz-Ng
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:18:46 -0500
Received: from mga06.intel.com ([134.134.136.31]:2968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luwei.kang@intel.com>)
 id 1kkPDf-0003kL-4W
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:18:46 -0500
IronPort-SDR: EupskJRyYh4NOVzrOcWp1TGpVOi8m/1CTgCeiZCdGgVVr8TEipIDv/KlGbLEZhRynTmvdkL4eK
 3BM9BLDEu4og==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="234599861"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="234599861"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 02:18:37 -0800
IronPort-SDR: BZXeaeoz4z8+nLGapPWl51k5NwnAiyyaI4SCqTUojwglFmrKZqmAhDYbiucD2mXPqVPg7RrNV0
 /U/02StJnqOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="537934236"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga006.fm.intel.com with ESMTP; 02 Dec 2020 02:18:37 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Dec 2020 02:18:36 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Dec 2020 02:18:36 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 2 Dec 2020 02:18:36 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 2 Dec 2020 02:18:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ioxvxdFaXmJQ3WVZp0DtpWHnhomkaBlWCZLHP/ONm9pclzUERc2NMG8HGbgV7Xad3CO5XoB/2d4tswiC56Pi8du4UM104fOOx1LngG9EX5yLlXpCd6tiSxUNExcQWhEzgCC7KDNo4DX1QzgBi6gArIN/kaw8DcfYrQdwhGmzEXnrtC3V1OcxiJsOIS4mlDtUuVnAGz7otuMtaybZD7RcLB52BvDuCoBHaZ6mRPF9+7k1e34QuuIS8DTFKijAeXDAYLWOWMWt6iYAit1UYpwmQA77a5x2nPScsgVhRkm67vIUYeZFkwmCPqkpGbKusKTnEPr3FWX4s9wKH8wCq33tUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aOWGCp5QV5Qi03YZzrZNQ4bcOuAS4ljWpAwr8X/634=;
 b=lNp1eulbqmFBCFk/7X8wuo/yYp8hLnUnFSuK6ty68UeeaZ1tLPKwdihmwTuKKH1QKR2HJhdIFi+MfQiY3BE0IPhhODDQp426GBUxNQYavOiVklgI21blyigV65j/gwQ2IanYWoHcTRMtwmaWxZFdVzdF/mG/LMeaoRBLYYdpwTQbWsvWGC6OAYzHE7jWYoTFRLbQgXwQN53zIIlOpveNKBMjCjkV+9+OuwYsWoiRlNYQgix1Kvb5cn7FlpYyap+3++4+4GJBAfZCxGwOWP6e25adWuE8tUVWIryihZ/Gp7WCOrAk8nVzU/OIIQRNr25nWbKr9RFtcfqtXHNfnbxLnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aOWGCp5QV5Qi03YZzrZNQ4bcOuAS4ljWpAwr8X/634=;
 b=W6fX7EATtelMCq6nFwcMOccK4jhRgjVeSyzbi15fEr/Iys4B6wlbzoOabGfxyINmWj4RdMivcbK8VUdmhg0+PzC5K7G/RM+9oeEHeHRQh1x6bmgAh8S5obsdF95ytIzEXXMWuyaWpMubXETg30hh3FqeVqSzQhkzq6W8NSeGb6s=
Received: from CY4PR11MB1447.namprd11.prod.outlook.com (2603:10b6:910:10::16)
 by CY4PR1101MB2359.namprd11.prod.outlook.com (2603:10b6:903:bb::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 10:18:10 +0000
Received: from CY4PR11MB1447.namprd11.prod.outlook.com
 ([fe80::20fe:5f51:b922:3201]) by CY4PR11MB1447.namprd11.prod.outlook.com
 ([fe80::20fe:5f51:b922:3201%5]) with mapi id 15.20.3632.019; Wed, 2 Dec 2020
 10:18:10 +0000
From: "Kang, Luwei" <luwei.kang@intel.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: RE: [PATCH 2/2] i386/cpu: Make the Intel PT LIP feature configurable
Thread-Topic: [PATCH 2/2] i386/cpu: Make the Intel PT LIP feature configurable
Thread-Index: AQHWoiLPC82Sp1vzU0+XpvGrZkP146njCykAgADX2RA=
Date: Wed, 2 Dec 2020 10:18:10 +0000
Message-ID: <CY4PR11MB14479009454294A288D69B8B80F30@CY4PR11MB1447.namprd11.prod.outlook.com>
References: <20201014080443.23751-1-luwei.kang@intel.com>
 <20201014080443.23751-2-luwei.kang@intel.com>
 <20201201211956.GB3836@habkost.net>
In-Reply-To: <20201201211956.GB3836@habkost.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.46.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cf9aca0-ff25-421c-d36d-08d896ab91f7
x-ms-traffictypediagnostic: CY4PR1101MB2359:
x-microsoft-antispam-prvs: <CY4PR1101MB2359ED112B0FA05689F1387580F30@CY4PR1101MB2359.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /jd/O8nhCBrfXlNthOTvcDijSwsdvScmfrIBNfYyeL/dUJtnl4v7bs8gZ9BG190o98x0chrtpEkpj4Yqu1/yPE36F4OhY583R93G9LSLefEO7V0nNq24v0ozOKAou8IsLIWNFR+wc3WVCJOjFBijjwhrIu6TYiMnP/jP9qXXMlXWo00qJ5v+ZAHRzSHGEHM698t+Erz1gxD99HYE745s/xmf1kYqMkqrCpWDoXtWns1CZ2TBpoLCfws3q9vz3Wp1ZMhFtmOlynkjEznIjaK4VCjr+K+ojAMGS9BZKwFHC7/tTi1m/gQS1eV6+UXR2qqoI/CRmmF42KjcO51H4kl29w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB1447.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(53546011)(9686003)(5660300002)(8676002)(52536014)(2906002)(76116006)(64756008)(66556008)(6916009)(66446008)(66476007)(66946007)(4326008)(186003)(83380400001)(26005)(6506007)(55016002)(71200400001)(478600001)(316002)(8936002)(86362001)(33656002)(7696005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UityenpFNDE1YzBTSDY1R2pjOTFiWWFwaTZHcm5BQU9uTWE4cU9mK290MFFB?=
 =?utf-8?B?K3JJNjVqcjRmSjNtcWtKSnZnZXFKazdhWDlWSWd3ZGVhdzJVQm5FdTJBYW1u?=
 =?utf-8?B?MkJZREZOSVd5QjN1dVUxVFFtV3FoNzh0emlrNGpld3BmMjM5bzhZa1pEeGNr?=
 =?utf-8?B?RnYxMElDL1BlcHlCSXBGMUVkeEhiUTB4ZEpxTHlIcFZVNEljOVVFbDkxSjUr?=
 =?utf-8?B?WEx3Nmo5RGp2ZkRkR0tLVHRyK2tkOTlJTHpBZkVQT200V3lVZ0xVbEVXeUZu?=
 =?utf-8?B?VkFyMEJURjNXVUNnY09TbFVta2tVdGxtWlRvekpQeGlFdmlINkVieTVsMkNM?=
 =?utf-8?B?SVF5YnhKU1QzQUxKRU9OUjY5WUVtaVV2Z1BHTDhJRjYwRjN2WS8wYlhrWTVt?=
 =?utf-8?B?clppWnBFdHovR1FMcWYzNGdSYVoyQk5GanUrTGhZZ0FqMzhubWJtdDFtOVZr?=
 =?utf-8?B?SVU2dEJlZVYzQmdkU0NnNTVDU2F6QnJZc1lFbUhLZlFUejcyLytRS0REaWFS?=
 =?utf-8?B?a1A4dVlLcUpSWXR2dTFxVWpLZ1lVZGREUUZybWZjZWlISmV6RDFacjhhYlZu?=
 =?utf-8?B?ZUdZRi9lKzdaZmlJUTlBdXdsYVR0V091MkVBbCtWbkt3dUdNQlZySklPYlV6?=
 =?utf-8?B?THFVNEFiREw4UW9oSUw5akhTU1BZTGpxbGhpQld1b1NpTmttUXdhejNnajRM?=
 =?utf-8?B?WW5vTDBNQnBLTzA0SDlHck5UWkxCRXBpeXVCUG8rMFFXeWFFVnR2WjZURERL?=
 =?utf-8?B?YmVnaDUzaUhsR1ZVNmRES1dONHJNbERVcGhRTUhBOEJyMzJrTEtRNFpYNzlZ?=
 =?utf-8?B?OTB1Yjh6Y29HTjVLNjhZUzhtd0lhRm11Vm9NU2RRWUJCakRhN0NST1VoNUFI?=
 =?utf-8?B?TUgwdGRVVWdJTC9SRkVseDZFam5LakFNZlJmelZ5SFY2TlNSMFVQTnZTR2hY?=
 =?utf-8?B?UVd5VXg3MGhhYzl6MGNCTm4vTTNEMEU4YmhlSjFCeTEvZjNLQTdaUjV6dmhw?=
 =?utf-8?B?YW1GR2V0SVF3a01SZThlOElCQnloTVB5Sm1CQXduUHRzR0F0UlU1NE0xM2Nm?=
 =?utf-8?B?ZnJoaXhFK3p6NEZnRTNBZmxYRFpxc3BzY1JrNmpNZVlQbjlORk9JamVDZUVB?=
 =?utf-8?B?ZDNWclNLNnNuSGc3cWh0N2RGSmJBWUVIWEN5UU1pSlRnVGJhK2J3eVVzVHBW?=
 =?utf-8?B?c1lTZDh1M0JVd0M5Z284Q2JSV0JEZTUxSlViZ0lUTmlEM3Qyd3VrMVBlZGcw?=
 =?utf-8?B?ZUhuSmRXY284Wm9yeFhGV3RzQmRsWTFqZHNhRWhISGZPYTVwQjk1WnpFRXMw?=
 =?utf-8?Q?uH/ZcHv80NmWw=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1447.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf9aca0-ff25-421c-d36d-08d896ab91f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 10:18:10.4907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ChZCdOI8JEekxfTFMj82XiJ8Es9KNMqfc/LP4KDiY4a4g/AL0OApPAzyUSQTq+cCXlgIfXnvQI/ITjdV++6dXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2359
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=luwei.kang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiA+IFRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIHdpbGwgZGlzYWJsZSB0aGUgZ3Vlc3QgSW50
ZWwgUFQgZmVhdHVyZSBpZg0KPiA+IHRoZSBJbnRlbCBQVCBMSVAgZmVhdHVyZSBpcyBzdXBwb3J0
ZWQgb24gdGhlIGhvc3QsIGJ1dCB0aGUgTElQIGZlYXR1cmUNCj4gPiBpcyBjb21taW5nIHNvb24o
ZS5nLiBTbm93UmlkZ2UgYW5kIGxhdGVyKS4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggd2lsbCBtYWtl
IHRoZSBndWVzdCBMSVAgZmVhdHVyZSBjb25maWd1cmFibGUgYW5kIEludGVsIFBUDQo+ID4gZmVh
dHVyZSBjYW4gYmUgZW5hYmxlZCBpbiBndWVzdCB3aGVuIHRoZSBndWVzdCBMSVAgc3RhdHVzIHNh
bWUgd2l0aA0KPiA+IHRoZSBob3N0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTHV3ZWkgS2Fu
ZyA8bHV3ZWkua2FuZ0BpbnRlbC5jb20+DQo+IA0KPiBUaGUgcGF0Y2ggbG9va3MgZ29vZCwgYnV0
IEkgd291bGQgbGlrZSB0byBjb25maXJtIGlmIHRoZSBmZWF0dXJlIHdvcmtzIGFzDQo+IGV4cGVj
dGVkIGlmIHBhdGNoIDEvMiBpcyBub3QgYXBwbGllZC4NCj4gDQo+IEkgaGF2ZSBtYW51YWxseSBm
aXhlZCBpdCB1cCB0byBtYWtlIHBhdGNoIDEvMSBub3QgcmVxdWlyZWQsIGJ1dCBJIHdvdWxkIGxp
a2UgdG8NCj4gY29uZmlybSBpdCByZWFsbHkgd29ya3Mgb24gYm90aCBJbnRlbCBob3N0cyB3aXRo
DQo+IExJUD0xIGFuZCBob3N0cyB3aXRoIExJUD0wLiAgQ291bGQgeW91IHBsZWFzZSB0ZXN0IHRo
ZSBmb2xsb3dpbmcgdmVyc2lvbiBvZiB0aGUNCj4gcGF0Y2g/DQoNCkhpIEVkdWFyZG8sDQogICAg
VGhhbmtzIGZvciB5b3VyIHJlcGx5LiBJIHNlbnQgb3V0IGEgbmV3IHZlcnNpb24oVjIpIHdoaWNo
IGFkZHMgYSBkZXBlbmRlbmN5IGZsYWcgYmFzZWQgb24geW91ciBtb2RpZmljYXRpb24uIEFuZCBh
bGwgdGhlIHRlc3QgY2FzZXMgYW5kIHJlc3VsdHMgaW5jbHVkZSBIVyB3LyBhbmQgdy9vIExJUCBs
aXN0IGluIHZlcnNpb24gMi4NCg0KVGhhbmtzLA0KTHV3ZWkgS2FuZw0KDQo+IA0KPiAtLS0tLS0t
DQo+IEZyb20gOGEyYzlmZGJlNTBmN2ZmZDk5MDBjNjdlNzJmNTNjOGRjODVmZjNmZCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDENCj4gRnJvbTogTHV3ZWkgS2FuZyA8bHV3ZWkua2FuZ0BpbnRlbC5j
b20+DQo+IERhdGU6IFdlZCwgMTQgT2N0IDIwMjAgMTY6MDQ6NDMgKzA4MDANCj4gU3ViamVjdDog
W1BBVENIXSBpMzg2L2NwdTogTWFrZSB0aGUgSW50ZWwgUFQgTElQIGZlYXR1cmUgY29uZmlndXJh
YmxlDQo+IA0KPiBUaGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiB3aWxsIGRpc2FibGUgdGhlIGd1
ZXN0IEludGVsIFBUIGZlYXR1cmUgaWYgdGhlIEludGVsDQo+IFBUIExJUCBmZWF0dXJlIGlzIHN1
cHBvcnRlZCBvbiB0aGUgaG9zdCwgYnV0IHRoZSBMSVAgZmVhdHVyZSBpcyBjb21taW5nDQo+IHNv
b24oZS5nLiBTbm93UmlkZ2UgYW5kIGxhdGVyKS4NCj4gDQo+IFRoaXMgcGF0Y2ggd2lsbCBtYWtl
IHRoZSBndWVzdCBMSVAgZmVhdHVyZSBjb25maWd1cmFibGUgYW5kIEludGVsIFBUIGZlYXR1cmUg
Y2FuDQo+IGJlIGVuYWJsZWQgaW4gZ3Vlc3Qgd2hlbiB0aGUgZ3Vlc3QgTElQIHN0YXR1cyBzYW1l
IHdpdGggdGhlIGhvc3QuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdXdlaSBLYW5nIDxsdXdlaS5r
YW5nQGludGVsLmNvbT4NCj4gTWVzc2FnZS1JZDogPDIwMjAxMDE0MDgwNDQzLjIzNzUxLTItbHV3
ZWkua2FuZ0BpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEVkdWFyZG8gSGFia29zdCA8ZWhh
Ymtvc3RAcmVkaGF0LmNvbT4NCj4gLS0tDQo+ICB0YXJnZXQvaTM4Ni9jcHUuaCB8ICA0ICsrKysN
Cj4gIHRhcmdldC9pMzg2L2NwdS5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS90YXJnZXQvaTM4Ni9jcHUuaCBiL3RhcmdldC9pMzg2L2NwdS5oIGluZGV4
IDg4ZTg1ODZmOGYuLmM0YTQ5YzA2YTgNCj4gMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9pMzg2L2Nw
dS5oDQo+ICsrKyBiL3RhcmdldC9pMzg2L2NwdS5oDQo+IEBAIC01NDEsNiArNTQxLDcgQEAgdHlw
ZWRlZiBlbnVtIEZlYXR1cmVXb3JkIHsNCj4gICAgICBGRUFUX1ZNWF9FUFRfVlBJRF9DQVBTLA0K
PiAgICAgIEZFQVRfVk1YX0JBU0lDLA0KPiAgICAgIEZFQVRfVk1YX1ZNRlVOQywNCj4gKyAgICBG
RUFUXzE0XzBfRUNYLA0KPiAgICAgIEZFQVRVUkVfV09SRFMsDQo+ICB9IEZlYXR1cmVXb3JkOw0K
PiANCj4gQEAgLTc5Nyw2ICs3OTgsOSBAQCB0eXBlZGVmIHVpbnQ2NF90IEZlYXR1cmVXb3JkQXJy
YXlbRkVBVFVSRV9XT1JEU107DQo+ICAvKiBBVlg1MTIgQkZsb2F0MTYgSW5zdHJ1Y3Rpb24gKi8N
Cj4gICNkZWZpbmUgQ1BVSURfN18xX0VBWF9BVlg1MTJfQkYxNiAgICAgICAoMVUgPDwgNSkNCj4g
DQo+ICsvKiBQYWNrZXRzIHdoaWNoIGNvbnRhaW4gSVAgcGF5bG9hZCBoYXZlIExJUCB2YWx1ZXMg
Ki8NCj4gKyNkZWZpbmUgQ1BVSURfMTRfMF9FQ1hfTElQICAgICAgICAgICAgICAoMVUgPDwgMzEp
DQo+ICsNCj4gIC8qIENMWkVSTyBpbnN0cnVjdGlvbiAqLw0KPiAgI2RlZmluZSBDUFVJRF84MDAw
XzAwMDhfRUJYX0NMWkVSTyAgICAgICgxVSA8PCAwKQ0KPiAgLyogQWx3YXlzIHNhdmUvcmVzdG9y
ZSBGUCBlcnJvciBwb2ludGVycyAqLyBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2kzODYvY3B1LmMNCj4g
Yi90YXJnZXQvaTM4Ni9jcHUuYyBpbmRleCA1YThjOTYwNzJlLi5kYjllNDgwMzNkIDEwMDY0NA0K
PiAtLS0gYS90YXJnZXQvaTM4Ni9jcHUuYw0KPiArKysgYi90YXJnZXQvaTM4Ni9jcHUuYw0KPiBA
QCAtNjcyLDYgKzY3Miw3IEBAIHN0YXRpYyB2b2lkIHg4Nl9jcHVfdmVuZG9yX3dvcmRzMnN0cihj
aGFyICpkc3QsDQo+IHVpbnQzMl90IHZlbmRvcjEsICAjZGVmaW5lIFRDR19YU0FWRV9GRUFUVVJF
UyAoQ1BVSURfWFNBVkVfWFNBVkVPUFQNCj4gfCBDUFVJRF9YU0FWRV9YR0VUQlYxKQ0KPiAgICAg
ICAgICAgIC8qIG1pc3Npbmc6DQo+ICAgICAgICAgICAgQ1BVSURfWFNBVkVfWFNBVkVDLCBDUFVJ
RF9YU0FWRV9YU0FWRVMgKi8NCj4gKyNkZWZpbmUgVENHXzE0XzBfRUNYX0ZFQVRVUkVTIDANCj4g
DQo+ICB0eXBlZGVmIGVudW0gRmVhdHVyZVdvcmRUeXBlIHsNCj4gICAgIENQVUlEX0ZFQVRVUkVf
V09SRCwNCj4gQEAgLTEzMDEsNiArMTMwMiwyNiBAQCBzdGF0aWMgRmVhdHVyZVdvcmRJbmZvDQo+
IGZlYXR1cmVfd29yZF9pbmZvW0ZFQVRVUkVfV09SRFNdID0gew0KPiAgICAgICAgICB9DQo+ICAg
ICAgfSwNCj4gDQo+ICsgICAgW0ZFQVRfMTRfMF9FQ1hdID0gew0KPiArICAgICAgICAudHlwZSA9
IENQVUlEX0ZFQVRVUkVfV09SRCwNCj4gKyAgICAgICAgLmZlYXRfbmFtZXMgPSB7DQo+ICsgICAg
ICAgICAgICBOVUxMLCBOVUxMLCBOVUxMLCBOVUxMLA0KPiArICAgICAgICAgICAgTlVMTCwgTlVM
TCwgTlVMTCwgTlVMTCwNCj4gKyAgICAgICAgICAgIE5VTEwsIE5VTEwsIE5VTEwsIE5VTEwsDQo+
ICsgICAgICAgICAgICBOVUxMLCBOVUxMLCBOVUxMLCBOVUxMLA0KPiArICAgICAgICAgICAgTlVM
TCwgTlVMTCwgTlVMTCwgTlVMTCwNCj4gKyAgICAgICAgICAgIE5VTEwsIE5VTEwsIE5VTEwsIE5V
TEwsDQo+ICsgICAgICAgICAgICBOVUxMLCBOVUxMLCBOVUxMLCBOVUxMLA0KPiArICAgICAgICAg
ICAgTlVMTCwgTlVMTCwgTlVMTCwgImludGVsLXB0LWxpcCIsDQo+ICsgICAgICAgIH0sDQo+ICsg
ICAgICAgIC5jcHVpZCA9IHsNCj4gKyAgICAgICAgICAgIC5lYXggPSAweDE0LA0KPiArICAgICAg
ICAgICAgLm5lZWRzX2VjeCA9IHRydWUsIC5lY3ggPSAwLA0KPiArICAgICAgICAgICAgLnJlZyA9
IFJfRUNYLA0KPiArICAgICAgICB9LA0KPiArICAgICAgICAudGNnX2ZlYXR1cmVzID0gVENHXzE0
XzBfRUNYX0ZFQVRVUkVTLA0KPiArICAgIH0sDQo+ICsNCj4gIH07DQo+IA0KPiAgdHlwZWRlZiBz
dHJ1Y3QgRmVhdHVyZU1hc2sgew0KPiBAQCAtNTc1Miw2ICs1NzczLDkgQEAgdm9pZCBjcHVfeDg2
X2NwdWlkKENQVVg4NlN0YXRlICplbnYsIHVpbnQzMl90DQo+IGluZGV4LCB1aW50MzJfdCBjb3Vu
dCwNCj4gICAgICAgICAgICAgICplYXggPSBJTlRFTF9QVF9NQVhfU1VCTEVBRjsNCj4gICAgICAg
ICAgICAgICplYnggPSBJTlRFTF9QVF9NSU5JTUFMX0VCWDsNCj4gICAgICAgICAgICAgICplY3gg
PSBJTlRFTF9QVF9NSU5JTUFMX0VDWDsNCj4gKyAgICAgICAgICAgIGlmIChlbnYtPmZlYXR1cmVz
W0ZFQVRfMTRfMF9FQ1hdICYgQ1BVSURfMTRfMF9FQ1hfTElQKSB7DQo+ICsgICAgICAgICAgICAg
ICAgKmVjeCB8PSBDUFVJRF8xNF8wX0VDWF9MSVA7DQo+ICsgICAgICAgICAgICB9DQo+ICAgICAg
ICAgIH0gZWxzZSBpZiAoY291bnQgPT0gMSkgew0KPiAgICAgICAgICAgICAgKmVheCA9IElOVEVM
X1BUX01UQ19CSVRNQVAgfCBJTlRFTF9QVF9BRERSX1JBTkdFU19OVU07DQo+ICAgICAgICAgICAg
ICAqZWJ4ID0gSU5URUxfUFRfUFNCX0JJVE1BUCB8IElOVEVMX1BUX0NZQ0xFX0JJVE1BUDsgQEAg
LTY0OTgsNw0KPiArNjUyMiw4IEBAIHN0YXRpYyB2b2lkIHg4Nl9jcHVfZmlsdGVyX2ZlYXR1cmVz
KFg4NkNQVSAqY3B1LCBib29sIHZlcmJvc2UpDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgSU5URUxfUFRfQUREUl9SQU5HRVNfTlVNKSB8fA0KPiAgICAgICAg
ICAgICAoKGVieF8xICYgKElOVEVMX1BUX1BTQl9CSVRNQVAgfCBJTlRFTF9QVF9DWUNMRV9CSVRN
QVApKSAhPQ0KPiAgICAgICAgICAgICAgICAgIChJTlRFTF9QVF9QU0JfQklUTUFQIHwgSU5URUxf
UFRfQ1lDTEVfQklUTUFQKSkgfHwNCj4gLSAgICAgICAgICAgKGVjeF8wICYgSU5URUxfUFRfSVBf
TElQKSkgew0KPiArICAgICAgICAgICAoKGVjeF8wICYgQ1BVSURfMTRfMF9FQ1hfTElQKSAhPQ0K
PiArICAgICAgICAgICAgICAgIChlbnYtPmZlYXR1cmVzW0ZFQVRfMTRfMF9FQ1hdICYgQ1BVSURf
MTRfMF9FQ1hfTElQKSkpIHsNCj4gICAgICAgICAgICAgIC8qDQo+ICAgICAgICAgICAgICAgKiBQ
cm9jZXNzb3IgVHJhY2UgY2FwYWJpbGl0aWVzIGFyZW4ndCBjb25maWd1cmFibGUsIHNvIGlmIHRo
ZQ0KPiAgICAgICAgICAgICAgICogaG9zdCBjYW4ndCBlbXVsYXRlIHRoZSBjYXBhYmlsaXRpZXMg
d2UgcmVwb3J0IG9uDQo+IC0tDQo+IDIuMjguMA0KPiANCj4gLS0NCj4gRWR1YXJkbw0KDQo=

