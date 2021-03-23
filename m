Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F97346958
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:54:17 +0100 (CET)
Received: from localhost ([::1]:35166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOn6W-0000LQ-4c
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lOn3v-00075h-Hk
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 15:51:35 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:34663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lOn3t-0005IP-72
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 15:51:35 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so20689566otn.1
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 12:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bdiVP/e/KEsbVTkrtmo38rRq5Kmjg+5xcyyjgiV0pp4=;
 b=2D6cs3GCD14JC2hYt3MsiTSXHFBkKaL3w8EONCU6LCW+Fmfr9TzUAbhOtGTWIyqxkA
 7wtuN2D+JMq59dElBS6tv8Te6RFI8R4Ot+TlzuWyAN6wJNp4KLIWfdVUu57NTZNVBRxv
 G275UO0c0YeXdj14L1zk2WzgERWSQS/nshvcVmirbDtYCa64H11XTdVTrRLW2kQJvu+w
 vmVl4YMM4DouMYFHHScQYEEZGkX/f10XlRnVZ1N4BTiwHhvIBd2oSZn1uv2MWSx3zp27
 kCsI6Pzz0axcfm9eYbO043bfsHsnwcNFKM+Z8R0da1/yj9sdEAaSVaqWLcmSV8nxzYiC
 XWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bdiVP/e/KEsbVTkrtmo38rRq5Kmjg+5xcyyjgiV0pp4=;
 b=ns6pWCHOtB0o4soYg6Z75p3DmdgXeVZqGfHUdPeFOnYmVPnG7ESsaeIIt2O2yFE2rj
 b5h8qpyB3CIKu3RMqHomcioa1GkzvVWwFEbAAhwlmGV+Hyfe8Q1K4T7HYmPMW4M+Ts1p
 r4krqAENbFharbwW8dKSj6sS8i6lmPOo7U1fTbWUczVDFx1HI2veavC3kNLw9p1UesTd
 F/9Lz+ovafvgxsyq0fqgDHsA/qlcnh2rtd2DyQ38O5doKfS0eKlOVTZF0rsQ8FQ44m//
 SdoqRBuSqFrekvE9Uiy30y5vwTLcrfPit4ZemnZIWkWeh2sQum8f55QJg9Zrqn6r4obf
 ahfQ==
X-Gm-Message-State: AOAM5337b6Un8FuL2vVBjT2bhhAcTVTVwozwSQu1ccaOYLhU9gjU6Twk
 x5XfbobGAlXlYvoh25mVgy1OCOYE7M5lgOCUthMhTHSE/cQ=
X-Google-Smtp-Source: ABdhPJxqFvhU4Ayk3HXYNxKGPg6Wgz55ZWnYXyopMeDZUNnEb5e6sh6gDc5oOnU3Lc7MWAJJVJSEtru7g/8PU+U6eYs=
X-Received: by 2002:a9d:7dc5:: with SMTP id k5mr5989285otn.220.1616529091053; 
 Tue, 23 Mar 2021 12:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210315115937.14286-1-yuri.benditovich@daynix.com>
 <20210315115937.14286-2-yuri.benditovich@daynix.com>
In-Reply-To: <20210315115937.14286-2-yuri.benditovich@daynix.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Tue, 23 Mar 2021 21:51:19 +0200
Message-ID: <CAOEp5OcKfW0PBi2aejnvk_pD9nbdUoVAhC66t3KLa+5uw=1jrg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] virtio-pci: add check for vdev in
 virtio_pci_isr_read
To: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::32a;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping


On Mon, Mar 15, 2021 at 1:59 PM Yuri Benditovich
<yuri.benditovich@daynix.com> wrote:
>
> https://bugzilla.redhat.com/show_bug.cgi?id=1743098
> This commit completes the solution of segfault in hot unplug flow
> (by commit ccec7e9603f446fe75c6c563ba335c00cfda6a06).
> Added missing check for vdev in virtio_pci_isr_read.
> Typical stack of crash:
> virtio_pci_isr_read ../hw/virtio/virtio-pci.c:1365 with proxy-vdev = 0
> memory_region_read_accessor at ../softmmu/memory.c:442
> access_with_adjusted_size at ../softmmu/memory.c:552
> memory_region_dispatch_read1 at ../softmmu/memory.c:1420
> memory_region_dispatch_read  at ../softmmu/memory.c:1449
> flatview_read_continue at ../softmmu/physmem.c:2822
> flatview_read at ../softmmu/physmem.c:2862
> address_space_read_full at ../softmmu/physmem.c:2875
>
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> ---
>  hw/virtio/virtio-pci.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 883045a223..4a3dcee771 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1364,9 +1364,14 @@ static uint64_t virtio_pci_isr_read(void *opaque, hwaddr addr,
>  {
>      VirtIOPCIProxy *proxy = opaque;
>      VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> -    uint64_t val = qatomic_xchg(&vdev->isr, 0);
> -    pci_irq_deassert(&proxy->pci_dev);
> +    uint64_t val;
> +
> +    if (vdev == NULL) {
> +        return 0;
> +    }
>
> +    val = qatomic_xchg(&vdev->isr, 0);
> +    pci_irq_deassert(&proxy->pci_dev);
>      return val;
>  }
>
> --
> 2.17.1
>

