Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844E028B237
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 12:28:26 +0200 (CEST)
Received: from localhost ([::1]:50054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRv45-0000Ow-L5
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 06:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kRv2U-0007p9-M7
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 06:26:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kRv2R-0006LF-Eu
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 06:26:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602498402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ZW7Hfsr34Jqc9VL8Zi6IB58Xf0zjf4FhhBbKxyB8IA=;
 b=Ol9WNrJgADLdXprXNhzTYEXlrUTzQ77SfGcbdRiHuSJrYl9/z+Hv+1TiSVMMiGdNkZu8Gn
 ZYBeQq6SfKpSLNKI2cdFgs47yf7t1FKOQFxx0iIRVOV3XLHZC3qab/DBJHsmJ3uEYuN+WN
 P3DYKyxTwXgJnz7JqPhkG2mrQwkQVjU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-bYHol45KM4GBUpZFV-PNCQ-1; Mon, 12 Oct 2020 06:26:38 -0400
X-MC-Unique: bYHol45KM4GBUpZFV-PNCQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E927B107464C;
 Mon, 12 Oct 2020 10:26:36 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-22.ams2.redhat.com [10.36.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6266055798;
 Mon, 12 Oct 2020 10:26:35 +0000 (UTC)
Subject: Re: [PATCH v2] qtest: add fuzz test case
To: Li Qiang <liq3ea@163.com>, lvivier@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com, alxndr@bu.edu
References: <20200921160605.19329-1-liq3ea@163.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <12f715e1-b1ad-fc54-9375-d25355a0a0b3@redhat.com>
Date: Mon, 12 Oct 2020 12:26:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200921160605.19329-1-liq3ea@163.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 02:58:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: liq3ea@gmail.com, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/09/2020 18.06, Li Qiang wrote:
> Currently the device fuzzer find a more and more issues.
> For every fuzz case, we need not only the fixes but also
> the corresponding test case. We can analysis the reproducer
> for every case and find what happened in where and write
> a beautiful test case. However the raw data of reproducer is not
> friendly to analysis. It will take a very long time, even far more
> than the fixes itself. So let's create a new file to hold all of
> the fuzz test cases and just use the raw data to act as the test
> case. This way nobody will be afraid of writing a test case for
> the fuzz reproducer.
> 
> This patch adds the issue LP#1878263 test case.
> 
> Signed-off-by: Li Qiang <liq3ea@163.com>
> ---
> Change since v1:
> rename the test function
> limit the test to i386/x86_64 arch
> using meson build system
> 
>  tests/qtest/fuzz-test.c | 51 +++++++++++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 tests/qtest/fuzz-test.c
> 
> diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
> new file mode 100644
> index 0000000000..4398ccf137
> --- /dev/null
> +++ b/tests/qtest/fuzz-test.c
> @@ -0,0 +1,51 @@
> +/*
> + * QTest testcase for fuzz case
> + *
> + * Copyright (c) 2020 Li Qiang <liq3ea@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
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
> +
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 874b5be62b..e5de39ffe4 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -54,6 +54,7 @@ qtests_i386 = \
>     'bios-tables-test',
>     'rtc-test',
>     'i440fx-test',
> +   'fuzz-test',
>     'fw_cfg-test',
>     'device-plug-test',
>     'drive_del-test',
> 

You missed to CC: qemu-devel@nongnu.org ... done now and queued to my
qtest-next branch:

 https://gitlab.com/huth/qemu/-/commits/qtest-next/

 Thomas


