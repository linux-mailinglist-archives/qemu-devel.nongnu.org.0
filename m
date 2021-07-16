Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F503CBF3F
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 00:27:55 +0200 (CEST)
Received: from localhost ([::1]:42470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4WJG-0008L8-Vp
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 18:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m4WHu-0007ci-96
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 18:26:30 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:35394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m4WHs-0004MA-44
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 18:26:30 -0400
Received: by mail-oi1-x232.google.com with SMTP id p67so12718610oig.2
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 15:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5Md/SNY/BBtdyRfO/OiZ2PKmCg05NGwGhMBm8hEV63w=;
 b=B87OF5yWkmXI3xnmJmkaZnyIVqZ7JkLSq3dNPtqgLbvyy2iI1Hun8+2rfxtV/sNsMy
 mVkXbp5GTNtfPFxRGFj242RAlCUdCfJgmSL/9y+6peZmNC1cmfKcghTKCD9yYiel47vl
 NviqQXWJoK9fQpRs4d68oAeIqTk9LZOXf7OP//Fw0WW4VexWfGIAhnPfyby5uWr5Al5n
 gSzkaznebmkJ+IXbTZMyECIXv3rSjoX7DfinWobfICbBLVkStSFgp8Jqi7W2aKZfp2Kq
 VMOFE2tapNvjsTk+s4Q4EzDb5RARw8EXKPWMeyTOVrLgxV157xPahvPULCwtsY/jQmmr
 fsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5Md/SNY/BBtdyRfO/OiZ2PKmCg05NGwGhMBm8hEV63w=;
 b=Qgyj6+Iz7/4t3IkMszHMBS1vWT37wjAwNV/d7/0Q0t39cQTZIHPLNdNkrNN6+tRcb3
 Aw8MJf47eNHwV/a65+ydXq84EOf0ACfwe9aAGd4pQyp99oQ0KJEJv0X5ZtDgTg/a6Wea
 OC55AOA3WhSeOIbCDtCaD57lzZYT8qTQrXLGGmrvcJFl94n0CFK+6oXmanuxRu2HbQ9Q
 tzZtBTe1cAwtl4bgORjWyySICv1cTJxXR+019c7w74uFPf4G2v5PUJ8mCmb733Ppwl5S
 fFzm6DvKxc919TAtICTpLGM6RIIhkkP229MmFzuGCpC2iUkZY6rdd5wu/+i59s0Ym3Vw
 Jj/Q==
X-Gm-Message-State: AOAM5310qvMo44SAijiTs7VA/PhaspHvKjiTuzt8MzkqA8zBOQh1y2Y0
 EpTHtlC5fevl4PMGJDGaVgZ8uaxSXTqHUgO18m9RSAyrFy0=
X-Google-Smtp-Source: ABdhPJzpbgDtoCGei8tio6tvKqt9ygqDkLvHKPGguZHu/0lDNis1jhDAuAIIqYX8V0iKykCbmYRvOr/qXbcuJRuTnq4=
X-Received: by 2002:aca:d805:: with SMTP id p5mr9673398oig.60.1626474386507;
 Fri, 16 Jul 2021 15:26:26 -0700 (PDT)
MIME-Version: 1.0
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Fri, 16 Jul 2021 17:26:14 -0500
Message-ID: <CAK7rcp9s4oEOb-eqj6cz1nu=O5RpFKQeK56nc5KvN7_YrTZeNA@mail.gmail.com>
Subject: Uninitialized variables err during dev
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000000b4a9905c7451487"
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=kennethadammiller@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000b4a9905c7451487
Content-Type: text/plain; charset="UTF-8"

Hello all,

I'm getting a strange error while doing some system target development. In
the periphery of the qemu internals (things specifically other than the
target), I'm getting uninitialized variable errors. I'm pretty sure I can't
submit a patch to modify those internals, so I was wondering how or why
such an error would crop up for me and what I should do about it? I don't
see anywhere that configure or meson allow for build flags to be set.

The specific error I get is:

../accel/tcg/cpu-exec.c: In function 'cpu_exec_step_atomic':
.... tb-lookup..h:41:10: error: 'flags' may be used uninitialized in this
function.

In which case, I note that if I clear my changes that my build runs to
completion just fine. I don't know what change I could have introduced that
would cause this error. I also don't know why the compiler would get
something so wrong either, because the address of the variable is used, not
the variable itself.

--0000000000000b4a9905c7451487
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<br><div><br></div><div>I&#39;m getting a strang=
e error while doing some system target development. In the periphery of the=
 qemu internals (things specifically other than the target), I&#39;m gettin=
g uninitialized variable errors. I&#39;m pretty sure I can&#39;t submit a p=
atch to modify those internals, so I was wondering how or why such an error=
 would crop up for me and what I should do about it? I don&#39;t see anywhe=
re that configure or meson allow for build flags to be set.=C2=A0 =C2=A0<br=
><br>The specific error I get is:=C2=A0</div><div><br></div><div>../accel/t=
cg/cpu-exec.c: In function &#39;cpu_exec_step_atomic&#39;:<br>.... tb-looku=
p..h:41:10: error: &#39;flags&#39; may be used uninitialized in this functi=
on.<br><br>In which case, I note that if I clear my changes that my build r=
uns to completion just fine. I don&#39;t know what change I could have intr=
oduced that would cause this error. I also don&#39;t know why the compiler =
would get something so wrong either, because the address of the variable is=
 used, not the variable itself.</div></div>

--0000000000000b4a9905c7451487--

