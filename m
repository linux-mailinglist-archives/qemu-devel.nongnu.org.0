Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818E84010ED
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 18:51:47 +0200 (CEST)
Received: from localhost ([::1]:54366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMvMw-0008HD-3H
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 12:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMvLD-0006mx-0B
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 12:49:59 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:33443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMvLB-0005Jo-DU
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 12:49:58 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id e133so8740962ybh.0
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 09:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=768Hl5CrEQIrwzTr4lENDK904gEb5WLM/aGOqDivBYI=;
 b=I/C7M+eC4IizuOpdu01AzfJdKoXhcSZOl4eKxdhh1Z1HNQLUKQEK9vrbNpPlgHlKDg
 Ay9Grg23O9Oge+iGqbCVHFVp6UOU5BIvNc99Yt18zjU2BOHZcRRuC3Jbot1GUcehmvR6
 iUoGnAdUKGSNOcSm7YphTHNS38h1AuW33o5qdwZKllAMTJYM0Wxc4oUPuXcat66xftuw
 f2pn7qIsgHcLs+aX9266URVq0+hZEmHwSraCDQLuUz5JcHUG0ozGupVpUvfasiDlTYuR
 LI040Lhaz7ULJjyYkUSCdKEsZd+Gk50VkldheH7Wib40L8LJndfZGvv4QUzw4oLp0AEV
 +Wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=768Hl5CrEQIrwzTr4lENDK904gEb5WLM/aGOqDivBYI=;
 b=cHYIcmhHJGaEU9Vc3mcer4oluIRz3zfdseevsEw7r2WT8cMtbKKr2bUmghtS0Gx2ex
 So+SZ+EkAfcJK1V7OXkynPKPlIpT43P87+SBgrctYX/OmkzJ5+M/9mWrhcdd8xQylEPH
 JGEgxlKGVLbvfUdv+M9TP31gCr13oXy8bxI8j6JyrYvU3ZbWDGXasEvn8gTqVsD8IG+A
 +RxltPu3ZzrbglmUPfQD9amzoOpdoMcH9ITzNinkDTEP9HAJuB4LO84YXXQNfFjcjMdd
 QsQxKvxukzYeZewRD5cswHR/viBQJmTLSb1lKPkWQ9XchrHPQWFTNgoW3qHXbUU746Z7
 9img==
X-Gm-Message-State: AOAM533NvwcBDtOqYSqNNWB+fU2OzinjSTJ9HhxiYE1Z6VPqJrOjU0vs
 y73yL6hpY19zkAU2wjCia4g2x8Qyxwo2oIBHZ5U=
X-Google-Smtp-Source: ABdhPJxgUjBmcBDibdvgo/Uvnp5EdSK2J8sZaQwnmyNsOMeP9keXR4kpek3Qyr5mppg9z74VF5HMTO9ZNGbE1RwY46w=
X-Received: by 2002:a25:76c7:: with SMTP id
 r190mr11633039ybc.467.1630860596538; 
 Sun, 05 Sep 2021 09:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210905154049.7992-1-bmeng.cn@gmail.com>
 <CAFEAcA8frUy2wmQjj=Bk_GGT9O=qHzb5pjSFupc7SaEyDUvYZg@mail.gmail.com>
In-Reply-To: <CAFEAcA8frUy2wmQjj=Bk_GGT9O=qHzb5pjSFupc7SaEyDUvYZg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 6 Sep 2021 00:49:45 +0800
Message-ID: <CAEUhbmVjuYhk=Ebh6VeaPtC816Dssys3g8+dwMo5rv4yHMeHSg@mail.gmail.com>
Subject: Re: [PATCH] softmmu/memory: Validate {read,
 write}_with_attrs before calling
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 6, 2021 at 12:29 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 5 Sept 2021 at 16:40, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > {read,write}_with_attrs might be missing, and the codes currently do
> > not validate them before calling, which will cause segment fault.
> >
> > Fixes: 62a0db942dec ("memory: Remove old_mmio accessors")
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> This 'fixes' tag doesn't seem quite right. Before that
> commit 62a0db942dec, we still required that a MemoryRegionOps
> provided some form of both read and write.

Did you mean before commit 62a0db942dec leaving MemoryRegionOps NULL
was not allowed, but things changed so that now it's possible to have
NULL MemoryRegionOps? If yes, then the commit id of "Fixes" should
probably go to the changes that allowed NULL memory ops. If not, I
don't think "Fixes" tag is wrong.

> It was never
> valid to leave all of the possible read function pointers NULL.
>
> What are the examples of devices which are deliberately leaving
> these pointers set to NULL?

No in-tree real examples. I just read the codes and found no
protection against the {read,write}_with_attrs ops.

> Last time this came up, we discussed the other option, which
> is to have memory_region_init assert that the MemoryRegionOps
> defines at least one valid read and one valid write pointer,
> so that these bugs get caught quickly rather than only if the
> guest accesses the device in the wrong way. I tend to think
> that that is better, because for any particular device
> it's not necessarily the right thing to return MEMTX_ERROR
> (maybe the right behaviour is "return 0 for reads, ignore
> writes" -- the point is that there is no single default
> behaviour that works for every device and architecture).
> Forcing the device model author to explicitly write the
> code means they have to think about what the behaviour
> they want is.

Yes, either way can prevent the NULL dereferencing. So it's time to
revisit this topic :)

>
> If we do choose to support allowing MemoryRegionOps structs
> to leave all the pointers NULL, we should document that,
> including what the default behaviour is.

Regards,
Bin

