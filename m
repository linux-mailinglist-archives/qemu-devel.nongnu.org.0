Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D20A48AA5F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 10:22:59 +0100 (CET)
Received: from localhost ([::1]:51890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7DMo-0002vf-Il
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 04:22:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1n7DKl-0000as-Fn; Tue, 11 Jan 2022 04:20:51 -0500
Received: from corp-ob08.yahoo-corp.jp ([183.79.94.93]:34198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1n7DKa-0001hF-4X; Tue, 11 Jan 2022 04:20:44 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01lp2173.outbound.protection.outlook.com [104.47.23.173])
 by corp-ob08.yahoo-corp.jp (Postfix) with ESMTPS id 0D8C719D0AD9;
 Tue, 11 Jan 2022 18:20:33 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo-corp.jp;
 s=default; t=1641892833;
 bh=txOe9D/jgkd5BI+CyBikRNlD+MYu8HmnhOY75QST76E=;
 h=From:To:Cc:Subject:Date;
 b=DmiK44JGripeq83E6mEXRqP5pE/PJaQwh5+W+NMh2FP8KkMjN8QA9Uo8UyMuBm7Uw
 kwN+/9IJskrxzyHBpn/DDARjKqn+rPwXQm+au7SWkFqduutueuHqFgZDG+pgcuMp0t
 KoasjiFthPrIrX1HD18l1LosPIPvhWNtjSkSxsZ4=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/FBIcpLBrpf9D8w6tcbcJshnim9cQmNzBTvOGecwnSzCNO4WBoAlCKiu0Nsqlp1eCvlFl0ytc4PM5/MGtkpvq7YSmed5Aqih/dr0zCqWnewyo2iwMBqwsDcXlp4IfLPVXIlNhy9SvAk/r6Rs1GSOVbGe1LvBCSSCxzFF20FCqRGWuXhUMzQEvB/1fcrVH2zqY+CcXEEe7N7/gE0at9NqFjkoqPvbbA+kubeG7AblTOjeikbWPBfDc8xSoLSWnZRcYjZWS7IfakUy6fTmjd2l7E1k1ycbgWdQkYDzBstrkHU8b5W4BUOinSiyGDauofn/INpvTGnor4T3ddE0EjERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txOe9D/jgkd5BI+CyBikRNlD+MYu8HmnhOY75QST76E=;
 b=oBXmxJFXqWGBRXtJc8cTGC/mn9Coc+gR3Uh6kpdXk7vT74gAthDNwtga3jBkruIhcNrElCNI1y878A9GplwGDpTWMiSQbt8cPRbFGeLvH5JWxfnmhp1BfdnaC5ySpyUs3dbQqkXdaFk4Vsiz2YfVO1Ql+yWpp0O1El5s9M7jxKFiATiNABORokt9taMU/njPYJxxI7+eNS3PcGTTCX9ngEnzBw8GOOeL6gIREFWq9R7soPs3lQEOWP726gbH9eWbmWaa333KCgh7rolE7KUzK5cstdUPYTmM3Er7gQG2gmQi8KA0z1w8XO6k0RmCohq4p5UBM5ZuSgxDxDqNI/9rsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=yahoo-corp.jp; dmarc=pass action=none
 header.from=yahoo-corp.jp; dkim=pass header.d=yahoo-corp.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yjcorp.onmicrosoft.com; s=selector1-yjcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txOe9D/jgkd5BI+CyBikRNlD+MYu8HmnhOY75QST76E=;
 b=Ybe3YTLay/gEppJo1tyZruMwCYCvuzF0Q1td00OG4w4IP9lmRkTYPT1+wHfwKKPqMUG+iOw4u0pqK10aMdWnRY2wC499MwTOInoUaIdSkEEIYQ2dvQK8ruHbhf78no2+JqkZ4qb0vNRkMPk8VodiGgQ6t5FyTHPGMwXoXAE0KFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=yahoo-corp.jp;
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com (2603:1096:400:15f::12)
 by TYWPR01MB8639.jpnprd01.prod.outlook.com (2603:1096:400:13c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Tue, 11 Jan
 2022 09:20:32 +0000
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::d1fe:ed04:219b:afe9]) by TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::d1fe:ed04:219b:afe9%5]) with mapi id 15.20.4867.011; Tue, 11 Jan 2022
 09:20:32 +0000
