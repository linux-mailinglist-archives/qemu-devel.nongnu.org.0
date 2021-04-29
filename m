Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419B136EEB9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 19:17:23 +0200 (CEST)
Received: from localhost ([::1]:42084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcAHy-0001L7-6k
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 13:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcA8n-0006PQ-Hc; Thu, 29 Apr 2021 13:07:55 -0400
Received: from mail-eopbgr760118.outbound.protection.outlook.com
 ([40.107.76.118]:2097 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcA8l-0006sa-34; Thu, 29 Apr 2021 13:07:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=It2nPEviquacRNip++KRkjL3IgGTVUsrOwbqq2ZROFsbam+cwV5aLRQ2CPAQVfyseq3eUgNlipflynkUiE33f24x882W+ek+8UqaDdlvFy8sUjf9u8wSitM8+1QD6Q90vO76mMl69gDiqcFnqey8Df4p/TMgX3NgVd2rb02FR2C7BaOJxkfz88RFMps4D2186UFjHJ1b9QFNoy4+qKHlmhRtcZSZkk96fhcvWmhUA395Zi+S5iCaIMaE+iDuD2svxClk+U9FUe1kQVK2HWeDUkPPfibaw2XFxxVaCBwvOlOcAm/KMZfk3G2lTb622nPd3dKr7bt9G6MrcTSz9oHhdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOKJA4Eu3k95QupwvOcJwnb0VPbEDvGcT1ofm6OohBE=;
 b=cyaS/BK0r1+gbQUCGX/9wyr2nyXWkFzELunH7lMB4WtT7WMeWtAcThc+6gtO7Cn1cKMY/iJW7WguAagdnD6Vj+QxBRr2rybMrnL3hU0PiPYUDfE5NIJH9VjG6O0M3XLcoY6m3hvWgaqcG0qTiROAzwjRwd6KQP6garnP8Dx+GWCaV20dPeksPJdYnkF4Uw1AYRkg1pg/q0O4YaUgRboj9wWVnDVCw5iqKkIVUBwC4EUyKf3MGiy+tCqy0EYkkZqsDozqKdbjpGDuTvAFo1YOQfl9nmfCNUA6oM1iTTW/rKAJcdrl4ItBrGlwjVHNvB75wSPBwAP/UBcp49hRE0vcUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOKJA4Eu3k95QupwvOcJwnb0VPbEDvGcT1ofm6OohBE=;
 b=tZ7Jz8oIMs+bTQsSTXyFX8NgkCIga3oxsr7Tfp265MoEI+8JjxNZwXPqg3KknaduIn+8ceRqVzFiaMqrXETk8RRnJgPGo4Ykk6Yvpz/35UQQ5NIi033a33nTIfe3JkgW5PhA31/VMDFmfdaCSKB07ZmFhfUPoWgAnZE0rxb1h4uDWB4ce6JAquULnRY96RanWNkpbRShh5FVUIJxiBWyBTL9phKi7lZ8hG/w3b7RNb+IxS7JW7Y6SbJf/0PrJ43tZZdfi3T3D5r5PfM5rmcp51JKXZbtozkNEzM4+vRhr1OWtL9dRewhEjYrpwz4FNAiz7utZE0ZlBEy2Q3UHyC+bg==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CPXPR80MB5256.lamprd80.prod.outlook.com (2603:10d6:103:4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 29 Apr
 2021 17:07:44 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d%2]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 17:07:44 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
Subject: RE: [PATCH v2 04/15] target/ppc: Move DISAS_NORETURN setting into
 gen_exception*
Thread-Topic: [PATCH v2 04/15] target/ppc: Move DISAS_NORETURN setting into
 gen_exception*
Thread-Index: AQHXO4lCCycEb65DY0iSqM9hQjd4Z6rKCM0AgAGxlPA=
Date: Thu, 29 Apr 2021 17:07:44 +0000
Message-ID: <CP2PR80MB3668FC30589403AB99F1F66CDA5F9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210427171649.364699-1-luis.pires@eldorado.org.br>
 <20210427171649.364699-5-luis.pires@eldorado.org.br>
 <905b2240-82b9-cdaf-922a-0d334a7288a7@linaro.org>
In-Reply-To: <905b2240-82b9-cdaf-922a-0d334a7288a7@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [187.10.24.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6efc09f-bed4-44d9-c2d0-08d90b314e25
x-ms-traffictypediagnostic: CPXPR80MB5256:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CPXPR80MB525671A51655139972FEDFAEDA5F9@CPXPR80MB5256.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iH8ZkuoXBzfR4RseUH1hxcB1b5QKJywoofmrLVfkJfKjQiiOZEyn2Z3l4QSRi4GYQqRTVMnSigrtaU3PQwLjMibaI2jw2INZB0KZRqeBr8Kp5boAd1hUxQwD/rYDrIgk2Ai1J83XNGyd29Ap7qam2o/Mm87R+cR6RaZB3UBYrDC3J96XMFBljDBOGwIy0iIqlS9Rf0pZRZrui7gIuSVK+xfkBpAtZYI4hChGMEkyNhjaRVQOFFIi8oOtXtaE+3kadpkBKL+iYZscVzQtxt1p4vahYsNMq1Cdem2/NlWxSHckUOsdhWCZ83JD8g1lPzxurhi3oRP2Bpbada1ZYW07+8Ul3SSrR1T2qhhJJZ+c/XdVoO6vkjwEKn4vPv9nUR8y62B3m+Lfw68NMAVMvlP43xoFIFB9mJQJZMmHOxtEB1GsC0m54Dp4fDPGVGir7zI2ceHBVMmsY3wBFnc9s8ucYiKYNq/shYidD9SC547CKjJ1R2vypE1KjpCm+ojbg0TJJeW3TKOiirGn/vTm3SCjb5K6s0+KAjCjJjvJJRdk/g+n+PrBsSpzqd9mRADAqqvQUEQZKxRUfkBO/LZfoJN50F2PnVikh7s6QYehFFiKBXw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(39830400003)(136003)(346002)(396003)(33656002)(66946007)(76116006)(86362001)(52536014)(122000001)(38100700002)(2906002)(7696005)(4326008)(71200400001)(26005)(9686003)(186003)(55016002)(66446008)(66556008)(66476007)(64756008)(5660300002)(83380400001)(478600001)(8676002)(6506007)(8936002)(54906003)(316002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?djBMekRPalRjYW9FcURiWDgrMnR3MUtqOXZudldsSDdiNEsxU0RxN082QTFW?=
 =?utf-8?B?Rm1oUm0weEZIVFJoTWNNblZmeVJIQit3QktHU3ZOSGxiaG1LVHpWZ0kxeHBu?=
 =?utf-8?B?R3hPOC9oMHFwbmhkV1JGYjJwcEZHSnZmSHhabWI3ZWRvK3lvVk9VMmMrMm5C?=
 =?utf-8?B?eHNib29zRGZnUU9rNmpUZXBINitzd1NFL003S05ZamV0b2ROeG9YNFJJM3dl?=
 =?utf-8?B?dlJQd0oyMTdoR2VmRXg1V0taWlJCbU5IMVBodjRXZXlEelZydEYzYmdVb2VZ?=
 =?utf-8?B?TG55TW5SZCtZTmNLWjdwQWI0SEQ1VW50c2xTaUxEYVBLNjltWWJVNUpaV1Zx?=
 =?utf-8?B?MTRFL2k4MTdvWjAycmRLcnlMblhHY3I3SUZ2SEIvbk1WVVlyZ0RkM1BzS2Ro?=
 =?utf-8?B?Y0V6NlRXMVkvNWJQR3hKSnpMekplWGZGYVR3R2pYcURNKzRiUHNRRmx2R0Uz?=
 =?utf-8?B?TDBTdnVZR0treUx1RisrUFM1dWVCczY1blB0SllHaldWR0RlSkd0dWxjYzFX?=
 =?utf-8?B?VnpUTGVrVGNEY3FyUUlpMXBsek1HbGlMWWh5L2dnc2xCZzdGNmhMRC9lNzZT?=
 =?utf-8?B?S3poTUx6Rzdzc29mRm14b25qTlhrV3hjcGFXMGhCVTgreWNJTERFcGswUDgz?=
 =?utf-8?B?cVZ4eGlnYzNqUXlneXJEMnRVSUd5TUY5UlQ1azU3MW4yUFhSNk1SY1doWm1p?=
 =?utf-8?B?bTYwUXp2emY5WDVTWjM3V3E0MEw3M3dJMUZJcytwTUNySTJYUER4UEdBNXNp?=
 =?utf-8?B?OE9GM3U3bENyWk9IVElpV1ByQTU4dXZ1ZjdaSkNacElrSnliSk52R3ZWb21W?=
 =?utf-8?B?UitGT0phOThiTkFyNEpTQmd6TnVhdkVYSmFSbWF6dUZkNlhGSDJnUTIySWpO?=
 =?utf-8?B?ZnNXWER3aGliVmZFb1gzcHY4UlVINmFPRmhaUnVxdzJkUjFka1djU1VXcCtR?=
 =?utf-8?B?WmNuZ3pLUjRRRXlJSUFNcm5HWXRoNUkvWU1rL2M5ZTBJTm1zZmtacVUycHNL?=
 =?utf-8?B?dHE2MUxzajZTTnAxNk5YWWsyMlhwaXdHdnEwZGdSK0s4VmxjbmZuQlhONTlN?=
 =?utf-8?B?eDZTbUxhYVVMSFlwaUhweDNaN1liajNIQnVWY2FEM0VjUDR1RVBmOXBZd3Rr?=
 =?utf-8?B?eFhmcFJNdVZscStQMjJUekNhYlowUlJEenFIMkJnTFR1OUFJYmFYcnBkR3oy?=
 =?utf-8?B?SFNrcmRYVWtsa0Y0NFF3RmVOa05hY0NZM3cwNEZVVjNXWDlnSTFmeTl3eldw?=
 =?utf-8?B?S0N0bVRzVWJCRkU4UzVob01mOE44T2ZleWVoS0tkQ1grMnRHT3hESXk5ZnV3?=
 =?utf-8?B?dk1BVEgyb09hZzVVVVFBaGdTYXVXMGRjQUZJZmU1Tk9QdVpNMWltdXVCRzBJ?=
 =?utf-8?B?d2FvUXQzOTl5UXlvYy9Rb0lEbXhtYVVuVksxcTJxNHR0TzZTK3VRZFdjaGdD?=
 =?utf-8?B?MUZZQ0IwTDJOWFkrWE1Ua042WGszL3RFZENCKzJtMkxEdUdyZExUYVZTbWZU?=
 =?utf-8?B?NzA4bm80YUtKRk91emE0M2JzV0d5VGdpTVY4R3ZMV3U5YVRkUU5lalhJdDVR?=
 =?utf-8?B?bXJITkY3ZE9kdUFsZmgxL0VxNGo1YVFpRFhYbWNpV2RXeTVMZmRBM1ZMTXlw?=
 =?utf-8?B?MnFwSHJvc1Vxc0FQQ0V6ZGRmcGhDYlNMYlIvTFVsU2JyeFRxK1l1d0JpRmZC?=
 =?utf-8?B?NlBhcUZkVitvN0lwZmFGQU0wQW1kc3l0c3ZVR3RITFNVcGc4QTZveWhsbDBO?=
 =?utf-8?Q?TMJOcYfJYlyoIekL5w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6efc09f-bed4-44d9-c2d0-08d90b314e25
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 17:07:44.0757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B80lRB7aM2QMJYdQVGR/b45KTwnfScMOcVSY+5s2jIZLLUqKW6CdekE2gg3x9YvrlI5REd3K0DEXm1BPQUf2Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB5256
Received-SPF: pass client-ip=40.107.76.118;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-CY1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiA+IC1zdGF0aWMgaW5saW5lIHZvaWQgZ2VuX3N0b3BfZXhjZXB0aW9uKERpc2FzQ29udGV4dCAq
Y3R4KQ0KPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgZ2VuX2VuZF90Yl9leGNlcHRpb24oRGlzYXND
b250ZXh0ICpjdHgsIHVpbnQzMl90DQo+ID4gK2V4Y3ApDQo+ID4gICB7DQo+ID4gLSAgICBnZW5f
dXBkYXRlX25pcChjdHgsIGN0eC0+YmFzZS5wY19uZXh0KTsNCj4gPiAtICAgIGN0eC0+ZXhjZXB0
aW9uID0gUE9XRVJQQ19FWENQX1NUT1A7DQo+ID4gKyAgICAvKiBObyBuZWVkIHRvIHVwZGF0ZSBu
aXAgZm9yIFNZTkMvQlJBTkNILCBhcyBleGVjdXRpb24gZmxvdyB3aWxsIGNoYW5nZQ0KPiAqLw0K
PiA+ICsgICAgaWYgKChleGNwICE9IFBPV0VSUENfRVhDUF9TWU5DKSAmJg0KPiA+ICsgICAgICAg
IChleGNwICE9IFBPV0VSUENfRVhDUF9CUkFOQ0gpKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAg
IGdlbl91cGRhdGVfbmlwKGN0eCwgY3R4LT5iYXNlLnBjX25leHQpOw0KPiA+ICsgICAgfQ0KPiA+
ICsgICAgY3R4LT5leGNlcHRpb24gPSBleGNwOw0KPiA+ICsgICAgY3R4LT5iYXNlLmlzX2ptcCA9
IERJU0FTX05PUkVUVVJOOw0KPiA+ICAgfQ0KPiANCj4gSG1tLiAgWW91IGRpZG4ndCBhY3R1YWxs
eSByYWlzZSB0aGUgZXhjZXB0aW9uLCBzbyB5b3UgY2FuJ3Qgc2V0DQo+IERJU0FTX05PUkVUVVJO
IHRoYXQgd2F5LiAgSXQgbG9va3MgbGlrZSB5b3Ugc2hvdWxkIGJlIHVzaW5nDQo+IGdlbl9leGNl
cHRpb25fbmlwKCkuDQoNClRoaXMgaXMgcmVwcm9kdWNpbmcgdGhlIGJlaGF2aW9yIHRoYXQgd2Fz
IGltcGxlbWVudGVkIGJlZm9yZSB0aGUgRElTQVNfTk9SRVRVUk4gY2hhbmdlcywgdGhhdCBjYXVz
ZWQgY2hlY2stdGNnIHRvIGZhaWwgd2l0aCBhbiBhc3NlcnRpb24gb3RoZXJ3aXNlLg0KDQpJSVVD
LCBQT1dFUlBDX0VYQ1Bfe1NUT1AsU1lOQyxCUkFOQ0h9IGFyZSBub3QgcmVhbGx5IGV4Y2VwdGlv
bnMgYW5kLCBpbiB0aGVzZSBjYXNlcywgY3R4LT5leGNlcHRpb24gaXMgYmVpbmcgdXNlZCBqdXN0
IHRvIGNhdXNlICBwcGNfdHJfdHJhbnNsYXRlX2luc24oKSB0byBlbmQgdGhlIHRyYW5zbGF0aW9u
IGJsb2NrLiBJZiBzbywgd2Ugc2hvdWxkIG5vdCBiZSB1c2luZyBjdHgtPmV4Y2VwdGlvbiBmb3Ig
dGhhdCwgYnV0IEkgYmVsaWV2ZSBmaXhpbmcgdGhhdCB0byBub3QgdXNlIGN0eC0+ZXhjZXB0aW9u
IGJlbG9uZ3MgaW4gYSBzZXBhcmF0ZSBzdGFuZC1hbG9uZSBwYXRjaC4NCg0KPiANCj4gQW5kIGFz
IHNpZGUgbm90ZXM6ICgxKSBubyBuZWVkIGZvciBleHRyYSBwYXJlbnRoZXNlcywgKDIpIGJyYWNl
IGlzIG1pc3BsYWNlZC4NCj4gDQo+IA0KPiByfg0K

