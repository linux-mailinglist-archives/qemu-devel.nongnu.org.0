Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D634529860
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 05:43:15 +0200 (CEST)
Received: from localhost ([::1]:51708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqo78-0003d9-Pq
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 23:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqo6G-0002nR-Bv; Mon, 16 May 2022 23:42:20 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:46803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqo6E-0005XM-Oe; Mon, 16 May 2022 23:42:19 -0400
Received: by mail-io1-xd36.google.com with SMTP id s23so18005582iog.13;
 Mon, 16 May 2022 20:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mN+WbHy8JRj9m/oJO+IZalzisK3tsX7Jkxb7dfv32Gk=;
 b=QNglemeo3GcLqy8sGZMpyLxbOI+d8bATAdagZGd+smH7/OpHvzL1GqdMHjzEONx0Yc
 O0YR7aR+UInI3hYwwzj7poqeAWuV048ThketbhXWjDTeazLgFvhQNx04hTmnySCHohv8
 eYHSAzs7J3h45Gty+3KT16FDwSjlnQyWyDyaWmhfn6UdHAeccqvJpeNuBQXBTqoSykev
 Jy0Y6t8yk9sl0GZBdGcB0DlhKYiFAs6qab8N9tB4U0NJJ/5+n+4o9saFZHAzvN4Uc4/J
 kFvRD3PekCR6d+uJxSqcIyZI+kkzlWaho9ZxlPBhCuiavzkZ1OYKwvM5JC2w4/rGJVPC
 OVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mN+WbHy8JRj9m/oJO+IZalzisK3tsX7Jkxb7dfv32Gk=;
 b=VZu6AGiq3iUlldeaHjoH4eR0ALmDLrc1/h2jk0Qs22jxBGxnr5xjq7//qJXjAZ3EkF
 YlLNqg9osR0c9Q936OFI8SauEXZAEtVywa4BPOWntJTEAI61EnEIvu2vNRs7y+ph8AS8
 hbK9TP7ZIrLLXAgVE4d+1moxyDcb0juHqOtf5U8AnPrHh+Ol1h4NtcrUakNfJj+XJjDE
 6Ih0UYKMYVLEK4q8WCAXCHmaQTCmZl/RFW7Qea4OkHPKphG1RYswm2K/3+l7fceXZ+kh
 XLB7R6Y5CC23UFXe7xD/lU0YXwcZT3xP5CqJPIDo6uc+Ginnj1Sy2eEkgbRY9756enA4
 98Wg==
X-Gm-Message-State: AOAM531UjAc44tQvQR5yRXAw6Ls7xT9mFqb1Ghph2tM9GQjWZbzkTw+p
 GIIPIdjqo1pU3plwSCcIObA2C/ZuinmEWh0oKBw=
X-Google-Smtp-Source: ABdhPJxajN+F7WwAy0sdTBLVpzQY9mkFQDzP9bWJiQpdAukp5WOB1r86CTZbapiuH6VDBrWUY860fnLOOUtW8L+IVGk=
X-Received: by 2002:a05:6638:3711:b0:32b:ca0b:8a32 with SMTP id
 k17-20020a056638371100b0032bca0b8a32mr11337920jav.267.1652758937258; Mon, 16
 May 2022 20:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220301225220.239065-1-shentey@gmail.com>
In-Reply-To: <20220301225220.239065-1-shentey@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 13:41:51 +1000
Message-ID: <CAKmqyKP52UZkjez9YyToZqWbOKyJ_xgAZK0NTpE--Z=DRMea=A@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/2] Resolve some redundant property accessors
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Wed, Mar 2, 2022 at 8:54 AM Bernhard Beschow <shentey@gmail.com> wrote:
>
> No changes. Just also CC'ed to qemu-trivial.
>
> The QOM API already provides appropriate accessors, so reuse them.
>
> Testing done:
>
>   :$ make check
>   Ok:                 570
>   Expected Fail:      0
>   Fail:               0
>   Unexpected Pass:    0
>   Skipped:            178
>   Timeout:            0
>
>
> Bernhard Beschow (2):
>   hw/vfio/pci-quirks: Resolve redundant property getters
>   hw/riscv/sifive_u: Resolve redundant property accessors

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/riscv/sifive_u.c  | 24 ++++--------------------
>  hw/vfio/pci-quirks.c | 34 +++++++++-------------------------
>  2 files changed, 13 insertions(+), 45 deletions(-)
>
> --
> 2.35.1
>
>

