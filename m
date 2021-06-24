Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C2E3B2B56
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 11:25:49 +0200 (CEST)
Received: from localhost ([::1]:55020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwLcK-0004Bf-Uy
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 05:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lwLa0-0000YU-PU
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:23:26 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lwLZw-0001b3-5L
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:23:24 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15O9CM1m021880; Thu, 24 Jun 2021 09:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=5UpspC5r0z+ehxhOQbnObksF2tGzUrGZqVV6yqXTbOI=;
 b=rtENCUAS9PjwV7utQRjo4JhHKTnjpTbcnY5deaJ/IdvpzHRBFbJ0EZr2RX58vZJfnTZm
 f9hEVB6jDe775YyGGt+PHRmOJLOZ+FB29CmJKr8avRFRL5yP3Fva8dYXQKKVYZEsq1JN
 Ehd//W1rb9agyidq4lJG8yQgP045r0jS+Jok80pTXSyK5Bqhfu9FG5o9OQR0lRcwgmmW
 Hq/nDoTtqLYZmIfIYOxRy5L9IVqL+FF6CBto1Qmsb5MOpxlVxjwbO/XMagFhApG/SLLh
 ISHaBy9DlCT9qK84UVQiDZofCE9iSv0oAC4H3AqzWU/Xc0UW692WKdABMARJGaVHL3iI Ug== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39cd2kryym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 09:23:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15O9FjmC010377;
 Thu, 24 Jun 2021 09:23:15 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2046.outbound.protection.outlook.com [104.47.51.46])
 by aserp3030.oracle.com with ESMTP id 3996mgam7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 09:23:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKWFvsi8PqckMSY7hldPbaRr6BBJCt6CIl+ZSeO0T/t6t4Z/FIUq6ulNW4e0nznGYlenMLGI3rdeqzqaS885RprQh38hfYarx0DpdXF+q+e3woa6Fa/K+zGUFnOwezBc9aKOePvAPTXZoeLcbeus0SFDyjVOy+KHS3tcoSSRWfyWZPvwIZ/8QXvD+oHIhIx1YhdLXbbrb6cgFnhTwX/bha/09Xzgdbf9XqlqyQC9JMvQ1Jb0okQ9Oty5pyrQIdPQBeLa8cRrQlc2gBPJZJF69kdUy21YWEO5Nc+5e8/ww+X2y68pEzWZCHv4LI55XBiy/uBnGvwp3XBxgef9fgpgCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UpspC5r0z+ehxhOQbnObksF2tGzUrGZqVV6yqXTbOI=;
 b=CWzeXktGym22UjXMq0r7iTy8LQlYCch8+Ehxj85MPtmWurMNS2UcdqVVrZa8JMGFCeTQOsJ+iaKp9TGTWMHWNcEnlKCKObIttgnXLqBFzmMhAWX1F4I/XdfEMmn1kPzsTlHwB+p88M8SqpitUSKcDRC+njH1XgSmNjzj8J66LPQsvUDsX7bm8rbn33TuJtMMDIg5WD4G0kLpwHVszoa5GL3NySim/VNEToPItrsoRm1v/N+TgvuDgHtSml01VdZFJdtPymD0Yz4C/WBJeWiUpdA/ki+ajS9mNMjBD0zAyZdt87UPtdl7rrHilDtyUPpbD4ngSHzm1G1b2VdbBuzyLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UpspC5r0z+ehxhOQbnObksF2tGzUrGZqVV6yqXTbOI=;
 b=B0J9l0uUegV8g/Rc8SF3K4+tWykbMqxfLgY8RZaKP87d+g0K40ea8OWZ2f37obhE+wZNixEq1cjGvpA/N9iJWEdw2PrA26vDcJVjG+dj+BaSxI4Wktu08ODolhxCgJGMQVlHBX2NZ8RWbI5rl6l7V+c6hv/OHBeHf3tOBHx+qOU=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by MN2PR10MB4238.namprd10.prod.outlook.com (2603:10b6:208:1d3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 24 Jun
 2021 09:23:14 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::1539:60e1:df69:3676]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::1539:60e1:df69:3676%9]) with mapi id 15.20.4264.019; Thu, 24 Jun 2021
 09:23:14 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/4] fuzz: adjust timeout to allow for longer inputs
In-Reply-To: <20210624034503.86256-2-alxndr@bu.edu>
References: <20210624034503.86256-1-alxndr@bu.edu>
 <20210624034503.86256-2-alxndr@bu.edu>
