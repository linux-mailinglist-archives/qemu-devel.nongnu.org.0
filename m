Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A923FA6C5
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 18:20:27 +0200 (CEST)
Received: from localhost ([::1]:53664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mK14D-0003We-NV
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 12:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sfvfeibh@outlook.jp>)
 id 1mJz4J-0000hD-TW
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 10:12:23 -0400
Received: from mail-hk2apc01olkn0814.outbound.protection.outlook.com
 ([2a01:111:f400:febc::814]:48480
 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sfvfeibh@outlook.jp>)
 id 1mJz4F-0002gh-Og
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 10:12:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4L34+4oG6ngvuruKVylYJTrPNPxJM+HrzYFnHO06xOmrYVr66vuGElCIhU7yHu5YvIObkJcsQGeAaK32CHvnMgqlF69yX+xJq4oMSuk1qQ6ew5//nE+8g9Zj/jABfNv5eWc4ECSRVz87RM8Qx7QiWNq/GJpiMYl9q5r+LcrNrlWJocYoGCoLjhsaQJIGPKR6M8syyp21JCdWO3Qcqhw9FokN5aKf8T+QNTT7H9XrQmF0XDh2hGNtXwe8rqRVV7Yc3PuoeMhkGzfUrH42CMhR40aigF4TXlLqDgiNkpaNyZQeLGnVVPkKS0eD3f2rQQJj/nPUYYsar50ngXy8RqakQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HduYSLguDmyopOhi3oCQqqC2qBpFRINdHLaH++SjEQE=;
 b=Ka0vr6RBZAFWvQpXKY2xgxjAjbVhEzk2EIM9+uzWZ91MRfKHhFdLgrzcVGyiAm8EIG7uTJB7fcAmxNjUZkPf9Yxemc/HD+fItfHgeVNjwobq1ARi6U7NMoJWKX1snZWD8Kzp0EL8GXmeI5XS6o601B7Dht99mYsM6RGqa/riKu/1X6qiRlIihMKqAjF7ZWflHNxkR2Q1fEmOG039+n+Wm31uKIU1HDNXFXAO7wqqHNIWJQvpVGlyqBUknLnqB0WwgwMwIhUqVWsI55XyTUt2272DkbbZuk7Yk+LFq8tB0E1BwG8rdK4hmiA98+Dr1mtdqHjG8jgqx7aUUoIuw5kAow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYAPR04MB2430.apcprd04.prod.outlook.com (2603:1096:404:1c::21)
 by TY2PR04MB2928.apcprd04.prod.outlook.com (2603:1096:404:3e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Sat, 28 Aug
 2021 14:06:49 +0000
Received: from TYAPR04MB2430.apcprd04.prod.outlook.com
 ([fe80::2c94:b0e2:bec4:b7b0]) by TYAPR04MB2430.apcprd04.prod.outlook.com
 ([fe80::2c94:b0e2:bec4:b7b0%4]) with mapi id 15.20.4457.023; Sat, 28 Aug 2021
 14:06:49 +0000
X-Mailer: BvsCn 4
From: "=?utf-8?B?6ZyN57+U5aiF?=" <sfvfeibh@outlook.jp>
To: "=?utf-8?B?cWVtdS1kZXZlbA==?=" <qemu-devel@nongnu.org>
Subject: =?utf-8?B?cWVtdS1kZXZlbDU=?=
Message-ID: <TYAPR04MB2430D4D0B47AAB5FDF020A89A4C99@TYAPR04MB2430.apcprd04.prod.outlook.com>
Date: Sat, 28 Aug 2021 22:06:34 +0800
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TMN: [aNGBJG8SalL3CWb5aacQop67/3hClwMP]
X-ClientProxiedBy: HK2PR0401CA0009.apcprd04.prod.outlook.com
 (2603:1096:202:2::19) To TYAPR04MB2430.apcprd04.prod.outlook.com
 (2603:1096:404:1c::21)
X-Microsoft-Original-Message-ID: <8650425e48f41a35f6209922267bdc0b@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from zbrwqi (101.88.55.108) by
 HK2PR0401CA0009.apcprd04.prod.outlook.com (2603:1096:202:2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4457.17 via Frontend
 Transport; Sat, 28 Aug 2021 14:06:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e987383a-30c2-49de-f972-08d96a2d13b6
X-MS-TrafficTypeDiagnostic: TY2PR04MB2928:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oa5BKfM842DfwG/StDfJLoZSruXPw0C7SspFVq300eriHn18YQmhaGJ0obqzMe9rW8pgIBTbeHByamBHYN8WerpzcFT/UGsIqWlK4ggFlU8oJpqfY+O12x8xGebFFtPsdojP4FEw7acFn1vH+b0XVofbMd4YFeqhFpIkjZpgCp+5SRlW8H+y2IcnC/Wjyz+4QqoJdxK9sOfN4YOBRajdFZYHkeL3c1Vk7voxyzq1pSVXmqNsigpCc+PiAEjc/mXf+L28OcAL0UoABiaTsJTCvnU5XCnGfShagKkB4arV8S3GtedyFCecWZ5spohW5aWz83l5YYTuM2T3A+FqwCdm0bnHRTdqkZSn+Ip14uBW1eWNDIS0LDJ+H+2n5xLc3izcFFoa9fTJZk7rVfUO+q/8Puq15BsE7OAXBCau+NQFHvW1m0mfydQxlNtA99J3/p8R
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +2lXMhFge/KklefRYoWIS/KO6sBGLeL0CK92TAbSw3cK7dIO3TXAaJLJ6igliXrEhw6Awr1s8cnc5zwi5Tdx8LmzLNfSDYzQznWfEf7s228ELdNm2FblP77XeqolkmfRLkjDeElvi+3mDNcTcahqBA==
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-99b28.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e987383a-30c2-49de-f972-08d96a2d13b6
X-MS-Exchange-CrossTenant-AuthSource: TYAPR04MB2430.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 14:06:49.5861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB2928
Received-SPF: pass client-ip=2a01:111:f400:febc::814;
 envelope-from=sfvfeibh@outlook.jp;
 helo=APC01-HK2-obe.outbound.protection.outlook.com
X-Spam_score_int: 59
X-Spam_score: 5.9
X-Spam_bar: +++++
X-Spam_report: (5.9 / 5.0 requ) BAYES_99=4, BAYES_999=0.2, BAYES_99_FREEMAIL=1,
 BAYES_99_HTML=0.6, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_KAM_HTML_FONT_INVALID=0.01 autolearn=no autolearn_force=no
X-Spam_action: reject
X-Mailman-Approved-At: Sat, 28 Aug 2021 12:18:33 -0400
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"><html xmlns:o=
=3D""><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8"></=
head>
<body>
<p>079555</p>
<style class=3D"fox_global_style">div.fox_html_content { line-height: 1.5; =
}div.fox_html_content { font-size: 14px; font-family: =E5=BE=AE=E8=BD=AF=E9=
=9B=85=E9=BB=91; color: rgb(0, 0, 0); line-height: 1.5; }div.fox_html_conte=
nt { font-size: 10.5pt; font-family: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91; =
color: rgb(0, 0, 0); line-height: 1.5; }</style>

<div><font color=3D"#333333"><span></span></font>
<div>
<div>
<div>
<div>
<div style=3D"ORPHANS: 2">
<div><font size=3D"+0">
<div><b style=3D"BACKGROUND-COLOR: transparent; COLOR: rgb(15,100,121); FON=
T-SIZE: 16px">=E8=AF=BE=20
=E7=A8=8B =E8=AE=B2 =E5=B8=88=EF=BC=9A=E8=B5=B5=E8=80=81=E5=B8=88=EF=BC=8C<=
span style=3D"LINE-HEIGHT: 1.5">=E5=BE=AE=E8=BD=AF=E5=AE=98=E6=96=B9=E8=AE=
=A4=E8=AF=81=E6=9C=80=E6=9C=89=E4=BB=B7=E5=80=BC=E4=B8=93=E5=AE=B6=EF=BC=88=
MVP=EF=BC=89 =E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5">=E5=BE=AE=E8=
=BD=AFMCT=E8=AE=A4=E8=AF=81=E8=AE=B2=E5=B8=88=E3=80=81Adobe=20
ACCD=E5=88=9B=E6=84=8F=E8=AE=BE=E8=AE=A1=E5=B8=88&nbsp;</span></b></div></f=
ont></div>
<div><span style=3D"COLOR: rgb(51,51,51)">---------------------------------=
-----------------------------------</span><span style=3D"LINE-HEIGHT: 1.5; =
BACKGROUND-COLOR: window; COLOR: rgb(51,51,51); FONT-SIZE: 10.5pt">--------=
-----------------------</span></div>
<div><b><font color=3D"#0f6479"><span style=3D"FONT-SIZE: 19px">=E3=80=8A</=
span><span style=3D"LINE-HEIGHT: 28px; FONT-SIZE: 19px">=E6=BC=94=E7=A4=BA=
=E4=B9=8B=E9=81=93=E2=80=94=E2=80=94PPT=E5=95=86=E5=8A=A1=E8=AE=BE=E8=AE=A1=
=E4=B8=8E=E5=91=88=E7=8E=B0=E6=8A=80=E5=B7=A7</span><span style=3D"FONT-SIZ=
E: 19px">=E3=80=8B</span></font></b></div>
<div><br></div>
<div>
<div>
<div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px">=E3=80=90=E6=B7=B1=
=E5=9C=B3=EF=BC=9A09=E6=9C=8828=E6=97=A5=E3=80=91=E3=80=90=E5=8C=97=E4=BA=
=AC=EF=BC=9A10=E6=9C=8813=E6=97=A5=E3=80=91=E3=80=90=E5=B9=BF=E5=B7=9E=EF=
=BC=9A10=E6=9C=8820=E6=97=A5=E3=80=91</span></div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px">=E3=80=90=E6=88=90=
=E9=83=BD=EF=BC=9A10=E6=9C=8827=E6=97=A5=E3=80=91=E3=80=90=E8=8B=8F=E5=B7=
=9E=EF=BC=9A11=E6=9C=8803=E6=97=A5=E3=80=91=E3=80=90=E4=B8=8A=E6=B5=B7=EF=
=BC=9A12=E6=9C=8808=E6=97=A5=E3=80=91</span></div></div>
<div><span style=3D"FONT-SIZE: 13px">=E3=80=90=E8=B4=B9 =E7=94=A8=EF=BC=9A2=
500=E5=85=83/=E4=BA=BA<font color=3D"#ff0000"><b>=EF=BC=88=E5=86=85 =E8=AE=
=AD=E6=96=B9=E6=A1=88=E5=92=8C=E4=BB=B7=20
=E6=A0=BC=E8=AF=B7=E8=81=94=E7=B3=BB=E9=A1=BE=E9=97=AE=E8=AF=A6=E8=AF=A2=EF=
=BC=89</b></font>=E3=80=91</span></div></div></div></div>
<div style=3D"ORPHANS: 2">
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"LINE-HEIGHT: 19=
px; FONT-SIZE: 13px"><font color=3D"#0f6479"><br></font></span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
"><font color=3D"#0f6479"><span><b>&nbsp;</b></span><b style=3D"LINE-HEIGHT=
: 1.5; BACKGROUND-COLOR: transparent">=E4=B8=80=E3=80=81=E5=A6=82=E4=BD=95=
=E6=94=B9=E5=8F=98=E7=8E=B0=E6=9C=89=E4=B9=A0=E6=83=AF=EF=BC=8C=E7=AA=81=E7=
=A0=B4=E6=80=9D=E7=BB=B4=EF=BC=8C=E8=AE=A9=E4=B8=80=E5=88=87=E9=87=8D=E6=96=
=B0=E5=BC=80=E5=A7=8B=EF=BC=9F&nbsp;</b></font></span></div>
<div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">1=E3=80=81=E6=83=85=E6=99=AF=E8=AE=BE=E8=AE=A1=EF=BC=9A=E6=BC=94=E7=A4=BA=
=E7=94=A8=E9=80=94=E3=80=81=E8=A7=82=E4=BC=97=E9=9C=80=E6=B1=82 =E3=80=81</=
span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transparent; FONT-S=
IZE: 13px">2=E3=80=81=E5=86=85=E5=AE=B9=E8=AE=BE=E8=AE=A1=EF=BC=9A=E5=AF=8C=
=E6=9C=89=E5=90=B8=E5=BC=95=E5=8A=9B=E7=9A=84=E6=A1=86=E6=9E=B6&nbsp;</span=
></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">3=E3=80=81=E5=85=B3=E7=B3=BB=E8=AE=BE=E8=AE=A1=EF=BC=9A=E9=A1=B5=E9=9D=A2=
=E9=97=B4=E7=9A=84=E9=80=BB=E8=BE=91=E5=85=B3=E7=B3=BB =E3=80=81</span><spa=
n style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transparent; FONT-SIZE: 13px=
">4=E3=80=81=E6=95=B4=E5=90=88=E8=BF=87=E7=A8=8B=EF=BC=9A=E4=BB=8E=20
Word =E5=88=B0 PowerPoint&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">5=E3=80=81=E7=B4=A0=E6=9D=90=E6=94=B6=E9=9B=86=EF=BC=9A=E9=80=89=E6=8B=A9=
=E5=9B=BE=E7=89=87=E7=9A=84=E8=A6=81=E9=A2=86 =E3=80=81</span><span style=
=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transparent; FONT-SIZE: 13px">6=E3=
=80=81=E5=8F=82=E8=80=83=E7=BA=BF=E4=B8=8E=E7=BD=91=E6=A0=BC=E7=BA=BF=E5=AF=
=B9=E9=BD=90=E7=9A=84=E4=BC=98=E7=A7=80=E4=B9=A0=E6=83=AF&nbsp;</span></div=
>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">7=E3=80=81=E5=B8=A6=E4=BD=A0=E9=A3=9E=E7=9A=84=E5=BF=AB=E6=8D=B7=E9=94=AE=
=EF=BC=88Keyboarder=EF=BC=89 =E3=80=81</span><span style=3D"LINE-HEIGHT: 1.=
5; BACKGROUND-COLOR: transparent; FONT-SIZE: 13px">8=E3=80=81PPT=E4=B8=AD=
=E7=9A=84=E2=80=9C=E5=BA=96=E4=B8=81=E8=A7=A3=E7=89=9B=E2=80=9C=EF=BC=88=E5=
=B9=BB=E7=81=AF=E7=89=87=E7=AE=A1=E7=90=86=EF=BC=89&nbsp;</span></div>
<div><span style=3D"BACKGROUND-COLOR: rgb(255,255,255); FONT-SIZE: 13px"><b=
r></span></div>
<div><b style=3D"BACKGROUND-COLOR: rgb(255,255,255); FONT-SIZE: 13px"><font=
 color=3D"#0f6479">=E4=BA=8C=E3=80=81=E8=AE=A9=E6=82=A8=E7=9A=84=E5=B9=BB=
=E7=81=AF=E7=89=87=E6=9B=B4=E6=9C=89=E8=AE=BE=E8=AE=A1=E9=80=BB=E8=BE=91=E5=
=8F=8A=E7=BB=93=E6=9E=84=E5=8C=96&nbsp;</font></b></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">1=E3=80=81PPT=E6=9C=80=E5=A4=A7=E7=9A=84=E9=97=AE=E9=A2=98=EF=BC=9F=EF=BC=
=88=E4=B8=8D=E6=98=AF=E7=BE=8E=E6=84=9F=EF=BC=8C=E4=B8=8D=E6=98=AF=E5=8A=A8=
=E7=94=BB=EF=BC=8C=E8=80=8C=E6=98=AF=E9=80=BB=E8=BE=91=EF=BC=89&nbsp;</span=
></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">2=E3=80=81=E7=AF=87=E7=AB=A0=E9=80=BB=E8=BE=91=EF=BC=88=E7=9B=AE=E5=BD=95=
=E9=A1=B5=E4=B8=8E=E8=BF=87=E6=B8=A1=E9=A1=B5=E8=AE=A9=E5=B9=BB=E7=81=AF=E7=
=89=87=E9=80=BB=E8=BE=91=E6=B8=85=E6=99=B0=EF=BC=89&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">3=E3=80=81=E9=A1=B5=E9=9D=A2=E9=80=BB=E8=BE=91=EF=BC=88=E5=B9=B6=E5=88=97=
=E3=80=81=E5=8C=85=E5=90=AB=E3=80=81=E6=80=BB=E5=88=86=E3=80=81=E8=BD=AC=E6=
=8A=98=E3=80=81=E5=88=92=E6=A8=A1=E5=9D=97=E3=80=81=E5=88=86=E5=B1=82=E6=AC=
=A1=E3=80=81=E6=89=BE=E9=87=8D=E7=82=B9=E3=80=81=E5=9B=BE=E7=A4=BA=E5=8C=96=
=EF=BC=89&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">4=E3=80=81=E6=96=87=E5=8F=A5=E9=80=BB=E8=BE=91=EF=BC=88=E7=90=86=E8=A7=A3=
=E4=B8=87=E5=B2=81=EF=BC=89&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">5=E3=80=81=E7=BB=93=E6=9E=84=E5=8C=96=E8=A7=A3=E6=9E=90=EF=BC=88Structure=
d=20
Analysis=EF=BC=9A=E7=BB=93=E6=9E=84=E5=8C=96=E5=88=86=E6=9E=90=E5=86=85=E5=
=AE=B9=E7=9A=84=E5=86=85=E5=9C=A8=E9=80=BB=E8=BE=91=E5=85=B3=E7=B3=BB=EF=BC=
=89&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">6=E3=80=81PPT=E4=B8=AD=E5=B8=B8=E8=A7=81=E7=9A=84=E5=87=A0=E7=A7=8D=E9=80=
=BB=E8=BE=91=E7=BB=93=E6=9E=84&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">=E7=BB=93=E6=9E=84=E5=8C=96=E5=88=86=E6=9E=90=E7=9A=84=E6=96=B9=E6=B3=95=
=E5=8F=8A=E6=8A=80=E5=B7=A7 =E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5=
; BACKGROUND-COLOR: transparent; FONT-SIZE: 13px">=E6=9E=84=E5=BB=BA=E9=80=
=BB=E8=BE=91=E7=BB=93=E6=9E=84=E7=9A=84=E6=96=B9=E6=B3=95=E5=8F=8A=E6=8A=80=
=E5=B7=A7&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">7=E3=80=81=E5=BD=A2=E8=B1=A1=E5=8C=96=E8=A1=A8=E8=BE=BE=EF=BC=88Power Exp=
ression=EF=BC=9A=E6=98=BE=E7=8E=B0=E5=BD=A2=E8=B1=A1=E5=92=8C=E6=98=93=E6=
=87=82=E7=9A=84=E8=A1=A8=E8=BE=BE=EF=BC=89&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">=E5=91=88=E7=8E=B0=E9=80=9A=E4=BF=97=E6=98=93=E6=87=82=E3=80=81=E5=91=88=
=E7=8E=B0=E7=AE=80=E5=8D=95=E6=98=8E=E4=BA=86=E3=80=81=E5=91=88=E7=8E=B0=E6=
=B8=85=E6=99=B0=E5=BD=A2=E8=B1=A1&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">=E5=91=88=E7=8E=B0=E8=91=B5=E8=8A=B1=E5=AE=9D=E5=85=B8=EF=BC=88=E9=A1=B6=
=E5=B0=96=E5=92=A8=E8=AF=A2=E5=85=AC=E5=8F=B8=E9=80=BB=E8=BE=91=E5=9B=BE=E5=
=BD=A2=E5=A4=A7=E5=85=A8=EF=BC=89&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
"><br></span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><b style=3D"FONT-SIZE: 13px"><=
font color=3D"#0f6479">=E4=B8=89=E3=80=81=E5=B9=BB=E7=81=AF=E7=89=87=E6=95=
=B4=E4=BD=93=E8=AE=BE=E8=AE=A1=E7=BE=8E=E5=8C=96=E6=95=88=E6=9E=9C&nbsp;</f=
ont></b></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">1=E3=80=81=E8=AE=BE=E8=AE=A1=E8=80=85=E7=A6=BB=E5=BC=80=E7=B4=A0=E6=9D=90=
=E5=AF=B8=E6=AD=A5=E9=9A=BE=E8=A1=8C&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">=E5=AD=97=E4=BD=93=E7=B4=A0=E6=9D=90=EF=BC=88=E6=B1=82=E5=AD=97=E7=BD=91=
=EF=BC=8C=E4=B8=8D=E6=B1=82=E4=BA=BA=EF=BC=89 =E3=80=81</span><span style=
=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transparent; FONT-SIZE: 13px">=E5=
=9B=BE=E6=A0=87=E7=B4=A0=E6=9D=90=EF=BC=88=E9=98=BF=E9=87=8C=E5=B7=B4=E5=B7=
=B4=E7=9F=A2=E9=87=8F=E5=9B=BE=E6=A0=87=E5=BA=93=EF=BC=89&nbsp;</span></div=
>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">=E5=9B=BE=E8=A1=A8=E7=B4=A0=E6=9D=90=EF=BC=8851PPT=E6=A8=A1=E6=9D=BF=E7=
=BD=91=EF=BC=89 =E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND=
-COLOR: transparent; FONT-SIZE: 13px">=E5=9B=BE=E5=83=8F=E7=B4=A0=E6=9D=90=
=EF=BC=88=E7=99=BE=E5=BA=A6=E8=AF=86=E5=9B=BE=EF=BC=8C=E4=BB=A5=E5=9B=BE=E6=
=90=9C=E5=9B=BE=EF=BC=89&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">2=E3=80=81=E5=85=A8=E9=9D=A2=E6=8E=8C=E6=8F=A1=E4=B8=80=E4=B8=AA=E4=BC=98=
=E7=A7=80PPT=E6=95=B4=E4=BD=93=E8=AE=BE=E8=AE=A1=E7=BE=8E=E5=8C=96=E6=B5=81=
=E7=A8=8B&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">=E5=B0=81=E9=9D=A2=E8=AE=BE=E8=AE=A1=20
=E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transpar=
ent; FONT-SIZE: 13px">=E5=A6=82=E4=BD=95=E5=88=B6=E4=BD=9C=E5=A5=BD=E7=9A=
=84PPT=E7=9B=AE=E5=BD=95=20
=E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transpar=
ent; FONT-SIZE: 13px">=E5=88=B6=E4=BD=9C=E7=9B=AE=E5=BD=95=E4=B8=A4=E4=B8=
=AA=E5=9F=BA=E6=9C=AC=E5=8E=9F=E5=88=99&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">3=E3=80=81=E8=AE=A9=E6=96=87=E6=A1=A3=E7=BB=93=E6=9E=84=E6=9B=B4=E6=B8=85=
=E6=99=B0&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">4=E3=80=81=E8=AE=A9=E6=BC=94=E8=AE=B2=E9=87=8D=E7=82=B9=E6=9B=B4=E7=AA=81=
=E5=87=BA =E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR=
: transparent; FONT-SIZE: 13px">5=E3=80=81=E5=88=B6=E4=BD=9C=E7=9B=AE=E5=BD=
=95=E6=96=B9=E6=B3=95=EF=BC=88=E5=88=97=E8=A1=A8=E6=B3=95=E3=80=81=E6=97=B6=
=E9=97=B4=E8=BD=B4=E6=B3=95=E3=80=81=E5=88=9B=E6=84=8F=E7=9B=AE=E5=BD=95=E3=
=80=81=E8=BF=87=E6=B8=A1=E9=A1=B5=EF=BC=89&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">6=E3=80=81=E5=86=85=E9=A1=B5=E8=AE=BE=E8=AE=A1=EF=BC=88=E7=82=BC=E6=96=87=
=EF=BC=8C=E5=9B=BE=E7=A4=BA=E5=8C=96=EF=BC=89 =E3=80=81</span><span style=
=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transparent; FONT-SIZE: 13px">7=E3=
=80=81=E5=B0=81=E5=BA=95=E8=AE=BE=E8=AE=A1=EF=BC=88=E4=B8=8E=E5=B0=81=E9=9D=
=A2=E9=A1=B5=E7=9A=84=E4=BA=92=E5=BA=94=EF=BC=89&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">8=E3=80=81=E9=85=8D=E8=89=B2=E6=96=B9=E6=A1=88&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">=E9=A2=9C=E8=89=B2=E5=A4=9A=E5=B9=B6=E4=B8=8D=E7=AD=89=E4=BA=8E=E5=A5=BD=
=E7=9C=8B =E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR=
: transparent; FONT-SIZE: 13px">=E4=B8=BB=E8=89=B2=E3=80=81=E7=82=B9=E7=BC=
=80=E8=89=B2=E3=80=81=E8=BE=85=E5=8A=A9=E8=89=B2=20
=E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transpar=
ent; FONT-SIZE: 13px">=E9=85=8D=E8=89=B2=E5=B8=B8=E7=94=A83=E7=A7=8D=E6=96=
=B9=E6=B3=95=20
=E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transpar=
ent; FONT-SIZE: 13px">=E5=B9=BB=E7=81=AF=E7=89=87=E5=B8=B8=E7=94=A8=E7=9A=
=84=E5=8D=95=E8=89=B2=E5=8E=9F=E5=88=99&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
"><br></span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><b style=3D"FONT-SIZE: 13px"><=
font color=3D"#0f6479">=E5=9B=9B=E3=80=81=E5=B9=BB=E7=81=AF=E7=89=87=E5=8A=
=A8=E7=94=BB=E5=88=9B=E6=84=8F=E4=B8=8E=E5=A4=9A=E5=AA=92=E4=BD=93=E5=AE=8C=
=E7=BE=8E=E5=B1=95=E7=A4=BA&nbsp;</font></b></div>
<div style=3D"BACKGROUND-COLOR: transparent"><b style=3D"FONT-SIZE: 13px"><=
font color=3D"#0f6479">1=E3=80=81=E8=AE=A9PPT=E4=BA=AE=E8=B5=B7=E6=9D=A5=E2=
=80=94=E2=80=94=E5=8A=A8=E7=94=BB=E5=88=9B=E6=84=8F&nbsp;</font></b></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">=E5=8C=BA=E5=88=AB=E4=B8=A4=E7=A7=8D=E5=8A=A8=E7=94=BB=E7=B1=BB=E5=9E=8B =
=E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transpar=
ent; FONT-SIZE: 13px">=E6=8D=A2=E7=89=87=E5=8A=A8=E7=94=BB=E7=9A=84=E5=88=
=87=E6=8D=A2=E6=95=88=E6=9E=9C=20
=E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transpar=
ent; FONT-SIZE: 13px">=E9=A1=B5=E9=9D=A2=E5=8A=A8=E7=94=BB=E7=9A=84=E5=9B=
=9B=E5=A4=A7=E7=B1=BB=20
=E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transpar=
ent; FONT-SIZE: 13px">=E5=B8=B8=E7=94=A8=E7=9A=84=E5=95=86=E5=8A=A1=E5=8A=
=A8=E7=94=BB=E5=88=B6=E4=BD=9C&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><b style=3D"FONT-SIZE: 13px"><=
font color=3D"#0f6479">2=E3=80=81=E4=BD=BF=E7=94=A8=E5=A3=B0=E9=9F=B3=E5=92=
=8C=E8=A7=86=E9=A2=91=E5=A4=9A=E5=AA=92=E4=BD=93=E6=96=87=E4=BB=B6</font><f=
ont color=3D"DarkTurquoise">&nbsp;</font></b></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">=E5=A3=B0=E9=9F=B3=E7=9A=84=E8=A3=81=E5=89=AA=E4=B8=8E=E8=AE=BE=E7=BD=AE=
=E5=BA=94=E7=94=A8 =E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGRO=
UND-COLOR: transparent; FONT-SIZE: 13px">=E8=A7=86=E9=A2=91=E5=9C=A8=E5=B9=
=BB=E7=81=AF=E7=89=87=E4=B8=AD=E7=9A=84=E5=BA=94=E7=94=A8&nbsp;</span></div=
>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
"><br></span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><b style=3D"FONT-SIZE: 13px"><=
font color=3D"#0f6479">=E4=BA=94=E3=80=81=E5=B9=BB=E7=81=AF=E7=89=87=E5=AE=
=8C=E7=BE=8E=E6=BC=94=E7=A4=BA=E4=B8=8E=E6=BC=94=E8=AE=B2=E7=BB=93=E5=90=88=
&nbsp;</font></b></div>
<div style=3D"BACKGROUND-COLOR: transparent"><b style=3D"FONT-SIZE: 13px"><=
font color=3D"#0f6479">1=E3=80=81=E5=B9=BB=E7=81=AF=E7=89=87=E5=AE=8C=E7=BE=
=8E=E6=BC=94=E7=A4=BA&nbsp;</font></b></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">=E6=BC=94=E7=A4=BA=E8=80=85=E8=A7=86=E5=9B=BE=E7=9A=84=E5=BA=94=E7=94=A8 =
=E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transpar=
ent; FONT-SIZE: 13px">=E4=BD=BF=E7=94=A8=E8=8D=A7=E5=85=89=E7=AC=94=E6=A0=
=87=E8=AE=B0=E9=87=8D=E7=82=B9=20
=E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transpar=
ent; FONT-SIZE: 13px">=E5=A6=82=E4=BD=95=E6=AD=A3=E7=A1=AE=E4=BD=BF=E7=94=
=A8=E5=8F=8C=E5=B1=8F=E6=98=BE=E7=A4=BA=20
=E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transpar=
ent; FONT-SIZE: 13px">PowerPoint=E5=81=9A=E6=BC=94=E8=AE=B2=E6=8E=92=E7=BB=
=83&nbsp;</span></div>
<div><b style=3D"FONT-SIZE: 13px"><font style=3D"BACKGROUND-COLOR: rgb(255,=
255,255)" color=3D"#0f6479">2=E3=80=81=E5=B9=BB=E7=81=AF=E7=89=87=E6=BC=94=
=E8=AE=B2=E6=8A=80=E5=B7=A7&nbsp;</font></b></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">PPT=E7=9A=84=E6=BC=94=E7=A4=BA=E5=8E=9F=E5=88=99 =E3=80=81</span><span st=
yle=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transparent; FONT-SIZE: 13px">=
=E6=BC=94=E8=AE=B2=E5=89=8D=E7=9A=84=E5=87=86=E5=A4=87=E5=B7=A5=E4=BD=9C=20
=E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transpar=
ent; FONT-SIZE: 13px">=E4=B8=8D=E5=90=8C=E5=9C=BA=E5=90=88=E3=80=81=E4=B8=
=8D=E5=90=8C=E6=BC=94=E8=AE=B2=E9=A3=8E=E6=A0=BC=20
=E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transpar=
ent; FONT-SIZE: 13px">=E6=88=90=E5=8A=9FPPT=E6=BC=94=E7=A4=BA=E7=9A=84=E8=
=A6=81=E7=82=B9&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">=E7=A1=AE=E5=AE=9A=E4=BD=A0=E7=9A=84=E7=9B=AE=E6=A0=87=20
=E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transpar=
ent; FONT-SIZE: 13px">=E5=88=86=E6=9E=90=E4=BD=A0=E7=9A=84=E5=90=AC=E4=BC=
=97=20
=E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transpar=
ent; FONT-SIZE: 13px">=E4=BA=86=E8=A7=A3=E4=BD=A0=E7=9A=84=E9=99=90=E5=88=
=B6=20
=E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transpar=
ent; FONT-SIZE: 13px">=E5=AF=BB=E6=89=BE=E9=80=82=E5=90=88=E7=9A=84=E6=9D=
=90=E6=96=99&nbsp;</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
">=E5=86=99=E4=B8=8B=E5=AE=8C=E6=95=B4=E7=9A=84=E6=BC=94=E8=AE=B2=E8=AF=8D =
=E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transpar=
ent; FONT-SIZE: 13px">=E5=BC=80=E5=9C=BA=E7=99=BD=E5=92=8C=E7=BB=93=E6=9D=
=9F=E8=AF=AD=20
=E3=80=81</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transpar=
ent; FONT-SIZE: 13px">PPT=E6=BC=94=E7=A4=BA=E7=9A=84=E8=BE=85=E5=8A=A9=E5=
=B7=A5=E5=85=B7</span></div>
<div style=3D"BACKGROUND-COLOR: transparent"><span style=3D"FONT-SIZE: 13px=
"><br></span></div></div></div></div>
<div><font color=3D"#333333">----------------------------------------------=
----------------------<span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: wi=
ndow; FONT-SIZE: 10.5pt">-------------------------------</span></font></div=
>
<div>
<div>
<div><font color=3D"#0f6479"><b><span style=3D"FONT-SIZE: 19px">=E3=80=8A</=
span></b><b><span style=3D"LINE-HEIGHT: 28px; FONT-SIZE: 19px">Excel=E9=AB=
=98=E6=95=88=E6=95=B0=E6=8D=AE=E7=AE=A1=E7=90=86=E4=B8=8E=E5=9B=BE=E8=A1=A8=
=E5=BA=94=E7=94=A8</span><span style=3D"FONT-SIZE: 19px">=E3=80=8B</span></=
b></font></div>
<div><font color=3D"#333333"><br></font></div>
<div>
<div>
<div style=3D"ORPHANS: 2">
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px">=E3=80=90=E6=B7=B1=
=E5=9C=B3=EF=BC=9A09=E6=9C=8829=E6=97=A5=E3=80=91=E3=80=90=E5=8C=97=E4=BA=
=AC=EF=BC=9A10=E6=9C=8814=E6=97=A5=E3=80=91=E3=80=90=E5=B9=BF=E5=B7=9E=EF=
=BC=9A10=E6=9C=8821=E6=97=A5=E3=80=91</span></div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px">=E3=80=90=E6=88=90=
=E9=83=BD=EF=BC=9A10=E6=9C=8828=E6=97=A5=E3=80=91=E3=80=90=E8=8B=8F=E5=B7=
=9E=EF=BC=9A11=E6=9C=8804=E6=97=A5=E3=80=91=E3=80=90=E4=B8=8A=E6=B5=B7=EF=
=BC=9A12=E6=9C=8809=E6=97=A5=E3=80=91</span></div></div>
<div style=3D"ORPHANS: 2"><span style=3D"FONT-SIZE: 13px">=E3=80=90=E8=B4=
=B9 =E7=94=A8=EF=BC=9A2500=E5=85=83/=E4=BA=BA<font color=3D"#ff0000"><b>=EF=
=BC=88=E5=86=85 =E8=AE=AD=E6=96=B9=E6=A1=88=E5=92=8C=E4=BB=B7 =E6=A0=BC=E8=
=AF=B7=E8=81=94=E7=B3=BB=E9=A1=BE=E9=97=AE=E8=AF=A6=E8=AF=A2=EF=BC=89</b></=
font>=E3=80=91</span></div></div></div></div>
<div><b style=3D"FONT-SIZE: 13px"><br></b></div>
<div>
<div style=3D"POSITION: static !important; LINE-HEIGHT: 21px">
<div style=3D"POSITION: static !important">
<div style=3D"POSITION: static !important">
<div><b style=3D"LINE-HEIGHT: 1.5"><font style=3D"FONT-SIZE: 13px" color=3D=
"#0f6479">=E2=97=86&nbsp;=E7=AC=AC=E4=B8=80=E9=83=A8=E5=88=86&nbsp;=E4=BD=
=A0=E6=9C=AA=E6=9B=BE=E7=9C=9F=E6=AD=A3=E4=BA=86=E8=A7=A3=E4=BB=96=E4=BB=AC=
=E7=9A=84=E5=8A=9F=E8=83=BD&nbsp;</font></b></div>
<div><span style=3D"FONT-SIZE: 13px"><font color=3D"#333333">1.&nbsp;=E5=8D=
=95=E5=85=83=E6=A0=BC=E4=B9=8B=E9=97=B4=E7=9A=84=E5=90=88=E5=B9=B6=20
=E3=80=812.&nbsp;=E7=9B=B8=E5=AF=B9=E5=BC=95=E7=94=A8=EF=BC=8C=E7=BB=9D=E5=
=AF=B9=E5=BC=95=E7=94=A8=EF=BC=8C=E6=B7=B7=E5=90=88=E5=BC=95=E7=94=A8 =E3=
=80=813.&nbsp;VLOOKUP=E7=9A=84=E6=A8=A1=E7=B3=8A=E5=8C=B9=E9=85=8D=E6=96=B9=
=E5=BC=8F=20
=E3=80=814.&nbsp;Substitute=E7=9A=84=E7=B2=BE=E5=87=86=E4=BD=BF=E7=94=A8&nb=
sp;</font><br><font color=3D"#333333">5.&nbsp;=E6=88=AA=E5=8F=96=E7=B1=BB=
=E5=87=BD=E6=95=B0=E7=9A=84=E8=B7=B3=E8=B7=83=E6=88=AA=E5=8F=96=E6=96=B9=E5=
=BC=8F =E3=80=816.&nbsp;SUMIFS=E7=9A=84=E6=A8=A1=E7=B3=8A=E5=8C=B9=E9=85=8D=
=E6=96=B9=E5=BC=8F=20
=E3=80=817.&nbsp;SUMIFS=E5=AF=B9=E4=BA=8E=E7=A9=BA=E5=80=BC=E6=9D=A1=E4=BB=
=B6=E7=9A=84=E6=B1=82=E5=92=8C=E6=96=B9=E6=B3=95 =E3=80=818.&nbsp;CountIFS=
=E7=9A=84=E4=BD=BF=E7=94=A8=E6=96=B9=E6=B3=95&nbsp;</font><br><font color=
=3D"#333333">9.&nbsp;IF=E5=87=BD=E6=95=B0=E7=9A=84=E6=97=B6=E9=97=B4=E6=AF=
=94=E8=BE=83=E6=96=B9=E5=BC=8F =E3=80=8110.&nbsp;IF=E5=87=BD=E6=95=B0=E7=9A=
=84=E6=A8=A1=E7=B3=8A=E5=8C=B9=E9=85=8D=E6=96=B9=E5=BC=8F =E3=80=8111.&nbsp=
;=E6=95=B0=E6=8D=AE=E9=80=8F=E8=A7=86=E8=A1=A8=E7=9A=84=E7=99=BE=E5=88=86=
=E6=AF=94=E4=B8=8E=E7=BB=84=E5=90=88=20
=E3=80=8112.&nbsp;DATEDIF=E5=87=BD=E6=95=B0=E7=9A=84=E4=BD=BF=E7=94=A8=E6=
=96=B9=E6=B3=95=20
=E3=80=8113.&nbsp;=E5=88=9B=E5=BB=BA=E5=9B=BE=E8=A1=A8=E5=A6=82=E4=BD=95&nb=
sp;=E4=BB=8E=E6=95=B0=E6=8D=AE=E6=B5=B7=E6=8A=93=E5=8F=96=E6=95=B0=E6=8D=AE=
&nbsp;</font><br><br><b><font color=3D"#0f6479">=E2=97=86&nbsp;=E7=AC=AC=E4=
=BA=8C=E9=83=A8=E5=88=86&nbsp;=E8=AE=A9=E5=87=BD=E6=95=B0=E9=AB=98=E7=AB=AF=
=E8=B5=B7=E6=9D=A5&nbsp;</font></b><br><font color=3D"#333333">1.=E5=A6=82=
=E4=BD=95=E6=8A=93=E5=8F=96=E4=B8=8D=E7=AD=89=E9=95=BF=E6=96=87=E6=9C=AC=E6=
=96=B9=E6=B3=95 =E3=80=812.=E5=A6=82=E4=BD=95=E5=B0=86=E6=96=87=E6=9C=AC=E4=
=B8=8E=E6=95=B0=E5=AD=97=E8=81=94=E5=9C=A8=E4=B8=80=E8=B5=B7=E7=9A=84=E5=88=
=86=E7=A6=BB=E5=BC=80 =E3=80=813.IF=E5=87=BD=E6=95=B0=E7=9A=84=E5=B5=8C=E5=
=A5=97=E4=BD=BF=E7=94=A8=E6=96=B9=E6=B3=95=20
=E3=80=814.=E5=A6=82=E4=BD=95=E5=B7=A7=E5=A6=99=E5=88=A9=E7=94=A8VLOOKUP+=
=E6=88=AA=E5=8F=96+IF=E6=91=86=E8=84=B1=E5=A4=9A=E5=B1=82IF=E5=87=BD=E6=95=
=B0=E5=B5=8C=E5=A5=97=E7=9A=84=E5=9B=B0=E6=89=B0&nbsp;</font><br><font colo=
r=3D"#333333">5.=E5=A6=82=E4=BD=95=E5=9C=A8=E6=95=B0=E6=8D=AE=E9=80=8F=E8=
=A7=86=E8=A1=A8=E9=87=8C=E6=8A=8A=E9=87=8D=E5=A4=8D=E5=80=BC=E5=8F=98=E5=94=
=AF=E4=B8=80=E9=A1=B9 =E3=80=816.=E7=94=A8SUBTOTAL=E5=87=BD=E6=95=B0=EF=BC=
=8C=E4=BB=A3=E6=9B=BF22=E4=B8=AA=E5=87=BD=E6=95=B0 =E3=80=817.=E5=88=A9=E7=
=94=A8TEXT=E5=87=BD=E6=95=B0=E6=88=90=E4=B8=BA=E7=A5=9E=E5=99=A8=20
=E3=80=818.OFFSET=E5=87=BD=E6=95=B0=E7=9A=84=E4=BD=BF=E7=94=A8=E6=96=B9=E6=
=B3=95&nbsp;</font><br><br><b><font color=3D"#0f6479">=E2=97=86&nbsp;=E7=AC=
=AC=E4=B8=89=E9=83=A8=E5=88=86&nbsp;=E4=B9=9F=E8=AE=B8=E4=BD=A0=E6=A0=B9=E6=
=9C=AC=E4=B8=8D=E7=9F=A5=E9=81=93=E4=BB=96=E4=BB=AC=E7=9A=84=E5=AD=98=E5=9C=
=A8&nbsp;</font></b><br><font color=3D"#333333">1.=E9=AB=98=E7=BA=A7=E7=AD=
=9B=E9=80=89=E7=9A=84=E4=BD=BF=E7=94=A8=E6=96=B9=E6=B3=95 =E3=80=812.=E9=AB=
=98=E7=BA=A7=E7=AD=9B=E9=80=89=E7=9A=84=E6=A8=A1=E7=B3=8A=E5=8C=B9=E9=85=8D=
 =E3=80=813.=E5=88=A9=E7=94=A8=E6=95=B0=E6=8D=AE=E6=9C=89=E6=95=88=E6=80=A7=
=E8=A7=84=E8=8C=83=E8=A1=A8=E6=A0=BC=E8=BE=93=E5=85=A5&nbsp;</font><br><fon=
t color=3D"#333333">4.=E6=9D=A1=E4=BB=B6=E6=A0=BC=E5=BC=8F=E7=9A=84=E4=B8=
=80=E8=88=AC=E7=94=A8=E6=B3=95 =E3=80=815.=E5=88=A9=E7=94=A8=E6=9D=A1=E4=BB=
=B6=E6=A0=BC=E5=BC=8F=EF=BC=8C=E8=BF=85=E9=80=9F=E6=89=BE=E5=88=B0=E7=9B=88=
=E4=BA=8F=E7=82=B9&nbsp;</font><br><br><b><font color=3D"#0f6479">=E2=97=86=
&nbsp;=E7=AC=AC=E5=9B=9B=E9=83=A8=E5=88=86&nbsp;=E4=B8=8D=E7=94=A8=E7=BC=96=
=E7=A8=8B=EF=BC=8C=E8=AF=A5=E6=9C=89=E7=9A=84=E4=B8=80=E4=B8=AA=E4=B8=8D=E4=
=BC=9A=E5=B0=91&nbsp;</font></b><br><font color=3D"#333333">1.=E5=88=A9=E7=
=94=A8=E6=95=B0=E6=8D=AE=E6=9C=89=E6=95=88=E6=80=A7+VLOOKUP=E5=81=9A=E4=B8=
=80=E4=B8=AA=E7=AE=80=E6=98=93=E7=9A=84=E6=9F=A5=E8=AF=A2=E7=B3=BB=E7=BB=9F=
 =E3=80=812.=E5=88=A9=E7=94=A8=E6=95=B0=E6=8D=AE=E6=9C=89=E6=95=88=E6=80=A7=
+SUMIFS=E5=81=9A=E4=B8=80=E4=B8=AA=E5=8A=A8=E6=80=81=E5=9B=BE=E8=A1=A8=20
=E3=80=813.=E5=88=A9=E7=94=A8=E5=BC=80=E5=8F=91=E5=B7=A5=E5=85=B7+OFFSET=E5=
=81=9A=E4=B8=80=E4=B8=AA=E9=AB=98=E7=BA=A7=E5=8A=A8=E6=80=81=E5=9B=BE=E8=A1=
=A8&nbsp;</font><br><font color=3D"#333333">4.=E5=88=A9=E7=94=A8=E6=9D=A1=
=E4=BB=B6=E6=A0=BC=E5=BC=8F+DATEDIF=E8=AE=A9=E5=8A=B3=E5=8A=A8=E5=90=88=E5=
=90=8C=E5=88=B0=E6=9C=9F=E8=87=AA=E5=8A=A8=E6=8A=A5=E8=AD=A6 =E3=80=815.=E5=
=88=A9=E7=94=A8=E6=9D=A1=E4=BB=B6=E6=A0=BC=E5=BC=8F+=E6=95=B0=E6=8D=AE=E6=
=9C=89=E6=95=88=E6=80=A7+=E6=B7=B7=E5=90=88=E5=BC=95=E7=94=A8=EF=BC=8C=E5=
=81=9A=E7=8A=B6=E6=80=81=E5=8F=98=E5=8C=96=E6=8F=90=E9=86=92=20
=E3=80=816.=E5=88=A9=E7=94=A8=E6=95=A3=E7=82=B9=E5=9B=BE=EF=BC=8C=E6=8E=A8=
=E6=B5=8B=E4=B8=8B=E4=B8=80=E5=B9=B4=E5=A5=96=E9=87=91=E6=B1=A0=E6=98=AF=E5=
=A4=9A=E5=B0=91&nbsp;</font><br><font color=3D"#333333">7.=E6=95=B0=E6=8D=
=AE=E9=87=8F=E7=BA=A7=E5=B7=AE=E8=BE=83=E5=A4=A7=EF=BC=8C=E6=80=8E=E4=B9=88=
=E5=9C=A8=E4=B8=80=E5=BC=A0=E5=9B=BE=E4=B8=8A=E5=B1=95=E7=A4=BA=20
=E3=80=818.=E5=88=A9=E7=94=A8=E6=95=B0=E6=8D=AE=E9=80=8F=E8=A7=86=E8=A1=A8+=
=E7=BB=84=E5=90=88+=E6=9D=A1=E4=BB=B6=E6=A0=BC=E5=BC=8F=E5=AE=8C=E7=BE=8E=
=E5=91=88=E7=8E=B0=E6=95=B0=E6=8D=AE=E6=8A=A5=E5=91=8A</font></span></div><=
/div></div></div></div></div></div>
<div style=3D"FONT-SIZE: 13px"><font color=3D"#333333"><span style=3D"LINE-=
HEIGHT: 21px; FONT-SIZE: 14px">--------------------------------------------=
------------------------</span><span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-=
COLOR: window; FONT-SIZE: 10.5pt">-------------------------------</span></f=
ont></div>
<div>
<div>
<div>
<div><b><span style=3D"LINE-HEIGHT: 28px; FONT-SIZE: 19px"><font color=3D"#=
0f6479">=E3=80=8APOWER BI=E5=95=86=E4=B8=9A=E5=A4=A7=E6=95=B0=E6=8D=AE=E5=
=88=86=E6=9E=90&amp;=E5=8F=AF=E8=A7=86=E5=8C=96=E5=91=88=E7=8E=B0</font></s=
pan></b><b style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: transparent; FONT-S=
IZE: 10.5pt"><span style=3D"LINE-HEIGHT: 28px; FONT-SIZE: 19px"><font color=
=3D"#0f6479">=E3=80=8B</font></span></b></div>
<div><font color=3D"#333333"><br></font></div>
<div>
<div>
<div style=3D"ORPHANS: 2">
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px">=E3=80=90=E6=B7=B1=
=E5=9C=B3=EF=BC=9A09=E6=9C=8830=E6=97=A5=E3=80=91=E3=80=90=E5=8C=97=E4=BA=
=AC=EF=BC=9A10=E6=9C=8815=E6=97=A5=E3=80=91=E3=80=90=E5=B9=BF=E5=B7=9E=EF=
=BC=9A10=E6=9C=8822=E6=97=A5=E3=80=91</span></div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px">=E3=80=90=E6=88=90=
=E9=83=BD=EF=BC=9A10=E6=9C=8829=E6=97=A5=E3=80=91=E3=80=90=E8=8B=8F=E5=B7=
=9E=EF=BC=9A11=E6=9C=8805=E6=97=A5=E3=80=91=E3=80=90=E4=B8=8A=E6=B5=B7=EF=
=BC=9A12=E6=9C=8810=E6=97=A5=E3=80=91</span></div></div>
<div style=3D"ORPHANS: 2"><span style=3D"FONT-SIZE: 13px">=E3=80=90=E8=B4=
=B9 =E7=94=A8=EF=BC=9A2800=E5=85=83/=E4=BA=BA<font color=3D"#ff0000"><b>=EF=
=BC=88=E5=86=85 =E8=AE=AD=E6=96=B9=E6=A1=88=E5=92=8C=E4=BB=B7 =E6=A0=BC=E8=
=AF=B7=E8=81=94=E7=B3=BB=E9=A1=BE=E9=97=AE=E8=AF=A6=E8=AF=A2=EF=BC=89</b></=
font>=E3=80=91</span></div></div></div></div>
<div>
<div><br></div></div>
<div>
<div style=3D"POSITION: static !important">
<div>
<div><font color=3D"#0f6479"><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 1=
3px"><b>1.=E4=B8=80=E4=B8=AA=E5=AE=9E=E6=88=98=E6=A1=88=E4=BE=8B=E7=90=86=
=E8=A7=A3Power=20
BI=E6=95=B0=E6=8D=AE=E5=8F=AF=E8=A7=86=E5=8C=96=E6=B5=81=E7=A8=8B</b></span=
></font></div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px"><font color=3D"#333=
333">=E8=8E=B7=E5=8F=96=E6=95=B0=E6=8D=AE=E6=BA=90=E6=96=87=E4=BB=B6=E3=80=
=814=E4=B8=AA=E5=B7=A5=E4=BD=9C=E8=A1=A8=E6=96=87=E4=BB=B6=E3=80=81=E6=B8=
=85=E6=B4=97=E8=A7=84=E8=8C=83=E6=95=B0=E6=8D=AE=E6=BA=90=E3=80=81=E6=95=B4=
=E7=90=86=E4=B8=8D=E8=A7=84=E8=8C=83=E6=95=B0=E6=8D=AE=E6=BA=90</font></spa=
n></div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px"><font color=3D"#333=
333">=E5=BB=BA=E7=AB=8B=E6=95=B0=E6=8D=AE=E5=88=86=E6=9E=90=E6=A8=A1=E5=9E=
=8B=E3=80=81=E5=BB=BA=E7=AB=8B=E7=AE=80=E5=8D=95=E7=9A=84=E5=BA=A6=E9=87=8F=
=E5=80=BC=E3=80=81=E5=88=B6=E4=BD=9C=E5=90=84=E7=B1=BB=E4=BA=A4=E4=BA=92=E5=
=BC=8F=E6=8A=A5=E8=A1=A8=E3=80=81=E5=8F=91=E5=B8=83Web=E5=B9=B6=E5=B5=8C=E5=
=85=A5PPT</font></span></div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px"><font color=3D"#333=
333">=E5=8F=91=E5=B8=83Web=E3=80=81=E6=89=8B=E6=9C=BA=E6=9F=A5=E7=9C=8B=E6=
=8A=A5=E8=A1=A8=E3=80=81Power BI=E6=8A=A5=E8=A1=A8=E5=B5=8C=E5=85=A5PPT</fo=
nt></span></div>
<div><font color=3D"#0f6479"><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 1=
3px"><b><br></b></span></font></div>
<div><font color=3D"#0f6479"><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 1=
3px"><b>2.Power=20
Query=E6=95=B4=E7=90=86=E8=A7=84=E8=8C=83=E6=95=B0=E6=8D=AE</b></span></fon=
t></div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px"><font color=3D"#333=
333">Power=20
Query=E7=AE=80=E4=BB=8B=E4=B8=8E=E8=AE=A4=E8=AF=86=E3=80=81=E8=A7=84=E8=8C=
=83=E5=8C=96=E6=95=B0=E6=8D=AE=E5=85=AD=E5=A4=A7=E7=89=B9=E7=82=B9=E4=BB=8B=
=E7=BB=8D</font></span></div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px"><font color=3D"#333=
333">=E4=B8=80=E7=BB=B4=E6=95=B0=E6=8D=AE=E8=BD=AC=E4=BA=8C=E7=BB=B4=E6=95=
=B0=E6=8D=AE=E3=80=81=E8=BD=AC=E7=BD=AE=E6=95=B0=E6=8D=AE=E5=92=8C=E5=8F=8D=
=E8=BD=AC=E6=95=B0=E6=8D=AE</font></span></div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px"><font color=3D"#333=
333">=E6=95=B0=E6=8D=AE=E5=88=86=E7=BB=84=EF=BC=8C=E6=B7=BB=E5=8A=A0=E6=95=
=B0=E6=8D=AE=E5=88=97=E3=80=81Power Query=E6=95=B0=E6=8D=AE=E6=95=B4=E7=90=
=86=E5=AE=9E=E6=88=98M=E5=87=BD=E6=95=B0=E5=BA=94=E7=94=A8</font></span></d=
iv>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px"><font color=3D"#333=
333">=E6=A1=88=E4=BE=8B=E5=AE=9E=E6=88=98=EF=BC=9A</font></span></div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px"><font color=3D"#333=
333">=E6=95=B0=E6=8D=AE=E7=9A=84=E6=8B=86=E5=88=86=E5=90=88=E5=B9=B6=E6=8F=
=90=E5=8F=96=E3=80=81=E5=AE=8C=E6=88=90=E6=96=87=E6=9C=AC=E4=B8=8E=E6=95=B0=
=E5=AD=97=E6=8B=86=E5=88=86=E5=8A=9F=E8=83=BD=E3=80=81=E7=BB=9F=E8=AE=A1=E6=
=AF=8F=E4=B8=AA=E5=9C=B0=E5=8C=BA=E7=9A=84=E8=AE=BE=E5=A4=87=E6=95=B0=E9=87=
=8F</font></span></div>
<div><font color=3D"#0f6479"><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 1=
3px"><b><br></b></span></font></div>
<div><font color=3D"#0f6479"><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 1=
3px"><b>3.Power=20
Query=E6=B1=87=E6=80=BB=E6=95=B0=E6=8D=AE</b></span></font></div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px"><font color=3D"#333=
333">=E5=90=8C=E4=B8=AA=E5=B7=A5=E4=BD=9C=E7=B0=BF=E6=B1=87=E6=80=BB=E6=95=
=B0=E6=8D=AE=E3=80=81=E6=B1=87=E6=80=BBCSV=E6=95=B0=E6=8D=AE=E6=BA=90=E6=96=
=87=E4=BB=B6</font></span></div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px"><font color=3D"#333=
333">=E4=BB=8E=E6=96=87=E4=BB=B6=E5=A4=B9=E6=B1=87=E6=80=BBExcel=E6=95=B0=
=E6=8D=AEM=E5=87=BD=E6=95=B0Excel. Workbook=E4=BD=BF=E7=94=A8</font></span>=
</div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px"><font color=3D"#333=
333">=E6=A1=88=E4=BE=8B=E5=AE=9E=E6=88=98=EF=BC=9A=E5=BF=AB=E9=80=9F=E6=B1=
=87=E6=80=BB=E4=B8=80=E4=B8=AA=E6=96=87=E4=BB=B6=E5=A4=B930=E4=B8=AA=E5=9F=
=8E=E5=B8=82=E7=9A=84=E6=95=B0=E6=8D=AE=E6=96=87=E4=BB=B6</font></span></di=
v>
<div><font color=3D"#0f6479"><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 1=
3px"><b><br></b></span></font></div>
<div><b style=3D"LINE-HEIGHT: 19px; BACKGROUND-COLOR: transparent; COLOR: r=
gb(15,100,121); FONT-SIZE: 13px">4.Power=20
Pivot =E5=85=A5=E9=97=A8DAX=E5=87=BD=E6=95=B0</b></div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px"><font color=3D"#333=
333">DAX=E5=87=BD=E6=95=B0=E4=BB=8B=E7=BB=8D=E3=80=81Calculate=E6=9D=A1=E4=
=BB=B6=E7=BB=9F=E8=AE=A1=E5=87=BD=E6=95=B0</font></span></div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px"><font color=3D"#333=
333">=E8=AE=A1=E7=AE=97=E5=88=97=E5=92=8C=E5=BA=A6=E9=87=8F=E5=80=BC=E7=9A=
=84=E5=8C=BA=E5=88=AB=E5=92=8C=E4=BD=BF=E7=94=A8=E6=96=B9=E6=B3=95=E3=80=81=
YTD=EF=BC=8CYOY=EF=BC=8CMOM=EF=BC=8C=E7=A7=BB=E5=8A=A8=E5=B9=B3=E5=9D=87</f=
ont></span></div>
<div><font color=3D"#0f6479"><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 1=
3px"><b><br></b></span></font></div>
<div><font color=3D"#0f6479"><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 1=
3px"><b>5.Power=20
BI=E5=AE=8C=E6=88=90=E9=94=80=E5=94=AE=E4=B8=9A=E7=BB=A9=E6=8A=A5=E8=A1=A8=
=E8=AE=BE=E8=AE=A1</b></span></font></div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px"><font color=3D"#333=
333">=E8=8E=B7=E5=8F=96=E6=95=B0=E6=8D=AE=E4=B8=94=E6=95=B4=E7=90=86=E8=A7=
=84=E8=8C=83=E3=80=81=E5=88=9B=E5=BB=BA=E6=95=B0=E6=8D=AE=E6=A8=A1=E5=9E=8B=
-=E5=BA=A6=E9=87=8F=E5=80=BC=E3=80=81=E9=94=80=E5=94=AE=E4=B8=9A=E7=BB=A9=
=E6=8A=A5=E8=A1=A8=E5=8F=AF=E8=A7=86=E5=8C=96</font></span></div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px"><font color=3D"#333=
333">=E5=90=84=E5=9F=8E=E5=B8=82=E5=88=A9=E6=B6=A6=E6=83=85=E5=86=B5=E5=88=
=86=E6=9E=90=E3=80=81=E6=95=B0=E6=8D=AE=E5=8F=AF=E8=A7=86=E5=8C=96=E4=B8=8E=
=E4=BC=A0=E7=BB=9F=E6=95=B0=E6=8D=AE=E6=8A=A5=E8=A1=A8=E6=AF=94=E8=BE=83=E3=
=80=81=E6=94=B6=E5=85=A5=E4=B8=8E=E6=88=90=E6=9C=AC=E5=AF=B9=E6=AF=94</font=
></span></div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px"><font color=3D"#333=
333">=E5=90=84=E5=9F=8E=E5=B8=82=E7=B4=AF=E8=AE=A1=E7=94=A8=E6=88=B7=E6=95=
=B0=E5=88=86=E6=9E=90=E3=80=81=E5=90=84=E5=9C=B0=E5=8C=BA=E6=94=B6=E5=85=A5=
=E6=83=85=E5=86=B5=E5=88=86=E6=9E=90=E3=80=81=E9=94=80=E5=94=AE=E4=B8=9A=E7=
=BB=A9=E6=8A=A5=E8=A1=A8=E8=AE=BE=E8=AE=A1=E4=B8=8E=E7=BE=8E=E5=8C=96</font=
></span></div>
<div><span style=3D"LINE-HEIGHT: 19px; FONT-SIZE: 13px"><font color=3D"#333=
333">=E5=8F=96=E8=89=B2=E5=99=A8=E5=BA=94=E7=94=A8=E3=80=81=E6=B7=BB=E5=8A=
=A0LOGO=E4=B8=8E=E5=9B=BE=E6=A0=87=E3=80=81=E6=8E=92=E7=89=88=E5=8E=9F=E5=
=88=99=E7=9A=84=E5=9F=BA=E7=A1=80=E5=BA=94=E7=94=A8</font></span></div></di=
v></div></div></div></div></div>
<div><font color=3D"#333333">----------------------------------------------=
----------------------<span style=3D"LINE-HEIGHT: 1.5; BACKGROUND-COLOR: wi=
ndow; FONT-SIZE: 10.5pt">-------------------------------</span></font></div=
></div>
<div><b><font color=3D"#333333">=E6=8A=A5 =E5=90=8D =E5=9B=9E =E6=89=A7=EF=
=BC=9A&nbsp;</font></b></div>
<div><font color=3D"#333333"><br></font></div>
<div><font color=3D"#333333">=E5=8F=82=E5=8A=A0=E8=AF=BE=E7=A8=8B:&nbsp;</f=
ont></div>
<div><font color=3D"#333333">=E5=8F=82=E5=8A=A0=E5=9C=BA=E6=AC=A1=EF=BC=9A&=
nbsp;</font></div>
<div><font color=3D"#333333">=E4=B8=8E=E4=BC=9A=E4=BA=BA=E5=91=98=E8=B5=84=
=E6=96=99=EF=BC=9A=E5=85=AC=E5=8F=B8=E5=90=8D=E7=A7=B0=EF=BC=9A____________=
_____&nbsp;</font></div>
<div><font color=3D"#333333">=E2=91=A0 =E5=A7=93=E5=90=8D=EF=BC=9A_________=
_ =E8=81=8C=E4=BD=8D=EF=BC=9A___________ =E7=94=B5=E9=82=AE=EF=BC=9A_______=
_______=20
=E8=81=94=E7=B3=BB=E6=96=B9=E5=BC=8F_________________&nbsp;</font></div>
<div><font color=3D"#333333">=E2=91=A1 =E5=A7=93=E5=90=8D=EF=BC=9A_________=
_ =E8=81=8C=E4=BD=8D=EF=BC=9A___________ =E7=94=B5=E9=82=AE=EF=BC=9A_______=
_______=20
=E8=81=94=E7=B3=BB=E6=96=B9=E5=BC=8F_________________&nbsp;</font></div>
<div><font color=3D"#333333">=E2=91=A2 =E5=A7=93=E5=90=8D=EF=BC=9A_________=
_ =E8=81=8C=E4=BD=8D=EF=BC=9A___________ =E7=94=B5=E9=82=AE=EF=BC=9A_______=
_______=20
=E8=81=94=E7=B3=BB=E6=96=B9=E5=BC=8F_________________</font></div>
<div><font color=3D"#333333">=E8=81=94=E7=B3=BB=E4=BA=BA=E8=B5=84=E6=96=99=
=EF=BC=9A=E5=A7=93=E5=90=8D=EF=BC=9A_________________=E9=83=A8=E9=97=A8=EF=
=BC=9A_____________________=20
=E8=81=8C=E4=BD=8D=EF=BC=9A______________________&nbsp;</font></div>
<div><font color=3D"#333333">=E7=94=B5=E8=AF=9D=EF=BC=9A________________=20
=E7=94=B5=E9=82=AE=EF=BC=9A___________________&nbsp;</font></div>
<div><font color=3D"#333333"><br></font></div>
<div>
<div><font color=3D"#333333">=E8=81=94=E7=B3=BB=E4=BA=BA=EF=BC=9A=E5=91=A8=
=E5=85=88=E7=94=9F &nbsp;Steven Zhou</font></div>
<div><font color=3D"#333333">=E7=94=B5 =E8=AF=9D=EF=BC=9A189-3042-8162</fon=
t></div>
<div><font color=3D"#333333">=E9=82=AE =E7=AE=B1=EF=BC=9Asteven.zhou01 @vip=
.163.com</font></div>
<div><font color=3D"#333333">=EF=BC=88=E6=8A=A5 =E5=90=8D =E5=9B=9E =E6=89=
=A7 =E8=AF=B7 =E5=8F=91 =E9=80=81 =E8=87=B3 =E6=AD=A4 =E9=82=AE =E7=AE=B1=
=EF=BC=8C=E8=AF=B7 =E5=8B=BF =E7=9B=B4 =E6=8E=A5 =E5=9B=9E =E5=A4=8D=EF=BC=
=89</font></div>
<div><font color=3D"#333333">=E5=BE=AE=E4=BF=A1=E5=92=A8=E8=AF=A2=E8=AF=B7=
=E6=B7=BB=E5=8A=A0=E5=BE=AE=E4=BF=A1=E5=8F=B7=EF=BC=9A=E5=BE=AE=E4=BF=A1=E5=
=90=8C=E6=89=8B=E6=9C=BA=E5=8F=B7</font></div>
<div><font color=3D"#333333"><br></font></div>
<div><font color=3D"#333333">=E9=80=80=E8=AE=A2=EF=BC=9Asteven.zhou01=20
@vip.163.com=EF=BC=8C=E8=AF=B7=E5=8F=91=E9=80=81=E9=82=AE=E4=BB=B6=E8=87=B3=
=E6=AD=A4=E9=82=AE=E7=AE=B1</font></div></div></div>
<p>xdvvp</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>e8s6c77.50.13.79le8xc1</p>
<p>=E6=83=B3=E5=86=A4=E5=99=AC=E6=80=A8=E7=BC=9D=E7=AB=96=E9=B8=BF=E6=86=A8=
=E6=9C=AD=E6=B4=97=CF=89=CF=85=CE=B8=CF=81=CE=B1=CE=B6</p>
<p>=D0=B7=D0=B5=D1=88=D0=BD=D0=BC=D0=B7CLNLCEi9Fajl</p>
<p>77.50.13.794432481458Shetisl</p>
<p>lGZBat77.50.13.791fd77tvhe</p>
<p>=E9=9A=94=E6=A1=93=E8=B5=B7=E9=94=80=E5=AF=BF=E5=A1=98=E9=81=93=E6=97=BA=
=E8=B4=A4=CE=BA=CF=89=CE=B6=CE=BB=CE=B6=CE=B6=CF=85=CE=BF</p>
<p>=D0=B5=D1=84=D0=BF=D1=85=D1=8D=D1=87=D1=83=D0=B8=D1=87=D1=8EPLWVRQ3HCtfe=
jrg</p>
<p>77.50.13.79939330Leigh</p>
<p>AwXVN8s77.50.13.79tq9wzj75w</p>
<p>VuFKAFP77.50.13.7968pliqa4l</p>
<p>=E7=94=9A=E5=BC=95=E8=B7=9D=E8=BD=B4=E9=81=A3=E7=94=9A=E6=89=AC=E7=A1=80=
=E6=8B=8D=CF=81=CF=81=CE=B7=CF=82=CF=82=CE=B2</p>
<p>=D0=B9=D1=89=D1=89=D0=B8=D1=8ELNMHCIZILWsCF6q</p>
<p>77.50.13.792178606Sheteet</p>
<p>AqkA0M777.50.13.7985sxdzdw44</p>
<p>=E6=A4=85=E4=B9=B3=E5=A4=AD=E6=95=A6=E9=95=8C=E8=A7=A6=E9=AA=8B=CF=87=CE=
=BB=CE=BE=CE=B2=CE=B9=CE=B6=CE=B6=CE=BD=CF=86</p>
<p>=D0=B6=D1=91=D0=BC=D0=B8=D1=8E=D1=8F=D1=8AXHABUVBZv12kJX</p>
<p>77.50.13.7977792318Tekeauski</p>
<p>CIIG7o977.50.13.79np4p19ww4a</p>
<p>=E7=BA=AB=E6=96=BD=E7=9B=86=E5=9C=A8=E5=9B=A4=E8=86=9C=E9=92=B1=E7=B2=AE=
=E6=B0=91=E8=93=9D=CF=88=CE=BC=CE=BC=CF=81=CE=B9=CF=85</p>
<p>q82301yrt=D1=91=D0=B0=D1=81=D0=BF=D1=8B=D1=80=D1=80gndvqo=E0=B8=8F=E0=B9=
=85=E0=B8=A4=E0=B8=AC=E0=B8=89=E0=B8=AA=E0=B8=AE=E0=B8=9D</p>
<p>sfvfeibh6=E3=82=A1=E3=82=A6=E3=81=B8=E3=83=A7=E3=81=87=E3=81=A177.50.13.=
79</p>
<p>Ronough77.50.13.79</p>
<p>=C3=ABg=C3=AAtto=C3=A0DKMMZ=E8=B0=AD=E9=94=AF=E5=9A=B7=E7=8C=8E=E5=8D=AB=
=E7=A0=8C=E5=B8=B7=E9=AC=BC=E5=A8=93=E5=9A=B7=CE=BF=CF=80=CF=80=CE=B8=CE=BC=
</p>
<p>5i0x7lt9g=D0=BD=D1=82=D0=B1=D0=BE=D0=BF=D0=B0nvfnrbusmt=E0=B8=82=E0=B8=
=9E=E0=B8=84=E0=B8=9B=E0=B8=94</p>
<p>sfvfeibh5=E3=81=B9=E3=82=BB=E3=82=81=E3=83=91=E3=81=89=E3=81=A277.50.13.=
79</p>
<p>Sisough77.50.13.79</p>
<p>=C3=AF=C3=A7o=C3=AEvdHPVIX</p></span></tr></tbody></table></tr></tbody>
<div></div>
<div></div></body></html>


