Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A90F48615D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 09:23:47 +0100 (CET)
Received: from localhost ([::1]:36418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5O3m-0005XJ-96
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 03:23:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1n5O1p-0003Wt-Hm
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 03:21:46 -0500
Received: from corp-ob09.yahoo-corp.jp ([182.22.125.216]:59162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1n5O1l-0002dm-WE
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 03:21:44 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01lp2171.outbound.protection.outlook.com [104.47.23.171])
 by corp-ob09.yahoo-corp.jp (Postfix) with ESMTPS id 5AEA719FAD48
 for <qemu-devel@nongnu.org>; Thu,  6 Jan 2022 17:21:36 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo-corp.jp;
 s=default; t=1641457296;
 bh=PxpLL8f0OU/rSfSL9sjVgKz3AmTndvHhgGAM2eI5KVE=;
 h=From:To:Cc:Subject:Date;
 b=pyO8xsJG1p2k6ysPpdUeEdp7xzAX/9c77jk+QXzb43u2og5O7zpLMlX4UU8MabLuJ
 kpXk1cM6D0uNBUA9VEtwkM2Q5qh7VKiPvyncLWkcc1dfd9/epP07hU6CZluP9p9AoJ
 TbCmRoUTmaz+MciPEaKErDSQ9Bo3HIYfuVrowxI8=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYy6xacbdamIsWK8qTxV/vwcNT9hfSoBiRrh6INaublR1nl14lDZeVdTnloIc3E1gEongbHVuoaIECrFTPxLb9VJ13ZN+LZqFRBhgwXKX9GAFvj7wA+eOXfbCpkfclt+jshPAH6Hrf8c1Ew133TIHTxqy46+AiKFP7lwrapsSaQZQWENRFOdRAve+jJtlMnnRoLAXPd+XgA+aIuZDQn9+UY1hIhodDhvo3HmngcofZ2HagAFC49NXde1V2vjD8pE6tY3q04ZNvpwGRSeneTU9bYS0oc6N5zikZvXrdBrLUCPhnh4VQtQgR97aKssvUJoY3BcXFv+4O3G+Ql1vk4wPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxpLL8f0OU/rSfSL9sjVgKz3AmTndvHhgGAM2eI5KVE=;
 b=SQtn/IoIXJ5hl/pw2UKtQHTo2hY3kRRDKUPiMCxY93jw6jZXJW14iegsXkEAl3Zhe8hIcW+GLvnFMvgjfdiBeeb+DV9iR5K2L+EUKTcv4QgGlXEDLiGKelB2UhYIW4RVfhDvS5uemiawO0bAJXNJmXfbiZz2dmXD5eDBH99wKjz8CI5Q4tCbNq7BUmFzcc8FiHv9hf5yW7kx7KqDW2q6Bmyg0qoyKV5cLBbrbx8qae9VjaObK0f1+Qv4xz1w83AmN4Tsylo8rYGR3Utlio+oFfigl77H0EOMTOHeeuAxcGCFpeEdq8VeHgM87KbKYiol/pPQ52Ju80iR0YjD6jx5Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=yahoo-corp.jp; dmarc=pass action=none
 header.from=yahoo-corp.jp; dkim=pass header.d=yahoo-corp.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yjcorp.onmicrosoft.com; s=selector1-yjcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxpLL8f0OU/rSfSL9sjVgKz3AmTndvHhgGAM2eI5KVE=;
 b=cjhLoc7eXUZOaqnvU5xz0jqcI+8n+OuOaRYf2YFoYiDDzdjWCUNElRDPSy/0P4XdPRhYyIbOgC47reVzT4k+V9Hs53XmBneWLENNle3INXRySzZHrO1n6A9FdM0otrnb0lkQlfqjgYvJ2RqEapQpC+Dwk66mtxpb0Mzq4lKizEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=yahoo-corp.jp;
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com (2603:1096:400:15f::12)
 by TYCPR01MB7412.jpnprd01.prod.outlook.com (2603:1096:400:f5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 6 Jan
 2022 08:21:35 +0000
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::c0df:298:f41f:49fc]) by TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::c0df:298:f41f:49fc%6]) with mapi id 15.20.4823.018; Thu, 6 Jan 2022
 08:21:35 +0000
