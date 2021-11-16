Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC69F453AED
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 21:25:14 +0100 (CET)
Received: from localhost ([::1]:49706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn50z-0006pW-DQ
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 15:25:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mn4xu-0005O3-A5; Tue, 16 Nov 2021 15:22:02 -0500
Received: from mail-eopbgr790102.outbound.protection.outlook.com
 ([40.107.79.102]:63392 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mn4xr-0002AD-9Q; Tue, 16 Nov 2021 15:22:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLooQKU+YO5503sYrMxsAue72C0o2b5lkUuprZWxsFbY4+3AzV8+xW2FtJUwhPHHiBiwQ6s+AiWyWGVjS761hFUK0qX8h0GolihTQtue9gRwk/FIYFfE1kiXQ5rREv7T1XoYKeL58oDMaUzxmjCTdUKUcuCa5eK6S/3FlzoEepzqAVNB60qOm5Np4r+ewoCJFycZNSBjtuCUk4SPlI+/jCMU5FHXK2p997TJcTt9inhz9lfOGgif24Ink6rFhnB2ElUvo6MBhesXc17f6F1OzLrTbDq1WkgI/1Q5/BLHapVr2scYY2QExBlsBqX5ZCH5peZX+XURgbawZmL9BzxMHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuQPX2uT3Fl+7SbQ6HxZNpQDWjaJzGukobv8Uxn1MxE=;
 b=UGXCRiaQsRsKTyw5O4G3NPXB1x2sWCOaFh3jA/EBlLQnDvGytQ1eOL/wPSakHQQNh0ndSqMtiJir3DKWPyL8hNO+rF26Y+Sne9bokcIBrAJSQ4ljx1GcDyV+vuP92rTDkqBOmgzw3V7KnkJ3mUNPwgGSS06gF0fmzUwdTxDRGbYDdv2qgt9Oa+Z+k6Zily78d7RgE7FBvhsIunNqNGxe8DvBETxFThzHDmRMmYu3wlRpE+J/tlE1vvLs/Ktsdo1VMHm7cN0XL05DYuiX+2cS6Ff9TlXEEknGIaMXW1IxULQF5dpxDFFakvJYpV0p0ZbyNBAsEcNZMWZwFDS95UjIng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuQPX2uT3Fl+7SbQ6HxZNpQDWjaJzGukobv8Uxn1MxE=;
 b=LomPsVICBuF0Jfgomgd7t0pxOUu2/vVSndubwYnhLnz/owoqm4pHUYOrwHYJ7ekkWwf7KDlaHfsRF2ERfnifssH5QIZkzWap0KQu1GxcjlehjTqFv9zUQYuamXAv1KPL7+tDpBBdzzTrsATCrfC5fsLw2eKl6rEd/wA4xqltcHYdAD0UEsJQpa1kEaAPYOTP48E6qIYGSwh967SPQ8PALgYU94KrBghrlQprw/5JS5bFrQkTxNc5018l2EXKe/0xOvkc0jMNWEX+7d6OUHTnm3PJEFQXVnqhWPt1JLNflf72JvFW/7EP9B2V6Sq/n1e9L7yNBHqaxH/4js8+wrkH9w==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4690.lamprd80.prod.outlook.com (2603:10d6:102:49::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17; Tue, 16 Nov
 2021 20:21:52 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 20:21:52 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, QEMU Developers
 <qemu-devel@nongnu.org>, QEMU PowerPC <qemu-ppc@nongnu.org>
Subject: RE: Fwd: New Defects reported by Coverity Scan for QEMU
Thread-Topic: Fwd: New Defects reported by Coverity Scan for QEMU
Thread-Index: AQHX1guLdCLGETwOl0a+xOL7ns5D/awAGIiAgAaBzvA=
Date: Tue, 16 Nov 2021 20:21:50 +0000
Message-ID: <CPXPR80MB5224B99CDBDD24B81FF4CC58DA999@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <618af1a42c458_27197b2b2515bd79b8920c6@prd-scan-dashboard-0.mail>
 <9db2efb6-5161-6c17-f7aa-4d8b7e1aba98@kaod.org>
 <92434193-3727-8994-9ebd-b823665aa90a@eldorado.org.br>
In-Reply-To: <92434193-3727-8994-9ebd-b823665aa90a@eldorado.org.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f23a2b96-b3c8-45bf-ab24-08d9a93eb9ed
x-ms-traffictypediagnostic: CP2PR80MB4690:
x-microsoft-antispam-prvs: <CP2PR80MB46908CA63DA856C83368FB48DA999@CP2PR80MB4690.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iGletU6tv7oF2cPkUMisKw8XbDQv+CNd4GPD+1JhYYrzsqpasmrIJyb/lde66sJ15XOP2Xpp1JxmD/2w41Yok3mifXOrgwZ2mTvoDEx9Wa3PnkNYPPa3oG2cs9HlQdTRa8TfSkCZ61xGXScHom3AFBW+MuuCB+A9B2t3m0ZzfDXwkaLiL/PPbK7mcAVIhSIiBifDw7VZzXJNdpq3yIyG5v690wM85EsG5VaxzmlNpD57YZrkFiEEXjCTCWlYN2XQzefb324c0xD8YNRqgmDuUQcxWryArlcyhVWFd7vbfvsHXldGjK5Ccfy849/CzLd7Cmk5mkcanAmCgUtSTinUGMmnNNAIdYt23MaDVHt6a2Bi47ItzAMQEsdhFe/7oQwm4jpVVk2ZnT/6nmBluwnG3F02jkiBaO1NzXQPrR8A4euTBggOzrxuzQNynWpZGVmjgqYADKAA8y0t9oskpUc+9hJQa7stO4B2xSYcNY5CGZNDokJPNXqVQ3RNSwQWY7iikiJqirnnWOtfssEA6mKycwDxi1QbYSbFx3OfeItjnnUNORzMkhnKcowPZe+/3B4togX0T0cL/8m8Eulj9L3cq8GZj8q+Xv8Vdc/PkAOarmu3fnl7Qr4shjw538Hv7KDYIlnFWIcCYXCN6bXk90HE1dWilh2MrueJdNKW7g8CFPgV3J8r1i96IizuD6cDCc5QAaxtFPu206jjf6ze/rvQkoJCJZi9ZTh17fekubDSQQ/DrcFEyhI+Uot5hJ31gby4lhvK8kAqE9DyQaQ+CIyeQ28O+dt13u7PmUua9dFuUc8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(33656002)(8676002)(66946007)(76116006)(66476007)(38070700005)(83380400001)(66556008)(508600001)(64756008)(66446008)(9686003)(55016002)(316002)(86362001)(6506007)(5660300002)(110136005)(8936002)(122000001)(7696005)(55236004)(38100700002)(66574015)(186003)(71200400001)(26005)(4744005)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ry84TzRyYnBLVmtCRytHbGUxQm9OQmR1Q1BJb0d3WXJUM05FZkdpMld6azRs?=
 =?utf-8?B?UHBLRHIyN2dWcC9CbFdWVzhzUHQvczlZYVJhdzlLcmlvakUrV0U5UlhBTWJi?=
 =?utf-8?B?VER0NHkrcXlDQXdISDR6eE1vMEhwUUFhSlB2S2N3YVRsM2hUbmRhV2xocStp?=
 =?utf-8?B?cjRUL053UlRQR3VDYjVtbG90dE8zNHhvZFQyZkhnNlFVZGV6bzIzc3hyMklp?=
 =?utf-8?B?dThFSnFrR3J3Z2hJT0QxTnZTblJnRmZDR0p2bmhPNStxanU4d1QxZDZPVkt6?=
 =?utf-8?B?bEdmTHFNZGtvK2pCMGllU2ZqMjl3Rm1HaUp6a3VaaFlmN2RPU0RDZzRiTW9o?=
 =?utf-8?B?a2VwcW5kdGo0ZDJYSGFqMzk1ZkFzc2EzSU0xem52aFUySE9iZGpDajNGOVRm?=
 =?utf-8?B?bkRLcVJpa3RQQkUwUWtqakVac0JBbVExbHhLTlMxSW5QcEZGZnc5TEFUcmN2?=
 =?utf-8?B?SnBmUmVHWHFPTWdRRStqU1h5Y25rR2JpdmlqK2Y4UHZ6U2dudXAyU0pzMjZ0?=
 =?utf-8?B?YVYvVzBCYkpKdGtrdnhmOGJsaFVlSkU3ckJmaWMrR3hXNjN5amw5NFpTTU5G?=
 =?utf-8?B?MUhkYUUySkg5bzVDQTJDWTRqbnl2MHZnMlFLZngwY2FwdDNEdWxYcEFWVEFF?=
 =?utf-8?B?blBJUnpXQWdBdk8zVGVEQXhYS292VGVZUUhCZjdNdjBraFNwODg2ZmRnckx3?=
 =?utf-8?B?Zkt2N0JvQ1FvZGczdjlyR3JOMStSek1iRFo2ZFpnYzVBZ0FiUTVRNFMyVFR1?=
 =?utf-8?B?S0k3OGNPM25xSk5jMjdtK0R5cXgvUnVqUWZCRnY0NHNOM2lROGl6a0RaWEJz?=
 =?utf-8?B?T1ZGVVVEZ1FVbC9UYmZ0K0dYR1ltOG81d25ud3dRZkN1K0xHK2hiM2dwYXFw?=
 =?utf-8?B?eklTWUxKWWNpVThEY1BQQ0tmQVl4N3ZKaFMzdSs0MlN1UXlrUjA5VGw0VklL?=
 =?utf-8?B?M3pxYit4cVVZRFhWMk5rRmI2aHVTSFpPSDJRWjRlZ3RIankrUlhqNUM0VXB1?=
 =?utf-8?B?S2liTFptUDFVa0l2bUNXSWhDazZjVnJzUlFjSXZpaDBmbXkxS1RzYy9mRmxV?=
 =?utf-8?B?SGtoeHphb21LRHlCTVFFYU43NGM3STV6eGN1L1I1TXgxRW0zZDc0WVltd2kv?=
 =?utf-8?B?K1pRUlRyWTVIZ0JlTUZoN3prd28zaTRHTEI4UVk0VExwWFFzMmhHa2hkYUNJ?=
 =?utf-8?B?WE9CQWVIQitac3hJL1Y2Y0xtQSs5WVZ3dFVteUhoMHgyZVozZjR5cUtXSkJp?=
 =?utf-8?B?bXg5b2NPUlpkSnJmY2ZRaVk1d3RadnRFWFpVYnJwVEIrU205UEN1dE9PT012?=
 =?utf-8?B?azlTOFNsTm9XamxiWE1jQUJmY29XeTRXaGFzZ3R5aGVpTDZIeCtaY0c3YWNZ?=
 =?utf-8?B?dTBMb3ZLZUFGaDNQeFc4RFdINTU3UkZUeCt4MDY2aHRkRHh1bzM4NFhueld6?=
 =?utf-8?B?UXMzUDZlUXIzZHhORkRTSjdvajIwNjBIQzhPTThNMmlyM2NpTGdJN09hN3Zs?=
 =?utf-8?B?K0l1WFRDeVpNeGE2OXI3R0Eydm1ZMW12ZHIrbFZtblVRZGUzMVVzN29ZY2g3?=
 =?utf-8?B?YTNScnc4WkVGNlZUQkpyeU5TaFJsSVMzWUlVekpuT0IzQjN0VzZVM1l1V09X?=
 =?utf-8?B?dm5kRTVDMDVPOHFYdFIxdnlVT2NTNHo3VHdLTTg0eGNpVWFTanQ3MHkwL0hn?=
 =?utf-8?B?allKVUt4UTdiMDZoTUxxZ0RUcElsWEhOUVJpaG9tVkEzbmNZNk41V2l2WHRr?=
 =?utf-8?B?UG9CVVp5N3lrejRBdno5anMrMG10aXAzMkJZU3VyUkRHanBNYWhYc3Q5ZDJY?=
 =?utf-8?B?NlhOUHUvb3Z2OUdHejVrQVV5VURSTzFycjI2ckRad2RTaXkxNTNjbUtYNXNk?=
 =?utf-8?B?SVp5NFhCenM5a3cvVjlVS1R1VXRGZkdYYkh2TkZQR04vNDNVQXhiWGlwVlIv?=
 =?utf-8?B?WHNDWE1mUVpPcHREeFdBYXpVZzVIOFhZTGxiaTVqVlpPajZJWlRvdHdTMkcz?=
 =?utf-8?B?QnEvdGlidzVVdjBNUDRNM1Bjc3RrZ2tXUktIMFBHakk1MmpyYU0wUXkxVU9E?=
 =?utf-8?B?UmFrc3ZpcUJSeGJQaHo1cHpsRG5zZ3VNSE1VUDNyUzlCeWc0MWtsak1mRXAv?=
 =?utf-8?B?aGh1YzFRQ0xWK1pLTmtXYmoxUGY3Mm51VXZjU0pndzY2UzRDS25TeVdXTVhP?=
 =?utf-8?Q?kyhSf+UUyZHTKXLcoofyzfI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f23a2b96-b3c8-45bf-ab24-08d9a93eb9ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 20:21:52.0983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Am87BZaYR2B81znVDMYlD38QxxqCeGFCU0K/fzz05331JqhS2AN62+cD6rXw1cfMYdd5z8tc5T8+WP4th4Xb4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4690
Received-SPF: pass client-ip=40.107.79.102;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogTWF0aGV1cyBLLiBGZXJzdCA8bWF0aGV1cy5mZXJzdEBlbGRvcmFkby5vcmcuYnI+DQo+
IEhpIEPDqWRyaWMsDQo+IA0KPiBUaGUgb25seSBjaGFuZ2Ugd2FzIHRoZSBoZWxwZXIgbmFtZSB0
aGF0IGlzIG5vdyB1cHBlcmNhc2UsIHNvIG5vdGhpbmcgbmV3DQo+IGhlcmUuIFRoZSB1bmRlcmx5
aW5nIGNhdXNlIGlzIHRoYXQgZGZwX2ZpbmFsaXplX2RlY2ltYWw2NCBvbmx5IHNldHMNCj4gZGZw
LT52dC5Wc3JEKDEpIGFuZCBzZXRfZGZwNjQgcmVjZWl2ZXMgYSBwb2ludGVyIHRvIHRoZSBjb21w
bGV0ZSBzdHJ1Y3QuDQo+IA0KPiBCdXQgc2luY2Ugc2V0X2RmcDY0IGFsc28gb25seSBhY2Nlc3Mg
VnNyRCgxKSwgaXQgc2hvdWxkbid0IGJlIGEgcmVhbA0KPiBwcm9ibGVtIEFGQUlDVC4gVGhlIHNh
bWUgYXBwbGllcyB0byBDSUQgMTQ2NTc3Nn4xNDY1Nzg2IGFuZA0KPiAxNDY1Nzg4fjE0NjU3OTAu
DQoNClJpZ2h0LiBDb3Zlcml0eSBpcyBwcm9iYWJseSByZXBvcnRpbmcgdGhlc2UgYXMgbmV3IGp1
c3QgYmVjYXVzZSB0aGUgaGVscGVyIG1hY3JvcyB3ZXJlIHJlLXdyaXR0ZW4gYXMgcGFydCBvZiB0
aGUgbW92ZSB0byBkZWNvZGV0cmVlLg0KSSBiZWxpZXZlIHRoZXNlIHNob3VsZCBiZSBtYXJrZWQg
YXMgZmFsc2UgcG9zaXRpdmVzLg0KDQpXZSAqY291bGQqIGFsc28gd3JhcCBzZXRfZGZwezY0LDEy
OH0gaW4gbmV3IG1hY3JvcyB0aGF0IHdvdWxkIHRoZW4gcmVmZXJlbmNlIG9ubHkgdGhlIGFwcHJv
cHJpYXRlIHBhcnRzIG9mIGRmcCwgYnV0LCBpbiB0aGlzIGNhc2UsIEkgZG9uJ3QgdGhpbmsgaXQn
cyB3b3J0aCB0aGUgdHJvdWJsZS4NCg0KVGhhbmtzLA0KDQotLQ0KTHVpcyBQaXJlcw0KSW5zdGl0
dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETw0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRw
czovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

