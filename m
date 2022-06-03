Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D6153CAA5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 15:26:45 +0200 (CEST)
Received: from localhost ([::1]:50038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx7K8-0006t1-FD
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 09:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1nx51N-0005MC-TN
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 06:59:13 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:42655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1nx51L-00087o-SO
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 06:59:13 -0400
Received: by mail-lf1-x136.google.com with SMTP id a15so12021368lfb.9
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 03:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=zERhvxtCqbCrmqBoQ0u6ZYuNHn+j1E8XezA6V/nfqX4=;
 b=EMZfCmWYZoIpr23oUiUg5Q12zL5evvNna/QswmLkZec/oLuduNYTgGOZRXBkFvCMaV
 XI7VgnWNux7lo15dEtuf+lvYivz4xzauUo9j2QlmOPDHeV03v0P1PAhtToe9RaXgZ+dt
 VFfJ4wsPDp7rm7c3iHcpNtUo3gjLANxk/oDT32AT9jqrz+pYkhuYbtZ5xKkzQh/ueMKN
 CbF6rUzs2/Y+wUMWsMEa5w3WY7e/gwfL6XqJ8VhnHjk8gvsbN040c1tqDUeitqLL8a7P
 MQnCQ4bPmZ9Iwpkp7MVe2+fmQ3xWXeykGBA86v9fJWCJNadCvvZgedvI89jEpXTVntGb
 nwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=zERhvxtCqbCrmqBoQ0u6ZYuNHn+j1E8XezA6V/nfqX4=;
 b=0bmOCkKjT3MfDs6aHF4U1JDaHCIQzMyfRkxV8rK5M25mbtYYFh49R1MbJP+dTq1/63
 goVOO+DwpwPKSwsv75jO5FxBtkPcCRRF15M9cv7Mbcx3Vh8QIHbHMxOfGzOJGTwjDeQO
 hjjA47xzGg3dvUXTk74MlmwOMZ/PivlIGDuwI1xfb0CFoDchHaJ4Q63BxcBXlCP5znF3
 wwXHxBFkHiPJ9NLNue74/8y7bbqlWhYYlaizueJ1/a2xbyoqV1szDqHk0tkuKHa9tZ0o
 W4yNu8qad8kbFo9WA4EqerZYoyXr2BwM8oRGp6iLMW73Ams4qjrwoAhZyYAVn7d+kztp
 5nFw==
X-Gm-Message-State: AOAM533TKWfC1XJxbD9vICZLjokuCkMDZZ5dupLswm9a6AnUROcPwpqa
 +XfewsK4Gg9QJltbu6xi99bLH31qL554TP8DV9i84w==
X-Google-Smtp-Source: ABdhPJxCq2AVCD7RfnNVaeMdU+La22owsyDeYJAKMVUwEBop+oe6O0/Vkq2vopoQzvONtumo5eYAaKcjFCRJ5SP8Pd8=
X-Received: by 2002:a05:6512:2814:b0:478:e80f:3d7 with SMTP id
 cf20-20020a056512281400b00478e80f03d7mr6266000lfb.208.1654253948222; Fri, 03
 Jun 2022 03:59:08 -0700 (PDT)
MIME-Version: 1.0
From: Yu Zhang <yu.zhang@ionos.com>
Date: Fri, 3 Jun 2022 12:58:57 +0200
Message-ID: <CAHEcVy4V_1vs-ZX66UrmDa0CR-X6jf9dn=rzk8t5he4XGWB0dA@mail.gmail.com>
Subject: about the current status of Multi-process QEMU / out-of-process
 emulation
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Jinpu Wang <jinpu.wang@ionos.com>, Elmar Gerdes <elmar.gerdes@ionos.com>
Content-Type: multipart/alternative; boundary="000000000000f3dd0b05e0890224"
Received-SPF: permerror client-ip=2a00:1450:4864:20::136;
 envelope-from=yu.zhang@ionos.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 03 Jun 2022 09:24:28 -0400
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

--000000000000f3dd0b05e0890224
Content-Type: text/plain; charset="UTF-8"

Hi All,

I saw that you authored the QEMU page for "Multi-process QEMU". (
https://www.qemu.org/docs/master/system/multi-process.html)

I'm interested in this feature, but feel a little confused with the command
line:

+      /usr/bin/qemu-system-x86_64                                        \
+      -machine x-remote                                                  \
+      -device lsi53c895a,id=lsi0                                         \
+      -drive id=drive_image2,file=/build/ol7-nvme-test-1.qcow2           \
+      -device scsi-hd,id=drive2,drive=drive_image2,bus=lsi0.0,scsi-id=0  \
+      -object x-remote-object,id=robj1,devid=lsi1,fd=4,
(https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg02887.html)

It seems that the man page of qemu command contains no parameter and option
yet for this feature. May I know whether is it still in experimental
stage? And even a few more questions:

- Is "x-remote" a standalone machine type for creating the orchestrator?
- Can each device has a dedicated emulation process or shares one process
for emulating multiple devices?
- Are there more command line examples illustrating the combination of
orchestrator, remote emulation process, memory-backend-memfd and
x-pci-proxy-dev?

Thank you very much
Kind regard

Yu Zhang @ IONOS Compute Platform
03.06.2022

--000000000000f3dd0b05e0890224
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div>I saw that you authored t=
he QEMU page for &quot;Multi-process QEMU&quot;. (<a href=3D"https://www.qe=
mu.org/docs/master/system/multi-process.html" target=3D"_blank">https://www=
.qemu.org/docs/master/system/multi-process.html</a>)<div><br>I&#39;m intere=
sted in this feature, but feel a little confused with the command line:<br>=
<br>+ =C2=A0 =C2=A0 =C2=A0/usr/bin/qemu-system-x86_64 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>+ =C2=A0 =C2=A0 =C2=A0-ma=
chine x-remote =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>+ =C2=A0 =C2=A0 =C2=A0-device=
 lsi53c895a,id=3Dlsi0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>+ =C2=A0 =C2=A0 =C2=A0-drive id=3Ddrive_image2,file=3D/b=
uild/ol7-nvme-test-1.qcow2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>+ =C2=A0=
 =C2=A0 =C2=A0-device scsi-hd,id=3Ddrive2,drive=3Ddrive_image2,bus=3Dlsi0.0=
,scsi-id=3D0 =C2=A0\<br>+ =C2=A0 =C2=A0 =C2=A0-object x-remote-object,id=3D=
robj1,devid=3Dlsi1,fd=3D4,</div><div>(<a href=3D"https://lists.gnu.org/arch=
ive/html/qemu-devel/2021-01/msg02887.html">https://lists.gnu.org/archive/ht=
ml/qemu-devel/2021-01/msg02887.html</a>)<br><br>It seems that the man page =
of qemu command contains no parameter and option yet for this feature. May =
I know whether is it still in experimental stage?=C2=A0And even a few more =
questions:<br><br>- Is &quot;x-remote&quot; a standalone machine type for c=
reating the orchestrator?<br>- Can each device has a dedicated emulation pr=
ocess or shares one process for emulating multiple devices?<br>- Are there =
more command line examples illustrating the combination of orchestrator, re=
mote emulation process, memory-backend-memfd and x-pci-proxy-dev?</div><div=
><br>Thank you very much<br>Kind regard<font color=3D"#888888"><br><br>Yu Z=
hang=C2=A0@ IONOS Compute Platform<br>03.06.2022</font></div></div>

--000000000000f3dd0b05e0890224--

