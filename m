Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACCA529CB0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 10:39:10 +0200 (CEST)
Received: from localhost ([::1]:49678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqsjV-00027n-4g
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 04:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1nqsbB-0005o6-Th
 for qemu-devel@nongnu.org; Tue, 17 May 2022 04:30:34 -0400
Received: from corp-ob09.yahoo-corp.jp ([182.22.125.216]:45468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1nqsb7-0002Mo-2F
 for qemu-devel@nongnu.org; Tue, 17 May 2022 04:30:32 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01lp2177.outbound.protection.outlook.com [104.47.23.177])
 by corp-ob09.yahoo-corp.jp (Postfix) with ESMTPS id F01F419FB185;
 Tue, 17 May 2022 17:30:20 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo-corp.jp;
 s=default; t=1652776221;
 bh=mIPBbljYbBaUfbiFDZEWJL89JxQNjmqOpffQy8vavik=;
 h=From:To:Cc:Subject:Date;
 b=hPMwIcanlu9aZnjdeAkWu2iHKsrV1WytaSQ/m9Qv4TtvHmZEor3ewzs9BfcFcvPHK
 c1C9DrtoMRGu9vqKDSvFERdC4uapdNZTcZ6mbgjao6B/Wn7U6dAwIgKVoSOMdSb1sn
 n8t7dQ297PbUWbYviIbcYLe23DjvN0cHOBLK6JAA=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdBwRRctZzTDujskkON0fQ2G3rIfL/WQyOAJdNYalVMOpIhg7FpgAkInYcgwLFjfBuro5OMWvbCXYB90QNtexe+s4yakP3QzBy3JMaYI0A95cGHt2eVBysja6VnSv5ITlxkn3j0d3zQJL0wdgg9QIqY/qLSE/Go+P54VJIadoraJwX7/4ojNWDSiNthgPSiFV6iElEM3tD1zD+R30CBP1QpGuQBs9AqI8o49B35OebvbfhVYsZP/WvXGKQxVgSme+8Kv8RcabG7zq1J1Egpn2zlPPw4jJz0jMnPCMMNBZu6TeySLmAVJjz3izkOfxFVLt76H1KP18cC9xOzNh/ULmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIPBbljYbBaUfbiFDZEWJL89JxQNjmqOpffQy8vavik=;
 b=S4QgrLSCkvb59GOJiS6RUx/poCKeHsYdBOrQndqRNEDaEufwakMRFvhVXo8ambIunh1zT1BhiQlm2vfd0tu6BZghm4CaH8oOPGtCtiudAx8kQ5PL10Gcrfea2ENLZ/HxFGs2WVb+TObp9m+55JPHiQB449ImUzm+0GCxzUjUX97xWd6VD+NaCmHKm0v2pc8yx/91PU6XhllA74EiLNjahs4QH/nW5MX53zJpbX2iTRcrydHfJZG1cpQJiYiT9QaqWAGGKH0UNZ6+ScM/CtvnKDQ7j6z750QFqW360ITCw9iU0xuNvNdVpmxE6dPIG5OgpHhcXWtEUs3mXPAqreI2LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=yahoo-corp.jp; dmarc=pass action=none
 header.from=yahoo-corp.jp; dkim=pass header.d=yahoo-corp.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yjcorp.onmicrosoft.com; s=selector1-yjcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIPBbljYbBaUfbiFDZEWJL89JxQNjmqOpffQy8vavik=;
 b=E5GM0nNIdAbU7Dc6JkSF1pgafiVMDkFLIOtST4WkHDvmKmlh9OlgL/OM43ttRCqLEzY9QSD6AQcwGpXVl6A8mrh4N/7OVPcydNr4QkQPqvMvKYkNqaqCA+VwjPxyd+qxgslzO8MidVyzol8blqupbb9zRHI7ndnPl05OmYey9Ds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=yahoo-corp.jp;
Received: from TYWPR01MB10194.jpnprd01.prod.outlook.com (2603:1096:400:1e6::5)
 by TYYPR01MB7904.jpnprd01.prod.outlook.com (2603:1096:400:fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 08:30:20 +0000
Received: from TYWPR01MB10194.jpnprd01.prod.outlook.com
 ([fe80::9d9a:354d:e1f6:70c1]) by TYWPR01MB10194.jpnprd01.prod.outlook.com
 ([fe80::9d9a:354d:e1f6:70c1%6]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 08:30:20 +0000
From: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, aoiwa@yahoo-corp.jp,
 Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
Subject: [PATCH 0/1] Fix occasional test fail on multithread
Date: Tue, 17 May 2022 17:29:53 +0900
Message-Id: <20220517082954.1566-1-hnarukaw@yahoo-corp.jp>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:405:4::24) To TYWPR01MB10194.jpnprd01.prod.outlook.com
 (2603:1096:400:1e6::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f76081f0-e651-4558-7a41-08da37df7a94
X-MS-TrafficTypeDiagnostic: TYYPR01MB7904:EE_
X-Microsoft-Antispam-PRVS: <TYYPR01MB790411F4DDD83D3FB289CAA680CE9@TYYPR01MB7904.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YaQAljvaKQh+5nkBx75JWXMOgrCL/Nb+sNzPvWjWrgpK/MN/MZZtc1wcHzLtUqnzEMyxg+32GNHhrLzSMkwM4ZUfgpTUwlG3HthC92FGBmmxKgIJjVO7dZVhGkwkRd4ELpMu4NHKhBqGDF+NZaDYCZk5rkRqZLwWb0pK3jpKfa7gyGHWNFocit6IUV02s2SrVoeRB7d+6+9Z8PchnnnOO4I/D2KzlLJXF4ga9Le9fybQgjRFQA/+7jU0e7jssnyOx9ijLwiSQMITvmVtdoP96CO3aFgbLcDj6GrzODhLwmUlNZNJW2QsAeF9GlRp8dYY3Hcc8kcg39ZNOXDPnwWDjWlj2QYUr5cY4Ghjr332no01aNAdi0Ry6C+/Rm3IaRXECbdKcDqn37qkAAbiB3SLSfOY5ix7MeJTxTMl1Lb+xP9fePc/f20Oz2O5gWCTywt4wYyw8rWchS1wws54vCCqX6dzasWaslV1QWgPE8SKN+0QDUITYK9h8EL1uN86yAmYSUPgSGulxxyot3hDmGEDfJh2qmZZRFie7vIzVo84UqZ++J+6eSwCh32ZuLtFReyfGjhve81uYOrVJrWg/BDidA7EjbDj/S5LF7MS07X5bYxLfs5Eq9XRYd+szdJgO2zrY2tJG7cHFPZN3Ob/2hYTjdWUXmf4tUOZDbWZjM+ahC3MIf7X3rcWpHg29Q9G4EtmCsnQEnneAaFYxnY5mO9WbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYWPR01MB10194.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(26005)(2616005)(6666004)(508600001)(6506007)(6486002)(52116002)(1076003)(186003)(83380400001)(36756003)(5660300002)(6916009)(316002)(8676002)(107886003)(4326008)(66946007)(66556008)(66476007)(8936002)(38350700002)(4744005)(82960400001)(38100700002)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XJSOhFZYfhGOoDxDll2iK/H7fZ/sTfCo9cWZhI4w5p20naMy+5jzw+WgOQcN?=
 =?us-ascii?Q?LEu9LKbozgx5FVPT1cEMxB0sVP/p3RdAold2CuKu+5MwuqQ4yD6F2lZ/EjLk?=
 =?us-ascii?Q?HWmBHPSLfKVNjkCdpRieC730EyoV+FnZYTXtUtXUAD7Lxy4VtPkP1uS3t3Gn?=
 =?us-ascii?Q?Rys9UYwztcQ4+rnV5sNWf6TAZngVGf/+ob3UW3CwJGlBn6ed6Nc7X7xUxqFK?=
 =?us-ascii?Q?FMswj3leXb36I3MgmC3lZAEzWydfbIx/WMTfWvbPJUpNQXUVnwLRrpCLXknp?=
 =?us-ascii?Q?i7Eo9zX67+Nni6swCprQPfCh9pJCYxrF3DaeY1S0AIf+C4iQM41MXw0O0eVI?=
 =?us-ascii?Q?tLSHRa0l+IpKt29jvnOY0g+/Lst/d+ltrSQH+dZdCmoXcT+N/j1Gx7W42KWO?=
 =?us-ascii?Q?Bk1ZznbdNCosoTif3nI/uTs/9VWCvrBD2zLdGLjvhRhD7QDIjlQ3wK1ahoKa?=
 =?us-ascii?Q?rgXr9CZtXUajFClav+JnMTnKMvRLVA9GohuIlob6O1QyjsS4aza/X8HsnY+U?=
 =?us-ascii?Q?fZxUJz36H/72pQ4y18saW2gGP6mjGHMDNVyZ+nHy6dYC052if87S3ZwlZY8r?=
 =?us-ascii?Q?MvSNo23cujRG6rXWy6FsbuLN6TgQ1oufPLkTn6R5MkJ5KdLzHagzPKoxUpuU?=
 =?us-ascii?Q?C7KshSUkomS6CQI+fdnl5i2kHqh1ELqYxdDPXn/ed0PdFdTiYt1iHNBWncwf?=
 =?us-ascii?Q?jy9ohjhWUflgKf1YAfkYPTkgrNGok+mUMQf//Dy/+3eth08p3QXf6iK9xtGJ?=
 =?us-ascii?Q?Y8ptsb0CfyTryR+dCrblyeyIzq3W46mADFJ7uaJ74MPfkMMWHBaXvAbpFI4D?=
 =?us-ascii?Q?L81BP0L+aco7dpcaMvRT8LLrgOxiEpwW2zOMzRD1bkeGhr7QqhQN8IfME1kz?=
 =?us-ascii?Q?SvrGJJAviStSiOTJySuYSsTjCHufYWcblEgg/fSGHrS2s4uQ+0aP7fyi7oqL?=
 =?us-ascii?Q?9kEmMNb+7DWKgmy6Mr4/I9J0Mco4aSxchmr6jvmke1iWsL0J4ixjYqWt3XVD?=
 =?us-ascii?Q?u/50jfbvsoF7dd+tKCZGhdaNckJaF4dM+m+jdSPqQLtpxXiGNQDflRQ0HmJY?=
 =?us-ascii?Q?Lt8Jv+MYhJ6T9PpTFgcHry0u8X54hfNGK6OwhgF/ucq/nWeKZd2wXufbTvWm?=
 =?us-ascii?Q?achiCjWf6ihKRe2V6w0q04bDSgZkwKSVn57vOIvsXDDu5hqyS5KHoFHy3nNa?=
 =?us-ascii?Q?ZMPtb7KFvlCVe9JHJvK1P0tyzhV5sZdn8mlKGas9TX2NK+ZQmuRO6GRHBOMA?=
 =?us-ascii?Q?eBlq91J+ICYzMQnCMs+i1bx/lb+81d/ykmNRLc46VEcgenQtqMHk7fCvfwFG?=
 =?us-ascii?Q?CLS+6ruJsqUC1hzjwdBquVoqyWtubN1bQjhxAqOZb5aoCmDtW1cD8iEHAyMx?=
 =?us-ascii?Q?Swpld1fvtRa1GQKKUhbaesWIA0MT7OJlR97yZH5VHYjbSZd22pxeT15Eq8O5?=
 =?us-ascii?Q?CqE2j4Gib0oDGSn478bi4WdyLeJt3V8831EZExNBWFPglwIta7tD7r3zfQjp?=
 =?us-ascii?Q?RWWUpjL2AQNxK2EWn5bA/kkjCRAyfXBLCrF2ledDZO9tsGjpTu1Rkd6n95st?=
 =?us-ascii?Q?7rGNXpi7ZPoGzrtuX6gb2azK0vNENUuq5Aq2hy0pWyxDWuCXhdY+v5/aY3bT?=
 =?us-ascii?Q?Y7WTzZicoOEfOtDyCmkIkLhuTXAF4eN8rKMYpAPzHH3iAfwJj5c+G8KQO++3?=
 =?us-ascii?Q?wFbcIKh0j0Bw01aZ+LvbYU6u1twGzQnmpaZhYVVZZKSzx1tDET6VpN/dPEND?=
 =?us-ascii?Q?Q8AjxOIUOQ=3D=3D?=
X-OriginatorOrg: yahoo-corp.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: f76081f0-e651-4558-7a41-08da37df7a94
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB10194.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 08:30:20.1069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a208d369-cd4e-4f87-b119-98eaf31df2c3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXmrdm4UWgQcfuU1So2gnOuavR6WFznfwy/SV+mq4BC4aQ2AofdtH6kBA7keDofK7r8JSHwmURF0A1QalzuDmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7904
Received-SPF: pass client-ip=182.22.125.216;
 envelope-from=hnarukaw@yahoo-corp.jp; helo=corp-ob09.yahoo-corp.jp
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In some of our environment, sometimes test did not pass due to multithreading behavior.

I think this fix will check correct behavior. Could you review this patch?

Hiroki Narukawa (1):
  test-thread-pool: Fix occasional test fail

 tests/unit/test-thread-pool.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.17.1


