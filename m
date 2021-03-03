Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD04632B960
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 18:07:11 +0100 (CET)
Received: from localhost ([::1]:33500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHUxq-0000Xa-6B
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 12:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lHUw6-0006tR-UK
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:05:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lHUw3-0008Jm-7P
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614791117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8xcRUA5f9I+hK9wA1W7hghADIE2Tb70hM3rUW3I70V8=;
 b=fmXOMfBjcNhvuA/ztkXWx/CzsCREfzWvBksRq2LX6Uvfz0cRAqFxtSKGHEtz7/odga2Sw4
 2NewxnUgKyp1w6UfKnHzu1nqQ4luh3Z1Bnk/AUKyraEX7i8qkSOd6uDx2qCoWvIj940WM4
 seNzqPZCdmuRCBtyDymPMk5vrwhXJmg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-tu2ivam9Me6tEqAzvYjbCA-1; Wed, 03 Mar 2021 12:05:15 -0500
X-MC-Unique: tu2ivam9Me6tEqAzvYjbCA-1
Received: by mail-qt1-f200.google.com with SMTP id 4so13050098qtc.13
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 09:05:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8xcRUA5f9I+hK9wA1W7hghADIE2Tb70hM3rUW3I70V8=;
 b=mOV5rb1HIFEg4Zuj8uYSF2ElPkoGdQdP+jiJhRn9ggdjtfSQkTcd5EsrWtOqWVl3M0
 5Hc9fVOqe5YqQI6kuPT+2QtpIY44GheLq5E5gMyYYZsXUCGd4HTVsc48kTp74wiNUD3P
 k2T4biAxSQOOUSiqhdPz2iUnmq203HmIFwyLPvU7Gwr8HcXetsCtNt9skHWzIiTpC0RN
 YFlXPFMgTBf+5GW6EOxOmcBuCwskAcL5p+0CnDj5Ghin/l3hWMoKErcWJ1aya6w4e3Le
 kcI/nhxhkde2NgPPVUl7Ffe2qJCjo6QvQTGAn5H68roFLnK0s+r8namSCnbN33mUskFk
 wHUg==
X-Gm-Message-State: AOAM531nLkuJVnc89LMkiZvTfKV1r1qPoylctE/J1cbiVD3gMOx6b/9B
 6bwtufMAavzyTb8zdSFwc/m7eIT1A/KqbOzxoPBufZ9zNUvJKLv9rWoXyqHsmz6cj5elkhBI/Ca
 APT0CatUYVv3lqpo=
X-Received: by 2002:ac8:5154:: with SMTP id h20mr108582qtn.73.1614791114982;
 Wed, 03 Mar 2021 09:05:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGci3qTVHBtTI3xnVeZZDGJrpFJxtuf2+nySMdQeL9kbgOPWMDzQjluTsUs9e8xBRAULziUg==
X-Received: by 2002:ac8:5154:: with SMTP id h20mr108519qtn.73.1614791114565;
 Wed, 03 Mar 2021 09:05:14 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id s133sm16441144qke.1.2021.03.03.09.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 09:05:12 -0800 (PST)
Date: Wed, 3 Mar 2021 12:05:08 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 8/9] util/mmap-alloc: support RAM_NORESERVE via
 MAP_NORESERVE
Message-ID: <20210303170508.GT397383@xz-x1>
References: <20210209134939.13083-1-david@redhat.com>
 <20210209134939.13083-9-david@redhat.com>
 <20210302175112.GN397383@xz-x1>
 <522c672e-9c16-48ef-24a8-3687b5332b2a@redhat.com>
 <20210302214444.GQ397383@xz-x1>
 <bdc5819e-726a-ed68-6159-f8cfe219d8bc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bdc5819e-726a-ed68-6159-f8cfe219d8bc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 03, 2021 at 11:14:10AM +0100, David Hildenbrand wrote:
