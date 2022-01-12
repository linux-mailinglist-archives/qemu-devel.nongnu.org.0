Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFEE48C8C3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 17:48:49 +0100 (CET)
Received: from localhost ([::1]:40646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7gno-0000dR-Ld
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 11:48:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1n7giF-0001mp-5U
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 11:43:03 -0500
Received: from [2a00:1450:4864:20::12f] (port=41738
 helo=mail-lf1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1n7giD-0008Co-92
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 11:43:02 -0500
Received: by mail-lf1-x12f.google.com with SMTP id x7so10145242lfu.8
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 08:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=klNShvzpX/BtIbq0Gs7TxycPXoEdweV02IUhoN50YWU=;
 b=AoEFB9quxMEWKZhYPqnjpaQmXN3kPXdWFEzlt2bD28LM402Zjp773/HepW/7o3ndGG
 3+CzSn+VPwXc1WDLB29dSX5RpYoW/lYFdLG3LwxlRDXIBHHT4cdCDlcSY2R5u5UKhcL7
 ZmI/4xV7QMoWxTynmVKEVRh3vyvxF7LB1hcR1CWryC2VHLBtAs7Z42qvY3vcoGhagqT/
 2Hfk5xI3ihI8givZMPe7ltR5xJcj6ciPnpUMl86GjwY5KB441GTeSYX/oSwctOpOtMNs
 4maA9UDtDcXpm1lTgPaDkxKKfP0NcyV71eqRqAVaGTGjLcBuEE7DXoL0NEgzTwNOa9St
 R4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=klNShvzpX/BtIbq0Gs7TxycPXoEdweV02IUhoN50YWU=;
 b=4JC4qnPktoPHeSGan2ZOq9KYyHHuK+CRGLq3wGSjeCbMOyhySGQdyc/diGmWWjDvmx
 h8QKFPMHeLyVomgKLc1iqlvuMePV23+yThQ7y1+RiL0QWVA+iM34aiXvCId5+6roLeX3
 RWHvuJJecQZASQEw1AD/s3fpQ0nd2ACczssUHCJVltPjJsus4rnZi/e00Hx88bAKymqE
 USDNpX0HfL/KAP+hDQ7ZnXr9JMJZEbY3GNXdCJdkSKSYqmTSKca0HaVfB+YQtHAdi25S
 6sbij6BL63HLtJ+bqJuaCN0qCPvI0MUHfqJn4xymNP0F/XhhMLi9YTOXq7Gkd1Ndivxa
 etJw==
X-Gm-Message-State: AOAM533P8KBPytxjhF/80lHEjMr3+LfLHkyWfj2Hta1i7GgvY36ukmj6
 SRGPwihVrOLWPgBMvleHJPggZGkQSN+ulVeilk8COw==
X-Google-Smtp-Source: ABdhPJzQKHeEI3oyBxKocoWe/AwaKtz4vcXCVyjGQ1wyRHWbuDOjcmw0DuVrlwYhcmVEkffI55BsxjgMsKAXCFicUn4=
X-Received: by 2002:a2e:958e:: with SMTP id w14mr280686ljh.200.1642005778723; 
 Wed, 12 Jan 2022 08:42:58 -0800 (PST)
MIME-Version: 1.0
References: <20211231120127.22394-1-pankaj.gupta.linux@gmail.com>
 <625c92c6-3618-fbaa-aea6-0ed86df872d3@redhat.com>
 <CAM9Jb+hvCZoXLx4_xx8KTq4oBts7MCe-ozp5ZuX2yPW6=tyLGQ@mail.gmail.com>
 <d0fc0d8e-fe38-1ab2-2d56-23345de783e7@redhat.com>
 <CALzYo32zxdL6ET_5Btw=Hoat8i4KtA2iUEpd9+_sXSbw84_SAA@mail.gmail.com>
 <f20bd3ca-8d55-4124-78c8-7a2f4ce9f7f7@redhat.com>
In-Reply-To: <f20bd3ca-8d55-4124-78c8-7a2f4ce9f7f7@redhat.com>
From: Pankaj Gupta <pankaj.gupta@ionos.com>
Date: Wed, 12 Jan 2022 17:42:47 +0100
Message-ID: <CALzYo30gkF=8pTzyxsCOHUnHHBp-xrf8FWpLg-SVJFDScujXWw@mail.gmail.com>
Subject: Re: [RFC] virtio_pmem: enable live migration support
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12f
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::12f;
 envelope-from=pankaj.gupta@ionos.com; helo=mail-lf1-x12f.google.com
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

> >>>> I mean, that would be fundamentally broken, because the fsync() would
> >>>> corrupt the file. So I assume in a sane environment, the dst could only
> >>>> have stale clean pagecache pages. And we'd have to get rid of these to
> >>>> re-read everything from file.
> >>>
> >>> In case of write back cache mode, we could still have stale dirty
> >>> pages at the destination
> >>> host and destination fsync is not the right thing to do. We need to
> >>> invalidate these pages
> >>> (Can we invalidate dirty pages resident in page cache with
> >>> POSIX_FADV_DONTNEED as
> >>> well?) man pages say, we cannot (unless i misunderstood it).
> >>>
> >>
> >> I think you'd have to fsync + POSIX_FADV_DONTNEED. But I am still
> >> confused how we could end up with dirty pagecache pages on the
> >> destination. In my opinion, there should only be clean pagecache pages
> >> -- can someone enlighten me? :)
> >
> > because of activity on the page cache pages corresponding to mmap region
> > in the past which is not synced yet or not reclaimed yet. Maybe this
> > is hypothetical
> > or not possible, happy to learn?
>
> Right, but assume the following *sane*
>
> #1 H0 starts and runs VM.
> #2 H0 migrates VM to H1.
> #3 H1 runs VM.
> #4 H1 migrates VM to H0.
> #5 H0 runs VM.
>
> We'd expect a proper fsync during #2, writing back any dirty pages to
> the memory backend. Otherwise, #3 would already be broken. Similarly,
> we'd expect a proper fsync during #4.
>
> I assume during #4 we could find clean pagecache pages that are actually
> invalid, because the underlying file was changed by H1. So we have to
> make sure to invalidate all pagecache pages (all clean).

Yes, you mean fsync on source host before migration starts. My point
is something
like another process mmap same backend file on destination host and/or
guest/qemu
crashing abruptly.

