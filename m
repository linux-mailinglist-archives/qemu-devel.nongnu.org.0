Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138FA2B4B4D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:35:46 +0100 (CET)
Received: from localhost ([::1]:33582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehTl-0001Lp-1r
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:35:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1kehOy-00069F-Ic; Mon, 16 Nov 2020 11:30:52 -0500
Received: from mail-dm6nam12on2051.outbound.protection.outlook.com
 ([40.107.243.51]:23361 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1kehOt-0006lq-Hn; Mon, 16 Nov 2020 11:30:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzAHY5F03NApy1rMZyfEtAppmyj3ydEbKHBZh/Js/8ZdD2LdgIEyOngKfxFhdUBLajnDQ7YoHPBZZoUFRaih0RipLGDDpVLCzG4ObCjd6+P1IF/CH/b8IL/WYUzV8Gl/NFzQMdyJQmlEnGeytqPlPAdiEdLJsMYVXqiJG6vcf6//E5NJ1AedSPre6AdX9+zob4eidkRDEw+pVUiSoRZYDQPKHnVmWbuLWcK5gEzUFDrGcpSRUmHSjp8UsZsFz/4V+7HE1AHjNRwr8T8NXJT9rlp+YD5h8Cxzr7ZYFJsqSGcdMrczqWCK7czn568oYSKXy+l5Ad7DR0gJUGLFla7+JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm9T72FcGJE9yGTJM2Fhtfy/31dB6u5DAsoYXW4f2m0=;
 b=QVZQXPRVHGvzc6B9qp05Ji/B6aNdEheEFJCkuim33VHkggsQ6hA5k3hhcwDXIrIaleKAjUNokDNSMKbFSmzwESzLGfa0klLptUVxNvDG352XViA8LBipszWEWnUT2f7zU+lHN2X6zHFjCExw4Fv8PbHhRGw3Gn6qKFkn0ZGlKs8EUG8rSlXS7P0ndtnRhJEfGMa4nzAtdJCDK12M91uyYCocHGRHdBN8TYjsXInXOJLVJXxlIbtmhdl5z06vy396R/KxnmVZ/21KZV2V0d+I8y6NMqUAKm0OyJ2veli95ELsajQClAYLl9S3rJTT/Y2Y3mc/4Qp9aWZrxNwclgILsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm9T72FcGJE9yGTJM2Fhtfy/31dB6u5DAsoYXW4f2m0=;
 b=ARhx0NHXqmT0HxOVPNw0Mew7D9+DzIRynsFic1xN32gqa0UntiAQ3uGXVh2Zb94BxPWU89geyE+A+HwiboAuZR52g+sJo1bf1bP4Mv5gmvTodMsnNVlu/eDsxrc6JEA1jEwRm8Bb9oaYxFcgmUJeK6WPCCZVM1nlfYlsE1Ccd90=
Received: from BL1PR13CA0103.namprd13.prod.outlook.com (2603:10b6:208:2b9::18)
 by BYAPR02MB4997.namprd02.prod.outlook.com (2603:10b6:a03:71::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 16:30:38 +0000
Received: from BL2NAM02FT029.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2b9:cafe::56) by BL1PR13CA0103.outlook.office365.com
 (2603:10b6:208:2b9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.21 via Frontend
 Transport; Mon, 16 Nov 2020 16:30:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT029.mail.protection.outlook.com (10.152.77.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Mon, 16 Nov 2020 16:30:38 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 16 Nov 2020 08:30:27 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 16 Nov 2020 08:30:27 -0800
Received: from [10.23.120.221] (port=64090 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1kehOd-0000uf-Eq; Mon, 16 Nov 2020 08:30:27 -0800
Date: Mon, 16 Nov 2020 16:30:25 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: Joe Komlodi <joe.komlodi@xilinx.com>
Subject: Re: [PATCH v4 4/4] hw/block/m25p80: Fix Numonyx fast read dummy
 cycle count
Message-ID: <20201116163024.a6c27ni6p6junfth@debian>
References: <1605237055-393580-1-git-send-email-komlodi@xilinx.com>
 <1605237055-393580-5-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1605237055-393580-5-git-send-email-komlodi@xilinx.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53cd944a-ce60-43d1-393f-08d88a4cf3ad
X-MS-TrafficTypeDiagnostic: BYAPR02MB4997:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4997CB05F2E197A36F2D0D33ADE30@BYAPR02MB4997.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x0CLiOJ/WrD+H8q0BXvh8Hq/hxOrQmPlgpTWF17r11Sss31RmC8k+gD4kcPuaPV0Sbc62oUPzJmRTJQFQpoQzgyF6A6rOcnMGx0Sz3Okuwu8EBmv0LVQD4FVRhIkQqmZ/BdcpaE7hHzDzHsygLyyd3Lae5rUjniQ2yQITDnRc1PW6Fr1g0RAcob9s5PomBbXutfBk/+7c43oOJ3A3b4dKV5vbdPuWQBkWccnSuOeQGEk6CyDdiqfLuP8u+myLKBQB+kR9OGFrFnge2y9rr3xSUICwcO4EA9yiih4qSuGL7x34YluxCeUErWPQL29D+jjlW14leJbYts17j94nQjDky692VvtWYC85KH/dS6xkWllLYbM4EvM5w95ipXGcz5ZzE/YgGvFz10qfRE3on54oAmOmaXUF6uMKXhmu7jYYTuNxbr0L2sfa3XoGLz6AucxWTVkmxt2pSboof7jlllzGiZMhLVM2JbjTHGPf9hpHN0=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966005)(70586007)(70206006)(36906005)(316002)(8676002)(26005)(2906002)(33716001)(478600001)(186003)(1076003)(8936002)(9576002)(9686003)(54906003)(426003)(966005)(9786002)(336012)(7636003)(356005)(47076004)(82740400003)(6862004)(5660300002)(4326008)(83380400001)(44832011)(6636002)(82310400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 16:30:38.1859 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53cd944a-ce60-43d1-393f-08d88a4cf3ad
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT029.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4997
Received-SPF: pass client-ip=40.107.243.51; envelope-from=figlesia@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 11:30:39
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

On Thu, Nov 12, 2020 at 07:10:55PM -0800, Joe Komlodi wrote:
> Numonyx chips determine the number of cycles to wait based on bits 7:4
> in the volatile configuration register.
> 
> However, if these bits are 0x0 or 0xF, the number of dummy cycles to
> wait is
> 10 on a QIOR or QIOR4 command, or 8 on any other currently supported
> fast read command. [1]

With above changed to:

"
However, if these bits are 0x0 or 0xF, the number of dummy cycles to wait
is 10 on a QIOR or QIOR4 command or when in QIO mode and else 8 for the
currently supported fast read commands. [1]
"

Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>

Best regards,
Francisco Iglesias


> 
> [1]
> https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_02g_cbb_0.pdf?rev=9b167fbf2b3645efba6385949a72e453
> 
> Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
> ---
>  hw/block/m25p80.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 2552f2c..0c78015 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -837,6 +837,30 @@ static uint8_t numonyx_get_mode(Flash *s)
>      }
>  }
>  
> +static uint8_t numonyx_extract_cfg_num_dummies(Flash *s)
> +{
> +    uint8_t num_dummies;
> +    uint8_t mode;
> +    assert(get_man(s) == MAN_NUMONYX);
> +
> +    mode = numonyx_get_mode(s);
> +    num_dummies = extract32(s->volatile_cfg, 4, 4);
> +
> +    if (num_dummies == 0x0 || num_dummies == 0xf) {
> +        switch (s->cmd_in_progress) {
> +        case QIOR:
> +        case QIOR4:
> +            num_dummies = 10;
> +            break;
> +        default:
> +            num_dummies = (mode == MODE_QIO) ? 10 : 8;
> +            break;
> +        }
> +    }
> +
> +    return num_dummies;
> +}
> +
>  static void decode_fast_read_cmd(Flash *s)
>  {
>      s->needed_bytes = get_addr_length(s);
> @@ -847,7 +871,7 @@ static void decode_fast_read_cmd(Flash *s)
>          s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_NUMONYX:
> -        s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
> +        s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
>          s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_MACRONIX:
> @@ -891,7 +915,7 @@ static void decode_dio_read_cmd(Flash *s)
>          s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_NUMONYX:
> -        s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
> +        s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
>          s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_MACRONIX:
> @@ -935,7 +959,7 @@ static void decode_qio_read_cmd(Flash *s)
>          s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_NUMONYX:
> -        s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
> +        s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
>          s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_MACRONIX:
> -- 
> 2.7.4
> 

