Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D5E2DC83F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 22:19:48 +0100 (CET)
Received: from localhost ([::1]:47342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpeD5-0001z5-AP
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 16:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1kpe9u-0007gf-Uq
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 16:16:30 -0500
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a]:35131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1kpe9t-0007r7-A2
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 16:16:30 -0500
Received: by mail-oo1-xc2a.google.com with SMTP id s19so1953217oos.2
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 13:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/xRNUnELuECnOYZsfduCGoq//6EaRAhbWncypVesvgM=;
 b=FBsAuVRAR5y7pim8Oli3v2yz3LVDbIHTUJFfb9tOuq//C+LPSpSVS58g03b0I3Amwu
 BWGCSVfIWJAvYVC9u/w6JTFVGIKK4G3M8DQ6h5g6ypXiuJivkG2a02WfuWRecdIRNMm3
 oML8ILLYF6K/LQRNgoK5S/Wmfxncypypa3SrH+bS8ZF+gq97GwZPBS56uhsaGw24CW9u
 d5AmXww/JdWvGbU3BS8idgn8cuIMNdKgYB5THV+ECsz0mrWUPJPB5ch6AdLjxr30gWKG
 7kCOdBU2VBe7mjMwOvu1zBZecRXt2gHgedxNnCN2j9j/1VnJzq9CsWromEsFANFJUDyL
 WbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/xRNUnELuECnOYZsfduCGoq//6EaRAhbWncypVesvgM=;
 b=KKmVgMfA7OqHp0DCADFZ1UKIPXkPfEIL//SbiRSYFDDvuh7ur9UQwzwxnJ609OPqID
 DsZ6BBpxhaniLkF1LAR8aKnYlyUUPJFRl7bo+R77cOU5bBN03cQ26qLDf0x2em3bfimR
 d5hgGtqZ2t/zMbmFiXwhmKxlPs2T9TuIOh6HAprUKOBJBLl9BjJwcnb0OB8rboWBZgpQ
 niYssSS/x8RvIF2wOuS0pzleYqi8SW0dYiwZ94RZpG6gxmKOkFJWboQ3t1FbK/xLjRch
 wBrYsQwG04dl7902A8pGVzfri4JDq0iqjVvd/tK/BIaBw3aQBrvfisDiUf6nnqecRtYq
 OB1A==
X-Gm-Message-State: AOAM532Lm0X7+gC0llaxBqvZ9S/ZPUu6Vm28LfLBWJKGQG/Y5+NaFrVs
 ovS16Qc6NK+avNWydoglQSLgeoIOplbiYdrZgs4NKAIYdXua8g==
X-Google-Smtp-Source: ABdhPJwFAlVVeaZ1FAaRfVz+J2nQVfJ+dqzvkT+KZh4rmepjL6FE6UMb+iILn0FDoPkCHm2VLGBvn1v+nSE2hL5OVUM=
X-Received: by 2002:a4a:4ccb:: with SMTP id a194mr26486582oob.14.1608153388029; 
 Wed, 16 Dec 2020 13:16:28 -0800 (PST)
MIME-Version: 1.0
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Wed, 16 Dec 2020 22:16:16 +0100
Message-ID: <CABLmASExSbekU=r2LajHDVxWXEY-vxBnT+_BnjdAm6Y9Nw8y1g@mail.gmail.com>
Subject: Bug: qemu-system-ppc -M mac99 boots into compat-monitor, not openbios.
To: qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000701add05b69b63bc"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000701add05b69b63bc
Content-Type: text/plain; charset="UTF-8"

Hi all,

It seems a qemu-system-ppc from current master no longer boots into
openbios, but into to the compat monitor.
Command line to reproduce:
/home/hsp/src/qemu-master/build/qemu-system-ppc \
-L pc-bios \
-M mac99,via=pmu -m 1024 -boot c \
-drive file=/home/hsp/Mac-disks/9.2.img,format=raw,media=disk

Bisecting leads to this commit:

commit b4e1a342112e50e05b609e857f38c1f2b7aafdc4
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Tue Oct 27 08:44:23 2020 -0400

    vl: remove separate preconfig main_loop

    Move post-preconfig initialization to the x-exit-preconfig.  If
preconfig
    is not requested, just exit preconfig mode immediately with the QMP
    command.

    As a result, the preconfig loop will run with accel_setup_post
    and os_setup_post restrictions (xen_restrict, chroot, etc.)
    already done.

    Reviewed-by: Igor Mammedov <imammedo@redhat.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

 include/sysemu/runstate.h |  1 -
 monitor/qmp-cmds.c        |  9 -----
 softmmu/vl.c              | 95
++++++++++++++++++++---------------------------
 3 files changed, 41 insertions(+), 64 deletions(-)

Thanks for looking into this,

Best,
Howard

--000000000000701add05b69b63bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,<br></div><div><br></div><div>It seems a qemu-=
system-ppc from current master no longer boots into openbios, but into to t=
he compat monitor.</div><div>Command line to reproduce:</div><div>/home/hsp=
/src/qemu-master/build/qemu-system-ppc \<br>-L pc-bios \<br>-M mac99,via=3D=
pmu -m 1024 -boot c \<br>-drive file=3D/home/hsp/Mac-disks/9.2.img,format=
=3Draw,media=3Ddisk</div><div><br></div><div>Bisecting leads to this commit=
:<br></div><div><br></div><div>commit b4e1a342112e50e05b609e857f38c1f2b7aaf=
dc4</div>Author: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">p=
bonzini@redhat.com</a>&gt;<br>Date: =C2=A0 Tue Oct 27 08:44:23 2020 -0400<b=
r><br>=C2=A0 =C2=A0 vl: remove separate preconfig main_loop<br>=C2=A0 =C2=
=A0 <br>=C2=A0 =C2=A0 Move post-preconfig initialization to the x-exit-prec=
onfig.=C2=A0 If preconfig<br>=C2=A0 =C2=A0 is not requested, just exit prec=
onfig mode immediately with the QMP<br>=C2=A0 =C2=A0 command.<br>=C2=A0 =C2=
=A0 <br>=C2=A0 =C2=A0 As a result, the preconfig loop will run with accel_s=
etup_post<br>=C2=A0 =C2=A0 and os_setup_post restrictions (xen_restrict, ch=
root, etc.)<br>=C2=A0 =C2=A0 already done.<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=
=A0 Reviewed-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com">i=
mammedo@redhat.com</a>&gt;<br>=C2=A0 =C2=A0 Signed-off-by: Paolo Bonzini &l=
t;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt;<br><br=
>=C2=A0include/sysemu/runstate.h | =C2=A01 -<br>=C2=A0monitor/qmp-cmds.c =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A09 -----<br>=C2=A0softmmu/vl.c =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 95 ++++++++++++++++++++------------=
---------------<br><div>=C2=A03 files changed, 41 insertions(+), 64 deletio=
ns(-)</div><div><br></div><div>Thanks for looking into this,</div><div><br>=
</div><div>Best,</div><div>Howard<br></div></div>

--000000000000701add05b69b63bc--

