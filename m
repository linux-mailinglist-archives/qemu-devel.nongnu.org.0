Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732802130F1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 03:21:26 +0200 (CEST)
Received: from localhost ([::1]:51988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrAOL-0003Q9-HH
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 21:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1jrAMz-0001pz-GO
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 21:20:01 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:43945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1jrAMx-0005Pp-LO
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 21:20:01 -0400
Received: by mail-lj1-x241.google.com with SMTP id f5so18811716ljj.10
 for <qemu-devel@nongnu.org>; Thu, 02 Jul 2020 18:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Io6xO3Ak8TgGLkJ7zYuKd7hYvKIe0WNqqOt6BTxLDN0=;
 b=I3h2PVvAUweORL4irn1Gld5Z9KknxrxUhw6pP/bFWWqIpnIsUjeAXg/WakF96l4BYO
 G8ehHsmuLod/LAWXxFKoY+oo+LLhmD/ImNzaHpGqcxIijeL/6+bJpePFaGkxnhLfT4NH
 n0pVhY53+PmM07cmI7XWC69ZTfnmzaAjLoW8RzAL/i6vhScQgqmxMGwzfS8euLPctogS
 RFTdHfJfevUoMbt4DYsTH2xzMM66X4rt4nOa0F/i9CRDBXK3eaIEflEGjeJR/ePgHQ3P
 HY+LMVvoee3ap5z0vR60AW4KpSA4t0ihYrQJi1OTtrQu1d43HllBLdZZIRrdfIK34fqW
 NCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Io6xO3Ak8TgGLkJ7zYuKd7hYvKIe0WNqqOt6BTxLDN0=;
 b=qBp8Rb7/jKOdVoyPdwRX/ykg8tNPH8TCUwNkP5ZEVmEnsDedPkIyfsc02Tesg6O7K+
 gEJB2zrnNoWRoM932lZEueOjQC5RgmyoBDomCjG1QyJ77S0rVdPFOEcGAogReYqmRL8S
 rla72vPRT3Y+l/a59RHmeyFJ+O2sbi80g6Nb/h9fWyGEN+qLVDSRFapkdlbbWy9TxWaW
 v4g/do6Y3MjqVg4mGa9M7CRYG3AzPWec8eHNE/It8ZD0c+tNjgj44QLUvvRRd77wveBH
 qwOGaIAEeaZhlhtCeyZsMvT7byKfwl7NcC5NBq9TGbVp5CrdncE8avBoPibI+BKIyeE+
 zPzA==
X-Gm-Message-State: AOAM533HWb4ivZ/J25axBjGGCaakfELYddy3vNb55y8Cq7WMYbOYwIu9
 OFbNf/cLlgVADA9vcC2yTIuDglbEy0a2OOCmP0U=
X-Google-Smtp-Source: ABdhPJyiN2hn8mailCMeSuS2wL6L0cW+P7D5fi4CVXf84VkvWZ5HLyXjBR/Z0AMa10XkoBmVkUeLPCbvnqgY8V466zw=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr17770573ljj.43.1593739196954; 
 Thu, 02 Jul 2020 18:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200702133701.25237-1-f4bug@amsat.org>
 <20200702133701.25237-6-f4bug@amsat.org>
 <27bef940-48cd-1d1b-85b8-45328baa2917@flygoat.com>
In-Reply-To: <27bef940-48cd-1d1b-85b8-45328baa2917@flygoat.com>
From: chen huacai <zltjiangshi@gmail.com>
Date: Fri, 3 Jul 2020 09:19:45 +0800
Message-ID: <CABDp7VoRmPzu0R1OGaG268vi_4tHxU9LGPMstymqT2xCDSTAfA@mail.gmail.com>
Subject: Re: [PATCH 5/5] MAINTAINERS: Adjust MIPS maintainership (Add Huacai
 Chen & Jiaxun Yang)
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::241;
 envelope-from=zltjiangshi@gmail.com; helo=mail-lj1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Yunqiang Su <syq@debian.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 qemu-level <qemu-devel@nongnu.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Lichao Liu <liulichao@loongson.cn>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Acked-by: Huacai Chen <chenhc@lemote.com>

On Thu, Jul 2, 2020 at 10:23 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote=
:
>
>
> =E5=9C=A8 2020/7/2 =E4=B8=8B=E5=8D=889:37, Philippe Mathieu-Daud=C3=A9 =
=E5=86=99=E9=81=93:
> > From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> >
> > Huacai Chen steps in as new energy [1].
> >
> > Aurelien Jarno comment [2]:
> >
> >    It happens that I known Huacai Chen from the time he was
> >    upstreaming the Loongson 3 support to the kernel, I have been
> >    testing and reviewing his patches. I also know Jiaxun Yang from
> >    the #debian-mips IRC channel. I know that they are both very
> >    competent and have a good knowledge of the open source world.
> >    I therefore agree that they are good additions to maintain and/or
> >    review the MIPS part of QEMU.
> >
> > [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg718434.html
> > [2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg718738.html
> >
> > Cc: Huacai Chen <chenhc@lemote.com>
> > Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Cc: Aurelien Jarno <aurelien@aurel32.net>
> > Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> > Message-Id: <20200701182559.28841-3-aleksandar.qemu.devel@gmail.com>
> > PMD: [Split patch in 3, added Aurelien comment]
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> I can help with reviewing relevant patches .
>
> Thanks.
>
> > ---
> > Aurelien comment is probably worth an Acked-by tag.
> >
> > Cc: Yunqiang Su <ysu@wavecomp.com>
>
> + Yunqiang's Debian mailbox as he no longer works for MIPS/Wave but
> still working on Debian/MIPS.
>
> > Cc: Lichao Liu <liulichao@loongson.cn>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> >
> >   MAINTAINERS | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 64f54c553c..8155525077 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -213,6 +213,7 @@ F: disas/microblaze.c
> >
> >   MIPS TCG CPUs
> >   M: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> > +R: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >   R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> >   S: Maintained
> >   F: target/mips/
> > @@ -375,6 +376,7 @@ S: Maintained
> >   F: target/arm/kvm.c
> >
> >   MIPS KVM CPUs
> > +M: Huacai Chen <chenhc@lemote.com>
> >   M: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> >   S: Odd Fixes
> >   F: target/mips/kvm.c
> > @@ -2672,6 +2674,8 @@ F: disas/i386.c
> >
> >   MIPS TCG target
> >   M: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> > +R: Huacai Chen <chenhc@lemote.com>
> > +R: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >   R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> >   S: Maintained
> >   F: tcg/mips/
>


--=20
Huacai Chen

