Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D55E2F91D9
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 12:06:52 +0100 (CET)
Received: from localhost ([::1]:38670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l15tT-0003rk-8r
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 06:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l15ob-00028j-5H
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:01:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l15oX-0004KC-M7
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610881303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=naGjBKodO5bvqj7l92MFSN1Q7wuyfxOMRTShs5mzNeM=;
 b=iHln4VfhYDxtFzExLI0OCntXOTltb1UHe43kC0ZX+T0Mn4heNo3hfGx82mU5Sjb3rAS7EC
 Nqo00Mc6q6DCiwPU630kZn+h/GNyn0yqTtBLRNq3Klkgtdw1Kn7th+fMU9YaVoYLSrTr1s
 9hwyRvGcq9e9OYM3jLF77f0sLZWNY7w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-G6mJos7HNkSqV03FE-q9kw-1; Sun, 17 Jan 2021 06:01:40 -0500
X-MC-Unique: G6mJos7HNkSqV03FE-q9kw-1
Received: by mail-wr1-f72.google.com with SMTP id m20so6740221wrh.2
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 03:01:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LtPX97FpK3AAFqQzmEA8izTbddRYH7S6SVuNHCBwiKs=;
 b=XlnCAHw17LoYEi0FNKxdZ0Zo3viwjsOZIdmlop8P7G1+DIXFaeCEhSimGWggVOyj8N
 M5BHWnDsm+4up3QIGrEI4Ua/Kom8xvhxA6FdwU+D4Q2YqoZBTT+6j2MTjtqJ3a9aFLrz
 lirzxayOqovTyrByfOa4HsE+2YpqC2gjgTH8PsnYvqsY7WIdC7QU2MT/uBXHyQI4dTGV
 HYgMibuBR4xv88IRL1Ql0/ItXoSvlo5roOglCthcV77GKY3UfsqjJGpXFIt5ojeHjL9Q
 0J6zNfX2DFpAXAROhc6QVOsy2qCNiX5B2oG6vo3ymnbv5ej7AxFnJGv1T8tLsvVLVFGy
 N5Yg==
X-Gm-Message-State: AOAM530H5Q+JSI1HdlPborUoqaK4RScdME2mcYz5IfTuoZKGmejQrWOZ
 ifJaDwqt1m5Svo6zoT2F07Y/vM0NTQljvdr2Wy6uG8V9vJtTZG/A21YwuMfxgT7GDF3CCfOSXDd
 n3HuXY3Fr/m5EwHc=
X-Received: by 2002:a7b:cd91:: with SMTP id y17mr15811991wmj.171.1610881299203; 
 Sun, 17 Jan 2021 03:01:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzI6NzrwtDrM1nIRrW4np8wNt7XjJZ5zf9RMfBjSU34+4t4l4GUePZQlZCd3vOPUKI6NopKQ==
X-Received: by 2002:a7b:cd91:: with SMTP id y17mr15811967wmj.171.1610881298999; 
 Sun, 17 Jan 2021 03:01:38 -0800 (PST)
Received: from redhat.com (bzq-79-176-30-58.red.bezeqint.net. [79.176.30.58])
 by smtp.gmail.com with ESMTPSA id
 n10sm22193644wrx.21.2021.01.17.03.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 03:01:38 -0800 (PST)
Date: Sun, 17 Jan 2021 06:01:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 4/4] tests/qtest: Only run fuzz-virtio-scsi when
 virtio-scsi is available
Message-ID: <20210117060103-mutt-send-email-mst@kernel.org>
References: <20210115150936.3333282-1-philmd@redhat.com>
 <20210115150936.3333282-5-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210115150936.3333282-5-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Hannes Reinecke <hare@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 04:09:36PM +0100, Philippe Mathieu-Daudé wrote:
> This test fails when QEMU is built without the virtio-scsi device,
> restrict it to its availability.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Are you merging this with rest of patchset?


> ---
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> 
> Note when running check-qtest-i386 I still get this failure:
> 
>   qemu-system-i386: Cannot map used
> 
> it comes from virtio_init_region_cache().