> On 02.03.21 22:44, Peter Xu wrote:
> > On Tue, Mar 02, 2021 at 08:01:11PM +0100, David Hildenbrand wrote:
> > > On 02.03.21 18:51, Peter Xu wrote:
> > > > On Tue, Feb 09, 2021 at 02:49:38PM +0100, David Hildenbrand wrote:
> > > > > +#define OVERCOMMIT_MEMORY_PATH "/proc/sys/vm/overcommit_memory"
> > > > > +static bool map_noreserve_effective(int fd, bool shared)
> > > > > +{
> > > > > +#if defined(__linux__)
> > > > > +    gchar *content = NULL;
> > > > > +    const char *endptr;
> > > > > +    unsigned int tmp;
> > > > > +
> > > > > +    /* hugetlbfs behaves differently */
> > > > > +    if (qemu_fd_getpagesize(fd) != qemu_real_host_page_size) {
> > > > > +        return true;
> > > > > +    }
> > > > > +
> > > > > +    /* only private shared mappings are accounted (ignoring /dev/zero) */
> > > > > +    if (fd != -1 && shared) {
> > > > > +        return true;
> > > > > +    }
> > 
> > [1]
> > 
> > > > > +
> > > > > +    if (g_file_get_contents(OVERCOMMIT_MEMORY_PATH, &content, NULL, NULL) &&
> > > > > +        !qemu_strtoui(content, &endptr, 0, &tmp) &&
> > > > > +        (!endptr || *endptr == '\n')) {
> > > > > +        if (tmp == 2) {
> > > > > +            error_report("Skipping reservation of swap space is not supported: "
> > > > > +                         " \"" OVERCOMMIT_MEMORY_PATH "\" is \"2\"");
> > > > > +            return false;
> > > > > +        }
> > > > > +        return true;
> > > > > +    }
> > > > > +    /* this interface has been around since Linux 2.6 */
> > > > > +    error_report("Skipping reservation of swap space is not supported: "
> > > > > +                 " Could not read: \"" OVERCOMMIT_MEMORY_PATH "\"");
> > > > > +    return false;
> > > > > +#else
> > > > > +    return true;
> > > > > +#endif
> > > > > +}
> > > > 
> > > > I feel like this helper wants to fail gracefully for some conditions.  Could
> > > > you elaborate one example and attach to the commit log?
> > > 
> > > Sure. The case is "/proc/sys/vm/overcommit_memory == 2" (never overcommit)
> > > 
> > > MAP_NORESERVE is without effect and sparse memory regions are somewhat
> > > impossible.
> > > 
> > > > 
> > > > I'm also wondering whether it would worth to check the global value.  Even if
> > > > overcommit is globally disabled, do we (as an application process) need to care
> > > > about it?  I think the MAP_NORESERVE would simply be silently ignored by the
> > > > kernel and that seems to be design of it, otherwise would all apps who uses > MAP_NORESERVE would need to do similar things too?
> > > 
> > > Right, I want to catch the "gets silently ignored" part, because someone
> > > requested "reserved=off" (!default) but does not actually get what he asked
> > > for.
> > > 
> > > As one example, glibc manages heaps via:
> > > 
> > > a) Creating a new heap: mmap(PROT_NONE, MAP_NORESERVE) the maximum size,
> > > then mprotect(PROT_READ|PROT_WRITE) the initial heap size. Even if
> > > MAP_NORESERVE is ignored, only !PROT_NONE memory ever gets committed
> > > ("reserve swap space") in Linux.
> > > 
> > > b) Growing the heap via mprotect(PROT_READ|PROT_WRITE) within the existing
> > > mmap. This will commit memory in case MAP_NORESERVE got ignored.
> > > 
> > > c) Shrinking the heap ("discard memory") via MADV_DONTNEED *unless*
> > > "/proc/sys/vm/overcommit_memory == 2" - the only way to undo
> > > mprotect(PROT_READ|PROT_WRITE) and to un-commit memory is by doing a
> > > mmap(PROT_NONE, MAP_FIXED) over the problematic region.
> > > 
> > > If you're interested, you can take a look at:
> > > 
> > > malloc/arena.c
> > > sysdeps/unix/sysv/linux/malloc-sysdep.h:check_may_shrink_heap()
> > 
> > Thanks for the context.  It's interesting to know libc has such special heap
> > operations.
> > 
> > Glibc shrinks heap to save memory for the no-over-commit case, however in our
> > case currently we'd like to fail some users using global_overcommit=2 but
> > reserve=off - it means even if we don't fail the user, mmap() could also fail
> > if it's overcommitted. Even if this mmap() didn't fail, it'll fail very easily
> > later on iiuc, right?
> 
> Here is the issue I want to catch.
> 
> Assume you create a VM with a virtio-mem device that can grow big in the
> future. You specify reserved=off. mmap() succeeds and you assume the very
> sparse memory region does not actually commit memory. But it commits all
> memory in the sparse mmap.
> 
> Assume you want to create another VM. It just fails although you still have
> plenty of free memory - because the previous MAP_NORESERVE got ignored.

