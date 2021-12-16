Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2E1476F41
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:55:33 +0100 (CET)
Received: from localhost ([::1]:35978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoQ8-0004Ci-KP
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:55:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mxoNB-0007zB-Bj
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:52:29 -0500
Received: from [2a00:1450:4864:20::52b] (port=40715
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mxoN8-00048D-MD
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:52:29 -0500
Received: by mail-ed1-x52b.google.com with SMTP id z29so5365944edl.7
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 02:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v4Z4/YnDgYiBf1yHsbXpURhW0w+if5YGRCQBozThIu4=;
 b=Wqn9Ci+1JHSF5wm895iGgG32b/FWaJLJx1idzVeoRgSDsA3UE+K45DpIGBHNzy66YW
 JFKAT29iRafSisNs88nKiPnB7OJ2XOrlxEbV658X2bGhUXaIt7YB1npYL/la/o7pEZ5Y
 +RN6KPBTYJ1ZZeoLfusLFDND7tEQy2bUOfEsl6KGeYqP7sA+eYjnE42oPmZ2IRwQos1H
 sOCx/G/bbHAhft7M/780nS1jgNfwXY/Nl44pUN9O5NKyB1kqGmvtV9u1uEusoctz0IbL
 wI2PnUodikedThXsan3viI5ZWr/3vfNG7DlzfzOAy9RwprnMYu3kVEnJTYhlZS9zUzgU
 ZUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v4Z4/YnDgYiBf1yHsbXpURhW0w+if5YGRCQBozThIu4=;
 b=Lq9uzgfmo7BYcr/LgsgOPHETAgW3Ktb21aNfM4L1B0EjnUYGNFUk9jvc4vdJBEh86z
 wt7XLVxLH/E29Dk2vFiPbx/ZD7/36/UKhNy+riydULNMa/5av/YsUKniVvNYpVgSNjof
 tATzqAZKnCfD+hox9AojiMwrRat7DQ37nX0ycRPmHlkoF9bBV53bhysSHpR4WIuWqSvj
 DjUCycKtA5jIyAgxMnFyeAPKOU1FqTacfNvUpC/n5trrsGMk/rjib5aB2TKfEyiRv82/
 7oTz1oCkfXPXiQyFGocAqepUJ8nVIauHS5XAR8nawfAz+/udwCyD9qumnnEwAx0q8mQj
 xqhQ==
X-Gm-Message-State: AOAM530SErSrUaI+uT3GoGZo2YxhWxPReD4GcaaVkCtwe/Jk7hZaEf3s
 BJHiKUAp+o0+1nESUKA43D8PZneuBPJlp/Ach6s/4A==
X-Google-Smtp-Source: ABdhPJzlivSGz0hzZyihZRBpUzKbm658gU2N2iGbL0WhwlUMC4EXLlfPC3DocvUyw23qg/EWMiT+5DRv80KTyxcKwsA=
X-Received: by 2002:aa7:d957:: with SMTP id l23mr6930192eds.116.1639651944356; 
 Thu, 16 Dec 2021 02:52:24 -0800 (PST)
MIME-Version: 1.0
References: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
 <1639582695-7328-9-git-send-email-eric.devolder@oracle.com>
In-Reply-To: <1639582695-7328-9-git-send-email-eric.devolder@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 16 Dec 2021 16:22:13 +0530
Message-ID: <CAARzgwwdSo6aU39WOKr2Va2EW8vUFr+kkDGV=be-kjV53XqwDQ@mail.gmail.com>
Subject: Re: [PATCH v11 08/10] ACPI ERST: qtest for ERST
To: Eric DeVolder <eric.devolder@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52b;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 9:08 PM Eric DeVolder <eric.devolder@oracle.com> wrote:
>
> This change provides a qtest that locates and then does a simple
> interrogation of the ERST feature within the guest.

Other than couple of minor comments,

>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/qtest/erst-test.c | 167 ++++++++++++++++++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build |   2 +
>  2 files changed, 169 insertions(+)
>  create mode 100644 tests/qtest/erst-test.c
>
> diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
> new file mode 100644
> index 0000000..370c119
> --- /dev/null
> +++ b/tests/qtest/erst-test.c
> @@ -0,0 +1,167 @@
> +/*
> + * QTest testcase for acpi-erst
> + *
> + * Copyright (c) 2021 Oracle
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include <glib/gstdio.h>
> +#include "libqos/libqos-pc.h"
> +#include "libqos/libqtest.h"
> +#include "qemu-common.h"
> +
> +static void save_fn(QPCIDevice *dev, int devfn, void *data)
> +{
> +    QPCIDevice **pdev = (QPCIDevice **) data;
> +
> +    *pdev = dev;
> +}
> +
> +static QPCIDevice *get_device(QPCIBus *pcibus)

get_erst_device?

> +{
> +    QPCIDevice *dev;
> +
> +    dev = NULL;
> +    qpci_device_foreach(pcibus, 0x1b36, 0x0012, save_fn, &dev);

Maybe #define the vendor and device ID here for clarity.

> +    g_assert(dev != NULL);
> +
> +    return dev;
> +}
> +
> +typedef struct _ERSTState {
> +    QOSState *qs;
> +    QPCIBar reg_bar, mem_bar;
> +    uint64_t reg_barsize, mem_barsize;
> +    QPCIDevice *dev;
> +} ERSTState;
> +
> +#define ACTION 0
> +#define VALUE 8
> +
> +static const char *reg2str(unsigned reg)
> +{
> +    switch (reg) {
> +    case 0:
> +        return "ACTION";
> +    case 8:
> +        return "VALUE";
> +    default:
> +        return NULL;
> +    }
> +}
> +
> +static inline uint32_t in_reg32(ERSTState *s, unsigned reg)
> +{
> +    const char *name = reg2str(reg);
> +    uint32_t res;
> +
> +    res = qpci_io_readl(s->dev, s->reg_bar, reg);
> +    g_test_message("*%s -> %08x", name, res);
> +
> +    return res;
> +}
> +
> +static inline uint64_t in_reg64(ERSTState *s, unsigned reg)
> +{
> +    const char *name = reg2str(reg);
> +    uint64_t res;
> +
> +    res = qpci_io_readq(s->dev, s->reg_bar, reg);
> +    g_test_message("*%s -> %016llx", name, (unsigned long long)res);
> +
> +    return res;
> +}
> +
> +static inline void out_reg32(ERSTState *s, unsigned reg, uint32_t v)
> +{
> +    const char *name = reg2str(reg);
> +
> +    g_test_message("%08x -> *%s", v, name);
> +    qpci_io_writel(s->dev, s->reg_bar, reg, v);
> +}
> +
> +static inline void out_reg64(ERSTState *s, unsigned reg, uint64_t v)
> +{
> +    const char *name = reg2str(reg);
> +
> +    g_test_message("%016llx -> *%s", (unsigned long long)v, name);
> +    qpci_io_writeq(s->dev, s->reg_bar, reg, v);
> +}
> +
> +static void cleanup_vm(ERSTState *s)
> +{
> +    g_free(s->dev);
> +    qtest_shutdown(s->qs);
> +}
> +
> +static void setup_vm_cmd(ERSTState *s, const char *cmd)
> +{
> +    const char *arch = qtest_get_arch();
> +
> +    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> +        s->qs = qtest_pc_boot(cmd);
> +    } else {
> +        g_printerr("erst-test tests are only available on x86\n");
> +        exit(EXIT_FAILURE);
> +    }
> +    s->dev = get_device(s->qs->pcibus);
> +
> +    s->reg_bar = qpci_iomap(s->dev, 0, &s->reg_barsize);
> +    g_assert_cmpuint(s->reg_barsize, ==, 16);
> +
> +    s->mem_bar = qpci_iomap(s->dev, 1, &s->mem_barsize);
> +    g_assert_cmpuint(s->mem_barsize, ==, 0x2000);
> +
> +    qpci_device_enable(s->dev);
> +}
> +
> +static void test_acpi_erst_basic(void)
> +{
> +    ERSTState state;
> +    uint64_t log_address_range;
> +    uint64_t log_address_length;
> +    uint32_t log_address_attr;
> +
> +    setup_vm_cmd(&state,
> +        "-object memory-backend-file,"
> +            "mem-path=acpi-erst.XXXXXX,"
> +            "size=64K,"
> +            "share=on,"
> +            "id=nvram "
> +        "-device acpi-erst,"
> +            "memdev=nvram");
> +
> +    out_reg32(&state, ACTION, 0xD);
> +    log_address_range = in_reg64(&state, VALUE);
> +    out_reg32(&state, ACTION, 0xE);
> +    log_address_length = in_reg64(&state, VALUE);
> +    out_reg32(&state, ACTION, 0xF);
> +    log_address_attr = in_reg32(&state, VALUE);
> +
> +    /* Check log_address_range is not 0, ~0 or base */
> +    g_assert_cmpuint(log_address_range, !=,  0ULL);
> +    g_assert_cmpuint(log_address_range, !=, ~0ULL);
> +    g_assert_cmpuint(log_address_range, !=, state.reg_bar.addr);
> +    g_assert_cmpuint(log_address_range, ==, state.mem_bar.addr);
> +
> +    /* Check log_address_length is bar1_size */
> +    g_assert_cmpuint(log_address_length, ==, state.mem_barsize);
> +
> +    /* Check log_address_attr is 0 */
> +    g_assert_cmpuint(log_address_attr, ==, 0);
> +
> +    cleanup_vm(&state);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    int ret;
> +
> +    g_test_init(&argc, &argv, NULL);
> +    qtest_add_func("/acpi-erst/basic", test_acpi_erst_basic);
> +    ret = g_test_run();
> +    return ret;
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index c9d8458..4b01c22 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -68,6 +68,7 @@ qtests_i386 = \
>    (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
>    (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
>    (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
> +  (config_all_devices.has_key('CONFIG_ACPI_ERST') ? ['erst-test'] : []) +                        \
>    (unpack_edk2_blobs ? ['bios-tables-test'] : []) +                                         \
>    qtests_pci +                                                                              \
>    ['fdc-test',
> @@ -246,6 +247,7 @@ qtests = {
>    'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
>    'cdrom-test': files('boot-sector.c'),
>    'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
> +  'erst-test': files('erst-test.c'),
>    'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
>    'migration-test': files('migration-helpers.c'),
>    'pxe-test': files('boot-sector.c'),
> --
> 1.8.3.1
>

