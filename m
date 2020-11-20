Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458342BAC56
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:02:49 +0100 (CET)
Received: from localhost ([::1]:34696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg7vz-0000YH-SB
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kg7us-00081X-TQ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:01:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kg7ul-0002hd-WC
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:01:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605884490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3iBVvioUepP9Pk2ZM9muYaTPWase6TMnM+RHsRNEWKo=;
 b=Nm5VQ3w/2aqItVJHamG+L8dGejrj8vFOnlsBBlFTGK52f4mJFB0qMnn+TH2vHbv820wRfe
 sxnDxYkTzTnknDDpisOtci+8dPHSHEb6MTSMuMTfZ+CuOIrCcGvF3wmbZ0Dbs6Dqw8tJK0
 SADWGO1TkHDhkd9bHQaBMexjFNE/uQc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-hIPRoQpSMJ64-0775dnzdw-1; Fri, 20 Nov 2020 10:01:27 -0500
X-MC-Unique: hIPRoQpSMJ64-0775dnzdw-1
Received: by mail-qt1-f197.google.com with SMTP id r29so7495753qtu.21
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 07:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3iBVvioUepP9Pk2ZM9muYaTPWase6TMnM+RHsRNEWKo=;
 b=Le7Law11ppHDdPT7KlD21NQXj+fTxzw+cz1sXIP2ii/8XTd84uv9mRuXYseatZdhTq
 X/CrYruC6EN38U+Nski3lutUcpH77XnHkLFCffGGbH8tFbZusQ1kEuL5UhaCgZorErbU
 zeih0e/bnv9YklnKVM3HMpEmkklwnZ6IXVDTKsrOPFF8Wna3a0aWYq0+mnN9dUdEMTes
 iPUMD7eotZlET5JG80fWr8QUOhSVuPoiBckYE0yleNGtKikcc4hm6hTvX8yMb6dV1eLR
 GaU8Dfu8CdbZLKOUbQAXN2Vdx2nHDSJRP9na88osACXHf4cWSLtz1u1My1aFk65AYk1z
 nH8A==
X-Gm-Message-State: AOAM531M5Zk0NZRJivBobFXlRDtQ76JUrdHE5z0iYHSD0AceNfe4BeNg
 3dHM03PEB1diDCxVwLdGPwbpTN/UMTO/Vkha4PfGo8oETbjShoNMr/T5jDT0JsT6r5Yd408hptl
 ONfOSQ7EHTJbxSPo=
X-Received: by 2002:a37:4796:: with SMTP id
 u144mr16778581qka.235.1605884486993; 
 Fri, 20 Nov 2020 07:01:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1PRF/GFPkqisAx566nrgm/kHZrXKhC6usKqUmijyMCu8fgk/YPgu22BnZvd4zkZ71KeywFQ==
X-Received: by 2002:a37:4796:: with SMTP id
 u144mr16778529qka.235.1605884486578; 
 Fri, 20 Nov 2020 07:01:26 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-196.dsl.bell.ca. [174.93.89.196])
 by smtp.gmail.com with ESMTPSA id h5sm1985537qtp.66.2020.11.20.07.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:01:25 -0800 (PST)
Date: Fri, 20 Nov 2020 10:01:24 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v3 2/7] introduce UFFD-WP low-level interface helpers
Message-ID: <20201120150124.GD32525@xz-x1>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-3-andrey.gruzdev@virtuozzo.com>
 <20201119183902.GC6538@xz-x1>
 <8eb862a9-90d3-e3ea-5bdf-50287ce2226f@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <8eb862a9-90d3-e3ea-5bdf-50287ce2226f@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 02:04:46PM +0300, Andrey Gruzdev wrote:
> > > +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
> > > +        /* Nothing to do with read-only and MMIO-writable regions */
> > > +        if (bs->mr->readonly || bs->mr->rom_device) {
> > > +            continue;
> > > +        }
> > > +
> > > +        /* Register block memory with UFFD to track writes */
> > > +        if (uffd_register_memory(rs->uffdio_fd, (hwaddr) bs->host,
> > > +                bs->max_length, false, true)) {
> > > +            goto fail;
> > > +        }
> > > +        /* Apply UFFD write protection to the block memory range */
> > > +        if (uffd_protect_memory(rs->uffdio_fd, (hwaddr) bs->host,
> > > +                bs->max_length, true)) {
> > 
> > Here logically we need to undo the previous register first, however userfaultfd
> > will auto-clean these when close(fd), so it's ok.  However still better to
> > unwind the protection of pages, I think.  So...
> > 
> 
> It should auto-clean, but as an additional safety measure - yes.

I'm afraid it will only clean up the registers, but not the page table updates;
at least that should be what we do now in the kernel. I'm not sure whether we
should always force the kernel to unprotect those when close(). The problem is
the registered range is normally quite large while the wr-protect range can be
very small (page-based), so that could take a lot of time, which can be
unnecessary, since the userspace is the one that knows the best on which range
was protected.

Indeed I can't think if anything really bad even if not unprotect the pages as
you do right now - what will happen is that the wr-protected pages will have
UFFD_WP set and PAGE_RW cleared in the page tables even after the close(fd).
It means after the snapshot got cancelled those wr-protected pages could still
trigger page fault again when being written, though since it's not covered by
uffd-wp protected vmas, it'll become a "normal cow" fault, and the write bit
will be recovered.  However the UFFD_WP bit in the page tables could got
leftover there...  So maybe it's still best to unprotect from userspace.

There's an idea that maybe we can auto-remove the UFFD_WP bit in kernel when
cow happens for a page, but that's definitely out of topic (and we must make
sure things like "enforced cow for read-only get_user_pages() won't happen
again").  No hard to do that in userspace, anyways.

-- 
Peter Xu


