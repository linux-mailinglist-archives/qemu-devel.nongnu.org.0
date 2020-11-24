Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD96D2C3039
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 19:53:54 +0100 (CET)
Received: from localhost ([::1]:53792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khdRp-0002Sd-L5
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 13:53:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.peter@hensoldt-cyber.de>)
 id 1khbd0-0006hI-GO
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:57:19 -0500
Received: from mail-be0deu01on2070b.outbound.protection.outlook.com
 ([2a01:111:f400:7e23::70b]:1121
 helo=DEU01-BE0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.peter@hensoldt-cyber.de>)
 id 1khbcw-0006qU-M1
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:57:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzOohmgtgr8c++ck84Sh3ld6IE56k9Lf+hqPBBQJsDSdw0CP8dSECFRsrT2cfUFBUHJUaTbdF+ZV3pS0NoCglsa3WjtLE2VLoP4sbSDU6oCd2XRhOzpb8oJXEUShaL4VpUjDf7CWw8FmkPToI5DglcF47IBTS4agY4YhMeGJInSVSmWZqLl8Dpe5I2vI8+qZybwma1gFUh+h2EaVA4V+5cFaj011H6z1xzKq6AAu04Bzi8NyUU9HnURoyFp6FA0UrHqlsza4zIG7g3bCozOgm1adUO23mLgsRbXzT0Hc7QUgeD4N54PwNwdO1GQARGKn+zfFSCxbLUrK80qR/eyM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mglr0ae8u9yi2yOB7xgGgbLQ63WSG3tKA6hXyqd7d4=;
 b=NPaGpqR0zWurUn+J7HUvPYUB0SdcRmGmH8thGHirfR2Q/MkWbDmL0kLCeNr9Xz56M/j3QOsDXhTftJUe8zBX08nU1xQH0mVysPUqRsaX+8JXQyoRjpAk6L4EsSjH0BJlnPu54VzzZWX91kdDDKbUbgt07Lf/5yzGlfmYM01PpCLt3o3rrYWV2KlWAFGKFvvfgXuysHMVUS6oYuVnr7KNoxy9bdpKyauO4crcG1HqRKRb6Ow9SHOiH+SFlxvasi3m2fY4UDdW+4pY2zcvEivZOo0H9PKqMpAEyabND8nb4G0S9x5Jo9h99H7IYrIZ8zIaigpEnbt8O8w/cgJXvXSlYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hensoldt-cyber.de; dmarc=pass action=none
 header.from=hensoldt-cyber.de; dkim=pass header.d=hensoldt-cyber.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hensoldtcybermuc.onmicrosoft.com;
 s=selector1-hensoldtcybermuc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mglr0ae8u9yi2yOB7xgGgbLQ63WSG3tKA6hXyqd7d4=;
 b=CCVwbxOjyMfJSTgNFiJFlX0O9Y9yePbBiC7wAU9Q71RNmTMyALql9RiQng7L05rlGTDW9YYO6qVJ3bt2JetBtud73BoMqUtur6Cnk+HBDE7ybCbLma6b6wA7FsLF355PyfxW/FEMpcyDYlHiq6emWNEzObiJ7Y1G3qVyx+WDCyxwUZ2YqokEiooZF3631ncxchJgOh9e5597fOqoJJy5tgxArOjYJLVYHxhsKR4ZY8o7uHrWEafuivREtWuFV0+R8GZBYpnhaeXmBJeErFO2BrQUoNo6doOXme0soUQTQXD/Px9tUfpM0pCUOaYUA9EPlm2CdLyiRy+02b4ND3r7uA==
Received: from FRYP281MB0158.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:6::16) by
 FR2P281MB0025.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:11::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.9; Tue, 24 Nov 2020 16:52:07 +0000