Date: Thu, 24 Jun 2021 10:23:10 +0100
Message-ID: <m28s2zk45d.fsf@oracle.com>
Content-Type: text/plain
X-Originating-IP: [79.97.215.145]
X-ClientProxiedBy: DU2PR04CA0001.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::6) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 DU2PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:10:3b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 09:23:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57f3aa0a-49ac-456f-7e13-08d936f1b151
X-MS-TrafficTypeDiagnostic: MN2PR10MB4238:
X-Microsoft-Antispam-PRVS: <MN2PR10MB4238958DFE2560EBD054833DF4079@MN2PR10MB4238.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BudNXT0EE+hGmFXdJbhd+CESBhQJiWMm73gB231w8qEHaM43LB3eNFpvWmJci1/ZCtdgKHrVlN545qoN9YzBrm6z2J3UXIiJ0t5LT+RywQrRaWDfQFP2pOsHe0hVDpkVFwxQVcbMYQwQj4DFrXvmZQ4VV7OrDmW+ow0bVHW221RCcHHdhXyhwVXWyzOy7lWv5Yj6Ghu0+zODTmAPyn08kK99getJd/QH6XtmBuYrn7G/h24sTgOAn3pv2DDkS8dh5rrZEEWFVT4sDfFLuzbb8I4ssEoHka95xlx41w759XHVn7pgvY0DHWf7iUK6OYLfqahy/7jheeTRpRNXEPvw9Gm+OP4eq61X08/pkGrDM5YvDU3oy8C9x52kFDM9V2JvMyRrI06QvQKamBzAgywyWDLsp/LnPLj34WA4iZtIT90Wej18o5bMLUmxZZ42+QQc/EXEakab5dwcEG0utrARmLMG3Cje18vZn4xubMD2bIThBIWPn6C1vU1hsti3VCZytNxnRhtnuDGcDLuEjSWtaWnPM5Wf06lhkJHv7Rs7Ibuw9CU3vZLVHGGYP0/601MTZwt59Kkgvpx87MzUSK7zt8JlJB6qJ9QAknGJVRB3NA5B91TN5coFi3j4b0qNsCaNo+OgWldjtaAoMIOeiTCCalyoaP/IFcTZuQRPC/7WyWyPDangtMHDvGOZLDcjWtps
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(366004)(346002)(396003)(39860400002)(55016002)(5660300002)(52116002)(8676002)(83380400001)(186003)(16526019)(7696005)(26005)(54906003)(36756003)(316002)(478600001)(86362001)(8886007)(44832011)(66946007)(38100700002)(66476007)(66556008)(2906002)(38350700002)(2616005)(4326008)(956004)(8936002)(148743002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kQFNuYPhHAUbAvj1REf5xgaIWfyXXJA0PX1CufW40B0OnxfV1ka46I8R6Ic4?=
 =?us-ascii?Q?p4m8sqG0D597afxrgaMEBz/0TFvWmE5jlWsK1APnzrOyRP3owtDhaeRcHFXm?=
 =?us-ascii?Q?XCSZy40DiJ71FNJoWcQxMQEIlhy5lB+KnE/jLTuQHtrJwgr2XL5PthKGeb77?=
 =?us-ascii?Q?QWLQ7yr+5P3ohMDr7NO8D/RgZBdAKw/HPzfbS/YQ03qMABGDC7hCK/GLFqcu?=
 =?us-ascii?Q?EHiH3g4SRzI3R2eGunSpD6y9c1qIFk870t7aXfsN4HkDmXC257OLjbfy9Rdi?=
 =?us-ascii?Q?Zu47LfS6yoqmAao7hAry7aKlrpkzL+eu0GirGLmzyHwDRUCNkGLX7+jmem8Q?=
 =?us-ascii?Q?6cxvr3tQoloVqplZZqDZaxV3deqi7/3evZUiWKCgvv1CrgilKucwn0S0JvlQ?=
 =?us-ascii?Q?I9P0QLo8swZ9Jb1PNpqpFAOUCKApW52NkDnqXAp5y/htp7CTDBgaYb5rjJFE?=
 =?us-ascii?Q?ADifU94yaEeaIvAaeujnyRtviIJGaxpIBw/cTOn+6TE7j8HcDY1zA2p7dfL0?=
 =?us-ascii?Q?CFVZI+CHTkOf9WR3YjwidxVQ8pr/X3td1z79F8riJsOmGGVt6SSY4IAftL+H?=
 =?us-ascii?Q?VFKjApH0ztUgHOrFCHy/X2VacX8tjqKwcgK0p1w9/3n9fGLZbYlOYMEtnNVw?=
 =?us-ascii?Q?BtjhKqcy0KLy0RkQLxElyTneonnhE38tYaajMOTn/O9+8PRNOK6hmsg7K8uy?=
 =?us-ascii?Q?cIohDJEmrUbqY5A6VsmOkdKlUCJzYNqylZBHvPYfQg6FD0RGcoOJywcuIEzK?=
 =?us-ascii?Q?ZqyWqQz+CLuH7uIYvQMBI84J0SR1lrOuAn/jbpSh1CLrGZeDlG1dmzC7OU+G?=
 =?us-ascii?Q?z1KvXnLN/rlob6NlZnrO8emjB9YWP40EdUmQFE6vFKqF3H9DXamHt2YR6BNS?=
 =?us-ascii?Q?eoi8Z9LBc5mYgGWQY+/NCXiHjKbCxjLWx13YvO7mqgCs/iXQ5RBkAfr7vxTs?=
 =?us-ascii?Q?lbTMKffyhpTzcsbuQnKEz8VUYWDajL32DATWX0xYXakkfA/nWclKOpqXiWlN?=
 =?us-ascii?Q?cKCidXOrOMWly1t/7anFrQJ1ChoVVZM590InTcTG1iud33UGatHLX4Hj0V9r?=
 =?us-ascii?Q?7vKF3RiGt8ztx3bx2x31uSM6UhP+/3Vqn12EjZ/QNYbNGv28+XgPztqtaVr1?=
 =?us-ascii?Q?1xZ92jKDyeBhUWeyOM66gbyVNiKmvkhBNPvL0lP/PbdZHMD+UQ8ApkNtqNrt?=
 =?us-ascii?Q?bQFM+svCvDxuiUjUzbdtBODtrTls//OF0CGhIFVVRu1OfrIKer8rGuMElxvr?=
 =?us-ascii?Q?eZ0+6ChH8jeGChLoSG5ih1wbA45qG91vEzCVJHjtU7IqzL6yGyMqVTL7XW71?=
 =?us-ascii?Q?JpZkU8+l48t63kimxhxKo5Zm?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f3aa0a-49ac-456f-7e13-08d936f1b151
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 09:23:14.0826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFUV5n84nCxUnAcNBwx9I2XUwIOnmcJR2ULcJs5MU19ys5w5GsAUtVRHRtHGvwO6lgaC9KRBpQnK2KtAOmkZZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4238
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10024
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106240049
X-Proofpoint-GUID: TKfgEsnevYoAyIWx8y7iIparDcVSqD-u
X-Proofpoint-ORIG-GUID: TKfgEsnevYoAyIWx8y7iIparDcVSqD-u
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-06-23 at 23:45:00 -04, Alexander Bulekov wrote:
> Using a custom timeout is useful to continue fuzzing complex devices,
> even after we run into some slow code-path. However, simply adding a
> fixed timeout to each input effectively caps the maximum input
> length/number of operations at some artificial value. There are two
> major problems with this:
> 1. Some code might only be reachable through long IO sequences.
> 2. Longer inputs can actually be _better_ for performance. While the
>    raw number of fuzzer executions decreases with larger inputs, the
>    number of MMIO/PIO/DMA operation/second actually increases, since
>    were are speding proportionately less time fork()ing.
>
> With this change, we keep the custom-timeout, but we renew it, prior to
> each MMIO/PIO/DMA operation. Thus, we time-out only when a particaly

TYPO: s/particaly/specific/ or s/particaly/particular/ ?

> operation takes a long time.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Otherwise,

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

> ---
>  tests/qtest/fuzz/generic_fuzz.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index cea7d4058e..71d36e8f6f 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -661,15 +661,16 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
>      uint8_t op;
>  
>      if (fork() == 0) {
> +        struct sigaction sact;
> +        struct itimerval timer;
>          /*
>           * Sometimes the fuzzer will find inputs that take quite a long time to
>           * process. Often times, these inputs do not result in new coverage.
>           * Even if these inputs might be interesting, they can slow down the
> -         * fuzzer, overall. Set a timeout to avoid hurting performance, too much
> +         * fuzzer, overall. Set a timeout for each command to avoid hurting
> +         * performance, too much
>           */
>          if (timeout) {
> -            struct sigaction sact;
> -            struct itimerval timer;
>  
>              sigemptyset(&sact.sa_mask);
>              sact.sa_flags   = SA_NODEFER;
> @@ -679,13 +680,17 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
>              memset(&timer, 0, sizeof(timer));
>              timer.it_value.tv_sec = timeout / USEC_IN_SEC;
>              timer.it_value.tv_usec = timeout % USEC_IN_SEC;
> -            setitimer(ITIMER_VIRTUAL, &timer, NULL);
>          }
>  
>          op_clear_dma_patterns(s, NULL, 0);
>          pci_disabled = false;
>  
>          while (cmd && Size) {
> +            /* Reset the timeout, each time we run a new command */
> +            if (timeout) {
> +                setitimer(ITIMER_VIRTUAL, &timer, NULL);
> +            }
> +
>              /* Get the length until the next command or end of input */
>              nextcmd = memmem(cmd, Size, SEPARATOR, strlen(SEPARATOR));
>              cmd_len = nextcmd ? nextcmd - cmd : Size;
> -- 
> 2.28.0

