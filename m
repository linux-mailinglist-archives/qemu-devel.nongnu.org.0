Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE27148C7F9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 17:12:51 +0100 (CET)
Received: from localhost ([::1]:48090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7gF0-0006Gu-8N
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 11:12:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1n7gBB-0004J0-Px
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 11:08:53 -0500
Received: from [2a00:1450:4864:20::135] (port=44623
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1n7gB9-0002CA-SQ
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 11:08:53 -0500
Received: by mail-lf1-x135.google.com with SMTP id o15so9747672lfo.11
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 08:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J5kg9k7Ki4JTJKZXicjqmNV7I+D3P5zC+psbJoGOGJg=;
 b=FSHGThrEhnN7VSKddGDod9MUg2BdUkQSskVDuwiZ+sZH4hnj02qhmdHPba3knPH/9F
 LqaG+JsyDU71MJb0ADhsT1dR4XaEcUXkrsqRyfDog2Y5fTMBD85mOElb94NxQjRO1T7O
 5SxE5uJ3RHQC1j0YBpujz2R/rjukPts4XdknWZYWiwwTM7bqwr5Kt10X8J8sxRsmnpu7
 ce93tKDVQ2lMRguO8JmFuvnpk0GYZiyoIgJe+07azgezhyZkbfHFcdnLLZNlENSHw94u
 JUL4pntpg67RZIuZ0B7AKz7zV7PK1RY1LExGdy84Zc+5UJjYuft2hvUy4DU1vI4CQuL7
 sPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J5kg9k7Ki4JTJKZXicjqmNV7I+D3P5zC+psbJoGOGJg=;
 b=nA5dTCj14lAAEaSGJzhY1xPQzlcJzpEv+b+6gn4AhFuxuhXzvMzHyEar2GzLANCw4S
 f8aGpOJ43hCmh4Wg17/e9yUxnXwL/XZemZnhe09++Y05hhBgPC+7YXAT0FYSoIBHLptW
 QGXj/XliHVA3ShdQajTLI8QpW6YhMDPrJ915GgjfAge5gRbn3CBKMlDYTDDWZ7gf81x0
 Tl4W3rWYkuNq0b5kYXxLoI3tOtbbha5jzI8fGROetB+caiJ6QpHiIVgsyoW2+2nvY4E1
 cUiUYowOAAez+psqbvs1mg7SaMeoWBsvC8AZ4xKOS9nYDvJjeRc0fJRB3q3WQb8xrvK5
 46Yw==
X-Gm-Message-State: AOAM531ZZUf7qsQJXqgXWt7gIJqvOOJhEGfB0yxKFKhUHgvhfZ+jQmpk
 PJyFFJTAEE7rY2Z+g9agRM7GG0uBySDzBZ+c/ApJvg==
X-Google-Smtp-Source: ABdhPJxeb3HWVG6Cdfl9K0/dE2mslVQmQh370nTdT/0racSlto/R4tYQnCpK3mmGpAlYGoZRH//fKe+nUWypiTHV2vU=
X-Received: by 2002:a05:651c:b22:: with SMTP id
 b34mr129143ljr.495.1642003728155; 
 Wed, 12 Jan 2022 08:08:48 -0800 (PST)
MIME-Version: 1.0
References: <20211231120127.22394-1-pankaj.gupta.linux@gmail.com>
 <625c92c6-3618-fbaa-aea6-0ed86df872d3@redhat.com>
 <CAM9Jb+hvCZoXLx4_xx8KTq4oBts7MCe-ozp5ZuX2yPW6=tyLGQ@mail.gmail.com>
 <d0fc0d8e-fe38-1ab2-2d56-23345de783e7@redhat.com>
In-Reply-To: <d0fc0d8e-fe38-1ab2-2d56-23345de783e7@redhat.com>
From: Pankaj Gupta <pankaj.gupta@ionos.com>
Date: Wed, 12 Jan 2022 17:08:37 +0100
Message-ID: <CALzYo32zxdL6ET_5Btw=Hoat8i4KtA2iUEpd9+_sXSbw84_SAA@mail.gmail.com>
Subject: Re: [RFC] virtio_pmem: enable live migration support
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::135;
 envelope-from=pankaj.gupta@ionos.com; helo=mail-lf1-x135.google.com
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

> >> I mean, that would be fundamentally broken, because the fsync() would
> >> corrupt the file. So I assume in a sane environment, the dst could only
> >> have stale clean pagecache pages. And we'd have to get rid of these to
> >> re-read everything from file.
> >
> > In case of write back cache mode, we could still have stale dirty
> > pages at the destination
> > host and destination fsync is not the right thing to do. We need to
> > invalidate these pages
> > (Can we invalidate dirty pages resident in page cache with
> > POSIX_FADV_DONTNEED as
> > well?) man pages say, we cannot (unless i misunderstood it).
> >
>
> I think you'd have to fsync + POSIX_FADV_DONTNEED. But I am still
> confused how we could end up with dirty pagecache pages on the
> destination. In my opinion, there should only be clean pagecache pages
> -- can someone enlighten me? :)

because of activity on the page cache pages corresponding to mmap region
in the past which is not synced yet or not reclaimed yet. Maybe this
is hypothetical
or not possible, happy to learn?

>
> >>
> >> IIRC, an existing mmap of the file on the dst should not really be
> >> problematic *as long as* we didn't actually access file content that way
> >> and faulted in the pages. So *maybe*, if we do the POSIX_FADV_DONTNEED
> >> on the dst before accessing file content via the mmap, there shouldn't
> >> be an issue. Unless the mmap itself is already problematic.
> >
> > mmap with shared=ON, might result in stale dirty page cache pages?
>
> But only if actually accessing memory, especially writing to it, no?

yes.


>
> >
> >>
> >> I think we can assume that once QEMU starts on the dst and wants to mmap
> >> the file that it's not mapped into any other process yet. vhost-user
> >> will only mmap *after* being told from QEMU about the mmap region and
> >> the location in GPA.
> >
> > maybe we have an old stale dirty page cache page even if there no mmap process
> > alive before mmaping virtio-pmem backend file in destination?
>
> But how could that happen in a sane environment? As I said, any
> writeback on that file from the destination would actually corrupt the
> file that has been used+modified on the source in the meantime, no?
>
>
> --
> Thanks,
>
> David / dhildenb
>

