Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE1E2AF3BF
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:38:50 +0100 (CET)
Received: from localhost ([::1]:49794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcrGr-0006b9-SX
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1kcrBe-0001Tu-SU; Wed, 11 Nov 2020 09:33:27 -0500
Received: from mail-co1nam11on2073.outbound.protection.outlook.com
 ([40.107.220.73]:8634 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1kcrBZ-0004Kw-GM; Wed, 11 Nov 2020 09:33:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNq0e5AqcnAC1WYdrjtfb8Q5Av808qIiu35ljMj9h4QYuU2wzBLH1snaD/HJMsZQkDkd1/7D44/p6l/JMkYEzm0ASouXlaH4+TXmr7HwXQFDpLM5oGg5NqfH0gLntqPcukc6Du1Yd0FU73Yu9M44/sKViIRpQ98oX1ZwUlRHC/c31GPB7oszpjdbkmTehbrO/oIpvxKJb5wM89KvESOQohkfKJM2TbKAT1zBnoe69JCxAsN/ZW/UUtqaWMukPGTVB/ri2L1AWDQqzn/hHLCFkVlLUbOEj5IzBTHWIlD1jtWrzuypAazeV/AfXdTMPaxTwr5yEl9TfpkCZRjEJXBV/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdQhUHYWCxA0hxh//+840Xff1dkOSM/08C6kfDzZhQk=;
 b=hYT5nz+lggkkB8wIEsW2NiZv3lEEM5X/d3jHh2t5BD6zhH6hySSZxnpNBJ5Oy8PZuMLoSgXzQhgKbZNaAawEsvzcdkmA84mvc3FP3OdCqApH3gD4CTy7udgzBZAZzf1giNxWWveH8ZENIQyxj0Wc94GoYAkiCfnVSp1vjr4FU3GN+RC0cYRSPJX4ckS17jDWU32m6oJFpTUSVO3Putv+PGlLTEFuuFX4LUooPVnHpQnOWhMaJ/5lmjQkPfh2ZUoNpIB4nht6N++54/MaslpX4jrilxQsoJws/3a0Lb+HUX17cSELYPFk+AqXj5EujMpO25C2qay+RY6u5vqJ4sk2Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdQhUHYWCxA0hxh//+840Xff1dkOSM/08C6kfDzZhQk=;
 b=qD9jVuNm2K879Zvh4WtR/Qby5LYtlWUowUXvIal9DFoWvIW5rLuRxmwjBIOS0I4sBbGYvLZca1z4POTCUHudGM874fYmigjzcj17gV7VITyYR5N6ZMRH/ibpxXc74UHzxtna2XYS571Wec5o7BoH/RuEL9ENbXRyqrUiRdmm/mo=
Received: from SN1PR12CA0091.namprd12.prod.outlook.com (2603:10b6:802:21::26)
 by CY4PR02MB2437.namprd02.prod.outlook.com (2603:10b6:903:71::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 14:33:16 +0000
Received: from SN1NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:21:cafe::11) by SN1PR12CA0091.outlook.office365.com
 (2603:10b6:802:21::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Wed, 11 Nov 2020 14:33:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT010.mail.protection.outlook.com (10.152.72.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Wed, 11 Nov 2020 14:33:15 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 11 Nov 2020 06:33:15 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 11 Nov 2020 06:33:15 -0800
Received: from [10.23.120.221] (port=54803 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1kcrBS-0005gS-SP; Wed, 11 Nov 2020 06:33:15 -0800
Date: Wed, 11 Nov 2020 14:33:12 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: Joe Komlodi <joe.komlodi@xilinx.com>
Subject: Re: [PATCH v3 1/3] hw/block/m25p80: Fix Numonyx NVCFG DIO and QIO
 bit polarity
Message-ID: <20201111143310.6gmhyz4zk75k526j@debian>
References: <1604626378-152352-1-git-send-email-komlodi@xilinx.com>
 <1604626378-152352-2-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1604626378-152352-2-git-send-email-komlodi@xilinx.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d124a517-2411-4f91-d981-08d8864eb9d3
X-MS-TrafficTypeDiagnostic: CY4PR02MB2437:
X-Microsoft-Antispam-PRVS: <CY4PR02MB2437A87FAF26EA8C9541C8A3ADE80@CY4PR02MB2437.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EP1teRBMK4dZ0KhaM21CvPhmRUjczHaveRFVsMjQMKEHdlpl+uRE55UoGAzXz4xG0EB1ovDpOMs5vu5amJJb2xfOtYo6Bu7zMqN4U8F5xPMTEVsEJckc3rKC2m6je0XHvYh8GgDTOcJWMoUIM5GImLGYfVQvuU1cdxfwkdkwI8yXz3/Q4ocx2ElhLmEhngGCOBWO3j5Hlc6SBs1hRsngMgld2LaJdjnbKGT56k1pWv/52Zw0XN0upn7C9XclO+sG3S4BdQm//KefqVOHfD4DLDMFkV3Sv8bRutgijuxZfo4qzuJeMDBCIaAnG8qC1md1iyjvfsqcjF8JEe7+OajkxiOLVauJ7+d0dw+nmzsbb5IwOlbIrELU9PBtmly5wxADGtocyau6KTr+KDyEaIRT8w==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966005)(1076003)(70206006)(4326008)(6666004)(336012)(82310400003)(9686003)(9786002)(6862004)(8676002)(47076004)(7636003)(82740400003)(426003)(478600001)(54906003)(356005)(316002)(186003)(83380400001)(36906005)(6636002)(26005)(70586007)(5660300002)(2906002)(44832011)(8936002)(9576002)(33716001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 14:33:15.5365 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d124a517-2411-4f91-d981-08d8864eb9d3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2437
Received-SPF: pass client-ip=40.107.220.73; envelope-from=figlesia@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 09:33:17
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

On Thu, Nov 05, 2020 at 05:32:56PM -0800, Joe Komlodi wrote:
> QIO and DIO modes should be enabled when the bits in NVCFG are set to 0.
> This matches the behavior of the other bits in the NVCFG register.

The enhanced register has the bits with the same polarities, meaning that the
value should be propagated as it was before (0 - enabled and 1 - disabled). I
do see though that the define naming is not perfect and can make you believe
otherwise.

Best regards,
Francisco Iglesias

> 
> Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
> ---
>  hw/block/m25p80.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 483925f..4255a6a 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -783,10 +783,10 @@ static void reset_memory(Flash *s)
>          s->enh_volatile_cfg |= EVCFG_OUT_DRIVER_STRENGTH_DEF;
>          s->enh_volatile_cfg |= EVCFG_VPP_ACCELERATOR;
>          s->enh_volatile_cfg |= EVCFG_RESET_HOLD_ENABLED;
> -        if (s->nonvolatile_cfg & NVCFG_DUAL_IO_MASK) {
> +        if (!(s->nonvolatile_cfg & NVCFG_DUAL_IO_MASK)) {
>              s->enh_volatile_cfg |= EVCFG_DUAL_IO_ENABLED;
>          }
> -        if (s->nonvolatile_cfg & NVCFG_QUAD_IO_MASK) {
> +        if (!(s->nonvolatile_cfg & NVCFG_QUAD_IO_MASK)) {
>              s->enh_volatile_cfg |= EVCFG_QUAD_IO_ENABLED;
>          }
>          if (!(s->nonvolatile_cfg & NVCFG_4BYTE_ADDR_MASK)) {
> -- 
> 2.7.4
> 