Not sure I understand this part.

> ---
>  tests/qtest/fuzz-test.c             | 51 --------------------
>  tests/qtest/fuzz-virtio-scsi-test.c | 75 +++++++++++++++++++++++++++++
>  MAINTAINERS                         |  1 +
>  tests/qtest/meson.build             |  1 +
>  4 files changed, 77 insertions(+), 51 deletions(-)
>  create mode 100644 tests/qtest/fuzz-virtio-scsi-test.c
> 
> diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
> index 6188fbb8e96..d112798afe3 100644
> --- a/tests/qtest/fuzz-test.c
> +++ b/tests/qtest/fuzz-test.c
> @@ -25,55 +25,6 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
>      qtest_quit(s);
>  }
>  
> -/*
> - * Here a MemoryRegionCache pointed to an MMIO region but had a
> - * larger size than the underlying region.
> - */
> -static void test_mmio_oob_from_memory_region_cache(void)
> -{
> -    QTestState *s;
> -
> -    s = qtest_init("-M pc-q35-5.2 -display none -m 512M "
> -		   "-device virtio-scsi,num_queues=8,addr=03.0 ");
> -
> -    qtest_outl(s, 0xcf8, 0x80001811);
> -    qtest_outb(s, 0xcfc, 0x6e);
> -    qtest_outl(s, 0xcf8, 0x80001824);
> -    qtest_outl(s, 0xcf8, 0x80001813);
> -    qtest_outl(s, 0xcfc, 0xa080000);
> -    qtest_outl(s, 0xcf8, 0x80001802);
> -    qtest_outl(s, 0xcfc, 0x5a175a63);
> -    qtest_outb(s, 0x6e08, 0x9e);
> -    qtest_writeb(s, 0x9f003, 0xff);
> -    qtest_writeb(s, 0x9f004, 0x01);
> -    qtest_writeb(s, 0x9e012, 0x0e);
> -    qtest_writeb(s, 0x9e01b, 0x0e);
> -    qtest_writeb(s, 0x9f006, 0x01);
> -    qtest_writeb(s, 0x9f008, 0x01);
> -    qtest_writeb(s, 0x9f00a, 0x01);
> -    qtest_writeb(s, 0x9f00c, 0x01);
> -    qtest_writeb(s, 0x9f00e, 0x01);
> -    qtest_writeb(s, 0x9f010, 0x01);
> -    qtest_writeb(s, 0x9f012, 0x01);
> -    qtest_writeb(s, 0x9f014, 0x01);
> -    qtest_writeb(s, 0x9f016, 0x01);
> -    qtest_writeb(s, 0x9f018, 0x01);
> -    qtest_writeb(s, 0x9f01a, 0x01);
> -    qtest_writeb(s, 0x9f01c, 0x01);
> -    qtest_writeb(s, 0x9f01e, 0x01);
> -    qtest_writeb(s, 0x9f020, 0x01);
> -    qtest_writeb(s, 0x9f022, 0x01);
> -    qtest_writeb(s, 0x9f024, 0x01);
> -    qtest_writeb(s, 0x9f026, 0x01);
> -    qtest_writeb(s, 0x9f028, 0x01);
> -    qtest_writeb(s, 0x9f02a, 0x01);
> -    qtest_writeb(s, 0x9f02c, 0x01);
> -    qtest_writeb(s, 0x9f02e, 0x01);
> -    qtest_writeb(s, 0x9f030, 0x01);
> -    qtest_outb(s, 0x6e10, 0x00);
> -    qtest_quit(s);
> -}
> -
>  int main(int argc, char **argv)
>  {
>      const char *arch = qtest_get_arch();
> @@ -83,8 +34,6 @@ int main(int argc, char **argv)
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>          qtest_add_func("fuzz/test_lp1878642_pci_bus_get_irq_level_assert",
>                         test_lp1878642_pci_bus_get_irq_level_assert);
> -        qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
> -                       test_mmio_oob_from_memory_region_cache);
>      }
>  
>      return g_test_run();
> diff --git a/tests/qtest/fuzz-virtio-scsi-test.c b/tests/qtest/fuzz-virtio-scsi-test.c
> new file mode 100644
> index 00000000000..aaf6d10e189
> --- /dev/null
> +++ b/tests/qtest/fuzz-virtio-scsi-test.c
> @@ -0,0 +1,75 @@
> +/*
> + * QTest fuzzer-generated testcase for virtio-scsi device
> + *
> + * Copyright (c) 2020 Li Qiang <liq3ea@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "libqos/libqtest.h"
> +
> +/*
> + * Here a MemoryRegionCache pointed to an MMIO region but had a
> + * larger size than the underlying region.
> + */
> +static void test_mmio_oob_from_memory_region_cache(void)
> +{
> +    QTestState *s;
> +
> +    s = qtest_init("-M pc-q35-5.2 -display none -m 512M "
> +                   "-device virtio-scsi,num_queues=8,addr=03.0 ");
> +
> +    qtest_outl(s, 0xcf8, 0x80001811);
> +    qtest_outb(s, 0xcfc, 0x6e);
> +    qtest_outl(s, 0xcf8, 0x80001824);
> +    qtest_outl(s, 0xcf8, 0x80001813);
> +    qtest_outl(s, 0xcfc, 0xa080000);
> +    qtest_outl(s, 0xcf8, 0x80001802);
> +    qtest_outl(s, 0xcfc, 0x5a175a63);
> +    qtest_outb(s, 0x6e08, 0x9e);
> +    qtest_writeb(s, 0x9f003, 0xff);
> +    qtest_writeb(s, 0x9f004, 0x01);
> +    qtest_writeb(s, 0x9e012, 0x0e);
> +    qtest_writeb(s, 0x9e01b, 0x0e);
> +    qtest_writeb(s, 0x9f006, 0x01);
> +    qtest_writeb(s, 0x9f008, 0x01);
> +    qtest_writeb(s, 0x9f00a, 0x01);
> +    qtest_writeb(s, 0x9f00c, 0x01);
> +    qtest_writeb(s, 0x9f00e, 0x01);
> +    qtest_writeb(s, 0x9f010, 0x01);
> +    qtest_writeb(s, 0x9f012, 0x01);
> +    qtest_writeb(s, 0x9f014, 0x01);
> +    qtest_writeb(s, 0x9f016, 0x01);
> +    qtest_writeb(s, 0x9f018, 0x01);
> +    qtest_writeb(s, 0x9f01a, 0x01);
> +    qtest_writeb(s, 0x9f01c, 0x01);
> +    qtest_writeb(s, 0x9f01e, 0x01);
> +    qtest_writeb(s, 0x9f020, 0x01);
> +    qtest_writeb(s, 0x9f022, 0x01);
> +    qtest_writeb(s, 0x9f024, 0x01);
> +    qtest_writeb(s, 0x9f026, 0x01);
> +    qtest_writeb(s, 0x9f028, 0x01);
> +    qtest_writeb(s, 0x9f02a, 0x01);
> +    qtest_writeb(s, 0x9f02c, 0x01);
> +    qtest_writeb(s, 0x9f02e, 0x01);
> +    qtest_writeb(s, 0x9f030, 0x01);
> +    qtest_outb(s, 0x6e10, 0x00);
> +    qtest_quit(s);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    const char *arch = qtest_get_arch();
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> +        qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
> +                       test_mmio_oob_from_memory_region_cache);
> +    }
> +
> +    return g_test_run();
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b2ef820a9fa..fcbe3ac79a8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1717,6 +1717,7 @@ S: Supported
>  F: include/hw/scsi/*
>  F: hw/scsi/*
>  F: tests/qtest/virtio-scsi-test.c
> +F: tests/qtest/fuzz-virtio-scsi-test.c
>  T: git https://github.com/bonzini/qemu.git scsi-next
>  
>  SSI
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index a24e7f1c34a..fedce3ee3c1 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -6,6 +6,7 @@
>  
>  qtests_generic = \
>    (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) + \
>    [
>    'cdrom-test',
>    'device-introspect-test',
> -- 
> 2.26.2


