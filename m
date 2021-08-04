Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DB73E029C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:02:49 +0200 (CEST)
Received: from localhost ([::1]:56532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBHTs-0007tx-Mi
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mBHSq-0006lH-IH
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:01:44 -0400
Received: from mail-bn8nam08on2072a.outbound.protection.outlook.com
 ([2a01:111:f400:7e8d::72a]:64020
 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mBHSo-00023T-Lx
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:01:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9VMQtnMLrxXujFPNBhqLQ9zDKJRMs5I4YdqKd4roDHW1lKWvf18wUB/KwXqKXr677BrnQmVYSFIw0a/Y8Vhh2PtXH+AhXqvCcOS1Ki/PlnFGvhjiAAA9tp5ecJDfmw+aB4IdLXY3/lHvc87bJb+koy4oTIQ6GVSyVreHbAaPDX7sLbI2Hm/ehNInSxPGHbCBnt423BoBnX4X3OCEPtSVQ5meFdAeqttBQhZPTWVXx9Jig0U+pdnT6SCUL1oYC/aVKp/rUznXG+Hfzh3ihoBGXZAuWNUPK7GzayYag4igNWMe9DP5IWF+ExW09jE9m26dSP03Ank3TDJvqvYwJOYqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdnB+OQWiD+c+suuYnbxRM7xL9L/QB6IKEgepn6yYQc=;
 b=gI5QLl7N1EvmPYCqPHlHE8huvK4W9Ll64g8zTGinOTjYPmoH8b4HEq+9eS9lQ8hMfKlrs0ufBLELi/m6ga3upP6L6fjjzvXbX5nLZhSiYqvnkEk5S6LCPHI6z4V2dQqyV0YwdJByHI79lcI/Ap/y2sNIt8o17NXPAKgf7rNOUbaDHaRJMbjxHR9ESVjiqQ6LnU505WmRrYwuo4EKqG0aS9OJt6O+b/Xixp2d/tiPNu0MS15KGNyvL7w6fX5cIPX6YMiZCeXx4BNQDqc7ss7BonnPaNFWokBITml+msew/uG/eJAmukoiQOJuE4ciJUwFjvgWOlWo8ZPVjtLhHNPCJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdnB+OQWiD+c+suuYnbxRM7xL9L/QB6IKEgepn6yYQc=;
 b=Z4XQKQfUW2jILJv99SXqXIKOWPxziiJLIl/RnzUGSRdKma2UeITBTU9doMcj7fIJqFkCrC1TuMHc8cY0ghsJl9/ZYfsaE5abdKn9d8+qgrXGdLCsnlRSxs+euo4iGVEr5EUYxP5RNagenQJBbQqcPLcIkkQyByRt6EOwFc9Yx4Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3422.namprd03.prod.outlook.com (2603:10b6:805:4a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 13:56:38 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4373.027; Wed, 4 Aug 2021
 13:56:38 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Make timeouts more robust
Date: Wed,  4 Aug 2021 09:56:19 -0400
Message-Id: <20210804135621.31455-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0027.namprd22.prod.outlook.com
 (2603:10b6:208:238::32) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR22CA0027.namprd22.prod.outlook.com (2603:10b6:208:238::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend
 Transport; Wed, 4 Aug 2021 13:56:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31c4e1be-67b6-4672-cbb9-08d9574fada3
X-MS-TrafficTypeDiagnostic: SN6PR03MB3422:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3422D50DC62FB01EDC2E0905BAF19@SN6PR03MB3422.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7H/pHwhv36i/myh1f9pjIlpcokS7nMhSVMrOuYFDEU72Tk9UdUp8bA7aDX1pWf7EaC7lpsKak77q0MlTv8KiorUwICDSDqqmm/lDVoMiNI0JknFlSRZodLWK2ZXdlFYFg4uswLaz9pjqtd8NzbPlXVMZJpTVof1kd6ul51S9vY0OAEu27tmAYQmpjpWLoRdwXHiF2f0YIA3d8tOgTFFOfGo4/LCs9w/UNDFBQyCdRV0gXuqDYvHWDEwFCQ4tZ0sA3OIc6dW0BRmEh8DzR84mVnuK7hIrF4k3GD7w2wMeDwq03j0flKQST9OQUT0kc70pqHjxeq/uTi53+7yeP3+1kOQLTdDVt9AnyP9NGo9JV6HGGc3lMuyaQ/bkppjwvHFl5eqlXPuXzF1RHCUNks2W3DhRm1SDT2uTVT8E/cNYQMU3zLNKCqVYB77Z5T661T/PLgHRcMiYwvM9fgJdBJf9Y3FCQdMuFdunrEOgglmGOO4Sd6dJyMWcg0r56GTRN3OSmf1tjRrqxc2Wm4KJ5jmymgNqlWr/mAKcyj7lvsa226BYEurjsPGuLgz3j9/FeKe2azoC0DyPV9hGbxey/AU2cqjqOHk5Y5pH5pqg29vn87w7e29wct1DrrND1HhQGYY3QSDmKpurjVL3jWGsJ3CUilG1MaBQ+Kg9tXEjXkA79pvWuNlsNas4+rDaBQMGeQPhx/Lt/RR3GuJ6YxexQByrn0FC08bl0v7CED5AcajbVPk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(8936002)(66946007)(66476007)(186003)(66556008)(8676002)(6666004)(1076003)(26005)(83380400001)(6512007)(6916009)(2616005)(36756003)(956004)(508600001)(38350700002)(2906002)(786003)(316002)(38100700002)(5660300002)(6486002)(54906003)(52116002)(4326008)(75432002)(6506007)(99710200001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cmYzSsJ7Y2p4e0bNAooW+HLbXVMYfHCXvmu9lOa3xIR1u2i4GJJrH1YJNaeB?=
 =?us-ascii?Q?yGgOxPFSZGftJoFZxkNbQ69euQHLxHcooLsj9lcK93RNe9WrVLsvjK7xu9EU?=
 =?us-ascii?Q?g2KT/fx47PoBWE8AeM8dYBVImj6F0ZenYC+Qcnai1IPbOFSrU+RcRgrs/mP5?=
 =?us-ascii?Q?8IdD9daVz8N+2evqPLLhrnEHSpBbkXQ8JESDWyhShu+AyX7ft29S38S/6KcL?=
 =?us-ascii?Q?FaH2zuEaJBNn+JCMEIvSN9zjmqV8DJgGfUNDGQkrDsy4O9Xrl5S1Q2Vc7rX2?=
 =?us-ascii?Q?Np41tuUNbVO3pXkhDU6Asv9M8OzDFHz+C0IkZrMwYrHcubqnq1mZ56l2ZG7k?=
 =?us-ascii?Q?DyM0DCSBhnyTywpbsUZ6pSxyDq52H8Ank6ydnRgSrSacsCMan+kNiFEWDnXy?=
 =?us-ascii?Q?yHguVgdGaCu4LZbTiucZXEAouHL/3qptIFQMHAMq/w+xkA2XWzBomRgggQ/d?=
 =?us-ascii?Q?D7xBK52b48qpnc5dPbE9nKlLq0MPxCJAV/IpTx7CMnqefn6nmpt9t/lUk2xk?=
 =?us-ascii?Q?+U19bxFOpm0+eNVqhwdO5Xv9P5aC8Gm6xeb7uPa5JLtr68fvT1SKqx+MzG+L?=
 =?us-ascii?Q?h9MiyH0X/ABAZRmV/pm+yIhes8XqU0beQIuo7FpXJGttjFzZ63NDjFPoWBBw?=
 =?us-ascii?Q?rZwcq0Gv86LM74cINokX7wvJ7SWYBGDKSVUhzmReuJP/FZ7e7iz50uPfLGyW?=
 =?us-ascii?Q?uz3h3tzrvOGPaAOXY3xOgb7bcw1fCKRQay2/79rNRZjq8D4lPb0xu+OnwZHp?=
 =?us-ascii?Q?UwyEuknE+HbkCIM1zcrlQ9/dt5MDPmhMSTBEVJVaD9LX3L6exe6esqjspnXr?=
 =?us-ascii?Q?YUD8yENKgscEOf84yUeGTkxl33sBlHuQMZUB/aSpKmyGtLlbDySAKAQ5RZCt?=
 =?us-ascii?Q?He8TycqnklhuiQd2DVLC8sFQKp9Qb8zMOU0UCKqHr0PD1Whe8AqEHiRzb3EM?=
 =?us-ascii?Q?mOhXpszpJ7+j3A9Cs5WneHp04Xxk5OmADxn/ufM8IaNtbrSilkG2/sbU/Zia?=
 =?us-ascii?Q?nbFCdv+Wdmpxbfy5BiWr7Sc6LfSxJhNGTvBjnWGmufdr9ou0LjErYXWYBVBY?=
 =?us-ascii?Q?M7VHcJ62eGf8KyeIIDYzPMMz4GuLYG5tJ3tUOBS7JqwWSiKK2BD+qi/ACfoJ?=
 =?us-ascii?Q?K9eLpTH9RdiK9sG/HT+bLPk1pVo4xUsSTeMSRXif7XYKoqQLIHc4/ZHhsk4W?=
 =?us-ascii?Q?iMH+nwpfz5H7d4oRtQSs6JdH/ypK11NzY+bUuHArort9GlQ8ycHhNfAOF7WH?=
 =?us-ascii?Q?+yH5gQBmeCbExk8Dys0WQRU4c+BxLDvtwHrkjP7Q0s14Ty2QIkc/q7wLnqeU?=
 =?us-ascii?Q?ci5JHC7pgGq2JfUJNz7zX7Ua?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c4e1be-67b6-4672-cbb9-08d9574fada3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 13:56:37.8660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwIA90MUqTUGqp5UoTxowGVds3eDwX1ngqqIc22JRPG058RyRmXl1jNtrgx+DI5u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3422
Received-SPF: pass client-ip=2a01:111:f400:7e8d::72a;
 envelope-from=alxndr@bu.edu;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, MSGID_FROM_MTA_HEADER=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 stefanha@redhat.com, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20210713150037.9297-1-alxndr@bu.edu>

This is an attempt to fix coverage-build failures on OSS-Fuzz. These builds
broke soon after we added the generic-fuzzer, and have been broken since.
We have little visibility into the issue on the OSS-Fuzz infrastructure, but it
appears to be due to some-sort of timeout during corpus merging. To debug this
issue, I downloaded a copy of all of the corpuses on OSS-Fuzz.
Then, I ran a merge job for each fuzzer-config, using the libfuzzer arguments
that I could glean from the clusterfuzz source:

timeout 79200 ./qemu-fuzz-i386-... -rss_limit_mb=2560 -close_fd_mask=3 \
-max_len=5242880 -timeout=5 -detect_leaks=1 -merge=1 \
./merged/... ./qemu-corpus.clusterfuzz-external.appspot.com/libFuzzer/qemu_...

At the end of the day, there were two jobs still running, both stuck in
fdmon_poll_wait -> qemu_poll_ns -> ppoll
These patches adjust the timeout setup to avoid the fuzzer getting stuck in
this code.


Here is an example of such an input from oss-fuzz, for testing:
cat << EOF | base64 -d > input
SEZVWloBAAAAAAAAADc16kZVWlqGRlVaWgZGVVpaz/8PJ4Bg/wAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABNzPqRlVaWghGVVpaBkZVWlrP/w8ngGD/
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////////////////////////////
/////////////////////////////////////////////++3kP//////////////////////////
/////////////////////////////////////wAAAAAAAAAACQAAAgAAWQELAAC3s7Oz/wjzoIGJ
/////1VaWgZGVVpa33NydP+ROTIyMzM3MjAzNjg1NDc3NTgxMEFzfo0wu3PuAAD9AAABI1onyrgI
RlX/EvIkWloGRlVaWt9zcnT/kTNBc36NzESMEbnZovm5ADdaCFoGRlVaWt/fFwErt7OzswFGkTEt
WiMjI0ZVWlo9/z3/VUZVWloIRtVaWgZGVVpazwAIJ4DvA+/v7+/v/wj/FQAJAAACAABZAQsAAAAA
ALezs7P/CP///0ZVWloGWt/fFwErt7Ozs/8I/wkAAAIAAFkBCyAVAAAAAAAAAFpaWkZVWlrfc3J0
/5EzQXN+jTK7c+5GVVVaWgZGVVpa37Ozs7Ozs7MDAAAAs7Ozs1X4kgP4s7Ozs7OzVfiSA/hoiGIW
/99zcnT/kTNBc36NMrtz7kbPAAAAAAAAACn/s7MDAAAAs7Ozs1X4kgP4s7Ozs7OzVfiSA/hoiGIW
/99zcnT/kTNBc36NMrtz7kbPAAAAAAAAACn/BQhGVVpaBkZVWlrP/w/hf58A//9EjO5GzwAAAAAA
AAAp/wUIRlVaWgZGVVpaz/8PJ4Bg/wAAAAAAAAAAAAAAAZSLi0ZVWlpaWkZVWlrfc3J0ACn/BQhG
VVpaBkZVWlrP/w8ngGD/AAAAAAAAAAAAAAABlIuLRlVaWlpaRlVaWt9zcnT/kTJBc36NMrtz7kZV
VVpaBkZVWlrfs7Ozs7OzswMAAACzs7OzVfiSA/izs7Ozs7NV+JID+GiIYhb/3wAAAAAAt7Ozs/8I
/////1VaWgZa398XASu3s7Oz/wj/CQEAAgAAWQELAAAAAAC3s7Oz/wjQ////VVpaBkZVWlrfc3J0
/5Ez4oGlQXN+jcxEDxG5ovm5ADdaCFoGRlVaWt/fFwErt7Oz7+/v7+/v7+/igZ/v7+/v7x4BAAAA
AAAA7+8gn5+fn5+fn5+fn5+fn5+fnyEAVQCfn5+fn5+fn5+fn58BC0ZVWloIRlVaWgZGAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAClaWgZGVQIAAEZVWlrXvAABdAB0/wZGVVpa17wAAXQAdAgAAEZVWlrX
vAQBdAB0MP82CAAAKf///////////////1paBkZVWlrfc3J0/1paJwB+A0Z+WlpGVVpaWicAfgNG
flpaRlVaWlonAH4DRn5aWkZVWlpaJwB+A0Z+WlpGVVoAAADguYQA//OggLz/////////////Cf//
/1XfRlVaWghGVVpaBkZVWlrPBADLkSf/DAAAAAAABwAAAAAAI1oIRlVaWgZGVVpa398XAf//////
RlVaWv///////wn///9VWlpGVVpa33NydP+RNEFz/////////////////wZGVVpa33Ozs7Ozs7Oz
s7Ozs7Ozs7Ozs64GRlVaWt9zs7Ozs7Ozs7Ozs7Ozs64GRlVaWt9zs7Ozs7Ozs7Ozs7Ozs64GRlVa
Wt9zs7Ozs7Ozs7Ozs7Ozs64GRlVaWt9zs7Ozs7Ozs7Ozs7Ozc3J0/5EzWlrf37Ozs7Ozs+bl////
/////////////1paAQRzs7OzRlVaWghGVVpaBkZVWlqt/////wAAAAEA/QH///9GdDxlVWD//0ZV
Wlow/Q8EAABGVf//RlVaWjf9D7Ozs64GRlVaWt9zs7MEBAAARlX//0ZVWlo3/Q8E//8CBHMARlX/
/0ZVWlo3/Q8EAABGVf//RlVaWjf9DwT//wIEc2Vtc0ZVYP//RlVaWjf9DwQAAEZVRlVaWlpaN/0P
BP//AgRzAEZV//9GVVpaN/0PBAAARlX//0ZVWlo3/Q8E//8CBHNlbXNGVWD//0ZVWlo0/Q9bs/8B
L7Ozs7Ozs7Ozs7OzrgZGVVoaILYg/v//vUZVWloIRmD//0ZVWlo0/Q9bWrP/AS8aILYg/v//vUZV
WloIRlVaWghGVVpaBkZVWlr/tiAa4EQg/v9Bf71GVVpaswizRlVaWghGVVpaBkZVWlqtEQBGVVpa
CEZVWt9zs7Ozs7Ozs7Ozs7Ozs65aBkZVWlojAAAgbiMjBjNGI1VaI0ZV
EOF

Run it with:
./qemu-fuzz-i386 --fuzz-target=generic-fuzz-ahci-hd ./input

For this to timeout and exit, both of the patches in the series are required.

Alexander Bulekov (2):
  fuzz: use ITIMER_REAL for timeouts
  fuzz: unblock SIGALRM so the timeout works

 tests/qtest/fuzz/generic_fuzz.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.30.2


