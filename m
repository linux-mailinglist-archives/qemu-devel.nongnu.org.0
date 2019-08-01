Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 250067D6CB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 09:59:42 +0200 (CEST)
Received: from localhost ([::1]:46268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ht5zx-00009D-D5
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 03:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46805)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <renyime@gmail.com>) id 1ht5zR-0008Bz-KF
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 03:59:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <renyime@gmail.com>) id 1ht5zP-0001R4-KI
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 03:59:09 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:33823)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <renyime@gmail.com>) id 1ht5zP-0001Qd-D9
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 03:59:07 -0400
Received: by mail-io1-xd41.google.com with SMTP id k8so142379583iot.1
 for <qemu-devel@nongnu.org>; Thu, 01 Aug 2019 00:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cg8fH4RIF/aZJFygqWL95AJmuiUNRtflIGts9ZC7NOI=;
 b=mbfHWNf9TA//bela2oe0gBck4NnYsseQWIA2dmFr2Ki07dEeyz/jIg3OChsb6f5EHC
 lF9JXEkhEjA4bR9iUKH4wFnlMvvwTeH8e3F6G4jcfkfj1hChKS34WGbPpFffeaKtDDcX
 xti/uD3vIVE4pbQnTuizNI7lGNaT8AKFLsIDs4L3/TCx3eV6VnzUjtVzJ9aRF0cYVzsZ
 Ey//nINIapUdOnnjgcxA2vvRXeU19XA5VDafJE/TkpGOAPIifwI3BwZlemErKNYcR6sA
 dvWl3DSsp8khkGTLUuTjDhWO6SqilhEgckQVEOz1u0TW1Ss5oJ/K8Bv7zEQ4386kbOIL
 CABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cg8fH4RIF/aZJFygqWL95AJmuiUNRtflIGts9ZC7NOI=;
 b=Ux2bowGHOMj5OhYtiaXTtnVWdHCkkez3w3kRYTIIKj/Wfgt5s14BH7/HJ6bvRj9dzl
 NUh6W5efm24yX0PyV58SotGGogtbcyVEOvhNorrw+0XFfMcZx1o72DIUcdGgGVISurKP
 ZYshLhlURxW9Vjke6l/79LgAEnxaGm4Cykf1FEjEtVNaSIEaMIE7qYRCym/BW78KILu5
 AJu3RgeOT9Ii8K3qExjtGnN/zf9ruKN2AdN06dWpk1UOrM33c3zXMb92q5nqUOUX71kO
 Xn4ygxgQPwkKF0jkKbq2IytO8WVwBU+reGz22jhbU+qVqPnzvPd5/kxmn5I+2CZnRTQm
 P3/w==
X-Gm-Message-State: APjAAAXjDgB/FSNnqUkXnclDQzUTe1BvogWozlPQhs629K0cp/yk797I
 PX9fe5KZiUCvGhcmLrhf9sKSUG3BhUFk2NL66Fg=
X-Google-Smtp-Source: APXvYqycsbJkvt8IR7aeUAcHTi6yuAVNcwtJAGb8bfEKC+H9oIRdxG816zh23uM2fv8RODGp5Rp2af6wEcu142uI02A=
X-Received: by 2002:a05:6638:63a:: with SMTP id
 h26mr54549855jar.92.1564646345877; 
 Thu, 01 Aug 2019 00:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <1563115879-2715-1-git-send-email-ivanren@tencent.com>
 <20190801025535.GB21992@richard>
In-Reply-To: <20190801025535.GB21992@richard>
From: Ivan Ren <renyime@gmail.com>
Date: Thu, 1 Aug 2019 15:58:54 +0800
Message-ID: <CA+6E1=nmUtP9B4veF-wwSObuu_vM8byB=ub9E77h3Y5xwca6Hw@mail.gmail.com>
To: Wei Yang <richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH] migration: always initial RAMBlock.bmap to
 1 for new migration
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>-             * Here we didn't set RAMBlock.bmap simply because it is
already
>>-             * set in ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION] in
>>-             * ram_block_add, and that's where we'll sync the dirty
bitmaps.
>>-             * Here setting RAMBlock.bmap would be fine too but not
necessary.
>>+             * Here we set RAMBlock.bmap all to 1 because when rebegin a
>>+             * new migration after a failed migration, ram_list.
>
>It is after failure or cancel?

