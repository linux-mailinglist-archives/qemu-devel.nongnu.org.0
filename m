Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 268C75B596B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 13:40:01 +0200 (CEST)
Received: from localhost ([::1]:37568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXhnD-0006Mh-Su
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 07:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oXhVj-0007vG-98
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:22:04 -0400
Received: from mail-bn8nam11olkn2010.outbound.protection.outlook.com
 ([40.92.20.10]:8224 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oXhVh-0000Xk-H5
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:21:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMtS3/MGqt+N10Rjj1yjwv7wylBKmGQ/ONTcz7DsAbNaFyRnIghLO5mUQ3aiQN5DMIogDm+AHyOhxz9JJqvUi4rCLOmcc3S6P4STadTUVTzFSMosAfqUCL/qGoxB2gj5oTmyewz2TZbAwye+SD5CKqmzhIMdwiMf9g3W60GiEB0uTpFgdij7AeY63c9tDKrwiBmX14QLPsZWkjJnOloLFGeS/vAsNsgzPOaAU2CGLeDl06rQI93G0ZIp0I19PMNACGLPrvoGrj62hYa2hie+vXdvwee5NwrathBV5tLp0SVlNox513GEmdAdzNSUuIzbyyTjP5MMuRNxwR240SvWCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k40OGBa37+Y2nW/ZSI2ewzn3oKBv6URw3/13XcWU/zQ=;
 b=nXwpAy5TZbagFp0fNwQJIt9X7zVoVS6CqR6sk4/RpfXcr1azwdJlJTYYpD+38uGfE0nP7hUUn6eOvAtAY4nb9H2bqRQ0pRzT0B7xcF2vxr5r/ctBVNzavjWvOHQXXqSJhGqNNdchcx1XZapVHJuzYrkXhBzuH5luVYIeaHRm3+hi7nU0s3NvqHu8ayIET5KKN5wSUVwSCLVJr4vqiRviuBIQfKwYLpnLcRELgL36hR9k5vISck60mvNmkwClAmtzA/KAm1PSuuzhoB8q0tfbB/yWBMYXDZLkhVSVMpkx6iWNF/SZMwAhNxVviqZ304jg2AtHNY0iDKENXVRukjovYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k40OGBa37+Y2nW/ZSI2ewzn3oKBv6URw3/13XcWU/zQ=;
 b=W4FZ5FTZenQB35MlBPpLxFZQM0V+OdC8EUXkrRxg6joMra66+P5R/fGJzKBJS1R1kGWdqy2HTHSxo3XAwy0ucdweCPfWfVBZNPaikNJXoT1gg6vLV/YSulGNfKluEy07B1Fl9AZg3JLuvfqnT21FNkgDaT8H/QPtZAptUFX/zqxVkGR+FhPmucOcM2vQYYmcTLuWjXN5DwujVXUYq0O/TpIanJIjIKBQDjPiqbCrFhQBqJP+D/6lP2/2GeE9oW2Cxo8x2xVZqivjqUoTQ8X9IYPR6k3+54c2Weph8BuoOAQXB5Xtvtbu+QoCIxzQW9sbNaRjVtMjWJP+yXlwVGGXSw==
Received: from DM5PR06MB2537.namprd06.prod.outlook.com (2603:10b6:3:53::19) by
 BN7PR06MB3876.namprd06.prod.outlook.com (2603:10b6:406:8d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.19; Mon, 12 Sep 2022 11:21:46 +0000
Received: from DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480]) by DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480%9]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 11:21:46 +0000
From: Heecheol Yang <heecheol.yang@outlook.com>
To: qemu-devel@nongnu.org
Cc: Heecheol Yang <heecheol.yang@outlook.com>
Subject: [PATCH 8/8] Fix license statements
Date: Mon, 12 Sep 2022 20:21:06 +0900
Message-ID: <DM5PR06MB2537AFD672CB000C5F6D93F7E6449@DM5PR06MB2537.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912112106.49110-1-heecheol.yang@outlook.com>
References: <20220912112106.49110-1-heecheol.yang@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [C3HYRrGHvXvt6Ds6IhNueLeMUSoPkz+3]
X-ClientProxiedBy: SL2PR04CA0022.apcprd04.prod.outlook.com
 (2603:1096:100:2d::34) To DM5PR06MB2537.namprd06.prod.outlook.com
 (2603:10b6:3:53::19)
