Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB042DD9E4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 21:29:54 +0100 (CET)
Received: from localhost ([::1]:48852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpzuL-0003MA-4e
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 15:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1kpzsS-0002mI-PO
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:27:56 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:15649)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1kpzsQ-00066E-60
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:27:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1608236874; x=1639772874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SE5LAG6Yb4IDrskzGI5wbL/I6RKqPlgKGkUOPpX1Xic=;
 b=EqmMx7rA17KhasVuB+x31KsQcIY9AJVs9r1OjitSAJTL9DXWAfMaTObc
 Bo0rsXD0yOecdIeDRN5CAxWKD1aJtS/N9t84py8R75Y5pnIcMlarDnPek
 PK/bxjbfCJc+BP0s950NVvjRwabHf1afzwsM7YcKH4WR4Z+stBiatzoCE g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 17 Dec 2020 12:27:52 -0800
X-QCInternal: smtphost
Received: from nasanexm03a.na.qualcomm.com ([10.85.0.103])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 17 Dec 2020 12:27:52 -0800
Received: from nasanexm03h.na.qualcomm.com (10.85.0.50) by
 nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Dec 2020 12:27:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03h.na.qualcomm.com (10.85.0.50) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Thu, 17 Dec 2020 12:27:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJzgI4r1umLj+B1kfjPeTSKoaplPupnkLgZlZA9h0FYoDmLW0GBWpnMlqdf08HvHZ8MKq87ObNpenISDT+f7j3N6oVhA4FiRLMoCr08BZQGadhKLhm/yG7B6fniBvImojPqlzp2F/PBj6CHBgxESH1Etr8ggIdZ5iFWu2ygeMsZ4lKfjrhXdIXWthYd3wQd1u+eaNmGy/XNW+L+jaqDwq2W5ydV6UzeDBfdHpwuXUq43VJRqx9gJ3DuobaAC1JWSemYXoxzp4w9yGYi6oFqhXuL2LBn9WGpf3KvnPZfCrNScz9gO9mJIo+NBxKUWGGkaoObHieqklBPwzPcumyKzjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SE5LAG6Yb4IDrskzGI5wbL/I6RKqPlgKGkUOPpX1Xic=;
 b=d3p2HZxBF+6yQe6RjMOvVlWG0oyj+jT4Mo2iwIhTF3yXuzMFquH6JGFrC0hE+u3SRa6ZvVdckcqzv77/moxUS8LlUvdNv31Vkn5JOSMYPDxFjVCFR6Ok+96Kivh1W680//gJjBYInjZIrny+V9g+AWVNUSlbCjwavE7Yo/7l4A5h3wkZqt8ZkXIre8wRKmUBBINYvYar57wANtRgk8tdb6r9onTPjCIqB4qMDd2E0Fyq+UTFiXAypUsi86xiLHVUHqlXTmFqmvdu21lr0x97+RadQBcnRVOXTnQM1weMCDHZWHGKTG5Peeh1BmlbJxiDmhzS7XBq9iYBH0BTftl31Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SE5LAG6Yb4IDrskzGI5wbL/I6RKqPlgKGkUOPpX1Xic=;
 b=rgaqUcC/f665Z22452iP00GCwvFsR3Hf3xulBoeV1ZPw/nejD3ijkMmNNQ0UGKxB/XTHtTNjyhYAesseaF45jo3VkiH8G0TUJK9g+QNnQORzdHu3A0R2O356ucYoUYRrmqH65sqihQZ02JH4+hBfaLp58ELzYayFWgfT7skplk8=
