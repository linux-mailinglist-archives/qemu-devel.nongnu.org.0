Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427E652A7CF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 18:23:08 +0200 (CEST)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqzyV-0002Z4-7c
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 12:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dzejrou@gmail.com>) id 1nqzkk-00088t-B7
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:08:54 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:44639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dzejrou@gmail.com>) id 1nqzki-0008JY-EW
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:08:53 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id p139so12302226ybc.11
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 09:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V7+SLNcQ570TOoMzuGQdr/7lzAh9/O1M3xEm0MrRNbI=;
 b=JjJgMv3C6sii+OsVWcjop3a1c+5FZh1X8iccrJNDgWeccgIWFXUyZ9ZJbczSvFviGd
 7BaGAC361dK0JCpv5oIbMHct3uBdfF4rh0dCwFPbqkv6BGbeVFB6+ybkCdZ8vNE9s1gV
 7przAGjS0elpR6qK+He2TL59qWd4q/IciSgAF3aq/SprSAOLZ4B+yy+y2k3g8Ry+LFKV
 YDF7uEmtdeeds/B6K2K/pKuYoDRncP4w+X+0vwXFoxGm0kH0Sh2KmKEL78Q/1JDSw6Uk
 ULjmOtvjbdFujagf8egkeB9P2uFPMDvztp7VQ3Vex2c9KxNHMXN8v/zDvNhHrkpeYnYK
 zohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V7+SLNcQ570TOoMzuGQdr/7lzAh9/O1M3xEm0MrRNbI=;
 b=5qivzUFhiGkvgNn4/51wF5t6lhp3xjAO5fIHG/U8d2YhDccSalSY3PrcLJs+PwbTUm
 k0/CQxWWStX93+IhiRyMOJ45bQ6iLN06e9+ivFOluvFKgMWaaAuzwUUYBwLd1aa/PBQC
 PWxEM7ayE+PjPQoCxsG3XFXh24jD6O+oLGpjyY5FumttMYevO/LBM5kCJgGQAn4KKKcu
 o2f/Oxtg/TMAsMNuG4tQvuRupuoO7VUg9rTnutn1Q3RzBxzfJf3juQ4IxalfCptOcdIJ
 kBf0wnq8pzqZCIAbiKSeNAoSirTpuvuDJpr2MYepiHb9EPGZagkzsT20w7ncMUUwfKiC
 n5zw==
X-Gm-Message-State: AOAM533QZ6Pf2Ii5xd3i53ohXGNCcMnpoZcDKqoynjJjI3KMbx09S5h3
 t/J3Te63Rjs5e1yaUHjpUScO04Blw9uPG/s8Lnw=
X-Google-Smtp-Source: ABdhPJxTdnvNMr7wmDJU9eoIECQT7Rd+18Hrts1kNLE1mLwYmtqWedobevQhuNMwESUsqM2KunjPEhxTNTqv6qtOoMg=
X-Received: by 2002:a25:7804:0:b0:64b:332e:cd7b with SMTP id
 t4-20020a257804000000b0064b332ecd7bmr25169044ybc.323.1652803731014; Tue, 17
 May 2022 09:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220517123858.7933-1-dzejrou@gmail.com>
 <20220517171228.44c53748@redhat.com>
In-Reply-To: <20220517171228.44c53748@redhat.com>
From: =?UTF-8?Q?Jaroslav_Jindr=C3=A1k?= <dzejrou@gmail.com>
Date: Tue, 17 May 2022 17:44:07 +0200
Message-ID: <CAE-Qwfxr=qu-D4vMPdh=fgLVxGc7ipUZcqk4pk1xPWXtv0nLeQ@mail.gmail.com>
Subject: Re: [PATCH] hostmem: default the amount of prealloc-threads to
 smp-cpus
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, david@redhat.com, 
 Michal Privoznik <mprivozn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=dzejrou@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 May 2022 at 17:12, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Tue, 17 May 2022 14:38:58 +0200
> dzejrou@gmail.com wrote:
>
> > From: Jaroslav Jindrak <dzejrou@gmail.com>
> >
> > Prior to the introduction of the prealloc-threads property, the amount
> > of threads used to preallocate memory was derived from the value of
> > smp-cpus passed to qemu, the amount of physical cpus of the host
> > and a hardcoded maximum value. When the prealloc-threads property
> > was introduced, it included a default of 1 in backends/hostmem.c and
> > a default of smp-cpus using the sugar API for the property itself. The
> > latter default is not used when the property is not specified on qemu's
> > command line, so guests that were not adjusted for this change suddenly
> > started to use the default of 1 thread to preallocate memory, which
> > resulted in observable slowdowns in guest boots for guests with large
> > memory (e.g. when using libvirt <8.2.0 or managing guests manually).
>
> current behavior in QEMU is intentionally conservative. threads
> number is subject to host configuration and limitations management
> layer puts on it and it's not QEMU job to conjure magic numbers that
> are host/workload depended.
> If user needs more prealloc threads they need to specify it explicitly
> for each memory backend (i.e. convince management to do it or fix your
> scripts to so).

I understand that, but I'd say that a sudden change of the default to
1, which can
lead to guest boot slowdowns of about 2-8 times (and boots taking several
minutes) because of a change that was not very well documented (to the point
that it took libvirt about 2 years [0] to add support for this
property) does qualify
as a regression. After all, this patch does not conjure any new
numbers, but rather
restores the original behavior of qemu if the user does _not_ use the new
prealloc-threads property.

[0] https://github.com/libvirt/libvirt/commit/ba7f98126fa84d354ce72929b77cc111a9a557a9

> CCing Michal, as he recently looked into similar topic.
>
> To behave it the old way you need to use legacy -mem-prealloc option.
>
>
> > This commit restores the original behavior for these cases while not
> > impacting guests started with the prealloc-threads property in any way.
> >
> > Fixes: 220c1fd864e9d ("hostmem: introduce "prealloc-threads" property")
> > Signed-off-by: Jaroslav Jindrak <dzejrou@gmail.com>
> > ---
> >  backends/hostmem.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/backends/hostmem.c b/backends/hostmem.c
> > index a7bae3d713..624bb7ecd3 100644
> > --- a/backends/hostmem.c
> > +++ b/backends/hostmem.c
> > @@ -274,7 +274,7 @@ static void host_memory_backend_init(Object *obj)
> >      backend->merge = machine_mem_merge(machine);
> >      backend->dump = machine_dump_guest_core(machine);
> >      backend->reserve = true;
> > -    backend->prealloc_threads = 1;
> > +    backend->prealloc_threads = machine->smp.cpus;
> pls, do not add more dependencies to random external objects to memory backends.
>
> If you have to do that, use machine compat properties instead, but then
> the essence of the issue stays the same (user shall define optimal threads
> number and provide it to qemu explicitly)
>
> >  }
> >
> >  static void host_memory_backend_post_init(Object *obj)
>

