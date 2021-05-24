Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD02638DF6F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 04:55:54 +0200 (CEST)
Received: from localhost ([::1]:38016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0kz-00009U-LB
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 22:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0ib-0005wB-Bl
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:53:25 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:29237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0iZ-00038N-Eh
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:53:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1621824800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/QwLLB0Kaia/J/WEMKs9C6Wy5Xa42UKhstHQDFA3rtg=;
 b=mhIzhjJsk+7DItVtH3uL2XD94ba+Lt5CtV+pQkJAcKaZo6z0hoTTGLmeFgBM3HXEzvaekt
 dBVKE9XfDxwpM/ZJG6FwNvx5UPAzkMkE3SapaI9+8BkzllFL2ZClSTQJoF2jOhby3HQM7n
 R4TAc2SG/qcox8OD+VjE/GtyK1Msqbc=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-8-285q12pzM5mDz3c9sANwgg-1; Mon, 24 May 2021 04:53:18 +0200
X-MC-Unique: 285q12pzM5mDz3c9sANwgg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6RxgWhs0VK+oQ7I8YDJs9kXlgbE2w3OBJKV7UFjbiXBddcxRuXb3T6YpqARyS9lLVZHG3P/rFpzto1+abZgGNl6FQcj6J/9O13ZwyxKQFI7tzbD702AfiAqbSv27ivVZsg8ULD/SOoSFMRlKpre5fp030pPy+1HU+xzKzpgSLVDeqkR1S74KYsBZUe/W/vu6m/iej0CYP9Pz7VA+iuDdSIRzndrrGtPC8QAkfpV/20KmjV9iP0f/tCFaR2qfSx8UDq1z5EnksHycJa4tfZ9/6FY2s7P9psgId9N8R/nawkpoHGLwDIVcuP1CJUQvuQsz3gRANSRYuCdKJETSp71kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hL2jRf10zhBriL7cWAHxs8XLHju9Dym76wLzcOAoOxc=;
 b=GDlRbFoVFEcsyzKWRToQCjOV+MTp86o3LTz7Xi62RqQ2l0uCHTT29P8ewYBZE2cjx/bddt/1Liolkw8PLJYtoCnP+88eY7dsP9MLrgC+aHddbA6FliKJjU7zkFYO7sBISQGCkKueq+JVHEOdb6HgFrBisA0TznRJ6fEvDcKOHt6rQD/d1QxztR+wSBssN15f+H8W8GhRCFkxgiawazPoDAEf5BqwbqIzlI4c9yjzn+M8LzEjDsgv5dEtg8xjApRW/bKmxFgp9I435E5gSU4Hxc4vPNWFnim+3J2EDVxgRPy0YN7y9yO59p3DS9EHrNj9nfLgsrWWfjJYoExVfgIHsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB4126.eurprd04.prod.outlook.com
 (2603:10a6:803:47::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 02:53:15 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 02:53:15 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cohuck@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 cfontana@suse.de, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, pbonzini@redhat.com, acho@suse.com
Subject: [RFC v4 01/14] target/s390x: meson: add target_user_arch
Date: Mon, 24 May 2021 10:52:43 +0800
Message-ID: <20210524025256.22252-1-acho@suse.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [114.24.18.39]
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (114.24.18.39) by
 HK2PR04CA0057.apcprd04.prod.outlook.com (2603:1096:202:14::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 02:53:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6938243-2760-4fe8-826e-08d91e5f13d5
X-MS-TrafficTypeDiagnostic: VI1PR04MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4126C2A54B28DE800D1C6483A0269@VI1PR04MB4126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mtEmCrvBrlYBjtboFqaYE6U2949dqWgilCvBJ+xkL0/AwSGxMbytDyULk8JCLV1eyCium8cEgMCkT/BLdZ4yLiLEfHLMVCrOtSmsTyzn7DpEviNQMZSUPW+dXG32gBlxUFQkZRPisEqKyk9NSTtMWXdga1qUp1O59q7npFqJSlc/9BstElHtyXsDTiudtNdp/6Wl1Bi6t0BoKXd6TlmePXXPuk5aqtq1yDP/nbLtVL6oA25LvQ77KlNZLfifRYTPlQnd7mRBaspZLWiY+IULJnNsnFKj1yRiA4cBheHIR7EcvR1TXu76K4VdbcW2q1qzmrqfzlfvEii3jHYYRbE8doU7gr5ZcbTX3zlzTdVEpogM8NUI0nO5M+rOD8UkFTMApDEXR0urj+vzXuC88ikx7VT11RRJgr2Putclmsp+8eq76SUIFw0dqKZeztigwmvjkPvxe1XyHX69oNg3kp5Co5AzJh7pzF5zsxtdcAArGot2SzF7PwG479P3UPebeqevHgi7AKSxyTcy0qYRNjxJdXGIdK6GqKNpLZY1yCsA2NQojGC6sja5mEq0U+zYBAbCk2tJp1LeRI0btYeR94ZGRoDCTRXba52ZU+Fgosusfn01QSShmzthXgsiFXXSx1GYrV7GXvIsqNhL0/CXHPbd/J0w8CDpWFHkR0ck9fj0i2w6aDXje5pWrNTpPenPLIlO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39860400002)(136003)(366004)(346002)(16526019)(4744005)(6506007)(1076003)(2906002)(956004)(26005)(6512007)(7416002)(6666004)(4326008)(107886003)(66556008)(5660300002)(6486002)(2616005)(83380400001)(186003)(38100700002)(316002)(36756003)(66476007)(478600001)(52116002)(8936002)(66946007)(8676002)(38350700002)(86362001)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nLass7CREryGdCSLulqqeqMYLOmi1k2pbZVQYu5TGrGlcle2C0OXu8vq0Imb?=
 =?us-ascii?Q?cA/G078AyyQ+5AW5BD1sM4OBvyDZoM9Y1VwfroWGVpCHXDEhcDj8Rxe9N92+?=
 =?us-ascii?Q?KGYVI+fvWaWtLY2zkvgZFmjpmF392ItBFJLfqOyeVuWZ82x5/WEhRRD6HsZE?=
 =?us-ascii?Q?b61Ko87pBdZ/VGWhP5ABvIFZR6Kt/hLgeBqb07+TxmvfIyNe0XhWwwJKIW3a?=
 =?us-ascii?Q?7GxEWqdFtKN9Ccizqf1gfb2FV3byRwnsO1maS4m75VYoQukLQPAvnprqeuCv?=
 =?us-ascii?Q?IzGvI3GBu4FudTXW8slP07RktdB4/25JNT2+1NWWw47mLLtH5cPc9wbvHMq5?=
 =?us-ascii?Q?a/TvFvYepjgnk3jqVL3P/2Yv9JuJOgxn7C8fm4PhouLLudUb2mPEvis5+vr9?=
 =?us-ascii?Q?Bz1osHKNmH0AEv8PM58MkC1//hKOF3C+G8roMTyxHnd7nGZu6Q3CmNuml+AK?=
 =?us-ascii?Q?zbQYLwE8dqbd1/OnQurel+LyTjNaUIWcwz8rKq4h9CPaCS25ML7hM85+XBTU?=
 =?us-ascii?Q?Kjmfqo3aemvtxXcNcMRisQpvy8oGVS7MdWDiu+pD/Ct3ewEkQ9YOle02tDgN?=
 =?us-ascii?Q?BXbt8M5gts6RsYM5y0hmthq9h2nqOlLYI41CsreKbZBSssoRHXE0ZY0ifROH?=
 =?us-ascii?Q?QG4rUJX1qSb6BJzvY7Ccq5JdZxPKAKvwv4ix7SgsQi9dbddWCrsZ9bq4U+X5?=
 =?us-ascii?Q?f3sQEbpUtzw0l0Oii4pAWVbVZMScaMSfiwxoDnFhuWLnl8MGSdAregReZOdF?=
 =?us-ascii?Q?5kOgEdboE8+OL1BdOdP40AKp5U+u3te5qbrobyugbYUpis7yAB/29kcVWY+Q?=
 =?us-ascii?Q?RUddEYWWv6YYQ8ugwtv5yhNlAlH7nmJKmItnVUMKnIyyZQRRAS/Slc7Zn3BL?=
 =?us-ascii?Q?q73nRssyWrasY34KViUwWWsV+b1jJpcn+b1D1Va+w8qW96WgIU8LV6sDnVph?=
 =?us-ascii?Q?VLyA9tEflH7/ekfUVRNg4GutsJr8SdorFYam9E0Lt0mOqtuht0LO96La7TAH?=
 =?us-ascii?Q?QOzEkoVIKk6M2h2t0tA0G0Cwsr+w5uzA/+aQqf8iczFfG+/ljwu2/6EPPbEl?=
 =?us-ascii?Q?KVTMO1kGClcSwoZSxmMLyX3BkruSRiRZiob4/98lonxuXm00xvtDuVpPtRoC?=
 =?us-ascii?Q?RDqLiMq92Ql8xft7LvHIlfgkgB5XaM+mESw3/Zp//FblBZ0pLfjsH8u85OSh?=
 =?us-ascii?Q?QlqU0IY2HtDp9rWQVMgQqgkAd9pOnVNVVHzexffmPO1q3fDLarfYWntuoRCn?=
 =?us-ascii?Q?ShecC1d1Uuw6qjz9sSmLN1jMj5eSDbFTRDWtjEU08imoCR5YOo6BpxNxaUbO?=
 =?us-ascii?Q?/rtH61qB/XVVkoRK0b0GzoBw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6938243-2760-4fe8-826e-08d91e5f13d5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 02:53:15.6629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bWK33hBGPxlRth4tAXtPxGVBj+aM1U5RFLxE4pcM4HcODsmdYvpqkc1yLgRJ+7/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4126
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

the lack of target_user_arch makes it hard to fully leverage the
build system in order to separate user code from sysemu code.

Provide it, so that we can avoid the proliferation of #ifdef
in target code.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 target/s390x/meson.build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index c42eadb7d2..1219f64112 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -58,5 +58,8 @@ if host_machine.cpu_family() =3D=3D 's390x' and cc.has_li=
nk_argument('-Wl,--s390-pgs
                        if_true: declare_dependency(link_args: ['-Wl,--s390=
-pgste']))
 endif
=20
+s390x_user_ss =3D ss.source_set()
+
 target_arch +=3D {'s390x': s390x_ss}
 target_softmmu_arch +=3D {'s390x': s390x_softmmu_ss}
+target_user_arch +=3D {'s390x': s390x_user_ss}
--=20
2.31.1


