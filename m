Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0456C9CC0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 09:50:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pghbq-0001Ap-3v; Mon, 27 Mar 2023 03:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pghbo-0001Ab-9E
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 03:49:40 -0400
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pghbk-00071D-Ru
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 03:49:40 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.22])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 3F7D1219B8;
 Mon, 27 Mar 2023 07:49:24 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 27 Mar
 2023 09:49:23 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001df7391d3-1102-4c60-8664-3674c62a1e3d,
 A6C3435B678E6C193C864925704A598F32E2E8B9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <166f52c2-0896-c75e-1644-1136f48e7951@kaod.org>
Date: Mon, 27 Mar 2023 09:49:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] qtest: Add a test case for TPM TIS I2C connected to
 Aspeed I2C controller
To: Stefan Berger <stefanb@linux.ibm.com>, <qemu-devel@nongnu.org>
CC: <marcandre.lureau@redhat.com>, <ninad@linux.ibm.com>, <joel@jms.id.au>,
 <andrew@aj.id.au>
References: <20230327003703.3539303-1-stefanb@linux.ibm.com>
 <20230327003703.3539303-3-stefanb@linux.ibm.com>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230327003703.3539303-3-stefanb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 60ebfec4-d65b-4e67-85c8-7bfe9f64c70d
X-Ovh-Tracer-Id: 5369135182427425574
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehuddguddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshhtvghfrghnsgeslhhinhhugidrihgsmhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpmhgrrhgtrghnughrvgdrlhhurhgvrghusehrvgguhhgrthdrtghomhdpnhhinhgrugeslhhinhhugidrihgsmhdrtghomhdpjhhovghlsehjmhhsrdhiugdrrghupdgrnhgurhgvfiesrghjrdhiugdrrghupdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/27/23 02:37, Stefan Berger wrote:
> Add a test case for the TPM TIS I2C device exercising most of its
> functionality, including localities.
> 
> Add library functions for being able to read from and write to registers
> of the TPM TIS I2C device connected to the Aspeed i2c controller.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Thanks for doing the I2C qtest driver. This gives the opportunity to write
more unit tests.

