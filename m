Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBADF65894C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 04:58:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAk3b-0000LJ-R6; Wed, 28 Dec 2022 22:58:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peng6662001@hotmail.com>)
 id 1pAk3Z-0000L6-Of
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 22:58:13 -0500
Received: from mail-sy4aus01olkn20815.outbound.protection.outlook.com
 ([2a01:111:f403:7005::815]
 helo=AUS01-SY4-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peng6662001@hotmail.com>)
 id 1pAk3X-0008Ig-OV
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 22:58:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJRwwtD7zFxCvmVJeJeXd3EUCztVcH1i1JszzZAu5kXD58qsZVCrOnou8uF1g+5W4Ch/OKbs3BKzsZcX5/musBUKHWLrxgS9IUUiIY2677xK90aVO7SefefbDAdwB79CdCH01HCVRAguvgiRthLap26mlalyx4dr8WhzCY2VlmZ9KM6fDrjsSn03pgnAaW8E3XyKHy1eD2zHZ94VS64Kj0Hc++xy7QNzIgze3SM4UdQ8icQZXIlZ7slU2mXcO1RyQ6jz4uf2usYU9JqRA3C50IKurjw0KJsXw+9gAMoTcNdq+jjj6I22qV5Flf+Ntr53CIfnhkVnI1cWhBAIQffdwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BigHkO5Mn4QBlHfsE8ELLSmHKc6YEyNgURJTg6XrHUM=;
 b=Y6lgdEhueMIEseB5NcUMLrwSmEN1w43V7DWxCxpffm5YNd2il/pW7E/dchKm5I/I0SzvBMzSqlGEX4xdhkRwwCmpHVJRzNnzXE0upUqk4z6sLniAdU9aEMnzqcA6sSOciFC5+bpoQaNRvvQAJFvULBgkGejL3MO9uj7ly81csTlDR/7RtCCIYH5zfzDW90PpExfEpsKJljSUxVj9RY6TgIj+qFsoSqGQ99rDXYXnSs51+bWSMmvLW0RA8fG3/pIVP1Nvp2Cn/7Hca63dvAAFw8yZ05XyiNZo4j/ra7vBUXfTr/Ghel+FXH7kXcd5Op71QSN6H9VtcJwT30xrX3Ym7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BigHkO5Mn4QBlHfsE8ELLSmHKc6YEyNgURJTg6XrHUM=;
 b=MxDkS+9wtTUDowLaBFqWzMLcUuedHEoQfTyysN9ERk3kHjBLv2S+X9a04iq5p7xONuFQ1aRiflZlAgqhHtxWU4JR5821bqjKakvdHTolAwxA1Ih7yRGPOqyN3kqX4rRkxZ5E95NPlLn/hu8EbZU1zPqxeoCU2vVVUSMmxW9cFQ2lgQWmsC43JPOKX6qzwzWqElMX9df6lJS6xNcCib2JpGbgimWmsySftqMSIDyjmCOB9n/wUB25S0Jznv20gyERsZ33on7eu1szLYmeR1oPPXTOmwCY/hRqPhdWxN7VaIw0dttMCivxoTYapnpMji6+KGhE76r8dTh1bVAqZA3Ljg==
Received: from MEYP282MB2943.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:148::6)
 by SYBP282MB2916.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:157::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Thu, 29 Dec
 2022 03:53:03 +0000
Received: from MEYP282MB2943.AUSP282.PROD.OUTLOOK.COM
 ([fe80::dbd5:23fd:9ca2:e6cb]) by MEYP282MB2943.AUSP282.PROD.OUTLOOK.COM
 ([fe80::dbd5:23fd:9ca2:e6cb%5]) with mapi id 15.20.5944.016; Thu, 29 Dec 2022
 03:53:03 +0000
