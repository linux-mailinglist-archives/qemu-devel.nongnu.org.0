Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA07A2AF4AB
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:24:41 +0100 (CET)
Received: from localhost ([::1]:34376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcrzE-0000jV-Pj
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:24:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1kcrxf-00087v-3D; Wed, 11 Nov 2020 10:23:03 -0500
Received: from mail-bn7nam10on2053.outbound.protection.outlook.com
 ([40.107.92.53]:28353 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1kcrxb-000527-Lq; Wed, 11 Nov 2020 10:23:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPPwJlq6VfbDiSHgYoFrBemUFk9jOqigH/VSRea2xUxBDuQn4Jb3FzG2ekh7Z6/9WpQP7sD+3st07uc2w5gExEd6siHvp3ikipDxT9ltSgkzfzM8Kmq+ve2ukXxj/ARZ4hdB1t1kjuJEAkn1TgE1/IaKO7D8/Zq7OsY5Q97NRibSjt2z/518W9b9dOxOBMpvQiuFNafgpNh/Bw/W27FNk1TAKWzBzqFX7GOgzYTCfepHVK4TUFnM2czGYgewIxtrrsayQVcZzHtzAQ177k52ygcOgGsTx1YzYDMan78rAS4XiV2fzlKECz9Mbo4Z9lJNZfDpOHgL+4aIUlMK4EZYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tV9abba3qAq3brLA+WqA/X7YIslswc2qJD9vZZzxGw=;
 b=nFLSXeYyO/WELWjkUunIKv288PuBzTC0M075LiEcRTmSsRC7XK3gnzVMX+5nY3pgGdBm9CGtJTBbzCYtfe9+HFyKSjyrKEVJnRwGvsAGHJQMHam8M7FkTHZcR+015L8FNJhzBzLYeoYY5etPWjDYk2FFob4fV+fHxzptd4V+dCILZ+vogNZGXHJ1kBVBcg+P/XwbWJjgycDcOu2DCAl+gt6p827Drue14knBNiLaWZqVdMbsCfB7Y10WwRhXWSVx0D6rGOtPx/f4gMMOaqs7LzBwAulTqAQdTJD/ARICb4wxjGfKIqHz7d/yFb2PUoh2lIvgQ5Oh7STXPZB274yblA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tV9abba3qAq3brLA+WqA/X7YIslswc2qJD9vZZzxGw=;
 b=oMvJnY7H+VjjMWJghw2fQNnnxbLoRliZ9cuMDt64ViZt+DbS0eP9d3kX1q1kGO9abOInGYepg+H76k42/4Oz5Ho78ygkh3aaTONnXJz+GrYluiKxj0uxM1OjkD9r92z3r3CMUq50Rc2n7/HZDedpFaeEz1gqWptXxNX9MHW7Lvc=
Received: from BL1PR13CA0035.namprd13.prod.outlook.com (2603:10b6:208:257::10)
 by BYAPR02MB4982.namprd02.prod.outlook.com (2603:10b6:a03:72::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Wed, 11 Nov
 2020 15:22:57 +0000
Received: from BL2NAM02FT004.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:257:cafe::a0) by BL1PR13CA0035.outlook.office365.com
 (2603:10b6:208:257::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.22 via Frontend
 Transport; Wed, 11 Nov 2020 15:22:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT004.mail.protection.outlook.com (10.152.76.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Wed, 11 Nov 2020 15:22:56 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 11 Nov 2020 07:22:55 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 11 Nov 2020 07:22:55 -0800
Received: from [10.23.120.221] (port=63782 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1kcrxX-000309-IB; Wed, 11 Nov 2020 07:22:55 -0800
Date: Wed, 11 Nov 2020 15:22:53 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: Joe Komlodi <joe.komlodi@xilinx.com>
Subject: Re: [PATCH v3 2/3] hw/block/m25p80: Check SPI mode before running
 some Numonyx commands
Message-ID: <20201111152252.amsamanohkqsxio4@debian>
References: <1604626378-152352-1-git-send-email-komlodi@xilinx.com>
 <1604626378-152352-3-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1604626378-152352-3-git-send-email-komlodi@xilinx.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a4cac1b-d694-4bc2-da2a-08d88655aad1
X-MS-TrafficTypeDiagnostic: BYAPR02MB4982:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4982EB3DE9DBA54371E80C6FADE80@BYAPR02MB4982.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ad0C/GfYkPuenqXO3N8TCmU62H39YqAeBwNXSaw2YGnaXKdAfwviH4xQD4ARB6JYLAlY19IK+Ee5htNW94JMrvpBiKXU6WSn++P/pb6rfZYVKcAGOm2pStFNuqEKTMjQ1I9nlOjcPNX8OpapyzrwFXc+LuFYKGmIt27yYebmqT5qbwWY7ZICgTOev6N+EBkelOPWVKByimRIolKt0N+6ookLoPTjDYslmMd5uqUbCt4ROENmd43r12c+ANFcUKPEmWKHGLK4uQx7HSR6zRRZgdUWS/AgpytMnijn++p9Z5Nv1bihSI8v/Gc/0nlvFSL7iPd+EuHUbfEAvc24UYnLHAIxtMnetw74/EzzivHNAX4aWxEB33C44+X14WIDNHMnVTS0EdDxaVoXEi39yWW2jQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966005)(82310400003)(316002)(6862004)(8936002)(44832011)(356005)(7636003)(47076004)(9786002)(6636002)(82740400003)(83380400001)(4326008)(1076003)(8676002)(36906005)(426003)(9686003)(186003)(70206006)(70586007)(2906002)(336012)(478600001)(26005)(54906003)(5660300002)(33716001)(9576002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 15:22:56.7717 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4cac1b-d694-4bc2-da2a-08d88655aad1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT004.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4982
Received-SPF: pass client-ip=40.107.92.53; envelope-from=figlesia@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 10:22:58
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: figlesia@xilinx.com, qemu-block@nongnu.org, alistair@alistair23.me,
 qemu-devel@nongnu.org, mreitz@redhat.com, philippe.mathieu.daude@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Joe,

On Thu, Nov 05, 2020 at 05:32:57PM -0800, Joe Komlodi wrote:
> Some Numonyx flash commands cannot be executed in DIO and QIO mode, such as
> trying to do DPP or DOR when in QIO mode.
> 
> Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
> ---
>  hw/block/m25p80.c | 132 ++++++++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 119 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 4255a6a..8a1b684 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -413,6 +413,12 @@ typedef enum {
>      MAN_GENERIC,
>  } Manufacturer;
>  
> +typedef enum {
> +    MODE_STD = 0,
> +    MODE_DIO = 1,
> +    MODE_QIO = 2
> +} SPIMode;
> +
>  #define M25P80_INTERNAL_DATA_BUFFER_SZ 16
>  
>  struct Flash {
> @@ -820,6 +826,70 @@ static void reset_memory(Flash *s)
>      trace_m25p80_reset_done(s);
>  }
>  
> +static uint8_t numonyx_get_mode(Flash *s)
> +{
> +    uint8_t mode;

We need to swap the polarities in below if checks. If you would like to get rid
of some lines you can also just return the enum directly instead (and remove
the 'mode' variable). 

> +
> +    if (s->enh_volatile_cfg & EVCFG_QUAD_IO_ENABLED) {
> +        mode = MODE_QIO;
> +    } else if (s->enh_volatile_cfg & EVCFG_DUAL_IO_ENABLED) {
> +        mode = MODE_DIO;
> +    } else {
> +        mode = MODE_STD;
> +    }
> +
> +    return mode;
> +}
> +
> +static bool numonyx_check_cmd_mode(Flash *s)
> +{
> +    uint8_t mode;
> +    assert(get_man(s) == MAN_NUMONYX);
> +
> +    mode = numonyx_get_mode(s);
> +
> +    switch (mode) {
> +    case MODE_STD:
> +        return true;
> +    case MODE_DIO:
> +        switch (s->cmd_in_progress) {
> +        case QOR:
> +        case QOR4:
> +        case QIOR:
> +        case QIOR4:
> +        case QPP:
> +        case QPP_4:
> +        case PP4_4:
> +        case JEDEC_READ:
> +        case READ:
> +        case READ4:
> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
> +                          "DIO mode\n", s->cmd_in_progress);
> +            return false;
> +        default:
> +            return true;
> +        }
> +    case MODE_QIO:
> +        switch (s->cmd_in_progress) {
> +        case DOR:
> +        case DOR4:
> +        case DIOR:
> +        case DIOR4:
> +        case DPP:
> +        case JEDEC_READ:
> +        case READ:
> +        case READ4:
> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
> +                          "QIO mode\n", s->cmd_in_progress);
> +            return false;
> +        default:
> +            return true;
> +        }
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>  static void decode_fast_read_cmd(Flash *s)
>  {
>      s->needed_bytes = get_addr_length(s);
> @@ -827,9 +897,13 @@ static void decode_fast_read_cmd(Flash *s)
>      /* Dummy cycles - modeled with bytes writes instead of bits */
>      case MAN_WINBOND:
>          s->needed_bytes += 8;
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_NUMONYX:
> -        s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
> +        if (numonyx_check_cmd_mode(s)) {
> +            s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
> +            s->state = STATE_COLLECTING_DATA;
> +        }
>          break;
>      case MAN_MACRONIX:
>          if (extract32(s->volatile_cfg, 6, 2) == 1) {
> @@ -837,19 +911,21 @@ static void decode_fast_read_cmd(Flash *s)
>          } else {
>              s->needed_bytes += 8;
>          }
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_SPANSION:
>          s->needed_bytes += extract32(s->spansion_cr2v,
>                                      SPANSION_DUMMY_CLK_POS,
>                                      SPANSION_DUMMY_CLK_LEN
>                                      );
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      default:
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      }
>      s->pos = 0;
>      s->len = 0;
> -    s->state = STATE_COLLECTING_DATA;
>  }
>  
>  static void decode_dio_read_cmd(Flash *s)
> @@ -859,6 +935,7 @@ static void decode_dio_read_cmd(Flash *s)
>      switch (get_man(s)) {
>      case MAN_WINBOND:
>          s->needed_bytes += WINBOND_CONTINUOUS_READ_MODE_CMD_LEN;
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_SPANSION:
>          s->needed_bytes += SPANSION_CONTINUOUS_READ_MODE_CMD_LEN;
> @@ -866,9 +943,13 @@ static void decode_dio_read_cmd(Flash *s)
>                                      SPANSION_DUMMY_CLK_POS,
>                                      SPANSION_DUMMY_CLK_LEN
>                                      );
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_NUMONYX:
> -        s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
> +        if (numonyx_check_cmd_mode(s)) {
> +            s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
> +            s->state = STATE_COLLECTING_DATA;
> +        }
>          break;
>      case MAN_MACRONIX:
>          switch (extract32(s->volatile_cfg, 6, 2)) {
> @@ -882,13 +963,14 @@ static void decode_dio_read_cmd(Flash *s)
>              s->needed_bytes += 4;
>              break;
>          }
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      default:
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      }
>      s->pos = 0;
>      s->len = 0;
> -    s->state = STATE_COLLECTING_DATA;
>  }
>  
>  static void decode_qio_read_cmd(Flash *s)
> @@ -899,6 +981,7 @@ static void decode_qio_read_cmd(Flash *s)
>      case MAN_WINBOND:
>          s->needed_bytes += WINBOND_CONTINUOUS_READ_MODE_CMD_LEN;
>          s->needed_bytes += 4;
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_SPANSION:
>          s->needed_bytes += SPANSION_CONTINUOUS_READ_MODE_CMD_LEN;
> @@ -906,9 +989,13 @@ static void decode_qio_read_cmd(Flash *s)
>                                      SPANSION_DUMMY_CLK_POS,
>                                      SPANSION_DUMMY_CLK_LEN
>                                      );
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_NUMONYX:
> -        s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
> +        if (numonyx_check_cmd_mode(s)) {

Instead of creating the numonyx_check_cmd_mode function I think it is
better to chop up the switch in decode_new_cmd further and entering the
decode_qio/dio/fast_read_cmd functions already checked for correct mode (the
commands are already switch into there).

> +            s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
> +            s->state = STATE_COLLECTING_DATA;
> +        }
>          break;
>      case MAN_MACRONIX:
>          switch (extract32(s->volatile_cfg, 6, 2)) {
> @@ -922,13 +1009,14 @@ static void decode_qio_read_cmd(Flash *s)
>              s->needed_bytes += 6;
>              break;
>          }
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      default:
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      }
>      s->pos = 0;
>      s->len = 0;
> -    s->state = STATE_COLLECTING_DATA;
>  }
>  
>  static void decode_new_cmd(Flash *s, uint32_t value)
> @@ -950,6 +1038,15 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>      case ERASE4_32K:
>      case ERASE_SECTOR:
>      case ERASE4_SECTOR:
> +    case DIE_ERASE:
> +    case RDID_90:
> +    case RDID_AB:
> +        s->needed_bytes = get_addr_length(s);
> +        s->pos = 0;
> +        s->len = 0;
> +        s->state = STATE_COLLECTING_DATA;
> +        break;
> +
>      case READ:
>      case READ4:
>      case DPP:
> @@ -958,13 +1055,19 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>      case PP:
>      case PP4:
>      case PP4_4:
> -    case DIE_ERASE:
> -    case RDID_90:
> -    case RDID_AB:

Similar as above comment, instead of creating numonyx_check_cmd_mode I think it
is better to do the mode check here (and switch out more cmds if needed).
Something like:

...
case QPP:
case QPP_4:
case PPP4_4:
    if (!get_man(s) == MAN_NUMONYX || numonyx_get_mode(s) != MODE_DIO) {
        s->needed_bytes = get_addr_length(s);
        s->pos = 0;
        s->len = 0;
        s->state = STATE_COLLECTING_DATA;
    } else {
        qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Attempting Quad PP while in DIO mode....!\n");
    }
    break;
    

> -        s->needed_bytes = get_addr_length(s);
> -        s->pos = 0;
> -        s->len = 0;
> -        s->state = STATE_COLLECTING_DATA;
> +        if (get_man(s) == MAN_NUMONYX) {
> +            if (numonyx_check_cmd_mode(s)) {
> +                s->needed_bytes = get_addr_length(s);
> +                s->pos = 0;
> +                s->len = 0;
> +                s->state = STATE_COLLECTING_DATA;
> +            }
> +        } else {
> +            s->needed_bytes = get_addr_length(s);
> +            s->pos = 0;
> +            s->len = 0;
> +            s->state = STATE_COLLECTING_DATA;
> +        }
>          break;
>  
>      case FAST_READ:
> @@ -1035,6 +1138,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>          break;
>  
>      case JEDEC_READ:
> +        if (get_man(s) == MAN_NUMONYX && !numonyx_check_cmd_mode(s)) {

A log message here could help out when debugging (and also check mode directly
as above).  

Best regards,
Francisco Iglesias

> +            break;
> +        }
>          trace_m25p80_populated_jedec(s);
>          for (i = 0; i < s->pi->id_len; i++) {
>              s->data[i] = s->pi->id[i];
> -- 
> 2.7.4
> 