From: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] Patch to adjust coroutine pool size adaptively
Date: Thu,  6 Jan 2022 17:20:56 +0900
Message-Id: <20220106082057.968-1-hnarukaw@yahoo-corp.jp>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:404:56::34) To TYCPR01MB8357.jpnprd01.prod.outlook.com
 (2603:1096:400:15f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e9e15fb-1dfb-4711-8ffc-08d9d0ed8d94
X-MS-TrafficTypeDiagnostic: TYCPR01MB7412:EE_
X-Microsoft-Antispam-PRVS: <TYCPR01MB7412EC5C438338F431046453804C9@TYCPR01MB7412.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ckMAcWxORSyx/K/oKTS1Rg5hnXqF9HwPjseuy9PYGNZwC/pjcz69u8Ltb7wer9zJoS/OWHtXQ98DuGGUuUXowiQNb2bexE9uV79LoviGzLJt78OqXulN+fF4tzXc286xYsfcGmNfcK3Jut7Nj5735LfLg/wZkL7D0zAe6BvDpgxSifcOP10Kfn52R0xUhcFs7Ml13rqt5/TL9OAQ7TcndZA+h7LUciLoVXKnE1qUtn7tBTrjIZ8uAr9Dzl3lRnWoV4xKyE8Tfn1Pv/zTerpcwPdp0ko9Ksexb13PhTONcFrj4DRbEqEseFMzBySv+nqKHObb1zTX4eDU9H3J4ECGKakhmDyngc7Z9v8ikv+2yFqCcPdb31FfK9HSNpgi9VIUxuNLPKwcgFhAUzioUhXvWOZStXE9s3Z6xWj868KtQx49UDB11P//qVgIL0MTEUSTecPk48rWgZFiEns5+gKoM5UvDMxldSg5QpzuY2Sbg5StOfOCuviyBwfCwQLLWq2vvdsBpY+w8LEFMlsBnCUyw7JX9W6jb6JNMRrBK+tfQnQ/Zaqi6hlmfE+PLF4rPFLB8A9YlAC8Vs+BOpQsC8VQbiRF47WymWbDvFsDLy57OauF58EERGYIxOywC+ge3SC2PEyGcQca1DnLCfeO3z7eAf+3hxoJhftaapIpMM8+0veG7LOaPm2a5Z28lXrJwzdTX6Qb57P62/zLrqun/33/Zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB8357.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(8676002)(83380400001)(5660300002)(508600001)(52116002)(66556008)(66946007)(66476007)(186003)(38100700002)(6916009)(4326008)(86362001)(2616005)(6506007)(4744005)(1076003)(26005)(6666004)(2906002)(107886003)(316002)(82960400001)(6486002)(38350700002)(36756003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MIHYpbOyttCN+VThbtdTSe1Xx5NVw+jeV8yBOqSvIHnGk8wEYrUCuZ3T9a4E?=
 =?us-ascii?Q?zk8ukvP5gLiwiEfIk11xsiyMyaNRaeghqTIMkOn7zPJ6NuHl2WdTRAjcnupD?=
 =?us-ascii?Q?n0suOdM8w//FZ3WuWbwsUNq2Txuy7PwK0QsHjL6pOCZUHMvVcTbcg3AgokN8?=
 =?us-ascii?Q?nPYPJAtNexMQ8A5Jm5PR1q8peg2wTGPvX4Kh7gV3+HjTfo3QdgMwME+BMX9b?=
 =?us-ascii?Q?LSik+2a/d3jKJt2gIiAhRb48lUCvRv45TjweRd8FHGqFFgcF2Y6ul64t6Fk/?=
 =?us-ascii?Q?VZc3JepR6UBdOAwUvfKe3pimsTDTUGFS2vLO4uEZ8bKAF0tP5lpCZgJ4Uu11?=
 =?us-ascii?Q?QAhUPnJYoWu42KopWcxSTvknmBKDM4913nBGJmhgr4y8l1PtrSjHWO2QJFKx?=
 =?us-ascii?Q?0fFcLfEuD0Npb+8s231FwvWCqhIIBRJ8IDnYT446NmshM4860r4Z3e5sGdaR?=
 =?us-ascii?Q?E7csqSpWtci7lOxahEKDmFCctIXTY/JyoiDGHrqUA/lVxNFeEjNDC+EXkwt9?=
 =?us-ascii?Q?cuUmXoldQ9eLiRKpBFEsFXQNS/Gu7qnwNKhxNuji3/2WHuvyf4XGPjs4X6y7?=
 =?us-ascii?Q?uW5ctV47HhS4kT9jMx+/+L7njqtcurz6AP0kN/PUx3EBntgIbTq/DC16Dyhr?=
 =?us-ascii?Q?D1jeorWYaKwxgxVCriXXXRkgtMxHC/o/95+0BpMuF69muX2uhuupf+gfq6vt?=
 =?us-ascii?Q?sb/9/iI4nFPnqJdnmdx99LTk3iugr7+U0S/2ZtdiqZ1p3ZnTLRhCW0dHExfd?=
 =?us-ascii?Q?xac7AxjOXV57ClzweYMe1y9DaLnMk9WDJNzg25u9ARwC/BKi53PG5Chy2gm9?=
 =?us-ascii?Q?sQW/+DsqwKFOEsDW7QyQLrxuiQENVffRPkisjdgQUIAN4u6F5f98I13jb7Xp?=
 =?us-ascii?Q?quDBdonW2WN+mSnvgyWhiwebjXBy2E6mCN2fzn9f7sIxiE5ZX2rBg6GV+Fwt?=
 =?us-ascii?Q?nLFTvm7+KzcOR40Fb0kvYk1KX9f0R7/ofxs7HCJ5g7kmugP29IvIVgDLJMEO?=
 =?us-ascii?Q?nhvz0LoxE/7XqJvOXqQH9geRmLhSA8oV1xzDuDpnVpq29OE6TQIcbS3Hrwl9?=
 =?us-ascii?Q?bvRCrCjN4tbnphw8rerEteRty14Eg9Xfe8G15LcYyS9JAbqVhw206FBBuUcB?=
 =?us-ascii?Q?xH7wkKWC0Y7lU7hP70bYVYf7fcs8I4EtQecvcgsHswF1r3s8TwzK3NKIY/eK?=
 =?us-ascii?Q?bVugNKB+97xmuzZ5+v3e+rgpVc7KSzjKmfthMJk1uCzrF8Fqgyj1XSwbFIiM?=
 =?us-ascii?Q?XQhBrN5mYMLoLVLtKOUUg49nN9e5gwqb/CvG7YdQTQ0blGrZZObo4kyYolsB?=
 =?us-ascii?Q?Ph9tfPlxGcTfnhrMyCLd+RSCipaTxCqqCF9uAYBxWim0A2ohJ8UBSB0jC16E?=
 =?us-ascii?Q?SyayQxLTo27c6QAO7DTd1YcYhx64noqbe3Jjv9LRFJxGahkiswKTIdzLb/Vr?=
 =?us-ascii?Q?DlfZu1I47B3A727EhgorPah3UbuvybFegq01lJ9r+FCxKmZ8qqbnFwpPE+kq?=
 =?us-ascii?Q?c0Y9qCoF/fL/rp8aCVw9uWWclDWcj0S97e/WziW6yjXM/hUBigp+YdcrgdRv?=
 =?us-ascii?Q?xImDiMupbfoIJK4LGMZ+csq8J35WmTd0GoyTLfBQitgmNu8f+dQxkKmB8OAW?=
 =?us-ascii?Q?cOf10mgUt6zjuM0VDUEFlM0=3D?=
X-OriginatorOrg: yahoo-corp.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9e15fb-1dfb-4711-8ffc-08d9d0ed8d94
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8357.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 08:21:35.1791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a208d369-cd4e-4f87-b119-98eaf31df2c3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8gAuTkDTARyIwLQeRGHzzNzHOJ7zZJm2PECWAfqQzu9CGBkx/tNYcfj7PzMWUG5qmPSHPbpiMDSQ36AeLHpYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7412
Received-SPF: pass client-ip=182.22.125.216;
 envelope-from=hnarukaw@yahoo-corp.jp; helo=corp-ob09.yahoo-corp.jp
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aoiwa@yahoo-corp.jp, Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We encountered random disk IO performance drop since qemu-5.0.0, and this patch fixes it.

Commit message in c740ad92 implied to adjust coroutine pool size adaptively, so I tried to implement this.

Could you review this patch?

Hiroki Narukawa (1):
  util: adjust coroutine pool size to virtio block queue

 hw/block/virtio-blk.c    |  3 +++
 include/qemu/coroutine.h |  5 +++++
 util/qemu-coroutine.c    | 15 +++++++++++----
 3 files changed, 19 insertions(+), 4 deletions(-)

-- 
2.17.1


