Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A77633BF13
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:57:07 +0100 (CET)
Received: from localhost ([::1]:51498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLoeY-0000W7-L8
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lLobz-0007NE-KF
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:54:27 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:36748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lLobv-00053A-AI
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:54:26 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12FEsG3Y177104;
 Mon, 15 Mar 2021 14:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=ZPVQf0vou8Mme919C+VExbLEtncZnCmhTpSyXd++RvM=;
 b=A042gPy5E5W/uqHg09DZnUige4TyxdWlsJKE9zFqEBwInU+E1+RRMwdC34UDteUiyM4Z
 rG0IMXOQBY7BMO+Cr9sFouFk1Ee+2V9lx1kohi5hMKGBX0wjv4ibANj6WYb0mQXKGPAW
 0l1geiUIVm+lzSa/pybhHf4Zx4dwIQveRCcwvA+BjtFZAJHFPl6JNv6Ejwa46QbQ+tVM
 EKqhRHPRygY3xE9l/P77Izg95QWJiZ7OqxLxfbz2gT6yg/nyYWBQT+7p24d0w6lMqTSt
 0/CEdxXeVacIO5EqCVGCWRRb2cPsKGJgTqWEtWXXbLRTCEx2Ac+XjrQue5WM4b/IAR76 KA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 37a4ekh3au-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 14:54:10 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12FEoWgb054630;
 Mon, 15 Mar 2021 14:54:09 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by aserp3030.oracle.com with ESMTP id 3796ys75nx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 14:54:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNQeJrGfHktblxpcv8V9OkfUnEG+OApcp+kPkST3QngeRe3k9vetyNZ0I8H/PVnjA2KIVL6VJ8tVzyXihzJgS2ipEDKPqygeEApY2Fhy2/h5yNQUZFV9DxNYJJPkSfAhrwHi2PhLxJeQZXwTU3pT83d2z64G2qpk2QPzjn4qdjknFPndiJLEjrC25rMB9H2WsWNBvc3gNalIeCGAB/ga609mZXxkGfCWHEqpIFD5uUFmrQNz82DyXAyEJ1OKG14Zl7h+Uh17K7FBR62YQ1zmm88qNUBxQnTCeS9zuo1DxPRPmaAWQgnIYkfpFwIDNOCK/j3nLWtqHI56tumLZE4siQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPVQf0vou8Mme919C+VExbLEtncZnCmhTpSyXd++RvM=;
 b=DsJNWDXAQ4ch8VjuXhqXPFkYdF8EdUSOLhlvSdI7WD4UX1TP5LORIeRv7hdELGLkuGmY26h3ByGppmcHldpIXyTqjehg2Jh9P0d2o0lkFu+tCqKZL92C6rhIR5rDsAvTpRrHU1P6WjZ4o3An/VkHxSTxSdK0aOAwnQOCEkchaQuTSm4J6355SnY1SysB+BYH+R6rTPuIdKpeWrqNN7f2bMns1rgQFy/XFQWrZcSkd0E4Nu1AN+E9KEe+KyumxWwV2WiFtHRPf1LDq5p8ceSxtfkzV2FKm9GzlS54a+z12TsId3I32gbqrsw4g1LOAtKq+MGiSGB4IN4oU2ihERM6NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPVQf0vou8Mme919C+VExbLEtncZnCmhTpSyXd++RvM=;
 b=ZuOOSYQ6+LpgRcZ6FuWjvwm6hedwWcHvHZNkQWO1wmyQgw3PEolPSg/mnPfVEfrpdfJtPIcs6ipFl8eJJAriyhJfBu5NMM/CMMIHqbAtcsWFBFLW8X+V+HU6TjcXJxb1oUk7Xw5Yum2JQrLl0S7bclz6LM5fQvl3vjpsuf4uvNo=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2857.namprd10.prod.outlook.com (2603:10b6:5:64::25) by
 DS7PR10MB4831.namprd10.prod.outlook.com (2603:10b6:5:3ab::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31; Mon, 15 Mar 2021 14:54:07 +0000
Received: from DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::fca8:448b:525f:7873]) by DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::fca8:448b:525f:7873%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 14:54:07 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/3] memory: add a sparse memory device for fuzzing
In-Reply-To: <20210315140512.8357-2-alxndr@bu.edu>
References: <20210315140512.8357-1-alxndr@bu.edu>
 <20210315140512.8357-2-alxndr@bu.edu>
