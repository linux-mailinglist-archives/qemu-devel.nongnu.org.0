Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8652B6F2533
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 17:35:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psmak-0000zo-9R; Sat, 29 Apr 2023 11:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <octaveflon@outlook.fr>)
 id 1psmag-0000zE-QZ
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 11:34:26 -0400
Received: from mail-cwlgbr01olkn0152.outbound.protection.outlook.com
 ([104.47.20.152] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <octaveflon@outlook.fr>)
 id 1psmae-0007O4-2f
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 11:34:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAYD98Dc1MwB+g0bsxIC4kX4t5o10y4vjZOU+aZh49nd1lR4rekIaSl8w6+nQulkfwHL+4xPt8sGbvTxJ7rqRdNt3wQUazXLyHNJhgmddEdY9ahcboI+mu0yBqwIHEES6egjPLxq6FYux2IxaP2MpWPXQjEaiSPsVqVXb7Z82Vzq3RZ8out0/7W4QCqNLsOv1phfEdj2KPLNlaFwnRz77RKxlzIc9yBxkWrIWcAmAOPsogmwkWNpqrsz+OLW29dl597duXwwpeA9F8hms6gHicmVZSFV2zLM9ZdpnAYOKlVhOPZz1bDfGhmk+va+Ufy0GomnK5DbHtItD7o0QFd2Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EH0zlIis29iOhslTOMEzCJx9Y00kNQoQFUPGdJ8nwa0=;
 b=UB3LW075H92ywIsFuXZ6qhHro5g2AOGwsTQ8EijUCDEn4oR3tTz7Ruh9cR2ol7coo0r3jYsYHaXRxhjEgjPgSJKvhjtY1waE5m5wvBMNGJCuDJFAnRc4DPf2MrmlCX9eHFWBcXlMsKJF/qVVOzs35jN3nRzf9ZgpIgGmWvFMD4Ezmf1FIxHou9ROevJrED1xWeaV0lo6oN6CcaSFu2L7lSnKGuGUVgr7EkRq++VMNBJ2xjvpmIoGWKFRFcbk7p31jn9pR09hfwtXlcC7PrGO4Y+7VYr16afsZalKilmuBq1bYmg1nDr/oTPGe1j7AUfRRodKCYiIdT9+FpAMXNYP4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CWLP265MB5209.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1c0::10)
 by LO4P265MB6249.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:27d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.9; Sat, 29 Apr
 2023 15:29:20 +0000
Received: from CWLP265MB5209.GBRP265.PROD.OUTLOOK.COM
 ([fe80::9ecf:3e27:7b48:a256]) by CWLP265MB5209.GBRP265.PROD.OUTLOOK.COM
 ([fe80::9ecf:3e27:7b48:a256%7]) with mapi id 15.20.6363.010; Sat, 29 Apr 2023
 15:29:20 +0000
