Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322482AE609
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 02:49:18 +0100 (CET)
Received: from localhost ([::1]:49942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcfG8-0000Ej-Rk
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 20:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luwei.kang@intel.com>)
 id 1kcfF2-00083x-R9
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 20:48:08 -0500
Received: from mga06.intel.com ([134.134.136.31]:10587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luwei.kang@intel.com>)
 id 1kcfEz-0004Gq-Qn
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 20:48:08 -0500
IronPort-SDR: TDAb4uZknEI1xdyQwCP07jnLgHYjDSFwG/tfT/VDbSb6Y6QC/sZWuDWv6HMcqGQBQY5TcQYOUW
 j4EwN0YXfD6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="231704769"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="231704769"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 17:47:56 -0800
IronPort-SDR: fIEV7e/QEBPWtF5ItuybGd/Ldrz1eXg9bj4BI22GYkcsH66YD3meYdd7Xd/sAenYpM+cZJPhak
 M+mDvrGHO5gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="308278015"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 10 Nov 2020 17:47:56 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 10 Nov 2020 17:47:56 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 10 Nov 2020 17:47:56 -0800
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.57) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 10 Nov 2020 17:47:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=en+ADYU1OPeZhOvu79tqG3hUJ9/rSB39KP+KBzmlORHkeSXbOYpkFPxjYJQ6VMB5R9gN8G5bHrVeCOR+3tTKAmZzqFJAhNb5JledbBdayLTuvPuC12TpnKxp5B137XLXedl7ZPPlpCk5H6FNlB3LZZBinQv/NEZEdLBUItatLX3PVz6QVe2b5AjA70Mj72kyQxO3UhQ26outqyoq7FL205dwEfehzGysVaLB+y2PmSLLEs6eJY/LqESWVdQ10lTT1pYzFOC1iD2kW7PKhH/K9c7cBoMjbZCWypVKMEO1tMmlrMPkU+iJn3SHuGyF3PVptLxAND4ltSsugPcDJsNJNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXbBrBpB4lc0Rl+6MO08zQZQFUDyMRb/dmSRLC56P+4=;
 b=PenOHUtDky09dfv+3nRQd+zpHlNKFuzXztXFyUUuUDJT7PxyDFoLTOQepbhL6u685DNMuauEQg3VIEoJwTfXe2kU+YKX3nqejlvLoNcvbBaazCCUaLL0Bx0ErFNqknGLYLUcI9jhS6TkEd1hKzmVuGMv5Fd7bY+HCEIwg/h4+Dvk4kk6gcfvGTjGN+lSoeDmUZWXUHsvVw8L5hlDyslvTVzR1cQ16SeIn6PiLAIYT5FpWxoiEgUaHpKDa76fxo7xcR+2kykQgBwMcW9/jVmSsuD72p2WRiY0zuMgnUzHWjCDT/xxLueVY0SYmrNlm82q8SyHSaRfDG/UYrsL5DRP5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXbBrBpB4lc0Rl+6MO08zQZQFUDyMRb/dmSRLC56P+4=;
 b=wFoRT8iBsYgHYqz+eAemHdMBYaOa6ICy1GI9FVLXE1Rsbi1OKpMV6yBJgsXlIaVF9sdXUbUKuWlmBKe6ghxJs0bXwAM2NwPaGRjGH5yxXDDzrZj/6s9/VEx+TvOESS43yVMAxev3bU4H23/+gyPVmwdoDJYqdAZJsCB+3oMwPX4=
