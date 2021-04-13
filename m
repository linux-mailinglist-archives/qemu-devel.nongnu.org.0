Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5421835E740
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 21:47:37 +0200 (CEST)
Received: from localhost ([::1]:52452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWP0a-00005q-5i
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 15:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWOwD-00075u-Fw
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 15:43:05 -0400
Received: from mail-eopbgr790111.outbound.protection.outlook.com
 ([40.107.79.111]:18624 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWOw8-00055o-59
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 15:43:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRFhgFD/pRBAWf/giFKm5bUtZHgYZA5cyO/ZdpZXg6/BtdAs2U9ebutdsi4DDcTCuwGyMVhQauU2G6UTqSCdMnjtYOF9ItGjhCkMGLf7nSaNaxpv9fcfr0Yiq1rVnQLjXwXOrz4br2YJHo6C4WoNSGMcaCxWEjlZJ3YcBjdBYQXAbpMW8oBH1/3qpRdw7+oxNIHs9Gs/K/TsHHGfIn5Dlb8rskAEfEAktgnj56WEW9RjKMB35P56nQ0WMUqs02/eP4PnjRKoSJhI6BbS+SxOjrYVi5eg93KRLfY3x3EncxY3VpIZGTzjzBV3b2G+1mBTOm0li3nPGLHR+yMwM/wDNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bi6/hLiH83N2kN16t8c8onrEEA9+9hiKfdh3fJPaALU=;
 b=T/7Z7uOli0pCrFsv6VkrpLFA1dIvrIKiRnTZX/17XKJaEYqgPrjXV4aZWN8OiA2J1k/KsmxvpuzqkVHce6c/YWW0WS1ig6Gc8DHSStHrFYZ/Z/q9EuGIucO62r2K2SF7nTjxBHCNHw0ka2unJkz+dMr7M0EBWZ6nXzmLNFKCugS338gGikTV37+foLzJd51Nn27SlwfiSbE2jraED7sFWguXJoe7A4+zicdkxPZvL1Ydfz/mOJGCo5LOWVcJsh/o1GKJ7Uudu51UDtEtOe5p4jgFS2c3BpNVkJyYlmoIQWcbBrAS4Nvc3IKTaypK8hAulp/LZPxrb7JmP6mRH4g8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bi6/hLiH83N2kN16t8c8onrEEA9+9hiKfdh3fJPaALU=;
 b=V1RoGJG3fo1+2QpwK5+qCsq1zRcTqeeGov6fLt1urgWUSMri5cO8OjJ4+CDsdQf5f8pRSiqMbAE58ipjucYpREKI6CP+7raHo5q1ECnAgY2orf3ZCr3/+mC+ykdeu8XxcelJo79/s9AkQ00cFei5xuHh8G82X9Skwf2HZqAlh/uM8t2P40WTpLOAqhSwK5jWqZcJkCegWSKXAXbQ7S2DmT3NfckToeYyH9EKdBtXfkyOupgkWTf7BKnUv5VQcz9G0h12clWLmHSpsWGn9hWDXQ3sg3kSUDEbl7qNQ2Jon7Y3MCw881pDXl0vkB0wTpNBRU74ZXpIhB6Xlz2McfF60Q==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB3617.lamprd80.prod.outlook.com (2603:10d6:102:3a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Tue, 13 Apr
 2021 19:42:56 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d%2]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 19:42:56 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] decodetree: Allow empty input files for var width
Thread-Topic: [PATCH] decodetree: Allow empty input files for var width
Thread-Index: AQHXMJCOVinUCTzmSkSLwS6gEzLb+aqy2T2w
Date: Tue, 13 Apr 2021 19:42:56 +0000
Message-ID: <CP2PR80MB36681CD897FF21F090FAB4D9DA4F9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210413180958.412991-1-luis.pires@eldorado.org.br>
In-Reply-To: <20210413180958.412991-1-luis.pires@eldorado.org.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: eldorado.org.br; dkim=none (message not signed)
 header.d=none;eldorado.org.br; dmarc=none action=none
 header.from=eldorado.org.br;
x-originating-ip: [189.0.171.137]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc5815c7-405b-4e66-c8fb-08d8feb455fd
x-ms-traffictypediagnostic: CP2PR80MB3617:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB3617054F2C594A8EF64D1FA9DA4F9@CP2PR80MB3617.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VFmARbg3WvJrEijDzndDnFE0Gg7jSL1bQP+5DLIc2kUNMuo90U3AympM0PVqTngIZ7JxRTOo9XXZemjd9rojbuT/CxMKZMyh191Zso6JlJYI0CvglaIZc9BQ8H+jUv2w/Bcs0A9rL7NfqkS3EGkDg3d7oXX9Ty4/mOUmGO/qFARbLMvh940fa+ThfWVJHObiMI/3CU8Si6shSnbWl/s8SKM/Vownh9WKzmPTVjMTAvmozWmkg+Sf69IDsMdB856Y/GdkF8DQrGrgkEmZLjGXbAmf3Z1f3ZyuOTohzIc8O5Ycruo7qQtf+5W49veHtONA9rFUdxMhT/hSh/HqFUbjHcveSX+1UYhk0Z2/5cv0C2qEHj+FqqfdSYjbC7GI9Tn+V0x5iOEjKIlxRq9HfPdvVtSnG/DB4BvYSFibUaK5dZbMk5uF1I8yJUDZsbcGhM5pQgSQhYKPfPOB/X/v6nmvDueQEfPpEtiILZpmbo2IHFIRb53IR7w9FARQy2zFuIGwPsDZwF0sXnWB3bkTqYpqXvDTB1NWsu4eGV3uGQtFexk+lTKmi9lbROm+UBzD+WQwcNG0AjARbngomSW0xnrrLaAF24Hc9EFT7ob9FmITlkY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39840400004)(396003)(366004)(376002)(346002)(6506007)(316002)(38100700002)(8936002)(9686003)(53546011)(83380400001)(76116006)(110136005)(86362001)(2906002)(33656002)(66946007)(186003)(52536014)(26005)(8676002)(64756008)(5660300002)(66556008)(7696005)(66446008)(122000001)(478600001)(66476007)(55016002)(71200400001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?J3camL1yw+EsG1MAKaG0IbnhcrjvOg7jSD1+fZ+HDhQ/QW97FPO+9tdyFg?=
 =?iso-8859-1?Q?FHzX4AE94lE3NLZMxBa9FgUrawjp3LnKvCfDfI8lAaoJYbMrOarS35OpSt?=
 =?iso-8859-1?Q?5wW28wjxxWDw2j054zT4mmBgFvOOxImQeNyxMQfU3Z5OOyURl5NJnGXc+1?=
 =?iso-8859-1?Q?WkICaWiXC2WS3VitSCBXzO4w7vLJOSdtMIOh734WUhvwB24SuM+lA6QsP9?=
 =?iso-8859-1?Q?5f6+St9x9mpSg3AHpTIihUE2E1hZkGHZtwqeKXmhSMM8P8o5QZw5oMoDpK?=
 =?iso-8859-1?Q?42HRQgHTCbeefubd/yCh6XsaUmPRGGuKvcZ16AOvOH8CtzA6Hi1WAXz8ys?=
 =?iso-8859-1?Q?tCz2+W0pDAEBtr/e4oi57jvBURejiLqnhKaqSYhEq+OTsieqhq6TCBHWWu?=
 =?iso-8859-1?Q?7Inn9Q5n18C9h6sTq+Li9iJ1mu8oz+4JTI/LH8yP9YNwlM3DOhAO4+c6G+?=
 =?iso-8859-1?Q?WdbMbEUQez5SR8L3kjHsoKWJUjnNUJPaDkaM9MNl2Bs47BtlvcLhweBAeN?=
 =?iso-8859-1?Q?+fzvEfPiwMzx79cxdm+qv0BJn4tM+/nkhhzQrUBaAp3h840X686VPOeulX?=
 =?iso-8859-1?Q?2rER9+6VeBil9dk9lfLMhx4XOHNAU/LdKCiOKZffu/YC+wo6TCjZBH9XXJ?=
 =?iso-8859-1?Q?WYedp938vP4TgfQrwufOuT12Gz/DKAORBrJkK13YUlYyEfGqh2TYPch2n+?=
 =?iso-8859-1?Q?L7HgCe/aDiOFEl9tfmfm0sQSloLmYb5xswj8ZdW5zh/19PAfHTUnyg/myM?=
 =?iso-8859-1?Q?ONPWdr7biNnfHADrijswMerDaoE/mAJa4adI1TEsgzRdPTyuaMmzXCA9Gt?=
 =?iso-8859-1?Q?1o8/hnTlglzY1hTkz3x3tRFD2AjC8zOYyg9UE5gFullQeIPKTDvsitKajx?=
 =?iso-8859-1?Q?c7twFxTVjd+/jWPr5T8NmQTA60AVOFu8yrOVETMxZBViDztTJ0w3y6730q?=
 =?iso-8859-1?Q?CLKSKTBsPUdNJ5KHjGnaBvJ8YG86iCokRFLuMsrWrI7dZLyRXTE5EWEExV?=
 =?iso-8859-1?Q?mqapCxiZ1CGcvh7i3HZi2ZBdNawua/KPTKrhgh81ArToRMiDAewbFwlOyr?=
 =?iso-8859-1?Q?aPtEfdjShXhBZoMxV7NVVx2QHAfqrzqYJg7nvg/3QW345vM5by9pNk8b48?=
 =?iso-8859-1?Q?9+xZqWe8Y1yndhfMwRMtSDANy8fiB6gjp/29+5zLRl76kkqUSfMew6CrAh?=
 =?iso-8859-1?Q?nD1FnNiIPp0aVBFzjG5FAfH7mgkqmdgyVORhTw+0lNiVc9bAPZ/yOSYE1p?=
 =?iso-8859-1?Q?afHQJWp6KRcWs9MRQoCv1FtASdF5CNZzrjZ+O6j0oyiPj0A3POheSCmROw?=
 =?iso-8859-1?Q?ROC0u/sB/oHNhe/spsPjhaPTE/pgjb2ANoQiD5JP45xj/gbQ0HadTmJHzJ?=
 =?iso-8859-1?Q?AsvqiPFqtM?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5815c7-405b-4e66-c8fb-08d8feb455fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2021 19:42:56.1469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U8bQJcTbe6wHJggVJTIk955wE/QnAd45j+sbpxGPCYsgtWw3v57cTlIw/CkNd4iM9EzKTv/uwmPDx/c0VdP4sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3617
Received-SPF: pass client-ip=40.107.79.111;
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
Cc: "richard.henderson@linaro.org" <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please ignore this. I'll resend as part of a patch series.

Luis Pires
Instituto de Pesquisas ELDORADO
Departamento de Computa=E7=E3o Embarcada
Aviso Legal - Disclaimer


-----Original Message-----
From: Luis Pires <luis.pires@eldorado.org.br>=20
Sent: ter=E7a-feira, 13 de abril de 2021 15:10
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org; Luis Fernando Fujita Pires <luis.pires@el=
dorado.org.br>
Subject: [PATCH] decodetree: Allow empty input files for var width

This was broken when varinsnwidth was specified.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 scripts/decodetree.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py index 3450a2a08d=
..fef5eeaf42 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -1177,11 +1177,12 @@ def output_code(self, i, extracted, outerbits, oute=
rmask):
         ind =3D str_indent(i)
=20
         # If we need to load more bytes, do so now.
-        if extracted < self.width:
-            output(ind, 'insn =3D ', decode_function,
-                   '_load_bytes(ctx, insn, {0}, {1});\n'
-                   .format(extracted // 8, self.width // 8));
-            extracted =3D self.width
+        if self.width is not None:
+            if extracted < self.width:
+                output(ind, 'insn =3D ', decode_function,
+                       '_load_bytes(ctx, insn, {0}, {1});\n'
+                       .format(extracted // 8, self.width // 8));
+                extracted =3D self.width
         output(ind, 'return insn;\n')
 # end SizeLeaf
=20
--
2.25.1


