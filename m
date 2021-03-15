Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBAF33B1A2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:44:50 +0100 (CET)
Received: from localhost ([::1]:44926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLleT-0004Yv-VA
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lLlbS-00029K-9e
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:41:42 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:44988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lLlbO-0003HU-8S
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:41:41 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12FBeGOx089873;
 Mon, 15 Mar 2021 11:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=TNxKZqDajBpzSBnoqAtFeRK8vOh6XCeTDn93LUo1iDM=;
 b=VxYsIw9QhqQHdQBOPr7IpIi0n6yQPKJvCOrMCO0oI+ucbN38edROxyRQizqUP8kv47F0
 SsztxX/Wc2zxIPHfVhdPVfwrLp0/nWp7DTK+NOx3ZGWCme18rL2x1iJ9zBVxB/h4LdV1
 zZvsSsoGHDn520Ki9817SI001j+Ce32t5x+mAHTGW7z6ZK0WsO+nTvSvvfqqtM2vHJPS
 lynFhNVIORImtqClv4fMH7L52CWpXzENGHIVRsCzbZ+nkRaFtzi4iJSD8yJr7YZ7/p9X
 qySM4Nj4xF4XCSGBgHVpvahQ5H2BefDWARf/Okw3oJWk3aeae7MtpTZgs4oABbD6hH4T rg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 37a4ekgev1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 11:41:24 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12FBdZJt014550;
 Mon, 15 Mar 2021 11:41:23 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by aserp3020.oracle.com with ESMTP id 37979yr7j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 11:41:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACYx3n5IrczEEES4djP9UkmI28TI6aZN5bkggrtBSr5M+R8zJ4zhoKscBke3HOsvfuvsKwkEhOLMZLyCRQqNwidtn1UUAzVsNEDKc1L5EecoB102fqc7QAczZKHe94Vn9ucgpN5ZUAqYPpcgVZVPgLyU1/akZ6kT+6mEeaY0bbmIH3eumse2USt4gxhGXXv5bQNeyscjLBHF3sQI7P5URG2ozc9jBHm95DLuA9ZLysr/lqxuM1+9d2I+GL9bO5msmfjO7toL4GyaE7r8YZxtuxYhcTfcnJ9DuMvUVYDEoRq2lRFaWE5FTor4go8Ao2BvKMBYZcaN6YlZgBArcHuQxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNxKZqDajBpzSBnoqAtFeRK8vOh6XCeTDn93LUo1iDM=;
 b=FGSzQNRzufkjV32pqg0ztJODFGJmgTtVMs8sYl5VbVFAHrNVsd7kjePFxxrsajzcmyqFxdq/iRHbV1vyYJPGwSOdrjyd3DYlqbMiFxSPBZOrXWEYHy/K9WC1VlkVJXrJ/bohMV28vp3lCpnKfYsaxoC7iOFO4XJQP7y8Zh3yUWL4gInT6uQBirE05Zsaw6LU7nWKqU12Naerl9gK7n84hJnP169UJZ6y/fxMeOe5l/ygzwYRXdFPkpQ1kGZwHu5dHpIzBzjhklTQeClJpG5s63MdNOQPkG3bhmJXjcYalUN0n/drE7oztv3dpScXLIGvYDDC02FCY9Dc2Kr0JFPzyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNxKZqDajBpzSBnoqAtFeRK8vOh6XCeTDn93LUo1iDM=;
 b=h9QyWUONrTCGwVXoWj5sohNhxU2UuyRHkASYsTo0X/5bh4+B4/jaayAARBysiZbzrZcPY1WdvsrncRRuH1sr0EyNtedHRlBOsWU3bLYL8EmOEdtbG1n6Vj0GCimr3Gw2zGGKxqLbjcHvTyWZF4X9Omcpof4kdjeSyMie0Jd4tgY=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2857.namprd10.prod.outlook.com (2603:10b6:5:64::25) by
 DM5PR10MB1274.namprd10.prod.outlook.com (2603:10b6:4:b::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Mon, 15 Mar 2021 11:41:21 +0000
Received: from DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::fca8:448b:525f:7873]) by DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::fca8:448b:525f:7873%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 11:41:21 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] fuzz: add a script to build reproducers
In-Reply-To: <20210314042358.682136-2-alxndr@bu.edu>
References: <20210314042358.682136-1-alxndr@bu.edu>
 <20210314042358.682136-2-alxndr@bu.edu>
