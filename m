Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AB0582557
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 13:23:59 +0200 (CEST)
Received: from localhost ([::1]:56236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGf8w-0004fG-H0
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 07:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oGf6D-0000iu-7y
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 07:21:15 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:43797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oGf6B-0005n6-0B
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 07:21:08 -0400
Received: by mail-ua1-x92e.google.com with SMTP id y12so5548080uad.10
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 04:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=adWSRmSHYQKu3dN2e+6hVhiU1CYnw9oFtx4OyR0Rb9Q=;
 b=jymPVLDSUtoLSXkqSMHA0Euym1rcRiX3moVk1Lzlz3xICDX7kOzU52XcvsnY1vfhWZ
 1B4igaEBjaE9LnhGWoeBqhJgFDfTMj5Q8AckSbP4Qk+5Rh6aYIbqpQ1K8nZVZAgVSHrw
 JgQnMVL5Nc8mTn4uMENbShVcSc9dUvVkljeDwGco2WUhhgDxGqaSPPNE5bRRSbFWDbV+
 RFb/CKc64GtTsmX5+y1TGdggDZM6ygl7ExxXVOAtkI52q3LXoV0d3mJD305Dk8VBYOmf
 1AhwccD3ffc1+3ZFb3w6sr5rGhZ0NXbkQ9hqVkQziA/XispUoT1HU1l2ElrgRxDuwjt0
 J7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=adWSRmSHYQKu3dN2e+6hVhiU1CYnw9oFtx4OyR0Rb9Q=;
 b=LJZRl0xOvecYVTrqBli0egMXopLq0OCB/Mzb5gwNrRhiRk5BZt4QVBND9/HM2djCoH
 Nk8z/57fkC19HPR800CKsOSYdyK6cYpw5REuQ2chZ8Cq2+kPjFZDEljiUJFoCiQX5MhF
 ATAQjISdmGw+0DaKW5o1ZW+CMl3sz2lPFfOXbAKZh4ynlxI+7LWD1LTK0c9AjqoIqtd6
 TgF+7vuxeJ0/yP0brfvIqQ9lVXtxFQk1a7BfvqzJUX3htu80dDnMHcGhLLw3H/VUnErO
 RDAZ0GiwSuTZYH7IUzQQH0VzSM1SHjfoJPRO0sL85m644gPPf+mAMJ7N0Bha4jSbQF0m
 V0Ow==
X-Gm-Message-State: AJIora83F9z3dFvuzU/emhSsYTilsaYAHy6B5wozTsJUVRdfy1MzxrB0
 geB9a6iUDXbRZd2pS3iA+EVQzkZ//hkl9h6nE76oRfdnqFo=
X-Google-Smtp-Source: AGRyM1sGp8v65gw9GUjalwv8y6UPH2nHN1sE48eWbY5EyENnCzO/AjxKklIAYrtCD7Ik0ghHRdAYKxPldUCeY4+gu5k=
X-Received: by 2002:ab0:5781:0:b0:37b:de3d:5d4e with SMTP id
 x1-20020ab05781000000b0037bde3d5d4emr6307440uaa.1.1658920863806; Wed, 27 Jul
 2022 04:21:03 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Wed, 27 Jul 2022 19:20:51 +0800
Message-ID: <CAE2XoE_Ki5QJSH9LNkFOzOwMFJdS=y6=bb2g=9ODawuFymADdA@mail.gmail.com>
Subject: When create a new qemu fork, can not run pipeline, what I need to do?
To: qemu-level <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000cc39db05e4c79cac"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=luoyonggang@gmail.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cc39db05e4c79cac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C2=B7=C2=B7=C2=B7
Pipeline cannot be run.

No stages / jobs for this pipeline.

The form contains the following warning:

121 warnings found: showing first 25

jobs:amd64-centos8-container may allow multiple pipelines to run for a
single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:amd64-fedora-container may allow multiple pipelines to run for a
single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:amd64-debian10-container may allow multiple pipelines to run for a
single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:alpha-debian-cross-container may allow multiple pipelines to run for a
single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:amd64-debian-cross-container may allow multiple pipelines to run for a
single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:amd64-debian-user-cross-container may allow multiple pipelines to run
for a single action due to `rules:when` clause with no `workflow:rules` -
read more:
https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:arm64-debian-cross-container may allow multiple pipelines to run for a
single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:armel-debian-cross-container may allow multiple pipelines to run for a
single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:armhf-debian-cross-container may allow multiple pipelines to run for a
single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:hexagon-cross-container may allow multiple pipelines to run for a
single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:hppa-debian-cross-container may allow multiple pipelines to run for a
single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:m68k-debian-cross-container may allow multiple pipelines to run for a
single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:mips64-debian-cross-container may allow multiple pipelines to run for
a single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:mips64el-debian-cross-container may allow multiple pipelines to run
for a single action due to `rules:when` clause with no `workflow:rules` -
read more:
https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:mips-debian-cross-container may allow multiple pipelines to run for a
single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:mipsel-debian-cross-container may allow multiple pipelines to run for
a single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:powerpc-test-cross-container may allow multiple pipelines to run for a
single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:ppc64el-debian-cross-container may allow multiple pipelines to run for
a single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:riscv64-debian-cross-container may allow multiple pipelines to run for
a single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:riscv64-debian-test-cross-container may allow multiple pipelines to
run for a single action due to `rules:when` clause with no `workflow:rules`
- read more:
https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:s390x-debian-cross-container may allow multiple pipelines to run for a
single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:sh4-debian-cross-container may allow multiple pipelines to run for a
single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:sparc64-debian-cross-container may allow multiple pipelines to run for
a single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:tricore-debian-cross-container may allow multiple pipelines to run for
a single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

jobs:xtensa-debian-cross-container may allow multiple pipelines to run for
a single action due to `rules:when` clause with no `workflow:rules` - read
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings

Run for branch name or tag
master
Variables
Specify variable values to be used in this run. The values specified in
CI/CD settings will be used by default.
Run pipelineCancel
=C2=B7=C2=B7=C2=B7
--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000cc39db05e4c79cac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>=C2=B7=C2=B7=C2=B7</div>Pipeline cannot be run.<br><b=
r>No stages / jobs for this pipeline.<br><br>The form contains the followin=
g warning:<br><br>121 warnings found: showing first 25<br><br>jobs:amd64-ce=
ntos8-container may allow multiple pipelines to run for a single action due=
 to `rules:when` clause with no `workflow:rules` - read more: <a href=3D"ht=
tps://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings">https:/=
/docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings</a><br><br>jo=
bs:amd64-fedora-container may allow multiple pipelines to run for a single =
action due to `rules:when` clause with no `workflow:rules` - read more: <a =
href=3D"https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warning=
s">https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings</a>=
<br><br>jobs:amd64-debian10-container may allow multiple pipelines to run f=
or a single action due to `rules:when` clause with no `workflow:rules` - re=
ad more: <a href=3D"https://docs.gitlab.com/ee/ci/troubleshooting.html#pipe=
line-warnings">https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-=
warnings</a><br><br>jobs:alpha-debian-cross-container may allow multiple pi=
pelines to run for a single action due to `rules:when` clause with no `work=
flow:rules` - read more: <a href=3D"https://docs.gitlab.com/ee/ci/troublesh=
ooting.html#pipeline-warnings">https://docs.gitlab.com/ee/ci/troubleshootin=
g.html#pipeline-warnings</a><br><br>jobs:amd64-debian-cross-container may a=
llow multiple pipelines to run for a single action due to `rules:when` clau=
se with no `workflow:rules` - read more: <a href=3D"https://docs.gitlab.com=
/ee/ci/troubleshooting.html#pipeline-warnings">https://docs.gitlab.com/ee/c=
i/troubleshooting.html#pipeline-warnings</a><br><br>jobs:amd64-debian-user-=
cross-container may allow multiple pipelines to run for a single action due=
 to `rules:when` clause with no `workflow:rules` - read more: <a href=3D"ht=
tps://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings">https:/=
/docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings</a><br><br>jo=
bs:arm64-debian-cross-container may allow multiple pipelines to run for a s=
ingle action due to `rules:when` clause with no `workflow:rules` - read mor=
e: <a href=3D"https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-w=
arnings">https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnin=
gs</a><br><br>jobs:armel-debian-cross-container may allow multiple pipeline=
s to run for a single action due to `rules:when` clause with no `workflow:r=
ules` - read more: <a href=3D"https://docs.gitlab.com/ee/ci/troubleshooting=
.html#pipeline-warnings">https://docs.gitlab.com/ee/ci/troubleshooting.html=
#pipeline-warnings</a><br><br>jobs:armhf-debian-cross-container may allow m=
ultiple pipelines to run for a single action due to `rules:when` clause wit=
h no `workflow:rules` - read more: <a href=3D"https://docs.gitlab.com/ee/ci=
/troubleshooting.html#pipeline-warnings">https://docs.gitlab.com/ee/ci/trou=
bleshooting.html#pipeline-warnings</a><br><br>jobs:hexagon-cross-container =
may allow multiple pipelines to run for a single action due to `rules:when`=
 clause with no `workflow:rules` - read more: <a href=3D"https://docs.gitla=
b.com/ee/ci/troubleshooting.html#pipeline-warnings">https://docs.gitlab.com=
/ee/ci/troubleshooting.html#pipeline-warnings</a><br><br>jobs:hppa-debian-c=
ross-container may allow multiple pipelines to run for a single action due =
to `rules:when` clause with no `workflow:rules` - read more: <a href=3D"htt=
ps://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings">https://=
docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings</a><br><br>job=
s:m68k-debian-cross-container may allow multiple pipelines to run for a sin=
gle action due to `rules:when` clause with no `workflow:rules` - read more:=
 <a href=3D"https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-war=
nings">https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings=
</a><br><br>jobs:mips64-debian-cross-container may allow multiple pipelines=
 to run for a single action due to `rules:when` clause with no `workflow:ru=
les` - read more: <a href=3D"https://docs.gitlab.com/ee/ci/troubleshooting.=
html#pipeline-warnings">https://docs.gitlab.com/ee/ci/troubleshooting.html#=
pipeline-warnings</a><br><br>jobs:mips64el-debian-cross-container may allow=
 multiple pipelines to run for a single action due to `rules:when` clause w=
ith no `workflow:rules` - read more: <a href=3D"https://docs.gitlab.com/ee/=
ci/troubleshooting.html#pipeline-warnings">https://docs.gitlab.com/ee/ci/tr=
oubleshooting.html#pipeline-warnings</a><br><br>jobs:mips-debian-cross-cont=
ainer may allow multiple pipelines to run for a single action due to `rules=
:when` clause with no `workflow:rules` - read more: <a href=3D"https://docs=
.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings">https://docs.gitl=
ab.com/ee/ci/troubleshooting.html#pipeline-warnings</a><br><br>jobs:mipsel-=
debian-cross-container may allow multiple pipelines to run for a single act=
ion due to `rules:when` clause with no `workflow:rules` - read more: <a hre=
f=3D"https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings">=
https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings</a><br=
><br>jobs:powerpc-test-cross-container may allow multiple pipelines to run =
for a single action due to `rules:when` clause with no `workflow:rules` - r=
ead more: <a href=3D"https://docs.gitlab.com/ee/ci/troubleshooting.html#pip=
eline-warnings">https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline=
-warnings</a><br><br>jobs:ppc64el-debian-cross-container may allow multiple=
 pipelines to run for a single action due to `rules:when` clause with no `w=
orkflow:rules` - read more: <a href=3D"https://docs.gitlab.com/ee/ci/troubl=
eshooting.html#pipeline-warnings">https://docs.gitlab.com/ee/ci/troubleshoo=
ting.html#pipeline-warnings</a><br><br>jobs:riscv64-debian-cross-container =
may allow multiple pipelines to run for a single action due to `rules:when`=
 clause with no `workflow:rules` - read more: <a href=3D"https://docs.gitla=
b.com/ee/ci/troubleshooting.html#pipeline-warnings">https://docs.gitlab.com=
/ee/ci/troubleshooting.html#pipeline-warnings</a><br><br>jobs:riscv64-debia=
n-test-cross-container may allow multiple pipelines to run for a single act=
ion due to `rules:when` clause with no `workflow:rules` - read more: <a hre=
f=3D"https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings">=
https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings</a><br=
><br>jobs:s390x-debian-cross-container may allow multiple pipelines to run =
for a single action due to `rules:when` clause with no `workflow:rules` - r=
ead more: <a href=3D"https://docs.gitlab.com/ee/ci/troubleshooting.html#pip=
eline-warnings">https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline=
-warnings</a><br><br>jobs:sh4-debian-cross-container may allow multiple pip=
elines to run for a single action due to `rules:when` clause with no `workf=
low:rules` - read more: <a href=3D"https://docs.gitlab.com/ee/ci/troublesho=
oting.html#pipeline-warnings">https://docs.gitlab.com/ee/ci/troubleshooting=
.html#pipeline-warnings</a><br><br>jobs:sparc64-debian-cross-container may =
allow multiple pipelines to run for a single action due to `rules:when` cla=
use with no `workflow:rules` - read more: <a href=3D"https://docs.gitlab.co=
m/ee/ci/troubleshooting.html#pipeline-warnings">https://docs.gitlab.com/ee/=
ci/troubleshooting.html#pipeline-warnings</a><br><br>jobs:tricore-debian-cr=
oss-container may allow multiple pipelines to run for a single action due t=
o `rules:when` clause with no `workflow:rules` - read more: <a href=3D"http=
s://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings">https://d=
ocs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings</a><br><br>jobs=
:xtensa-debian-cross-container may allow multiple pipelines to run for a si=
ngle action due to `rules:when` clause with no `workflow:rules` - read more=
: <a href=3D"https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-wa=
rnings">https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warning=
s</a><br><br>Run for branch name or tag<br>master<br>Variables<br>Specify v=
ariable values to be used in this run. The values specified in CI/CD settin=
gs will be used by default.<br>Run pipelineCancel<div>=C2=B7=C2=B7=C2=B7<br=
>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br=
>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yongga=
ng Luo</div></div>

--000000000000cc39db05e4c79cac--