Authentication-Results: vivier.eu; dkim=none (message not signed)
 header.d=none;vivier.eu; dmarc=none action=none header.from=quicinc.com;
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24) by CO6PR02MB7700.namprd02.prod.outlook.com
 (2603:10b6:303:a7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 17 Dec
 2020 20:27:50 +0000
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::c07b:6b00:b5f0:a5d6]) by MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::c07b:6b00:b5f0:a5d6%7]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 20:27:50 +0000
From: Stephen Long <steplong@quicinc.com>
To: <laurent@vivier.eu>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH] linux-user: Fix loading of BSS segments
Date: Thu, 17 Dec 2020 12:27:39 -0800
Message-ID: <20201217202739.7962-1-steplong@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <c9106487-dc4d-120a-bd48-665b3c617287@gmail.com>
References: <c9106487-dc4d-120a-bd48-665b3c617287@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [24.24.203.211]
X-ClientProxiedBy: BYAPR07CA0092.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::33) To MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from STEPLONG.qualcomm.com (24.24.203.211) by
 BYAPR07CA0092.namprd07.prod.outlook.com (2603:10b6:a03:12b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 17 Dec 2020 20:27:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8108840-c0c6-41e0-fdb5-08d8a2ca39a8
X-MS-TrafficTypeDiagnostic: CO6PR02MB7700:
X-Microsoft-Antispam-PRVS: <CO6PR02MB77000BF8BDF73E0EFA17B0F7C7C40@CO6PR02MB7700.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DFuvTRqQSHzGGTTMoYjI/+Gkvp+6SiEUKqJr7FVvFWd/qynRB/uKseDSq2yTAwgZSCPBSjVm2iGZpIQe9yQKLkEahA/f+e/h9lo7gcwwOMZ8I8DcyXA+AqGaLshVhYdrgnB8JlW35YAbgIiASZ/eamnsqhrb59xF9iXs+ntLk9wqQgugq8F6lFyPiXgpNoM7bFmXiy6qRrAvSqPiQWP/mRET9C/F75UeiwyfPQv62E0lF5QjHzo2mTaBtdN2Rg1IRspzEwyXG5AJDLpEOGobiWcuXpWR8Ml0zcWaVCYvcIMXGniLVejPvZfKLGfGzhJg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3547.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(66946007)(52116002)(86362001)(66476007)(8676002)(66556008)(6506007)(316002)(83380400001)(478600001)(26005)(6512007)(186003)(956004)(5660300002)(2906002)(8936002)(2616005)(16526019)(4326008)(6666004)(1076003)(558084003)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4UDxjkegqM3l5QUTEISiswkF/YzEl3NzVi8qsvaYazvsOhJ16U4VdrW6nOoc?=
 =?us-ascii?Q?gjTaj5+CYhRHw20mocEGHMi3d2aJL0i2UaOqultVUj7wVE20H3Wcvo18zN9R?=
 =?us-ascii?Q?3OU/ZxnuZtZjs2BTLY4pC0fU+v+BL0unAFZuMiAEWhQ/mbN7tFPPKrfZDKbN?=
 =?us-ascii?Q?/WGLIEY+LC3uAnSBVFnky9nNu6dxqLun6CzQlVhnMqV2z6XJHNKj+vFpOUD/?=
 =?us-ascii?Q?TNCIWB/CX/4XtVPaWtvih4GMpkhGbGQp6ar6CBddT/InVL347fU1VSUvjs70?=
 =?us-ascii?Q?isg+YZ1EEUAQkpA8yv3J2zCfmG1XUPYHpgPP0RcQVNJ63w7OCX8zCMQqNmVR?=
 =?us-ascii?Q?zF6vmQQwYuwvKZ7VYm8rfXEw2s90w/xK1G7xMWhTr1mruT+/rzO/0Huo+Bfy?=
 =?us-ascii?Q?S4NuLNW0pF2OSGcQw7F6hH3XFeea4NX/cdQnu50dQJv+5C3T1j2piX3/5xFV?=
 =?us-ascii?Q?tfaYrsdxzpmvXu2jvQxw6Kz+Zi3l3cXeXFgEe3zAVJOQ8afu00+yXOWr3a61?=
 =?us-ascii?Q?1bk5nvz83b5CtUcUFd2hT9nq1QmZFVp9gfE21GuPMGdiH4SCsGIgAkxX+AnN?=
 =?us-ascii?Q?ne8VKgennwnVkL9ymacjKYKXtson/hMqAZNyIcdmVdezxgK6gPTXmTQBSsfN?=
 =?us-ascii?Q?GlpXTwd3sy0ZugzBoG1h6oI2NgSD3tdpuEjp06UXwQrnR2ZcTPG8An+zjBsq?=
 =?us-ascii?Q?7WtF2J/8wgvyzWlUy1VgzQqdrkZ6M71IXgqnrzitJ+mvprPGe53QSCMM2++j?=
 =?us-ascii?Q?jCxAREyhVkCsjxVUGic5VpfoYtXKQ/nbNIegmkAyAJD8nV44q2Vr/sfFJgO1?=
 =?us-ascii?Q?VwAtl1fD5JO5JN3Lx6HfER6yVDLaKgVG2uzYXpsTDEwaKhnMKUEi+CREpobd?=
 =?us-ascii?Q?8eqMMRJkW4MOrT/uYalZgUiTwPXMbEULxxZ/yeIJZ0+6h84kj4cRaLiTfBii?=
 =?us-ascii?Q?KpAbWFDp1TJaiObmczGIkf7WeXKgtr5dWECt4HiAve95Hni4bb6lGh9nQzG7?=
 =?us-ascii?Q?TN1z?=
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3547.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 20:27:50.6115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-Network-Message-Id: c8108840-c0c6-41e0-fdb5-08d8a2ca39a8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0RjrJjMY2AQNY+dYkX5ZjeRu7OKfnU533nadGwWzEbtFv0Thj3t2BVJmTrfo/K2I35xLBc1olOb9YT6xtIdYfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7700
X-OriginatorOrg: quicinc.com
Received-SPF: pass client-ip=199.106.114.38; envelope-from=steplong@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: thatlemon@gmail.com, philippe.mathieu.daude@gmail.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org, ben@decadent.org.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier wrote:
> If this patch fixes also your problem I will take this one instead.

Awesome, I can confirm that this patch fixes my problem.

Thanks,
Stephen