Date: Mon, 15 Mar 2021 14:54:02 +0000
Message-ID: <m2o8fksc1h.fsf@oracle.com>
Content-Type: text/plain
X-Originating-IP: [79.97.215.145]
X-ClientProxiedBy: DBBPR09CA0011.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::23) To DM6PR10MB2857.namprd10.prod.outlook.com
 (2603:10b6:5:64::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 DBBPR09CA0011.eurprd09.prod.outlook.com (2603:10a6:10:c0::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 14:54:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acfaab37-535b-4b41-b18f-08d8e7c22f2f
X-MS-TrafficTypeDiagnostic: DS7PR10MB4831:
X-Microsoft-Antispam-PRVS: <DS7PR10MB483145FB3B40FFAF68AD4283F46C9@DS7PR10MB4831.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: esF/fMUO4CLCC9co9+sUaNjJ+oIagcrU0JI54SHl5++zjQp6TbFwHK0fochsHCdouWVHul+lCkrRHTYcyaSuPEsNAzn3s4WnP5vAkz3VUzTxKyA/gI2+03UCuE7J5HLeOx2zksQXx28TbcW+toy6IzFk4zhlTUzIxBayAbGs9w5KxFeslCy7HHI4dPm1ImZox8a8GZSD/upIecnKM96O0qumXdodfy+MjFTll2m5uNiHA7JsIODHBoZu78EUP/9jPVpGdYahR+0pKTd/sXAEiIPicyxcrNtvIaWPZ0iTFNHRmm532gB+ZLRcZ85VGoAn3Mk0XOTc19HtUe8oCDHN0pOlDNiK3wSheu3TkCpazj50CCmWBcRqWLHLiSGAjzKOLbmtO2EI3vioiDVpv5oZOJf9Q90cApROC6PJrpmi8jvhgqju6KzSYNqYApOwf6zplHoCTYkGiiBSQKGIljT1jcD3GrOVUgHptDGBYPJ5IjR1BqVA0TZGoXNf4LugZElNFCy4cmByh0+5gXjqVPG1zIIfYHA6NEFb8S0GFmsDa8Lz9oQxNsIoXfpAvenUNRZB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2857.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(366004)(39860400002)(396003)(346002)(26005)(86362001)(7696005)(52116002)(55016002)(5660300002)(83380400001)(8676002)(66476007)(4326008)(66556008)(54906003)(316002)(2616005)(956004)(6666004)(8936002)(36756003)(8886007)(44832011)(16526019)(66946007)(478600001)(186003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0uNcix1U3QxPYKqmBtvJuaxo7ZxG3bbDJRakdKfBgb6GqKm1a/quIbD2NAuS?=
 =?us-ascii?Q?tyfSGMgP/Pn2HT3O9tbWYiOOFVZgNR4ve2IhDWwInzs9ell0YglmsaBPUQ0r?=
 =?us-ascii?Q?wOBvHoU6R/xZ7tBW0VRxkdlNrPcm74Q9QdEdy6dihR3o76z7LUIgyRxN5ae9?=
 =?us-ascii?Q?OCOkED0F2uGKZ5iWRAQfP5DRWzKewe6O31GdH6pd5P7aB+b18CMwjKU4ulPg?=
 =?us-ascii?Q?aASTkDo2DIHeuwtU3JHkiJuz6mxLQIDwkzs3dNfzTYZw6SYEMI+dO6ANa7EY?=
 =?us-ascii?Q?elKuw3bx7jYcD3JPM394VA4sxC4a+XkaA9WhZzqgGtquw70NMqjS7sp14cTb?=
 =?us-ascii?Q?+w3dhE9u09xW6Gk2mhUgvdYVNaWHdQJlsrQS+rqC7qVpSpSEGqV2jwKGdhTk?=
 =?us-ascii?Q?9DA2VK9XeGZLNEHqc/P0ZCO9D5KZNLRVM/GuvAY+GGyHpysRvrYUeZ0I8SmD?=
 =?us-ascii?Q?cQAqBo9kVZQfqueRQbm/SaB6mcTEIxIUP4B1E/A25pM/cWUMmEaIfVEpbXTS?=
 =?us-ascii?Q?KAvcAUQrNUsVb+WX/DbiBlRI0QiNbqTLQaUiZMnKXK7dsSGZQA+dxQ/qTfTj?=
 =?us-ascii?Q?Na5IGchs3nky0OlPgLzTWy4If61U9XMykfp5CsKF4LMCTMsWg3ioLVJVz0p/?=
 =?us-ascii?Q?TueujrWm6muySOMErKSEwulhGs0WiMICHTr99tGHhXlRHbm5FI5/ciGZZJLB?=
 =?us-ascii?Q?MjcUJXyHBIyVwUTBfyVzOzPMOr09JhIwsyX2BoZ0dKDiZJ27/KmUSWbunFRN?=
 =?us-ascii?Q?QofCrcH51G+GKYegAtzZb268GODqBAG1j0c+bjgaHK4of9f21QoZ1ruAVz3q?=
 =?us-ascii?Q?kR8BwpK/n06rOO629FtpspI52ybJbobqlsUFUbu0AXq4fmWp4fC8Rn9A2Lk4?=
 =?us-ascii?Q?Wcwb/j3dwSpodljyap1xlPbYSFTdakfuGZ9UFkMaPltYMFGFm2/lHB99p63u?=
 =?us-ascii?Q?75bYeoTwvg8cNl1IUy57cbncNRiHNEHvXWp0D//Rz/iZHE9gshYXlHLTTKGp?=
 =?us-ascii?Q?B5l3w5TnV4Nr3r9EqmumG/bJKy+IDOKHzKjCuNNRdDE99/RIId2BGKVgGVjF?=
 =?us-ascii?Q?zIq7FOr4/S4d6zT+JopsoOp7/ooraZoOjJmL0AEgW4x+iFRw/t65GmDJORBP?=
 =?us-ascii?Q?w84Xu+lIqYrDovTSCiEsQiy0kFjDlpdFGrQQeYv5zu/OkUIhAKY3eq+PFOvK?=
 =?us-ascii?Q?cKzlQiuuqXVucnApOwAlk5kAu5ps7nbkeXH5Ttd1ZcSQNLHrlhnLv47qYSpR?=
 =?us-ascii?Q?ujxNfZbAg1D/PrTO4COvVQqPZnwd2cNMCd/xd1Un6KTJ0HSRx6Y7yicEclhl?=
 =?us-ascii?Q?mCyv4UesxWKRamO0q8p6YMtO?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acfaab37-535b-4b41-b18f-08d8e7c22f2f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2857.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 14:54:07.5580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uu8BIjJ/2dmWijOdUPxkcFX+B0/pYMYKDAUKYyMvkfSoCWUECOSsUXoECm8xSD1NGAg6h9Ghzyultch9bcJx+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4831
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9923
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150108
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9923
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150108
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=darren.kenny@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 f4bug@amsat.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Monday, 2021-03-15 at 10:05:10 -04, Alexander Bulekov wrote:
> For testing, it can be useful to simulate an enormous amount of memory
> (e.g. 2^64 RAM). This adds an MMIO device that acts as sparse memory.
> When something writes a nonzero value to a sparse-mem address, we
> allocate a block of memory. For now, since the only user of this device
> is the fuzzer, we do not track and free zeroed blocks. The device has a
> very low priority (so it can be mapped beneath actual RAM, and virtual
> device MMIO regions).
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>  MAINTAINERS                 |   1 +
>  hw/mem/meson.build          |   1 +
>  hw/mem/sparse-mem.c         | 151 ++++++++++++++++++++++++++++++++++++
>  include/hw/mem/sparse-mem.h |  19 +++++
>  4 files changed, 172 insertions(+)
>  create mode 100644 hw/mem/sparse-mem.c
>  create mode 100644 include/hw/mem/sparse-mem.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5ca3c9f851..2d25210edf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2633,6 +2633,7 @@ R: Thomas Huth <thuth@redhat.com>
>  S: Maintained
>  F: tests/qtest/fuzz/
>  F: scripts/oss-fuzz/
> +F: hw/mem/sparse-mem.c
>  F: docs/devel/fuzzing.rst
>  
>  Register API
> diff --git a/hw/mem/meson.build b/hw/mem/meson.build
> index 0d22f2b572..ef79e04678 100644
> --- a/hw/mem/meson.build
> +++ b/hw/mem/meson.build
> @@ -1,5 +1,6 @@
>  mem_ss = ss.source_set()
>  mem_ss.add(files('memory-device.c'))
> +mem_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
>  mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
>  mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
>  mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
> diff --git a/hw/mem/sparse-mem.c b/hw/mem/sparse-mem.c
> new file mode 100644
> index 0000000000..a13ac74dd9
> --- /dev/null
> +++ b/hw/mem/sparse-mem.c
> @@ -0,0 +1,151 @@
> +/*
> + * A sparse memory device. Useful for fuzzing
> + *
> + * Copyright Red Hat Inc., 2021
> + *
> + * Authors:
> + *  Alexander Bulekov   <alxndr@bu.edu>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "exec/address-spaces.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/sysbus.h"
> +#include "qapi/error.h"
> +#include "qemu/units.h"
> +#include "sysemu/qtest.h"
> +#include "hw/mem/sparse-mem.h"
> +
> +#define SPARSE_MEM(obj) OBJECT_CHECK(SparseMemState, (obj), TYPE_SPARSE_MEM)
> +#define SPARSE_BLOCK_SIZE 0x1000
> +
> +typedef struct SparseMemState {
> +    SysBusDevice parent_obj;
> +    MemoryRegion mmio;
> +    uint64_t baseaddr;
> +    uint64_t length;
> +    uint64_t size_used;
> +    uint64_t maxsize;
> +    GHashTable *mapped;
> +} SparseMemState;
> +
> +typedef struct sparse_mem_block {
> +    uint8_t data[SPARSE_BLOCK_SIZE];
> +} sparse_mem_block;
> +
> +static uint64_t sparse_mem_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    SparseMemState *s = opaque;
> +    uint64_t ret = 0;
> +    size_t pfn = addr / SPARSE_BLOCK_SIZE;
> +    size_t offset = addr % SPARSE_BLOCK_SIZE;
> +    sparse_mem_block *block;
> +
> +    block = g_hash_table_lookup(s->mapped, (void *)pfn);
> +    if (block) {
> +        assert(offset + size <= sizeof(block->data));
> +        memcpy(&ret, block->data + offset, size);
> +    }
> +    return ret;
> +}
> +
> +static void sparse_mem_write(void *opaque, hwaddr addr, uint64_t v,
> +                             unsigned int size)
> +{
> +    SparseMemState *s = opaque;
> +    size_t pfn = addr / SPARSE_BLOCK_SIZE;
> +    size_t offset = addr % SPARSE_BLOCK_SIZE;
> +    sparse_mem_block *block;
> +
> +    if (!g_hash_table_lookup(s->mapped, (void *)pfn) &&
> +        s->size_used + SPARSE_BLOCK_SIZE < s->maxsize && v) {
> +        g_hash_table_insert(s->mapped, (void *)pfn,
> +                            g_new0(sparse_mem_block, 1));
> +        s->size_used += sizeof(block->data);
> +    }
> +    block = g_hash_table_lookup(s->mapped, (void *)pfn);
> +    if (!block) {
> +        return;
> +    }
> +
> +    assert(offset + size <= sizeof(block->data));
> +
> +    memcpy(block->data + offset, &v, size);
> +
> +}
> +
> +static const MemoryRegionOps sparse_mem_ops = {
> +    .read = sparse_mem_read,
> +    .write = sparse_mem_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +            .min_access_size = 1,
> +            .max_access_size = 8,
> +            .unaligned = false,
> +        },
> +};
> +
> +static Property sparse_mem_properties[] = {
> +    /* The base address of the memory */
> +    DEFINE_PROP_UINT64("baseaddr", SparseMemState, baseaddr, 0x0),
> +    /* The length of the sparse memory region */
> +    DEFINE_PROP_UINT64("length", SparseMemState, length, UINT64_MAX),
> +    /* Max amount of actual memory that can be used to back the sparse memory */
> +    DEFINE_PROP_UINT64("maxsize", SparseMemState, maxsize, 10 * MiB),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +MemoryRegion *sparse_mem_init(uint64_t addr, uint64_t length)
> +{
> +    DeviceState *dev;
> +
> +    dev = qdev_new(TYPE_SPARSE_MEM);
> +    qdev_prop_set_uint64(dev, "baseaddr", addr);
> +    qdev_prop_set_uint64(dev, "length", length);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(dev), 0, addr, -10000);
> +    return &SPARSE_MEM(dev)->mmio;
> +}
> +
> +static void sparse_mem_realize(DeviceState *dev, Error **errp)
> +{
> +    SparseMemState *s = SPARSE_MEM(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +
> +    if (!qtest_enabled()) {
> +        error_setg(errp, "sparse_mem device should only be used "
> +                         "for testing with QTest");
> +        return;
> +    }
> +
> +    assert(s->baseaddr + s->length > s->baseaddr);
> +
> +    s->mapped = g_hash_table_new(NULL, NULL);
> +    memory_region_init_io(&s->mmio, OBJECT(s), &sparse_mem_ops, s,
> +                          "sparse-mem", s->length);
> +    sysbus_init_mmio(sbd, &s->mmio);
> +}
> +
> +static void sparse_mem_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, sparse_mem_properties);
> +
> +    dc->desc = "Sparse Memory Device";
> +    dc->realize = sparse_mem_realize;
> +}
> +
> +static const TypeInfo sparse_mem_types[] = {
> +    {
> +        .name = TYPE_SPARSE_MEM,
> +        .parent = TYPE_SYS_BUS_DEVICE,
> +        .instance_size = sizeof(SparseMemState),
> +        .class_init = sparse_mem_class_init,
> +    },
> +};
> +DEFINE_TYPES(sparse_mem_types);
> diff --git a/include/hw/mem/sparse-mem.h b/include/hw/mem/sparse-mem.h
> new file mode 100644
> index 0000000000..f9863b154b
> --- /dev/null
> +++ b/include/hw/mem/sparse-mem.h
> @@ -0,0 +1,19 @@
> +/*
> + * A sparse memory device. Useful for fuzzing
> + *
> + * Copyright Red Hat Inc., 2021
> + *
> + * Authors:
> + *  Alexander Bulekov   <alxndr@bu.edu>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef SPARSE_MEM_H
> +#define SPARSE_MEM_H
> +#define TYPE_SPARSE_MEM "sparse-mem"
> +
> +MemoryRegion *sparse_mem_init(uint64_t addr, uint64_t length);
> +
> +#endif
> -- 
> 2.27.0

