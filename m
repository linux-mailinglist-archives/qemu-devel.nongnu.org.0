Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8455B3EF550
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 23:56:11 +0200 (CEST)
Received: from localhost ([::1]:49008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG745-0004Rb-Td
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 17:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <srutherford@google.com>)
 id 1mG72p-0003l3-Ue
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 17:54:51 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:35824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <srutherford@google.com>)
 id 1mG72o-0000hW-5f
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 17:54:51 -0400
Received: by mail-il1-x130.google.com with SMTP id h29so73345ila.2
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 14:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6hDhPksNxyR4TcPdTSzYAamiTSiyDlI9TxfOng/Fc6A=;
 b=I/30yJpCzozkdrYlUv3IltB0unFSuxTmp9pBOvZekLWYygJEwBi8l84vfYI4Sj4E6+
 jlLIRwTNXyJMb5hXdAig9QX3QBraYEhqhAFaCv8Gg8XTrbB2zKY4ckVR0JwrwViQly0O
 m+RNE4/u+WJxQp71/OrtkW8twRgrR1RiOhix2CTOv4VgOI6BBWDYPAoXrELdcmGEULND
 JiNbTKwUWF8NuuRJ8gS3xSWr43Kjp8dkEUSJPanGjGhCJ8ys8nAcGocSOGf09BYgycDO
 cZlTOvv6A7jU3aVizCNfauwloxVJZvRRc84TrLtNIotIGmjNRlTcbk09W8FLDCnfQVlR
 dNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6hDhPksNxyR4TcPdTSzYAamiTSiyDlI9TxfOng/Fc6A=;
 b=pDuc1GiH/R4H8TtZc0D6ytvCzzAVYHa9+c+2a5X8CmmH4rpidxvx9NiCNgx6GeH1sw
 EJ7/1YuxtwOTgEMygwNa67ORNkv3DllHidlGpF6vbGCZwGC5AyOxPAiVlIRIENUJsuyd
 6WTXe3Jhr98yWOjmtC2rN2LOQB4iATIj5WumVVak71Sj6wdH/+aZ79vebmyCyyJmT4Dg
 mF9tR4laQTwSVKi+ux/n8xrNZK4g+7oT+t9kF3GwBB0z/XRXrjW+Ijo7hFXA0d8vEeNd
 Pt95+1NqDfbwLLGWcRUeB7USvIElrizZK/84/fColrp2GAx93lwWrFFUL/sVF0cihz1c
 Yi4A==
X-Gm-Message-State: AOAM532MjxIWuDKn/atQ4zKu4eznc/+neuoa7wEFwAX0Z7uKUKbpbnPW
 8FQyJlL5WY4TQsc8/UZjF82zFDWJthmYYZ9NXDD+Uw==
X-Google-Smtp-Source: ABdhPJwHOvXMyv6GRsxj3q3yeK+mab9ypJGKr5LiN8i8B2n95hYEaeBdjtkyPw5waFYCTiZ0LCTWJmJW5W2OAMWJ9a4=
X-Received: by 2002:a92:6a0d:: with SMTP id f13mr4102979ilc.212.1629237288724; 
 Tue, 17 Aug 2021 14:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
 <0fcfafde-a690-f53a-01fc-542054948bb2@redhat.com>
In-Reply-To: <0fcfafde-a690-f53a-01fc-542054948bb2@redhat.com>
From: Steve Rutherford <srutherford@google.com>
Date: Tue, 17 Aug 2021 14:54:12 -0700
Message-ID: <CABayD+d4dHBMbshx_gMUxaHkJZENYYRMrzatDtS-a1awGQKv2A@mail.gmail.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ashish Kalra <Ashish.Kalra@amd.com>, qemu-devel@nongnu.org,
 thomas.lendacky@amd.com, 
 brijesh.singh@amd.com, ehabkost@redhat.com, mst@redhat.com, 
 richard.henderson@linaro.org, jejb@linux.ibm.com, tobin@ibm.com, 
 dovmurik@linux.vnet.ibm.com, frankeh@us.ibm.com, dgilbert@redhat.com, 
 kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=srutherford@google.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Tue, Aug 17, 2021 at 9:32 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 17/08/21 01:53, Steve Rutherford wrote:
