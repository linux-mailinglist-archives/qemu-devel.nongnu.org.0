Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B3E497656
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 00:31:48 +0100 (CET)
Received: from localhost ([::1]:51292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBmKp-0004sw-3O
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 18:31:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nBmJc-00044l-IO
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 18:30:35 -0500
Received: from mail-io1-f50.google.com ([209.85.166.50]:45772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nBmJZ-00051E-OM
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 18:30:31 -0500
Received: by mail-io1-f50.google.com with SMTP id s18so936752ioa.12
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 15:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D/FixJ+ZZpfIz4HCqvot5omn5HVb89i7GbDyJvjx4l8=;
 b=g+nsqup9oEnwd2WWBQ+nV1H8aZ8smftHgLMcrGaLdAiOpxGNp36rfmWH4c6eoFsVXZ
 oxHofUz+oexydd8qHDxLDqJ5CK9pesfRWLXd/PNRaBW+gXeaSaCxRSgr2aOdnX4Tuwa/
 mRcrJinYcWepmAYuOzfe9d9EJOthTURRXWdFcGFTrX5wr103uOnT8SLwZIzG0uGj7kHi
 qz+2bRKPYo7VGJepSIm33mna+fU0zBhLefjpC04jIgN5SqtVw0qdUCqrRLulJkitQMe/
 WEI/eib/03JypTVgx8M0BMto2zj7kX6uFL22OY5He3ERCxrbBGdw/8+ra3uth5k6xVwR
 ZTAw==
X-Gm-Message-State: AOAM531jHJSn/DkDkpJk73Ky7lsMS+gHLA6WIYscqLm9vybqcXDkYKzB
 hXvWNyXHfmrA9HtuxLU3U2AL83fHb//ZU0k1FFA=
X-Google-Smtp-Source: ABdhPJwW7RgAED+A5Ut5W9kDB1asGPZy+GCG0g1g0jZ5wkWLGJGc1vdBy/15udq8M88kqw4vskRV/HJNdvhkFws/LrY=
X-Received: by 2002:a02:5b0a:: with SMTP id g10mr5449809jab.169.1642980628780; 
 Sun, 23 Jan 2022 15:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20220120092715.7805-1-ptesarik@suse.com>
In-Reply-To: <20220120092715.7805-1-ptesarik@suse.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 24 Jan 2022 09:30:03 +1000
Message-ID: <CAKmqyKM4pAx421K70GNHAAo+_+=Fxdx1fT30PPEM_rgZbKhEwg@mail.gmail.com>
Subject: Re: [PATCH 1/1] Allow setting up to 8 bytes with the generic loader
To: Petr Tesarik <ptesarik@suse.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.50; envelope-from=alistair23@gmail.com;
 helo=mail-io1-f50.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 7:57 PM Petr Tesarik <ptesarik@suse.com> wrote:
>
> The documentation for the generic loader says that "the maximum size of
> the data is 8 bytes". However, attempts to set data-len=8 trigger the
> following assertion failure:
>
> ../hw/core/generic-loader.c:59: generic_loader_reset: Assertion `s->data_len < sizeof(s->data)' failed.
>
> The type of s->data is uint64_t (i.e. 8 bytes long), so I believe this
> assert should use <= instead of <.
>
> Fixes: e481a1f63c93 ("generic-loader: Add a generic loader")
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/core/generic-loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index 9a24ffb880..504ed7ca72 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -56,7 +56,7 @@ static void generic_loader_reset(void *opaque)
>      }
>
>      if (s->data_len) {
> -        assert(s->data_len < sizeof(s->data));
> +        assert(s->data_len <= sizeof(s->data));
>          dma_memory_write(s->cpu->as, s->addr, &s->data, s->data_len,
>                           MEMTXATTRS_UNSPECIFIED);
>      }
> --
> 2.31.1
>
>