Here we can treat cancel as a special fail.

Thanks.

On Thu, Aug 1, 2019 at 10:56 AM Wei Yang <richardw.yang@linux.intel.com>
wrote:

> Thanks, I didn't notice this case.
>
> On Sun, Jul 14, 2019 at 10:51:19PM +0800, Ivan Ren wrote:
> >Reproduce the problem:
> >migrate
> >migrate_cancel
> >migrate
> >
> >Error happen for memory migration
> >
> >The reason as follows:
> >1. qemu start, ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION] all set to
> >   1 by a series of cpu_physical_memory_set_dirty_range
> >2. migration start:ram_init_bitmaps
> >   - memory_global_dirty_log_start: begin log diry
>
> s/diry/dirty/
>
> >   - memory_global_dirty_log_sync: sync dirty bitmap to
> >     ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION]
> >   - migration_bitmap_sync_range: sync ram_list.
> >     dirty_memory[DIRTY_MEMORY_MIGRATION] to RAMBlock.bmap
> >     and ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION] is set to zero
> >3. migration data...
> >4. migrate_cancel, will stop log dirty
> >5. migration start:ram_init_bitmaps
> >   - memory_global_dirty_log_start: begin log diry
>
> same as above
>
> >   - memory_global_dirty_log_sync: sync dirty bitmap to
> >     ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION]
> >   - migration_bitmap_sync_range: sync ram_list.
> >     dirty_memory[DIRTY_MEMORY_MIGRATION] to RAMBlock.bmap
> >     and ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION] is set to zero
> >
> >   Here RAMBlock.bmap only have new logged dirty pages, don't contain
> >   the whole guest pages.
> >
> >Signed-off-by: Ivan Ren <ivanren@tencent.com>
> >---
> > migration/ram.c | 15 ++++++++-------
> > 1 file changed, 8 insertions(+), 7 deletions(-)
> >
> >diff --git a/migration/ram.c b/migration/ram.c
> >index 908517fc2b..bbebaee0c1 100644
> >--- a/migration/ram.c
> >+++ b/migration/ram.c
> >@@ -3173,11 +3173,11 @@ static int ram_state_init(RAMState **rsp)
> >     QSIMPLEQ_INIT(&(*rsp)->src_page_requests);
> >
> >     /*
> >+     * Count the total number of pages used by ram blocks not including
> any
> >+     * gaps due to alignment or unplugs.
> >      * This must match with the initial values of dirty bitmap.
> >-     * Currently we initialize the dirty bitmap to all zeros so
> >-     * here the total dirty page count is zero.
> >      */
> >-    (*rsp)->migration_dirty_pages = 0;
> >+    (*rsp)->migration_dirty_pages = ram_bytes_total() >>
> TARGET_PAGE_BITS;
> >     ram_state_reset(*rsp);
> >
> >     return 0;
> >@@ -3196,12 +3196,13 @@ static void ram_list_init_bitmaps(void)
> >              * The initial dirty bitmap for migration must be set with
> all
> >              * ones to make sure we'll migrate every guest RAM page to
> >              * destination.
> >-             * Here we didn't set RAMBlock.bmap simply because it is
> already
> >-             * set in ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION] in
> >-             * ram_block_add, and that's where we'll sync the dirty
> bitmaps.
> >-             * Here setting RAMBlock.bmap would be fine too but not
> necessary.
> >+             * Here we set RAMBlock.bmap all to 1 because when rebegin a
> >+             * new migration after a failed migration, ram_list.
>
> It is after failure or cancel?
>
> >+             * dirty_memory[DIRTY_MEMORY_MIGRATION] don't include the
> whole
> >+             * guest memory.
> >              */
> >             block->bmap = bitmap_new(pages);
> >+            bitmap_set(block->bmap, 0, pages);
> >             if (migrate_postcopy_ram()) {
> >                 block->unsentmap = bitmap_new(pages);
> >                 bitmap_set(block->unsentmap, 0, pages);
> >--
> >2.17.2 (Apple Git-113)
> >
>
>
> Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>
>
> --
> Wei Yang
> Help you, Help me
>