From: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1 v2] Patch to adjust coroutine pool size adaptively
Date: Tue, 11 Jan 2022 18:19:49 +0900
Message-Id: <20220111091950.840-1-hnarukaw@yahoo-corp.jp>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: TYXPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:403:a::36) To TYCPR01MB8357.jpnprd01.prod.outlook.com
 (2603:1096:400:15f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5423d877-4f5b-4df6-ff2e-08d9d4e39dc0
X-MS-TrafficTypeDiagnostic: TYWPR01MB8639:EE_
X-Microsoft-Antispam-PRVS: <TYWPR01MB86399E3021D4B9052CBEB7F780519@TYWPR01MB8639.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qnO/5V343cOgzeVpwFXmjeMR3CLdopf6xdYjQbp2Z1OA6Ux6dU4C3DOB173Lp5ROHa6fsnJpdFG4x7uyZT90RXdBnl3xh9LzkRSwAxRq0RoOeD3M3nlC0f4GbjgpiVG97DapeFkc7IBYwqGk8OECxZGFG787oBDFiEpSLZH32ZU37w9nGVfe8qep2janUFzZ9zeC0ZBG3UQsFmTo+Z6wv6czZz11ybY6aYlHez/NtzIr7OjNY9OJl6mVPQZXPcH4ISXePnxDmSf/aWGIbq0TQr13qOYZTbuWf/GZq/ovlIObfpvAuwYriEUn4vUIDpD1+9TEzlbXjNZ8wsxGcQAigXmZ/TO6/mpJAHYl3ap0yBFD+r5FwtjVFhb4/JoJZMUDZmZ1XFFazAKD/nNgAsMQzORKp6bshxE5Bt2gh3eDlrC/OghK2w+0B+WDHe/f5fqZb7OjdO080GqB7L2tG6zgkpG3DL30KgfUaUyYC9QfgidtO3lmh9SK4KExarkjlLpebhN2bCbfnqo7W8m/AyO+DbMfobXF2/Sw7QOSc82nnI19uKG9u6oq7DuPLcmLjyA53YInPU5R876xqBaEiu5FzhxRviaxb2tFUQuY/TqvYn8Egs0U0SZHt30RRBKj5BycaViW2bPh7Xq9YKMnfkZ3ky9UEPbcS2ABWULDwMmArHE5zxWyG9YnfHN7uvMejDr+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB8357.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6512007)(508600001)(26005)(186003)(6916009)(6486002)(4744005)(5660300002)(66556008)(66476007)(2616005)(4326008)(66946007)(107886003)(6506007)(316002)(52116002)(82960400001)(38350700002)(83380400001)(86362001)(8676002)(36756003)(2906002)(6666004)(38100700002)(1076003)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?46zlTkz46o+8+Zo6Vfjy/KJ4o01a8juX5hkBHZ5PhlTESp0mS0dIcnbqxc1t?=
 =?us-ascii?Q?K0pFD77lXRu+1jwNgflVxpd9EQIXr2UxEiD+FRfrbD3P3NNE22BuJ2FYF1Jo?=
 =?us-ascii?Q?YY3OTruIKfHW41Zypy9veVA9k05W0LVJJffHD7GhvkWvJoS86lA3tXYfW/SJ?=
 =?us-ascii?Q?Jn3tkLZqZK1LaBGKvQCtyQ+1hjfSqI9USANuDyFzyw1Ix0ychJMCQfOGvm2y?=
 =?us-ascii?Q?mYlTBAJDOEe4eFzSOCzL2Ac0WvEoVqolURHZZxIeYJqRBdEnUhSzf2a4pyrG?=
 =?us-ascii?Q?dRwD3Dk3LWFrI0JclsRUcAi83Fda8+p0P99q399JF5Lq6DSj11X8rJJb1MtT?=
 =?us-ascii?Q?vOkArPLCEF0xk6I4XHjtDJoX4UYTY/vs87a+KaqWUA0kF8dIH9rQPnzcoaue?=
 =?us-ascii?Q?z3aTsERq+STceFy6QMANhLTO54w5CR6WADf/9aiavgR4E2NMxDi/Kxki9RzK?=
 =?us-ascii?Q?0m/MMNkKIBrJJb9NdmLKBWSenD5gZcex3REr6IUy8pnjkuiAfmZta9pgGf28?=
 =?us-ascii?Q?uqcYIDM73iZ/CIkeZAYvC/TEOuRe2YHjq2JG3qWiUd3bbpCE++WphwiDwrlh?=
 =?us-ascii?Q?52OZC3YlPK7Ix1lAZJ7ei1wjTp0iHbpk7ZWAaVBDolOHH1wkRWrTflUuISQO?=
 =?us-ascii?Q?FMi8kRsCDTMQJ/VmBxGuEu8U1/pLf01gnoJMujL9M2Z/T3FmZ+1rAN//369f?=
 =?us-ascii?Q?qU8hFMFUvcLytB9i2wQdOKD0OeAds6a6Uo7PZITp5RWstxICDmGsUaBmSVkB?=
 =?us-ascii?Q?mIFf1eC6z/whkm/Hjfw/gdiALuNLOGSQwonbH/M5wnedUOIMldoprK98snmc?=
 =?us-ascii?Q?F5KOE4KsAv3DX4Fm9su+9xqBiVazKX3YyEfE8qMMIjeL1h1k59Py0xQBDgJ6?=
 =?us-ascii?Q?NGcA8jlt9BG+UhqvGEy9cu9eeXUWKubc64LJWpcZPEwTuYhtr7yIpWd96JJE?=
 =?us-ascii?Q?Jv/1ztX958dXx01lmQtD8af4SqKfqAbjI7Lto9gT6+qDMVn3apEbTwdZoESD?=
 =?us-ascii?Q?A+0/CkTkUIj3ITBGOLyeByjJWvu8WkM+ww4INIUETk7mN+bvlPjHKTkaURB6?=
 =?us-ascii?Q?9yJNpwkU4ZslWusG4SkNIc1otI5YUYBuOe0/eQTpLyTfdmsbdt7p47FSocc8?=
 =?us-ascii?Q?QVEJd+QjhH6pIkBsVjVDl77l2VtQmujMdkxTBc8P08mljzyBbEh+WFYnLHY2?=
 =?us-ascii?Q?PT4Eur0Lw88NfNfmb20LHdllIlTZ9RCDidTfoCXquyZykF3Df9XmLAmouXhP?=
 =?us-ascii?Q?dB5dHpmW+sy8Rg5sOn7dN4uZ1nGmYYC4bZMxv7zYMOVtEGBo3lXc9WMAcc5Q?=
 =?us-ascii?Q?/ONyR8fdRdInq0nuyd0WXPS6vqLvNZK2u5XKhDP1bsgmeZe93TZOHj74iaG9?=
 =?us-ascii?Q?u7MigtVL8zADFMl2p7VPv7cSt3pSx5W1oia7oIUXjfPs1afADWMSNHsAskGn?=
 =?us-ascii?Q?Q/AT7QtGv7c2n+epixA3r1jKPkIh5CIzHVi5CAuHsC7csK6o0UUFAEb4STO0?=
 =?us-ascii?Q?/mC3tGPbXyZOhQ5sm0pfSaQ2m2zfXhhbS8b+QR1cAGPq1frvgPUZ86DMARHB?=
 =?us-ascii?Q?m9V1RO9mJIELajiijksKMJVeKLl2/MazFJ3mKcSmRx1mHPkNiA70fMusoUij?=
 =?us-ascii?Q?eRAu3bS7sG7Xf3W9ucKac3E=3D?=
X-OriginatorOrg: yahoo-corp.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5423d877-4f5b-4df6-ff2e-08d9d4e39dc0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8357.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 09:20:31.9909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a208d369-cd4e-4f87-b119-98eaf31df2c3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfK4xFKLi6DeQ1NVVi7NVScwEVyFeIMdPgPr0hDfXxkCw7P1qCktJ+4zAsptWGrkNE72vt6jksyQWJ3DwpH0eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8639
Received-SPF: pass client-ip=183.79.94.93; envelope-from=hnarukaw@yahoo-corp.jp;
 helo=corp-ob08.yahoo-corp.jp
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
Cc: kwolf@redhat.com, Hiroki Narukawa <hnarukaw@yahoo-corp.jp>,
 qemu-block@nongnu.org, mst@redhat.com, f4bug@amsat.org, hreitz@redhat.com,
 stefanha@redhat.com, aoiwa@yahoo-corp.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resending patch with fixing atomic access method to use qatomic_read().

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