X-Microsoft-Original-Message-ID: <20220912112106.49110-8-heecheol.yang@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR06MB2537:EE_|BN7PR06MB3876:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e5587b-0423-45aa-3bec-08da94b0f98d
X-MS-Exchange-SLBlob-MailProps: mWtqiNqNgRsqr4C6bJlCoCFGY9CXqkj3ATHINpc9YPMbQMiw4Gc6MdvWAxkamsiTnS2+PlvC4lZh/6x+vtGoKBHoPIe2kYgplP7YaWLdANWMCznm/irWNOGFC35b3UHbeZAwBBJMmyy6HlXB7vM7IfmDpn827bNfhfMvMrYa3rdsOKnpQYWdXNxi+ukY+ockxO85Ee4FIOMN49vs8s0P17MkhRvWYFGm0iGlx1KovhZoGW6ycudYbS29Rf1vkEHsb82dFNMS9fAQagku4IzhRdER9nB7RxK+IJN0I9V2eqqgqrEYv3tUWjjjdyJuqe+mhgfdGJ4w85HILnm0MkXLZ+SDgWaFB55Y0/fukMzO2sq7cf/vx2lEhYi37+cGCm2Gwygmjt82tARfbuJXTmg3TmF4RyeUeR44ufv0XUeTsOlpSbKnYpu0Cg2Q9pk4y6w2l+mQ0DrGrMBdbtaC6fIIx716u1GHElkBN/eKRkY1MZ++DaI1CY04hL+cqPry7PYCUvMhNa+7cg6Msx7beLCrOp8uhCwTkOTJIIXazm9bOcZOYHyrkHs2C06ABWMPmVHyYgIkkyFp9L7ooZPcR+y63yvg8FA3vb5hJnYFG9zDZG4zLH7Tp8LVwwHUZMizbv5npvA5ve0HPYcoVLZ0laRLAu+d90AJ5lwt6Mmorw2DCxRgZMqENM8lXFoZB2w4kIfU6LaDesSQUjbAN1Jm2cuyk7YMkrgcqZuSApo4gCu3xf0djVsGtgkFzRV/C3NQ7+AcOSDQw/7VuvzJtiKOTF2nb2B5U6joCemn4NFL2fvrw8c=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +O5/VvUtHFWtskqY8nCwvdPuRQqFopwK4Ngc+BgouCwf6a9O/eCy1hM4gJyViXFSqd2LUZx38LQ0uoMaxgozjPEl3S2B/e1aEPuWr5dMUHWqiE6L+b7/I0bVgxvfYmZbQmBIfuW4RnlcPDlhGP2YQt6+Is7wUad6Z7A2orqROkUZdPV/sgzwMEttaA1jbRt2Wx9X4/AGxShOzfqP4iiLRcQ+qbzmr9P+fef9ZQPUC98fgNU2dC5ryQ7Vf0sm0OJ1eIws+j3nbJc27sO/TsI/n7U2pU7AVADX2wrHuaeSfCchrTxEzEUIZuzpOgcfDXUpb5X182Ion4ljDA89UkzsK3OAiPmQNH/bjKLdAkztHqAk5n6du96EDZnbPi8bV1iurJftXpY0alT0rbtz+e+2HqH02AExNzJ4LCxRXi3GYX0PXDF0Q3SggI+9MMAYxrS39/ON3eqq4Is3eRwD9ka4uHne/rGEElamaOPb2s0IXYEvUTRFoUZMuaioYc9mQOlY5ybJ3tH+BxsNkdT0XYJDvrXDhL1vEsde1qs8lBNXupJHjGEgDycL+IYXkLX2ciN6rsIffkd3MxinzgYGI+SjNmRMRBHOm+4rzKAizdEtpkY8Q97YO7zCs0EO4J/Oihq3
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hp+akrTcHPTnqAAz55a9MGTbRw0lbh4CKC4tLcbpb5BFiUUNzPC0/KBqUr7E?=
 =?us-ascii?Q?tC+1SNQcbOOP16KMa6HC74ZSlQACBtdlDZTduqPwDuxhyfIVoP5bpljwPn5w?=
 =?us-ascii?Q?WzvAS1LAr4Et5En4EhblDeez3fJ9FioYyVxTmFMOl+l8G0Kw5fU8IbVupyes?=
 =?us-ascii?Q?yycfsuBFDvKNLx0maRwIgbBU8KhbVfZ+ovXkJfTWszekt+6RECcF7uneeyTM?=
 =?us-ascii?Q?TFg00PwT6cPyyjIH0iQQfZvMiJUSNGMWo1dp2AYQtSx7P9NdRk15xnSVI6c/?=
 =?us-ascii?Q?PUdtfFL8edpKu4Q/ZzNcvT0ZZuml8RwK9QsZbXbsIsbqPIwfGgHyFDk/BzFy?=
 =?us-ascii?Q?36rCkjsb/88tpoLQONKUJ/ojpn0RkjTCdyoc1vOHur6I96OxrsFvY1sGJ53N?=
 =?us-ascii?Q?C1gKMMvqCB4JcUmTBIo1+GCWCJ6jBDEgJ1AO8joRS/fWgWrQTwp7lxRkqXcB?=
 =?us-ascii?Q?TzxBWOlHMkxC3+vgtk8us8fkPZqxG8JyNRuGroMvvpQDQURpj5m0woRjSXxt?=
 =?us-ascii?Q?c1O4WyP9Ew5yn8WO8myDNr8TjQ5oTdpNY+7mzz/bu5cgPDpCIOQxt5W2K4dj?=
 =?us-ascii?Q?7KgjJL1eqLfwHat8faVbF5FMO5NLMn/kXW5++rbSX5Y/FTlQQ2kPdx3GXkqY?=
 =?us-ascii?Q?8nUuG8d7hEstzW3vo0c1S27IgABW6Rnbku8Na5uzd3R3+Ztgm2RlmGsMWQCn?=
 =?us-ascii?Q?g0r8B5k4cAk7aoY7UV3TLLNjphFwUErBwlEnR6RN0h3dJZ2mJNpF4TkwQATm?=
 =?us-ascii?Q?Vl51wsBWdoXEZZE8TOvcAezQKXinurjJsQHJ99iGgQDjcUOxBECI7u36y+Nj?=
 =?us-ascii?Q?l71WLUg63cAYM5xi+bU8WCy+RWhaba3fB8DlZwrxU76TWP0vaWZwKUTwkRv0?=
 =?us-ascii?Q?SJd7N4oNlXh07PEZtaUom45yVPo0U+AU39i7pXifg+VB4yeXaYGnXm3JJcC2?=
 =?us-ascii?Q?qc4j29JDn1Ee1BNugSBi0+gECaAwFr4WYmuKc+bDHgchO2LHIJsVRWBetW3a?=
 =?us-ascii?Q?l1BBC7v/jdpxJlIwk/S+piGPQH3tU6keyHcbFiHZaVTcgNlM6iL3rwW5VSER?=
 =?us-ascii?Q?jjDdGKB+cPQQjEYXLejarwhMXQtZaFIgXlW6ozmoCnjJAMlzKadHPecdFC//?=
 =?us-ascii?Q?JLeIbjs8G6egMZlVu3jM/gs6zNIqMUhB/dQKM/3z74OMlaXWmkMOrKAz1SX4?=
 =?us-ascii?Q?wTQ/Q+AAgz35wn9NpRePAZcrys7fLEwSTYUTcAKy1A2X6CpJ0c3+sLiZ7Yw3?=
 =?us-ascii?Q?Jp6/9Mdn02onQPcxvfRxtLnEyncMFBSpIKoz/MsMyykp7jPacYXQ/su4vdUO?=
 =?us-ascii?Q?5L8=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e5587b-0423-45aa-3bec-08da94b0f98d
