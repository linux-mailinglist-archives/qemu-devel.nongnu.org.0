Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2127817874E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 01:57:45 +0100 (CET)
Received: from localhost ([::1]:55794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9IM4-0007ks-7O
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 19:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42398)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasper.lowell@bt.com>) id 1j9IK5-0006bb-Go
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 19:55:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasper.lowell@bt.com>) id 1j9IK4-0007iu-CR
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 19:55:41 -0500
Received: from smtpe1.intersmtp.com ([213.121.35.75]:56789)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasper.lowell@bt.com>)
 id 1j9IK3-0007gH-PC
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 19:55:40 -0500
Received: from tpw09926dag09e.domain1.systemhost.net (10.9.202.36) by
 BWP09926080.bt.com (10.36.82.111) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 4 Mar
 2020 00:55:31 +0000
Received: from tpw09926dag17g.domain1.systemhost.net (10.9.212.33) by
 tpw09926dag09e.domain1.systemhost.net (10.9.202.36) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 4 Mar 2020 00:55:36 +0000
Received: from bwp09926084.bt.com (10.36.82.115) by
 tpw09926dag17g.domain1.systemhost.net (10.9.212.33) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4 via Frontend Transport; Wed, 4 Mar 2020 00:55:37
 +0000
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.57) by
 smtpe1.intersmtp.com (10.36.82.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.1713.5; Wed, 4 Mar 2020 00:55:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNJcYvYmMSQuMvZe8I76k0QmYnD15cUyLRFjrTBd/E3q3wGex77HwNaPBa5oTcp6Id8Y+XejLey1Tj1HqMQNdyS9BzV5AUFjsx27hs6HhPkG5JOLE05yH5oUBldHrGTEs49zBDsI+uIIsl3Re+zRje8YAV3RSwpi5JvEMch1fiQ4J8iJNlgXyzK+/tZ6fCnEjq6cgix8mxAZNNB9UsFOC21TaBw4WUe/JxuiG1PhUDk4ykrZ6Oq2PdiIHRuiTloAoK9CxvTMqfZ5lmpdT1u8A73sJwuQqgQw8q588QnxgTHC2I6Pywei6GrcBGyVtKpLKvN7aemhqNyEhgIqkt8Oeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anNNpf2G4VMou2CPKPY37nou7uJrcDZBwBWiAMmm8vM=;
 b=gyLU0Kgay1SxYEnN7GNYMHi356E/tcpQ7/g4WZGMDH+acMJ02F1N5YTDh6xHdD06Zr6x/sFlYmPXARirOmcIvBCB0X6hiwCdbV+Rc6e40CIfn1e7exZzeHj6HWVtM57Yof4taVnNgBtw18eYboOnl2sF98vyxJK/6/BmVRcmGZEpdelwstAlIvg2sjbFAI7K6e2/+LqtgFAPTjpDDYqffd+VrTRNdkDGLqocF+d6OQps8ZbE6a4mudKe1YMPJWGEz+VdiTW4LMwmVAruEgAJ41xAJxdKjSCO/tovAgK+t2KNYA9Cacqy3LZHYg6HIXI6kSxNrGkwP0hftf1FwBmq5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bt.com; dmarc=pass action=none header.from=bt.com; dkim=pass
 header.d=bt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bt.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anNNpf2G4VMou2CPKPY37nou7uJrcDZBwBWiAMmm8vM=;
 b=fgt5v/QxE/BQy6x8mIxy7NbBgxhjKyL2vvyteAaLoui3DdbR1kh++YCxJPgGvaY9n4Xgp1ZXZvtEeSZP+59UQWuj8SvZHoKmz9843L3lJ9bZdxTMuB+77W83s2jgJjae16xTn2LcQ4AvzawtxWVOTJ+Vi61uHcVMVO6iwJtDZ+U=
Received: from LO2P123MB2271.GBRP123.PROD.OUTLOOK.COM (20.176.154.209) by
 LO2P123MB2271.GBRP123.PROD.OUTLOOK.COM (20.176.154.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Wed, 4 Mar 2020 00:55:36 +0000
Received: from LO2P123MB2271.GBRP123.PROD.OUTLOOK.COM
 ([fe80::312f:184d:74b1:28c5]) by LO2P123MB2271.GBRP123.PROD.OUTLOOK.COM
 ([fe80::312f:184d:74b1:28c5%4]) with mapi id 15.20.2772.019; Wed, 4 Mar 2020
 00:55:36 +0000
From: <jasper.lowell@bt.com>
To: <balaton@eik.bme.hu>
Subject: Re: [PATCH] hw/ide: Remove status register read side effect
Thread-Topic: [PATCH] hw/ide: Remove status register read side effect
Thread-Index: AQHV6IMztk0nS91QXUSAhbuFxp1TiagnnJkAgAADjoCAAAXGgIAAvUiAgACESgCAAmZZAIAAvBaAgADuooCAAGA3gIABLrQAgAAM7ICAAF5/AIAIu1oA
Date: Wed, 4 Mar 2020 00:55:36 +0000
Message-ID: <2a5e2ee4af4a45273a47327ad8cc78c9c5cc4663.camel@bt.com>
References: <20200221065015.337915-1-jasper.lowell@bt.com>
 <f432a118-f6be-d6ff-fe37-35b6244f3b97@ilande.co.uk>
 <alpine.LMD.2.03.2002222042370.1577@eik.bme.hu>
 <alpine.LMD.2.03.2002222101580.1577@eik.bme.hu>
 <5f336bc8838b5bfebfcc5829a3fae0a34a2ebac0.camel@bt.com>
 <alpine.BSF.2.22.395.2002231522530.69746@zero.eik.bme.hu>
 <5ca992b3a358610c897d923009fe9f7a8febc17f.camel@bt.com>
 <alpine.BSF.2.22.395.2002251515290.22173@zero.eik.bme.hu>
 <2e972e94627a39cf45504ed244828d065d743910.camel@bt.com>
 <alpine.BSF.2.22.395.2002261109290.39786@zero.eik.bme.hu>
 <e7758063db7312ab052e595a508f0baa70d454dc.camel@bt.com>
 <ec3861e40717ef1ccfba29671e4dd42356e63cf1.camel@bt.com>
 <alpine.BSF.2.22.395.2002271233220.21840@zero.eik.bme.hu>
In-Reply-To: <alpine.BSF.2.22.395.2002271233220.21840@zero.eik.bme.hu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jasper.lowell@bt.com; 
x-originating-ip: [61.68.11.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d28342c-4642-444a-3a14-08d7bfd6c03b
x-ms-traffictypediagnostic: LO2P123MB2271:
x-microsoft-antispam-prvs: <LO2P123MB22711B6006C3BCC18AEA026E83E50@LO2P123MB2271.GBRP123.PROD.OUTLOOK.COM>
x-antispam-2: 1
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0332AACBC3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(189003)(199004)(81166006)(8936002)(8676002)(4326008)(81156014)(6486002)(54906003)(5660300002)(186003)(6506007)(2616005)(6512007)(478600001)(76116006)(91956017)(36756003)(86362001)(66946007)(66556008)(4744005)(71200400001)(2906002)(64756008)(316002)(26005)(6916009)(66476007)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:LO2P123MB2271;
 H:LO2P123MB2271.GBRP123.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bt.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nGsI1P2gw0zfy+P3EPFdoYK6X5idmQkE3LgpHgV8vCdHIhDkDXQbBJIGLp2xwiNKuE+QMFYeVb9W9Tgpo+olUY4M4Igc5qxsw+7EsyZ5UprTop1tu/reIEeUNGykOk6C+QWEXlQPonaaKQXO/Jb2xf/hqjpJNP9ENEsIFEH1GJXxCHUgqedlRRhNQsV3IXB2bfxxRa23+SJTpk3LCuv3BajTgm1SY+E0SzV66G6PchWmNSaess2VUvoLWtViiieh1C13iYoTOddxuD/x2P8A+Ypk2vp/zQMYAXXgoSMgDgRNeuGpCmDSOEnEQ0nLHsmL86XPdy02bgsFrvZ1Qjf9NBGlC6HX0OixIHAyRvsGlgG3yqihmHb2c4TVBwd8NijnqO/uWla/3ztQ/+ixiaz3Lj343+yTUApXUVNxHsg3B09phrLMbr476wgNQsIyNO/Q
x-ms-exchange-antispam-messagedata: hCpdUGpuWNr2i0EVluFjAkIaJRWR4T8qsXLDOccHMf0gJYg5zGqYtLlvpE9g0CH987trDf25qY8ZfKCLOpi/4HfCDLhth4dMTpWGgZOexadrOZ6Q4Uq7u9QBGRxH1uBaW0SkdHPmInVaXjIggSXhTQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE2EAEA591CDAE4CA2F174649DB4E48C@GBRP123.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d28342c-4642-444a-3a14-08d7bfd6c03b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2020 00:55:36.4068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7f35688-9c00-4d5e-ba41-29f146377ab0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u8tYwKCf3Xyf6F68Dyc+KQMYB9qVORhMmOUYKr69CzhRINy2HjzKFKYX4kOoPnUV/j/seq6ltwJ/uwRTMQyZbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P123MB2271
X-OriginatorOrg: bt.com
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.75
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
Cc: mark.cave-ayland@ilande.co.uk, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SSBoYXZlbid0Lg0KDQpJIGRpZCBhIHB1bGwgdGhpcyBtb3JuaW5nIG9uIG1hc3RlciBhbmQgZXZl
cnl0aGluZyBzZWVtcyB0byBiZSB3b3JraW5nDQphZ2Fpbi4gVGhlIHByb2JsZW0gd2FzIGxpa2Vs
eSB0aGUgc2FtZS4NCg0KVGhhbmtzLA0KSmFzcGVyIExvd2VsbC4NCg0KT24gVGh1LCAyMDIwLTAy
LTI3IGF0IDEyOjM1ICswMTAwLCBCQUxBVE9OIFpvbHRhbiB3cm90ZToNCj4gT24gVGh1LCAyNyBG
ZWIgMjAyMCwgamFzcGVyLmxvd2VsbEBidC5jb20gd3JvdGU6DQo+ID4gPiBJJ2xsIHN1Ym1pdCBh
IFJGQyBWMiBwYXRjaCB3aXRoIGEgcHJvcG9zZWQgZml4Lg0KPiA+IA0KPiA+IFRoaXMgd2lsbCBo
YXZlIHRvIHdhaXQuDQo+ID4gDQo+ID4gUmVjZW50IGNvbW1pdHMgaGF2ZSBjYXVzZWQgU29sYXJp
cyAxMCB0byBlcnJvciBvdXQgb2YgYm9vdGluZyBtdWNoDQo+ID4gZWFybGllciB0aGFuIHByZXZp
b3VzbHkuDQo+IA0KPiBDYW4geW91IGJpc2VjdCB3aGljaCBjb21taXQgYnJva2UgaXQ/IElzIGl0
IHRoZSBzYW1lIHRoYXQgY2F1c2VkDQo+IHNsb3duZXNzIA0KPiBmb3IgYXJtIGFuZCBwcGM/IEZv
ciB0aGF0IG9uZSB0aGVyZSBhcmUgcGF0Y2hlcyB0aGF0IHNob3VsZCBmaXggaXQgb24NCj4gdGhl
IA0KPiBsaXN0Lg0KPiANCj4gUmVnYXJkcywNCj4gQkFMQVRPTiBab2x0YW4NCj4gDQo=

