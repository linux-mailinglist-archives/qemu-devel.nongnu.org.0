Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF61F240D11
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 20:36:55 +0200 (CEST)
Received: from localhost ([::1]:58506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5CfG-0004Z1-US
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 14:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1k5CeI-0003wW-N5
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 14:35:54 -0400
Received: from mail-eopbgr750072.outbound.protection.outlook.com
 ([40.107.75.72]:42733 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1k5CeF-0005AP-JE
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 14:35:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahkOLRHk47vkJp/hiOnKZ7Eu17adHL8W5z+YTDlV0rMCxSn1JN5uZvaEKTSgjgbNOZyJQLm9Lr+ZPJXXGDv2OVcd3sLoHmZJvKw7V34VYs2igzeZbCxVA095vnHFtEaobzWNGl0e11FBJkIVrp9Htew/lbxhyKMA6c/rf3qSU/uL+Bf/r46W5o7n5aN9Vle3K/3lrASz95C/UcxFRqxdDV0h76YUZSbzQi8KX59r13Ez4HmRA5YMdol2iDrGiWkSQQXZeyuxYyxuF04ylHaI7xiaOzqIkG/AunXcpMqDjqfxHTks5br5/9jKbeCXKhilTn/r1CE6z5vlvkMBIqrF0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1POVjar4k4uu67LKc4sgRcvcF9PoLp5dnwFJ4KNySZs=;
 b=H+E3NY4FEnqOMeQ13DTj1Xep0eywXoLfUr1O+mbjqBHCGD+4Wc20sBQAoVMEhWyxUvL9d7tv6eCMvvjm5thTElBDgczmesfbh8ILzh6dzqzfCbGdMCdl3vN4zsSprYs2iIxiA4yQBMu1IbhAYES82S1Vfg7ld3dMw99EBYhm9Gzs6+pc1HBug8wsPqDLcBU5EHo6n+/SkWhzt+IgC2M455yatIcVr9bU8dKUXTT8qGPF7yVfhspx9LihYWfE7Y6rPJnx+T4qAeZCTrG4BCgAxbToj2HZ6GgzqWlB2jVTzJgvc3kINmp8BHqW0Sb9/4WKyTBkB5+C1EbX3iqkpFxOVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1POVjar4k4uu67LKc4sgRcvcF9PoLp5dnwFJ4KNySZs=;
 b=E/IBeDbfP9kot+ybqpi+Plxrqx4GSPSZvZdxOTMahnSMpM+N0LI1/kePuTDJTfgdVqRaLQ+kmkmo8l1DJbEcGl+PVpbhZP2vPq0GmawQX5DoakokwfRU8lzs8hVlsEJ6ppdmEybHND1YhWF8nrJyYLsAWfNDfmpghXpcncniwy4=
Received: from SA9PR11CA0018.namprd11.prod.outlook.com (2603:10b6:806:6e::23)
 by CH2PR02MB6523.namprd02.prod.outlook.com (2603:10b6:610:34::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Mon, 10 Aug
 2020 18:20:43 +0000
Received: from SN1NAM02FT0054.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:6e:cafe::89) by SA9PR11CA0018.outlook.office365.com
 (2603:10b6:806:6e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16 via Frontend
 Transport; Mon, 10 Aug 2020 18:20:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT0054.mail.protection.outlook.com (10.97.4.242) with Microsoft SMTP
 Server id 15.20.3261.19 via Frontend Transport; Mon, 10 Aug 2020 18:20:43
 +0000
Received: from [149.199.38.66] (port=34635 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1k5CPV-0000Yf-0h; Mon, 10 Aug 2020 11:20:37 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1k5CPb-0007RW-1Z; Mon, 10 Aug 2020 11:20:43 -0700
Received: from [10.23.120.191] (helo=debian)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1k5CPX-0007PT-JP; Mon, 10 Aug 2020 11:20:39 -0700
Date: Mon, 10 Aug 2020 19:20:37 +0100
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
Subject: Re: [PATCH v8 3/4] tests/qtest: Introduce tests for Xilinx ZynqMP
 CAN controller
Message-ID: <20200810182036.vbur74n74rgca6mk@debian>
References: <1596575505-163040-1-git-send-email-fnu.vikram@xilinx.com>
 <1596575505-163040-4-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1596575505-163040-4-git-send-email-fnu.vikram@xilinx.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 238e926e-ace1-4cfa-cb21-08d83d5a182e
X-MS-TrafficTypeDiagnostic: CH2PR02MB6523:
X-Microsoft-Antispam-PRVS: <CH2PR02MB65234220AE58AEEA81F1678FAD440@CH2PR02MB6523.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Aetf1Pr0lR2OLuu64M7wnzNAN39nKP8Sq1Tjw+MCsLwG5lwLKHCpNkzK5OuZt2GyBScQ0A2CKWF1Wp3jreQH2drYIUnfvl6iZqRw1LN2HXHfRM+yuXHGx89F1Id9oGnlNYy0YgEm+9RbmhwaTciprth7uM5vVTfYpoChvrjc07xPUPM2SRcXLG9lBCbNXGHNF4sUWiIu2NIUAxIObwxijGwp+oEHiUeieFKCceOdg8/yIThKCNd8ACg8gqUNH+9/hhccQ8fatlYbIhFt+R15UYsW4Ltda0tnjcA2xW4UsQJvpplLs4T7IuA9MrvnpPvFiZ/y0Iajc3Sw8+vKUvluZtZu2/kiXInlZO2dTe/IMZO0tbtc99LVunUP9UekPdCmTxuPokTlMTHhhbrJ8UMPg==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(39860400002)(136003)(396003)(46966005)(70206006)(5660300002)(70586007)(30864003)(478600001)(6636002)(426003)(9786002)(316002)(9576002)(82740400003)(47076004)(1076003)(81166007)(83380400001)(356005)(82310400002)(2906002)(8676002)(44832011)(186003)(33716001)(26005)(336012)(54906003)(9686003)(8936002)(6862004)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 18:20:43.4966 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 238e926e-ace1-4cfa-cb21-08d83d5a182e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0054.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6523
Received-SPF: pass client-ip=40.107.75.72; envelope-from=figlesia@xilinx.com;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 14:35:49
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Vikram,

On Tue, Aug 04, 2020 at 02:11:44PM -0700, Vikram Garhwal wrote:
> The QTests perform five tests on the Xilinx ZynqMP CAN controller:
>     Tests the CAN controller in loopback, sleep and snoop mode.
>     Tests filtering of incoming CAN messages.
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>  tests/qtest/Makefile.include |   2 +
>  tests/qtest/xlnx-can-test.c  | 359 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 361 insertions(+)
>  create mode 100644 tests/qtest/xlnx-can-test.c
> 
> diff --git a/tests/qtest/Makefile.include b/tests/qtest/Makefile.include
> index b0204e4..ca0e652 100644
> --- a/tests/qtest/Makefile.include
> +++ b/tests/qtest/Makefile.include
> @@ -138,6 +138,7 @@ check-qtest-aarch64-$(CONFIG_TPM_TIS_SYSBUS) += tpm-tis-device-swtpm-test
>  check-qtest-aarch64-y += numa-test
>  check-qtest-aarch64-y += boot-serial-test
>  check-qtest-aarch64-y += migration-test
> +check-qtest-aarch64-y += xlnx-can-test
>  
>  # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make test unconditional
>  ifneq ($(ARCH),arm)
> @@ -268,6 +269,7 @@ tests/qtest/bios-tables-test$(EXESUF): tests/qtest/bios-tables-test.o \
>  	tests/qtest/boot-sector.o tests/qtest/acpi-utils.o $(libqos-obj-y)
>  tests/qtest/pxe-test$(EXESUF): tests/qtest/pxe-test.o tests/qtest/boot-sector.o $(libqos-obj-y)
>  tests/qtest/microbit-test$(EXESUF): tests/qtest/microbit-test.o
> +tests/qtest/xlnx-can-test$(EXESUF): tests/qtest/xlnx-can-test.o
>  tests/qtest/m25p80-test$(EXESUF): tests/qtest/m25p80-test.o
>  tests/qtest/i440fx-test$(EXESUF): tests/qtest/i440fx-test.o $(libqos-pc-obj-y)
>  tests/qtest/q35-test$(EXESUF): tests/qtest/q35-test.o $(libqos-pc-obj-y)
> diff --git a/tests/qtest/xlnx-can-test.c b/tests/qtest/xlnx-can-test.c
> new file mode 100644
> index 0000000..7a3c5b1
> --- /dev/null
> +++ b/tests/qtest/xlnx-can-test.c
> @@ -0,0 +1,359 @@
> +/*
> + * QTests for the Xilinx ZynqMP CAN controller.
> + *
> + * Copyright (c) 2020 Xilinx Inc.
> + *
> + * Written-by: Vikram Garhwal<fnu.vikram@xilinx.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +
> +/* Base address. */
> +#define CAN0_BASE_ADDR          0xFF060000
> +#define CAN1_BASE_ADDR          0xFF070000
> +
> +/* Register addresses. */
> +#define R_SRR_OFFSET            0x00
> +#define R_MSR_OFFSET            0x04
> +#define R_SR_OFFSET             0x18
> +#define R_ISR_OFFSET            0x1C
> +#define R_ICR_OFFSET            0x24
> +#define R_TXID_OFFSET           0x30
> +#define R_TXDLC_OFFSET          0x34
> +#define R_TXDATA1_OFFSET        0x38
> +#define R_TXDATA2_OFFSET        0x3C
> +#define R_RXID_OFFSET           0x50
> +#define R_RXDLC_OFFSET          0x54
> +#define R_RXDATA1_OFFSET        0x58
> +#define R_RXDATA2_OFFSET        0x5C
> +#define R_AFR                   0x60
> +#define R_AFMR1                 0x64
> +#define R_AFIR1                 0x68
> +#define R_AFMR2                 0x6C
> +#define R_AFIR2                 0x70
> +#define R_AFMR3                 0x74
> +#define R_AFIR3                 0x78
> +#define R_AFMR4                 0x7C
> +#define R_AFIR4                 0x80
> +
> +/* CAN modes. */
> +#define CONFIG_MODE             0x00
> +#define NORMAL_MODE             0x00
> +#define LOOPBACK_MODE           0x02
> +#define SNOOP_MODE              0x04
> +#define SLEEP_MODE              0x01
> +#define ENABLE_CAN              (1 << 1)
> +#define STATUS_NORMAL_MODE      (1 << 3)
> +#define STATUS_LOOPBACK_MODE    (1 << 1)
> +#define STATUS_SNOOP_MODE       (1 << 12)
> +#define STATUS_SLEEP_MODE       (1 << 2)
> +#define ISR_TXOK                (1 << 1)
> +#define ISR_RXOK                (1 << 4)
> +
> +static void match_rx_tx_data(uint32_t *buf_tx, uint32_t *buf_rx,
> +                             uint8_t can_timestamp)
> +{
> +    uint16_t size = 0;
> +    uint8_t len = 4;
> +
> +    while (size < len) {
> +        if (R_RXID_OFFSET + 4 * size == R_RXDLC_OFFSET)  {
> +            g_assert_cmpint(buf_rx[size], ==, buf_tx[size] + can_timestamp);
> +        } else {
> +            g_assert_cmpint(buf_rx[size], ==, buf_tx[size]);
> +        }
> +
> +        size++;
> +    }
> +}
> +
> +static void read_data(QTestState *qts, uint64_t can_base_addr, uint32_t *buf_rx)
> +{
> +    uint32_t int_status;
> +
> +    /* Read the interrupt on CAN rx. */
> +    int_status = qtest_readl(qts, can_base_addr + R_ISR_OFFSET) & ISR_RXOK;
> +
> +    g_assert_cmpint(int_status, ==, ISR_RXOK);
> +
> +    /* Read the RX register data for CAN. */
> +    buf_rx[0] = qtest_readl(qts, can_base_addr + R_RXID_OFFSET);
> +    buf_rx[1] = qtest_readl(qts, can_base_addr + R_RXDLC_OFFSET);
> +    buf_rx[2] = qtest_readl(qts, can_base_addr + R_RXDATA1_OFFSET);
> +    buf_rx[3] = qtest_readl(qts, can_base_addr + R_RXDATA2_OFFSET);
> +
> +    /* Clear the RX interrupt. */
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_ICR_OFFSET, ISR_RXOK);
> +}
> +
> +static void send_data(QTestState *qts, uint64_t can_base_addr, uint32_t *buf_tx)
> +{
> +    uint32_t int_status;
> +
> +    /* Write the TX register data for CAN. */
> +    qtest_writel(qts, can_base_addr + R_TXID_OFFSET, buf_tx[0]);
> +    qtest_writel(qts, can_base_addr + R_TXDLC_OFFSET, buf_tx[1]);
> +    qtest_writel(qts, can_base_addr + R_TXDATA1_OFFSET, buf_tx[2]);
> +    qtest_writel(qts, can_base_addr + R_TXDATA2_OFFSET, buf_tx[3]);
> +
> +    /* Read the interrupt on CAN for tx. */
> +    int_status = qtest_readl(qts, can_base_addr + R_ISR_OFFSET) & ISR_TXOK;
> +
> +    g_assert_cmpint(int_status, ==, ISR_TXOK);
> +
> +    /* Clear the interrupt for tx. */
> +    qtest_writel(qts, CAN0_BASE_ADDR + R_ICR_OFFSET, ISR_TXOK);
> +}
> +
> +/*
> + * This test will be transferring data from CAN0 and CAN1 through canbus. CAN0
> + * initiate the data transfer to can-bus, CAN1 receives the data. Test compares
> + * the data sent from CAN0 with received on CAN1.
> + */
> +static void test_can_bus(void)
> +{
> +    uint32_t buf_tx[4] = { 0xFF, 0x80000000, 0x12345678, 0x87654321 };
> +    uint32_t buf_rx[4] = { 0x00, 0x00, 0x00, 0x00 };
> +    uint32_t status = 0;
> +    uint8_t can_timestamp = 1;
> +
> +    QTestState *qts = qtest_init("-machine xlnx-zcu102"
> +                " -object can-bus,id=canbus0"
> +                " -machine xlnx-zcu102.canbus0=canbus0"
> +                " -machine xlnx-zcu102.canbus1=canbus0"
> +                );
> +
> +    /* Configure the CAN0 and CAN1. */
> +    qtest_writel(qts, CAN0_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
> +    qtest_writel(qts, CAN0_BASE_ADDR + R_MSR_OFFSET, NORMAL_MODE);
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_MSR_OFFSET, NORMAL_MODE);
> +
> +    /* Check here if CAN0 and CAN1 are in normal mode. */
> +    status = qtest_readl(qts, CAN0_BASE_ADDR + R_SR_OFFSET);
> +    g_assert_cmpint(status, ==, STATUS_NORMAL_MODE);
> +
> +    status = qtest_readl(qts, CAN1_BASE_ADDR + R_SR_OFFSET);
> +    g_assert_cmpint(status, ==, STATUS_NORMAL_MODE);
> +
> +    send_data(qts, CAN0_BASE_ADDR, buf_tx);
> +
> +    read_data(qts, CAN1_BASE_ADDR, buf_rx);
> +    match_rx_tx_data(buf_tx, buf_rx, can_timestamp);
> +
> +    qtest_quit(qts);
> +}
> +
> +/*
> + * This test is performing loopback mode on CAN0 and CAN1. Data sent from TX of
> + * each CAN0 and CAN1 are compared with RX register data for respective CAN.
> + */
> +static void test_can_loopback(void)
> +{
> +    uint32_t buf_tx[4] = { 0xFF, 0x80000000, 0x12345678, 0x87654321 };
> +    uint32_t buf_rx[4] = { 0x00, 0x00, 0x00, 0x00 };
> +    uint32_t status = 0;
> +
> +    QTestState *qts = qtest_init("-machine xlnx-zcu102"
> +                " -object can-bus,id=canbus0"
> +                " -machine xlnx-zcu102.canbus0=canbus0"
> +                " -machine xlnx-zcu102.canbus1=canbus0"
> +                );
> +
> +    /* Configure the CAN0 in loopback mode. */
> +    qtest_writel(qts, CAN0_BASE_ADDR + R_SRR_OFFSET, CONFIG_MODE);
> +    qtest_writel(qts, CAN0_BASE_ADDR + R_MSR_OFFSET, LOOPBACK_MODE);
> +    qtest_writel(qts, CAN0_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
> +
> +    /* Check here if CAN0 is set in loopback mode. */
> +    status = qtest_readl(qts, CAN0_BASE_ADDR + R_SR_OFFSET);
> +
> +    g_assert_cmpint(status, ==, STATUS_LOOPBACK_MODE);
> +
> +    send_data(qts, CAN0_BASE_ADDR, buf_tx);
> +    read_data(qts, CAN0_BASE_ADDR, buf_rx);
> +    match_rx_tx_data(buf_tx, buf_rx, 0);
> +
> +    /* Configure the CAN1 in loopback mode. */
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_SRR_OFFSET, CONFIG_MODE);
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_MSR_OFFSET, LOOPBACK_MODE);
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
> +
> +    /* Check here if CAN1 is set in loopback mode. */
> +    status = qtest_readl(qts, CAN1_BASE_ADDR + R_SR_OFFSET);
> +
> +    g_assert_cmpint(status, ==, STATUS_LOOPBACK_MODE);
> +
> +    send_data(qts, CAN1_BASE_ADDR, buf_tx);
> +    read_data(qts, CAN1_BASE_ADDR, buf_rx);
> +    match_rx_tx_data(buf_tx, buf_rx, 0);
> +
> +    qtest_quit(qts);
> +}
> +
> +/*
> + * Enable filters for CAN1. This will filter incoming messages with ID. In this
> + * test message will pass through filter 2.
> + */
> +static void test_can_filter(void)
> +{
> +    uint32_t buf_tx[4] = { 0x14, 0x80000000, 0x12345678, 0x87654321 };
> +    uint32_t buf_rx[4] = { 0x00, 0x00, 0x00, 0x00 };
> +    uint32_t status = 0;
> +    uint8_t can_timestamp = 1;
> +
> +    QTestState *qts = qtest_init("-machine xlnx-zcu102"
> +                " -object can-bus,id=canbus0"
> +                " -machine xlnx-zcu102.canbus0=canbus0"
> +                " -machine xlnx-zcu102.canbus1=canbus0"
> +                );
> +
> +    /* Configure the CAN0 and CAN1. */
> +    qtest_writel(qts, CAN0_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
> +    qtest_writel(qts, CAN0_BASE_ADDR + R_MSR_OFFSET, NORMAL_MODE);
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_MSR_OFFSET, NORMAL_MODE);
> +
> +    /* Check here if CAN0 and CAN1 are in normal mode. */
> +    status = qtest_readl(qts, CAN0_BASE_ADDR + R_SR_OFFSET);
> +    g_assert_cmpint(status, ==, STATUS_NORMAL_MODE);
> +
> +    status = qtest_readl(qts, CAN1_BASE_ADDR + R_SR_OFFSET);
> +    g_assert_cmpint(status, ==, STATUS_NORMAL_MODE);
> +
> +    /* Set filter for CAN1 for incoming messages. */
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_AFR, 0x0);
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_AFMR1, 0xF7);
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_AFIR1, 0x121F);
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_AFMR2, 0x5431);
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_AFIR2, 0x14);
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_AFMR3, 0x1234);
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_AFIR3, 0x5431);
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_AFMR4, 0xFFF);
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_AFIR4, 0x1234);
> +
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_AFR, 0xF);
> +
> +    send_data(qts, CAN0_BASE_ADDR, buf_tx);
> +
> +    read_data(qts, CAN1_BASE_ADDR, buf_rx);
> +    match_rx_tx_data(buf_tx, buf_rx, can_timestamp);
> +
> +    qtest_quit(qts);
> +}
> +
> +/* Testing sleep mode on CAN0 while CAN1 is in normal mode. */
> +static void test_can_sleepmode(void)
> +{
> +    uint32_t buf_tx[4] = { 0x14, 0x80000000, 0x12345678, 0x87654321 };
> +    uint32_t buf_rx[4] = { 0x00, 0x00, 0x00, 0x00 };
> +    uint32_t status = 0;
> +    uint8_t can_timestamp = 1;
> +
> +    QTestState *qts = qtest_init("-machine xlnx-zcu102"
> +                " -object can-bus,id=canbus0"
> +                " -machine xlnx-zcu102.canbus0=canbus0"
> +                " -machine xlnx-zcu102.canbus1=canbus0"
> +                );
> +
> +    /* Configure the CAN0. */
> +    qtest_writel(qts, CAN0_BASE_ADDR + R_SRR_OFFSET, CONFIG_MODE);
> +    qtest_writel(qts, CAN0_BASE_ADDR + R_MSR_OFFSET, SLEEP_MODE);
> +    qtest_writel(qts, CAN0_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
> +
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_MSR_OFFSET, NORMAL_MODE);
> +
> +    /* Check here if CAN0 is in SNOOP mode and CAN1 in normal mode. */

s/SNOOP/SLEEP/

With that change:

Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>

> +    status = qtest_readl(qts, CAN0_BASE_ADDR + R_SR_OFFSET);
> +    g_assert_cmpint(status, ==, STATUS_SLEEP_MODE);
> +
> +    status = qtest_readl(qts, CAN1_BASE_ADDR + R_SR_OFFSET);
> +    g_assert_cmpint(status, ==, STATUS_NORMAL_MODE);
> +
> +    send_data(qts, CAN1_BASE_ADDR, buf_tx);
> +
> +    /*
> +     * Once CAN1 sends data on can-bus. CAN0 should exit sleep mode.
> +     * Check the CAN0 status now. It should exit the sleep mode and receive the
> +     * incoming data.
> +     */
> +    status = qtest_readl(qts, CAN0_BASE_ADDR + R_SR_OFFSET);
> +    g_assert_cmpint(status, ==, STATUS_NORMAL_MODE);
> +
> +    read_data(qts, CAN0_BASE_ADDR, buf_rx);
> +
> +    match_rx_tx_data(buf_tx, buf_rx, can_timestamp);
> +
> +    qtest_quit(qts);
> +}
> +
> +/* Testing Snoop mode on CAN0 while CAN1 is in normal mode. */
> +static void test_can_snoopmode(void)
> +{
> +    uint32_t buf_tx[4] = { 0x14, 0x80000000, 0x12345678, 0x87654321 };
> +    uint32_t buf_rx[4] = { 0x00, 0x00, 0x00, 0x00 };
> +    uint32_t status = 0;
> +    uint8_t can_timestamp = 1;
> +
> +    QTestState *qts = qtest_init("-machine xlnx-zcu102"
> +                " -object can-bus,id=canbus0"
> +                " -machine xlnx-zcu102.canbus0=canbus0"
> +                " -machine xlnx-zcu102.canbus1=canbus0"
> +                );
> +
> +    /* Configure the CAN0. */
> +    qtest_writel(qts, CAN0_BASE_ADDR + R_SRR_OFFSET, CONFIG_MODE);
> +    qtest_writel(qts, CAN0_BASE_ADDR + R_MSR_OFFSET, SNOOP_MODE);
> +    qtest_writel(qts, CAN0_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
> +
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_SRR_OFFSET, ENABLE_CAN);
> +    qtest_writel(qts, CAN1_BASE_ADDR + R_MSR_OFFSET, NORMAL_MODE);
> +
> +    /* Check here if CAN0 is in SNOOP mode and CAN1 in normal mode. */
> +    status = qtest_readl(qts, CAN0_BASE_ADDR + R_SR_OFFSET);
> +    g_assert_cmpint(status, ==, STATUS_SNOOP_MODE);
> +
> +    status = qtest_readl(qts, CAN1_BASE_ADDR + R_SR_OFFSET);
> +    g_assert_cmpint(status, ==, STATUS_NORMAL_MODE);
> +
> +    send_data(qts, CAN1_BASE_ADDR, buf_tx);
> +
> +    read_data(qts, CAN0_BASE_ADDR, buf_rx);
> +
> +    match_rx_tx_data(buf_tx, buf_rx, can_timestamp);
> +
> +    qtest_quit(qts);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("/net/can/can_bus", test_can_bus);
> +    qtest_add_func("/net/can/can_loopback", test_can_loopback);
> +    qtest_add_func("/net/can/can_filter", test_can_filter);
> +    qtest_add_func("/net/can/can_test_snoopmode", test_can_snoopmode);
> +    qtest_add_func("/net/can/can_test_sleepmode", test_can_sleepmode);
> +
> +    return g_test_run();
> +}
> -- 
> 2.7.4
> 

