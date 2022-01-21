Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614E24957B0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 02:26:06 +0100 (CET)
Received: from localhost ([::1]:50820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAigm-0006l8-VE
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 20:26:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAhNP-00041N-IX
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 19:01:59 -0500
Received: from mail-io1-f46.google.com ([209.85.166.46]:44700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAhNN-0006Uu-KW
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 19:01:59 -0500
Received: by mail-io1-f46.google.com with SMTP id h23so8887996iol.11
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 16:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G6v/b/MRjMRdrFC8BdxiFC7eN0m0kKtsi0UpFXILxnE=;
 b=6IYsNAJQyVakLQUfAIT+wL3+uNAQANiI/167S+tN07eY8H/oBLy3QArE5Lxr39ievF
 FKE1+nDrNVLjOOY4U68NRrCQ9goz/ApmD602FkYfu0rI+6jTx5ZGMTvVoJeBP8ExTxKB
 DTGz6bQzmiEp5mrXjQ1+fNT8ghCUaC+rotHncQNqjybQ+9w29IKAL3QCVFoSlPbnWJhB
 KliziBAj0BWieouLFPbNs8t9Vnh3jonpoQilkIjjAlRi0LJ/RrxmTKp1s9CpFOxvPx8d
 1KEklphRS7R1pui8ZbmorYp6b8IAIal0zXXY37bJ72LrL5Tu31HQ8RNKwJnEqYAKKDUo
 OUFQ==
X-Gm-Message-State: AOAM531vPtWjSWnOb0DAFFv5RQXnGCEEm6+I5Odq7uYvgzAxecg0ZrSp
 hTnkaNTXGeECYUQ89L6ErCRYEAmhI8cHNACrXzk=
X-Google-Smtp-Source: ABdhPJzSRg9Pc+F5BmatIth0Hj1mmYV29bFrWbU5JjrD1ybWg0Lt6KyFae4v1dlJ151PzJBs/YNcZQdpOu/+AcyVGnQ=
X-Received: by 2002:a02:a818:: with SMTP id f24mr583097jaj.125.1642723316688; 
 Thu, 20 Jan 2022 16:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20220120092715.7805-1-ptesarik@suse.com>
In-Reply-To: <20220120092715.7805-1-ptesarik@suse.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 21 Jan 2022 10:01:30 +1000
Message-ID: <CAKmqyKPrbrzdmNZ0g4ANZz-zPT=LZpjxPKAu+RoUPsXabiZG4Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] Allow setting up to 8 bytes with the generic loader
To: Petr Tesarik <ptesarik@suse.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.46; envelope-from=alistair23@gmail.com;
 helo=mail-io1-f46.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

