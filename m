Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DE5297769
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 20:59:58 +0200 (CEST)
Received: from localhost ([::1]:51048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kW2I9-0001HG-NI
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 14:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kW2HF-0000qQ-Te
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 14:59:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kW2HE-0004Gv-64
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 14:59:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603479538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z0ERfPDBeON1CBGOrcMEG6BnnuGL35+RXrnbVQq5hZM=;
 b=fx6nKYebq3NE2+pjOIF6lzAqtZKABHo/pqg59E9VFcypYC8PjhemBlcSmEoTWno7e5aQfo
 Q3ZqTCNKaIS+WOjP7Mt3g0sdU0p5KFAvf4hE25TnwpKEbB+XpoY4AMCGR3jqsDvRyDUmm7
 9NeS3YFf0chJl4GPabyLCBZ9wq2/Kyc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-Z5i9wYn2NUKFisf-NhH6Uw-1; Fri, 23 Oct 2020 14:58:57 -0400
X-MC-Unique: Z5i9wYn2NUKFisf-NhH6Uw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44EAB1009E2D;
 Fri, 23 Oct 2020 18:58:56 +0000 (UTC)
Received: from localhost (unknown [10.40.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC4306EF41;
 Fri, 23 Oct 2020 18:58:44 +0000 (UTC)
Date: Fri, 23 Oct 2020 20:58:43 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 2/4] microvm: make pcie irq base runtime configurable
Message-ID: <20201023205843.0051f7d7@redhat.com>
In-Reply-To: <20201016114328.18835-3-kraxel@redhat.com>
References: <20201016114328.18835-1-kraxel@redhat.com>
 <20201016114328.18835-3-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Oct 2020 13:43:26 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/i386/microvm.h |  2 +-
>  hw/i386/microvm.c         | 11 ++++++-----
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
> index 0154ad5bd707..ede9625756b8 100644
> --- a/include/hw/i386/microvm.h
> +++ b/include/hw/i386/microvm.h
> @@ -63,7 +63,6 @@
>  #define PCIE_MMIO_SIZE        0x20000000
>  #define PCIE_ECAM_BASE        0xe0000000
>  #define PCIE_ECAM_SIZE        0x10000000
> -#define PCIE_IRQ_BASE         12
>  
>  /* Machine type options */
>  #define MICROVM_MACHINE_PIT                 "pit"
> @@ -93,6 +92,7 @@ struct MicrovmMachineState {
>      bool auto_kernel_cmdline;
>  
>      /* Machine state */
> +    uint32_t pcie_irq_base;
>      uint32_t virtio_irq_base;
>      uint32_t virtio_num_transports;
>      bool kernel_cmdline_fixed;
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index eaf5da31f7e1..638e95c39e8c 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -180,6 +180,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
>      mms->virtio_irq_base = 5;
>      mms->virtio_num_transports = 8;
>      if (x86_machine_is_acpi_enabled(x86ms)) {
> +        mms->pcie_irq_base = 12;
>          mms->virtio_irq_base = 16;
>      }
>  
> @@ -213,12 +214,12 @@ static void microvm_devices_init(MicrovmMachineState *mms)
>          mms->gpex.mmio32.size = PCIE_MMIO_SIZE;
>          mms->gpex.ecam.base   = PCIE_ECAM_BASE;
>          mms->gpex.ecam.size   = PCIE_ECAM_SIZE;
> -        mms->gpex.irq         = PCIE_IRQ_BASE;
> +        mms->gpex.irq         = mms->pcie_irq_base;
>          create_gpex(mms);
> -        x86ms->pci_irq_mask = ((1 << (PCIE_IRQ_BASE + 0)) |
> -                               (1 << (PCIE_IRQ_BASE + 1)) |
> -                               (1 << (PCIE_IRQ_BASE + 2)) |
> -                               (1 << (PCIE_IRQ_BASE + 3)));
> +        x86ms->pci_irq_mask = ((1 << (mms->pcie_irq_base + 0)) |
> +                               (1 << (mms->pcie_irq_base + 1)) |
> +                               (1 << (mms->pcie_irq_base + 2)) |
> +                               (1 << (mms->pcie_irq_base + 3)));
>      } else {
>          x86ms->pci_irq_mask = 0;
>      }


