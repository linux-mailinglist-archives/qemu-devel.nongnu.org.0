Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D56A311075
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:57:26 +0100 (CET)
Received: from localhost ([::1]:39328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l86IG-0005Hz-Kw
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kaifengx@princeton.edu>)
 id 1l85vL-0000Xs-3a
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 13:33:43 -0500
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:46817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kaifengx@princeton.edu>)
 id 1l85vF-0000uu-Lg
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 13:33:39 -0500
Received: by mail-lj1-x236.google.com with SMTP id v15so8856703ljk.13
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 10:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=princeton-edu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=HS6JGhW+kDdYhhL9WdvAcUadm2ah2ErVY19Nz06DgP4=;
 b=xDsi1epU2uD/SE65uDZTFfFO/1Zgp+n03U2ctpHLdeiia2Sy+zmWUjpmUpTuHfyfcG
 EBLwUdXRJZ4i3F7n6qNj05QBGPFkw/HKCNEw4Sxm66k5KYC7AV2eUNN7NULP4Bki5VXv
 L3Y9cA505R7aHoWYQZeF9T2gJHgCikOT5dQBX/jdY6pR0HVoKO3+vFTEYCqnmyNjBkQ6
 95nk8ZOsl2s5H8p9y8ZZCQSMTYkoCA/SzFonnRiyHg5+r2amx3X3H+//buHCXTEs9Go7
 5oqMuPJVUqrzbjwqCRrFf7DmJojB/483sgJENuModRGHSVGaDE95LpUUWNrr6bEIbhM+
 Rs6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=HS6JGhW+kDdYhhL9WdvAcUadm2ah2ErVY19Nz06DgP4=;
 b=RtwCKduCRWYDpW85IW9/S/MHvnr2WVtH9mEFUn2esQfXXnmbznncDf0+rKOPYHhpJE
 szrXaF8yybIzeXPiWXEDLMHTjuoVTiN558zSOo90k+3O+GxW0+0+6kR7VgQUup9nbuJI
 W98PMGLkK/O5M5DjNN/s1xqj8C0JUsibhbVYUr3VqwQOtvzLMS7EsD5DwBe13pudRrGa
 L+STwlQe7RH1sdrYHBChrYe3m7QR7LsNQ/pRMcKajzmOksYd0LQ200Ya3vFeLGidZmCH
 0WuAHBCMYnCh5OLPQNIF1aG1kLQLVWuysYPNVjoe3WtoPrhLeWi92BcFp8zymDfIlmca
 Y5TA==
X-Gm-Message-State: AOAM532WQhMQzrkmRy5AonguIp4ixYAlhuBavNUk68IvDjmjl0nEYmjV
 dYPEcwF10i8xaXmsNyS5VTRY1NOUSQBEM74d2QWp6JBSfDwdqQ==
X-Google-Smtp-Source: ABdhPJzHI94yT1+9H80fvYODJ3YuZTZcQ93c2ySY0weKLnKKeTodYMgzlifoAV5SpftfxX9+MUsAO1b2gvo7R3Wnbks=
X-Received: by 2002:a2e:2ac5:: with SMTP id q188mr3427085ljq.345.1612550009147; 
 Fri, 05 Feb 2021 10:33:29 -0800 (PST)
MIME-Version: 1.0
From: Kaifeng Xu <kaifengx@princeton.edu>
Date: Fri, 5 Feb 2021 13:33:17 -0500
Message-ID: <CAN6boZY7CEmkdfkKhauObLT8BOi_wJfs4CezRpqC4PPB3sbC=A@mail.gmail.com>
Subject: [QEMU TCG] Qeustion about the PCID Feature in TCG
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000007a651705ba9b0e28"
Received-SPF: neutral client-ip=2a00:1450:4864:20::236;
 envelope-from=kaifengx@princeton.edu; helo=mail-lj1-x236.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 05 Feb 2021 13:54:45 -0500
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

--0000000000007a651705ba9b0e28
Content-Type: text/plain; charset="UTF-8"

