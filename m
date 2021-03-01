Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B8D328619
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 18:04:04 +0100 (CET)
Received: from localhost ([::1]:38686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGlxj-0007Ss-9t
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 12:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@cloud.ionos.com>)
 id 1lGlgD-0002y5-Ua
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:45:57 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:39118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@cloud.ionos.com>)
 id 1lGlgB-0006C4-NI
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:45:57 -0500
Received: by mail-lj1-x229.google.com with SMTP id u4so20217497ljh.6
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 08:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=epwhuvzJqthXYztTTlYNcztCNpxiGJcELnCl5JuU+Ak=;
 b=evTXz1LPdMuvI3Kg3cxJrhWFXXGlr9l8/VkS0I1GzTzEJzPaL5sso9GlDgVFAcJaF9
 EGfBqG8IiLOwHcHVC0U5UDkcmn9+1e1cLd2cyInJnHuZPHnmoNx4tiuaROU6a1FtLXK/
 RPRTKXkZbL7Ue4J1qIwq+VXyOonzhuFM+0BrzZGySjSqBSYLzLzOvW6AWt+KXJF/Gw5Y
 aHmqTATUxVvbMyCI9GMoRLFEAHprC3hAVsHkKbQQVnQ4ijxIHtixQjyvcHabQXxOnsT6
 EJMapw10T1ZaulM3BVIU4x3E09dFSU9BIaLl+GAThpv7LNhv8782Adrx47gvUZV6DyYW
 oT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=epwhuvzJqthXYztTTlYNcztCNpxiGJcELnCl5JuU+Ak=;
 b=gviTAFbtMuBxw1Ap2I8ZTwIGm6tUFvTnrjvMnWO9kxkY7/SkTSiFmt/muUCUipRG1I
 j9eAQQAPEgQvSZOC2moFx8efGj922tacAohpK8HO2wZDdbhtvL3rAhUSWoDav2uZ/aJD
 NRzeoiuYQx9GkijqyKyLoILZvpLkx6ERBqcBQ2dUfLnOwf4iubRSntWBw40cFzeQCcVm
 /+aKMIMsS8JamJkFsKjSvzgsLvMdi8nGiF0S9A51MTAh8U1Td2eoMsgiY5fNxDqJWEeT
 S/QxMJBkYcSOgIe9jJyTrRVDyKfu/rkQ5V0V+qQHQgFyThH2zUvI3hI/smdrHF1V4FIi
 W6qQ==
X-Gm-Message-State: AOAM531+uKLZkOl8U0ehYD8B7QWarui3jGGDyYHjkTNDr7MKsSphnLhf
 9cxt6TERak+8IcMhfOKRt72IturRzhDVETsNIjIBYw==
X-Google-Smtp-Source: ABdhPJxl9EZiwMombNuKx1pSPmovZ0zVUwUwLZqPvlZql4fNm0omU2YphGeErb304vvLoz4tKhkzZnMFDJz83dIIxM8=
X-Received: by 2002:a05:651c:110b:: with SMTP id
 d11mr9286567ljo.334.1614617152845; 
 Mon, 01 Mar 2021 08:45:52 -0800 (PST)
MIME-Version: 1.0
References: <161290460478.11352.8933244555799318236.stgit@bmoger-ubuntu>
 <CAM9Jb+hOeKrQ1QxZm5zB1LioMNuyzzTObM8XL+zatqP7KdESWA@mail.gmail.com>
 <d2f234a5-e753-5a4e-97db-21bd0a0a69eb@amd.com>
 <CAM9Jb+hESq1yEbPcMWhJTVWoUK-es168bHoOayQ_N1vh3tdRRQ@mail.gmail.com>
 <cd9a84a3-f151-fa00-0b34-2652824bbbfc@amd.com>
 <CAM9Jb+jWfW5yFMy5b9fGXr9Hk4TUv5roOQGEm5C+BSR89e9C_g@mail.gmail.com>
In-Reply-To: <CAM9Jb+jWfW5yFMy5b9fGXr9Hk4TUv5roOQGEm5C+BSR89e9C_g@mail.gmail.com>
From: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
Date: Mon, 1 Mar 2021 17:45:41 +0100
Message-ID: <CALzYo33ACktZcsQ2u=Q2=6drtKDvZYhBOhXXRhDDZRoh7WWu3A@mail.gmail.com>
Subject: Re: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
 processors
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=pankaj.gupta@cloud.ionos.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 01 Mar 2021 12:01:58 -0500
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
Cc: Qemu Developers <qemu-devel@nongnu.org>, Babu Moger <babu.moger@amd.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Babu,

I tried to test below patch for AMD EPYC Rome CPU and I got below error [1]:

Also, I noticed SSBD CPU flag for guest was still available even
without this patch,
I noticed that for the guest, AMD_SSBD not got set.

Guest:
0x80000008 0x00: eax=0x00003028 ebx=0x00009205 ecx=0x00002003 edx=0x00000000

[1]
[    0.008000] unchecked MSR access error: WRMSR to 0x48 (tried to
write 0x0000000000000000) at rIP: 0xffffffff9245c9e4
(native_write_msr+0x4/0x20)
[    0.008000]  [<ffffffff9243a6c5>] ? x86_spec_ctrl_setup_ap+0x35/0x50
[    0.008000]  [<ffffffff92439423>] ? identify_secondary_cpu+0x53/0x80
[    0.008000]  [<ffffffff9244adfa>] ? start_secondary+0x6a/0x1b0

0.011970] unchecked MSR access error: RDMSR from 0x48 at rIP:
0xffffffff9245c772 (native_read_msr+0x2/0x40)

Thanks,
Pankaj

> > It is normally added as v2 for compatibility. Like this.
>
> o.k. Thanks!
> I will test this tomorrow.
>
> >
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 24db7ed892..f721d0db78 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -4179,6 +4179,20 @@ static X86CPUDefinition builtin_x86_defs[] = {
> >          .xlevel = 0x8000001E,
> >          .model_id = "AMD EPYC-Rome Processor",
> >          .cache_info = &epyc_rome_cache_info,
> > +        .versions = (X86CPUVersionDefinition[]) {
> > +            { .version = 1 },
> > +            {
> > +                .version = 2,
> > +                .props = (PropValue[]) {
> > +                    { "ibrs", "on" },
> > +                    { "amd-ssbd", "on" },
> > +                    { "model-id",
> > +                      "AMD EPYC-Rome Processor" },
> > +                    { /* end of list */ }
> > +                }
> > +            },
> > +            { /* end of list */ }
> > +        }
> >      },
> >      {
> >          .name = "EPYC-Milan",