From: "octaveflon@outlook.fr" <octaveflon@outlook.fr>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: VNC clipboard support
Thread-Topic: VNC clipboard support
Thread-Index: AQHZeq9OUDJDSuscVkmmLVAbl5sc4g==
Date: Sat, 29 Apr 2023 15:29:20 +0000
Message-ID: <CWLP265MB5209050A121EB63FE07F9BD5A8689@CWLP265MB5209.GBRP265.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [vLim82gnX8NliVDv/5kN4kTARSthH6y1l4jf1uj5FmvNxfqvhcmOb4PE7FR3YkjG]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5209:EE_|LO4P265MB6249:EE_
x-ms-office365-filtering-correlation-id: b6fa5202-5d95-43d8-1d95-08db48c6809a
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 87qaYwZ8qDEbfTWJ+FkF7WPYLNBIfgyYDlwKJDPTB4NgGkvu9VOnZtOYWuAgQJ6qxksCKl40RqaI88HxiBU6J5nEiShHzuD+cesZnFaxRv4Kyjc5uKfOeYm5filN9exaa1zG2J9JfrZNBhROsL/GU/FChw3Tkrg4eU1GfVnM5RDXM8bYlnmkSEYfs4M+Cg7M5AyPBdJ2Aud9kKTWhX+M6o9fkixPMX+E75XUyG8L7nccXA9QD/SujSeO58KLC+QxdcBa7uCjy3ftOBP1ao6spwJqAaVxTe++ul+VwWiASGcLMcUYqJRWp9BdPPOGSOnLOiOdQRC/YZSu68qAJ2UkC6KfUDNLCxbaQRdMUYOIllfnRs5VEyAmPJYOjlS1weYm3kNc4OkwuF1lVAhfwsqbIIUbjIuLSNKJFX/lUWISXNMHc5GiFqL+gZErpkIy/rnMFyfzSPhIHkBx1OgTpDcSQwkLnNgWjaFsDOfP/R5aK1/+9pT8KITT0ZnoEbr+hpXkiKVBKWIjfzjX/c/JsBBStK6u5EDHUTcxVrjfRd4l/+zFGCfA7di/tpFjOdDDGmhJ
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?blZXpdb4Ubpwtw/7IbBOLf+YAQT1xWepQEPuSckrsqPzvzrITRiY594AiS?=
 =?iso-8859-1?Q?patE3pQRFcM7C2uKuEc5tl3Oe7fBtgGyi/r7rbn7lJHcyTGXRXWSgmBVAP?=
 =?iso-8859-1?Q?/vxxZ8sKPqqE+vNHXdh7W+Xrs8DSjfCZCcCLQiK3GwTqWOtAynuRZsIu3P?=
 =?iso-8859-1?Q?9IgDQuLh/KlgkeeeZNN5ysky5NhV2hC1kEcNeoVj3GDbN0h4O/0sAgAK8p?=
 =?iso-8859-1?Q?XAp4JCchLN6HoKHl8PeUJ32sok0IE41im44HjFVVTRHzR4hWa7gsVNZgC2?=
 =?iso-8859-1?Q?IRcoRPV7cNgD6cid4OgSaoBwdfWShQL4k1YA1Eu+zsV+tBVF9aiLID79ip?=
 =?iso-8859-1?Q?y5JqS17eaEf0Drs0xSox+oBOhDQUdfSJCw67Nq00jMbhCeCfEPHx1rXLPr?=
 =?iso-8859-1?Q?O4ZjMcmzOkpztJWWpSqQYXgkc7jPhzlZ0BDd5569mzDiThqwKw94dK2k8J?=
 =?iso-8859-1?Q?8/A5m/GQFLywa1U1PpMyU0HBRIUlsxv1qurjzZBlvuGmA0LyghGaOjuzET?=
 =?iso-8859-1?Q?BjbXKfLbK4I95ua0aengthQoaujmOzL4lcb+Op3abpOf6kJ9OZ9D9SU15u?=
 =?iso-8859-1?Q?g/FzZ8kMZW/9YSQbW/8Hk4Xj6o4wrP8PfQbH+WO6tVtExjo8U1cX5Pm6zg?=
 =?iso-8859-1?Q?MKlsx32f/ooDuYzALh5PfwAUywlxgKqKoppeKL5eD7bhJA54Bhdoav8Nfx?=
 =?iso-8859-1?Q?yTb//2TYBNHl9xvGPhgiI2tvgEnDAEaMD1+RcSyy3Oq2F/BMYsMudOY9U4?=
 =?iso-8859-1?Q?6v35yoxQMs7FCHsMVIBYIJI2zL2LXib3igMX+W8edy4ECZyCapinWD8WCX?=
 =?iso-8859-1?Q?NxexpYivsppCoX4xU4h0s6b5/9tAgRY5yx1K/okmPDCMcyqqIvqeu6mv2N?=
 =?iso-8859-1?Q?pmDFG9HjcXM5C4xxwFxiSN84yKFyskI6y7Sk1CBFUA1Q8Ux5MKsqEwTmWo?=
 =?iso-8859-1?Q?6r7iI8avk9pDk+5/tuRqBq3kKoyJ7JOMmB7oxOGgxeTs/CrL7rqeBAgQPk?=
 =?iso-8859-1?Q?cRTjJhYGXsg9a8LSrSwJZ1rn69HVZWBJvcW9NSRvwbr0GNjg8kQfBcIjOR?=
 =?iso-8859-1?Q?BqMMaE54tRA/B65+j4yYg3yjnemmUiXS8kbdeB+64RoX/eJtRcaXwdbDqL?=
 =?iso-8859-1?Q?YRYPMunAMiJPqdcErIUZL2G/mxqSg6VhHhD8d1oW+87XUxynPNKD1kIZtQ?=
 =?iso-8859-1?Q?NgFc2uosLpvCfYNotyb1NYIOns831TfFNEKA+IJ9ih46th7f/qY5RTtKiF?=
 =?iso-8859-1?Q?Bhic2nPgyaDk3PAXCQ3SyGOCbNXhRWgfATARkwrSs6VaXVbYlRCfHirADc?=
 =?iso-8859-1?Q?j2Y7NFYG0A/7hFvaxKiBdo+9qA=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CWLP265MB5209050A121EB63FE07F9BD5A8689CWLP265MB5209GBRP_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-5e42a.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5209.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fa5202-5d95-43d8-1d95-08db48c6809a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2023 15:29:20.1116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6249
