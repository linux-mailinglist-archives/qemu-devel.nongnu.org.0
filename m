Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D951E3BDE73
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 22:33:05 +0200 (CEST)
Received: from localhost ([::1]:40294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0rkd-0000TO-R1
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 16:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1m0rjd-0008Ex-Py
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 16:32:01 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:60428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1m0rjb-0001JI-27
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 16:32:01 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166KHoai031590; Tue, 6 Jul 2021 20:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=vZFDGTvzC5TwvVjlQTvVI1ZdrwKacLyDdchvNDxHCVk=;
 b=zln2YYfI2RjE8Z8anfr+LXSc14MGHs0+hsyMTuVMdir6GNPmOz/74bmEj6nMRvAqmUvA
 UMnoPR2DThWRuLtavOzhIYNtWvnyLCmsCvipd7vGi+I5KL3QWECFbFAMhYUJs8nI35EW
 SYUaOa7VhLyNPOYnGy5H6VUslbYZTmnh4XCB5ZZGypO3W6v1/HMhQThaY0zSACnr1Jxi
 S/YbOOYN+6hWPl78TXXyPyYhuNWXckIIjT5DWAO79VH/O/DsUEsgNM71eb+4Kf5EzTdO
 7TRRwO9Q8mNWogO2ASIt5QEBAFWWh5qSRFX8v4VF9v1VF/RHJaUIrYNudOcdJpoj2F5E Mg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39kw5k3fpm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 20:31:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166KGGUh051957;
 Tue, 6 Jul 2021 20:31:45 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by aserp3020.oracle.com with ESMTP id 39jfq96reb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 20:31:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Brpb65GX/eVpLvblqooz3bnZtiGgH3YhZIWoAy45sGVzTlPbQUrIgHNNfu6yO2jeJaD2MH87FaU3B/dEvFXDXqhO7YGJ6JkfSP0yWKDUgI+0VLX/JLWP66swsX+EIfmlmib8ZTCVegBfsyAAtlPXjzZX3MdB2EWFxQdc+5J3L0Bz5tueztxj0x0E99m6reP8nRcJ1rYnJSmN7UDRdQP77cMMQ7+iYmDCAPJJ7jXcoV2fNwQCbfFroFlagGeTNME7k5DZt22NILyXhKkC7MDjjS43+7Wk8d3DIJVNQ+423nRMaMF72AJqNO3cBCDMfxoAQgbLHdwZlVMbHH1kQeLjNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZFDGTvzC5TwvVjlQTvVI1ZdrwKacLyDdchvNDxHCVk=;
 b=bQ1648ERrV8wI+IIoss9FDXiRsfz2CjFZzIsjICLKUxwq/CRDKXnpQFpqOT95h5wpSp0utc3rK+sGjmxEOied9m6q8+dEP2oQ+GAC6sf8X+igBqrVDSWLDClW2DTUgHOsraodUmZZTNnbp+XmTMd0rU+Xij64/SrKzbuBEUCpAh5k/KmkhBMUIVu9YEWWuSgtMOpG9GzrsCkzrxNO5uVOZAE5N73revHCdpj1Yz62IJpZG0Miv3DuEifWkWjuVb9GnUxVbCQ4QlQiCYiwa6L9S6WzV3RRW7UBE11MKuxDuaqVYmk1/2ktabgivsRfYZs4DjEIUD02/+ldh6x9QG32Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZFDGTvzC5TwvVjlQTvVI1ZdrwKacLyDdchvNDxHCVk=;
 b=IoOAgB0e1/xp+i0nsZkCJxXatjpgQcaZGN6blmVN4MKXOZpPiGoloKuQIPRcWupdZ3XqjJX6bDdmJUNtmY557wufIHlIODUpTe+BJULgFoEdt9N0k5r1/UrGlBYsfqLYMmod0FYHYEikrj81TgqILAByKhlKcIhAdgDVPMmkVJc=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from CH0PR10MB5147.namprd10.prod.outlook.com (2603:10b6:610:c2::18)
 by CH0PR10MB4954.namprd10.prod.outlook.com (2603:10b6:610:ca::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Tue, 6 Jul
 2021 20:31:44 +0000
Received: from CH0PR10MB5147.namprd10.prod.outlook.com
 ([fe80::f441:9b9a:4073:7864]) by CH0PR10MB5147.namprd10.prod.outlook.com
 ([fe80::f441:9b9a:4073:7864%6]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 20:31:44 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH] fuzz: fix sparse memory access in the DMA callback
In-Reply-To: <20210706161735.57967-1-alxndr@bu.edu>
References: <20210706161735.57967-1-alxndr@bu.edu>
Date: Tue, 06 Jul 2021 21:31:37 +0100
Message-ID: <m2y2aj89qu.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB6PR0601CA0005.eurprd06.prod.outlook.com
 (2603:10a6:4:7b::15) To CH0PR10MB5147.namprd10.prod.outlook.com
 (2603:10b6:610:c2::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 DB6PR0601CA0005.eurprd06.prod.outlook.com (2603:10a6:4:7b::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Tue, 6 Jul 2021 20:31:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28c1a28f-caf2-434b-57ee-08d940bd11a3
X-MS-TrafficTypeDiagnostic: CH0PR10MB4954:
X-Microsoft-Antispam-PRVS: <CH0PR10MB49543E858A2A0F2A6D8A03FAF41B9@CH0PR10MB4954.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzJtXhCll4VZdHID37EjsSStL52b4bgytDxXSP9rYXwzuzQtcLW2LMhBzDCuUGUb80uw5p7aSmINuICf3yhdTKJ+7kpPMwnjgXy2LxY6UGwZjVM3ZmnW+VxVL84G9DcHRchykPhNjVSAG0Bm9Tzt2SH2ZjLr0ezKoUACO5dcmv5irkieDUUIFzZg1rwHy65n4hGYgb+mXQek1yHaskoNsVeo0vHpT6yAbuBtyy84zKA81HqQ83AXj7ht/yKJwUhgOkSvtOOIsLb3HMNElMghQHZQhl/dkp/MVl+jLdBZOCJtkmaokAktPaAjaLFg4zAUKBZ/A/3An7JIXVguj9DCGGdV5E4C+ecd+c4BgKf347RwPMwjmIFb269GJFkE8Te5/znfryo1HtxNKXNztz4WXOEamHXYGIX0tQwJOkrpjnQd/wicQbJH+Xk+7F8+vh83fSsLCr6AG7DZ9yf7qpfvbQGsv5OHyBut8X1WOG14ySzki6RSAFhshn1aj2YoalOH8uRdy1eN9jSVyLHLP1tGGQkTZU65wFpFoXy5TCPtgsXthRlIlcmv1m4N/Hm7/GSPIVN7Qzic8WeEzkuXNHIVuE4rgX1grPys4Lwpo5ZtpTlWRPmzUrPu07SMZbaNxbzhCDFNsskabNX3LQBVIkoh3i7jkmAjTnITFl3wmnyEmnvJkX+6KgxxvH0kgkXiT7GP9Hu0VhiSDrkc4ICrcvOCIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR10MB5147.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(396003)(346002)(366004)(136003)(956004)(2616005)(38100700002)(38350700002)(5660300002)(66556008)(8936002)(478600001)(36756003)(66946007)(66476007)(7696005)(86362001)(4326008)(52116002)(44832011)(8676002)(186003)(26005)(6666004)(83380400001)(2906002)(55016002)(8886007)(54906003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G8gsLMXItSmwrirLTQsiGOtCz3F2kITy7TZnAHqI+mXquc4qDZBU+A0jgLnH?=
 =?us-ascii?Q?gDgN/BQmCJ9DF7Ow9of6aabf/Mkc9G0mUsrC8SMsjytZkTshCPQUlNPCUQmC?=
 =?us-ascii?Q?TTGmZuLxeWkW+d79HW/lSZTA77qzgqIBOCmKU3L5RmhJxjTqaxOe9NKsko6Y?=
 =?us-ascii?Q?+kOFh9v4ATxAOK8wSd7a0oQ4d1tBDMhOycA6VdnXtaaChKoya+pK7pc059ST?=
 =?us-ascii?Q?oyOfnMNlN8SiXFX1+I6lH3uiMLyKx/cfcNSJyEzeIL2BE3v4XRmGBX3N9tta?=
 =?us-ascii?Q?T0fQgys/gCzOnGWpf0qXrDwbY6P+zaKEjg3rq0kS2HrKXBoSDzJTXE1rP6rG?=
 =?us-ascii?Q?VsuPImGsdynEXiu7fz8u7cyW4VgLhwdvHJ3+Vu5GNxhjUYm9AZK9xq4yueMi?=
 =?us-ascii?Q?Mc/NsU5/IHifKtic4n50oCDQYbSd+nHPP1gIQdUgxGArZmWE6cLskRhDAtKr?=
 =?us-ascii?Q?bzI9sm/VkYh0YnPs7MF7Fn5UlfqlhkFfdd8TDEjHKheonnwhd/z8TqLvH+we?=
 =?us-ascii?Q?i/BwgEuuq0nGOrkDn7X6XxOwPMAnQL7Lz7d5XQDu5TuIaMYjajTHZNAR1Q3C?=
 =?us-ascii?Q?GfiM5dCBeRXvpK23l7+zIecsUwHsjpkQ2hWCmkzc37HAWXhqvIj0eROSY26l?=
 =?us-ascii?Q?iHSi10QH4wT6nP8a13veBgeSApJMRkdwOm+1OQbgE9WbJgzj3kuFYdxxeT6R?=
 =?us-ascii?Q?/nn/u70uieHkC74/XJi9a+5zmRreMc6EZ1VBqa8QhllfuosjJZ0wVzqS09Ez?=
 =?us-ascii?Q?LynsdT2hgqqG5oB7UAziTj8q+9cAAlaL4ZbPkxStQyGfTnI5oyvQQ4iJVzfH?=
 =?us-ascii?Q?4asOH2CmmCmdiXEQcBAcxBikZ9+4XRZcePDST63EXaw031G0UFG4csolRi8h?=
 =?us-ascii?Q?3Qs8uHpDCHVbUvpZg32/3rE3E32Wcgb8lLe3xL3k/gBfKqOiTbw/kE1kIc8g?=
 =?us-ascii?Q?Xs0EBHvaQGaiPPAQCLOrHSOC+2pHu1C0CAFiOvesxhl+G1pLgjL0rr1uo6Lk?=
 =?us-ascii?Q?HP2EGOnTekyeRm+Jq6H7yHwmwX+ST+XVCu1/Vk5aZZIm4rj4yVUSSHqpGwka?=
 =?us-ascii?Q?Pdf6L2R7kKqPMRxwlbDidaXz1n+DjJihn1n7O2tiyMHuYUMVbWQpQmIdjAVG?=
 =?us-ascii?Q?IS2+AT1bOMqAIwRaj0MotkTmiYvhovf7Qj7V08aKZTpdUbbABM9HRYUlxFhO?=
 =?us-ascii?Q?/mM8bOTennmW2b/EeoUO6k7ts9e3EzUM8iKGyUc9X4Mzfrn49CNPY5Ct9Aph?=
 =?us-ascii?Q?vnNrt8h76KWOkyE5+Z4Ys3dlwRRNcM7KQVOWmoCeXLIBH4cnsgsKIMj8cghI?=
 =?us-ascii?Q?KbFJor1HEi/wTvFXTO1kifYx?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c1a28f-caf2-434b-57ee-08d940bd11a3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5147.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 20:31:44.2761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fqhCLWBrr4Rml6s70e0sVeO5L3Q9OkqHBxZlMaMrZxpQpzJ9sJVeWpe3XUxTz8XLSfzXXMRuxqLOFtXrI2dVcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4954
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060096
X-Proofpoint-GUID: 2BUjp4ASETOuiLtl9ZcIgV5bOUJ4xvCw
X-Proofpoint-ORIG-GUID: 2BUjp4ASETOuiLtl9ZcIgV5bOUJ4xvCw
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-07-06 at 12:17:35 -04, Alexander Bulekov wrote:
> The code mistakenly relied on address_space_translate to store the
> length remaining until the next memory-region. We care about this
> because when there is RAM or sparse-memory neighboring on an MMIO
> region, we should only write up to the border, to prevent inadvertently
> invoking MMIO handlers within the DMA callback.
>
> However address_space_translate_internal only stores the length until
> the end of the MemoryRegion if memory_region_is_ram(mr). Otherwise
> the *len is left unmodified. This caused some false-positive issues,
> where the fuzzer found a way to perform a nested MMIO write through a
> DMA callback on an [address, length] that started within sparse memory
> and spanned some device MMIO regions.
>
> To fix this, write to sparse memory in small chunks of
> memory_access_size (similar to the underlying address_space_write code),
> which will prevent accidentally hitting MMIO handlers through large
> writes.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>  tests/qtest/fuzz/generic_fuzz.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index 59be7219de..3e8ce29227 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -240,10 +240,17 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
>                                        addr, &addr1, &l, true,
>                                        MEMTXATTRS_UNSPECIFIED);
>  
> -        if (!(memory_region_is_ram(mr1) ||
> -              memory_region_is_romd(mr1)) && mr1 != sparse_mem_mr) {
> +        /*
> +         *  If mr1 isn't RAM, address_space_translate doesn't update l. Use
> +         *  memory_access_size to identify the number of bytes that it is safe
> +         *  to write without accidentally writing to another MemoryRegion.
> +         */
> +        if (!memory_region_is_ram(mr1)) {
>              l = memory_access_size(mr1, l, addr1);
> -        } else {
> +        }
> +        if (memory_region_is_ram(mr1) ||
> +            memory_region_is_romd(mr1) ||
> +            mr1 == sparse_mem_mr) {
>              /* ROM/RAM case */
>              if (qtest_log_enabled) {
>                  /*
> -- 
> 2.28.0

