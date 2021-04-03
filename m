Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426FF3534B8
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Apr 2021 18:30:14 +0200 (CEST)
Received: from localhost ([::1]:42860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSjA4-0001VN-Ml
	for lists+qemu-devel@lfdr.de; Sat, 03 Apr 2021 12:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1lSj9D-00013y-Dh
 for qemu-devel@nongnu.org; Sat, 03 Apr 2021 12:29:19 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:35319)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1lSj9B-0001IB-92
 for qemu-devel@nongnu.org; Sat, 03 Apr 2021 12:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617467357; x=1649003357;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=YkXtCT1ukxXXZGHl65E8x6eajSeBlDClYf96xSoKwGQ=;
 b=M59b30CMil3YRb1SjoEqShril4UsZIqVH1IAorXxy9SfmTXsa3dp0kAX
 +5doX6XCUGkTsR2wumuPCNvZlLH8WhVvhHm8VJskim6QTW8NR6TrgYIcD
 acC+0NlHM5tKDyGcGy7mzgNpXy2NeUNAal7d+jxtN3o1uRF5meyfdre02 E=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 03 Apr 2021 09:29:13 -0700
X-QCInternal: smtphost
Received: from nasanexm03a.na.qualcomm.com ([10.85.0.103])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 03 Apr 2021 09:29:13 -0700
Received: from nasanexm03f.na.qualcomm.com (10.85.0.47) by
 nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 3 Apr 2021 09:29:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03f.na.qualcomm.com (10.85.0.47) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Sat, 3 Apr 2021 09:29:13 -0700