Received: from CY4PR11MB1447.namprd11.prod.outlook.com (2603:10b6:910:10::16)
 by CY4PR1101MB2248.namprd11.prod.outlook.com (2603:10b6:910:1a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Wed, 11 Nov
 2020 01:47:54 +0000
Received: from CY4PR11MB1447.namprd11.prod.outlook.com
 ([fe80::e973:a623:3d68:7669]) by CY4PR11MB1447.namprd11.prod.outlook.com
 ([fe80::e973:a623:3d68:7669%4]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 01:47:54 +0000
From: "Kang, Luwei" <luwei.kang@intel.com>
To: "pbonzini@redhat.com" <pbonzini@redhat.com>, "rth@twiddle.net"
 <rth@twiddle.net>, "ehabkost@redhat.com" <ehabkost@redhat.com>
Subject: RE: [PATCH 2/2] i386/cpu: Make the Intel PT LIP feature configurable
Thread-Topic: [PATCH 2/2] i386/cpu: Make the Intel PT LIP feature configurable
Thread-Index: AQHWoiLPC82Sp1vzU0+XpvGrZkP146nCVLTA
Date: Wed, 11 Nov 2020 01:47:53 +0000
Message-ID: <CY4PR11MB14471A923BB199DAF3D7E3EE80E80@CY4PR11MB1447.namprd11.prod.outlook.com>
References: <20201014080443.23751-1-luwei.kang@intel.com>
 <20201014080443.23751-2-luwei.kang@intel.com>
In-Reply-To: <20201014080443.23751-2-luwei.kang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.37]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c21f16a-7911-4ca6-2120-08d885e3ce6e
x-ms-traffictypediagnostic: CY4PR1101MB2248:
x-microsoft-antispam-prvs: <CY4PR1101MB2248E32FA3D331184C934F1080E80@CY4PR1101MB2248.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IG35LQtbVIPmhrEJiFr2UefD+TZH1CvtuOG7fZ8ib6g0GAbv+Un82eNVrZwlbaZ+ClGt+DKKkbvkeRTxG8o/KSPRWWM9mxV2cHr8vzO0HJwa37aYejY/mc18PEEUgWgOJKBFIeZLxRrobrxmm30TnHy3aCS/Ep6eDB59tpqvdKbKudHbq5+j5Z7zs42eQhF7xpkr1KIjr6QcSEtyG298GRRXCUvSXrDqmORPEMdIJZdpFsdsxUGoEvnZaZYQITWQrtsS/RvkpwyQz+vqsjIoiR+BAc+BiWqN1dez50kOm+qtprF1XKwFJ9mflC8SX0udoX9+0W2HeZ9YB2AS1D7DPA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB1447.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(478600001)(8936002)(316002)(8676002)(86362001)(83380400001)(33656002)(66946007)(64756008)(53546011)(52536014)(110136005)(76116006)(26005)(2906002)(4326008)(7696005)(55016002)(5660300002)(71200400001)(9686003)(66476007)(66556008)(66446008)(186003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: rZ85U4EaHEi1ZBkVFdAIik4Eke0fcn4/mUZobcY6vYh4dpFpAPtejJ9Do+rRIHAwZg2zTnqEXOnoqOzX81GPR3gKCiTgcvngfjL4ue8y5Zv25w4EdEuTCJP/hJ6QRnkHpbYO/Pi1kPxu6wQg0kM1VZQTTeYm/olAWTu+M7Fzmce04CoiPDxABR0f+vY0hCJC0G/t38xwKjEM6tsOKKjoz2zQ4nv7Cb1GT8/YRNoAEYphIKvejVaHj0yzbmkatU3YKHaWiM1l9hcwEqAikNE55u4hpbyeR2wgdAkGhRSM55WhLSCan6kQoDRSkleLB4u12zWXzsiVIgBkjnP9coco1Drym0TQw5e3IBPp1wYhdeSvimv7oaukFHflwelzPQtCxeszAVEMGhi8tHMs2yWq6lu0xa8z+RS2rTHcO46rcMwqcSkUZhYfvXRv3pgYi38ra5JViNUNEQ1THUP341D2pu5mA5+ayPEr3FSt3xAJAd3DXm+FJra84zFB76WqZeb9a8vGBzSZXWMYSMGfwEa/+3Fos94ODZXG2j2fytsOjPPLCWULxHSqrxZE34jJRncIVhcT915xci6+jYeGHmaar8+3GZM2kMl5iRz5xxb81RsjwXlpHAUOq2Jkd9N/yWAm+4wTEvMzTXTS25acTHgKf7DscQu0KSrbxhtdkN/ge2RJQTKfnEExPPrn1MgLhZGI5bWZmqOhg3nIxYGz+d1/crkI+eVTxn4vMJswvQIjZs6acKJA6XH6maj4p2HeTDpL+RoA9jOHDhdgyeCvHtYQcPQqix5acxHs/0lQl+HO5ZVjQJt3lvmJwKWLZvenOYT9o4M84BmlRGmv/1W11sV2va9siElE798Pz10NSozIF5L1A4ewHKQxq75EV5vELDQEAYCC3ytY9EpgQWZGylo3pQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1447.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c21f16a-7911-4ca6-2120-08d885e3ce6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 01:47:53.9259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z2cABzl98CJ12E7izibWkoLU6U5HXlaDgztp4Ue+XQsd1AA3dbvP1NPjzXgdLaqkSzED1CEzhnxzwDCrgzSPlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2248
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=luwei.kang@intel.com;
 helo=mga06.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 20:47:57
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLYW5nLCBMdXdlaSA8bHV3ZWku
a2FuZ0BpbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAxNCwgMjAyMCA0OjA1
IFBNDQo+IFRvOiBwYm9uemluaUByZWRoYXQuY29tOyBydGhAdHdpZGRsZS5uZXQ7IGVoYWJrb3N0
QHJlZGhhdC5jb20NCj4gQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgS2FuZywgTHV3ZWkgPGx1
d2VpLmthbmdAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMi8yXSBpMzg2L2NwdTogTWFr
ZSB0aGUgSW50ZWwgUFQgTElQIGZlYXR1cmUgY29uZmlndXJhYmxlDQo+IA0KPiBUaGUgY3VycmVu
dCBpbXBsZW1lbnRhdGlvbiB3aWxsIGRpc2FibGUgdGhlIGd1ZXN0IEludGVsIFBUIGZlYXR1cmUg
aWYgdGhlIEludGVsDQo+IFBUIExJUCBmZWF0dXJlIGlzIHN1cHBvcnRlZCBvbiB0aGUgaG9zdCwg
YnV0IHRoZSBMSVAgZmVhdHVyZSBpcyBjb21taW5nDQo+IHNvb24oZS5nLiBTbm93UmlkZ2UgYW5k
IGxhdGVyKS4NCj4gDQo+IFRoaXMgcGF0Y2ggd2lsbCBtYWtlIHRoZSBndWVzdCBMSVAgZmVhdHVy
ZSBjb25maWd1cmFibGUgYW5kIEludGVsIFBUIGZlYXR1cmUgY2FuDQo+IGJlIGVuYWJsZWQgaW4g
Z3Vlc3Qgd2hlbiB0aGUgZ3Vlc3QgTElQIHN0YXR1cyBzYW1lIHdpdGggdGhlIGhvc3QuDQoNClBp
bmcuIPCfmIoNCg0KVGhhbmtzLA0KTHV3ZWkgS2FuZw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBM
dXdlaSBLYW5nIDxsdXdlaS5rYW5nQGludGVsLmNvbT4NCj4gLS0tDQo+ICB0YXJnZXQvaTM4Ni9j
cHUuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tICB0YXJnZXQvaTM4Ni9jcHUu
aA0KPiB8ICA0ICsrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90YXJnZXQvaTM4Ni9jcHUuYyBiL3Rhcmdl
dC9pMzg2L2NwdS5jIGluZGV4DQo+IDI0NjQ0YWJmZDQuLmFlYWJkZDViZDQgMTAwNjQ0DQo+IC0t
LSBhL3RhcmdldC9pMzg2L2NwdS5jDQo+ICsrKyBiL3RhcmdldC9pMzg2L2NwdS5jDQo+IEBAIC02
NzIsNiArNjcyLDcgQEAgc3RhdGljIHZvaWQgeDg2X2NwdV92ZW5kb3Jfd29yZHMyc3RyKGNoYXIg
KmRzdCwNCj4gdWludDMyX3QgdmVuZG9yMSwgICNkZWZpbmUgVENHX1hTQVZFX0ZFQVRVUkVTIChD
UFVJRF9YU0FWRV9YU0FWRU9QVA0KPiB8IENQVUlEX1hTQVZFX1hHRVRCVjEpDQo+ICAgICAgICAg
ICAgLyogbWlzc2luZzoNCj4gICAgICAgICAgICBDUFVJRF9YU0FWRV9YU0FWRUMsIENQVUlEX1hT
QVZFX1hTQVZFUyAqLw0KPiArI2RlZmluZSBUQ0dfMTRfMF9FQ1hfRkVBVFVSRVMgMA0KPiANCj4g
IHR5cGVkZWYgZW51bSBGZWF0dXJlV29yZFR5cGUgew0KPiAgICAgQ1BVSURfRkVBVFVSRV9XT1JE
LA0KPiBAQCAtMTMwMSw2ICsxMzAyLDI2IEBAIHN0YXRpYyBGZWF0dXJlV29yZEluZm8NCj4gZmVh
dHVyZV93b3JkX2luZm9bRkVBVFVSRV9XT1JEU10gPSB7DQo+ICAgICAgICAgIH0NCj4gICAgICB9
LA0KPiANCj4gKyAgICBbRkVBVF8xNF8wX0VDWF0gPSB7DQo+ICsgICAgICAgIC50eXBlID0gQ1BV
SURfRkVBVFVSRV9XT1JELA0KPiArICAgICAgICAuZmVhdF9uYW1lcyA9IHsNCj4gKyAgICAgICAg
ICAgIE5VTEwsIE5VTEwsIE5VTEwsIE5VTEwsDQo+ICsgICAgICAgICAgICBOVUxMLCBOVUxMLCBO
VUxMLCBOVUxMLA0KPiArICAgICAgICAgICAgTlVMTCwgTlVMTCwgTlVMTCwgTlVMTCwNCj4gKyAg
ICAgICAgICAgIE5VTEwsIE5VTEwsIE5VTEwsIE5VTEwsDQo+ICsgICAgICAgICAgICBOVUxMLCBO
VUxMLCBOVUxMLCBOVUxMLA0KPiArICAgICAgICAgICAgTlVMTCwgTlVMTCwgTlVMTCwgTlVMTCwN
Cj4gKyAgICAgICAgICAgIE5VTEwsIE5VTEwsIE5VTEwsIE5VTEwsDQo+ICsgICAgICAgICAgICBO
VUxMLCBOVUxMLCBOVUxMLCAiaW50ZWwtcHQtbGlwIiwNCj4gKyAgICAgICAgfSwNCj4gKyAgICAg
ICAgLmNwdWlkID0gew0KPiArICAgICAgICAgICAgLmVheCA9IDB4MTQsDQo+ICsgICAgICAgICAg
ICAubmVlZHNfZWN4ID0gdHJ1ZSwgLmVjeCA9IDAsDQo+ICsgICAgICAgICAgICAucmVnID0gUl9F
Q1gsDQo+ICsgICAgICAgIH0sDQo+ICsgICAgICAgIC50Y2dfZmVhdHVyZXMgPSBUQ0dfMTRfMF9F
Q1hfRkVBVFVSRVMsDQo+ICsgICAgfSwNCj4gKw0KPiAgfTsNCj4gDQo+ICB0eXBlZGVmIHN0cnVj
dCBGZWF0dXJlTWFzayB7DQo+IEBAIC01NzQzLDYgKzU3NjQsOSBAQCB2b2lkIGNwdV94ODZfY3B1
aWQoQ1BVWDg2U3RhdGUgKmVudiwgdWludDMyX3QNCj4gaW5kZXgsIHVpbnQzMl90IGNvdW50LA0K
PiAgICAgICAgICAgICAgKmVheCA9IElOVEVMX1BUX01BWF9TVUJMRUFGOw0KPiAgICAgICAgICAg
ICAgKmVieCA9IElOVEVMX1BUX01JTklNQUxfRUJYOw0KPiAgICAgICAgICAgICAgKmVjeCA9IElO
VEVMX1BUX01JTklNQUxfRUNYOw0KPiArICAgICAgICAgICAgaWYgKGVudi0+ZmVhdHVyZXNbRkVB
VF8xNF8wX0VDWF0gJiBDUFVJRF8xNF8wX0VDWF9MSVApIHsNCj4gKyAgICAgICAgICAgICAgICAq
ZWN4IHw9IENQVUlEXzE0XzBfRUNYX0xJUDsNCj4gKyAgICAgICAgICAgIH0NCj4gICAgICAgICAg
fSBlbHNlIGlmIChjb3VudCA9PSAxKSB7DQo+ICAgICAgICAgICAgICAqZWF4ID0gSU5URUxfUFRf
TVRDX0JJVE1BUCB8IElOVEVMX1BUX0FERFJfUkFOR0VTX05VTTsNCj4gICAgICAgICAgICAgICpl
YnggPSBJTlRFTF9QVF9QU0JfQklUTUFQIHwgSU5URUxfUFRfQ1lDTEVfQklUTUFQOyBAQCAtNjQx
Niw4DQo+ICs2NDQwLDkgQEAgc3RhdGljIHZvaWQgeDg2X2NwdV9leHBhbmRfZmVhdHVyZXMoWDg2
Q1BVICpjcHUsIEVycm9yICoqZXJycCkNCj4gICAgICAgICAgICAgICAgICgoZWF4XzEgJiBJTlRF
TF9QVF9BRERSX1JBTkdFU19OVU1fTUFTSykgPj0NCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBJTlRFTF9QVF9BRERSX1JBTkdFU19OVU0pICYmDQo+ICAgICAg
ICAgICAgICAgICAoKGVieF8xICYgKElOVEVMX1BUX1BTQl9CSVRNQVAgfCBJTlRFTF9QVF9DWUNM
RV9CSVRNQVApKSA9PQ0KPiAtICAgICAgICAgICAgICAgICAgICAoSU5URUxfUFRfUFNCX0JJVE1B
UCB8IElOVEVMX1BUX0NZQ0xFX0JJVE1BUCkpICYmDQo+IC0gICAgICAgICAgICAgICAhKGVjeF8w
ICYgSU5URUxfUFRfSVBfTElQKSkgew0KPiArICAgICAgICAgICAgICAgICAgICAgICAgKElOVEVM
X1BUX1BTQl9CSVRNQVAgfCBJTlRFTF9QVF9DWUNMRV9CSVRNQVApKSAmJg0KPiArICAgICAgICAg
ICAgICAgKChlY3hfMCAmIENQVUlEXzE0XzBfRUNYX0xJUCkgPT0NCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgIChlbnYtPmZlYXR1cmVzW0ZFQVRfMTRfMF9FQ1hdICYNCj4gKyBDUFVJRF8xNF8w
X0VDWF9MSVApKSkgew0KPiAgICAgICAgICAgICAgICAgIGlmIChjcHUtPmludGVsX3B0X2F1dG9f
bGV2ZWwpIHsNCj4gICAgICAgICAgICAgICAgICAgICAgeDg2X2NwdV9hZGp1c3RfbGV2ZWwoY3B1
LCAmY3B1LT5lbnYuY3B1aWRfbWluX2xldmVsLCAweDE0KTsNCj4gICAgICAgICAgICAgICAgICB9
IGVsc2UgaWYgKGNwdS0+ZW52LmNwdWlkX21pbl9sZXZlbCA8IDB4MTQpIHsgZGlmZiAtLWdpdA0K
PiBhL3RhcmdldC9pMzg2L2NwdS5oIGIvdGFyZ2V0L2kzODYvY3B1LmggaW5kZXggNTFjMWQ1ZjYw
YS4uMWZjZDkzZTM5YSAxMDA2NDQNCj4gLS0tIGEvdGFyZ2V0L2kzODYvY3B1LmgNCj4gKysrIGIv
dGFyZ2V0L2kzODYvY3B1LmgNCj4gQEAgLTU0MSw2ICs1NDEsNyBAQCB0eXBlZGVmIGVudW0gRmVh
dHVyZVdvcmQgew0KPiAgICAgIEZFQVRfVk1YX0VQVF9WUElEX0NBUFMsDQo+ICAgICAgRkVBVF9W
TVhfQkFTSUMsDQo+ICAgICAgRkVBVF9WTVhfVk1GVU5DLA0KPiArICAgIEZFQVRfMTRfMF9FQ1gs
DQo+ICAgICAgRkVBVFVSRV9XT1JEUywNCj4gIH0gRmVhdHVyZVdvcmQ7DQo+IA0KPiBAQCAtNzk3
LDYgKzc5OCw5IEBAIHR5cGVkZWYgdWludDY0X3QgRmVhdHVyZVdvcmRBcnJheVtGRUFUVVJFX1dP
UkRTXTsNCj4gIC8qIEFWWDUxMiBCRmxvYXQxNiBJbnN0cnVjdGlvbiAqLw0KPiAgI2RlZmluZSBD
UFVJRF83XzFfRUFYX0FWWDUxMl9CRjE2ICAgICAgICgxVSA8PCA1KQ0KPiANCj4gKy8qIFBhY2tl
dHMgd2hpY2ggY29udGFpbiBJUCBwYXlsb2FkIGhhdmUgTElQIHZhbHVlcyAqLw0KPiArI2RlZmlu
ZSBDUFVJRF8xNF8wX0VDWF9MSVAgICAgICAgICAgICAgICgxVSA8PCAzMSkNCj4gKw0KPiAgLyog
Q0xaRVJPIGluc3RydWN0aW9uICovDQo+ICAjZGVmaW5lIENQVUlEXzgwMDBfMDAwOF9FQlhfQ0xa
RVJPICAgICAgKDFVIDw8IDApDQo+ICAvKiBBbHdheXMgc2F2ZS9yZXN0b3JlIEZQIGVycm9yIHBv
aW50ZXJzICovDQo+IC0tDQo+IDIuMTguNA0KDQo=

