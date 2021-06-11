Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217EF3A4B4F
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:41:49 +0200 (CEST)
Received: from localhost ([::1]:45292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqma-0000Tj-3n
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lrql0-0006nE-Je
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:40:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lrqkv-0001Nb-Tw
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:40:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623454803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tMx9UBQB7S5QRwxJugShfW0y81P8b4YsJT7Dq6q7wHI=;
 b=Y/q/dFNv2jVs4ufSCBK11GcR+YRNOgET5HJJZ5fJLkxzUV/UR+mzAFrWqia4WAW6cKVka2
 ueXzokGsBAIaXD4ZG90OtMLR5zKREe5DsWd9Z855kwiAHfrV+JGuFRdQKfdY4e5HzCAPM0
 rjBX0mwl5EV9S4VxFGY+cMbr+ASbkmo=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-LEaek7qBOm6AX8Euwzoh_A-1; Fri, 11 Jun 2021 19:40:01 -0400
X-MC-Unique: LEaek7qBOm6AX8Euwzoh_A-1
Received: by mail-oo1-f71.google.com with SMTP id
 f5-20020a4ab0050000b029023e3bd79e80so2411166oon.10
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tMx9UBQB7S5QRwxJugShfW0y81P8b4YsJT7Dq6q7wHI=;
 b=Zu+BxZL7775tMM5Vb8MJgPiehc31lmre6KL4f1zHW0bKWdGmANWGtD69lztRr1tItZ
 Udnqb+bHgSpP73rQ+wjvcuCz9lfuYZs4vnXl59cn6gBk4O6gKLTJ+jBUwKEgvfAqjOLd
 gbUSQ9XzJn2GWVnGibRSorvbCSeq5zz/SdE8QWT/sCHyje8kFYsuFmxc5DeMtMQLfjE6
 p1bk+dRPvwivRz/hOSyjFfhQlWHH6yfcurHfMrkljVPXxl/SB094WX17RTTzODXdixQq
 83/H5Pt8WTVoMRXqf7u84FxCXUcNxq47Y4ZonRtzysEC1OS/6cZ/30KSpfgxZnkuhPxf
 hFfA==
X-Gm-Message-State: AOAM532Co3CvrlubdZLwwrVYxne/aYSmq2p2XmjTdoS9MloOo1kIvqGZ
 E+wTgVFHTCTvIsdCGugbVGQEAFTo9zhpRZ2KEBkPW88+8N1Fbrv3VWsszAFe0TEo1jVHCqEZEr8
 N53ZXlIBnlxYSNyFOxKMXBmhMF6RlJFA=
X-Received: by 2002:a9d:6081:: with SMTP id m1mr5045416otj.226.1623454800965; 
 Fri, 11 Jun 2021 16:40:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNMxf6r6AKYFBwqFubL97nLxf2sfFgyJLZa/gFmIfka8JjjIhHJXYW5IHdo569FCNfT7YG6P39KnMAO/Ua8N0=
X-Received: by 2002:a9d:6081:: with SMTP id m1mr5045397otj.226.1623454800787; 
 Fri, 11 Jun 2021 16:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210609180118.1003774-1-eblake@redhat.com>
 <20210609180118.1003774-3-eblake@redhat.com>
In-Reply-To: <20210609180118.1003774-3-eblake@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Sat, 12 Jun 2021 02:39:44 +0300
Message-ID: <CAMRbyyuyFf4F9S6+rW2j+YPQyV3PECifq1_4S6mQ+8V2hREsKA@mail.gmail.com>
Subject: Re: [PATCH 2/2] nbd: Add new qemu:joint-allocation metadata context
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 9, 2021 at 9:01 PM Eric Blake <eblake@redhat.com> wrote:
>
> When trying to reconstruct a qcow2 chain using information provided
> over NBD, ovirt had been relying on an unsafe assumption that any
> portion of the qcow2 file advertised as sparse would defer to the
> backing image; this worked with what qemu 5.2 reports for a qcow2 BSD
> loaded with "backing":null.  However, in 6.0, commit 0da9856851 (nbd:
> server: Report holes for raw images) also had a side-effect of
> reporting unallocated zero clusters in qcow2 files as sparse.  This
> change is correct from the NBD spec perspective (advertising bits has
> always been optional based on how much information the server has
> available, and should only be used to optimize behavior when a bit is
> set, while not assuming semantics merely because a bit is clear), but
> means that a qcow2 file that uses an unallocated zero cluster to
> override a backing file now shows up as sparse over NBD, and causes
> ovirt to fail to reproduce that cluster (ie. ovirt was assuming it
> only had to write clusters where the bit was clear, and the 6.0
> behavior change shows the flaw in that assumption).
>
> The correct fix is for ovirt to additionally use the
> qemu:allocation-depth metadata context added in 5.2: after all, the
> actual determination for what is needed to recreate a qcow2 file is
> not whether a cluster is sparse, but whether the allocation-depth
> shows the cluster to be local.  But reproducing an image is more
> efficient when handling known-zero clusters, which means that ovirt
> has to track both base:allocation and qemu:allocation-depth metadata
> contexts simultaneously.  While NBD_CMD_BLOCK_STATUS is just fine
> sending back information for two contexts in parallel, it comes with
> some bookkeeping overhead at the client side: the two contexts need
> not report the same length of replies, and it involves more network
> traffic.

Since this change is not simple, and the chance that we also get the dirty
bitmap included in the result seems to be very low, I decided to check the
direction of merging multiple extents.

I started with merging "base:allocation" and "qemu:dirty-bitmap:xxx" since
we already have both. It was not hard to do, although it is not completely
tested yet.

Here is the merging code:
https://gerrit.ovirt.org/c/ovirt-imageio/+/115216/1/daemon/ovirt_imageio/_internal/nbdutil.py

To make merging easy and safe, we map the NBD_STATE_DIRTY bit to a private bit
so it cannot clash with the NBD_STATE_HOLE bit:
https://gerrit.ovirt.org/c/ovirt-imageio/+/115215/1/daemon/ovirt_imageio/_internal/nbd.py

Here is a functional test using qemu-nbd showing that it works:
https://gerrit.ovirt.org/c/ovirt-imageio/+/115216/1/daemon/test/client_test.py

I'll try to use "qemu:allocation-depth" in a similar way next week, probably
mapping depth > 0 to EXTENT_EXISTS, to use when reporting holes in
single qcow2 images.

If this is successful, we can start using this in the next ovirt release, and we
don't need "qemu:joint-allocation".

Nir