> > Separately, I'm a little weary of leaving the migration helper mapped
> > into the shared address space as writable.
>
> A related question here is what the API should be for how the migration
> helper sees the memory in both physical and virtual address.
>
> First of all, I would like the addresses passed to and from the
> migration helper to *not* be guest physical addresses (this is what I
> referred to as QEMU's ram_addr_t in other messages).  The reason is that
> some unmapped memory regions, such as virtio-mem hotplugged memory,
> would still have to be transferred and could be encrypted.  While the
> guest->host hypercall interface uses guest physical addresses to
> communicate which pages are encrypted, the host can do the
> GPA->ram_addr_t conversion and remember the encryption status of
> currently-unmapped regions.
>
> This poses a problem, in that the guest needs to prepare the page tables
> for the migration helper and those need to use the migration helper's
> physical address space.
>
> There's three possibilities for this:
>
> 1) the easy one: the bottom 4G of guest memory are mapped in the mirror
> VM 1:1.  The ram_addr_t-based addresses are shifted by either 4G or a
> huge value such as 2^42 (MAXPHYADDR - physical address reduction - 1).
> This even lets the migration helper reuse the OVMF runtime services
> memory map (but be careful about thread safety...).
If I understand what you are proposing, this would only work for
SEV/SEV-ES, since the RMP prevents these remapping games. This makes
me less enthusiastic about this (but I suspect that's why you call
this less future proof).
>
> 2) the more future-proof one.  Here, the migration helper tells QEMU
> which area to copy from the guest to the mirror VM, as a (main GPA,
> length, mirror GPA) tuple.  This could happen for example the first time
> the guest writes 1 to MSR_KVM_MIGRATION_CONTROL.  When migration starts,
> QEMU uses this information to issue KVM_SET_USER_MEMORY_REGION
> accordingly.  The page tables are built for this (usually very high)
> mirror GPA and the migration helper operates in a completely separate
> address space.  However, the backing memory would still be shared
> between the main and mirror VMs.  I am saying this is more future proof
> because we have more flexibility in setting up the physical address
> space of the mirror VM.
>
> 3) the paranoid one, which I think is what you hint at above: this is an
> extension of (2), where userspace invokes the PSP send/receive API to
> copy the small requested area of the main VM into the mirror VM.  The
> mirror VM code and data are completely separate from the main VM.  All
> that the mirror VM shares is the ram_addr_t data.  Though I am not even
> sure it is possible to use the send/receive API this way...
Moreso what I was hinting at was treating the MH's code and data as
firmware is treated, i.e. initialize it via LAUNCH_UPDATE_DATA.
Getting the guest to trust host supplied code (i.e. firmware) needs to
happen regardless.

>
> What do you think?

My intuition for this leans more on the host, but matches some of the
bits you've mentioned in (2)/(3). My intuition would be to put the
migration helper incredibly high in gPA space, so that it does not
collide with the rest of the guest (and can then stay in the same
place for a fairly long period of time without needing to poke a hole
in the guest). Then you can leave the ram_addr_t-based addresses
mapped normally (without the offsetting). All this together allows the
migration helper to be orthogonal to the normal guest and normal
firmware.

In this case, since the migration helper has a somewhat stable base
address, you can have a prebaked entry point and page tables
(determined at build time). The shared communication pages can come
from neighboring high-memory. The migration helper can support a
straightforward halt loop (or PIO loop, or whatever) where it reads
from a predefined page to find what work needs to be done (perhaps
with that page depending on which CPU it is, so you can support
multithreading of the migration helper). Additionally, having it high
in memory makes it quite easy to assess who owns which addresses: high
mem is under the purview of the migration helper and does not need to
be dirty tracked. Only "low" memory can and needs to be encrypted for
transport to the target side.

--Steve
>
> Paolo
>

