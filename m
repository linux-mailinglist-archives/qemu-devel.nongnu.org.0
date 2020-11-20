Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3A62BA175
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 05:30:42 +0100 (CET)
Received: from localhost ([::1]:35236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfy4H-0006aD-8i
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 23:30:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1kfy2W-0005eM-JD
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 23:28:52 -0500
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:41517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1kfy2U-0004q1-Tf
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 23:28:52 -0500
Received: by mail-io1-xd44.google.com with SMTP id t8so8578076iov.8
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 20:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HCSO8JcojxmCe9X0WTz/ORDp8kcmvzlbrdoF5xVWspQ=;
 b=fuqj0vzmDaN1hDbOsrGUCRqn4p4wU6qPAi+AVDaZ1Z7zv86sZA3t3mExKYsUvNPIzl
 FJXBRRts/VktA+o4y0Q0GgGdTIPVSea2KyVFx/DafzKCjw2kIzNmq6g1j4HhYwLLEoW7
 ggb2quitM+BAapa09wR2I7XVqe3EaszhMqOS1IC6flQ15ixtNGR4uItvDekH/jsN3fkZ
 3ho+3JemYhCWXKL2Bb+RNeSZTplAzOrk3ygt9Nq2s3aHZe4iMGlNF9rXOaKvvbT/OSgd
 v8H5QuJAaumB79rwPs5A0j6qF5Ge6S4LZYTUGyQsbVxU5stGWg4nXFk2O5nNAppOSmRa
 KdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HCSO8JcojxmCe9X0WTz/ORDp8kcmvzlbrdoF5xVWspQ=;
 b=a6yIRMst00hwvXDnVCJkJs3NVurDdCMeQpncuREpRAPMA9iObhQMCZhn7WWWxRsM9P
 cJ6J9XzvazbTo+5nuFyRyv96IJjLozSVpycxr0F2FeLCiJ1CkCVFmMmvaY7ns1i2j3Ic
 A3Z9BufVYpYfC+tV2dbaKH8NxBPEDSJJP9pCFvTaE7vWzuo4gQzPUFbNUyEm9GERb8Jq
 rE43nj/df2oV9bz/qizLKm8RnxGPpss3ZUG2xxVr0c/4gkBk65fXDTTDWwSVyM4XcY4I
 yoaqsYNHmIAC2MTdssV90o97IctKcQblBckrhxuwBrDRysXHEzfNuid28vrDr02tyvz2
 ZzIQ==
X-Gm-Message-State: AOAM530rODb8kImUaxQrfB/kjXidsfaDjcOfN56uDOVdU+Uhex7sFEIH
 uf1ZKu1pZqeWOgk1a5BLa435vrclTXc+vhsFE2w=
X-Google-Smtp-Source: ABdhPJwvvGBk3DVGk42ruQ2oPuIou4cEuNKJdeBLfinnnDnxW0jBWly/Z5INIMZNTPMVZSz/ktmyNhWwliEY8snCgOU=
X-Received: by 2002:a02:ba90:: with SMTP id g16mr17446099jao.96.1605846529315; 
 Thu, 19 Nov 2020 20:28:49 -0800 (PST)
MIME-Version: 1.0
References: <1602059975-10115-1-git-send-email-chenhc@lemote.com>
 <1602059975-10115-3-git-send-email-chenhc@lemote.com>
 <0dfbe14a-9ddb-0069-9d86-62861c059d12@amsat.org>
In-Reply-To: <0dfbe14a-9ddb-0069-9d86-62861c059d12@amsat.org>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Fri, 20 Nov 2020 12:28:37 +0800
Message-ID: <CAAhV-H63zhXyUizwOxUtXdQQOR=r82493tgH8NfLmgXF0g8row@mail.gmail.com>
Subject: Re: [PATCH V13 2/9] meson.build: Re-enable KVM support for MIPS
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=chenhuacai@gmail.com; helo=mail-io1-xd44.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Huacai Chen <zltjiangshi@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Philippe,

On Wed, Nov 18, 2020 at 1:17 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi Huacai,
>
> On 10/7/20 10:39 AM, Huacai Chen wrote:
> > After converting from configure to meson, KVM support is lost for MIPS,
> > so re-enable it in meson.build.
> >
> > Fixes: fdb75aeff7c212e1afaaa3a43 ("configure: remove target configurati=
on")
> > Fixes: 8a19980e3fc42239aae054bc9 ("configure: move accelerator logic to=
 meson")
> > Cc: aolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > ---
> >  meson.build | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meson.build b/meson.build
> > index 17c89c8..b407ff4 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -59,6 +59,8 @@ elif cpu =3D=3D 's390x'
> >    kvm_targets =3D ['s390x-softmmu']
> >  elif cpu in ['ppc', 'ppc64']
> >    kvm_targets =3D ['ppc-softmmu', 'ppc64-softmmu']
> > +elif cpu in ['mips', 'mips64']
> > +  kvm_targets =3D ['mips-softmmu', 'mipsel-softmmu', 'mips64-softmmu',=
 'mips64el-softmmu']
>
> Are you sure both 32-bit hosts and targets are supported?
>
> I don't have hardware to test. If you are not working with
> 32-bit hardware I'd remove them.
When I add MIPS64 KVM support (Loongson-3 is MIPS64), MIPS32 KVM is
already there. On the kernel side, MIPS32 KVM is supported, but I
don't know whether it can work well.

Huacai

>
> >  else
> >    kvm_targets =3D []
> >  endif
> >

