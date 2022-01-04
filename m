Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD274483E7E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:53:03 +0100 (CET)
Received: from localhost ([::1]:59570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fZ0-000621-JA
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:53:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4fXC-00058O-Aq
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 03:51:10 -0500
Received: from mail-yb1-f175.google.com ([209.85.219.175]:34427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4fXA-0007JI-RO
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 03:51:10 -0500
Received: by mail-yb1-f175.google.com with SMTP id k69so90344141ybf.1
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 00:51:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iq6T4ULwtBOOokpwJbB+hw+HCsyIyD+2nSARaZWLJBg=;
 b=pSyEnjKtZrFhHFyJZD+sOIpI6n12MSiGZDjGuGRAgaQH11imWSPreR1r0A2ueT+2s0
 nviP14OKqUCOKf2o2clDoYuUv9Emf1SBPFhEZQHeECe91N72bpa1WQ5Pk+lEdfqJNiW6
 aGOgIladt1bha6DUvvbnVlDNdDRxBj7clV2zDmfv24LjzHd1v+ik0eklsf3hHBHL3xp1
 r4FKp3RGHys6d5ljM6bBCKdTm8hlpTKSO7IRh6WGBnexOGrXtGEUgmmhUx7Wqxsu9QI8
 uyaRu3Us79oJHfTkFGjsK018ZzzYnk0lnSGpE7op3gTWj9U4P0m8ybC1ayrH14H0gRfA
 j0JQ==
X-Gm-Message-State: AOAM532dFpZ5beQ+iiM94SSOWwkoypC5ni0J6SQ4dQNS7M1UDin1Fw4G
 Owmekf7mAYh3WrRnOWM5fAa3xDWuJE17xeHB7ns=
X-Google-Smtp-Source: ABdhPJxoIibp65xrMykgOMVxmzsweMIOI+kLTdAVBOWbVA8E/Ls3W4pqgkiRZseYDFPgRyr2BIZjYYLGNiB8uPUl5BU=
X-Received: by 2002:a05:6902:1022:: with SMTP id
 x2mr40459176ybt.229.1641286267925; 
 Tue, 04 Jan 2022 00:51:07 -0800 (PST)
MIME-Version: 1.0
References: <20211231114901.976937-1-philmd@redhat.com>
 <20211231114901.976937-8-philmd@redhat.com>
 <8be25e98-6870-a492-b21e-a650f9d847c9@redhat.com>
In-Reply-To: <8be25e98-6870-a492-b21e-a650f9d847c9@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 4 Jan 2022 09:50:56 +0100
Message-ID: <CAAdtpL65OK=ys1+CThxnaHRrW+cTOjfqRE3PJzh0aa0Yn6d7rQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] hw/dma: Introduce dma_size_t type definition
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.219.175;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f175.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 3, 2022 at 11:22 AM David Hildenbrand <david@redhat.com> wrote:
> >  /*
> >   * When an IOMMU is present, bus addresses become distinct from
> >   * CPU/memory physical addresses and may be a different size.  Because
> > @@ -39,9 +28,22 @@ struct QEMUSGList {
> >   * least most) cases.
> >   */
> >  typedef uint64_t dma_addr_t;
> > +typedef uint64_t dma_size_t;
>
> This is a bit inconsistent with other address types (hwaddr,
> ram_addr_t), no?

Indeed.

> -> git grep "_size_t"
>
> What sticks out are "external" mach_vm_size_t and png_size_t.
>
> To me, it logically makes sense that both types are equal, because we're
> operating on the same address space (with the same size).
>
> So at least I don't see the benefit here, but I'd love to be enlightened  :)

No, you are right, I was not convinced either. I'll stick to dma_addr_t.

