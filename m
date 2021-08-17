Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4893EEF96
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 17:53:35 +0200 (CEST)
Received: from localhost ([::1]:51248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG1PC-0004yw-Ao
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 11:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG1OB-0004Av-8g
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:52:31 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:36522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG1O9-0002F3-H2
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:52:31 -0400
Received: by mail-ej1-x636.google.com with SMTP id bt14so23782935ejb.3
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 08:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=M9CziZiTayBgxdgUPy2ynACQ3nWAdrvfQB/9sSECSUk=;
 b=Yj3Q5BY3fl/YKMw2xNI0WQXYUG+t/HXAWcUgvQzxxJXhL+n6qYl8u5GWbWY2vIf0Ul
 SOAFqTo+M46DQq/DAQ69liPB7M6xvrkMIM+/owYHgcsqrfovgKXPt0qyzk5Z7QV35HYI
 u1r3IYqJHoHZzPhWl2J7+eUbtU7ZuAld8Cu+try5FNtJ8fYhNfUT5auEN12+ld8n3u49
 bHUByFbcfSu2YLDaHS3v6OGVW0xIM3jvRPDP1Kd/O+hOUHcFwee9MlaqiwAsIHM/2oiQ
 hd7STLOz6fEGuHLFUNA3sAMNb+SaOm63BIFv3UJMcDRgg9vpjJFow6D767T1JFCdclem
 MYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=M9CziZiTayBgxdgUPy2ynACQ3nWAdrvfQB/9sSECSUk=;
 b=Q2tkjA/Egfg7umvSUk5PFSgiwOW/Sttda2JRCJxyGWtME2aNrD16msDkfOpiadFADa
 KSirVCOs0xhqmCs3G97t0+CWLDxX0CYB1bHPTZ0bSE3GJTqrqRr6rpJacgjra+6jmZP7
 PKvnwm5rRAJh9BfjD1+pq4mVNpws2smsCkNF30Z5hTsDglN1+jaPV0+m2/EFg7JqAHY0
 HEqDuApPtzpSzoYTjYLm6vumv9XtNPH1Vai/S978WBwQC0oGggAhNx1JU6UlcITgcsJH
 B+ZmMagYcqpLYE+oNBKStHmOAMpqco/E6OMEGZYfIY7zQ3ophTwM5LF0E3JJVisNg9EE
 qUmQ==
X-Gm-Message-State: AOAM530E5KNT5SECOp1wTOTGB/7QyYrtqsJS5xDgfvbgtmIl8tfyjhZj
 YOaNql+vdyUdwnS5qXUy0LBCSMw6S6jlGZvC22dUEw==
X-Google-Smtp-Source: ABdhPJwxZYG9VoJb5zkYo2lzFBA+2OmVIFQVEy2B9GIUGWmwy6PEkv7MGH7xsGT0yhXIcV9NuYN8tr+17s/YIhgcyvc=
X-Received: by 2002:a17:906:e8d:: with SMTP id
 p13mr4807311ejf.85.1629215547712; 
 Tue, 17 Aug 2021 08:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210805092350.31195-1-david@redhat.com> <YRrP+tDsIyL3MaWO@t490s>
 <8812f9e2-3b3e-1bc9-2953-107e4c82880b@redhat.com>
In-Reply-To: <8812f9e2-3b3e-1bc9-2953-107e4c82880b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Aug 2021 16:51:41 +0100
Message-ID: <CAFEAcA_su3QgMvfRR823S3h0S+xFzuECcAyf=R5PHjhdTf=JSg@mail.gmail.com>
Subject: Re: [PATCH-for-6.1 v2] softmmu/physmem: fix wrong assertion in
 qemu_ram_alloc_internal()
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Aug 2021 at 08:14, David Hildenbrand <david@redhat.com> wrote:
>
> On 16.08.21 22:52, Peter Xu wrote:
> > On Thu, Aug 05, 2021 at 11:23:50AM +0200, David Hildenbrand wrote:
> >> When adding RAM_NORESERVE, we forgot to remove the old assertion when
> >> adding the updated one, most probably when reworking the patches or
> >> rebasing. We can easily crash QEMU by adding
> >>    -object memory-backend-ram,id=3Dmem0,size=3D500G,reserve=3Doff
> >> to the QEMU cmdline:
> >>    qemu-system-x86_64: ../softmmu/physmem.c:2146: qemu_ram_alloc_inter=
nal:
> >>    Assertion `(ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLO=
C))
> >>    =3D=3D 0' failed.
> >>
> >> Fix it by removing the old assertion.
> >>
> >> Fixes: 8dbe22c6868b ("memory: Introduce RAM_NORESERVE and wire it up i=
n qemu_ram_mmap()")
> >> Reviewed-by: Peter Xu <peterx@redhat.com>
> >> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> Cc: Paolo Bonzini <pbonzini@redhat.com>
> >> Cc: Peter Xu <peterx@redhat.com>
> >> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> Signed-off-by: David Hildenbrand <david@redhat.com>
> >> ---
> >>
> >> v1 -> v2:
> >> - Added rbs
> >> - Tagged for 6.1 inclusion
> >>
> >> ---
> >>   softmmu/physmem.c | 1 -
> >>   1 file changed, 1 deletion(-)
> >>
> >> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> >> index 3c1912a1a0..2e18947598 100644
> >> --- a/softmmu/physmem.c
> >> +++ b/softmmu/physmem.c
> >> @@ -2143,7 +2143,6 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t siz=
e, ram_addr_t max_size,
> >>       RAMBlock *new_block;
> >>       Error *local_err =3D NULL;
> >>
> >> -    assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC)=
) =3D=3D 0);
> >>       assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC=
 |
> >>                             RAM_NORESERVE)) =3D=3D 0);
> >>       assert(!host ^ (ram_flags & RAM_PREALLOC));
> >> --
> >> 2.31.1
> >>
> >
> > Today I just noticed this patch is still missing for 6.1. How many user=
s are
> > there with reserve=3Doff?  Would it be worth rc4 or not?
> >
>
> Indeed, I forgot to follow up, thanks for bringing this up.
>
> Libvirt does not support virtio-mem yet and consequently doesn't support
> reserve=3Doff yet. (there are use cases without virtio-mem, but I don't
> think anybody is using it yet)
>
> It's an easy way to crash QEMU, but we could also fix in the -stable
> tree instead.

It is a really obvious right fix, though, so I'm going to apply
it for rc4 anyway.

thanks
-- PMM

