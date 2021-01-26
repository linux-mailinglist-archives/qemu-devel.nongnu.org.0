Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260D83045BA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 18:52:39 +0100 (CET)
Received: from localhost ([::1]:56902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4SW6-0004ab-7R
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 12:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4SUs-00044s-Gj
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 12:51:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4SUq-0003Qj-9n
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 12:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611683478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAWPwzHo55GINYjw/RpajUQ++9ZGpPA1s18RhxQAJDI=;
 b=cumrsztwnPvc3sE/Ng3D62vcscKtErGG+2kAXowHHWtS+sGuOerUnIRH4Zyg+uFS/qMlKV
 x/TYZhWNDVFVovcuvCdpxkCBKOMMpZPZkIUaK/fkH3t/2AjRmV3db03fnM3ATuZ5zY59oc
 nNiv7pFHrvUgmCEusms8ahScpaRThrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-FUcrHtzmOfewDO-dVwKW0A-1; Tue, 26 Jan 2021 12:51:15 -0500
X-MC-Unique: FUcrHtzmOfewDO-dVwKW0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 241871927800;
 Tue, 26 Jan 2021 17:51:14 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-182.ams2.redhat.com [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E33D63743;
 Tue, 26 Jan 2021 17:51:09 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] tests/qtest: Only run fuzz-megasas-test if megasas
 device is available
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>
References: <20210126111638.3141780-1-philmd@redhat.com>
 <20210126111638.3141780-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3a8a481a-0906-8d29-f1ef-83bcbb85b27c@redhat.com>
Date: Tue, 26 Jan 2021 18:51:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126111638.3141780-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/2021 12.16, Philippe Mathieu-Daudé wrote:
> This test fails when QEMU is built without the megasas device,
> restrict it to its availability.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/qtest/fuzz-megasas-test.c | 49 +++++++++++++++++++++++++++++++++
>   tests/qtest/fuzz-test.c         | 25 -----------------
>   MAINTAINERS                     |  1 +
>   tests/qtest/meson.build         |  4 ++-
>   4 files changed, 53 insertions(+), 26 deletions(-)
>   create mode 100644 tests/qtest/fuzz-megasas-test.c
> 
> diff --git a/tests/qtest/fuzz-megasas-test.c b/tests/qtest/fuzz-megasas-test.c
> new file mode 100644
> index 00000000000..940a76bf25a
> --- /dev/null
> +++ b/tests/qtest/fuzz-megasas-test.c
> @@ -0,0 +1,49 @@
> +/*
> + * QTest fuzzer-generated testcase for megasas device
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
> + * This used to trigger the assert in scsi_dma_complete
> + * https://bugs.launchpad.net/qemu/+bug/1878263
> + */
> +static void test_lp1878263_megasas_zero_iov_cnt(void)
> +{
> +    QTestState *s;
> +
> +    s = qtest_init("-nographic -monitor none -serial none "
> +                   "-M q35 -device megasas -device scsi-cd,drive=null0 "
> +                   "-blockdev driver=null-co,read-zeroes=on,node-name=null0");
> +    qtest_outl(s, 0xcf8, 0x80001818);
> +    qtest_outl(s, 0xcfc, 0xc101);
> +    qtest_outl(s, 0xcf8, 0x8000181c);
> +    qtest_outl(s, 0xcf8, 0x80001804);
> +    qtest_outw(s, 0xcfc, 0x7);
> +    qtest_outl(s, 0xcf8, 0x8000186a);
> +    qtest_writeb(s, 0x14, 0xfe);
> +    qtest_writeb(s, 0x0, 0x02);
> +    qtest_outb(s, 0xc1c0, 0x17);
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
> +        qtest_add_func("fuzz/test_lp1878263_megasas_zero_iov_cnt",
> +                       test_lp1878263_megasas_zero_iov_cnt);
> +    }
> +
> +    return g_test_run();
> +}
> diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
> index cdb1100a0b8..6188fbb8e96 100644
> --- a/tests/qtest/fuzz-test.c
> +++ b/tests/qtest/fuzz-test.c
> @@ -11,29 +11,6 @@
>   
>   #include "libqos/libqtest.h"
>   
> -/*
> - * This used to trigger the assert in scsi_dma_complete
> - * https://bugs.launchpad.net/qemu/+bug/1878263
> - */
> -static void test_lp1878263_megasas_zero_iov_cnt(void)
> -{
> -    QTestState *s;
> -
> -    s = qtest_init("-nographic -monitor none -serial none "
> -                   "-M q35 -device megasas -device scsi-cd,drive=null0 "
> -                   "-blockdev driver=null-co,read-zeroes=on,node-name=null0");
> -    qtest_outl(s, 0xcf8, 0x80001818);
> -    qtest_outl(s, 0xcfc, 0xc101);
> -    qtest_outl(s, 0xcf8, 0x8000181c);
> -    qtest_outl(s, 0xcf8, 0x80001804);
> -    qtest_outw(s, 0xcfc, 0x7);
> -    qtest_outl(s, 0xcf8, 0x8000186a);
> -    qtest_writeb(s, 0x14, 0xfe);
> -    qtest_writeb(s, 0x0, 0x02);
> -    qtest_outb(s, 0xc1c0, 0x17);
> -    qtest_quit(s);
> -}
> -
>   static void test_lp1878642_pci_bus_get_irq_level_assert(void)
>   {
>       QTestState *s;
> @@ -104,8 +81,6 @@ int main(int argc, char **argv)
>       g_test_init(&argc, &argv, NULL);
>   
>       if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> -        qtest_add_func("fuzz/test_lp1878263_megasas_zero_iov_cnt",
> -                       test_lp1878263_megasas_zero_iov_cnt);
>           qtest_add_func("fuzz/test_lp1878642_pci_bus_get_irq_level_assert",
>                          test_lp1878642_pci_bus_get_irq_level_assert);
>           qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 34359a99b8e..44cd74b03cd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1925,6 +1925,7 @@ S: Supported
>   F: hw/scsi/megasas.c
>   F: hw/scsi/mfi.h
>   F: tests/qtest/megasas-test.c
> +F: tests/qtest/fuzz-megasas-test.c
>   
>   Network packet abstractions
>   M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 16d04625b8b..85682d0dfce 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -4,7 +4,9 @@
>     subdir_done()
>   endif
>   
> -qtests_generic = [
> +qtests_generic = \
> +  (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
> +  [
>     'cdrom-test',
>     'device-introspect-test',
>     'machine-none-test',
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

I assume Alexander will take this patch through his fuzzer branch now? Or 
shall I take it via the qtest branch?

  Thomas


