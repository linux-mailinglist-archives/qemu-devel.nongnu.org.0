Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4287FBF27C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 14:06:01 +0200 (CEST)
Received: from localhost ([::1]:34814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDSWz-0003mn-6l
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 08:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60503)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iDSVl-0003ET-Ma
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 08:04:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iDSVj-0001yq-2h
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 08:04:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45558)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iDSVh-0001tE-6a
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 08:04:38 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 23BF311A29;
 Thu, 26 Sep 2019 12:04:32 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-127.ams2.redhat.com [10.36.116.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C55060923;
 Thu, 26 Sep 2019 12:04:05 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v3 11/22] libqos: split qos-test and libqos
 makefile vars
To: "Oleinik, Alexander" <alxndr@bu.edu>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20190918231846.22538-1-alxndr@bu.edu>
 <20190918231846.22538-12-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat
Message-ID: <e41ee963-bfcf-bb73-ee28-8991293241a2@redhat.com>
Date: Thu, 26 Sep 2019 14:04:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918231846.22538-12-alxndr@bu.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 26 Sep 2019 12:04:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "bsd@redhat.com" <bsd@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/09/2019 01.19, Oleinik, Alexander wrote:
> Most qos-related objects were specified in the qos-test-obj-y variable.
> qos-test-obj-y also included qos-test.o which defines a main().
> This made it difficult to repurpose qos-test-obj-y to link anything
> beside tests/qos-test against libqos. This change separates objects that
> are libqos-specific and ones that are qos-test specific into different
> variables.
> 
> Signed-off-by: Alexander Oleinik <alxndr@bu.edu>
> ---
>  tests/Makefile.include | 70 ++++++++++++++++++++++--------------------
>  1 file changed, 36 insertions(+), 34 deletions(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index a9b3c36259..da665ca7eb 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -687,51 +687,53 @@ tests/test-crypto-block$(EXESUF): tests/test-crypto-block.o $(test-crypto-obj-y)
>  
>  libqgraph-obj-y = tests/libqos/qgraph.o
>  
> -libqos-obj-y = $(libqgraph-obj-y) tests/libqos/pci.o tests/libqos/fw_cfg.o
> -libqos-obj-y += tests/libqos/malloc.o
> -libqos-obj-y += tests/libqos/libqos.o
> -libqos-spapr-obj-y = $(libqos-obj-y) tests/libqos/malloc-spapr.o
> +libqos-core-obj-y = $(libqgraph-obj-y) tests/libqos/pci.o tests/libqos/fw_cfg.o
> +libqos-core-obj-y += tests/libqos/malloc.o
> +libqos-core-obj-y += tests/libqos/libqos.o
> +libqos-spapr-obj-y = $(libqos-core-obj-y) tests/libqos/malloc-spapr.o
>  libqos-spapr-obj-y += tests/libqos/libqos-spapr.o
>  libqos-spapr-obj-y += tests/libqos/rtas.o
>  libqos-spapr-obj-y += tests/libqos/pci-spapr.o
> -libqos-pc-obj-y = $(libqos-obj-y) tests/libqos/pci-pc.o
> +libqos-pc-obj-y = $(libqos-core-obj-y) tests/libqos/pci-pc.o
>  libqos-pc-obj-y += tests/libqos/malloc-pc.o tests/libqos/libqos-pc.o
>  libqos-pc-obj-y += tests/libqos/ahci.o
>  libqos-usb-obj-y = $(libqos-spapr-obj-y) $(libqos-pc-obj-y) tests/libqos/usb.o
>  
>  # Devices
> -qos-test-obj-y = tests/qos-test.o $(libqgraph-obj-y)
> -qos-test-obj-y += $(libqos-pc-obj-y) $(libqos-spapr-obj-y)
> -qos-test-obj-y += tests/libqos/e1000e.o
> -qos-test-obj-y += tests/libqos/i2c.o
> -qos-test-obj-y += tests/libqos/i2c-imx.o
> -qos-test-obj-y += tests/libqos/i2c-omap.o
> -qos-test-obj-y += tests/libqos/sdhci.o
> -qos-test-obj-y += tests/libqos/tpci200.o
> -qos-test-obj-y += tests/libqos/virtio.o
> -qos-test-obj-$(CONFIG_VIRTFS) += tests/libqos/virtio-9p.o
> -qos-test-obj-y += tests/libqos/virtio-balloon.o
> -qos-test-obj-y += tests/libqos/virtio-blk.o
> -qos-test-obj-y += tests/libqos/virtio-mmio.o
> -qos-test-obj-y += tests/libqos/virtio-net.o
> -qos-test-obj-y += tests/libqos/virtio-pci.o
> -qos-test-obj-y += tests/libqos/virtio-rng.o
> -qos-test-obj-y += tests/libqos/virtio-scsi.o
> -qos-test-obj-y += tests/libqos/virtio-serial.o
> +libqos-obj-y = $(libqos-core-obj-y)
> +libqos-obj-y += $(libqgraph-obj-y)
> +libqos-obj-y += $(libqos-pc-obj-y) $(libqos-spapr-obj-y)
> +libqos-obj-y += tests/libqos/e1000e.o
> +libqos-obj-y += tests/libqos/i2c.o
> +libqos-obj-y += tests/libqos/i2c-imx.o
> +libqos-obj-y += tests/libqos/i2c-omap.o
> +libqos-obj-y += tests/libqos/sdhci.o
> +libqos-obj-y += tests/libqos/tpci200.o
> +libqos-obj-y += tests/libqos/virtio.o
> +libqos-obj-$(CONFIG_VIRTFS) += tests/libqos/virtio-9p.o
> +libqos-obj-y += tests/libqos/virtio-balloon.o
> +libqos-obj-y += tests/libqos/virtio-blk.o
> +libqos-obj-y += tests/libqos/virtio-mmio.o
> +libqos-obj-y += tests/libqos/virtio-net.o
> +libqos-obj-y += tests/libqos/virtio-pci.o
> +libqos-obj-y += tests/libqos/virtio-rng.o
> +libqos-obj-y += tests/libqos/virtio-scsi.o
> +libqos-obj-y += tests/libqos/virtio-serial.o
>  
>  # Machines
> -qos-test-obj-y += tests/libqos/aarch64-xlnx-zcu102-machine.o
> -qos-test-obj-y += tests/libqos/arm-imx25-pdk-machine.o
> -qos-test-obj-y += tests/libqos/arm-n800-machine.o
> -qos-test-obj-y += tests/libqos/arm-raspi2-machine.o
> -qos-test-obj-y += tests/libqos/arm-sabrelite-machine.o
> -qos-test-obj-y += tests/libqos/arm-smdkc210-machine.o
> -qos-test-obj-y += tests/libqos/arm-virt-machine.o
> -qos-test-obj-y += tests/libqos/arm-xilinx-zynq-a9-machine.o
> -qos-test-obj-y += tests/libqos/ppc64_pseries-machine.o
> -qos-test-obj-y += tests/libqos/x86_64_pc-machine.o
> +libqos-obj-y += tests/libqos/aarch64-xlnx-zcu102-machine.o
> +libqos-obj-y += tests/libqos/arm-imx25-pdk-machine.o
> +libqos-obj-y += tests/libqos/arm-n800-machine.o
> +libqos-obj-y += tests/libqos/arm-raspi2-machine.o
> +libqos-obj-y += tests/libqos/arm-sabrelite-machine.o
> +libqos-obj-y += tests/libqos/arm-smdkc210-machine.o
> +libqos-obj-y += tests/libqos/arm-virt-machine.o
> +libqos-obj-y += tests/libqos/arm-xilinx-zynq-a9-machine.o
> +libqos-obj-y += tests/libqos/ppc64_pseries-machine.o
> +libqos-obj-y += tests/libqos/x86_64_pc-machine.o
>  
>  # Tests
> +qos-test-obj-y = tests/qos-test.o
>  qos-test-obj-y += tests/ac97-test.o
>  qos-test-obj-y += tests/ds1338-test.o
>  qos-test-obj-y += tests/e1000-test.o
> @@ -763,7 +765,7 @@ check-unit-y += tests/test-qgraph$(EXESUF)
>  tests/test-qgraph$(EXESUF): tests/test-qgraph.o $(libqgraph-obj-y)
>  
>  check-qtest-generic-y += tests/qos-test$(EXESUF)
> -tests/qos-test$(EXESUF): $(qos-test-obj-y)
> +tests/qos-test$(EXESUF): $(qos-test-obj-y) $(libqos-obj-y)
>  
>  tests/qmp-test$(EXESUF): tests/qmp-test.o
>  tests/qmp-cmd-test$(EXESUF): tests/qmp-cmd-test.o
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