Date: Mon, 15 Mar 2021 11:41:02 +0000
Message-ID: <m27dm8tzjl.fsf@oracle.com>
Content-Type: text/plain
X-Originating-IP: [79.97.215.145]
X-ClientProxiedBy: DB9PR01CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::32) To DM6PR10MB2857.namprd10.prod.outlook.com
 (2603:10b6:5:64::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 DB9PR01CA0027.eurprd01.prod.exchangelabs.com (2603:10a6:10:1d8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Mon, 15 Mar 2021 11:41:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf9f78f4-44d1-4ed4-63f1-08d8e7a74116
X-MS-TrafficTypeDiagnostic: DM5PR10MB1274:
X-Microsoft-Antispam-PRVS: <DM5PR10MB12744C41022868B7F0038819F46C9@DM5PR10MB1274.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +QV3uTvIelU0PdpVYgl1it0BFNjoq4o9l0g/XiimKNFLTu2wB8yJXmpU6aA0dPYYjpSVnks/z7WuTWSsv1q9DQOEr3snMq+N3mrEfyfsLujszcNmpb08krw7/fi6YIOK6dvR6C2C552HAo4oJqiNvKpG9p6pbHm6IefXam+KQESzXTSkQi9MPXwEXmHZAW+w8ipVcWxKl+7UggoAknS+/fiMj8zGIyTE5caOEjCeWFW1jL75JfvPAus5dbKMrOfUMEJ3HJdNhjV7EayisjrDDy0GAvOvjT31717mJpDekmwRCbF6CqkOoW/cAcSb1ZrM0FDW4Td/HJ5/kinvEp1RhgndWIRIaAUvXF0Q3dABMjfMqSE4QYj97YLpaP9wGRxTSfdyKsrnPvGnhH4OPDYdXfa5JXVfmvJOKxb2DxErPJXKe6MfE560U7Fxzzejq/B8e+6tMf+8RzF4YWEMXUZ5f8BnZCiK48vABNZ785Tc58e5BkTsi8Ajj3L6iQ33ndP87sECBswWpxSu0eY5SzOMQzprZ9PUjYSMzBlOrSjfjG+ag5TOvffkkcTnbK0KT2bW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2857.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(366004)(39860400002)(376002)(346002)(6666004)(8936002)(8886007)(2906002)(66946007)(66476007)(26005)(7696005)(52116002)(478600001)(66556008)(5660300002)(4326008)(956004)(186003)(16526019)(36756003)(316002)(2616005)(44832011)(55016002)(8676002)(54906003)(86362001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6jcG7y3JnEYV+Q18RtiDhOXbn8y5Ei96l+wLiuXAI4LzwFLF91+jbE+/ZGMg?=
 =?us-ascii?Q?mLiUNN8DWsqxzGwSmzungnj4lEowXdFWWX9wksBCHUOGL9v55wLb7wWeGXLl?=
 =?us-ascii?Q?PP/w99WpDe+H/0tX/qErmcyk7f4FB4hLAIGqmyVIHBDCzIwU7NuflH+IDUwp?=
 =?us-ascii?Q?ZpVe5Va0X0vm2KpckBlaAmxblcpWqcnjT75NeLUK+Y/URgOFddvMSTnnPnuH?=
 =?us-ascii?Q?AG2twZEzwfdhzCTlFQJqNXdP1yWz+ay0KDZE8CwQniQuVrlqRKl9N4XbqPyv?=
 =?us-ascii?Q?7pnWihldFdKVBYEFtTrw+QsC52GurKIYtJKNZ+1FcfIeRdvJv563RUZTQodQ?=
 =?us-ascii?Q?wu3Id0+6xcUiUzdsthjHzMPhXStSm0d6JLWu5aW29iPoDQm99+7qcZoc5IFB?=
 =?us-ascii?Q?L8yDQWgYfjAX01SpFGoXH4BXZOfZ6V2QLsfnmbItVjsiW8taj+HDm8UoA5b9?=
 =?us-ascii?Q?HM2DaOhc5dcpxETIB6WANlSQbM8DJMxt85jZF4EbOtiZZJC39HpyKAcXOPWV?=
 =?us-ascii?Q?foR6UPTdChkqmfXqPRZaKxivVk/AG4KC4vrvUMjLCmL7DxRb9Y9XsNbGiUCA?=
 =?us-ascii?Q?XSrdo+Y4nLY5yoLPVt84LVA7itNa6NahgpyD7DrXTEpLdo73dWA2/X9AJB/1?=
 =?us-ascii?Q?Sp9gxqWGkvkGb0/G777+HuLnkOUghtg9NXlQs4boVdxFCY4LVjTq8bHizxMD?=
 =?us-ascii?Q?EKkIoz7+PKQflF3kFfqVDo2748bOjWN+uC9H0j6psVqCAV5haHovoPqpmbmQ?=
 =?us-ascii?Q?3kc2fBYRaW3vaWJRnPLOCEuJ4y1oinn3J5jRHXjw2rtWoBlXfVEMvg9HiFeN?=
 =?us-ascii?Q?BuvWOej0jlC+w/v6nLmiDqjsSRX1mTlcNu1XGuGghHiHDmTrrY8Uozn/G9YG?=
 =?us-ascii?Q?Q3ETLwwO1Zp5iQJeARznHUhpFEzsXrqU+1JdM1j/yTU/Ez9a2vc1c2NHEVok?=
 =?us-ascii?Q?Vg18zPzjCsoSQBBQYXDosHh3J1XvwrJ+AxkKGsx+NTXj1/GIU9WggbvlkUsF?=
 =?us-ascii?Q?nFZADN8PSc13EAPhw6jmfnlRO+5oa5iRdmeAOdH4eqpoBoy2ULySnxFn39Si?=
 =?us-ascii?Q?Gi1WHIy/XEiPitDRjGJPbQ9kTBQqCnLw5tDFc0It1zArHK7evQ6iwzcv/apz?=
 =?us-ascii?Q?D+Akqgoz4p448p2wR5hGlqx7oYuEUqpuJ9kkB/hK02rS86tvRnOJUVN9z+qr?=
 =?us-ascii?Q?Y19hYr6DGAcvDgMNvGrfMbG52rYCLlMgrgmj9J4bwBS/HH3NbGkVN3UEXk3a?=
 =?us-ascii?Q?nHeo3GCNWhfbFxTtgqid5Vd8kqMXPtL2bk1sBwqnXaRGUf0A8dKg4ltQ3+TK?=
 =?us-ascii?Q?2jX35Ob4jLUcRE4QmRgV5Gid?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9f78f4-44d1-4ed4-63f1-08d8e7a74116
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2857.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 11:41:21.2635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwWo0ZcSDZ6f5OwIZ0xePJFsyglrVlasRI5eHVzZLx8imyd+PB73nLO7cgaAjkRfC3ox7cLYkDDBPy8PncTMjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1274
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9923
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150082
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9923
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150082
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
Cc: Thomas Huth <thuth@redhat.com>, f4bug@amsat.org,
 Alexander Bulekov <alxndr@bu.edu>, bsd@redhat.com, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On Saturday, 2021-03-13 at 23:23:56 -05, Alexander Bulekov wrote:
> Currently, bash and C crash reproducers are be built manually. This is a
> problem, as we want to integrate reproducers into the tree, for
> regression testing. This patch adds a script that converts a sequence of
> QTest commands into a pasteable Bash reproducer, or a libqtest-based C
> program. This will try to wrap pasteable reproducers to 72 chars, but
> the generated C code will not have nice formatting. Therefore, the C
> output of this script should be piped through an auto-formatter, such as
> clang-format
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

While I have a couple of comments (nits really) below, they are not
significant enough to require another review, so:

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

> ---
>  scripts/oss-fuzz/output_reproducer.py | 160 ++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100755 scripts/oss-fuzz/output_reproducer.py
>
> diff --git a/scripts/oss-fuzz/output_reproducer.py b/scripts/oss-fuzz/output_reproducer.py
> new file mode 100755
> index 0000000000..3608b0600e
> --- /dev/null
> +++ b/scripts/oss-fuzz/output_reproducer.py
> @@ -0,0 +1,160 @@
> +#!/usr/bin/env python3
> +# -*- coding: utf-8 -*-
> +
> +"""
> +Convert plain qtest traces to C or Bash reproducers
> +
> +Use this to help build bug-reports or create in-tree reproducers for bugs.
> +Note: This will not format C code for you. Pipe the output through
> +clang-format -style="{BasedOnStyle: llvm, IndentWidth: 4, ColumnLimit: 90}"
> +or similar
> +"""
> +
> +import sys
> +import os
> +import argparse
> +import textwrap
> +from datetime import date
> +
> +__author__     = "Alexander Bulekov <alxndr@bu.edu>"
> +__copyright__  = "Copyright (C) 2021, Red Hat, Inc."
> +__license__    = "GPL version 2 or (at your option) any later version"
> +
> +__maintainer__ = "Alexander Bulekov"
> +__email__      = "alxndr@bu.edu"
> +
> +
> +def c_header(owner):
> +    return """/*
> + * Autogenerated Fuzzer Test Case
> + *
> + * Copyright (c) {date} {owner}
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "libqos/libqtest.h"
> +
> +    """.format(date=date.today().year, owner=owner)

NIT: It might be cleaner, but not needed, to put the template strings ("""
     ... """) as global values in the code?

> +
> +def c_comment(s):
> +    """ Return a multi-line C comment. Assume the text is already wrapped """
> +    return "/*\n * " + "\n * ".join(s.splitlines()) + "\n*/"
> +
> +def print_c_function(s):
> +    print("/* ")
> +    for l in s.splitlines():
> +        print(" * {}".format(l))
> +
> +def bash_reproducer(path, args, trace):
> +    result = '\\\n'.join(textwrap.wrap("cat << EOF | {} {}".format(path, args),
> +                                       72, break_on_hyphens=False,
> +                                       drop_whitespace=False))
> +    for l in trace.splitlines():
> +        result += "\n" + '\\\n'.join(textwrap.wrap(l,72,drop_whitespace=False))
> +    result += "\nEOF"
> +    return result
> +
> +def c_reproducer(name, args, trace):
> +    result = []
> +    result.append("""static void {}(void)\n{{""".format(name))
> +
> +    # libqtest will add its own qtest args, so get rid of them
> +    args = args.replace("-accel qtest","")
> +    args = args.replace(",accel=qtest","")
> +    args = args.replace("-machine accel=qtest","")
> +    args = args.replace("-qtest stdio","")

NIT: Some of these might want to have an extra space removed either at
     the start of end, e.g. " -qtest stdio" or "-accel qtest ", to make
     the generated output a little cleaner.

> +    result.append("""QTestState *s = qtest_init("{}");""".format(args))
> +    for l in trace.splitlines():
> +        param = l.split()
> +        cmd = param[0]
> +        if cmd == "write":
> +            buf = param[3][2:] #Get the 0x... buffer and trim the "0x"
> +            assert len(buf)%2 == 0
> +            bufbytes = [buf[i:i+2] for i in range(0, len(buf), 2)]
> +            bufstring = '\\x'+'\\x'.join(bufbytes)
> +            addr = param[1]
> +            size = param[2]
> +            result.append("""qtest_bufwrite(s, {}, "{}", {});""".format(
> +                          addr, bufstring, size))
> +        elif cmd.startswith("in") or cmd.startswith("read"):
> +            result.append("qtest_{}(s, {});".format(
> +                          cmd, param[1]))
> +        elif cmd.startswith("out") or cmd.startswith("write"):
> +            result.append("qtest_{}(s, {}, {});".format(
> +                          cmd, param[1], param[2]))
> +        elif cmd == "clock_step":
> +            if len(param) ==1:
> +                result.append("qtest_clock_step_next(s);")
> +            else:
> +                result.append("qtest_clock_step(s, {});".format(param[1]))
> +    result.append("qtest_quit(s);\n}")
> +    return "\n".join(result)
> +
> +def c_main(name, arch):
> +    return """int main(int argc, char **argv)
> +{{
> +    const char *arch = qtest_get_arch();
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +   if (strcmp(arch, "{arch}") == 0) {{
> +        qtest_add_func("fuzz/{name}",{name});
> +   }}
> +
> +   return g_test_run();
> +}}""".format(name=name, arch=arch)

NIT: Same comment on the use of a template string.

> +
> +def main():
> +    parser = argparse.ArgumentParser()
> +    group = parser.add_mutually_exclusive_group()
> +    group.add_argument("-bash", help="Only output a copy-pastable bash command",
> +                        action="store_true")
> +    group.add_argument("-c", help="Only output a c function",
> +                        action="store_true")
> +    parser.add_argument('-owner', help="If generating complete C source code, \
> +                        this specifies the Copyright owner",
> +                        nargs='?', default="<name of author>")
> +    parser.add_argument("-no_comment", help="Don't include a bash reproducer \
> +                        as a comment in the C reproducers",
> +                        action="store_true")
> +    parser.add_argument('-name', help="The name of the c function",
> +                        nargs='?', default="test_fuzz")
> +    parser.add_argument('input_trace', help="input QTest command sequence \
> +                        (stdin by default)",
> +                        nargs='?', type=argparse.FileType('r'),
> +                        default=sys.stdin)
> +    args = parser.parse_args()
> +
> +    qemu_path = os.getenv("QEMU_PATH")
> +    qemu_args = os.getenv("QEMU_ARGS")
> +    if not qemu_args or not qemu_path:
> +        print("Please set QEMU_PATH and QEMU_ARGS environment variables")
> +        sys.exit(1)
> +
> +    bash_args = qemu_args
> +    if " -qtest stdio" not in  qemu_args:
> +        bash_args += " -qtest stdio"
> +
> +    arch = qemu_path.split("-")[-1]
> +    trace = args.input_trace.read().strip()
> +
> +    if args.bash :
> +        print(bash_reproducer(qemu_path, bash_args, trace))
> +    else:
> +        output = ""
> +        if not args.c:
> +            output += c_header(args.owner) + "\n"
> +        if not args.no_comment:
> +            output += c_comment(bash_reproducer(qemu_path, bash_args, trace))
> +        output += c_reproducer(args.name, qemu_args, trace)
> +        if not args.c:
> +            output += c_main(args.name, arch)
> +        print(output)
> +
> +
> +if __name__ == '__main__':
> +    main()
> -- 
> 2.28.0