Received-SPF: pass client-ip=104.47.20.152; envelope-from=octaveflon@outlook.fr;
 helo=GBR01-CWL-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--_000_CWLP265MB5209050A121EB63FE07F9BD5A8689CWLP265MB5209GBRP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm trying to use the copy/paste with VNC.

I'm launching qemu with:

$ qemu-system-x86_64 -hda debiandisk.img vnc :1

I'm using tightvncviewer which has support for copy/paste.

I try to copy text between guest and host.

It doesn't work. Neither from host to guest or guest to host.

As far as I know, there is clipboard support in VNC (ui/vnc-clipboard.c and=
 so on).
With wireshark, I can see that tightvncviewer send clipboard requests.

Am I missing some configuration?

Note:
I also tried to launch qemu with:
$ qemu-system-x86_64 -hda debiandisk.img vnc :1 -device virtio-serial-pci -=
spice port=3D5930,disable-ticketing=3Don -device virtserialport,chardev=3Ds=
picechannel0,name=3Dcom.redhat.spice.0 -chardev spicevmc,id=3Dspicechannel0=
,name=3Dvdagent
but with no success.

Questions:
Does copy/paste works with VNC? (I'm beginning to think no?)
Do I have to install something in the VM? (what?)

Thank you

--_000_CWLP265MB5209050A121EB63FE07F9BD5A8689CWLP265MB5209GBRP_
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
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Hello,
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">I'm trying to use the copy/paste with VNC.</d=
iv>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">I'm launching qemu with:</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">$ qemu-system-x86_64 -hda debiandisk.img vnc =
:1</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">I'm using tightvncviewer which has support fo=
r copy/paste.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">I try to copy text between guest and host.</d=
iv>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">It doesn't work. Neither from host to guest o=
r guest to host.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">As far as I know, there is clipboard support =
in VNC (ui/vnc-clipboard.c and so on).</div>
<div class=3D"ContentPasted0">With wireshark, I can see that tightvncviewer=
 send clipboard requests.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Am I missing some configuration?</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Note:</div>
<div class=3D"ContentPasted0">I also tried to launch qemu with:</div>
<div class=3D"ContentPasted0">$ qemu-system-x86_64 -hda debiandisk.img vnc =
:1 -device virtio-serial-pci -spice port=3D5930,disable-ticketing=3Don -dev=
ice virtserialport,chardev=3Dspicechannel0,name=3Dcom.redhat.spice.0 -chard=
ev spicevmc,id=3Dspicechannel0,name=3Dvdagent</div>
<div class=3D"ContentPasted0">but with no success.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Questions:</div>
<div class=3D"ContentPasted0">Does copy/paste works with VNC? (I'm beginnin=
g to think no?)</div>
<div class=3D"ContentPasted0">Do I have to install something in the VM? (wh=
at?)</div>
<div><br class=3D"ContentPasted0">
</div>
Thank you<br>
</div>
</body>
</html>

--_000_CWLP265MB5209050A121EB63FE07F9BD5A8689CWLP265MB5209GBRP_--

