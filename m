Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05BB2F34FC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 17:04:28 +0100 (CET)
Received: from localhost ([::1]:42018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzM9j-00005O-QB
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 11:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzM8L-0007Fz-In
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:03:01 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:40525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzM8J-0002yf-T3
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:03:01 -0500
Received: by mail-ej1-x634.google.com with SMTP id f4so3156145ejx.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fvvAvkfzomGmZkcpTZmyW/lMBUyS96cULmvrvWiRkg4=;
 b=wCK8OBupFFvppyGpZy/MXqm1Nd0/LNX/yjmXycJJuT8LKRkrckg+m4szR0x6zr5WNJ
 HLG7JpjrpNAz6Z0Sf6KcsmvlkLV6wRvRbmB0oZI9m5t6zWYkoYn2yQRHo6ruZqt26bY3
 Y3iaHU+s5+2QUHol45tlQOOP1BTbnGkD0zPT9DPMvKATOQVy5QGa8uW9Ld8Zl6cnkSHa
 xuLOlj4pFysU57YpTBK4cmvSEMRvlED4oH0o/H2kH1lUTmTm5tPrLQAFaTG5X3+pGh03
 k2MYKjRFKv6Ndwo4Hz6csyC1BDa39LaFXME1Pa7znlB+AXQGrZJhWhr6Paqq5Hfz6JSN
 8apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fvvAvkfzomGmZkcpTZmyW/lMBUyS96cULmvrvWiRkg4=;
 b=BMBk9PGKX6NNjYyoUfMU4XcTwIuzhThYac7STrrIgxkwH0m5ozvkV5MyuBC+G43DZh
 XaSVHVJbYMrNDXq8O3DDbATeiyGW4r2jf8SzNyydvqHVnNaF3GedoVzpfqZYQMOaRDqo
 sYJrfq2shUatyAU79lc7CoWRDcti+yfFezPHJEamx3zLe8fQB0aRRkL7eWegWbrUdcng
 DTmCvULd1ZQxbdsKTmXHCIj/orjzOznfkHD8l2iYfAYm3bw4ZaEZQbDlGHdDSeHfPV6F
 HTWyN440bkBU/ANKkghkg+6VVMu0egJwR9v5dbhCgVJwuiJnOa0b27JcsCKafqwBV5A5
 6cRw==
X-Gm-Message-State: AOAM531GAvN51nomTmQhmTZ4xio8N03SxJr5p5GnByrG2Z/AN9Rk35ha
 hlivjz3AZDQxqQ4E0xLwKxZ8aKJl6TT56xl4jEzqlQ==
X-Google-Smtp-Source: ABdhPJyoTy74QJB5i3xe0kyRRoR3JgHzV12mKBdpx/NlZIExiDddIOuZJXtYPuaBt3JZrHjXqbti32Nv93RXgCLAb1Y=
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr3583739ejb.382.1610467378468; 
 Tue, 12 Jan 2021 08:02:58 -0800 (PST)
MIME-Version: 1.0
References: <SYCPR01MB3502B0D05FEB1ED21532219EFCAA0@SYCPR01MB3502.ausprd01.prod.outlook.com>
In-Reply-To: <SYCPR01MB3502B0D05FEB1ED21532219EFCAA0@SYCPR01MB3502.ausprd01.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 16:02:47 +0000
Message-ID: <CAFEAcA9Wpc_-pcwGU+=MbRpEb5x5=qPsBP2APvdRe4gK6+WAVA@mail.gmail.com>
Subject: Re: [RFC PATCH] rtl8139: fix stack overflow if RxBuf overlaps MMIO
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_DOTEDU=1.999 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Jan 2021 at 15:23, Qiuhao Li <Qiuhao.Li@outlook.com> wrote:
>
> Fix Bug 1910826 [1] / OSS-Fuzz Issue 29224 [2].
>
> In rtl8139.c, the function rtl8139_RxBuf_write, which sets the RxBuf
> (Receive Buffer Start Address), doesn't check if this buffer overlaps our
> MMIO region. So if the guest machine set the transmit mode to loopback, put
> the RxBuf at the address of TSD (Transmit Status of Descriptor, MMIO), and
> trigger a frame transfer by directly writing to the TSD, an infinite
> recursion will occur:
>
> rtl8139_ioport_write (to TSD) -> rtl8139_io_writel -> rtl8139_transmit ->
> rtl8139_transmit_one -> rtl8139_transfer_frame -> rtl8139_do_receive ->
> rtl8139_write_buffer -> pci_dma_write (to TSD) -> ... ->
> rtl8139_ioport_write (to TSD)
>
> This patch adds a check to ensure the maximum possible RxBuf [3] won't
> overlap the MMIO region.
>
> P.S. There is a more concise reproducer with comments [4], which may help :)
>
> [1] https://bugs.launchpad.net/bugs/1910826
> [2] https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=29224
> [3] https://www.cs.usfca.edu/~cruse/cs326f04/RTL8139D_DataSheet.pdf
>     5.7 Transmit Configuration Register
> [4] https://bugs.launchpad.net/qemu/+bug/1910826/comments/1
>
> Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> Reported-by: Alexander Bulekov <alxndr@bu.edu>

This looks like a single-device workaround for the generic
class of problems where a device can be configured to
do DMA to itself. Why is rtl8139 special ?

(I have on my todo list to think about the general problem.)

thanks
-- PMM

