Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CBA5BEAFD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 18:19:10 +0200 (CEST)
Received: from localhost ([::1]:45578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oafxl-0003Ft-2U
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 12:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaoyuan0123@outlook.com>)
 id 1oacyN-0005FZ-3O
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 09:07:40 -0400
Received: from mail-sy4aus01olkn20818.outbound.protection.outlook.com
 ([2a01:111:f403:7005::818]:6180
 helo=AUS01-SY4-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaoyuan0123@outlook.com>)
 id 1oacyJ-0000LK-QA
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 09:07:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zlq75Ux6rw86VtvGpHnriK/O7GcWEVNjk4iQluuaMHvAaRVLOII9od1qs+W9ZXwCkjr0vKlRH2ITkKCqSEPCSaTArOTwXNzJmTeLKFYqrhQGFDuhOL5XsB2nhz7mkRpKxysInRnoyfs9DBfW6yIf5ODYFp+NXJB9yf/03f6NCebb2Bi/veXp426VQs0HLk18HOWBapKRtbjy1wHVz+4T9e1ZlgxDTbzieYLXbE6xoL8GlStnS+ipSAmx5fe6+mkuw7UPWNLlzoa8F92UoBdfh5oTfSibUwSz0849CnJprcSLc6b2veSD7TTc76EAFT0xeMcy9OncJTYT3e3qyEEqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaeljpA75SR+OHwiAbdCSDQhVIhTfic/tRTyIMFvqxs=;
 b=czuHYTnjJ8rphUGtfkXcyUYjmCx2eiKYahXEItwPpMb4qmweFP/km+MpXg+vNxkhWpVcR0RSRUi8jMBxW71TR5TiIZg0mIdAqxTSLHJDD+9O2br20pDmIUlKUPff7/lfIhkx+sMNeO2Jee6MYapYQeIgoJDHgGNOKZwQ/lUhYGIFlOkpeHNRtCykkmrZVuYk8hgXkznzj6W9EDVE7Nt8EQfRAIrCupHnRbaxM4AxCTJXqCtoMfcZQl3txpXpC1/1X79mJ8aw7wt0CiDr4+brJ9TIbPpUlw/S6NOBqJuPH4lNrJUopSf+YS/+QkNNWQJBJKTZF3vupx+OutGmmnitgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaeljpA75SR+OHwiAbdCSDQhVIhTfic/tRTyIMFvqxs=;
 b=DSai7+XdgSNkwoioBpSVXX2owr6UmYbR3fYIrGLfxm/dZ3+BrjyqfqK1h3cRdYeFJVa0+huPfhawQkWGRtTkr86QZPDmge26l9rHGp/PodRqica5B0BGJ45Dy69k87UgdNex/PwSu9asC8SZ4wvT1rC8pRqiAFrWDuE6x/O+Uw1hhEAvN+uvGAcKz0YjVJe3gbXwOAt+ihj6+TAWhTtOTv17chbaiWyGjt3MNeL9Aw8HwRUCmNbNFIissz2kO/DSUBGdeCEVi5EL/stE/zW/HTHYJmiIkEEHN1H5G6fZxAJJ1wGaBoganSE4dJ7O2FQzBY0mqm7vcX5jxyffi3Ia1Q==
Received: from ME3P282MB1954.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:b1::11)
 by MEYP282MB2165.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:c3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Tue, 20 Sep
 2022 13:02:23 +0000