Right.  So I think that's moving the failure earlier.  Again I am not sure how
much it would help but it should be slightly better than a latter failure.

> 
> I want to warn the user right away that the configuration is messed up and
> that "reserved=off" is not effective.
> 
> For anonymous memory, "reserved=off" will start really being useful when
> having a way to dynamically reserve swap space.
> 
> > 
> > I think it's fine to have that early failure, it just seems less helpful than
> > what glibc was doing which shrinks active memory for real, meanwhile there
> > seems to encode some very detailed OS information into this helper, so just
> > less charming.
> 
> It's not nice, but the messed-up Linux implementation is to blame. Just read
> the Linux man page of the mmap where there is an explicit link to
> "/proc/sys/vm/overcommit_memory" for this very reason.
> 
> > 
> > Btw above [1] "fd != -1 && shared" looks weird to me.
> 
> As we never have shared anonymous memory (and that's good, because it is
> super weird) in QEMU, we can simplify to
> 
> "if (shared) { return true; }"

Yes this looks easier to read.  Maybe you can assert the fd in the block too if
you are pretty sure of it.

> 
> > 
> > Firstly it'll bypass overcommit_memory==2 check and return true directly, is
> > that right?  I thought the global will be meaningful for all memories except
> > hugetlbfs (in do_mmap() of Linux).
> 
> See the description in the patch. On basically all (except anonymous shared)
> shared memory we don't ever reserve swap space.
> 
> See mmap_region():
> 
> if (accountable_mapping(file, vm_flags)) {
> 	charged = len >> PAGE_SHIFT;
> 	if (security_vm_enough_memory_mm(mm, charged))
> 		return -ENOMEM;
> 	vm_flags |= VM_ACCOUNT;
> }
> 
> whereby
> 
> accountable_mapping():
> 
> if (file && is_file_hugepages(file))
> 	return 0;
> return (vm_flags & (VM_NORESERVE | VM_SHARED | VM_WRITE)) == VM_WRITE;
> 
> 
> in do_mmap(), we only affect if VM_NORESERVE is set or not.
> 
> 
> And this makes perfect sense: Most* shared mappings don't need swap space
> because they can just be written back to the original backing storage
> (file). This is different to private mappings, which cannot be written back
> to the file - so we need swap space.
> 
> > 
> > Meanwhile, I don't see why file-backed share memories is so special too..  From
> 
> Just think about 100000 processes mapping the same file shared. Would you
> want to reserve 100000 the same swap space for the same file?
> 
> Although you never* ever really need swap space because you can just
> writeback to the file instead of swapping.
> 
> > your commit message, I'm not sure whether you wanted to return false instead,
> > however that's still not the case IIUC, since e.g. /dev/shmem still does
> > accounting iiuc, while MAP_NORESERVE will skip it.
> 
> *except /dev/shmem. It actually needs swap space because the actual file
> resides in tmpfs->RAM but Linux will never ever commit that memory.
> 
> Main reason is: because you don't know when/how much to commit.
> 
> a) When creating/truncating the file we don't know if it's going to be
>    sparse. So how much should we commit?
> b) When mapping the file, the same comment as above applies: you don't
>    want to reserve per-mapper but instead per-file.
> 
> You can create and map gigantic memfd/shmem files even with
> "/proc/sys/vm/overcommit_memory == 2", because we will never ever commit any
> of that memory. Yes, shmem is dangerous.
> 
> Shared mappings behave like always having MAP_NORESERVE, thus the "return
> true;"
> 
> It's interesting that you also raise this point: I also want to propose
> dynamic reservation of swap space for shmem in the future. Instead of being
> per process, this would have to be per file and similar allow to coordinate
> with the kernel how much memory we are actually intending to use (->commit)
> such that the kernel can properly account and reject if it wouldn't be
> possible. If only a single day would have more than 24 hours :)

Thanks, all you said looks sane.

I can't say I fully understand what you'd like to propose.  To me, a sane user
of /dev/shm should really fallocate() on that before using, but I could also be
wrong.

Another trivial suggestion is you can also add these function pointers into the
comment of the helper, e.g., accountable_mapping() as you referenced.  So it
would be easier for people to understand where these code came from.

-- 
Peter Xu


