Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AF63EF5CA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 00:38:42 +0200 (CEST)
Received: from localhost ([::1]:49608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG7jF-0001kr-68
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 18:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mG7iT-00013d-PM
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 18:37:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mG7iQ-00041s-4g
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 18:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629239869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ud67t+V8KE9MuyGseGBuIWrgMVsL3BWFvN9kMjxMs9c=;
 b=fDgNUUqJtUn7X+tD8zNtpFaKKpla8+3CXZyK2GXFOzeZW4XH168w+0L0u6f3qiW1b3Y435
 Pdbdh7lRhJ+Av3MNmwacCruoFXkYYYqE2mSQFAxxz4pyiM3EKawybKssm3mGhKMDVVVMA+
 DS3dOdxh3PJ5/MYZPzBgQz4fBV8RSh4=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-_87YUxYjNWWBMFs9VDPNXA-1; Tue, 17 Aug 2021 18:37:46 -0400
X-MC-Unique: _87YUxYjNWWBMFs9VDPNXA-1
Received: by mail-pg1-f197.google.com with SMTP id
 1-20020a630e41000000b002528846c9f2so104350pgo.12
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 15:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ud67t+V8KE9MuyGseGBuIWrgMVsL3BWFvN9kMjxMs9c=;
 b=GymrkhH5wtat6swuTwfVbpHfLOj3Q5mjTQVK4yOu255tRy3iNvr9qSkzbz5FdlmUhh
 I9EA28A3FkeePpUI41xLgYlXvg87m6Mi5pgaHov7lebGUEEC8lFxEC/xTE3vyQsMXejv
 CtPyDvORcdSr5LNaPwkIb6t26ZFa8EJd+iTFll1mhJx+662xO8MuPPj2EL6goIes64t1
 5y9hF0ZyEkyRGWraE5WcM98WF8o68iJY2z8blFzLMSBs+Nnn839dsjvtwGmEs0uGykE9
 UGMr6WTxPYpinZUxa5mtBMwd4AsdLV7mH95xPRiRohnG/+HjpcQ1qvqIMhhzpO1yyrvr
 CldQ==
X-Gm-Message-State: AOAM533SHA2IuV8JhRfr8qr5O0zFLp5hMZ4TbV/S8EEt3/HPITvt+8pn
 BPpVRMXTP7zAtfT+vg9grduN22DpHKSIIwn1u5Tg2cZcQZS2UHvk8ZXt+L4q//fGDc+/+zR2QXo
 ZU8VQwQJs9PE9PPXkWwPS+Gtmg+NaJaI=
X-Received: by 2002:a17:90a:7d11:: with SMTP id
 g17mr5748568pjl.150.1629239865212; 
 Tue, 17 Aug 2021 15:37:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTku+Tm4Wt2F3MT9pxv3jSPWrXGEtk0whqu3ZBkk/d4FX3y3csXAmjv8kbrejRyGhVMB/oLNuF3ALAOuUVf0c=
X-Received: by 2002:a17:90a:7d11:: with SMTP id
 g17mr5748541pjl.150.1629239864959; 
 Tue, 17 Aug 2021 15:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
 <0fcfafde-a690-f53a-01fc-542054948bb2@redhat.com>
 <CABayD+d4dHBMbshx_gMUxaHkJZENYYRMrzatDtS-a1awGQKv2A@mail.gmail.com>
In-Reply-To: <CABayD+d4dHBMbshx_gMUxaHkJZENYYRMrzatDtS-a1awGQKv2A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 18 Aug 2021 00:37:32 +0200
Message-ID: <CABgObfZbyTxSO9ScE0RMK2vgyOam_REo+SgLA+-1XyP=8Vx+uQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: Steve Rutherford <srutherford@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Lendacky <thomas.lendacky@amd.com>,
 Ashish Kalra <Ashish.Kalra@amd.com>, Brijesh Singh <brijesh.singh@amd.com>,
 "Habkost, Eduardo" <ehabkost@redhat.com>, kvm <kvm@vger.kernel.org>,
 "S. Tsirkin, Michael" <mst@redhat.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, David Gilbert <dgilbert@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Dov Murik <dovmurik@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 17, 2021 at 11:54 PM Steve Rutherford
<srutherford@google.com> wrote:
> > 1) the easy one: the bottom 4G of guest memory are mapped in the mirror
> > VM 1:1.  The ram_addr_t-based addresses are shifted by either 4G or a
> > huge value such as 2^42 (MAXPHYADDR - physical address reduction - 1).
> > This even lets the migration helper reuse the OVMF runtime services
> > memory map (but be careful about thread safety...).
>
> If I understand what you are proposing, this would only work for
> SEV/SEV-ES, since the RMP prevents these remapping games. This makes
> me less enthusiastic about this (but I suspect that's why you call
> this less future proof).

I called it less future proof because it allows the migration helper
to rely more on OVMF details, but those may not apply in the future.

However you're right about SNP; the same page cannot be mapped twice
at different GPAs by a single ASID (which includes the VM and the
migration helper). :( That does throw a wrench in the idea of mapping
pages by ram_addr_t(*), and this applies to both schemes.

Migrating RAM in PCI BARs is a mess anyway for SNP, because PCI BARs
can be moved and every time they do the migration helper needs to wait
for validation to happen. :(

Paolo

(*) ram_addr_t is not a GPA; it is constant throughout the life of the
guest and independent of e.g. PCI BARs. Internally, when QEMU
retrieves the dirty page bitmap from KVM it stores the bits indexed by
ram_addr_t (shifted right by PAGE_SHIFT).

> > 2) the more future-proof one.  Here, the migration helper tells QEMU
> > which area to copy from the guest to the mirror VM, as a (main GPA,
> > length, mirror GPA) tuple.  This could happen for example the first time
> > the guest writes 1 to MSR_KVM_MIGRATION_CONTROL.  When migration starts,
> > QEMU uses this information to issue KVM_SET_USER_MEMORY_REGION
> > accordingly.  The page tables are built for this (usually very high)
> > mirror GPA and the migration helper operates in a completely separate
> > address space.  However, the backing memory would still be shared
> > between the main and mirror VMs.  I am saying this is more future proof
> > because we have more flexibility in setting up the physical address
> > space of the mirror VM.
>
> My intuition for this leans more on the host, but matches some of the
> bits you've mentioned in (2)/(3). My intuition would be to put the
> migration helper incredibly high in gPA space, so that it does not
> collide with the rest of the guest (and can then stay in the same
> place for a fairly long period of time without needing to poke a hole
> in the guest). Then you can leave the ram_addr_t-based addresses
> mapped normally (without the offsetting). All this together allows the
> migration helper to be orthogonal to the normal guest and normal
> firmware.
>
> In this case, since the migration helper has a somewhat stable base
> address, you can have a prebaked entry point and page tables
> (determined at build time). The shared communication pages can come
> from neighboring high-memory. The migration helper can support a
> straightforward halt loop (or PIO loop, or whatever) where it reads
> from a predefined page to find what work needs to be done (perhaps
> with that page depending on which CPU it is, so you can support
> multithreading of the migration helper). Additionally, having it high
> in memory makes it quite easy to assess who owns which addresses: high
> mem is under the purview of the migration helper and does not need to
> be dirty tracked. Only "low" memory can and needs to be encrypted for
> transport to the target side.
>
> --Steve
> >
> > Paolo
> >
>


