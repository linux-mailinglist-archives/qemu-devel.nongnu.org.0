Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD6D3CFAF0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:43:42 +0200 (CEST)
Received: from localhost ([::1]:50146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5q29-00021M-E1
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5pxL-0002XZ-5j
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:38:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5pxH-0003aa-Sd
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626788318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eaH2UBXd9JkVVfycNenzAj5IFu1TEeGIddbHDP2dMvc=;
 b=Pe2IpuvGq9qkTBU+eUKht3oOP9A0zVYxbRJPhZJ51ipG4Dmu3JEiQErQdiY2i41JL8QB3U
 wdgZPxz0AGfWvUamIpMeYyxsTibtRCCJuZam2AfmuANGYkPbUZFUoriBJ2hJhRJPDREkq3
 WSZohRM8KUh+1c/gu8jscnzqGDylC64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-qoPomzWVNNm-E70TDIYSsA-1; Tue, 20 Jul 2021 09:38:37 -0400
X-MC-Unique: qoPomzWVNNm-E70TDIYSsA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AFC410C1ADC;
 Tue, 20 Jul 2021 13:38:36 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A9E119C44;
 Tue, 20 Jul 2021 13:38:31 +0000 (UTC)
Date: Tue, 20 Jul 2021 15:38:30 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 09/10] ACPI ERST: qtest for ERST
Message-ID: <20210720153830.71bd4b8e@redhat.com>
In-Reply-To: <1625080041-29010-10-git-send-email-eric.devolder@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-10-git-send-email-eric.devolder@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 15:07:20 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> This change provides a qtest that locates and then does a simple
> interrogation of the ERST feature within the guest.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  tests/qtest/erst-test.c | 129 ++++++++++++++++++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build |   2 +
>  2 files changed, 131 insertions(+)
>  create mode 100644 tests/qtest/erst-test.c
> 
> diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
> new file mode 100644
> index 0000000..ce014c1
> --- /dev/null
> +++ b/tests/qtest/erst-test.c
> @@ -0,0 +1,129 @@
> +/*
> + * QTest testcase for ACPI ERST
> + *
> + * Copyright (c) 2021 Oracle
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/bitmap.h"
> +#include "qemu/uuid.h"
> +#include "hw/acpi/acpi-defs.h"
> +#include "boot-sector.h"
> +#include "acpi-utils.h"
> +#include "libqos/libqtest.h"
> +#include "qapi/qmp/qdict.h"
> +
> +#define RSDP_ADDR_INVALID 0x100000 /* RSDP must be below this address */
> +
> +static uint64_t acpi_find_erst(QTestState *qts)
> +{
> +    uint32_t rsdp_offset;
> +    uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
> +    uint32_t rsdt_len, table_length;
> +    uint8_t *rsdt, *ent;
> +    uint64_t base = 0;
> +
> +    /* Wait for guest firmware to finish and start the payload. */
> +    boot_sector_test(qts);
> +
> +    /* Tables should be initialized now. */
> +    rsdp_offset = acpi_find_rsdp_address(qts);
> +
> +    g_assert_cmphex(rsdp_offset, <, RSDP_ADDR_INVALID);
> +
> +    acpi_fetch_rsdp_table(qts, rsdp_offset, rsdp_table);
> +    acpi_fetch_table(qts, &rsdt, &rsdt_len, &rsdp_table[16 /* RsdtAddress */],
> +                     4, "RSDT", true);
> +
> +    ACPI_FOREACH_RSDT_ENTRY(rsdt, rsdt_len, ent, 4 /* Entry size */) {
> +        uint8_t *table_aml;
> +        acpi_fetch_table(qts, &table_aml, &table_length, ent, 4, NULL, true);
> +        if (!memcmp(table_aml + 0 /* Header Signature */, "ERST", 4)) {
> +            /*
> +             * Picking up ERST base address from the Register Region
> +             * specified as part of the first Serialization Instruction
> +             * Action (which is a Begin Write Operation).
> +             */
> +            memcpy(&base, &table_aml[56], sizeof(base));
> +            g_free(table_aml);
> +            break;
> +        }
> +        g_free(table_aml);
> +    }
> +    g_free(rsdt);
> +    return base;
> +}
I'd drop this, bios-tables-test should do ACPI table check
as for PCI device itself you can test it with qtest accelerator
that allows to instantiate it and access registers directly
without overhead of running actual guest.

As example you can look into megasas-test.c, ivshmem-test.c
or other PCI device tests.

> +static char disk[] = "tests/erst-test-disk-XXXXXX";
> +
> +#define ERST_CMD()                              \
> +    "-accel kvm -accel tcg "                    \
> +    "-object memory-backend-file," \
> +      "id=erstnvram,mem-path=tests/acpi-erst-XXXXXX,size=0x10000,share=on " \
> +    "-device acpi-erst,memdev=erstnvram " \
> +    "-drive id=hd0,if=none,file=%s,format=raw " \
> +    "-device ide-hd,drive=hd0 ", disk
> +
> +static void erst_get_error_log_address_range(void)
> +{
> +    QTestState *qts;
> +    uint64_t log_address_range = 0;
> +    unsigned log_address_length = 0;
> +    unsigned log_address_attr = 0;
> +
> +    qts = qtest_initf(ERST_CMD());
> +
> +    uint64_t base = acpi_find_erst(qts);
> +    g_assert(base != 0);
> +
> +    /* Issue GET_ERROR_LOG_ADDRESS_RANGE command */
> +    qtest_writel(qts, base + 0, 0xD);
> +    /* Read GET_ERROR_LOG_ADDRESS_RANGE result */
> +    log_address_range = qtest_readq(qts, base + 8);\
> +
> +    /* Issue GET_ERROR_LOG_ADDRESS_RANGE_LENGTH command */
> +    qtest_writel(qts, base + 0, 0xE);
> +    /* Read GET_ERROR_LOG_ADDRESS_RANGE_LENGTH result */
> +    log_address_length = qtest_readq(qts, base + 8);\
> +
> +    /* Issue GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES command */
> +    qtest_writel(qts, base + 0, 0xF);
> +    /* Read GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES result */
> +    log_address_attr = qtest_readq(qts, base + 8);\
> +
> +    /* Check log_address_range is not 0,~0 or base */
> +    g_assert(log_address_range != base);
> +    g_assert(log_address_range != 0);
> +    g_assert(log_address_range != ~0UL);
> +
> +    /* Check log_address_length is ERST_RECORD_SIZE */
> +    g_assert(log_address_length == (8 * 1024));
> +
> +    /* Check log_address_attr is 0 */
> +    g_assert(log_address_attr == 0);
> +
> +    qtest_quit(qts);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    int ret;
> +
> +    ret = boot_sector_init(disk);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("/erst/get-error-log-address-range",
> +                   erst_get_error_log_address_range);
> +
> +    ret = g_test_run();
> +    boot_sector_cleanup(disk);
> +
> +    return ret;
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 0c76738..deae443 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -66,6 +66,7 @@ qtests_i386 = \
>    (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
>    (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
>    (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
> +  (config_all_devices.has_key('CONFIG_ACPI') ? ['erst-test'] : []) +                 \
>    qtests_pci +                                                                              \
>    ['fdc-test',
>     'ide-test',
> @@ -237,6 +238,7 @@ qtests = {
>    'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
>    'cdrom-test': files('boot-sector.c'),
>    'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
> +  'erst-test': files('erst-test.c', 'boot-sector.c', 'acpi-utils.c'),
>    'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
>    'migration-test': files('migration-helpers.c'),
>    'pxe-test': files('boot-sector.c'),