Received: from ME3P282MB1954.AUSP282.PROD.OUTLOOK.COM
 ([fe80::bd4a:5f3c:7d4f:7ed3]) by ME3P282MB1954.AUSP282.PROD.OUTLOOK.COM
 ([fe80::bd4a:5f3c:7d4f:7ed3%7]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 13:02:23 +0000
From: YAO YUAN <yaoyuan0123@outlook.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: loongson3-virt machine does not support if=ide,bus=0,unit=0
Thread-Topic: loongson3-virt machine does not support if=ide,bus=0,unit=0
Thread-Index: AQHYzPE5RElKwYpeK0Odx6lavMG++w==
Date: Tue, 20 Sep 2022 13:02:22 +0000
Message-ID: <8F922009-53DB-47D0-A935-A603ABBC164E@outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [lw0znR8dyeJ6WcYoOEWr8wJkVCeM0t45kdjBWMDcG8gVkIx+8IhZFCVtBqvuoYH7p59XS2iZolw=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ME3P282MB1954:EE_|MEYP282MB2165:EE_
x-ms-office365-filtering-correlation-id: c88a9cb7-a94b-4d4e-5582-08da9b085bc3
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WXeTORE5anc3MXw2pGDec4oG4x8r/p+cvi5IIPwtw9a9603fPmO7ltg/bfraKUncHZfq/TyjhV3WMlFx8kvhd5nQonHdWt251L8w4xYPmMNBdApVPZYrVkPMfTIr0FMrzipaSWrlquMVKLk/Ie3P0RIAbA8jzI/fEN4Uq1yv1lL5wXQ5hygAzy+nfxwL36OVllKYO8+al1QVLtakW+aF1ATgFIRSGGJFo5nbQWYF/pqPlmF+oEihTzRVIRfKRkcmTa0I0Z7qZEf9T/tiOZFaqRp+Npjb+aowpvwHjY2K9K0xLNv7H73+vSz5/pVrIHj3fbW44MbAtT07RHxkeSK9hO3mvJVsEislW78a1Mp05tNZzmOBI7+T38l8rFLh/usMCDX/YSxcY/tTYkYruRLfaxgswzAs7m36o1XdBeH/TILx5zEu7S/aMszwwc3rM7AL+5stqSJhDURMOxxU34LirGuFKHSWDtxEs64DkyC2N1EbZ3Nndurf0NqsKxKqmCsewv5ux0IgpRiwBP6LTmrzYLNa25MwSv7GiJlCqci9uOSyht/y3CV5GPOEe9cC1pyPzUwk/wRvLYyBjPs1A0BP9Tsiglfo2HxQZ2zz2yB+VJAmNcapDXrOm7LKxd25Zb3kAQO7BGCJ+5TnocWBrtKuXQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckIwK0szS1BlR2pIejRWTjM5RUVIMjkybGwzdk1OM1hVbE13UGxycUpVWFZV?=
 =?utf-8?B?U1I0REovb0d3bVhzRDNzOFlna0lpNnJtN3N1bXlYdVlCQU5hei9ITDVuQ2Qw?=
 =?utf-8?B?Ynk3N3BUV2lTRVFiNHUyRndUekpqY0gwc00yVERqNnNoakk5eFNGaE5IbVV6?=
 =?utf-8?B?MHZ5dEtjNGdlbTdIRU5SM1FGMkVvU1pnUnpqdmwvS3JnUE5MaXM3K3hTbkRr?=
 =?utf-8?B?SGFPUXBubm1PN0tjSVZUUlhKZDJnNHhIOVZDWnE3bmp1Mkx3WHl5Zkh2TUd0?=
 =?utf-8?B?V081TzhyZDBFVVZrek1tSlVhNmZFMlQwTE5LUmpVZThjSkFUNjd3SElTWmpj?=
 =?utf-8?B?M0txbUVMdjkzY0VNd1pLdk1STFJ4TlBUR2dWRzl6MFo0YVFBdzhsQ1ByK0hM?=
 =?utf-8?B?MjJqb1BDbDNyMHNJQ04yTTc1WGliaEIrSjRhaGJqN28vZmdXa1NHVmczUHZG?=
 =?utf-8?B?WVRzQ1hMdGhXUUJsVEtPQkMxS3l3L2JTaVBYVkhNYXJPM0hrMmF1ZXhUN3Nz?=
 =?utf-8?B?bGZNeHN6UEZnOWZhb052TkdWQTEyK0pUSHZPTE8zZzhzeis3SDhQNXhhdysr?=
 =?utf-8?B?Q0tEMTgzdHk5ZkRUdDBBbzhVa3YxOEdHN2tKdlFrbkNRTFBhbUpscjFYK2VT?=
 =?utf-8?B?azQ0dDBRSTUwMytuUENnTFNTSmgxZzRnOVNiSEJzOVB6aHQ2MC82UVlVZUg0?=
 =?utf-8?B?UTcyM0pjQ3BUM3hFdjZDU25RdUlSOVFib2pXUnc1Vk1CL3JKYnJadTBqNGhC?=
 =?utf-8?B?MHd6bHlueG5FMFVpTENLbVRxV2ZSZVhDZFNmNjBjSkN5bGNPQXVaR3d3WW5l?=
 =?utf-8?B?Y3lKakdzWThtK1hSc1NPNGVBT0NHNG1zRUtOZzVHZHFRRE1XN0tDK2srNXRG?=
 =?utf-8?B?ZmpWOXVSbVUyQStRWXNkNmx1TDQyKzFYNDFGMjVHRGNGUldyd3F4L1I1bExk?=
 =?utf-8?B?OUNSUUFkSlVYTlQwaExUcHVSUjZjWmlMbmNIUFZXLzB0TnR6MGhqNFNrMjRq?=
 =?utf-8?B?c254YVkxc3lEdzQyaUNrTU5Qc3BJU005Rk1zcVRnQk02RmcyUGRvT2V2Sytk?=
 =?utf-8?B?RDdLLzdUQ2JNZGZocnFxZnd5Q04vbE9yT0k3bnJnNXhXa3FPSWVMVngzTDlv?=
 =?utf-8?B?dUFyRDVNK1lkeS9UejlwdHk3ZE5ZbzUzVTF6cFk2NzZITWd5eittZHliUjFm?=
 =?utf-8?B?aTRXTFJDVHNLMURIYzgveVRXZTlTMlB1UGhrSkZXTjBHZVJnME9sSjNRcEQr?=
 =?utf-8?B?YmhqZENaZEVMMzkyUTVWL09neW1yWCtmR3lrdmhzRUluUkU4YXVtOWhjLzBL?=
 =?utf-8?B?VFNYYnN0bWR3NG1FZmZmY2l0cW84bXo3N1llQ1R2WTgrM0N4U0huUWlVR1NS?=
 =?utf-8?B?QXc2dGhMMDdDZ05UN0NwcjhKVzlWaHN4UXQyMVMvY1RBT1V3SzFJOU9SNHdD?=
 =?utf-8?B?czNsblN0ZGNSMkIyM1hrdXFNbVNrWEZpNFRPYXRyK2cxSFZTMGtJRmFBU29Q?=
 =?utf-8?B?UmswdmpteitIZmNxanpGSmNOdU5GR3J3ZTBHRkRpWVNWVGQwSHVYRE1IdlZw?=
 =?utf-8?B?akhjcUViNFdpRGtLYVNieUxQYU9jRWNtYmdpTU85L1NDYUxsQXAwc1hEbjQ3?=
 =?utf-8?B?T20rOUd3NkQrVGt0M1V2QzJwWWRTS1lWNkF1YmM4SktaYmhsK015VFVIcFBp?=
 =?utf-8?B?ZElwM2VjemdsOWVBV2lINTdDV0E2Uk9UKzBudVVRYURqS0dGN3NFcDY4aW9Q?=
 =?utf-8?B?SnBzdnhRdjFITHRXd2laREgwSmt0a28zMGZXRm1TRHl6WGtlUVplWmsxS1li?=
 =?utf-8?Q?Y9tDnvr0SBOBWEVJynmo2l5KM981687OVYzlM=3D?=
Content-Type: multipart/alternative;
 boundary="_000_8F92200953DB47D0A935A603ABBC164Eoutlookcom_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB1954.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c88a9cb7-a94b-4d4e-5582-08da9b085bc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 13:02:22.7762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYP282MB2165
Received-SPF: pass client-ip=2a01:111:f403:7005::818;
 envelope-from=yaoyuan0123@outlook.com;
 helo=AUS01-SY4-obe.outbound.protection.outlook.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HK_RANDOM_ENVFROM=1, HK_RANDOM_FROM=0.999,
 HTML_MESSAGE=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 20 Sep 2022 10:52:25 -0400
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

--_000_8F92200953DB47D0A935A603ABBC164Eoutlookcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBjcmVhdGUgdGhlIGRpc2sgd2l0aA0KcWVtdS1pbWcgY3JlYXRlIC1mIHFjb3cyIHpia3lsaW5f
bWlwczY0ZWwuaW1nIDUwRw0KDQpUaGVuLCBzdGFydCB0aGUgbWFjaGluZSB3aXRoDQpxZW11LXN5
c3RlbS1taXBzNjRlbCAtTSBsb29uZ3NvbjMtdmlydCAtYmlvcyBwbW9uLTNhdmlydC5iaW4gLWhk
YSB6Ymt5bGluX21pcHM2NGVsLmltZw0KDQpBbmQgZ2V0IHRoZSBmb2xsb3dpbmcgZXJyb3IuDQpx
ZW11LXN5c3RlbS1taXBzNjRlbDogLWhkYSB6Ymt5bGluX21pcHM2NGVsLmltZzogbWFjaGluZSB0
eXBlIGRvZXMgbm90IHN1cHBvcnQgaWY9aWRlLGJ1cz0wLHVuaXQ9MA0KDQpJZiBJIGRvbuKAmXQg
cGFzcyB0aGUgYmlvcyBvcHRpb24sIHRoZW4gSSBnZXQgdGhpcyBlcnJvci4NCnFlbXUtc3lzdGVt
LW1pcHM2NGVsOiBDb3VsZCBub3QgbG9hZCBNSVBTIGJpb3MgJyhudWxsKScNCg0KSG93IHNob3Vs
ZCBJIGZpeCB0aGUgZXJyb3I/IFRoYW5rIHlvdSENCg0KUUVNVSBWZXJzaW9uOg0KNi4yLjAsIDcu
MS4wDQoNClBsYXRmb3JtOg0KbWFjT1MgTW9udGVyZXksIEludGVsIENvcmUgaTcNCg==

--_000_8F92200953DB47D0A935A603ABBC164Eoutlookcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <DED3D2D517DD8D4B9161B5886B6ECA67@AUSP282.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCkkgY3JlYXRlIHRoZSBkaXNrIHdpdGgmbmJzcDsN
CjxkaXYgY2xhc3M9IiI+DQo8ZGl2IHN0eWxlPSJtYXJnaW46IDBweDsgZm9udC1zdHJldGNoOiBu
b3JtYWw7IGZvbnQtc2l6ZTogMTFweDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6
IE1lbmxvOyBjb2xvcjogcmdiKDAsIDAsIDApOyIgY2xhc3M9IiI+DQo8c3BhbiBzdHlsZT0iZm9u
dC12YXJpYW50LWxpZ2F0dXJlczogbm8tY29tbW9uLWxpZ2F0dXJlcyIgY2xhc3M9IiI+cWVtdS1p
bWcgY3JlYXRlIC1mIHFjb3cyIHpia3lsaW5fbWlwczY0ZWwuaW1nIDUwRzwvc3Bhbj48L2Rpdj4N
CjwvZGl2Pg0KPGRpdiBzdHlsZT0ibWFyZ2luOiAwcHg7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBm
b250LXNpemU6IDExcHg7IGxpbmUtaGVpZ2h0OiBub3JtYWw7IGZvbnQtZmFtaWx5OiBNZW5sbzsg
Y29sb3I6IHJnYigwLCAwLCAwKTsiIGNsYXNzPSIiPg0KPHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFu
dC1saWdhdHVyZXM6IG5vLWNvbW1vbi1saWdhdHVyZXMiIGNsYXNzPSIiPjxiciBjbGFzcz0iIj4N
Cjwvc3Bhbj48L2Rpdj4NCjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4OyBmb250LXN0cmV0Y2g6IG5v
cm1hbDsgZm9udC1zaXplOiAxMXB4OyBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250LWZhbWlseTog
TWVubG87IGNvbG9yOiByZ2IoMCwgMCwgMCk7IiBjbGFzcz0iIj4NClRoZW4sIHN0YXJ0IHRoZSBt
YWNoaW5lIHdpdGgmbmJzcDs8L2Rpdj4NCjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4OyBmb250LXN0
cmV0Y2g6IG5vcm1hbDsgZm9udC1zaXplOiAxMXB4OyBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250
LWZhbWlseTogTWVubG87IGNvbG9yOiByZ2IoMCwgMCwgMCk7IiBjbGFzcz0iIj4NCjxkaXYgc3R5
bGU9Im1hcmdpbjogMHB4OyBmb250LXN0cmV0Y2g6IG5vcm1hbDsgbGluZS1oZWlnaHQ6IG5vcm1h
bDsiIGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBuby1jb21t
b24tbGlnYXR1cmVzIiBjbGFzcz0iIj5xZW11LXN5c3RlbS1taXBzNjRlbCAtTSBsb29uZ3NvbjMt
dmlydCAtYmlvcyBwbW9uLTNhdmlydC5iaW4gLWhkYSB6Ymt5bGluX21pcHM2NGVsLmltZzwvc3Bh
bj48L2Rpdj4NCjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4OyBmb250LXN0cmV0Y2g6IG5vcm1hbDsg
bGluZS1oZWlnaHQ6IG5vcm1hbDsiIGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJmb250LXZhcmlhbnQt
bGlnYXR1cmVzOiBuby1jb21tb24tbGlnYXR1cmVzIiBjbGFzcz0iIj48YnIgY2xhc3M9IiI+DQo8
L3NwYW4+PC9kaXY+DQo8ZGl2IHN0eWxlPSJtYXJnaW46IDBweDsgZm9udC1zdHJldGNoOiBub3Jt
YWw7IGxpbmUtaGVpZ2h0OiBub3JtYWw7IiBjbGFzcz0iIj48c3BhbiBzdHlsZT0iZm9udC12YXJp
YW50LWxpZ2F0dXJlczogbm8tY29tbW9uLWxpZ2F0dXJlcyIgY2xhc3M9IiI+QW5kIGdldCB0aGUg
Zm9sbG93aW5nIGVycm9yLjwvc3Bhbj48L2Rpdj4NCjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4OyBm
b250LXN0cmV0Y2g6IG5vcm1hbDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsiIGNsYXNzPSIiPjxzcGFu
IHN0eWxlPSJmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBuby1jb21tb24tbGlnYXR1cmVzIiBjbGFz
cz0iIj5xZW11LXN5c3RlbS1taXBzNjRlbDogLWhkYSB6Ymt5bGluX21pcHM2NGVsLmltZzogbWFj
aGluZSB0eXBlIGRvZXMgbm90IHN1cHBvcnQgaWY9aWRlLGJ1cz0wLHVuaXQ9MDwvc3Bhbj48L2Rp
dj4NCjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4OyBmb250LXN0cmV0Y2g6IG5vcm1hbDsgbGluZS1o
ZWlnaHQ6IG5vcm1hbDsiIGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJmb250LXZhcmlhbnQtbGlnYXR1
cmVzOiBuby1jb21tb24tbGlnYXR1cmVzIiBjbGFzcz0iIj48YnIgY2xhc3M9IiI+DQo8L3NwYW4+
PC9kaXY+DQo8ZGl2IHN0eWxlPSJtYXJnaW46IDBweDsgZm9udC1zdHJldGNoOiBub3JtYWw7IGxp
bmUtaGVpZ2h0OiBub3JtYWw7IiBjbGFzcz0iIj48c3BhbiBzdHlsZT0iZm9udC12YXJpYW50LWxp
Z2F0dXJlczogbm8tY29tbW9uLWxpZ2F0dXJlcyIgY2xhc3M9IiI+SWYgSSBkb27igJl0IHBhc3Mg
dGhlIGJpb3Mgb3B0aW9uLCB0aGVuIEkgZ2V0IHRoaXMgZXJyb3IuPC9zcGFuPjwvZGl2Pg0KPGRp
diBzdHlsZT0ibWFyZ2luOiAwcHg7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBsaW5lLWhlaWdodDog
bm9ybWFsOyIgY2xhc3M9IiI+PHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5v
LWNvbW1vbi1saWdhdHVyZXMiIGNsYXNzPSIiPnFlbXUtc3lzdGVtLW1pcHM2NGVsOiBDb3VsZCBu
b3QgbG9hZCBNSVBTIGJpb3MgJyhudWxsKSc8L3NwYW4+PC9kaXY+DQo8ZGl2IHN0eWxlPSJtYXJn
aW46IDBweDsgZm9udC1zdHJldGNoOiBub3JtYWw7IGxpbmUtaGVpZ2h0OiBub3JtYWw7IiBjbGFz
cz0iIj48c3BhbiBzdHlsZT0iZm9udC12YXJpYW50LWxpZ2F0dXJlczogbm8tY29tbW9uLWxpZ2F0
dXJlcyIgY2xhc3M9IiI+PGJyIGNsYXNzPSIiPg0KPC9zcGFuPjwvZGl2Pg0KPGRpdiBzdHlsZT0i
bWFyZ2luOiAwcHg7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBsaW5lLWhlaWdodDogbm9ybWFsOyIg
Y2xhc3M9IiI+PHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vLWNvbW1vbi1s
aWdhdHVyZXMiIGNsYXNzPSIiPkhvdyBzaG91bGQgSSBmaXggdGhlIGVycm9yPyBUaGFuayB5b3Uh
PC9zcGFuPjwvZGl2Pg0KPGRpdiBzdHlsZT0ibWFyZ2luOiAwcHg7IGZvbnQtc3RyZXRjaDogbm9y
bWFsOyBsaW5lLWhlaWdodDogbm9ybWFsOyIgY2xhc3M9IiI+PHNwYW4gc3R5bGU9ImZvbnQtdmFy
aWFudC1saWdhdHVyZXM6IG5vLWNvbW1vbi1saWdhdHVyZXMiIGNsYXNzPSIiPjxiciBjbGFzcz0i
Ij4NCjwvc3Bhbj48L2Rpdj4NCjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4OyBmb250LXN0cmV0Y2g6
IG5vcm1hbDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsiIGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJmb250
LXZhcmlhbnQtbGlnYXR1cmVzOiBuby1jb21tb24tbGlnYXR1cmVzIiBjbGFzcz0iIj5RRU1VIFZl
cnNpb246PC9zcGFuPjwvZGl2Pg0KPGRpdiBzdHlsZT0ibWFyZ2luOiAwcHg7IGZvbnQtc3RyZXRj
aDogbm9ybWFsOyBsaW5lLWhlaWdodDogbm9ybWFsOyIgY2xhc3M9IiI+PHNwYW4gc3R5bGU9ImZv
bnQtdmFyaWFudC1saWdhdHVyZXM6IG5vLWNvbW1vbi1saWdhdHVyZXMiIGNsYXNzPSIiPjYuMi4w
LCA3LjEuMDwvc3Bhbj48L2Rpdj4NCjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4OyBmb250LXN0cmV0
Y2g6IG5vcm1hbDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsiIGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJm
b250LXZhcmlhbnQtbGlnYXR1cmVzOiBuby1jb21tb24tbGlnYXR1cmVzIiBjbGFzcz0iIj48YnIg
Y2xhc3M9IiI+DQo8L3NwYW4+PC9kaXY+DQo8ZGl2IHN0eWxlPSJtYXJnaW46IDBweDsgZm9udC1z
dHJldGNoOiBub3JtYWw7IGxpbmUtaGVpZ2h0OiBub3JtYWw7IiBjbGFzcz0iIj48c3BhbiBzdHls
ZT0iZm9udC12YXJpYW50LWxpZ2F0dXJlczogbm8tY29tbW9uLWxpZ2F0dXJlcyIgY2xhc3M9IiI+
UGxhdGZvcm06PC9zcGFuPjwvZGl2Pg0KPGRpdiBzdHlsZT0ibWFyZ2luOiAwcHg7IGZvbnQtc3Ry
ZXRjaDogbm9ybWFsOyBsaW5lLWhlaWdodDogbm9ybWFsOyIgY2xhc3M9IiI+bWFjT1MgTW9udGVy
ZXksIEludGVsIENvcmUgaTc8L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_8F92200953DB47D0A935A603ABBC164Eoutlookcom_--