Hi,
I am running QEMU in TCG mode (my server doesn't have kvm support), and I
am getting the memory traces in a x86 guest machine of all memory accesses,
including the PCID (process-context identifier, and I need that for my
current research), on a linux host. I have seen the TCG PCID feature flag
is commented out in target/i386/cpu.c, and if I directly emulate a CPU
which has PCID flag I got the warning:

warning: TCG doesn't support requested feature: CPUID.01H:ECX.pcid [bit 17]

so I uncommented the CPUID_EXT_PCID in TCG_EXT_FEATURES, and
the CPUID_7_0_EBX_INVPCID in TCG_7_0_EBX_FEATURES, in  target/i386/cpu.c. I
have seen the PCID in the cr3 register in cpu get set, my question is that
I am not sure if there will be any issues with this flag. Why is it
commented out by default?

Just in case, I will put my commands here. Here are my configurations for
compiling:

*./configure --prefix=/tigress/kaifengx/sysroot/
--target-list=x86_64-softmmu,x86_64-linux-user --disable-kvm --disable-vnc
--enable-gtk --enable-plugins*

And my command for running the QEMU:


*qemu-system-x86_64 \*











*    -cpu qemu64,+pcid\    -m 4G \    -icount shift=0 \    -drive
if=virtio,file=${DISK},cache=none \    -device pqii \    -trace
events=`pwd`/events \    -D ${LOG_FILE} \    -net
user,hostfwd=tcp::10022-:22 \    -net nic \    -display none \
-nographic \    -plugin QEMU_PATH/tests/plugin/libtlb.so,arg=inline,arg=io*

Best,
Kaifeng

--0000000000007a651705ba9b0e28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small"><di=
v class=3D"gmail-gE gmail-iv gmail-gt" style=3D"padding:20px 0px 0px;font-s=
ize:0.875rem;font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif"><ta=
ble cellpadding=3D"0" class=3D"gmail-cf gmail-gJ" style=3D"border-collapse:=
collapse;margin-top:0px;width:auto;font-size:0.875rem;letter-spacing:0.2px;=
display:block"><tbody style=3D"display:block"></tbody></table><span style=
=3D"font-family:Arial,Helvetica,sans-serif;font-size:small">Hi,</span></div=
><div class=3D"gmail-" style=3D"font-family:Roboto,RobotoDraft,Helvetica,Ar=
ial,sans-serif;font-size:medium"><div id=3D"gmail-:1az" class=3D"gmail-ii g=
mail-gt" style=3D"font-size:0.875rem;direction:ltr;margin:8px 0px 0px;paddi=
ng:0px"><div id=3D"gmail-:1ay" class=3D"gmail-a3s gmail-aiL" style=3D"overf=
low:hidden;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
stretch:normal;font-size:small;line-height:1.5;font-family:Arial,Helvetica,=
sans-serif"><div dir=3D"ltr"><div class=3D"gmail_default">I am running QEMU=
 in TCG mode (my server doesn&#39;t have kvm support), and I am getting the=
 memory traces in a x86 guest machine of all memory accesses, including the=
 PCID (process-context identifier, and I need that for my current research)=
, on a linux host. I have seen the TCG PCID feature flag is commented out i=
n=C2=A0target/i386/cpu.c, and if I directly emulate a CPU which has PCID fl=
ag I got the warning:=C2=A0<br><br></div><div class=3D"gmail_default"><span=
 style=3D"color:rgb(51,51,51);font-family:monospace;font-size:12px">warning=
: TCG doesn&#39;t support requested feature: CPUID.01H:ECX.pcid [bit 17]<br=
></span><br>so I uncommented the CPUID_EXT_PCID in=C2=A0TCG_EXT_FEATURES, a=
nd the=C2=A0CPUID_7_0_EBX_INVPCID in=C2=A0TCG_7_0_EBX_FEATURES, in=C2=A0 ta=
rget/i386/cpu.c. I have seen the PCID in the cr3 register in cpu get set,=
=C2=A0my question is that I am not sure if there will be any issues with th=
is flag. Why is it commented out by default?</div><div class=3D"gmail_defau=
lt"><br></div><div class=3D"gmail_default">Just in case, I will put my comm=
ands here. Here are my configurations for compiling:</div><div class=3D"gma=
il_default"><br><i>./configure --prefix=3D/tigress/kaifengx/sysroot/ --targ=
et-list=3Dx86_64-softmmu,x86_64-linux-user --disable-kvm --disable-vnc --en=
able-gtk --enable-plugins</i><br></div><div><br></div><div><div class=3D"gm=
ail_default">And my command for running the QEMU:</div><div class=3D"gmail_=
default"><br></div><div class=3D"gmail_default"><i>qemu-system-x86_64 \<br>=
</i></div><i>=C2=A0 =C2=A0 -cpu qemu64,+pcid\<br>=C2=A0 =C2=A0 -m 4G \<br>=
=C2=A0 =C2=A0 -icount shift=3D0 \<br>=C2=A0 =C2=A0 -drive if=3Dvirtio,file=
=3D${DISK},cache=3Dnone \<br>=C2=A0 =C2=A0 -device pqii \<br>=C2=A0 =C2=A0 =
-trace events=3D`pwd`/events \<br>=C2=A0 =C2=A0 -D ${LOG_FILE} \<br>=C2=A0 =
=C2=A0 -net user,hostfwd=3Dtcp::10022-:22 \<br>=C2=A0 =C2=A0 -net nic \<br>=
=C2=A0 =C2=A0 -display none \<br>=C2=A0 =C2=A0 -nographic \<br>=C2=A0 =C2=
=A0 -plugin=C2=A0<span class=3D"gmail_default">QEMU_PATH</span>/tests/plugi=
n/libtlb.so,arg=3Dinline,arg=3Dio</i></div><div><i><br></i></div><div>Best,=
</div><div>Kaifeng</div></div></div></div></div></div></div>

--0000000000007a651705ba9b0e28--

