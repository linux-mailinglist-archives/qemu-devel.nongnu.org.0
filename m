Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12FD3CFB5F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:56:48 +0200 (CEST)
Received: from localhost ([::1]:39142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5qEp-0005jV-Nx
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m5qDg-0004Sl-QW
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:55:36 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:40504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m5qDe-0000Sb-RK
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:55:36 -0400
Received: by mail-io1-xd2e.google.com with SMTP id l5so24055767iok.7
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 06:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kjKyJDlfROePf/MyUlrXl87rjF74/0aCUkWp94jEHU8=;
 b=U1Zp/28bEG7gdj9D81x+/+4TW/e16KAHoyXBOXNDsh59tvXsILPrvqbnp+h3P0MGFj
 djcVxwRTm1eFpWPccOdAJNUnCaE4t9vpilkZ+zwprF9OC3YLD1kYrxXgDv/f+7//WIC2
 b6aOC8TLiUNsM40up+/PiFzgUqlaOug56FJsRO2LNvMe28GumKqclQRG0zTGvqwZ64+c
 fG8IbL+a+EZSN4OuEbVXHO6c2gKeB2AISSm+HGrVXi7g6PsxW1AhqoOLaBUyhRp4LLao
 Kz5vEJbv2AahMlwOc/dHRgc2E+JSiJZU8QPjNcm4Dxpn3sp4MUX1MrBXtMgBrG2OP5+C
 mpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kjKyJDlfROePf/MyUlrXl87rjF74/0aCUkWp94jEHU8=;
 b=fm60nXNnyRbxEJ/q9nx/2eRW+3H811K8BD9oBn2Ta+hiZR0bCG5la+DZjo8jndb7Cq
 /fTgSjSsHPOwk27SilUq6UIoDhPEkqObCMgZMlRTmjwMzkI4iObmQY8ZLS6beVAdMoQJ
 i0RORML/rBWmtHRtamskE4sS57H+NXKBYegi6o3UCBoqfX5QYDnMA9Z9EOZpK/GkS9bS
 mb6KBV450EwgJOOD4bcAywDeDHbkxl2+IyCEX+YAUngw5gwvYfjDB0P05AyZpMdZLbAa
 67L6T4qCKRUXJa4H02P0sBknUqBgtwMYuuz623NzF0hiN2mMGdNdbeJonLzq7I9hbg+U
 EmQQ==
X-Gm-Message-State: AOAM5324b6uQABMglqyp9sQsmZb2K7SqLA4J+ijjHsjoVrJaqoXmmZiS
 uwLOFv7CGvEux9Dp0JK8DX9Mscow3bbFa53h/nw=
X-Google-Smtp-Source: ABdhPJxEYLupnXLjRXpu7BfDI0LOlf7k0UMmfZxuEqRn9rZqqpwTBJEmW280mpwVNzbk8Fm6bK+wN4qxlVkYmuJ1Y9A=
X-Received: by 2002:a05:6638:3292:: with SMTP id
 f18mr27130025jav.120.1626789331860; 
 Tue, 20 Jul 2021 06:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210714112306.67793-1-david@redhat.com>
In-Reply-To: <20210714112306.67793-1-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Tue, 20 Jul 2021 15:55:20 +0200
Message-ID: <CAM9Jb+i=CrXxyStxqP-Z=M0gV8wqy=Ok0C6CsfDVS3XBngn9tg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] util/oslib-posix: Support MADV_POPULATE_WRITE for
 os_mem_prealloc()
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd2e.google.com
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

> #1 adds support for MADV_POPULATE_WRITE, #2 cleans up the code to avoid
> global variables and prepare for concurrency and #3 makes os_mem_prealloc()
> safe to be called from multiple threads concurrently.
>
> Details regarding MADV_POPULATE_WRITE can be found in introducing upstream
> Linux commit 4ca9b3859dac ("mm/madvise: introduce
> MADV_POPULATE_(READ|WRITE) to prefault page tables") and in the latest man
> page patch [1].
>
> [1] https://lkml.kernel.org/r/20210712083917.16361-1-david@redhat.com
>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Marek Kedzierski <mkedzier@redhat.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
>
> David Hildenbrand (3):
>   util/oslib-posix: Support MADV_POPULATE_WRITE for os_mem_prealloc()
>   util/oslib-posix: Introduce and use MemsetContext for
>     touch_all_pages()
>   util/oslib-posix: Support concurrent os_mem_prealloc() invocation
>
>  include/qemu/osdep.h |   7 ++
>  util/oslib-posix.c   | 167 ++++++++++++++++++++++++++++++-------------
>  2 files changed, 126 insertions(+), 48 deletions(-)
>

Nice implementation to avoid wear of memory device for prealloc case
and to avoid touching of
all the memory and abrupt exit of VM because of lack of memory. Instead better
way to populate the page tables with madvise.

Plan is to use this infrastructure for virtio-mem, I guess?

For the patches 1 & 3:
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>


Thanks,
Pankaj

