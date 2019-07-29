Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236DB793A2
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 21:16:12 +0200 (CEST)
Received: from localhost ([::1]:55882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsB7y-0004fl-Sc
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 15:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34175)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hsB7Q-00049g-PG
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 15:15:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hsB7P-0001uU-RX
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 15:15:36 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:46892)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hsB7P-0001u8-N6
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 15:15:35 -0400
Received: by mail-vs1-f68.google.com with SMTP id r3so41677678vsr.13
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 12:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZXIfzZBRd9GiFv716/4nC1U3+XaF3C68wPO3XhhO6T0=;
 b=dC2hjmv7Za37ZkA8yxofUmZ1XlkOiHTrrqJdGr6v0W3pXQX1LGGq6Wq1LRSgXtiuLa
 g7Bhp4zsCNQNyGBDNh8O14CTAcoFtNjYLLKddi7lWH7jrppg8IhtVFM7kv83tunYfneG
 UfEC3r+USHNW4YgRscWl3FG54M5Fw+LuQ/CVRmzLgt+T5WeXCZ4m/LtpABYT2G322oUF
 MNUgZ+NUGOktFAhtOeQv0nYgg3llkQNqLgk3wGK7YVNHAJzy95cRIR6mQstwcye6SEWY
 TEKxUs/lf0L29a9jXwlSLAbgNq9vFzI6LIYFoSDs2iRjWSzUJtSablyK95Z6DQthXmHO
 X6lw==
X-Gm-Message-State: APjAAAWkc7caiRw879zdwYzUWi7xNGm+WMSU4Jcw2LhmRxiVozUBEuFh
 IOZUBLPH7ohxGwBcoGDC1bH9IA==
X-Google-Smtp-Source: APXvYqydq+QVCxOPJuqfR0aMUcoCrwZnxuBzu8Pj4c9tye/bmmnRSV4Yey52XEtVeSs6pQ8uc4oUsA==
X-Received: by 2002:a67:61c7:: with SMTP id
 v190mr18455980vsb.165.1564427735207; 
 Mon, 29 Jul 2019 12:15:35 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
 by smtp.gmail.com with ESMTPSA id
 o9sm40578999vkd.27.2019.07.29.12.15.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 12:15:34 -0700 (PDT)
Date: Mon, 29 Jul 2019 15:15:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Message-ID: <20190729151504-mutt-send-email-mst@kernel.org>
References: <156418830210.10856.17740359763468342629.stgit@gimli.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156418830210.10856.17740359763468342629.stgit@gimli.home>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.217.68
Subject: Re: [Qemu-devel] [for-4.2 PATCH 0/2] PCI DMA alias support
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
Cc: brijesh.singh@amd.com, qemu-devel@nongnu.org, zhexu@redhat.com,
 eric.auger@redhat.com, Suravee.Suthikulpanit@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 26, 2019 at 06:55:27PM -0600, Alex Williamson wrote:
> Please see patch 1/ for the motivation and utility of this series.
> This v1 submission improves on the previous RFC with revised commit
> logs, comments, and more testing, and the missing IVRS support for DMA
> alias ranges is now included.  Testing has been done with Linux guests
> with both SeaBIOS and OVMF with configurations of intel-iommu and
> amd-iommu.  Intel-iommu testing includes device assignment, amd-iommu
> is necessarily limited to emulated devices with interrupt remapping
> disabled and iommu=pt in the guest (enabling interrupt remapping or
> disabling guest passthrough mode fails to work regardless of this
> series).  This series is NOT intended for QEMU v4.1.  Thanks,
> 
> Alex


series looks good to me.
pls ping when 4.1 is out and I'll queue it.

> ---
> 
> Alex Williamson (2):
>       pci: Use PCI aliases when determining device IOMMU address space
>       hw/i386: AMD-Vi IVRS DMA alias support
> 
> 
>  hw/i386/acpi-build.c |  127 +++++++++++++++++++++++++++++++++++++++++++++++---
>  hw/pci/pci.c         |   43 ++++++++++++++++-
>  2 files changed, 160 insertions(+), 10 deletions(-)

