Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945E03CFB77
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:59:40 +0200 (CEST)
Received: from localhost ([::1]:43804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5qHb-0000bb-LH
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m5qGV-0008CK-PS
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:58:31 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:37729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m5qGT-0001Pl-Ju
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:58:31 -0400
Received: by mail-il1-x12b.google.com with SMTP id o8so19214476ilf.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 06:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j8m7O3nzctdMpwynFD7KZJUAUeW65EE5Ui4etbpVfB4=;
 b=mDCo21bUeulA1IDay5t0M5oxnW2VlIr0Ji1NqJiljMa46pOR9RFXXopY+PTwkov1IS
 SPHeR2kUDgnTyYo2ylkJIcC51WF+dcAcK2NgfMtVf4jRJOMLEtgKbu1ppo+0bAffzQiG
 65xvn5nknNJY2Q8OikTvVTmovib/Qn6kMOm7c0sua4lD+yzW8XxJvkUHriu/dzvLNHw4
 na+3l6MZqxk+MlxspEFRcakSOkYEZcUz7u//vLmFO7B8Mq/cIMiVRejIkWyowjlxV8M/
 W3Yw6ctvv+mE8LVjBWGTHCLe6acwd/sxRweP9iAwRU7I9KuFBk48qsaL7Xdpttn00JHV
 2zZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j8m7O3nzctdMpwynFD7KZJUAUeW65EE5Ui4etbpVfB4=;
 b=p32+ZleJh5TCLknE/ZWaocxUR5W6aiU9qFMmqKsdRhDmBfWBE4HwLcJFjaeD9C/M78
 IFenOCIb7VPdof10pSuJvuSJRQT3+PtaVTEACWtUlRpKuJPeZjPPO6tC3UHj+rmndDZC
 u5iiePAXu5TCFHvqWLmvltmkAgDeaED3pUU0QXqDJbnmGj6I9FHD5R10asZQRKyDG5Bt
 1C4BUThZBAL1kXn0Rc4x3SzFIm7QA7iy1iKny3ZGs1n5drAlZTThB8MzYYSK4uZ4/WiZ
 eBBXtU+CXqiALL4xYVjS39wMEcI6GV+UBn7MN8wdYEEBAElKaBZTVV8ZJR2xdiGjSrVp
 yT7g==
X-Gm-Message-State: AOAM5332g+WalKeIZFmZ1+3tlibRVWRQ63Nw4r9fiv/j/wDD+MX/ugc4
 cWW9fU1ki3Ta1uHDyVwIppHpHooGcr0FPH6kLdk=
X-Google-Smtp-Source: ABdhPJzVbZHOuBRt3WkJm41rV/akVTSasjoeSdCkFMM6zz9S/GHeOFyj95xUs2ozQdSAVHcvQvhj1XAsKywKWOhNLvM=
X-Received: by 2002:a92:508:: with SMTP id q8mr21491709ile.89.1626789508290;
 Tue, 20 Jul 2021 06:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210714112306.67793-1-david@redhat.com>
 <CAM9Jb+i=CrXxyStxqP-Z=M0gV8wqy=Ok0C6CsfDVS3XBngn9tg@mail.gmail.com>
In-Reply-To: <CAM9Jb+i=CrXxyStxqP-Z=M0gV8wqy=Ok0C6CsfDVS3XBngn9tg@mail.gmail.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Tue, 20 Jul 2021 15:58:17 +0200
Message-ID: <CAM9Jb+hWVmrRJ6_vmeW5xzM-3WjbtrX+p78DMq5+a4wHVpUEDg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] util/oslib-posix: Support MADV_POPULATE_WRITE for
 os_mem_prealloc()
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > #1 adds support for MADV_POPULATE_WRITE, #2 cleans up the code to avoid
> > global variables and prepare for concurrency and #3 makes os_mem_prealloc()
> > safe to be called from multiple threads concurrently.
> >
> > Details regarding MADV_POPULATE_WRITE can be found in introducing upstream
> > Linux commit 4ca9b3859dac ("mm/madvise: introduce
> > MADV_POPULATE_(READ|WRITE) to prefault page tables") and in the latest man
> > page patch [1].
> >
> > [1] https://lkml.kernel.org/r/20210712083917.16361-1-david@redhat.com
> >
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > Cc: Igor Mammedov <imammedo@redhat.com>
> > Cc: Eduardo Habkost <ehabkost@redhat.com>
> > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Cc: Marek Kedzierski <mkedzier@redhat.com>
> > Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> >
> > David Hildenbrand (3):
> >   util/oslib-posix: Support MADV_POPULATE_WRITE for os_mem_prealloc()
> >   util/oslib-posix: Introduce and use MemsetContext for
> >     touch_all_pages()
> >   util/oslib-posix: Support concurrent os_mem_prealloc() invocation
> >
> >  include/qemu/osdep.h |   7 ++
> >  util/oslib-posix.c   | 167 ++++++++++++++++++++++++++++++-------------
> >  2 files changed, 126 insertions(+), 48 deletions(-)
> >
>
> Nice implementation to avoid wear of memory device for prealloc case

For prealloc case I mean.

> and to avoid touching of
> all the memory and abrupt exit of VM because of lack of memory. Instead better
> way to populate the page tables with madvise.
>
> Plan is to use this infrastructure for virtio-mem, I guess?
>
> For the patches 1 & 3:
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
>
>
> Thanks,
> Pankaj

