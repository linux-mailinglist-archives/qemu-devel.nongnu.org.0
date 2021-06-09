Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C33F3A1877
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:04:14 +0200 (CEST)
Received: from localhost ([::1]:47874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzkb-0004Fs-1c
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzeJ-0004yV-LC
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:43 -0400
Received: from mail-sn1anam02on2096.outbound.protection.outlook.com
 ([40.107.96.96]:16654 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzeG-0004L3-Jj
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpQpNedbphdq3cTc1RP0QEfqVhs4upjDvzBGUOj0CE/MW/cErbrjnZG+0x7nyjG9yzcux9lY7cxKfNrt9sb0Ex6PCB+uwgqZ0UPFyJMDTwuoqUxakmDtGgrRnyXTPJNSdpTPg6o5cqI5qFXtlm3FQfrvB7FIzs9Bj3JLqkPWlDvgi1SDEW79NL/aVOj/01Yrfua1QQ/kP5eiHcxeMRCSX8EH8xgxaeLBSloMRSSj07vgi0Gr15ZtwNEJLuM7SH8pVnUVZGaOciPhI9aPIiwOoRFqQWTaGFxs4J7IH09HG+tIG+G9uQU7THaeptyBbPauwb4BcdnFfLvqKlg3ewZaFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ce/FtbDopYHJmzsA7HMASOFpNEPXvC9ZJxB5J0bKpTA=;
 b=b37/GRHbeogVaQ6MmhCo1dBYPMYgNBLs/BO3fo1+teJuDmIK5Uom3gKxvWZ5uF/Acu0kpLx5sAsBTsAKQYOG7dZ0aA2HD6A310hhqeDUGCxT2du8jc8z2yllG9J9RAi4NnNFz59emyyLe60IBkUZUxgUfPrOLAgWtRkDTJZjKOQmvApcOIBnThzzhaBLwuueE6MBeRCKYBkTQI4x1axWA+tjrmTN/GHhVLFILDH/FL/AqnPH5CcYQON9SfBTgVNv9+yKX2wnIbUPgAiVwz6V+ryTlakGgk1YxrG+GpS+36wYuvCdq1w1nK4yWi6+qgTQiyZ+lygi1NGokekEspYf3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ce/FtbDopYHJmzsA7HMASOFpNEPXvC9ZJxB5J0bKpTA=;
 b=tADym2/fbt3FpqyXlc5IbABY6LPhP5y5ob5KAXFJ1Pan6wFfZjnOozCQk1kBug8pN4eo0u2yd1+ISvn3K9KAupnTbFA6aLEQYMtYWCjaIOI3aoaLVei9I+1QXc9yE4I62DjOm3IkGPjcGBaxZQ8EALu9FxtezemmEsVbhj/0Kd99zSgy+n6PKK85oNI1c12idb1TOXDHhTl2CVDfYBWC7q1zqYeTawVKdw4FpWpACXNxd9c9a0K/k5YpDk4BPorJxFAO+3wVlerlp8sOkDIwqiOxpFC5pUOJN88at+cUtoad0d9lQcuA6GSogNTNCpoLKmN//YPc1ep9B7eWEDGYCg==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB0017.lamprd80.prod.outlook.com (2603:10d6:102:1d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 14:57:39 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:57:39 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 08/28] accel/tcg: Inline cpu_gen_init
Thread-Topic: [PATCH v3 08/28] accel/tcg: Inline cpu_gen_init
Thread-Index: AQHXP6rpaRRqMOxq/E2JpQD005fiXasL+rww
Date: Wed, 9 Jun 2021 14:57:38 +0000
Message-ID: <CP2PR80MB3668949BB287AE6DD9696D79DA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-9-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-9-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1199ca00-9602-41b9-b85c-08d92b56ecd9
x-ms-traffictypediagnostic: CP2PR80MB0017:
x-microsoft-antispam-prvs: <CP2PR80MB00171A01F079BA5CC1745EB9DA369@CP2PR80MB0017.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:299;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u4RoZQ8s7q9SMqvxI1J4mv5ptQy6RNz7aIzhnrZ8j2RnIbdt8+JgEST2P9HYELVwpd0H+euS69Ficf3JV00kzlyXBGMRLezhKETiohitb+yCLCfjCYQEzyBwvGGD/LprTfLxE9WPd7vHbhlGiFtD2NcjbJzradpia6yCpzE1DYCDeizCOYkaBrB5vSG2nOdKWbHDyXrdCVXZfo1CePXkpZJ4kx+W2G3NcT8xXpP2PoSVjU4Q1RB52kYy9nzcvl8vf+r4P9rVrJDOdp8eY9ZD5fhQNxbR6e31DEnlC0cpW7oPt84kmacFguEfCZPeD2zmYCrsmim2h2rflu1EvGQe0fyBm24yoLVLU92bsqbF+GCOdzVqwe3m2xjsAwbMpP/Vj7NxmE8pqseIjUA3Kr8In/z2RchOg6SMWf8lyGrYhEmMnGomtERTw2MLV/Ow8g/2DeJCrKHsQLLAeTbzSCa4pbpKS2QgU3eS2i9rYQFNaOQA8r051nF/Os4mhkUwPC8ocqRnNfaM5HOHf+XU89O5RzvSRqaoMUwq3H9OdBNQb4RFrNuDSqJhy8eodKgMSHRHbLMQzWfkoj9+k+P41W8g4WWThRLOh/wE/k9EVHWVWrM4/40ZINPZYZqnsm0+xiTyB/BlZUAWRqRBX6ddPEtI3XJFjZudz/4cF7VbLX6/jxmhJ5ynxE0iwtOQ2LFz70eQCgUvp+9CilVGPKgNAsSdXjU5EvLDDKw2e94TRbSssP8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(346002)(136003)(376002)(366004)(122000001)(86362001)(2906002)(26005)(8936002)(55016002)(4744005)(5660300002)(7696005)(33656002)(83380400001)(316002)(186003)(66946007)(66446008)(8676002)(110136005)(64756008)(66556008)(76116006)(66476007)(478600001)(52536014)(4326008)(71200400001)(9686003)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VkxsL2I0UDhJZGMxc1BvQXlUYS9SOTVOV1FxZzBVUmRIazI5d0VaSW83R3F0?=
 =?utf-8?B?Z0ErRDlHRFd5NVhLQU9ZakZMdS9aY2F0L2FiYWI3RU5KVk5uTDBGczM0NG90?=
 =?utf-8?B?WGxKUXJ2aTVRaTM5eGpuUXYvMVFmNENxWXlIdUtJUUkzU2dDL0Z4M2dMNjRY?=
 =?utf-8?B?RGh1Sy83REpQNGh0YVEwTmVLTzJvVnpKMU11ODM2c3cxT1hsY2Q4blhtKzVC?=
 =?utf-8?B?S3B6Q1d2QlpVdFFSS2VhUkYvYURzUC8rKzkwSGNnQWxlMks5S0VGUHVTUVlp?=
 =?utf-8?B?V2tqTE1YSkx1U3dwcHJPRWt4VGVHQ0g1OGRUaFRreW5FVDZEL0tLUlRoa0tC?=
 =?utf-8?B?bVVaM3NVdnpZWDROWE9QZTZoZUVtNEhONGdVY2pxTzlCcG1oNjRGTGhQSEc3?=
 =?utf-8?B?aU82WU5WZEtJR0RvNnRlTm0xTlR0c1BWN25rTUFtUitTcnlpN2NjVFpBbVdv?=
 =?utf-8?B?VTZkUjlKVkRSNzhONFFBdW1qTjRhNHJoSjRZMkRRQnZxMU94YVpEZFpDa1pz?=
 =?utf-8?B?NnJEZzZlOVExallPYnZobVRJUHVuOUVxUkVnTHRFTjR0UmMzTUpxNWVXN2hB?=
 =?utf-8?B?cWsyMENGeWovNEFEZVhrbERORGwrNGxkSUVFNUFoRjdxeGtFSWFkMzJ0bUNp?=
 =?utf-8?B?eTBkaE9mRUFLRWN0Q1lqVDZsZ1d3VVQzTDVRQ0gwL1BtMUhnQWc5dXBCanBV?=
 =?utf-8?B?cmFxemZnU1lxRzJhVGsrK0NJR29QZEsxbGJURUxGWG5PcXV4dm54eXIvL1Vs?=
 =?utf-8?B?OHFlQ1hEc0JKcTNzK2RxbG1NeXRsZXVMZWlERVlaV1lvMkFoZExwM1M0N3Zx?=
 =?utf-8?B?NVU1WkVyS1poQXErUW1XV1F0cVBWZkJrY1h3Rk1EcTJlSDlPUmh5TmNSVUlE?=
 =?utf-8?B?ZDNRR1BKeWppQTNaWVlzZ2I3TjM3RkxiYlkyMVJFN3EyTHN4ZFRuNjJxN1NR?=
 =?utf-8?B?c29qeXlScmRLV0hYeWNXOVJONVJxdmV0U2xqWEZQZVBBWW5icHJhQklkK1di?=
 =?utf-8?B?d0RqeDR6aTVFMHB0YThjbFUzSjVZNjZndmxMNmdyNWF2MGt3dWd4MVFlaXk2?=
 =?utf-8?B?WmFOaWtra1RSa2lqb215bFQrYmw3aHJDQlpRak9tY3FKNUkrMWozRzBmU0Z4?=
 =?utf-8?B?bjNQUDE4Q3pFUW9ydzZZYm1yNDRKaDArd2R6bU9nRHZ3MWdQclI1RFZZU3FS?=
 =?utf-8?B?ZTlBUUxzRnpUNythamVRNzdZZzRUcU4wNkM3MWNKZFV5WXd4QWczaVRmM2p6?=
 =?utf-8?B?QUNvRW81eEFyYmMvWXNHZGhaQVVzanA2TmxBRFVrQkFWUGVTYnlsbXNsR25k?=
 =?utf-8?B?Z0ZrMTdVQklOazk5NjdjOVFSOHFPL1c4dUlYSjM4RVFIZWJ6NGpKS01lMnNG?=
 =?utf-8?B?UnUrbzVieEJXZVlXL1NqcnZwbE1ad2RFSVpsZEJOaTc0R2tVRmNoWW8xYnNZ?=
 =?utf-8?B?a3VLcnNZcHA1VjlPRnNGOGM3ZG5OTk9ScnVudFlVK21Oa2J6NGxGRkNDeTE3?=
 =?utf-8?B?eEdLWDlNWFBPektuOVIrYUU1OHNHZ0VEM2liQXhvMG5SdlpKTU5FRUQvbHBX?=
 =?utf-8?B?eXZaeDdkTlNhUVZKb0VGc3BnR25ZMkY0UGMvM1paVGZNb1lUamUvN2ZoU2xi?=
 =?utf-8?B?bzJub29oYmdsNElYbDdTbzdJRm9kcktaSlMxQU15YmlPdllxQ1daaWdLdm83?=
 =?utf-8?B?Qnd1M2NGOW5aV3dCVDhLK2w3Qmw0dnVHWUpkSU9mK2hLQ0xVOXdmMGhsYjhF?=
 =?utf-8?Q?DV/14Rs+XU/npXBhUZnWujDbQlFsK0jDVvxD9+i?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1199ca00-9602-41b9-b85c-08d92b56ecd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:57:38.8550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sb6Y2pHS3FxxdkS+ij9yQzqbQ8aJ+1KtC+9A6dSH/JvVU209uvbJVDb0m8/oiXdtN/OoevBYeeHU/xDyKWbm+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB0017
Received-SPF: pass client-ip=40.107.96.96;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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
Cc: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IEl0IGNvbnNpc3RzIG9mIG9uZSBmdW5jdGlvbiBjYWxsIGFuZCBoYXMgb25seSBvbmUgY2FsbGVy
Lg0KPiANCj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNh
dC5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRl
cnNvbkBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gIGFjY2VsL3RjZy90cmFuc2xhdGUtYWxsLmMgfCA3
ICstLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNiBkZWxldGlvbnMo
LSkNCg0KUmV2aWV3ZWQtYnk6IEx1aXMgUGlyZXMgPGx1aXMucGlyZXNAZWxkb3JhZG8ub3JnLmJy
Pg0KDQotLQ0KTHVpcyBQaXJlcw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETw0KQXZp
c28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xh
aW1lci5odG1sPg0K