From: Song Dom <peng6662001@hotmail.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>
Subject: [BUG]The latest qemu crashed when I tested cxl
Thread-Topic: [BUG]The latest qemu crashed when I tested cxl
Thread-Index: AQHZGzV0xFYSLb4oJkG3qjwFopPEeA==
Date: Thu, 29 Dec 2022 03:53:03 +0000
Message-ID: <MEYP282MB29432DBA09AEF903036069F3E6F39@MEYP282MB2943.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [mYE6Zc6jft8jLyaGE+PFgfsZ11PDzFxo]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MEYP282MB2943:EE_|SYBP282MB2916:EE_
x-ms-office365-filtering-correlation-id: 5fbc31ea-d81c-429c-28da-08dae9502f8f
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cY+oOVJy0F38u/Z//Bf5yOXCVIt+P4eG1cT79cCCp9mBh7HDneoGkqal7TKbXhivaAVt03wU8O3JYhlV7MfRbiaAGbblci1Vpsd2Pm843lQHeBspSn1lRCAHKicXj7WNAfnqUTfn590eiXFAiVPpm7Gr9DBX9uLg9OS8K9a1Jtth2nj6wPGbqkMtQhOxHdDK5PExyvNYNQTeTn/fthpk1qDIjTUSUi6Pf7xhgQBkW9ghNlAVfQWCPkbiuo56ocsyHKZ9Qfz8vYrLdAy9OjmcuY06tTyb5ZzuUWZCvYG76mwHz3kuX3zoUSuyB3vf9FT/NEsOgy50JZYEtKNeeiiCy5kcsX2YTdQac84wv4gEXC0hhOhMK2lAhQK4cOEjnFZZ/NA+Buv0ZpPdNWXxQ1bKyuqc4rOKRfufGLxJAaZBRaobeYlg0QCrcC7zYVfA5KoouNKEh/2NSW+d4S8ls49VP8h1T6FHEwaX2H3yG3zedzHupTyEanji2oXxFVqxP+NOXzuRRg0PZwrj3sWp4yCzW5fAuKcWgEbs1bR9Iq3ljaNz9X9/jTdKSCB00XWDxGmwcVmt3p/gd2DyDr1BAh5rDA==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?ZkZ6TGRyamR3Q0lZdmlRemtUQlIybWpFNUxEU1VueGdDSFBoYVpRd1VJSWlT?=
 =?gb2312?B?Y0dKZVJFV3QwMFh6NDQ5K3NLcWFyb0pzRjVDbE5RaHVJMDdBUmhISTdzdTVj?=
 =?gb2312?B?OUdFSndtRGxRU3VSKytOQ3BuYzh0a0JGdS8wUHJnU2hlMXMwK25oV3JLeVB4?=
 =?gb2312?B?ZkpyeVFnUmxyZ2RWNXFxWDZZQW9HSTVidlRZeUNRTUtIZDdIQmNRRHhBbTBt?=
 =?gb2312?B?bDc2dmxQVVpucFA1SHRDRXFoTTBCc0gxWFRyejdDRHRMSWpmbWt2bmxiT3RH?=
 =?gb2312?B?Y0tVb05vdGlWN3pOK0kvOE5nUFZLLzlBMmlEMkZ4b0M1UDlIbjVZTGRCRGdn?=
 =?gb2312?B?NEUxK1JsYThQU0pNaXVHNW5OTkNXbnpyNXU4dmdLYmU5cVlZOEpTV0UrbjRQ?=
 =?gb2312?B?U2cvV1h0MFZ5MHZzZU9ZT3YvYlgxeUY2NzB6bHhpUmNiWCt4ZTN2eEt6c0Jl?=
 =?gb2312?B?aTFZK3QwOUd1SSs0Y3ZJTHhxR09lZjNJSlhhUCt2NzBOQklpS3Rmc05LMVRv?=
 =?gb2312?B?Y3paakVieUcwZWhKZis2eE1xWk1CVUxxdE1HNFJVWmI5K25NYkovK3dKRjdx?=
 =?gb2312?B?N3BWZnlDVWdqYlhjLzhlU0pEYWtQMit3dEFPYXNUZ0k0QTh4WkZBRDZRcHhY?=
 =?gb2312?B?eFR3NnAwZHJMVXB3TTBmb0xoVWpkUDFlVTVwN3lUMVFRWnFzNVc2SHYzSEI1?=
 =?gb2312?B?QTdKOWdPcXp5SjZ4UlhmeC9HSHRYY3IxdlAvZHBSNWkvd3hPUUlsNDZyWVlv?=
 =?gb2312?B?S1NWMHpMMklhK2dBM2xvZjF2dG5TZ25kbGRqellWRytuMG1mTmJEUm4yOUt6?=
 =?gb2312?B?blJYcUpzZlE2UGJlZ0FOSTdWTmlXZ0IvU3UvZnR0RWJ0SndsQjZlbHpvVW90?=
 =?gb2312?B?bmhEWG1UVnRIUUhGVDJNM082b2IzQytzem02V0RSanRZSlRiT2tFdk1KNHBJ?=
 =?gb2312?B?NElKT1hlNHM2VGdodTNFTDFlREpnMU96c0VFZU9yMkJTcUVtQWlITHVDa3Vi?=
 =?gb2312?B?TFJYMnlxQlZxOHM5ckt0SmlUVjF3a09nK3BJVWpNUFY0NmR3KzZEdFZyNEhi?=
 =?gb2312?B?SkFKR05vUTFYa1oyR2VtN2dkOG1YYSthM0dJekpWNWR2emhTNUNvbjVRS0VC?=
 =?gb2312?B?V3VucVBFZ1g2ZzlLeVRWcmFDa2oyMGo0QktpZUtIV1Q4NTVmZ1k3MDY1bjdC?=
 =?gb2312?B?WE5iZkZTWG1Pajl3UmJJbDV0dE16YmpjWmFsbDhrOWZHTUdjeDVzWVFvRjJ0?=
 =?gb2312?B?VjA2cmJOcmlYWHRHYm1KY0p0c2ZZbXN2R2d2V1JCNFEzV1lVa0piU1l3b1VN?=
 =?gb2312?B?R2YwV3BDRTVSNS9IRk8vY3VxRDlpbFZtdWJjcG1mdGJOQ0s4L2lUUGE2MHhr?=
 =?gb2312?B?MHB3ZGdRT1lFU3VveTN2V0UxUjg5UXBtaURibVd4VzBmaXRmNytnWmhneGU4?=
 =?gb2312?B?cjhLUm4yZy9aOW5KcVpNVnM0N3NNUTFVb0R2N0dndUtvck50Y1dsUC9WNGkx?=
 =?gb2312?B?RW1JQy9MaERNNDAzQktoS0V3cGNpNDBhNmFkY3hZZEppT0VkRmFrMW1Qbmp4?=
 =?gb2312?B?OTlsbmhzakFZWU41UjBzTnhqcmNyV3BqMU05ZHI0Q2k4RCttOEFyK0ZhSkhX?=
 =?gb2312?B?MHJQZVlZRUwzU1lFNGVMaUxnQjRkbmN2MGVLZS8weWFSd2cyc21HZGxiQXgw?=
 =?gb2312?B?S3RJOEN5QkFhVmx0LzJ3bENlMTBWUnhYMWttVlVrRm9YV2dZYTBHcjZ3PT0=?=
