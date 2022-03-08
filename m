Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00654D1310
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 10:08:48 +0100 (CET)
Received: from localhost ([::1]:60766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRVpn-0007aU-FG
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 04:08:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRVmo-000684-C2
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:05:45 -0500
Received: from [2607:f8b0:4864:20::b2e] (port=40796
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRVmm-00063k-Go
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:05:41 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id e186so36413178ybc.7
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 01:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jnqMJsqRxnWJumafq2zGYIZ5YJ8JaxshVzva6gyg5g4=;
 b=FQoSJnxEPO2+J7q7lKe3dHd63/h2LTfj2SX14dxuHua5T2X3FVb1lfc6PI6wX/kquh
 LgHYUX9XCw2ZxMRgvRBUf8qg/5qH+bPP8c/sL7QTWir73iMhd8R9INgMZZ/GPTluydov
 H7VpHfDbUhsj2go5afdx3br9JzYFlAvThzEXPURnAwJlB4wJzaQq7r5elR+N7CKQBaOs
 LX8ZCqAcjJ/H74oc/n8vhO77SwCvQFoKMmRVSKHLREB/DZXT3yrq10LDNiYuo9CN9ZZ+
 zayJxFClQWEcgXeabaHfLv/yK28za0CBrDnT9VJXf9eyCp5odacJ2kY8Ba1DQkK7VHg+
 CAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jnqMJsqRxnWJumafq2zGYIZ5YJ8JaxshVzva6gyg5g4=;
 b=jdpNkP2dvNtk7/DwB1HKiOFOAU1ar0hI+B3BpBfA8hdxJ/muSte1A4u2ny/LrkTtgD
 V7yOPZzYEbkN1NyYA1GgcTNHQ52X1BPmGQm0bRVvCeHa1VbaNsOoAXKT9J8K0mjVQQKm
 dLqjEYsEs0hF2jxhnr1/rKKRA+2wgBhNU8YL5xdyLnfjDiMvuG548uQTyhV96p2GLv32
 e0e40htI5L/zj+tHU1bF6aQSl6MBn0ciR+LLbMixBFKtIW9Rn9+Af6KNH07Sotppy10V
 dDFh/W+8JdgwgFHRnEaf6dgD7spoJ5w9fbEUQV8899/0O9FrFv9L40bFIZI6DGjwTMQh
 aBkQ==
X-Gm-Message-State: AOAM531Lh4rVj43Lf0I8hy6OTWo33+7J1QmSKuzX6GEZC9lVZl4k5nts
 eVh83oVCIQDdAs32R0fbKIfY9Exy84Qy/A3H2AMWgg==
X-Google-Smtp-Source: ABdhPJzloaoeihHOnycCEAk5oMo8ZznUStFagTty43Ns18ZoCFEEH0/a4+369xYUj7omPE+vcZi54+UJDyx0ZNguJ1Q=
X-Received: by 2002:a25:32c6:0:b0:629:130:a037 with SMTP id
 y189-20020a2532c6000000b006290130a037mr11114177yby.193.1646730339469; Tue, 08
 Mar 2022 01:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20220307100058.449628-1-mst@redhat.com>
 <CAFEAcA94Uu=kyinf+pLUT2cY05326EDX=TKUeiSJH_aEY-kPVg@mail.gmail.com>
 <CAFEAcA_wO6dkr6=HUYsOS7RxGErrAvsNnNqhKfM733Q=4v6cdw@mail.gmail.com>
 <20220307174713-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220307174713-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 09:05:27 +0000
Message-ID: <CAFEAcA9qUMuDupNRCYeH5rzBY+J7D3XXN_92PJjhBYxF70kF=w@mail.gmail.com>
Subject: Re: [PULL v2 00/47] virtio,pc,pci: features, cleanups, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Mar 2022 at 22:52, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Mar 07, 2022 at 05:13:16PM +0000, Peter Maydell wrote:
> > Also fails on cross-win64-system:
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/2172339938
> >
> > ../hw/virtio/virtio.c: In function 'qmp_x_query_virtio_vhost_queue_status':
> > ../hw/virtio/virtio.c:4358:30: error: cast from pointer to integer of
> > different size [-Werror=pointer-to-int-cast]
> > 4358 | status->desc = (uint64_t)(unsigned long)hdev->vqs[queue].desc;
> > | ^
> > ../hw/virtio/virtio.c:4359:31: error: cast from pointer to integer of
> > different size [-Werror=pointer-to-int-cast]
> > 4359 | status->avail = (uint64_t)(unsigned long)hdev->vqs[queue].avail;
> > | ^
> > ../hw/virtio/virtio.c:4360:30: error: cast from pointer to integer of
> > different size [-Werror=pointer-to-int-cast]
> > 4360 | status->used = (uint64_t)(unsigned long)hdev->vqs[queue].used;
> > | ^
> > cc1: all warnings being treated as errors

> I dropped these for now but I really question the value of this warning,
> as you can see the reason we have the buggy cast to unsigned long
> is because someone wanted to shut up the warning on a 32 bit system.
>
> Now, I could maybe get behind this if it simply warned about a cast that
> loses information (cast to a smaller integer) or integer/pointer cast
> that does not go through uintptr_t without regard to size.

This *is* warning about losing information. On 64-bit Windows
pointers are 64 bits but 'long' is 32 bits, so the path
pointer -> long -> uint64_t drops the top half of the pointer.

thanks
-- PMM

