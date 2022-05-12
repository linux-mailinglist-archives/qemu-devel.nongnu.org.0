Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389FA52529C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 18:32:49 +0200 (CEST)
Received: from localhost ([::1]:34716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npBk7-0002ga-Qi
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 12:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npBaI-0003vQ-16
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:22:38 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:44968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npBaG-000361-D9
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:22:37 -0400
Received: by mail-yb1-xb29.google.com with SMTP id e12so10655566ybc.11
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 09:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ETZ0boNS6YCNeZnB1wEkA6zllZaVvQN6E85BZPqIKE=;
 b=eA7c4VPTHmdWR3d6Y+ZtnDFPkWSmGzkd5RvIThsfuqnkKOnmYHjfFiqJzpWWOm6IYB
 rmvrIix2CHBp9epVT2EC49a7AotTv4J/3tlvy1p/LTBi/GXwb3rT7uSXmES9zrU1LK9P
 v4J3lGAuBQYx8WjdoVePnZQW0V1IIrDvTN8tFIgwZzl6kjGF+++yFJMYXujOKljrowAX
 D4OEyWWzDFY9DTWqxZkr9OEUce7UZ5LdU0rKwDJtrRLG1XIiYRDjUUc/bFXghbG11I54
 /rmg1srPgHD9JEyfoDnq6FVy4r5ynSjVJOuZ3RbOW0HnQdNxAnH+IAr/hj5KLmd2dw+r
 6hRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ETZ0boNS6YCNeZnB1wEkA6zllZaVvQN6E85BZPqIKE=;
 b=biO47O5oOvwr7NQJkM4oHnFDwrhWeQWn89YrHcCra7kBx7RYRjwneatzzWCgNy34Sx
 oVUWOJdzFOI0ssdXQbh9Blg1zDFw/cfcYwBQGZnnPEVBfFlJY7DA5rEKbiy+jrJsDMzw
 6/rE3s9oTLnGpMFHx28CrBv3i0Mn/bjVmrzEpnvuz1/I8Lfz4LfsryBKY427k1FT0tuB
 J5XN4SxNwH64rmH8/1NYg/m9HnlUcc/Mnojukm5CX8f92YwL0NhZngd/1UHRwXMiOESq
 07GTd8GOLwG8dCEwFvcmaXStmySnUiX1xTqtVLcZueoaToeS2VrEOtMvZKYFZR+SMajf
 G+cA==
X-Gm-Message-State: AOAM531FGsGBib/Hi7vOB/33l1ZpqjVaBBHTexOiD9y3LxWTunPZnVGO
 0QJMH+IjtVY0LUxEykGRv2mO/wbeZ7rjMzws8+Jt4w==
X-Google-Smtp-Source: ABdhPJyMir1WCiB2ZbCXM8HufNvk68/xSQyyM7zV6ywR0Elj7udLsfvB2IT2+bDcTrS9LcgHPNF6IobZa5zFnSedzkw=
X-Received: by 2002:a25:6f85:0:b0:64a:8b67:d3b2 with SMTP id
 k127-20020a256f85000000b0064a8b67d3b2mr573478ybc.85.1652372555438; Thu, 12
 May 2022 09:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200228092420.103757-1-quintela@redhat.com>
 <20200228092420.103757-13-quintela@redhat.com>
In-Reply-To: <20200228092420.103757-13-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 May 2022 17:22:24 +0100
Message-ID: <CAFEAcA_jQRop9BjOG=7cUBPcuvgAZaQOAbkHTdgWeuxrK5+u+A@mail.gmail.com>
Subject: Re: [PULL 12/15] migration/block: rename BLOCK_SIZE macro
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 28 Feb 2020 at 09:30, Juan Quintela <quintela@redhat.com> wrote:
>
> From: Stefan Hajnoczi <stefanha@redhat.com>
>
> Both <linux/fs.h> and <sys/mount.h> define BLOCK_SIZE macros.  Avoiding
> using that name in block/migration.c.
>
> I noticed this when including <liburing.h> (Linux io_uring) from
> "block/aio.h" and compilation failed.  Although patches adding that
> include haven't been sent yet, it makes sense to rename the macro now in
> case someone else stumbles on it in the meantime.

A rather old change, and it didn't even introduce the code that
Coverity is complaining about, but this seems as good a point as
any to hang the email off of...

BLK_MIG_BLOCK_SIZE doesn't have a ULL suffix, so it's 32 bits,
and so Coverity complains about places where we multiply some
block count by it and then use that in a 64-bit result, eg here:

> @@ -770,7 +771,7 @@ static int block_save_iterate(QEMUFile *f, void *opaque)
>
>      /* control the rate of transfer */
>      blk_mig_lock();
> -    while (block_mig_state.read_done * BLOCK_SIZE <
> +    while (block_mig_state.read_done * BLK_MIG_BLOCK_SIZE <
>             qemu_file_get_rate_limit(f) &&
>             block_mig_state.submitted < MAX_PARALLEL_IO &&
>             (block_mig_state.submitted + block_mig_state.read_done) <

and here:

> @@ -874,13 +875,13 @@ static void block_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
>      qemu_mutex_unlock_iothread();
>
>      blk_mig_lock();
> -    pending += block_mig_state.submitted * BLOCK_SIZE +
> -               block_mig_state.read_done * BLOCK_SIZE;
> +    pending += block_mig_state.submitted * BLK_MIG_BLOCK_SIZE +
> +               block_mig_state.read_done * BLK_MIG_BLOCK_SIZE;
>      blk_mig_unlock();

Putting a suitable cast to ensure the multiply is done at
64 bits would satisfy Coverity.

This is CID 1487136, 1487175.

thanks
-- PMM