Content-Type: multipart/alternative;
 boundary="_000_MEYP282MB29432DBA09AEF903036069F3E6F39MEYP282MB2943AUSP_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEYP282MB2943.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fbc31ea-d81c-429c-28da-08dae9502f8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2022 03:53:03.0588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYBP282MB2916
Received-SPF: pass client-ip=2a01:111:f403:7005::815;
 envelope-from=peng6662001@hotmail.com;
 helo=AUS01-SY4-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--_000_MEYP282MB29432DBA09AEF903036069F3E6F39MEYP282MB2943AUSP_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SSB0ZXN0IGN4bCB3aXRoIHRoZSBwYXRjaDpbdjExLDAvMl0gYXJtL3ZpcnQ6IENYTCBzdXBwb3J0
IHZpYSBweGJfY3hsLg0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2N4bC9j
b3Zlci8yMDIyMDYxNjE0MTk1MC4yMzM3NC0xLUpvbmF0aGFuLkNhbWVyb25AaHVhd2VpLmNvbS8N
Cg0KQnV0IHRoZSBxZW11IGNyYXNoZWQsYW5kIHNob3dpbmcgYW4gZXJyb3I6DQpxZW11LXN5c3Rl
bS1hYXJjaDY0OiAuLi9ody9hcm0vdmlydC5jOjE3MzU6IHZpcnRfZ2V0X2hpZ2hfbWVtbWFwX2Vu
YWJsZWQ6IEFzc2VydGlvbiBgQVJSQVlfU0laRShleHRlbmRlZF9tZW1tYXApIC0gVklSVF9MT1dN
RU1NQVBfTEFTVCA9PSBBUlJBWV9TSVpFKGVuYWJsZWRfYXJyYXkpJyBmYWlsZWQuDQoNClRoZW4g
SSBtb2RpZnkgdGhlIHBhdGNoIHRvIGZpeCB0aGUgYnVnOg0KZGlmZiAtLWdpdCBhL2h3L2FybS92
aXJ0LmMgYi9ody9hcm0vdmlydC5jDQppbmRleCBlYTI0MTNhMGJhLi4zZDRjZWUzNDkxIDEwMDY0
NA0KLS0tIGEvaHcvYXJtL3ZpcnQuYw0KKysrIGIvaHcvYXJtL3ZpcnQuYw0KQEAgLTE3MTAsNiAr
MTczMCw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCAqdmlydF9nZXRfaGlnaF9tZW1tYXBfZW5hYmxl
ZChWaXJ0TWFjaGluZVN0YXRlICp2bXMsDQogICAgICAgICAmdm1zLT5oaWdobWVtX3JlZGlzdHMs
DQogICAgICAgICAmdm1zLT5oaWdobWVtX2VjYW0sDQogICAgICAgICAmdm1zLT5oaWdobWVtX21t
aW8sDQorICZ2bXMtPmN4bF9kZXZpY2VzX3N0YXRlLmlzX2VuYWJsZWQsDQogICAgIH07DQpOb3cg
cWVtdSB3b3JrcyBnb29kLg0KDQpDb3VsZCB5b3UgdGVsbCBtZSB3aGVuIHRoZSBwYXRjaChhcm0v
dmlydDogQ1hMIHN1cHBvcnQgdmlhIHB4Yl9jeGwpIHdpbGwgYmUgbWVyZ2VkIGludG8gdXBzdHJl
YW0/DQo=

