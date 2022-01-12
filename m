Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454E848C7C1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:59:25 +0100 (CET)
Received: from localhost ([::1]:33668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7g20-0003Ms-E3
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:59:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1n7foK-0000wH-7a
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:45:16 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=47066
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1n7foI-0005vX-6q
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:45:15 -0500
Received: by mail-io1-xd2c.google.com with SMTP id w9so4138365iol.13
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 07:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rV+ugNGZEh+qQQGIOHQNnBLltvfjY5KqUYAnEpW4tbg=;
 b=VhBJFE9lgsuUjA1wTPMphSrVU8eI+2AnGyzhWmSDN085DN2y1cLgd+SZCyHtwdicOd
 yjk0RSgD5JzD9LlK29+lmBp2BLUVKCVbQdSe+EzjrB2hpy+XCBNBWugs17vitB76VBpx
 B3yOEpNyjaodgcgPwhwXkjjONIllJLPquBeff6H5prQcTUFSLiO4y50G15TWdMnL/TFB
 YkAScC0aW4gBd7I6xeOqkixPgU/Lw1yiUs9yOMIaKJbNHyAXF4oj82bLZY9BrA6uvZGD
 xd0D2RRzK3VkKXGK+rvMLrbglvRS4ejOcfIGAX3ZhzUGPppWJIwMVCMUIrTvshuJ9DFx
 Bcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rV+ugNGZEh+qQQGIOHQNnBLltvfjY5KqUYAnEpW4tbg=;
 b=nNFCITMLAbitAT/2VnuyvMpGuN5KNB4hsByaQ+hCwT9NGyAx5aLGEj3s2B/qJTKXQo
 zQbq8W+ktKUy9W3fpayhYmMgxV46ipCexSTLzQ1tTJorX2dkRIWN6V1rg0ye4pYDccxT
 8rRmj5LYmaL8nDA+s1Sd+Txv4OrXL6GJA9zosK4xX5YoN9OYJk+nWZfybe2XYGyskWDU
 bYbs3jeEDqJSJdP49yy6WPEUnKxl/loqjsEaeg21B6td72/ONduGQ0iKfRsNR/FwXrko
 htJUVBn6bP/RbzUsa9A5+pIdC9pUvCLTDXYzrIRjQgKy0yeRBrfrDFm7lG9Z60Rvk3xn
 8bzg==
X-Gm-Message-State: AOAM5305sKgu97szqFTFv6ATN7BGEVQ8KlVw1W6QG25IbQtz4RbZrAbh
 B3m3s3bAXE28fVzPyPcxATnULNLnjHHGQRoQ8kM=
X-Google-Smtp-Source: ABdhPJyLBmG4uHeIUYOI7XVv6b71R8DETdu+cP4FzPrp3j+DdRbiUHRTN+iuwo11SKUbFkvE7b5Ri48DYsxLqwKi9nw=
X-Received: by 2002:a05:6638:130f:: with SMTP id
 r15mr156269jad.130.1642002311041; 
 Wed, 12 Jan 2022 07:45:11 -0800 (PST)
MIME-Version: 1.0
References: <20211231120127.22394-1-pankaj.gupta.linux@gmail.com>
 <625c92c6-3618-fbaa-aea6-0ed86df872d3@redhat.com>
In-Reply-To: <625c92c6-3618-fbaa-aea6-0ed86df872d3@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 12 Jan 2022 16:44:59 +0100
Message-ID: <CAM9Jb+hvCZoXLx4_xx8KTq4oBts7MCe-ozp5ZuX2yPW6=tyLGQ@mail.gmail.com>
Subject: Re: [RFC] virtio_pmem: enable live migration support
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta@ionos.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Rik van Riel <riel@surriel.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you David for replying!

> > From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>>
> >
> > Enable live migration support for virtio-pmem device.
> > Tested this: with live migration on same host.
> >
> > Need suggestion on below points to support virtio-pmem live migration
> > between two separate host systems:
>
> I assume emulated NVDIMMs would have the exact same issue, right?
>
> There are two cases to consider I think:
>
> 1) Backing storage is migrated manually to the destination (i.e., a file
> that is copied/moved/transmitted during migration)
>
> 2) Backing storage is located on a shared network storage (i.e., a file
> that is not copied during migration)
>
> IIRC you're concerned about 2).

Yes.

>
> >
> > - There is still possibility of stale page cache page at the
> >   destination host which we cannot invalidate currently as done in 1]
> >   for write-back mode because virtio-pmem memory backend file is mmaped
> >   in guest address space and invalidating corresponding page cache pages
> >   would also fault all the other userspace process mappings on the same file.
> >   Or we make it strict no other process would mmap this backing file?
>
> I'd have assume that a simple fsync on the src once migration is about
> to switch over (e.g., pre_save/post_save handler) should be enough to
> trigger writeback to the backing storage, at which point the dst can
> take over. So handling the src is easy.
>
> So is the issue that the dst might still have stale pagecache
> information, because it already accessed some of that file previously,
> correct?

yes.

>
> >
> >   -- In commit 1] we first fsync and then invalidate all the pages from destination
> >      page cache. fsync would sync the stale dirty page cache page, Is this the right
> >      thing to do as we might end up in data discrepancy?
>
> It would be weird if
>
> a) The src used/modified the file and fsync'ed the modifications back to
>    backing storage
> b) The dst has stale dirty pagecache pages that would result in a
>    modification of backing storage during fsync()

Yes. That's what I thought currently we are doing with commit 1] maybe Stefan
can confirm. If yes, itvirg is broken as well.

>
> I mean, that would be fundamentally broken, because the fsync() would
> corrupt the file. So I assume in a sane environment, the dst could only
> have stale clean pagecache pages. And we'd have to get rid of these to
> re-read everything from file.

In case of write back cache mode, we could still have stale dirty
pages at the destination
host and destination fsync is not the right thing to do. We need to
invalidate these pages
(Can we invalidate dirty pages resident in page cache with
POSIX_FADV_DONTNEED as
well?) man pages say, we cannot (unless i misunderstood it).

>
> IIRC, an existing mmap of the file on the dst should not really be
> problematic *as long as* we didn't actually access file content that way
> and faulted in the pages. So *maybe*, if we do the POSIX_FADV_DONTNEED
> on the dst before accessing file content via the mmap, there shouldn't
> be an issue. Unless the mmap itself is already problematic.

mmap with shared=ON, might result in stale dirty page cache pages?

>
> I think we can assume that once QEMU starts on the dst and wants to mmap
> the file that it's not mapped into any other process yet. vhost-user
> will only mmap *after* being told from QEMU about the mmap region and
> the location in GPA.

maybe we have an old stale dirty page cache page even if there no mmap process
alive before mmaping virtio-pmem backend file in destination?
>
> So if the existing QEMU mmap is not problematic, it should be easy, just
> do the POSIX_FADV_DONTNEED on the destination when initializing
> virtio-pmem. If we have to POSIX_FADV_DONTNEED *before* performing the
> mmap, we might need a way to tell QEMU to POSIX_FADV_DONTNEED before
> doing the mmap. The could be a parameter for memory-backend-file like
> "flush=on", or doing that implicitly when we're told that we expect an
> incoming migration.

Yes, that's what I had in mind. Just wanted to confirm some of my
doubts for correct
implementation. As I see it, page cache coherency across multiple host
systems with
live migration needs to be addressed or used to avoid such scenarios.


Thanks,
Pankaj
>
> --
> Thanks,
>
> David / dhildenb

