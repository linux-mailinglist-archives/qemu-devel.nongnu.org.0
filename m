Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7069648C8D6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 17:52:33 +0100 (CET)
Received: from localhost ([::1]:47492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7grQ-0005PM-HT
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 11:52:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1n7gnU-0002Ae-K0
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 11:48:31 -0500
Received: from [2a00:1450:4864:20::136] (port=34637
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1n7gnS-0000i7-7M
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 11:48:27 -0500
Received: by mail-lf1-x136.google.com with SMTP id o12so10325436lfk.1
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 08:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rbF2fuX0LIWvt7pXdtlkHbqK2/gLyZj+z67OxzCD+XM=;
 b=UJq38y1+VEJ4m4DBKBZcRmF3ZQQ/6Zk/csdRJkyqJWm7AghoyvR6OqIx3aRt/6UJzk
 rKutNyLA1o5aB2KQtKPVlbdR5dFB9RTQbHxCFsyrU+zfDK0FNbOmKfLAVqxaoWyK99Xq
 zfSmtyDC9hFQbdTgmjsSLi6YHxCUB0PU7ypeiI3qJgZOPb3VMZlyz4MvBFz+hYp1eq4l
 l3ih5reCUCn5/EtfxvtWIrtiR+rj5iJtn2AIe9QnQ6+r/k46cwwPITKNvBaZCqbsED/U
 zIN8UsCOm7ezI3ZfECKk68HEB36xBBihiwy7S+2niQ5v4n4o+lZkjlJTvpPEO4nhXsWq
 qpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rbF2fuX0LIWvt7pXdtlkHbqK2/gLyZj+z67OxzCD+XM=;
 b=2Fu0vrcpWOTTymdj+wJLm2J2I4X3nNiNU3fRwFhve/oHyaB2CQLF7SAxu+fhMLC4F9
 4+e9Zgux8pno4zGwO155JQAgCxa5Ulf67PHLRl0CFUGVX0MElfbvqcvjZ4UTX5urHv1A
 qwgU0sLXHyOE52OC5623eOsSt+fFW23xcHHGYeovWbRaAQTwZ2Nor1zT/7lCKUPTp17D
 U3qdqz4I2NZugp3GainHenbWoZaJKzH3XPxbpmgCMOrstHmmGg8XLlSk4H/RCprVooPk
 Jr/3Wc3tuYqIHLyloEVrVx0jphu2j2+3B5RaBkMHJyJ6/+YMay0ADCv4QstRCJu+yPBk
 Om3A==
X-Gm-Message-State: AOAM5310Sn2q0MV3e9JYjao4Pc3B0PO+s29NpFYLCuzhwjr9Yz6V8o5E
 sWX05lbAgSU2D/xC8u2TCdW1w3bs3WvJWg6fw6fx6g==
X-Google-Smtp-Source: ABdhPJyDuMb1rNHcT49k0tmBxxp/4nE4O/iGaqjJGVeCdRVFeawlRypKvwazPXRMI1/WqdMvK7BIUWwJfDbHE3Z0Woo=
X-Received: by 2002:a05:6512:6d3:: with SMTP id
 u19mr445662lff.310.1642006103776; 
 Wed, 12 Jan 2022 08:48:23 -0800 (PST)
MIME-Version: 1.0
References: <20211231120127.22394-1-pankaj.gupta.linux@gmail.com>
 <625c92c6-3618-fbaa-aea6-0ed86df872d3@redhat.com>
 <CAM9Jb+hvCZoXLx4_xx8KTq4oBts7MCe-ozp5ZuX2yPW6=tyLGQ@mail.gmail.com>
 <d0fc0d8e-fe38-1ab2-2d56-23345de783e7@redhat.com>
 <CALzYo32zxdL6ET_5Btw=Hoat8i4KtA2iUEpd9+_sXSbw84_SAA@mail.gmail.com>
 <f20bd3ca-8d55-4124-78c8-7a2f4ce9f7f7@redhat.com>
 <CALzYo30gkF=8pTzyxsCOHUnHHBp-xrf8FWpLg-SVJFDScujXWw@mail.gmail.com>
In-Reply-To: <CALzYo30gkF=8pTzyxsCOHUnHHBp-xrf8FWpLg-SVJFDScujXWw@mail.gmail.com>
From: Pankaj Gupta <pankaj.gupta@ionos.com>
Date: Wed, 12 Jan 2022 17:48:12 +0100
Message-ID: <CALzYo304SsT92kNkscj5SyGAwsBOR2tk-Sk+3STBWkhxOYv+Lg@mail.gmail.com>
Subject: Re: [RFC] virtio_pmem: enable live migration support
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::136;
 envelope-from=pankaj.gupta@ionos.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Rik van Riel <riel@surriel.com>,
 Qemu Developers <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > >>>> I mean, that would be fundamentally broken, because the fsync() would
> > >>>> corrupt the file. So I assume in a sane environment, the dst could only
> > >>>> have stale clean pagecache pages. And we'd have to get rid of these to
> > >>>> re-read everything from file.
> > >>>
> > >>> In case of write back cache mode, we could still have stale dirty
> > >>> pages at the destination
> > >>> host and destination fsync is not the right thing to do. We need to
> > >>> invalidate these pages
> > >>> (Can we invalidate dirty pages resident in page cache with
> > >>> POSIX_FADV_DONTNEED as
> > >>> well?) man pages say, we cannot (unless i misunderstood it).
> > >>>
> > >>
> > >> I think you'd have to fsync + POSIX_FADV_DONTNEED. But I am still
> > >> confused how we could end up with dirty pagecache pages on the
> > >> destination. In my opinion, there should only be clean pagecache pages
> > >> -- can someone enlighten me? :)
> > >
> > > because of activity on the page cache pages corresponding to mmap region
> > > in the past which is not synced yet or not reclaimed yet. Maybe this
> > > is hypothetical
> > > or not possible, happy to learn?
> >
> > Right, but assume the following *sane*
> >
> > #1 H0 starts and runs VM.
> > #2 H0 migrates VM to H1.
> > #3 H1 runs VM.
> > #4 H1 migrates VM to H0.
> > #5 H0 runs VM.
> >
> > We'd expect a proper fsync during #2, writing back any dirty pages to
> > the memory backend. Otherwise, #3 would already be broken. Similarly,
> > we'd expect a proper fsync during #4.
> >
> > I assume during #4 we could find clean pagecache pages that are actually
> > invalid, because the underlying file was changed by H1. So we have to
> > make sure to invalidate all pagecache pages (all clean).
>
> Yes, you mean fsync on source host before migration starts. My point
> is something
> like another process mmap same backend file on destination host and/or
> guest/qemu
> crashing abruptly.

In that case we should not start guest if we cannot invalidate all the
corresponding
page cache pages before starting guest i.e mmaping virtio-pmem backend file.

Thank you for the discussion!

Best regards,
Pankaj

