Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ECC4B4F77
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 12:56:21 +0100 (CET)
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJZxr-0007oe-VX
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 06:56:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1nJZv3-00059U-0b; Mon, 14 Feb 2022 06:53:25 -0500
Received: from corp-ob09.yahoo-corp.jp ([182.22.125.216]:55454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1nJZuy-0004a1-FA; Mon, 14 Feb 2022 06:53:24 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01lp2176.outbound.protection.outlook.com [104.47.23.176])
 by corp-ob09.yahoo-corp.jp (Postfix) with ESMTPS id E538B19FB18C;
 Mon, 14 Feb 2022 20:53:12 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo-corp.jp;
 s=default; t=1644839592;
 bh=SE6HcfpCrHaedyYrYaBgNVbMj+CIV6TNk3iHcFOH+pk=;
 h=From:To:Cc:Subject:Date;
 b=owIJhoxetOgKDrlX5TzXCFa0IG8p5Gf155V0DHZ3Y4VKzGkcbtX2XbaWOfNwZ4R/u
 7mYuNbNbf7UQDEvZneEhQvwH1pAn/zGR/ShxkHP6LaghmQhBL7GTup6YdRtUIgy4zT
 9XtVYzYEhxD37YXlhpflmx9GpH0VMNTkB8/KC+4w=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFb38kxs9HPQdWvGtJxxVojXylIR2yEV4oSotY+e84iFjKzkA1rW+MJF7dIWW7nmkA4g3Z1w6TfIWrx6fJ2F2A25KYqYo0/LUkUIEYl6anUY/WO6UQG6ZFjCF19J0KkSof5iMo4Vfiio7sTZ9j1/fA4DqTz8ELMw6jPdiEu5p4OqIRrpDBYD3nyxZLt04nJQuwENLmp0mLJuIAFR2Nb3Z77uLpUxyO5wr8Na8CspYc0l6s4YDX/C3XRvdi1xjgZF9a5/OCanN3YT9uRSZnpNcS6wJVZ43g22QYyZ/SEbvSEw/o4qQmOsjM5bmPnuGdlOFOfiUy+uPb+/HT9mYydUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SE6HcfpCrHaedyYrYaBgNVbMj+CIV6TNk3iHcFOH+pk=;
 b=bZNq7F7K6QbR+vdNDUzHD66ggzAWtYFi+YOR9QByRnOBTuIG29TkI1k8UTZ6/R3xxEkGGy1Gbxbp8SHlXMuV/qpIuZkq/sXNodla+AbMkNchZ0dFAADfhzXp2GSW13nVII/pUYqKRq7QrNdAX1jTRTShhnUbfwcoY16ManDsq2wQ6psgI+Tb2mnZgXHGwG0MSKun5hh16hJhmw/RgzHz0V5e4z0u/64hRiaDPW7jYtETdLaKE1asiE6qrMVTN0hB6qa5KYalmWu1/mbVMRPo9o4og6Z6bo+xBUyt+XoUeyvAGFVMnFeqZxf9esvJTRfyaKkx+VkrkF5YGLwVcGyosA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yjcorp.onmicrosoft.com; s=selector1-yjcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SE6HcfpCrHaedyYrYaBgNVbMj+CIV6TNk3iHcFOH+pk=;
 b=m5Wj3eebG+ky1c9jIW4bImWj31r6OBz+aFJ6BW7dx/b16gCOStCDE8W3MdoD7PAalmT84fxCmK0YHrUGOvbYUfybiMF1iTEpS9DHsADzYxnJ7nu9RHdeG1T+4fUJKbMookt4wc85rYL2yN8PNDA7WfZGp3YBHm0JsALorJ9CBlQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=yahoo-corp.jp;
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com (2603:1096:400:15f::12)
 by OSZPR01MB6889.jpnprd01.prod.outlook.com (2603:1096:604:132::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14; Mon, 14 Feb
 2022 11:53:12 +0000
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::a591:fabe:54bc:fb40]) by TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::a591:fabe:54bc:fb40%3]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 11:53:12 +0000
From: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/1] Patch to adjust coroutine pool size adaptively
Date: Mon, 14 Feb 2022 20:53:01 +0900
Message-Id: <20220214115302.13294-1-hnarukaw@yahoo-corp.jp>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0007.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::12) To TYCPR01MB8357.jpnprd01.prod.outlook.com
 (2603:1096:400:15f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51052c55-fc15-49d4-3d52-08d9efb09390
X-MS-TrafficTypeDiagnostic: OSZPR01MB6889:EE_
X-Microsoft-Antispam-PRVS: <OSZPR01MB68899C6B091E1E5CB50C8A0F80339@OSZPR01MB6889.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BVlesSYrjX2LD8ZsCNmX2sUwiH560uUSldEEWkr8457KLdRXAEwZUWBdFfTULsRnd7/NZABZj1k7qR8X2DR0SJapdGsfWn/KFJABlCZFuSlWJc9xh/urhaQdPpNHAIVZG/yX9W96omc7CbKcNBMRAC/F4+NPE5KVS20UH4ifq66M50BOd1CfklVakbAnQpisLeH4Z3u2GGZkEuXYMpkT620gWpk4R2CUzvFglt2OhdcD3CLQJsFkFZK8oRoUg6S2GIRiainiTDIZDGtAWjK2bZ6giDPZD/CbYB7vMYWG7MiWfXFdjXRbZzJkNJLLUS97sFrjDPw+DkgGsguQg2Mo977rtlNGIzS8UsfW50CNzzQndyl7q+qf65g7RKTYE3ULDRFttItcWKZsT9MmLTmdKXsytqli3YFXtSdrnVM2JgCn/N42ykovvaanKLC5NAF79I1AWSE0jVy7m+g3544NvpPf8RKryxEEu9f+JOxKnAGsDEyESzmjjAP5ZI1dD//QO+V3wg4lR4l+EpqGMqyjQ5fyOg9yAc0ca4BfE/z/ENdbNzuaCrxN+Eu7wxACKU6g1qsjlFvgdHEpPdINGEYfjS7VTv44Bybv2dwmnP+Kx03MjqXKFixIacIdLDaRjHieRbr+DjQ5fFTEis8SVSX99Qia7Gbrs6hRmDqSvyevBlJnO4mvWMyYtX78vq+/G+IlFJZokwDhjpxSvTa0Xso0Yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB8357.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(82960400001)(6916009)(316002)(66556008)(66476007)(38100700002)(5660300002)(38350700002)(4326008)(8676002)(4744005)(86362001)(6486002)(508600001)(26005)(2616005)(107886003)(2906002)(1076003)(52116002)(8936002)(66946007)(83380400001)(186003)(6512007)(6666004)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7s18ZvpahXKNB5OAHkistemtuY4l7Oy93vbhCcEAbs5gfzh9q4J+J4tn8mJv?=
 =?us-ascii?Q?11dWcDlWL+cFQAxNwglF5W+Ti+uO2eJVJMfReqPyIsPQZEfe8e+dZ1xi+scD?=
 =?us-ascii?Q?x4vBMcBGVuVEnigTWpQWNbdY5cK0Wzi1H1OcO8wEIYg9K2diPSdbb1VLvW2y?=
 =?us-ascii?Q?Bb2zEAKZgNqyecq2XFEn264MgBEdjo5hIvIxtCAlWhVYOOue7S9mOO85HeYD?=
 =?us-ascii?Q?IwqD+Jwl5sSgwNfzzyKM6XBD66lsV0T0rhElcekEM5iOMZFtVSbuonni4meu?=
 =?us-ascii?Q?BzeIrM2HdE6Zth0Hu4JEN966xtZVGLF2JdgOczW6KPy/TD3+wnrSGNeoTldW?=
 =?us-ascii?Q?19ZCujOYLZwrgMNO59oV9o79Hr7HPF19xUKpjNaI0Zf1dQvF9paVLLjQ8E8R?=
 =?us-ascii?Q?qSnAZ1GkssDjaVElOZ8+YX6430NMiUATxz0yNSSri+78D1iIjERK8wD8UlCc?=
 =?us-ascii?Q?KZPc2ZB0QpLkIDgpPO2Q9sUXYRWUka7LiDVTKbrRZvGJM7RzlCY6G/IV5S/1?=
 =?us-ascii?Q?q5iA0uFcQQuZEXJDgrFPzyO4E1cNrLt8lLMqNHUEBk28JxnY3sKgeUlWS4hO?=
 =?us-ascii?Q?vORyOfYQGeBgHHTJdxJwpvNHkzTfuUHPuDQS0Ttrg1n7RT7W8TDLaaFa3BVv?=
 =?us-ascii?Q?ZwM/sR+4JgMOrkAibKDekKgn2gpBpsxbiXtMwB7/RDe0KEiopYRhSQkmgczX?=
 =?us-ascii?Q?shhh4ujQEpJ/PuhA75s0EV1GUhECjuRxjq+6P6vWY2hTHScIEHsZMSDvD8qC?=
 =?us-ascii?Q?CncrhixAE+3th6h2pL0ScjE88JSCGiqaaD2doylle963N2+5bZNu09j+uDTI?=
 =?us-ascii?Q?YWtZDqtLJA3rapl+sITnYt2Vv3VicAvaHK/X8nuG65gXRNcmwuZx7t06n4+v?=
 =?us-ascii?Q?U1xGL6To4PVfxyLvf63P4b2KNM/lk1S9B2eWQf68688zzChH6DSVIU7XzZDB?=
 =?us-ascii?Q?DzUYZBJC0/PGBR+sI7CcJGHtd8kSMfPOR7YPyTMgw5R2O2F4FO2oBmQx805K?=
 =?us-ascii?Q?P4CyuiViGMAtzzGJI8yXwyUsmAY2WbU8PArjwci/HVcik880UtVWgJOG+otK?=
 =?us-ascii?Q?vOOip958HT3SwboMi3FywHr2og6xkldFrAZvpNzMMBfmH8A1NDcqORDhbvTE?=
 =?us-ascii?Q?NV1jbZYCJOSbIlExczWumTfeGr8qdH+Pczb2QIe+OhuI18rLeJ+vwssdnZW1?=
 =?us-ascii?Q?ywvh6j5OevfBpsoRLkiDlYm+dsrzq686zMIonr3HwI+szm/3YkjmNiWYNO+I?=
 =?us-ascii?Q?NWVF0hMWsbWXjfkT3/ZQhg2UE8DnquOShV6OByyqzKK1TrKiLqNZf5v+he5R?=
 =?us-ascii?Q?xLLp+09oIjbxyFGPooIfYWP6lmdP6+p/47XhFBS8+fUL1rPFRhuSct+t4v7/?=
 =?us-ascii?Q?rKfdg4XQsfZiwGB+sVURc4PPihRhozP7buR2om8zsF7nlhE8iuAObVO3fDaQ?=
 =?us-ascii?Q?B82Ye5bxgulD7zHXCfCIApoMrddTzbsFi/3kov2fW1YM4Z+ToCaWb3dHzgnS?=
 =?us-ascii?Q?n69JYhY2hEOKuHee6WAT2axHXJ968LCSwhpGHfZZKtDpmmGTo+VNmq36mroh?=
 =?us-ascii?Q?ZNF7AQGRsqx9I3defvbvSr4M75RUabwh1s7YJRajgSXkDbFED6ZlDeVz607H?=
 =?us-ascii?Q?Mcd5+E1flUX9Nfq5vOren0g=3D?=
X-OriginatorOrg: yahoo-corp.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 51052c55-fc15-49d4-3d52-08d9efb09390
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8357.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 11:53:12.0028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a208d369-cd4e-4f87-b119-98eaf31df2c3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7aDnrwE7qnkRCBI3pdB3ubk0RMzglaUTOmMtLPgs0AD6kNj2P90iMCd7kFDT9I/lEDfep7Rkq3tDxHx4yyfJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6889
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
Cc: kwolf@redhat.com, Hiroki Narukawa <hnarukaw@yahoo-corp.jp>,
 qemu-block@nongnu.org, mst@redhat.com, f4bug@amsat.org, hreitz@redhat.com,
 stefanha@redhat.com, aoiwa@yahoo-corp.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resending with correct commit message

Resending patch with decreasing coroutine pool size on device remove

We encountered random disk IO performance drop since qemu-5.0.0, and this patch fixes it.

Commit message in 4d68e86b implied to adjust coroutine pool size adaptively, so I tried to implement this.

Changes from v3:
No code changed. Changed commit message so that first line indicates to
correct commit ID.

Changes from v2:
Decrease coroutine pool size on device remove

Changes from v1:
Use qatomic_read properly

Hiroki Narukawa (1):
  util: adjust coroutine pool size to virtio block queue

 hw/block/virtio-blk.c    |  5 +++++
 include/qemu/coroutine.h | 10 ++++++++++
 util/qemu-coroutine.c    | 20 ++++++++++++++++----
 3 files changed, 31 insertions(+), 4 deletions(-)

-- 
2.17.1


