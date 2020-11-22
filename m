Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20B32BC36B
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 04:33:25 +0100 (CET)
Received: from localhost ([::1]:58542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgg7w-0006vG-Gl
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 22:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1kgg6Q-0006UQ-O0
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 22:31:50 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:33756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1kgg6J-0005Up-BM
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 22:31:50 -0500
Received: by mail-il1-x141.google.com with SMTP id y9so12309873ilb.0
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 19:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DMI/wLOC6RBuB5VjNgBslovKlRyC0ZzSlxYxOIZ8Xog=;
 b=ZKKfKJfpa5EuWPtMs5r1Tf4+cwznpQXBa4SlY+W//0kfw8nwgQle0kti0UJNlsd65m
 W5Kw9+lpx5GBpCpTXwYz+7xAZNuTfmhxXmz6dJQXR6wsIqHYPbLmvI8op5F3E7WEJVBL
 qikYJwtPA/qvIzehRQkbDMWWm5YzRvTw+mm+nxE4Vug1rW4YeolKR3RExia+KHj7vPZV
 WKhFdrJiVHpLZ/JEWBy9dC15rBbFOYdGLjn0WqRu1M0oJkNTBGxJ5aN4KwKJSOkmA3QE
 KvrP76N/LE0fo8wzVfvvY1NRE28bZdqoV7ca9DfDQ9fh5QNhf+wOKUJh4HPtW2YtDMI4
 joGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DMI/wLOC6RBuB5VjNgBslovKlRyC0ZzSlxYxOIZ8Xog=;
 b=XtQmIBGQrxaFEs+J2ZQMrAzr+5k3GomROWm4YJBo/2xqRLNFg38m+3phOm8QxaN1J0
 ch2GWPfSVBrYYmeC810OzEnH0TLtqtP+jhoQTkRcUEgRpukdVFyvvwaNYv7L6GgbvF3G
 6gfthutf2Cs9wSgQLeU57WBhFGSi3yMna+u4ks9duk04P23rChwnkkzuvAPbiqGg6Fv0
 6uvAVXkU352+NfbfwtPCy/IPLmQ+Ro+BD7r+WQM6UuwEln7MG7o/LdUQHIeHdq//0Y/o
 IkYLnBjcBhCkPKn1bTbWzPUN/V7yBDxEgt6Li55ycKOkiHsWJzyGE3j9zGsWPY/5hDCC
 S6Zw==
X-Gm-Message-State: AOAM530YTeGARkZ5nJGM21GzCq8RKLsOfyFcgALhGghh4bau8RO7lH0H
 DdW841QhCujgYpbNIKojMMt1Gai//Qxg2ZIvWy8=
X-Google-Smtp-Source: ABdhPJzMpylpjDJBdZg07evHu9qJ/64m3KtP1H6ZyYm8RE63o99PSZNSmK33hYsYK1CoWbmOhNaUmuoKt7Q7AYq565A=
X-Received: by 2002:a92:85c5:: with SMTP id
 f188mr32207204ilh.173.1606015895279; 
 Sat, 21 Nov 2020 19:31:35 -0800 (PST)
MIME-Version: 1.0
References: <1602059975-10115-1-git-send-email-chenhc@lemote.com>
 <1602059975-10115-3-git-send-email-chenhc@lemote.com>
 <0dfbe14a-9ddb-0069-9d86-62861c059d12@amsat.org>
 <CAAhV-H63zhXyUizwOxUtXdQQOR=r82493tgH8NfLmgXF0g8row@mail.gmail.com>
 <9fc6161e-cf27-b636-97c0-9aca77d0f9cd@amsat.org>
In-Reply-To: <9fc6161e-cf27-b636-97c0-9aca77d0f9cd@amsat.org>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Sun, 22 Nov 2020 11:31:23 +0800
Message-ID: <CAAhV-H5wPZQ+TGdZL=mPV4YQcjHarJFoEH-nobr10PdesR-ySg@mail.gmail.com>
Subject: Re: [PATCH V13 2/9] meson.build: Re-enable KVM support for MIPS
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=chenhuacai@gmail.com; helo=mail-il1-x141.google.com
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
Cc: Huacai Chen <zltjiangshi@gmail.com>, Thomas Huth <thuth@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+CC Jiaxun

Hi, Jiaxun,

What do you think about?

Huacai

On Fri, Nov 20, 2020 at 6:55 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 11/20/20 5:28 AM, Huacai Chen wrote:
> > On Wed, Nov 18, 2020 at 1:17 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> >> On 10/7/20 10:39 AM, Huacai Chen wrote:
> >>> After converting from configure to meson, KVM support is lost for MIP=
S,
> >>> so re-enable it in meson.build.
> >>>
> >>> Fixes: fdb75aeff7c212e1afaaa3a43 ("configure: remove target configura=
tion")
> >>> Fixes: 8a19980e3fc42239aae054bc9 ("configure: move accelerator logic =
to meson")
> >>> Cc: aolo Bonzini <pbonzini@redhat.com>
> >>> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> >>> ---
> >>>  meson.build | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/meson.build b/meson.build
> >>> index 17c89c8..b407ff4 100644
> >>> --- a/meson.build
> >>> +++ b/meson.build
> >>> @@ -59,6 +59,8 @@ elif cpu =3D=3D 's390x'
> >>>    kvm_targets =3D ['s390x-softmmu']
> >>>  elif cpu in ['ppc', 'ppc64']
> >>>    kvm_targets =3D ['ppc-softmmu', 'ppc64-softmmu']
> >>> +elif cpu in ['mips', 'mips64']
> >>> +  kvm_targets =3D ['mips-softmmu', 'mipsel-softmmu', 'mips64-softmmu=
', 'mips64el-softmmu']
> >>
> >> Are you sure both 32-bit hosts and targets are supported?
> >>
> >> I don't have hardware to test. If you are not working with
> >> 32-bit hardware I'd remove them.
> > When I add MIPS64 KVM support (Loongson-3 is MIPS64), MIPS32 KVM is
> > already there. On the kernel side, MIPS32 KVM is supported, but I
> > don't know whether it can work well.
>
> Well, from the history, you inherited from it:
>
> commit 1fa639e5618029e944ac68d27e32a99dcb85a349
> Author: James Hogan <jhogan@kernel.org>
> Date:   Sat Dec 21 15:53:06 2019 +0000
>
>     MAINTAINERS: Orphan MIPS KVM CPUs
>
>     I haven't been active for 18 months, and don't have the hardware
>     set up to test KVM for MIPS, so mark it as orphaned and remove
>     myself as maintainer. Hopefully somebody from MIPS can pick this up.
>
>
> commit 134f7f7da12aad99daafbeb2a7ba9dbc6bd40abc
> Author: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
> Date:   Mon Feb 24 12:50:58 2020 +0100
>
>     MAINTAINERS: Reactivate MIPS KVM CPUs
>
>     Reactivate MIPS KVM maintainership with a modest goal of keeping
>     the support alive, checking common KVM code changes against MIPS
>     functionality, etc. (hence the status "Odd Fixes"), with hope that
>     this component will be fully maintained at some further, but not
>     distant point in future.
>
>
> commit 15d983dee95edff1dc4c0bed71ce02fff877e766
> Author: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> Date:   Wed Jul 1 20:25:58 2020 +0200
>
>     MAINTAINERS: Adjust MIPS maintainership (Huacai Chen & Jiaxun Yang)
>
>     Huacai Chen and Jiaxun Yang step in as new energy [1].
>
>
> commit ca263c0fb9f33cc746e6e3d968b7db80072ecf86
> Author: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> Date:   Wed Oct 7 22:37:21 2020 +0200
>
>     MAINTAINERS: Remove myself
>
>     I have been working on project other than QEMU for some time,
>     and would like to devote myself to that project. It is impossible
>     for me to find enough time to perform maintainer's duties with
>     needed meticulousness and patience.
>
>
> QEMU deprecation process is quite slow, if we release mips-softmmu
> and mipsel-softmmu binaries with KVM support in 5.2, and you can not
> test them, you will still have to maintain them during 2021...
>
> If you don't have neither the hardware nor the time, I suggest you
> to only release it on 64-bit hosts. Personally I'd even only
> announce KVM supported on the little-endian binary only, because
> AFAIK you don't test big-endian KVM neither.
>
> Your call as a maintainer, but remember last RC tag is next
> Tuesday (Nov 24) in *4* days, then we release 5.2:
> https://wiki.qemu.org/Planning/5.2#Release_Schedule
>
> Regards,
>
> Phil.

