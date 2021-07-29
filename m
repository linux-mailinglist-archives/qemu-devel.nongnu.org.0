Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D383D9F0A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 09:57:46 +0200 (CEST)
Received: from localhost ([::1]:53442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m90vJ-00008r-FT
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 03:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1m90tY-00074J-CB
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 03:55:56 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:39460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1m90tW-0006H8-Jy
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 03:55:56 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 f20-20020a9d6c140000b02904bb9756274cso5022960otq.6
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 00:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2IlNWsMguSfp9bSDmY3mY3ClG/Sk7vjuiHN+VxHJyIE=;
 b=aZ3uV29LkgA6a2MveIpfndGgu3ZzO7t64lSn5ZMarO3yTVH4RGBKGM2+vcB/Cc3XNi
 QUalTBc+KvL2BqHNbkHX9CIgZolpWc5hUMy7xC6qATSdkn7S8KsXFc1pPg5Br0MCdfS7
 MyTnBLQyn5H0xx/qkVwdfcyMgZsYvNDUleI89fxphZQhOt5gg8hVxkaSz47DXX6Utf93
 dyn6CwS1nrQv1mbVkIvGiJsXTNhU0GituCIiCPZ3xI3Yk8/gnW+A400kYZrmY3ITO1l/
 JfzXMRRddHDb6RCKES8YAGnAWkdEXlCyD1IP3B5EQf3jSpxJvKymX7I3qXtl2V1aMyov
 udHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2IlNWsMguSfp9bSDmY3mY3ClG/Sk7vjuiHN+VxHJyIE=;
 b=tVIWWNIZxCnvCS1/zAcqX9xzP46+ECS0v4U7Z8X22f+d+j85xqlYrxtBfM/HYBMKdY
 h949l+FpDlpDHgi7R+KEwIw+d/0bOqRoOWTmpqNQ3DCmsFPhmdemL6W3mmxgMFZweAtI
 ciww/BruxWuE//usA9rZWwcG5/KglZA/YBUkbCHOKsSEzbTELaNl/rLfEU79fgXS8AbT
 BaHiobOl7lV3aYhabtyZECC0dfhltiS9nx3TKZVwQpj7f+6c/C2K9n6bSco4/KK5N5cH
 +fgzlBy4+pRGz/ugdoPs+s13IL5F9wdDdUhXZbUMz2xbkEvWJEr8DEXpx8rPjtdbjIXu
 6vMw==
X-Gm-Message-State: AOAM531EFt4LzsTQsVJeP85Q/23r9KCa2I4/N+/VWnsimuhoRtfY/Dds
 0YkatSuVtTwQ/oBuU1PFNTFJuKtIGgFkg68/Tv8QS1yvw7YMJw==
X-Google-Smtp-Source: ABdhPJxY1ytqGgBzL27lwbo7cisRdpt6v9+P7Arr4NX8kbEhScVPwvAKVGs2GvI+/jEQW698tzkkfnSecFlbg0XYUBY=
X-Received: by 2002:a05:6830:40c4:: with SMTP id
 h4mr2659599otu.75.1627545352207; 
 Thu, 29 Jul 2021 00:55:52 -0700 (PDT)
MIME-Version: 1.0
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Thu, 29 Jul 2021 09:55:41 +0200
Message-ID: <CABLmASFwffwhuNKTxfxUvHjCxZQHV+BiBTWeu0XoqRC0E1UU9A@mail.gmail.com>
Subject: Bug in qemu-system-ppc running fedora 12 ppc guest
To: qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 matheus.ferst@eldorado.org.br
Content-Type: multipart/related; boundary="000000000000931dcc05c83e6ea0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_IMAGE_ONLY_32=0.001,
 HTML_IMAGE_RATIO_08=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000931dcc05c83e6ea0
Content-Type: multipart/alternative; boundary="000000000000931dcb05c83e6e9f"

--000000000000931dcb05c83e6e9f
Content-Type: text/plain; charset="UTF-8"

Hi,

Qemu-system-ppc built from current master can no longer run Fedora 12 ppc
as guest. (This the only ppc distro I tested.) Host is Fedora 34. Please
see screen shot attached.
Booting from both an installation DVD and from an installed system fail.

To reproduce:
compile qemu-system-ppc from current master and run:

./qemu-system-ppc \
-M mac99,via=pmu \
-m 1024 \
-L pc-bios \
-boot d \
-cdrom Fedora-12-ppc-DVD.iso \
-g 1024x768x8

I tracked the issue down to this commit:

8f0a4b6a9b40e18116a2bb6bbcc00feb8119c792 is the first bad commit
commit 8f0a4b6a9b40e18116a2bb6bbcc00feb8119c792
Author: Matheus Ferst <matheus.ferst@eldorado.org.br>
Date:   Tue Jun 1 16:35:28 2021 -0300

    target/ppc: Move cmp/cmpi/cmpl/cmpli to decodetree

    Additionally, REQUIRE_64BIT when L=1 to match what is specified in The
    Programming Environments Manual:

    "For 32-bit implementations, the L field must be cleared, otherwise the
    instruction form is invalid."

    Some CPUs are known to deviate from this specification by ignoring the
    L bit [1]. The stricter behavior, however, can help users that test
    software with qemu, making it more likely to detect bugs that would
    otherwise be silent.

    If deemed necessary, a future patch can adapt this behavior based on
    the specific CPU model.

    [1] The 601 manual is the only one I've found that explicitly states
    that the L bit is ignored, but we also observe this behavior in a 7447A
    v1.2.

    Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
    Message-Id: <20210601193528.2533031-15-matheus.ferst@eldorado.org.br>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    [dwg: Corrected whitespace error]
    Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

 target/ppc/insn32.decode                   | 14 ++++++++
 target/ppc/translate.c                     | 52
------------------------------
 target/ppc/translate/fixedpoint-impl.c.inc | 31 ++++++++++++++++++
 3 files changed, 45 insertions(+), 52 deletions(-)

Best,
Howard

[image: Qemu-system-ppc-Fedora-Crashing.png]

--000000000000931dcb05c83e6e9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Qemu-system-ppc built fr=
om current master can no longer run Fedora 12 ppc as guest. (This the only =
ppc distro I tested.) Host is Fedora 34. Please see screen shot attached.</=
div><div>Booting from both an installation DVD and from an installed system=
 fail.<br></div><div><br></div><div>To reproduce:</div><div>compile qemu-sy=
stem-ppc from current master and run:</div><div><br></div><div>./qemu-syste=
m-ppc \<br>-M mac99,via=3Dpmu \<br>-m 1024 \<br>-L pc-bios \<br>-boot d \<b=
r>-cdrom Fedora-12-ppc-DVD.iso \<br>-g 1024x768x8 </div><div><br></div><div=
>I tracked the issue down to this commit:<br></div><div><br></div><div>8f0a=
4b6a9b40e18116a2bb6bbcc00feb8119c792 is the first bad commit</div>commit 8f=
0a4b6a9b40e18116a2bb6bbcc00feb8119c792<br>Author: Matheus Ferst &lt;<a href=
=3D"mailto:matheus.ferst@eldorado.org.br">matheus.ferst@eldorado.org.br</a>=
&gt;<br>Date: =C2=A0 Tue Jun 1 16:35:28 2021 -0300<br><br>=C2=A0 =C2=A0 tar=
get/ppc: Move cmp/cmpi/cmpl/cmpli to decodetree<br>=C2=A0 =C2=A0 <br>=C2=A0=
 =C2=A0 Additionally, REQUIRE_64BIT when L=3D1 to match what is specified i=
n The<br>=C2=A0 =C2=A0 Programming Environments Manual:<br>=C2=A0 =C2=A0 <b=
r>=C2=A0 =C2=A0 &quot;For 32-bit implementations, the L field must be clear=
ed, otherwise the<br>=C2=A0 =C2=A0 instruction form is invalid.&quot;<br>=
=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 Some CPUs are known to deviate from this sp=
ecification by ignoring the<br>=C2=A0 =C2=A0 L bit [1]. The stricter behavi=
or, however, can help users that test<br>=C2=A0 =C2=A0 software with qemu, =
making it more likely to detect bugs that would<br>=C2=A0 =C2=A0 otherwise =
be silent.<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 If deemed necessary, a future=
 patch can adapt this behavior based on<br>=C2=A0 =C2=A0 the specific CPU m=
odel.<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 [1] The 601 manual is the only one=
 I&#39;ve found that explicitly states<br>=C2=A0 =C2=A0 that the L bit is i=
gnored, but we also observe this behavior in a 7447A<br>=C2=A0 =C2=A0 v1.2.=
<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 Signed-off-by: Matheus Ferst &lt;<a hre=
f=3D"mailto:matheus.ferst@eldorado.org.br">matheus.ferst@eldorado.org.br</a=
>&gt;<br>=C2=A0 =C2=A0 Message-Id: &lt;<a href=3D"mailto:20210601193528.253=
3031-15-matheus.ferst@eldorado.org.br">20210601193528.2533031-15-matheus.fe=
rst@eldorado.org.br</a>&gt;<br>=C2=A0 =C2=A0 Reviewed-by: Richard Henderson=
 &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.henderson@lina=
ro.org</a>&gt;<br>=C2=A0 =C2=A0 [dwg: Corrected whitespace error]<br>=C2=A0=
 =C2=A0 Signed-off-by: David Gibson &lt;<a href=3D"mailto:david@gibson.drop=
bear.id.au">david@gibson.dropbear.id.au</a>&gt;<br><br>=C2=A0target/ppc/ins=
n32.decode =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 14 ++++++++<br>=C2=A0target/ppc/translate.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 52 ----------------------------=
--<br>=C2=A0target/ppc/translate/fixedpoint-impl.c.inc | 31 +++++++++++++++=
+++<br><div>=C2=A03 files changed, 45 insertions(+), 52 deletions(-)</div><=
div><br></div><div>Best,</div><div>Howard</div><div><br></div><div><img src=
=3D"cid:ii_krom8e861" alt=3D"Qemu-system-ppc-Fedora-Crashing.png" width=3D"=
545" height=3D"435"><br><br></div></div>

--000000000000931dcb05c83e6e9f--

--000000000000931dcc05c83e6ea0
Content-Type: image/png; name="Qemu-system-ppc-Fedora-Crashing.png"
Content-Disposition: inline; filename="Qemu-system-ppc-Fedora-Crashing.png"
Content-Transfer-Encoding: base64
Content-ID: <ii_krom8e861>
X-Attachment-Id: ii_krom8e861

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
AAAAgAa3gYDte+XNb7xVXv4jvyZ/dWx30uLh/y7/5DWvkhv/6Z/KI4p+fLQznik/9LOvl5fsLzRm
Mb9P3vL3Xy//8v27F3z+0FR+7sD/Jn967Oqy8QEAAAAA4MG997rvKXLZWR+Wd37kaOPDuXz1jtvk
gSd/l5w9Sh+ciIisnS/X3HCdPOW0TOVb679cbrlpv3zwvX8j3z754Vy+fOcd8rnn3iQve9L+svEB
AAAAAODBfSBgdK689MbL5SN/8WH51vKz+WF5z7uPyPU3XiGLk7MBtuSz/+3fyM/++IZ83w+8Vn7g
Tb8i77jv+Im0hRy994/lX//DN8it3/v98j0b/5O8/d7tk2kP/vn/IW/6O6+TV3//6+WnfvXP5YEt
2X3bwOad8kuv/xV5+zt+Vf7+xg/Lq7//R+Un/82fyec3d0r49mf/RP7Vz/+YfN9rf1h+5B/+W/mz
LyzrjbEmV9x0g1zwodvlI8uRgPlhuf32B+S6V7xEztvafVuDMob51+QPfuGH5Z+/58QgytE75Bd/
8HvlZ6dflrmIyNbH5dd/7Gfk//nstioAAAAAAACS8ZjPPpdzX/IKedYn3i1/+c2dTu/8wdvkXcdu
lFdfMZJTd8ivyf6n3yr/4NfeJn/y335f/tWLPie/9Xt/tXM1/djH5Ld+6T/JI6/+ZfmDP/4jmf76
P5bvvWzfTrbNT8j7HrpB/vXv/aG88/f/mVzzyf8gb/3g43uiWHzzvfJHn3m5/Mp/+q/yzt//n+U5
n3qzvO1Dj4s8fpf8x19+uzx24NdkNpvIv731q/Kbv/oO+UKCW/fXLrtRbrngw/Luv9kZCZh/+X1y
2wPXyqu++4myayKELgbZL9dde4F8+uOfkU0RefyuD8qn93+nHPnIR+UbC5H5F++SuxbPkecv2wIA
AAAAgEzcBwIWCxmd+1K59Tmflj9/3yOykLnc9+7bZXTzK+TytebDAdbk/KtfKM+98AxZG50jz37h
M+X0I1+Xb85Ftj51u9yx71XyE6+9Ss5dP03O/c5L5ILTT2Tbd5nceuAlcuFpImvnPU+uf84+OfzQ
N2RPP37fZfI9r3uZXHTye+ty+KFvyPFP3ya3LW6SQ7deIqePTpdLv+dWueb+D8qHjyR4cMHapXLL
zRfKB2/7G/m2zOWhO++QL1x7k7z0ibvvh9jSxjCSy659jsjf3iVfnG/Kpz54l1zy2h+WZ9//Yfnr
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
9iPxveAiagAAAABJRU5ErkJggg==
--000000000000931dcc05c83e6ea0--

