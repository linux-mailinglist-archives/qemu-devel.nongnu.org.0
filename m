Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F81149F5B9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 09:55:32 +0100 (CET)
Received: from localhost ([::1]:34582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDN2Y-0002NB-Q3
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 03:55:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1nDMkS-0004vL-Pw; Fri, 28 Jan 2022 03:36:54 -0500
Received: from corp-ob07.yahoo-corp.jp ([183.79.94.94]:51868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1nDMkO-00081c-LV; Fri, 28 Jan 2022 03:36:47 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01lp2112.outbound.protection.outlook.com [104.47.23.112])
 by corp-ob07.yahoo-corp.jp (Postfix) with ESMTPS id A6BA019FB18A;
 Fri, 28 Jan 2022 17:36:37 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo-corp.jp;
 s=default; t=1643358997;
 bh=iGiZLeVVTFKqE2FAazFpEGd5NfOLft6ojrcYQ1JWLks=;
 h=From:To:Cc:Subject:Date;
 b=jwoxQU4yInO91is7+IajUOvYgnqS36Vrs7zKndS2iT40hOp0iDpAN6tPbYYK+T1H3
 DZyEuyQSQB7/KXHEoFo9ljaNuEnQG6T8Fy/3yljNzlBBfMpBP/cc/Ts6IZE0xxJojU
 0+msnwzelv0VqSpeqJ3wN2RarSpLzMVg5ziRacKo=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqyL3VB7xsOLKbL65Jy9uaabOALFzuMaF/nV2ErPG7wlax+810P69p2p4QxYdPRncjVJBciTlkcgu+tl/NgutVj0iPhJxAKIl0lNTmwIMZIn1xSVgzG9aWg2bggPNJrMeOSjqnoEXrRs7XNjUSx//uM9YbpdOxOFYaTZXAHC+e5qoJ1GpekOw6sf8YsIwe9SwUAN1hGXWfUU22XE7FfWRD0hYWzOUgTyj2TfTHrnosnAdQywer50BjoT5gGoMPc3YA2OkaaVy1l4bukhVPBldvXw7DxcDT5nlN+pyCXq1cui1i91TE6+MYzGFXQb5BKd2FWpR91f7iU8JdTHaKQ5yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGiZLeVVTFKqE2FAazFpEGd5NfOLft6ojrcYQ1JWLks=;
 b=d79msEon8tds8BJvl9rNIrWz9Djf9/ZIbrLWUPtLyAn1bVHOQHrFj5howAM+Fg4gENyB8BQQgQ6GJjFZ23TqFELPMp22UG3WC2PxaK8t0SIC3KJH5D6AmYJ58IrsPuOk3AYNFPNBuBuDd5354X8dWkN/XtdR0oj5N6/WjMN3PHugdVLiZEBVJj3kO+6EWLHW5Hko2TCA3Z7GYJ3dLv/8LTpyal5fYOQI+LX/WptxWYgpGHAAIyiYOBustKgxGet68DrOMeJGoVII1/4vbUqMxdj7d9Fy+Ps3DtHrXw3vdvz6BUC8b3vxuVPVQNLQRBvPogECFuAd0cSsYrqb3VoWCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yjcorp.onmicrosoft.com; s=selector1-yjcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGiZLeVVTFKqE2FAazFpEGd5NfOLft6ojrcYQ1JWLks=;
 b=XQX6+FvQGuLhmlGDyGBWBohXs/e5FUlVDQyCG8Re3A8kSajTqz6RrgvqichLr9G8x0ctp8Sl9DwKoXYcVKpk20sWgrT+w7Y4djkMcgsMm5+lEWPPjWxAcnilEW1ZteSwTUC6hrG9xYSOum3KgwdK9Ucs81IMWk4sykyutMG3o/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=yahoo-corp.jp;
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com (2603:1096:400:15f::12)
 by TY2PR01MB3067.jpnprd01.prod.outlook.com (2603:1096:404:74::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Fri, 28 Jan
 2022 08:36:36 +0000
Received: from TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::a591:fabe:54bc:fb40]) by TYCPR01MB8357.jpnprd01.prod.outlook.com
 ([fe80::a591:fabe:54bc:fb40%4]) with mapi id 15.20.4930.018; Fri, 28 Jan 2022
 08:36:36 +0000