X-MS-Exchange-CrossTenant-AuthSource: DM5PR06MB2537.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 11:21:45.4064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR06MB3876
Received-SPF: pass client-ip=40.92.20.10;
 envelope-from=heecheol.yang@outlook.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Signed-off-by: Heecheol Yang <heecheol.yang@outlook.com>
---
 hw/gpio/avr_gpio.c         | 16 ++++------------
 include/hw/gpio/avr_gpio.h | 15 +++------------
 2 files changed, 7 insertions(+), 24 deletions(-)

diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c
index 29252d6ccf..7613ca6493 100644
--- a/hw/gpio/avr_gpio.c
+++ b/hw/gpio/avr_gpio.c
@@ -4,19 +4,11 @@
  * Copyright (C) 2020 Heecheol Yang <heecheol.yang@outlook.com>
  * Copyright (C) 2021 Niteesh Babu G S <niteesh.gs@gmail.com>
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 or
- * (at your option) version 3 of the License.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, see <http://www.gnu.org/licenses/>.
+ * This work is licensed under the terms of the GNU GPLv2 or later.
+ * See the COPYING file in the top-level directory.
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
+ 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
diff --git a/include/hw/gpio/avr_gpio.h b/include/hw/gpio/avr_gpio.h
index e982f627ea..e4bfef0def 100644
--- a/include/hw/gpio/avr_gpio.h
+++ b/include/hw/gpio/avr_gpio.h
@@ -3,18 +3,9 @@
  *
  * Copyright (C) 2020 Heecheol Yang <heecheol.yang@outlook.com>
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 or
- * (at your option) version 3 of the License.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, see <http://www.gnu.org/licenses/>.
+ * This work is licensed under the terms of the GNU GPLv2 or later.
+ * See the COPYING file in the top-level directory.
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #ifndef AVR_GPIO_H
-- 
2.34.1