> ---
>   tests/qtest/meson.build        |   3 +
>   tests/qtest/qtest_aspeed.c     | 117 ++++++
>   tests/qtest/qtest_aspeed.h     |  27 ++
>   tests/qtest/tpm-tis-i2c-test.c | 628 +++++++++++++++++++++++++++++++++
>   4 files changed, 775 insertions(+)
>   create mode 100644 tests/qtest/qtest_aspeed.c
>   create mode 100644 tests/qtest/qtest_aspeed.h
>   create mode 100644 tests/qtest/tpm-tis-i2c-test.c
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 29a4efb4c2..065a00d34d 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -200,6 +200,7 @@ qtests_arm = \
>     (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed : []) + \
>     (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
>     (config_all_devices.has_key('CONFIG_GENERIC_LOADER') ? ['hexloader-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
>     ['arm-cpu-features',
>      'microbit-test',
>      'test-arm-mptimer',
> @@ -212,6 +213,7 @@ qtests_aarch64 = \
>       ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
>     (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
> +  (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
>     ['arm-cpu-features',
>      'numa-test',
>      'boot-serial-test',
> @@ -303,6 +305,7 @@ qtests = {
>     'tpm-crb-test': [io, tpmemu_files],
>     'tpm-tis-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
>     'tpm-tis-test': [io, tpmemu_files, 'tpm-tis-util.c'],
> +  'tpm-tis-i2c-test': [io, tpmemu_files, 'qtest_aspeed.c'],
>     'tpm-tis-device-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
>     'tpm-tis-device-test': [io, tpmemu_files, 'tpm-tis-util.c'],
>     'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
> diff --git a/tests/qtest/qtest_aspeed.c b/tests/qtest/qtest_aspeed.c
> new file mode 100644
> index 0000000000..2b316178e4
> --- /dev/null
> +++ b/tests/qtest/qtest_aspeed.c
> @@ -0,0 +1,117 @@
> +/*
> + * Aspeed i2c bus interface to reading and writing to i2c device registers
> + *
> + * Copyright (c) 2023 IBM Corporation
> + *
> + * Authors:
> + *   Stefan Berger <stefanb@linux.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "qtest_aspeed.h"
> +
> +#include "hw/i2c/aspeed_i2c.h"
> +#include "libqtest-single.h"
> +
> +#define A_I2CD_M_STOP_CMD       BIT(5)
> +#define A_I2CD_M_RX_CMD         BIT(3)
> +#define A_I2CD_M_TX_CMD         BIT(1)
> +#define A_I2CD_M_START_CMD      BIT(0)
> +
> +#define A_I2CD_MASTER_EN        BIT(0)

Why do you need to include the aspeed_i2c.h file and add some more
definitions ? Couldn't we gather all of them under the same file ?

> +
> +static void aspeed_i2c_startup(uint32_t baseaddr, uint8_t slave_addr,
> +                               uint8_t reg)
> +{
> +    uint32_t v;
> +    static int once;
> +
> +    if (!once) {
> +        /* one time: enable master */
> +       writel(baseaddr + A_I2CC_FUN_CTRL, 0);
> +       v = readl(baseaddr + A_I2CC_FUN_CTRL) | A_I2CD_MASTER_EN;
> +       writel(baseaddr + A_I2CC_FUN_CTRL, v);
> +       once = 1;
> +    }
> +
> +    /* select device */
> +    writel(baseaddr + A_I2CD_BYTE_BUF, slave_addr << 1);
> +    writel(baseaddr + A_I2CD_CMD, A_I2CD_M_START_CMD | A_I2CD_M_RX_CMD);
> +
> +    /* select the register to write to */
> +    writel(baseaddr + A_I2CD_BYTE_BUF, reg);
> +    writel(baseaddr + A_I2CD_CMD, A_I2CD_M_TX_CMD);
> +}
> +
> +static uint32_t aspeed_i2c_read_n(uint32_t baseaddr, uint8_t slave_addr,
> +                                  uint8_t reg, size_t nbytes)
> +{
> +    uint32_t res = 0;
> +    uint32_t v;
> +    size_t i;
> +
> +    aspeed_i2c_startup(baseaddr, slave_addr, reg);
> +
> +    for (i = 0; i < nbytes; i++) {
> +        writel(baseaddr + A_I2CD_CMD, A_I2CD_M_RX_CMD);
> +        v = readl(baseaddr + A_I2CD_BYTE_BUF) >> 8;
> +        res |= (v & 0xff) << (i * 8);
> +    }
> +
> +    writel(baseaddr + A_I2CD_CMD, A_I2CD_M_STOP_CMD);
> +
> +    return res;
> +}
> +
> +uint32_t aspeed_i2c_readl(uint32_t baseaddr, uint8_t slave_addr, uint8_t reg)
> +{
> +    return aspeed_i2c_read_n(baseaddr, slave_addr, reg, sizeof(uint32_t));
> +}
> +
> +uint16_t aspeed_i2c_readw(uint32_t baseaddr, uint8_t slave_addr, uint8_t reg)
> +{
> +    return aspeed_i2c_read_n(baseaddr, slave_addr, reg, sizeof(uint16_t));
> +}
> +
> +uint8_t aspeed_i2c_readb(uint32_t baseaddr, uint8_t slave_addr, uint8_t reg)
> +{
> +    return aspeed_i2c_read_n(baseaddr, slave_addr, reg, sizeof(uint8_t));
> +}
> +
> +static void aspeed_i2c_write_n(uint32_t baseaddr, uint8_t slave_addr,
> +                               uint8_t reg, uint32_t v, size_t nbytes)
> +{
> +    size_t i;
> +
> +    aspeed_i2c_startup(baseaddr, slave_addr, reg);
> +
> +    for (i = 0; i < nbytes; i++) {
> +        writel(baseaddr + A_I2CD_BYTE_BUF, v & 0xff);
> +        v >>= 8;
> +        writel(baseaddr + A_I2CD_CMD, A_I2CD_M_TX_CMD);
> +    }
> +
> +    writel(baseaddr + A_I2CD_CMD, A_I2CD_M_STOP_CMD);
> +}
> +
> +void aspeed_i2c_writel(uint32_t baseaddr, uint8_t slave_addr,
> +                       uint8_t reg, uint32_t v)
> +{
> +    aspeed_i2c_write_n(baseaddr, slave_addr, reg, v, sizeof(v));
> +}
> +
> +void aspeed_i2c_writew(uint32_t baseaddr, uint8_t slave_addr,
> +                       uint8_t reg, uint16_t v)
> +{
> +    aspeed_i2c_write_n(baseaddr, slave_addr, reg, v, sizeof(v));
> +}
> +
> +void aspeed_i2c_writeb(uint32_t baseaddr, uint8_t slave_addr,
> +                       uint8_t reg, uint8_t v)
> +{
> +    aspeed_i2c_write_n(baseaddr, slave_addr, reg, v, sizeof(v));
> +}
> diff --git a/tests/qtest/qtest_aspeed.h b/tests/qtest/qtest_aspeed.h
> new file mode 100644
> index 0000000000..8925f04b7f
> --- /dev/null
> +++ b/tests/qtest/qtest_aspeed.h
> @@ -0,0 +1,27 @@
> +/*
> + * Aspeed i2c bus interface to reading and writing to i2c device registers
> + *
> + * Copyright (c) 2023 IBM Corporation
> + *
> + * Authors:
> + *   Stefan Berger <stefanb@linux.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +#ifndef QTEST_ASPEED_H
> +#define QTEST_ASPEED_H
> +
> +#include <stdint.h>
> +
> +uint8_t aspeed_i2c_readb(uint32_t baseaddr, uint8_t slave_addr, uint8_t reg);
> +uint16_t aspeed_i2c_readw(uint32_t baseaddr, uint8_t slave_addr, uint8_t reg);
> +uint32_t aspeed_i2c_readl(uint32_t baseaddr, uint8_t slave_addr, uint8_t reg);
> +void aspeed_i2c_writeb(uint32_t baseaddr, uint8_t slave_addr,
> +                       uint8_t reg, uint8_t v);
> +void aspeed_i2c_writew(uint32_t baseaddr, uint8_t slave_addr,
> +                       uint8_t reg, uint16_t v);
> +void aspeed_i2c_writel(uint32_t baseaddr, uint8_t slave_addr,
> +                       uint8_t reg, uint32_t v);
> +
> +#endif
> diff --git a/tests/qtest/tpm-tis-i2c-test.c b/tests/qtest/tpm-tis-i2c-test.c
> new file mode 100644
> index 0000000000..c3abdd9372
> --- /dev/null
> +++ b/tests/qtest/tpm-tis-i2c-test.c
> @@ -0,0 +1,628 @@
> +/*
> + * QTest testcase for I2C TPM TIS
> + *
> + * Copyright (c) 2023 IBM Corporation
> + *
> + * Authors:
> + *   Stefan Berger <stefanb@linux.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include <glib/gstdio.h>
> +
> +#include "libqtest-single.h"
> +#include "hw/acpi/tpm.h"
> +#include "hw/pci/pci_ids.h"
> +#include "qtest_aspeed.h"
> +#include "tpm-emu.h"
> +
> +#define DEBUG_TIS_TEST 0
> +
> +#define DPRINTF(fmt, ...) do { \
> +    if (DEBUG_TIS_TEST) { \
> +        printf(fmt, ## __VA_ARGS__); \
> +    } \
> +} while (0)
> +
> +#define DPRINTF_ACCESS \
> +    DPRINTF("%s: %d: locty=%d l=%d access=0x%02x pending_request_flag=0x%x\n", \
> +            __func__, __LINE__, locty, l, access, pending_request_flag)
> +
> +#define DPRINTF_STS \
> +    DPRINTF("%s: %d: sts = 0x%08x\n", __func__, __LINE__, sts)
> +
> +#define I2C_SLAVE_ADDR   0x2e
> +#define I2C_DEV_BUS_NUM  10
> +
> +static const uint8_t TPM_CMD[12] =
> +    "\x80\x01\x00\x00\x00\x0c\x00\x00\x01\x44\x00\x00";
> +
> +uint32_t aspeed_dev_addr = 0X1e78a000 + 0x80 + I2C_DEV_BUS_NUM * 0x80;

0X1e78a000 could be a define.

The resulting address should be calculated with an helper defined in
qtest_aspeed.h, with an ast2600_ prefix in the name since the calculation
is SoC dependent.  See aspeed_i2c_realize().

My knowledge on TPM is too limited to comment. Could you please extract
the I2C driver in its own patch ?

Thanks,

C.

> +
> +uint8_t cur_locty = 0xff;
> +
> +static void tpm_tis_i2c_set_locty(uint8_t locty)
> +{
> +    if (cur_locty != locty) {
> +        cur_locty = locty;
> +        aspeed_i2c_writeb(aspeed_dev_addr, I2C_SLAVE_ADDR,
> +                          TPM_I2C_REG_LOC_SEL, locty);
> +    }
> +}
> +
> +static uint8_t tpm_tis_i2c_readb(uint8_t locty, uint8_t reg)
> +{
> +    tpm_tis_i2c_set_locty(locty);
> +    return aspeed_i2c_readb(aspeed_dev_addr, I2C_SLAVE_ADDR, reg);
> +}
> +
> +static uint16_t tpm_tis_i2c_readw(uint8_t locty, uint8_t reg)
> +{
> +    tpm_tis_i2c_set_locty(locty);
> +    return aspeed_i2c_readw(aspeed_dev_addr, I2C_SLAVE_ADDR, reg);
> +}
> +
> +static uint32_t tpm_tis_i2c_readl(uint8_t locty, uint8_t reg)
> +{
> +    tpm_tis_i2c_set_locty(locty);
> +    return aspeed_i2c_readl(aspeed_dev_addr, I2C_SLAVE_ADDR, reg);
> +}
> +
> +static void tpm_tis_i2c_writeb(uint8_t locty, uint8_t reg, uint8_t v)
> +{
> +    if (reg != TPM_I2C_REG_LOC_SEL) {
> +        tpm_tis_i2c_set_locty(locty);
> +    }
> +    aspeed_i2c_writeb(aspeed_dev_addr, I2C_SLAVE_ADDR, reg, v);
> +}
> +
> +static void tpm_tis_i2c_writel(uint8_t locty, uint8_t reg, uint32_t v)
> +{
> +    if (reg != TPM_I2C_REG_LOC_SEL) {
> +        tpm_tis_i2c_set_locty(locty);
> +    }
> +    aspeed_i2c_writel(aspeed_dev_addr, I2C_SLAVE_ADDR, reg, v);
> +}
> +
> +static void tpm_tis_i2c_test_basic(const void *data)
> +{
> +    uint32_t int_enable;
> +    uint8_t access;
> +    uint32_t v;
> +
> +    /*
> +     * All register accesses below must work without locality 0 being the
> +     * active locality. Therefore, ensure access is released.
> +     */
> +    tpm_tis_i2c_writeb(0, TPM_I2C_REG_ACCESS,
> +                       TPM_TIS_ACCESS_ACTIVE_LOCALITY);
> +    access = tpm_tis_i2c_readb(0, TPM_I2C_REG_ACCESS);
> +    g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +    /* enable all interrupts */
> +    int_enable = (TPM_TIS_INT_ENABLED |
> +                  TPM_TIS_INT_DATA_AVAILABLE |
> +                  TPM_TIS_INT_STS_VALID |
> +                  TPM_TIS_INT_LOCALITY_CHANGED |
> +                  TPM_TIS_INT_COMMAND_READY);
> +    tpm_tis_i2c_writel(0, TPM_I2C_REG_INT_ENABLE, 0xffffffff);
> +    v = tpm_tis_i2c_readl(0, TPM_I2C_REG_INT_ENABLE);
> +    g_assert_cmpint(v, ==, int_enable);
> +
> +    /* read interrupt capability */
> +    v = tpm_tis_i2c_readl(0, TPM_I2C_REG_INT_CAPABILITY);
> +    g_assert_cmpint(v, ==, int_enable);
> +
> +    /* disable all interrupts */
> +    tpm_tis_i2c_writel(0, TPM_I2C_REG_INT_ENABLE, 0);
> +    v = tpm_tis_i2c_readl(0, TPM_I2C_REG_INT_ENABLE);
> +    g_assert_cmpint(v, ==, 0);
> +
> +    /* write to unsupported register 0x1 */
> +    tpm_tis_i2c_writel(0, 1, 0x12345678);
> +    v = tpm_tis_i2c_readl(0, 1);
> +    g_assert_cmpint(v, ==, 0xffffffff);
> +}
> +
> +static void tpm_tis_i2c_test_check_localities(const void *data)
> +{
> +    uint8_t locty, l;
> +    uint8_t access;
> +    uint32_t capability, i2c_cap;
> +    uint32_t didvid;
> +    uint32_t rid;
> +
> +    for (locty = 0; locty < TPM_TIS_NUM_LOCALITIES; locty++) {
> +        access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
> +        g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                    TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +        capability = tpm_tis_i2c_readl(locty, TPM_I2C_REG_INTF_CAPABILITY);
> +        i2c_cap = (TPM_I2C_CAP_INTERFACE_TYPE |
> +                   TPM_I2C_CAP_INTERFACE_VER  |
> +                   TPM_I2C_CAP_TPM2_FAMILY    |
> +                   TPM_I2C_CAP_LOCALITY_CAP   |
> +                   TPM_I2C_CAP_BUS_SPEED      |
> +                   TPM_I2C_CAP_DEV_ADDR_CHANGE);
> +        g_assert_cmpint(capability, ==, i2c_cap);
> +
> +        didvid = tpm_tis_i2c_readl(locty, TPM_I2C_REG_DID_VID);
> +        g_assert_cmpint(didvid, ==, (1 << 16) | PCI_VENDOR_ID_IBM);
> +
> +        rid = tpm_tis_i2c_readl(locty, TPM_I2C_REG_RID);
> +        g_assert_cmpint(rid, !=, 0);
> +        g_assert_cmpint(rid, !=, 0xffffffff);
> +
> +        /* locality selection must be at locty */
> +        l = tpm_tis_i2c_readb(locty, TPM_I2C_REG_LOC_SEL);
> +        g_assert_cmpint(l, ==, locty);
> +    }
> +}
> +
> +static void tpm_tis_i2c_test_check_access_reg(const void *data)
> +{
> +    uint8_t locty;
> +    uint8_t access;
> +
> +    /* do not test locality 4 (hw only) */
> +    for (locty = 0; locty < TPM_TIS_NUM_LOCALITIES - 1; locty++) {
> +        access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
> +        g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                    TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +        /* request use of locality */
> +        tpm_tis_i2c_writeb(locty, TPM_I2C_REG_ACCESS,
> +                           TPM_TIS_ACCESS_REQUEST_USE);
> +
> +        access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
> +        g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                    TPM_TIS_ACCESS_ACTIVE_LOCALITY |
> +                                    TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +        /* release access */
> +        tpm_tis_i2c_writeb(locty, TPM_I2C_REG_ACCESS,
> +                           TPM_TIS_ACCESS_ACTIVE_LOCALITY);
> +        access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
> +        g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                    TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +    }
> +}
> +
> +/*
> + * Test case for seizing access by a higher number locality
> + */
> +static void tpm_tis_i2c_test_check_access_reg_seize(const void *data)
> +{
> +    int locty, l;
> +    uint8_t access;
> +    uint8_t pending_request_flag;
> +
> +    /* do not test locality 4 (hw only) */
> +    for (locty = 0; locty < 1/*TPM_TIS_NUM_LOCALITIES - 1*/; locty++) {
> +        pending_request_flag = 0;
> +
> +        access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
> +        g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                    TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +        /* request use of locality */
> +        tpm_tis_i2c_writeb(locty,
> +                           TPM_I2C_REG_ACCESS, TPM_TIS_ACCESS_REQUEST_USE);
> +        access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
> +        g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                    TPM_TIS_ACCESS_ACTIVE_LOCALITY |
> +                                    TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +        /* lower localities cannot seize access */
> +        for (l = 0; l < locty; l++) {
> +            /* lower locality is not active */
> +            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
> +            DPRINTF_ACCESS;
> +            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                        pending_request_flag |
> +                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +            /* try to request use from 'l' */
> +            tpm_tis_i2c_writeb(l,
> +                               TPM_I2C_REG_ACCESS,
> +                               TPM_TIS_ACCESS_REQUEST_USE);
> +
> +            /*
> +             * requesting use from 'l' was not possible;
> +             * we must see REQUEST_USE and possibly PENDING_REQUEST
> +             */
> +            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
> +            DPRINTF_ACCESS;
> +            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                        TPM_TIS_ACCESS_REQUEST_USE |
> +                                        pending_request_flag |
> +                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +            /*
> +             * locality 'locty' must be unchanged;
> +             * we must see PENDING_REQUEST
> +             */
> +            access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
> +            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                        TPM_TIS_ACCESS_ACTIVE_LOCALITY |
> +                                        TPM_TIS_ACCESS_PENDING_REQUEST |
> +                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +            /* try to seize from 'l' */
> +            tpm_tis_i2c_writeb(l,
> +                               TPM_I2C_REG_ACCESS, TPM_TIS_ACCESS_SEIZE);
> +            /* seize from 'l' was not possible */
> +            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
> +            DPRINTF_ACCESS;
> +            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                        TPM_TIS_ACCESS_REQUEST_USE |
> +                                        pending_request_flag |
> +                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +            /* locality 'locty' must be unchanged */
> +            access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
> +            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                        TPM_TIS_ACCESS_ACTIVE_LOCALITY |
> +                                        TPM_TIS_ACCESS_PENDING_REQUEST |
> +                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +            /*
> +             * on the next loop we will have a PENDING_REQUEST flag
> +             * set for locality 'l'
> +             */
> +            pending_request_flag = TPM_TIS_ACCESS_PENDING_REQUEST;
> +        }
> +
> +        /*
> +         * higher localities can 'seize' access but not 'request use';
> +         * note: this will activate first l+1, then l+2 etc.
> +         */
> +        for (l = locty + 1; l < TPM_TIS_NUM_LOCALITIES - 1; l++) {
> +            /* try to 'request use' from 'l' */
> +            tpm_tis_i2c_writeb(l, TPM_I2C_REG_ACCESS,
> +                               TPM_TIS_ACCESS_REQUEST_USE);
> +
> +            /*
> +             * requesting use from 'l' was not possible; we should see
> +             * REQUEST_USE and may see PENDING_REQUEST
> +             */
> +            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
> +            DPRINTF_ACCESS;
> +            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                        TPM_TIS_ACCESS_REQUEST_USE |
> +                                        pending_request_flag |
> +                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +            /*
> +             * locality 'l-1' must be unchanged; we should always
> +             * see PENDING_REQUEST from 'l' requesting access
> +             */
> +            access = tpm_tis_i2c_readb(l - 1, TPM_I2C_REG_ACCESS);
> +            DPRINTF_ACCESS;
> +            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                        TPM_TIS_ACCESS_ACTIVE_LOCALITY |
> +                                        TPM_TIS_ACCESS_PENDING_REQUEST |
> +                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +            /* try to seize from 'l' */
> +            tpm_tis_i2c_writeb(l, TPM_I2C_REG_ACCESS, TPM_TIS_ACCESS_SEIZE);
> +
> +            /* seize from 'l' was possible */
> +            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
> +            DPRINTF_ACCESS;
> +            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                        TPM_TIS_ACCESS_ACTIVE_LOCALITY |
> +                                        pending_request_flag |
> +                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +            /* l - 1 should show that it has BEEN_SEIZED */
> +            access = tpm_tis_i2c_readb(l - 1, TPM_I2C_REG_ACCESS);
> +            DPRINTF_ACCESS;
> +            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                        TPM_TIS_ACCESS_BEEN_SEIZED |
> +                                        pending_request_flag |
> +                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +            /* clear the BEEN_SEIZED flag and make sure it's gone */
> +            tpm_tis_i2c_writeb(l - 1, TPM_I2C_REG_ACCESS,
> +                               TPM_TIS_ACCESS_BEEN_SEIZED);
> +
> +            access = tpm_tis_i2c_readb(l - 1, TPM_I2C_REG_ACCESS);
> +            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                        pending_request_flag |
> +                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +        }
> +
> +        /*
> +         * PENDING_REQUEST will not be set if locty = 0 since all localities
> +         * were active; in case of locty = 1, locality 0 will be active
> +         * but no PENDING_REQUEST anywhere
> +         */
> +        if (locty <= 1) {
> +            pending_request_flag = 0;
> +        }
> +
> +        /* release access from l - 1; this activates locty - 1 */
> +        l--;
> +
> +        access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
> +        DPRINTF_ACCESS;
> +
> +        DPRINTF("%s: %d: relinquishing control on l = %d\n",
> +                __func__, __LINE__, l);
> +        tpm_tis_i2c_writeb(l, TPM_I2C_REG_ACCESS,
> +                           TPM_TIS_ACCESS_ACTIVE_LOCALITY);
> +
> +        access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
> +        DPRINTF_ACCESS;
> +        g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                    pending_request_flag |
> +                                    TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +        for (l = locty - 1; l >= 0; l--) {
> +            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
> +            DPRINTF_ACCESS;
> +            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                        TPM_TIS_ACCESS_ACTIVE_LOCALITY |
> +                                        pending_request_flag |
> +                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +            /* release this locality */
> +            tpm_tis_i2c_writeb(l, TPM_I2C_REG_ACCESS,
> +                               TPM_TIS_ACCESS_ACTIVE_LOCALITY);
> +
> +            if (l == 1) {
> +                pending_request_flag = 0;
> +            }
> +        }
> +
> +        /* no locality may be active now */
> +        for (l = 0; l < TPM_TIS_NUM_LOCALITIES - 1; l++) {
> +            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
> +            DPRINTF_ACCESS;
> +            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +        }
> +    }
> +}
> +
> +/*
> + * Test case for getting access when higher number locality relinquishes access
> + */
> +static void tpm_tis_i2c_test_check_access_reg_release(const void *data)
> +{
> +    int locty, l;
> +    uint8_t access;
> +    uint8_t pending_request_flag;
> +
> +    /* do not test locality 4 (hw only) */
> +    for (locty = TPM_TIS_NUM_LOCALITIES - 2; locty >= 0; locty--) {
> +        pending_request_flag = 0;
> +
> +        access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
> +        g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                    TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +        /* request use of locality */
> +        tpm_tis_i2c_writeb(locty, TPM_I2C_REG_ACCESS,
> +                           TPM_TIS_ACCESS_REQUEST_USE);
> +        access = tpm_tis_i2c_readb(locty, TPM_I2C_REG_ACCESS);
> +        g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                    TPM_TIS_ACCESS_ACTIVE_LOCALITY |
> +                                    TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +        /* request use of all other localities */
> +        for (l = 0; l < TPM_TIS_NUM_LOCALITIES - 1; l++) {
> +            if (l == locty) {
> +                continue;
> +            }
> +            /*
> +             * request use of locality 'l' -- we MUST see REQUEST USE and
> +             * may see PENDING_REQUEST
> +             */
> +            tpm_tis_i2c_writeb(l, TPM_I2C_REG_ACCESS,
> +                               TPM_TIS_ACCESS_REQUEST_USE);
> +            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
> +            DPRINTF_ACCESS;
> +            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                        TPM_TIS_ACCESS_REQUEST_USE |
> +                                        pending_request_flag |
> +                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +            pending_request_flag = TPM_TIS_ACCESS_PENDING_REQUEST;
> +        }
> +        /* release locality 'locty' */
> +        tpm_tis_i2c_writeb(locty, TPM_I2C_REG_ACCESS,
> +                           TPM_TIS_ACCESS_ACTIVE_LOCALITY);
> +        /*
> +         * highest locality should now be active; release it and make sure the
> +         * next higest locality is active afterwards
> +         */
> +        for (l = TPM_TIS_NUM_LOCALITIES - 2; l >= 0; l--) {
> +            if (l == locty) {
> +                continue;
> +            }
> +            /* 'l' should be active now */
> +            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
> +            DPRINTF_ACCESS;
> +            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                        TPM_TIS_ACCESS_ACTIVE_LOCALITY |
> +                                        pending_request_flag |
> +                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +            /* 'l' relinquishes access */
> +            tpm_tis_i2c_writeb(l, TPM_I2C_REG_ACCESS,
> +                               TPM_TIS_ACCESS_ACTIVE_LOCALITY);
> +            access = tpm_tis_i2c_readb(l, TPM_I2C_REG_ACCESS);
> +            DPRINTF_ACCESS;
> +            if (l == 1 || (locty <= 1 && l == 2)) {
> +                pending_request_flag = 0;
> +            }
> +            g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                        pending_request_flag |
> +                                        TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +        }
> +    }
> +}
> +
> +/*
> + * Test case for transmitting packets
> + */
> +static void tpm_tis_i2c_test_check_transmit(const void *data)
> +{
> +    const TPMTestState *s = data;
> +    uint8_t access;
> +    uint32_t sts, v;
> +    uint16_t bcount, csum;
> +    size_t i;
> +
> +    /* enable csum */
> +    tpm_tis_i2c_writeb(0, TPM_I2C_REG_DATA_CSUM_ENABLE, TPM_DATA_CSUM_ENABLED);
> +    /* check csum enable register has bit 0 set */
> +    v = tpm_tis_i2c_readb(0, TPM_I2C_REG_DATA_CSUM_ENABLE);
> +    g_assert_cmpint(v, ==, TPM_DATA_CSUM_ENABLED);
> +    /* reading it as 32bit register returns same result */
> +    v = tpm_tis_i2c_readl(0, TPM_I2C_REG_DATA_CSUM_ENABLE);
> +    g_assert_cmpint(v, ==, TPM_DATA_CSUM_ENABLED);
> +
> +    /* request use of locality 0 */
> +    tpm_tis_i2c_writeb(0, TPM_I2C_REG_ACCESS, TPM_TIS_ACCESS_REQUEST_USE);
> +    access = tpm_tis_i2c_readb(0, TPM_I2C_REG_ACCESS);
> +    g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                TPM_TIS_ACCESS_ACTIVE_LOCALITY |
> +                                TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +    sts = tpm_tis_i2c_readl(0, TPM_I2C_REG_STS);
> +    DPRINTF_STS;
> +
> +    g_assert_cmpint(sts & 0xff, ==, 0);
> +
> +    bcount = (sts >> 8) & 0xffff;
> +    g_assert_cmpint(bcount, >=, 128);
> +
> +    /* ic2 must have bits 26-31 zero */
> +    g_assert_cmpint(sts & (0x1f << 26), ==, 0);
> +
> +    tpm_tis_i2c_writel(0, TPM_I2C_REG_STS, TPM_TIS_STS_COMMAND_READY);
> +    sts = tpm_tis_i2c_readl(0, TPM_I2C_REG_STS);
> +    DPRINTF_STS;
> +    g_assert_cmpint(sts & 0xff, ==, TPM_TIS_STS_COMMAND_READY);
> +
> +    /* transmit command */
> +    for (i = 0; i < sizeof(TPM_CMD); i++) {
> +        tpm_tis_i2c_writeb(0, TPM_I2C_REG_DATA_FIFO, TPM_CMD[i]);
> +        sts = tpm_tis_i2c_readl(0, TPM_I2C_REG_STS);
> +        DPRINTF_STS;
> +        if (i < sizeof(TPM_CMD) - 1) {
> +            g_assert_cmpint(sts & 0xff, ==,
> +                            TPM_TIS_STS_EXPECT | TPM_TIS_STS_VALID);
> +        } else {
> +            g_assert_cmpint(sts & 0xff, ==, TPM_TIS_STS_VALID);
> +        }
> +        g_assert_cmpint((sts >> 8) & 0xffff, ==, --bcount);
> +    }
> +    /* read the checksum */
> +    csum = tpm_tis_i2c_readw(0, TPM_I2C_REG_DATA_CSUM_GET);
> +    g_assert_cmpint(csum, ==, 0x6733);
> +
> +    /* start processing */
> +    tpm_tis_i2c_writeb(0, TPM_I2C_REG_STS, TPM_TIS_STS_TPM_GO);
> +
> +    uint64_t end_time = g_get_monotonic_time() + 50 * G_TIME_SPAN_SECOND;
> +    do {
> +        sts = tpm_tis_i2c_readl(0, TPM_I2C_REG_STS);
> +        if ((sts & TPM_TIS_STS_DATA_AVAILABLE) != 0) {
> +            break;
> +        }
> +    } while (g_get_monotonic_time() < end_time);
> +
> +    sts = tpm_tis_i2c_readl(0, TPM_I2C_REG_STS);
> +    DPRINTF_STS;
> +    g_assert_cmpint(sts & 0xff, == ,
> +                    TPM_TIS_STS_VALID | TPM_TIS_STS_DATA_AVAILABLE);
> +    bcount = (sts >> 8) & 0xffff;
> +
> +    /* read response */
> +    uint8_t tpm_msg[sizeof(struct tpm_hdr)];
> +    g_assert_cmpint(sizeof(tpm_msg), ==, bcount);
> +
> +    for (i = 0; i < sizeof(tpm_msg); i++) {
> +        tpm_msg[i] = tpm_tis_i2c_readb(0, TPM_I2C_REG_DATA_FIFO);
> +        sts = tpm_tis_i2c_readl(0, TPM_I2C_REG_STS);
> +        DPRINTF_STS;
> +        if (sts & TPM_TIS_STS_DATA_AVAILABLE) {
> +            g_assert_cmpint((sts >> 8) & 0xffff, ==, --bcount);
> +        }
> +    }
> +    g_assert_cmpmem(tpm_msg, sizeof(tpm_msg), s->tpm_msg, sizeof(*s->tpm_msg));
> +
> +    /* relinquish use of locality 0 */
> +    tpm_tis_i2c_writeb(0,
> +                       TPM_I2C_REG_ACCESS, TPM_TIS_ACCESS_ACTIVE_LOCALITY);
> +    access = tpm_tis_i2c_readb(0, TPM_I2C_REG_ACCESS);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    int ret;
> +    char *args;
> +    char *tmp_path = g_dir_make_tmp("qemu-tpm-tis-i2c-test.XXXXXX", NULL);
> +    GThread *thread;
> +    TPMTestState test;
> +
> +    module_call_init(MODULE_INIT_QOM);
> +    g_test_init(&argc, &argv, NULL);
> +
> +    test.addr = g_new0(SocketAddress, 1);
> +    test.addr->type = SOCKET_ADDRESS_TYPE_UNIX;
> +    test.addr->u.q_unix.path = g_build_filename(tmp_path, "sock", NULL);
> +    g_mutex_init(&test.data_mutex);
> +    g_cond_init(&test.data_cond);
> +    test.data_cond_signal = false;
> +    test.tpm_version = TPM_VERSION_2_0;
> +
> +    thread = g_thread_new(NULL, tpm_emu_ctrl_thread, &test);
> +    tpm_emu_test_wait_cond(&test);
> +
> +    args = g_strdup_printf(
> +        "-machine rainier-bmc -accel tcg -trace tpm_tis_i2c* "
> +        "-chardev socket,id=chr,path=%s "
> +        "-tpmdev emulator,id=tpm0,chardev=chr "
> +        "-device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.%d,address=0x%x",
> +        test.addr->u.q_unix.path,
> +        I2C_DEV_BUS_NUM,
> +        I2C_SLAVE_ADDR);
> +    qtest_start(args);
> +
> +    qtest_add_data_func("/tpm-tis-i2c/test_basic", &test,
> +                        tpm_tis_i2c_test_basic);
> +
> +    qtest_add_data_func("/tpm-tis-i2c/test_check_localities", &test,
> +                        tpm_tis_i2c_test_check_localities);
> +
> +    qtest_add_data_func("/tpm-tis-i2c/check_access_reg", &test,
> +                        tpm_tis_i2c_test_check_access_reg);
> +
> +    qtest_add_data_func("/tpm-tis-i2c/check_access_reg_seize", &test,
> +                        tpm_tis_i2c_test_check_access_reg_seize);
> +
> +    qtest_add_data_func("/tpm-tis-i2c/check_access_reg_release", &test,
> +                        tpm_tis_i2c_test_check_access_reg_release);
> +
> +    qtest_add_data_func("/tpm-tis-i2c/test_check_transmit", &test,
> +                        tpm_tis_i2c_test_check_transmit);
> +
> +    ret = g_test_run();
> +
> +    qtest_end();
> +
> +    g_thread_join(thread);
> +    g_unlink(test.addr->u.q_unix.path);
> +    qapi_free_SocketAddress(test.addr);
> +    g_rmdir(tmp_path);
> +    g_free(tmp_path);
> +    g_free(args);
> +    return ret;
> +}