Received: from BN7PR02MB4194.namprd02.prod.outlook.com (2603:10b6:406:f8::18)
 by BN8PR02MB5777.namprd02.prod.outlook.com (2603:10b6:408:bb::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Sat, 3 Apr
 2021 16:29:08 +0000
Received: from BN7PR02MB4194.namprd02.prod.outlook.com
 ([fe80::dd4b:260f:b5df:a879]) by BN7PR02MB4194.namprd02.prod.outlook.com
 ([fe80::dd4b:260f:b5df:a879%7]) with mapi id 15.20.3999.032; Sat, 3 Apr 2021
 16:29:08 +0000
From: Brian Cain <bcain@quicinc.com>
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
Subject: testing/next - hexagon toolchain update
Thread-Topic: testing/next - hexagon toolchain update
Thread-Index: Adcopleuoa++F+G2QduyoJlnZb/5iQ==
Date: Sat, 3 Apr 2021 16:29:07 +0000
Message-ID: <BN7PR02MB4194DF5752EF3BADE858018DB8799@BN7PR02MB4194.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [104.54.226.75]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf289f85-f0af-4b3c-451e-08d8f6bd9ae1
x-ms-traffictypediagnostic: BN8PR02MB5777:
x-microsoft-antispam-prvs: <BN8PR02MB57772A912A9451747CDC5EA9B8799@BN8PR02MB5777.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:428;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 91nKFLVP8gYVnx7HQy9426Hz3a9/kHtV6pCxNCdB7KnIWiVgE86755P0PJH7GlrQe5Es4+3tJUzmUH/TErtZBGsA+2mqDopAjlDp2/B4KvGGXcrcVqrDIpRd78yyC/mFVmWfRxM1M16LyUGk8CwLeJRC2o+VzLH//XfOw7jpwlb63zt4GePdpV+/14Ae8JeJ0NjOash6ko8CwJ72p3fNUI6XAdn/DUvMdxUnzbVtaCr6XWr/6tXRoK4NCRC88lrYJxTpv9VFbIi3VaHA9VsnrrdU3EYrMvaFi1QSEzBiYHySE4Ryf13o4NhgBhQwrKH5ZMjayThexLCVPIJ9m7ZDxjX9TKpAR/uzNxpZU7Ol+/m1/0q6DvNXm4bFDpxb3FBxBbetqpz8Qtsr6XTQKH9YUf6zhZkd9a2H/v57cmejE+sIaXFPUWv7othW5NMmdkGYh1aYgwGeoEu6Ey4d05Sk3hUH4N17oTZnjthGWdtpJ1jXmSi9YgspiKKb2qCy39ZLWxsHelZRAXgmI4nOX59it7HJ7Jf3otLlj3rEmdwPKOkCcZhvIqUutlSEgYnIvmnEPCNjoc7rPmczpx/EYo5hd02V1AjWzpx9gljn4A2F1JIZ9CiIOjCRsB/FXxO+ris3MkvW8MX9PYgZ0nImw9AK3pffWFN1AoRnk9MhTD8VB+ya9TDIfxGEInyCa43Y/Lx+0NmKnnYgvNc8Rxlo+/aJlyAc3XNH4e0UJuE8QQRbsA1X66yC7ehenRctyoHorS3H
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4194.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(15650500001)(83380400001)(2906002)(99936003)(8676002)(8936002)(186003)(71200400001)(478600001)(966005)(5660300002)(6916009)(4326008)(86362001)(316002)(38100700001)(33656002)(6506007)(66946007)(66616009)(66476007)(26005)(66446008)(55016002)(66556008)(76116006)(64756008)(9686003)(7696005)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?Ob66ZNYL+ugTDqULUUQfkEZlfz5P/IWmDlZ+f9sBF9fxzmjrXGDmuojCgs?=
 =?iso-8859-1?Q?jKiIb5Pian8DdK8Zreo+QateUiK4w3pLXRphS3YL9+F3aEe5TiUuBDecXY?=
 =?iso-8859-1?Q?Z/7Qy5E+Kav0WBylvOf3gt5bNJKQQcrdxcspeF9obvDt491s8pJ/5Pz4Bb?=
 =?iso-8859-1?Q?/Xh+jpLNV0+qUGRrZUcs9CHeK4meDjbtU46zDEHb2p2ANcPiXiKHmnvByX?=
 =?iso-8859-1?Q?pNm6I+zo+YfTKvXvQmcA2LpPl5armiICA0KUmuE7wjdRPAVLMa4p1hWB9c?=
 =?iso-8859-1?Q?OrJ3w4sy7hqmbTrZ0FoSCNgKdrGpVg1RTaw1Af9Q5oKjMAvF0V/Sdyf4H7?=
 =?iso-8859-1?Q?zyeZXbSy3RdkSJVTaWss7Z9D0DiQ+/LiMOTH0guMEgCR4MLllv+5EUFByE?=
 =?iso-8859-1?Q?cFbIIkabUB1RzqlLXWxG0eaVRryPx+//CbUS6WdcNFYemKAuM+FifUlXVy?=
 =?iso-8859-1?Q?+ll3x2/iB0PSe9IxEnVDW7VGDZykJsYRqEJfddyvZ3Evozj38PZl6q6yCW?=
 =?iso-8859-1?Q?zxEO8uoWUYLmg6psGpbs77KHVen/FbcX+Fa5WVNfpUvEsuXb8m9F0O43Lw?=
 =?iso-8859-1?Q?qgtmDqKzo73aTUy1Vi0ruOTvBsTggJfyb9zubX2OeTxFu9os4DFdI3WgCD?=
 =?iso-8859-1?Q?q+yYGatQnoI5a4AKdNu8SKKVSqboSoIu4m4ZRUykbyEdi0Ziqgcb6Ozv2k?=
 =?iso-8859-1?Q?AIlZEYi/q/LIJ8pmjOzIfvAKoT1l+4hCSESIFrZjQMWbeLuT/CsL3Z8N8l?=
 =?iso-8859-1?Q?8kP0B3hma5+7s2lOQb4hF09Fkw/ZCrjZeaZ8/5cwULS810tBHUWsp1npHO?=
 =?iso-8859-1?Q?8L+mlJp7q1AZ+iGg3ftYT6HTvpi6fZhSqxSrQXztML1Bsf02WarRallHUY?=
 =?iso-8859-1?Q?twoWfo4vRmhE6zfxoHg8nsvFt+jsjpKxcfsyyF+0knxFhyNvQ4AFXgheO4?=
 =?iso-8859-1?Q?tpFueE0FxgAQZTQDn5wXZ3FZPOzDdh+W7q1EWyOBpAc+w003W85pBA2SsJ?=
 =?iso-8859-1?Q?6r3LHM63FoySBtsSSdQsbdjaqKM9j+BCJ0qCUVTTWqljOmdurgjr4EpJj/?=
 =?iso-8859-1?Q?JYQ9v4R1h5yiwMF02iPasCRZb9zaFx3+kNoBdeshEjBaUU2vPI4e37sCKp?=
 =?iso-8859-1?Q?hBVzAP+hluGv2/3W1ZNslTU7sx6YfoRsQ98kWvaktAOoGKN2z1BCiP3qQn?=
 =?iso-8859-1?Q?ApN5MsoZjENCa8K4h0mZFcGAYfgS554eR8AXEL6Mpf+5SueT12Bakjhxg/?=
 =?iso-8859-1?Q?ZXiJoYxWArPAlnKeyZIHTYO2dXgGLj7prg6iyCuZ28gdCyF9yWM0N9bDKe?=
 =?iso-8859-1?Q?jm67yepJuqipNrWlMsMBhkVe1ECB38+LLhXpVOEWFhp9Ld0aVC9Tz1MwHP?=
 =?iso-8859-1?Q?NVihCaFOa6?=
x-ms-exchange-transport-forked: True
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4lChL8OZ4jFEdnsp4FwK8a57ZYhrrQ0C+q4Yr4dVwKsJc3tI1CVqsZEZjmoIpxcjpwcU4HdZUuI6Bk30JQdWH4itzXSufaI9FGMwdpb3nHCFb9HBwAHcFDO1NiSOLcEHYgMtyPSfVMhfi1I1kOWxnfonpVoR0pcF3XasY5EVDJ0Gsv51EplaeLfwzAe4hxn90BDlRffxCKGY8ouG0NlP6fQGsd+eMmskxeJfRnMpJoasaMd9S3Z2Pkbaj+l4rWM0iKIinPXH2q1Aj2LHsOBGsQ92Fyastmpt6/GOVU13OuyN85mmVNLW6nAaVlmZFor02V7UPEyimj09U489OAZOQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEdI2YPxZBLY8JPmbn3eVkS4Qq8bBoHkqynOUC3ozdY=;
 b=Wo/1r1syA1/ixC2iR4XeNXhvqOF6iJcoWoIJup80UK+lUbF75iUi1KUvhYqeMKBmI8OUD2Vca89lTjL1rLg86HfcJJ54oSCWZGnu1hqurNkXLz4Hd5gfNbavEIFn1buWDjUrF8NoZbZ7NdzhAwTRvfIENP6sJoAmyfIkTfuvIAwSpxL5vRfUn0C0X+QH0S558t3VG8k+PDiYvcvE/bi7BzFUDKYDOpGFPBqoMVVej+9ecCBoJuDUhQtioJH37dVZz63T8Zq+a/RPPzFdIPMuRhDJT5+HTSUpxB/afE/dnJWM8YqTSzQdkLCmKsoczBK6Yr1RcK1ePp7nES7OILVqqQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN7PR02MB4194.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: cf289f85-f0af-4b3c-451e-08d8f6bd9ae1
x-ms-exchange-crosstenant-originalarrivaltime: 03 Apr 2021 16:29:07.7403 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: pTMq/sBWy2hp7u83mA59p7/+PmWg3jppHCGm93qTWT82VvDFNHzxa7WKodqnQkESawtUDGb2+INJOtlbfdn0SA==
x-ms-exchange-transport-crosstenantheadersstamped: BN8PR02MB5777
x-originatororg: quicinc.com
Content-Type: multipart/mixed;
 boundary="_002_BN7PR02MB4194DF5752EF3BADE858018DB8799BN7PR02MB4194namp_"
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.38; envelope-from=bcain@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_002_BN7PR02MB4194DF5752EF3BADE858018DB8799BN7PR02MB4194namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Alex,

You are the one maintaining the testing/next tree at https://gitlab.com/sts=
quad/qemu correct?  The current patch series for hexagon under review requi=
res toolchain updates.  These changes to llvm/clang landed in the last week=
 or two.

Can you apply this patch?

~~~~

From 68547357c895934796e9b4687338bb9e39ac86c5 Mon Sep 17 00:00:00 2001
From: Brian Cain mailto:bcain@quicinc.com
Date: Thu, 1 Apr 2021 10:32:24 -0500
Subject: [PATCH] Update llvm-project commit

clang was updated with new inline asm registers for hexagon, this is
necessary for QEMU test cases currently under review.

Signed-off-by: Brian Cain mailto:bcain@quicinc.com
---
 tests/docker/dockerfiles/debian-hexagon-cross.docker | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/d=
ocker/dockerfiles/debian-hexagon-cross.docker
index b6fb651..1d19e8f 100644
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -24,7 +24,7 @@ RUN apt update && \
 ENV TOOLCHAIN_INSTALL /usr/local
 ENV ROOTFS /usr/local

-ENV LLVM_URL https://github.com/llvm/llvm-project/archive/3d8149c2a1228609=
fd7d7c91a04681304a2f0ca9.tar.gz
+ENV LLVM_URL https://github.com/llvm/llvm-project/archive/bfcd21876adc3498=
065e4da92799f613e730d475.tar.gz
 ENV MUSL_URL https://github.com/quic/musl/archive/aff74b395fbf59cd7e93b369=
1905aa1af6c0778c.tar.gz
 ENV LINUX_URL https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.6.18.ta=
r.xz


--_002_BN7PR02MB4194DF5752EF3BADE858018DB8799BN7PR02MB4194namp_
Content-Type: application/octet-stream;
	name="0001-Update-llvm-project-commit.patch"
Content-Description: 0001-Update-llvm-project-commit.patch
Content-Disposition: attachment;
	filename="0001-Update-llvm-project-commit.patch"; size=1355;
	creation-date="Sat, 03 Apr 2021 16:26:41 GMT";
	modification-date="Sat, 03 Apr 2021 16:26:41 GMT"
Content-Transfer-Encoding: base64

RnJvbSA2ODU0NzM1N2M4OTU5MzQ3OTZlOWI0Njg3MzM4YmI5ZTM5YWM4NmM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcmlhbiBDYWluIDxiY2FpbkBxdWljaW5jLmNvbT4KRGF0ZTog
VGh1LCAxIEFwciAyMDIxIDEwOjMyOjI0IC0wNTAwClN1YmplY3Q6IFtQQVRDSF0gVXBkYXRlIGxs
dm0tcHJvamVjdCBjb21taXQKCmNsYW5nIHdhcyB1cGRhdGVkIHdpdGggbmV3IGlubGluZSBhc20g
cmVnaXN0ZXJzIGZvciBoZXhhZ29uLCB0aGlzIGlzCm5lY2Vzc2FyeSBmb3IgUUVNVSB0ZXN0IGNh
c2VzIGN1cnJlbnRseSB1bmRlciByZXZpZXcuCgpTaWduZWQtb2ZmLWJ5OiBCcmlhbiBDYWluIDxi
Y2FpbkBxdWljaW5jLmNvbT4KLS0tCiB0ZXN0cy9kb2NrZXIvZG9ja2VyZmlsZXMvZGViaWFuLWhl
eGFnb24tY3Jvc3MuZG9ja2VyIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVzL2Rl
Ymlhbi1oZXhhZ29uLWNyb3NzLmRvY2tlciBiL3Rlc3RzL2RvY2tlci9kb2NrZXJmaWxlcy9kZWJp
YW4taGV4YWdvbi1jcm9zcy5kb2NrZXIKaW5kZXggYjZmYjY1MS4uMWQxOWU4ZiAxMDA2NDQKLS0t
IGEvdGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVzL2RlYmlhbi1oZXhhZ29uLWNyb3NzLmRvY2tlcgor
KysgYi90ZXN0cy9kb2NrZXIvZG9ja2VyZmlsZXMvZGViaWFuLWhleGFnb24tY3Jvc3MuZG9ja2Vy
CkBAIC0yNCw3ICsyNCw3IEBAIFJVTiBhcHQgdXBkYXRlICYmIFwKIEVOViBUT09MQ0hBSU5fSU5T
VEFMTCAvdXNyL2xvY2FsCiBFTlYgUk9PVEZTIC91c3IvbG9jYWwKIAotRU5WIExMVk1fVVJMIGh0
dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9hcmNoaXZlLzNkODE0OWMyYTEyMjg2
MDlmZDdkN2M5MWEwNDY4MTMwNGEyZjBjYTkudGFyLmd6CitFTlYgTExWTV9VUkwgaHR0cHM6Ly9n
aXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2FyY2hpdmUvYmZjZDIxODc2YWRjMzQ5ODA2NWU0
ZGE5Mjc5OWY2MTNlNzMwZDQ3NS50YXIuZ3oKIEVOViBNVVNMX1VSTCBodHRwczovL2dpdGh1Yi5j
b20vcXVpYy9tdXNsL2FyY2hpdmUvYWZmNzRiMzk1ZmJmNTljZDdlOTNiMzY5MTkwNWFhMWFmNmMw
Nzc4Yy50YXIuZ3oKIEVOViBMSU5VWF9VUkwgaHR0cHM6Ly9jZG4ua2VybmVsLm9yZy9wdWIvbGlu
dXgva2VybmVsL3Y1LngvbGludXgtNS42LjE4LnRhci54egogCi0tIApUaGUgUXVhbGNvbW0gSW5u
b3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgdGhlIENvZGUgQXVyb3JhIEZvcnVt
LAphIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0Cgo=

--_002_BN7PR02MB4194DF5752EF3BADE858018DB8799BN7PR02MB4194namp_--