--_000_MEYP282MB29432DBA09AEF903036069F3E6F39MEYP282MB2943AUSP_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(=
255, 255, 255);" class=3D"ContentPasted0 elementToProof ContentPasted1">I t=
est cxl with the patch:[v11,0/2] arm/virt:
 CXL support via pxb_cxl.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(=
255, 255, 255);" class=3D"ContentPasted0 elementToProof ContentPasted1 Cont=
entPasted4">https://patchwork.kernel.org/project/cxl/cover/20220616141950.2=
3374-1-Jonathan.Cameron@huawei.com/<br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(=
255, 255, 255);" class=3D"ContentPasted0 elementToProof ContentPasted1"><br=
>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(=
255, 255, 255);" class=3D"ContentPasted0 elementToProof ContentPasted1">But=
 the qemu crashed,and showing an error:</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(=
255, 255, 255);" class=3D"ContentPasted0">qemu-system-aarch64: ../hw/arm/vi=
rt.c:1735: virt_get_high_memmap_enabled:
 Assertion `ARRAY_SIZE(extended_memmap) - VIRT_LOWMEMMAP_LAST =3D=3D ARRAY_=
SIZE(enabled_array)' failed.
<br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(=
255, 255, 255);" class=3D"ContentPasted0"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(=
255, 255, 255);" class=3D"ContentPasted0">Then I modify the patch to fix th=
e bug:</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(=
255, 255, 255);" class=3D"ContentPasted0 ContentPasted3">diff --git a/hw/ar=
m/virt.c b/hw/arm/virt.c
<div class=3D"ContentPasted3">index ea2413a0ba..3d4cee3491 100644</div>
<div class=3D"ContentPasted3">--- a/hw/arm/virt.c</div>
<div class=3D"ContentPasted3">+++ b/hw/arm/virt.c</div>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(=
255, 255, 255);" class=3D"ContentPasted0 ContentPasted2">@@ -1710,6 +1730,7=
 @@ static inline bool *virt_get_high_memmap_enabled(VirtMachineState
 *vms,
<div class=3D"ContentPasted2">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;vms-&g=
t;highmem_redists,</div>
<div class=3D"ContentPasted2">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;vms-&g=
t;highmem_ecam,</div>
<div class=3D"ContentPasted2">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;vms-&g=
t;highmem_mmio,</div>
<div class=3D"ContentPasted2">+ &amp;vms-&gt;cxl_devices_state.is_enabled,<=
/div>
&nbsp; &nbsp; &nbsp;};<br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(=
255, 255, 255);" class=3D"ContentPasted0 ContentPasted2 ContentPasted5">Now=
 qemu works good.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(=
255, 255, 255);" class=3D"ContentPasted0 ContentPasted2"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(=
255, 255, 255);" class=3D"ContentPasted0 ContentPasted2">Could you tell me =
when the patch(<span style=3D"background-color:rgb(255, 255, 255);display:i=
nline !important" class=3D"ContentPasted6">arm/virt:
 CXL support via pxb_cxl</span>) will be merged into upstream?</span></div>
</body>
</html>

--_000_MEYP282MB29432DBA09AEF903036069F3E6F39MEYP282MB2943AUSP_--