Received: from FRYP281MB0158.DEUP281.PROD.OUTLOOK.COM
 ([fe80::e9c6:6b71:941f:670]) by FRYP281MB0158.DEUP281.PROD.OUTLOOK.COM
 ([fe80::e9c6:6b71:941f:670%9]) with mapi id 15.20.3611.013; Tue, 24 Nov 2020
 16:52:07 +0000
From: Michael Peter <michael.peter@hensoldt-cyber.de>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [PATCH] Initialize Zynq7000 UART clocks on reset
Thread-Topic: [PATCH] Initialize Zynq7000 UART clocks on reset
Thread-Index: AQHWwoHQiM0NUtwtTU6wGSn3YTG5+w==
Date: Tue, 24 Nov 2020 16:52:07 +0000
Message-ID: <FRYP281MB0158389968A2A1C231F3A585ABFB0@FRYP281MB0158.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=hensoldt-cyber.de;
x-originating-ip: [2a01:c23:c428:4f00:4cf3:24f3:926f:c656]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd8c55c6-1172-4db0-6ebf-08d89099477f
x-ms-traffictypediagnostic: FR2P281MB0025:
x-microsoft-antispam-prvs: <FR2P281MB0025B2483889DE06F6636564ABFB0@FR2P281MB0025.DEUP281.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3TwyTROXaGz0HxmHW25dr73JnUmv5GPhQYvB4XZEG1tgdAiZbFq/sEKVJRNTQfmq2INGRfoSBa1a/cSH4mB7Y3rIhprKHKQ7Z3M+6zhR7G9N1RAT1Ytye5ODGhSg6UVC2WdseT02nKsiUp+N6VMGAfI80JVVmGJsItlYwW2WYhWrtevFy/W9MKtxrFKKBeZEUGgFQ2w06VAYqcqgakWYdxNFLpS5AiRSDpAO2+JgOB4dj3eiPJVil+rimzD8T3RV/l/SWX8R/czRQ4nqOedl8HeetlBE+WJWGC7DXJGyT05XYlt/f5K2SgNnL+bIJGGVWO2QrMnFyzybzNncy5RRvg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:FRYP281MB0158.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39830400003)(136003)(346002)(366004)(55016002)(6916009)(86362001)(8936002)(19627405001)(478600001)(2906002)(186003)(6506007)(66946007)(44832011)(7696005)(33656002)(8676002)(71200400001)(76116006)(83380400001)(91956017)(52536014)(66476007)(66446008)(9686003)(64756008)(5660300002)(66556008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: a1tXpJTckLPiASd0MrXoqKLIs51xX68ZDrRTWQh+5WUOSMGwATEPK7CFCC/5VGFPwwPRJwJQZVtQMseEuIBm/3PcauUGG8Dg41XZlmwde0Wsf21WqlbDGbZ0D6R0AvCt1kJjQ0kEPKjv7EkvLRJq6oVxPm38Af5J/r3wI8WAOe9SliziQO07J5Vl2pchXnGilCxgSxcHADNFTogoRWdA8MzcKX25Rm9kEBGNbh4xR6hewHA1Jq/xRAAw/nND1i/XIRlrRdY5eJaiV0GCXO05MgTKFsxmhNzIYZNtW5jT5egxRgxi8/JyR0FAqjl5Dxv5306CM2w6ysPUnVfTxs6pvuXdESBLUpT1J7Tk5C59shfF1gKX3FGTB6NOJ7qaJvkYcFNd2dIJDIe+oVSOFImStIdJ2Y+pCtFPY55xewagZzxmqqM1SgRfFk8hQjHTnNTOB0razktlwgiCMJSRkCuLSA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_FRYP281MB0158389968A2A1C231F3A585ABFB0FRYP281MB0158DEUP_"
MIME-Version: 1.0
X-OriginatorOrg: hensoldt-cyber.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRYP281MB0158.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dd8c55c6-1172-4db0-6ebf-08d89099477f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 16:52:07.5759 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 77dfadea-3647-43b9-b48b-9c5540a475cd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fHEGO1TAu0CcIjozM//OirCPJCy+F1Hyg774v8U4tnv5jAUOV7XPo/azXo7ZqStxIkBC6MV9tGhEPtMySQ+7jYOkYQn05qYNGnsHJrybKhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB0025
Received-SPF: pass client-ip=2a01:111:f400:7e23::70b;
 envelope-from=michael.peter@hensoldt-cyber.de;
 helo=DEU01-BE0-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 24 Nov 2020 13:52:37 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_FRYP281MB0158389968A2A1C231F3A585ABFB0FRYP281MB0158DEUP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Pass an additional argument to zynq_slcr_compute_clocks that indicates whet=
her an reset-exit condition
applies. If called from zynq_slcr_reset_exit, external clocks are assumed t=
o be active, even if the
device state indicates a reset state.

Signed-off-by: Michael Peter <michael.peter@hensoldt-cyber.de>
---
 hw/misc/zynq_slcr.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index a2b28019e3..073122b934 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -269,12 +269,12 @@ static uint64_t zynq_slcr_compute_clock(const uint64_=
t periods[],
  * But do not propagate them further. Connected clocks
  * will not receive any updates (See zynq_slcr_compute_clocks())
  */
-static void zynq_slcr_compute_clocks(ZynqSLCRState *s)
+static void zynq_slcr_compute_clocks(ZynqSLCRState *s, bool ignore_reset)
 {
     uint64_t ps_clk =3D clock_get(s->ps_clk);

     /* consider outputs clocks are disabled while in reset */
-    if (device_is_in_reset(DEVICE(s))) {
+    if (!ignore_reset && device_is_in_reset(DEVICE(s))) {
         ps_clk =3D 0;
     }

@@ -305,7 +305,7 @@ static void zynq_slcr_propagate_clocks(ZynqSLCRState *s=
)
 static void zynq_slcr_ps_clk_callback(void *opaque)
 {
     ZynqSLCRState *s =3D (ZynqSLCRState *) opaque;
-    zynq_slcr_compute_clocks(s);
+    zynq_slcr_compute_clocks(s, false);
     zynq_slcr_propagate_clocks(s);
 }

@@ -410,7 +410,7 @@ static void zynq_slcr_reset_hold(Object *obj)
     ZynqSLCRState *s =3D ZYNQ_SLCR(obj);

     /* will disable all output clocks */
-    zynq_slcr_compute_clocks(s);
+    zynq_slcr_compute_clocks(s, false);
     zynq_slcr_propagate_clocks(s);
 }

@@ -419,7 +419,7 @@ static void zynq_slcr_reset_exit(Object *obj)
     ZynqSLCRState *s =3D ZYNQ_SLCR(obj);

     /* will compute output clocks according to ps_clk and registers */
-    zynq_slcr_compute_clocks(s);
+    zynq_slcr_compute_clocks(s, true);
     zynq_slcr_propagate_clocks(s);
 }

@@ -558,7 +558,7 @@ static void zynq_slcr_write(void *opaque, hwaddr offset=
,
     case R_ARM_PLL_CTRL:
     case R_DDR_PLL_CTRL:
     case R_UART_CLK_CTRL:
-        zynq_slcr_compute_clocks(s);
+        zynq_slcr_compute_clocks(s, false);
         zynq_slcr_propagate_clocks(s);
         break;
     }
--
2.17.1




--_000_FRYP281MB0158389968A2A1C231F3A585ABFB0FRYP281MB0158DEUP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Pass an additional argument to zynq_slcr_compute_clocks that indicates whet=
her an reset-exit condition
<div>applies. If called from zynq_slcr_reset_exit, external clocks are assu=
med to be active, even if the</div>
<div>device state indicates a reset state.</div>
<div><br>
</div>
<div>Signed-off-by: Michael Peter &lt;michael.peter@hensoldt-cyber.de&gt;</=
div>
<div>---</div>
<div>&nbsp;hw/misc/zynq_slcr.c | 12 ++++++------</div>
<div>&nbsp;1 file changed, 6 insertions(+), 6 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c</div>
<div>index a2b28019e3..073122b934 100644</div>
<div>--- a/hw/misc/zynq_slcr.c</div>
<div>+++ b/hw/misc/zynq_slcr.c</div>
<div>@@ -269,12 +269,12 @@ static uint64_t zynq_slcr_compute_clock(const ui=
nt64_t periods[],</div>
<div>&nbsp; * But do not propagate them further. Connected clocks</div>
<div>&nbsp; * will not receive any updates (See zynq_slcr_compute_clocks())=
</div>
<div>&nbsp; */</div>
<div>-static void zynq_slcr_compute_clocks(ZynqSLCRState *s)</div>
<div>+static void zynq_slcr_compute_clocks(ZynqSLCRState *s, bool ignore_re=
set)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;uint64_t ps_clk =3D clock_get(s-&gt;ps_clk);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* consider outputs clocks are disabled while in r=
eset */</div>
<div>- &nbsp; &nbsp;if (device_is_in_reset(DEVICE(s))) {</div>
<div>+ &nbsp; &nbsp;if (!ignore_reset &amp;&amp; device_is_in_reset(DEVICE(=
s))) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ps_clk =3D 0;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -305,7 +305,7 @@ static void zynq_slcr_propagate_clocks(ZynqSLCRSta=
te *s)</div>
<div>&nbsp;static void zynq_slcr_ps_clk_callback(void *opaque)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;ZynqSLCRState *s =3D (ZynqSLCRState *) opaque;</di=
v>
<div>- &nbsp; &nbsp;zynq_slcr_compute_clocks(s);</div>
<div>+ &nbsp; &nbsp;zynq_slcr_compute_clocks(s, false);</div>
<div>&nbsp; &nbsp; &nbsp;zynq_slcr_propagate_clocks(s);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -410,7 +410,7 @@ static void zynq_slcr_reset_hold(Object *obj)</div=
>
<div>&nbsp; &nbsp; &nbsp;ZynqSLCRState *s =3D ZYNQ_SLCR(obj);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* will disable all output clocks */</div>
<div>- &nbsp; &nbsp;zynq_slcr_compute_clocks(s);</div>
<div>+ &nbsp; &nbsp;zynq_slcr_compute_clocks(s, false);</div>
<div>&nbsp; &nbsp; &nbsp;zynq_slcr_propagate_clocks(s);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -419,7 +419,7 @@ static void zynq_slcr_reset_exit(Object *obj)</div=
>
<div>&nbsp; &nbsp; &nbsp;ZynqSLCRState *s =3D ZYNQ_SLCR(obj);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* will compute output clocks according to ps_clk =
and registers */</div>
<div>- &nbsp; &nbsp;zynq_slcr_compute_clocks(s);</div>
<div>+ &nbsp; &nbsp;zynq_slcr_compute_clocks(s, true);</div>
<div>&nbsp; &nbsp; &nbsp;zynq_slcr_propagate_clocks(s);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -558,7 +558,7 @@ static void zynq_slcr_write(void *opaque, hwaddr o=
ffset,</div>
<div>&nbsp; &nbsp; &nbsp;case R_ARM_PLL_CTRL:</div>
<div>&nbsp; &nbsp; &nbsp;case R_DDR_PLL_CTRL:</div>
<div>&nbsp; &nbsp; &nbsp;case R_UART_CLK_CTRL:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;zynq_slcr_compute_clocks(s);</div>
<div>+ &nbsp; &nbsp; &nbsp; &nbsp;zynq_slcr_compute_clocks(s, false);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;zynq_slcr_propagate_clocks(s);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>-- </div>
<div>2.17.1</div>
<div><br>
</div>
<br>
<br>
</div>
</body>
</html>

--_000_FRYP281MB0158389968A2A1C231F3A585ABFB0FRYP281MB0158DEUP_--

