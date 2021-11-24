Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD1045B801
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:06:37 +0100 (CET)
Received: from localhost ([::1]:48510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppAf-0005NM-8k
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:06:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp3i-0000b2-2r
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:59:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp3f-0005M3-Vb
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637747959;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qlv5q1keHcGL7Kcv1EyXUpKb8gb7nHBrKvPQDJ9NEuw=;
 b=hCYWxd+QO8WzZpZ6je5GXEiO2/nMatVqtHmWDaQnwybejp581QW3K3Yv/2xGxn5oKSCSE4
 glWA0rvR6+UCqSKNX0g7RcXB2/fBUldChoimpNGVfyRvf2Hh5zVEcnWwOlMZu0n1+KzvIi
 4CT40YelYvjcor3wy/rbO+LTeY94zEg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-crKj8vVYMa-wmPqkhsvvVA-1; Wed, 24 Nov 2021 04:59:18 -0500
X-MC-Unique: crKj8vVYMa-wmPqkhsvvVA-1
Received: by mail-wm1-f71.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so1066579wmb.3
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:59:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=qlv5q1keHcGL7Kcv1EyXUpKb8gb7nHBrKvPQDJ9NEuw=;
 b=GFYzn28R0LefzTcewxXkYjphRT6zr6xI1x4IfLbcmifHQfN0wOU6rn5Ovt4yNhLVgb
 3xZCZpOAunF+3D1SdyssJY0i9v+p2ytVz1er6W/VwFCxqYA/hIsrg0mcHkgqLT9hyllM
 nY6+f5QtP+NcyppB+S0XYAD3OekRu2f+7G6ztNpi4D53IT9GokFoq2WyEBH9Uqs4+Yvx
 cEBUb3r6U4pNaumDi2gBw+smARF0leWOsOT5cex4E2/k90l+LC+usbI5M4NMfbruiisb
 8yz4oTnTBCRbFWmW8zOltwUdfxiit8uTUaZTbXonjuvXv6lIV+q470rot/htUaGq/eri
 L75w==
X-Gm-Message-State: AOAM53044AxIPFIRJitwt49ZFtM/PgMjTZdyhHhKp79D2Q25Mvp/SXX0
 id3hSp32O01GzGlQFBzUoHEFQwczd5hTVv9XkJctR2yCaDq4A6XwwTH4Mdep+1beEHav6qsQdKW
 KIKAv9VQhpZcMU5rSJQedD+34KwUrdKdBK5eGUhOzO4mEm2XC7jC4tq4C14tcz478cXM=
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr17137281wri.343.1637747957056; 
 Wed, 24 Nov 2021 01:59:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDrmXwD7dOFQyNzrLpfaLcw2BNKzSy27ME/owcTaI13glKt6KkQKinJqxRFFnrqbQan08igw==
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr17137248wri.343.1637747956797; 
 Wed, 24 Nov 2021 01:59:16 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id f19sm5220099wmq.34.2021.11.24.01.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:59:16 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 00/23] Migration: Transmit and detect zero pages in the
 multifd threads
In-Reply-To: <20211123175113.35569-1-quintela@redhat.com> (Juan Quintela's
 message of "Tue, 23 Nov 2021 18:50:50 +0100")
References: <20211123175113.35569-1-quintela@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 24 Nov 2021 10:59:15 +0100
Message-ID: <875yshho24.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Leonardo Bras <leobras@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Juan Quintela <quintela@redhat.com> wrote:
> Hi

Nack myself.

For some reasons my mail server decided to only sent part of the series.

Sorry, Juan.


>
> Since Friday version:
> - More cleanups on the code
> - Remove repeated calls to qemu_target_page_size()
> - Establish normal pages and zero pages
> - detect zero pages on the multifd threads
> - send zero pages through the multifd channels.
> - reviews by Richard addressed.
>
> It pases migration-test, so it should be perfect O:+)
>
> ToDo for next version:
> - check the version changes
>   I need that 6.2 is out to check for 7.0.
>   This code don't exist at all due to that reason.
> - Send measurements of the differences
>
> Please, review.
>
> [
>
> Friday version that just created a single writev instead of
> write+writev.
>
> ]
>
> Right now, multifd does a write() for the header and a writev() for
> each group of pages.  Simplify it so we send the header as another
> member of the IOV.
>
> Once there, I got several simplifications:
> * is_zero_range() was used only once, just use its body.
> * same with is_zero_page().
> * Be consintent and use offset insed the ramblock everywhere.
> * Now that we have the offsets of the ramblock, we can drop the iov.
> * Now that nothing uses iov's except NOCOMP method, move the iovs
>   from pages to methods.
> * Now we can use iov's with a single field for zlib/zstd.
> * send_write() method is the same in all the implementaitons, so use
>   it directly.
> * Now, we can use a single writev() to write everything.
>
> ToDo: Move zero page detection to the multifd thrteads.
>
> With RAM in the Terabytes size, the detection of the zero page takes
> too much time on the main thread.
>
> Last patch on the series removes the detection of zero pages in the
> main thread for multifd.  In the next series post, I will add how to
> detect the zero pages and send them on multifd channels.
>
> Please review.
>
> Later, Juan.
>
> Juan Quintela (23):
>   multifd: Delete useless operation
>   migration: Never call twice qemu_target_page_size()
>   multifd: Rename used field to num
>   multifd: Add missing documention
>   multifd: The variable is only used inside the loop
>   multifd: remove used parameter from send_prepare() method
>   multifd: remove used parameter from send_recv_pages() method
>   multifd: Fill offset and block for reception
>   multifd: Make zstd compression method not use iovs
>   multifd: Make zlib compression method not use iovs
>   multifd: Move iov from pages to params
>   multifd: Make zlib use iov's
>   multifd: Make zstd use iov's
>   multifd: Remove send_write() method
>   multifd: Use a single writev on the send side
>   multifd: Unfold "used" variable by its value
>   multifd: Use normal pages array on the send side
>   multifd: Use normal pages array on the recv side
>   multifd: recv side only needs the RAMBlock host address
>   multifd: Rename pages_used to normal_pages
>   multifd: Support for zero pages transmission
>   multifd: Zero pages transmission
>   migration: Use multifd before we check for the zero page
>
>  migration/multifd.h      |  52 +++++++---
>  migration/migration.c    |   7 +-
>  migration/multifd-zlib.c |  71 +++++--------
>  migration/multifd-zstd.c |  70 +++++--------
>  migration/multifd.c      | 214 +++++++++++++++++++++++----------------
>  migration/ram.c          |  22 ++--
>  migration/savevm.c       |   5 +-
>  migration/trace-events   |   4 +-
>  8 files changed, 231 insertions(+), 214 deletions(-)