From: Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/1] Patch to adjust coroutine pool size adaptively
Date: Fri, 28 Jan 2022 17:36:15 +0900
Message-Id: <20220128083616.6083-1-hnarukaw@yahoo-corp.jp>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::9) To TYCPR01MB8357.jpnprd01.prod.outlook.com
 (2603:1096:400:15f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 207928f7-0d51-471a-aad3-08d9e2394bd1
X-MS-TrafficTypeDiagnostic: TY2PR01MB3067:EE_
X-Microsoft-Antispam-PRVS: <TY2PR01MB3067E2AADFE710326216F6E080229@TY2PR01MB3067.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S5dvfUHKrtvHXXAlYjfKzhbRMDLeqSr8+nIyBi6rtZhizIESwFsvcyaJMyl+/XPoXKTPY8b0fg5+Gzw/LXjVqQu+F6e777uoSd6bnPeQeYKNC0jdFEAeoB0cAWdiVMEkCPqATmx89yXX3pJmAcwcHT8FFl4QbMc3wrqWX45vOcb359Zq2EZqxqvkine8Il72HW+xqjqgS8vJozdPQFWAg72uSDAyHZXKPZWi3EDDCe68hxSc+YBd5T4b9PbVhW6foayK1xW1VQxdoNE/PqpXRlm97MUbjwYz8MsGntgPXWG9L//gN0W+Lspi+pdfIJ+ZnMiLY/jXccsHSqgzRAN0v7ORwhvwjYbQil18Jr8GLJMiUnoO/ivmAGDdazvcnk6e4+ULLTvneP99hhPHEmAxiba3HbrDvLMy8WWub5z2XJIxEzda/P4lHlRiugkTlgP+HNwNDckAgsHe89vsFji6POPVkg+abMa3gDrNWq27Ey2j4vh0Pbnh9r1YK0ggq4Fj4cE3+vA/yttaqOWjqUUrpNiAkKWmtnE2huDRKiCBA/Uny2aML9GBlmKIjYM3AbaSDb9sIFn8uBuogIkQJV8B1EvJ6/RrSWheNaHM89ow7sb1LPiLYukKFXWYpgyWLNQHQWDzvfa7yil2OFvGtdY295ag4DP4gpReJFH/BHvat9Qjbq48rj3hWgfnS6OCf6x7WY8bjKpTo7WcHDi8VXa5rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB8357.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(5660300002)(508600001)(186003)(52116002)(8936002)(36756003)(107886003)(316002)(1076003)(6506007)(26005)(86362001)(4326008)(38350700002)(66476007)(6486002)(38100700002)(83380400001)(82960400001)(2616005)(6916009)(2906002)(6512007)(4744005)(66556008)(66946007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h+88MUBwBmP6fe5Xls6qxl5uuU183ER9+p9AurHjOh4YV22+nUS3QjbVk2WF?=
 =?us-ascii?Q?EKj4LGjsONQaPCxFGIzSIelOMVDHz+JAPiYD5/8rdqAt1SGFI3RZsznQZTQZ?=
 =?us-ascii?Q?MVVf+nOpqK5XtnLJu+rkTFzK4+CggMhR7J9NHC2nMhs/HIHiN2HQPxgTevin?=
 =?us-ascii?Q?VuWeZSDTjV3WhLxfxFQeCjeaAKpi7I5J6uY2/phqWHBFfWXTLE3OBQWNN935?=
 =?us-ascii?Q?HvI4ZhLi/HEA3UyvpXJi5EV2dnV3m/b3vyUQkW0HxQvnu3BvsAzrVwlEevIS?=
 =?us-ascii?Q?AXIicLm5FxMq0rhFhc+SIRkdHGWmnVFvRtOBrUcDub20uZE9j9fmKv+m5G1l?=
 =?us-ascii?Q?uHGJSMefXkSP+QzCtvHI+W9prvSQlmmX0NgeiglU0UwI5fW0Rnpbuy68ahvg?=
 =?us-ascii?Q?EgGWmXi6LGVAG5DpE9JQyvZKNdocTJd+yIAhIPCpQXe9qk6ZyXCu01obbA5g?=
 =?us-ascii?Q?YbZHcMASJMIHO3QgBPKiSDTzet7SvEC0vANHp/wCn0AqcwPukIDOvIw7YAXn?=
 =?us-ascii?Q?Ed7vH8M+IwnxGlrbGirvuyDRcYOMEsmrNsLaSOG2subV7Ld4BguLVrE7hZfa?=
 =?us-ascii?Q?2f9bJrb4laa3v13pZWlPku2BHef7nSyXUM2CKY4lpMxfuRejC9sWHm7Teixg?=
 =?us-ascii?Q?tmhTzgVFw4EoWZkz7bos+iGT9G7mMasO2ppOmT4Ljy8buKnT4aIZF6ezo8GQ?=
 =?us-ascii?Q?uXj6k8pBtg6QcwawuLXFLtxezGRlUVaHBlASZM0SRPeWLA7pm/UFPhLYxqOr?=
 =?us-ascii?Q?7lUxr2TN/li72TGCQdn7SxAr9KrsPDZVVe03zbw05xjdPYZWEyMSeqb9heSG?=
 =?us-ascii?Q?9pdU2HZovMt7q9eWok+gllD3VToLRLflwzR4PNhPQrQeMkysoSQyXN+YL1Z3?=
 =?us-ascii?Q?BBpE8eLIFiPIEGyy30cDxI4iwSbj1y30LbysX+00ccg2lFlU7hm9S+6JDQnp?=
 =?us-ascii?Q?5vFDXOCIlfr3clOtdK23d5GZZj4E+Ya2BFRWUSJo2W+KSkc43rxE2+pbAGLQ?=
 =?us-ascii?Q?4xiDYPMCS7ZqYstd2sq7UaIsGwgPEcgTtZbwoBenot08kBL0HmAV8IWTVQXv?=
 =?us-ascii?Q?ifOgyXqHZ6Mfm/g+0pzaefzM2kDeh/10qNfx1NweTdMxr7A0qyc/02jILWLT?=
 =?us-ascii?Q?m6mj8ZiAtLZLxzA8HG5Th+TKZyS90IzF6WYqQRf1B/tia0Dw+/xxcE/REWzc?=
 =?us-ascii?Q?X0yPmD+Iy8NJF37OpG4x3vOSPudXt21b5KCyTF04nUk9JLziZMEy05bn3U3L?=
 =?us-ascii?Q?C4G9cg7TN08cTMiqWqg8kkAZMnGVe0HrCwBErk8GmxG9eMV8rKmD4xejQlan?=
 =?us-ascii?Q?uXKUNWGcazL/GS115sNEmx1y7ZaLbNFJLOGUt6WSZX+t/E9fceJS5P7t2aAm?=
 =?us-ascii?Q?i8Ol8QNXwp4KIfQqpHG+hcFO6Pl9m5vhacE9vgGICqENDKZ3yUO+7zpKCBxs?=
 =?us-ascii?Q?jgH9ULohVCGJmFDrac0Sdgrbf3IveGjQrj/su55dxr1uJlxwmNHgi2A/B9Y5?=
 =?us-ascii?Q?5JSzV9l0MZjlG7h36alN1u62TB4UodnBfr1JJivI5SuZtITjRugQbTTA2nmG?=
 =?us-ascii?Q?6NeFxHvjLRpdvSomBRlTo42JEpaPn0JM3sebajteGhcwdHXVCfXuVUPoDT5H?=
 =?us-ascii?Q?CnDr8k2hu1gCUAltHORUpzA=3D?=
X-OriginatorOrg: yahoo-corp.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 207928f7-0d51-471a-aad3-08d9e2394bd1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8357.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 08:36:36.3774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a208d369-cd4e-4f87-b119-98eaf31df2c3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wf+AVxSOT7L7XYinR9SYeNGyp+nz0UgPa42M1D/QKBD21LJgCzZq6vNVaI77JCLGXjhnT35JR6JgKH2g8JpLlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3067
Received-SPF: pass client-ip=183.79.94.94; envelope-from=hnarukaw@yahoo-corp.jp;
 helo=corp-ob07.yahoo-corp.jp
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

Resending patch with decreasing coroutine pool size on device remove

We encountered random disk IO performance drop since qemu-5.0.0, and this patch fixes it.

Commit message in c740ad92 implied to adjust coroutine pool size adaptively, so I tried to implement this.

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


