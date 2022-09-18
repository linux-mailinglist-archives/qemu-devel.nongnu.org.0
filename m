Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ECD5BBEFD
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 18:42:40 +0200 (CEST)
Received: from localhost ([::1]:35630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZxNO-00086N-MT
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 12:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oZxLZ-00061h-Nt
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 12:40:45 -0400
Received: from mail-bn8nam04olkn2080e.outbound.protection.outlook.com
 ([2a01:111:f400:7e8d::80e]:58621
 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oZxLX-0005fA-KC
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 12:40:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ek6Ms3xdXhq620Qt59llOq8i9ZZzOzcpT26Ckq1d8EtOJRXSn2PA+uUKQZbVa7R1m3Dm7pvZ93WrjYINPiinUl7HzctpKku2lC3sfiBBFGimwKvN9Ch+ymzhsjsHs10hCTf+ES0Uymb6oEp9+/N75hh3vAjlXQVY7Kuplq2PXf93Po1/lkP7XHTWt7JKZ8e+tflts9cGTMg/osHBmj/0PjrmRFV2rX/NnxAMJamQZEMdZC+NZIwzDjaw22V9HaE7aRQwQP+wpneuAjG6/uSFZz0dgFbLhslCiPE63ObKV2O8h/jkLiPTEl/RtpomZtbOGq9sRxZqAHJVzq/4243cSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2XMgPydva+fM9/ToHB/DyZQXu2qQXydz/oFnEjAQEU=;
 b=k8mvfNQaCcvt1bAM8PILeXIZp1sWutzWrcwydqGrPRkNN9HT2T18DCpRnDVlJAfg5ljKMC5ELvuoAHtVeJho/ZN9XIXJlzn0mGyl8ClCKKH9JO+0jtD0PEWoC9qSDm9DjrM9V/zxd459xA/eUPHxPUdF5iT2tbtjvqAvbq0v3g0c7CC6iYvnfMvxQDWWhkmGr4xy79YX1rXdS/m6I7Ugl7sVEvOv/+DWo4mnU/qUVLcQiwYa8g0ABJSNGstfUXCrdlpCIBKMqFdvFeNPJ6loMqjjAbTHRrGV+h45KGzjS1mTIAkGF7kCJo2PzaqYIYZspllsvKiFqNOsUasEhgcw+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2XMgPydva+fM9/ToHB/DyZQXu2qQXydz/oFnEjAQEU=;
 b=k4QDSg7e/uNOtsvACjYkt7dad7obr4GeO+iYBR07mdifOje3/fnJRQCJuqgu4WJFKq1Ee48wPaGOvK1VdIhDtNv1GU/q0HyagI46w+8KRXBRSn9Zv8D0zcS/NWEjZmdOiyeJQFMVQCT0iYAO7kA+OWGIGq9/LBhc19YtjV8wJlD12kwXn3MVR9e4EpcBZiSdPwohz6oLQMvg4LeQnOveC04yKClsBWwXYw4cLx8iLeqF5m3/F1dPceUKLg2S+28gRLcktYXLmM4/GGCQ/eqVhy+bzwoxvot/syXOutas0iQqFyMRp0G7UaI177BA6y+AlQh7hcGSmGXLUtmIIo06sA==
Received: from DM5PR06MB2537.namprd06.prod.outlook.com (2603:10b6:3:53::19) by
 PH0PR06MB7560.namprd06.prod.outlook.com (2603:10b6:510:50::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.19; Sun, 18 Sep 2022 16:35:38 +0000
Received: from DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480]) by DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480%9]) with mapi id 15.20.5632.019; Sun, 18 Sep 2022
 16:35:38 +0000
From: Heecheol Yang <heecheol.yang@outlook.com>
To: qemu-devel@nongnu.org
Cc: heecheol.yang@outlook.com,
	f4bug@amsat.org,
	mrolnik@gmail.com
Subject: [PATCH 8/8] Ping : hw/gpio Fix license statements in avr_gpio
Date: Mon, 19 Sep 2022 01:33:56 +0900
Message-ID: <DM5PR06MB2537DC079DB6C39C2D98F295E64A9@DM5PR06MB2537.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DM5PR06MB2537AFD672CB000C5F6D93F7E6449@DM5PR06MB2537.namprd06.prod.outlook.com>
References: <DM5PR06MB2537AFD672CB000C5F6D93F7E6449@DM5PR06MB2537.namprd06.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [9NFsPfG4Y6u9LkqJNrNTPA2AI1m10UaS]
X-ClientProxiedBy: SL2PR04CA0023.apcprd04.prod.outlook.com
 (2603:1096:100:2d::35) To DM5PR06MB2537.namprd06.prod.outlook.com
 (2603:10b6:3:53::19)
X-Microsoft-Original-Message-ID: <20220918163355.3121-8-heecheol.yang@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR06MB2537:EE_|PH0PR06MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: bece71b1-ff85-4c76-aac6-08da9993d18d
X-MS-Exchange-SLBlob-MailProps: Z68gl6A5j2/5Qf+rSlYZL8QnYEPbf67O4g6uORb9vMUNhFRnSG6A8N2LEJcAl4bdzekIhQ4Ib/FHC8SJwktSejxAIN2xcmMdqbWYOzlF5GO16BcnSdGcCz3At5I/D5qdXsjnmC79ahA4wff6Tf/RjJtjYNAhHg6gkSKXqMVmyznJtjia1t5w336zkG7uBzpAZ1FBwI77S+QDoohZ7ge8U2HVNZDEBkLDBIN2kU7o8/MO1lYgK/uvn9pAlntp+RSvO7g9EoaF42xzeDSlHGYfB7UJOhd3Zx9sABhgn/iedOf15AXjTBrfqsia+2IWsVejCOaitY2wbpXMYSkPHGIpGyJ24i1fIiIzHMnNgPQH2KbRBikLqm6qLGeat0qY4QQQ0yGHe881/qIZnWg7K6eksA3yRpFUdXyMujPBi1HHJQxdcpls7cRfjRx6dfh27aGpbK8KQJSolaE55u0DgwdNIbg3tg7VTGRNbC0Nzt7rIyHqSIqTyzSGBjwwGjp8EcFVX6rvTCqE2xDy4STDDUrnbOh/f5oKci4Q3Jz5BhcuPafQENbBb0Z25ShbpVw8HlxOp0FqtxWWaXVYuiQF40qC2WbQPJUm6RDMZs1XBjY3/F2ycSy8cC99REkI+BwuU/nQpQiJlNzjFQ4LSrFgZCG57HxXJMc48KtBkxf0HE5OaUz4j7xEicouf48sledT2ZGiDrD2nfZBYiIbTB4XDF2h8ylyb1Fa3Z+MCfPo5OTIiY/M7gDgt7p8/nYd/HWeGZhe4RXCtJwHGLv1KDF8bopEr5PTaBkKFzVFV3m4RQCqY8Lr22Jh1BktJCTUCLZbfi4F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DnZaIamfxmZTQZkyOZPRlF1Isr3dUTyRYVkD6XjJYmzQrIpYbmWK2U03Lmfn7xqvpTgZqP3HG+0CD37pfi22x6lxflV9e0EpgaalWnMVcAQSVWFvh0wyfRJWnrtS7DuDTPR6//FJL9s5Uoq3zRXnwBpqPJlayCZMXtifBz49xdNpmg7EkLucu0ES4pVVvvCjl/ltBsrazqkm/VFLAaR0kNEPnOPP/wgPqpAkgDB9wph40StDZRjHJFHFD+wXHDvO3qVd260jrALvYsPTuRinHyJZo0qQR0Jkrpj47PdcYyr3MgDHjA8diUToAG4nimw1k36HN+WgOYRvwkgpl7gYf1RQXkFdypL688MfHSCsxchKAazAJMf1HSSCZ3bhZAEyG25Zwq6J1rR/Lvs0WEuiNVvKsqW1ARDxEzO3HldnYru9DSuaTZYgzlUppTFtiXcuAXxu5Yqvd4G5WTetN65A9bd2JnMXVVHGuOBjUD6MzRLP9MI9SVjnRi0xqyNX8dfNxwC4RX5yUZaZbv1TZyCH7U7r8Z/26nAqzIhdPYx42s/yIB9+AWHGYy+H63ft1kiXC+CqS/iU8iE13CltP9LXHs01ClU25HJuugo+yVGp/T8vNHXPBkegJqIcW/e5M+pS
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?caShozESyBWEHFHyH7HL6+I7NKYu1OGylvVXTRKegnyCjuAWbfuX4fZsFfk0?=
 =?us-ascii?Q?XPiH0cdyX/2Oafj+f63TC0PVWZo3CHf3J7MJngCWy/sgIqv09segyOU9imNa?=
 =?us-ascii?Q?wcezQsBRqDIMO94jACF6Sl3r1N0RvFT3V6KVB8P0+rrtPoz8EAL8kEiug56j?=
 =?us-ascii?Q?N7HUjH/6FMmcPFwO39LlhqBEUeotm+7yjtEax76HcFink+mkXtTUQq3J1fzi?=
 =?us-ascii?Q?pLTY+BHOe0u+9hF9YlV8YNDkxhCX+hodK06YVx2ImJI5uXpXupkluKluXP/J?=
 =?us-ascii?Q?f6dwcD+WCMaSnwkRJ5yOQLWg5ShwdtxoBOcD9bLAdxwYNfff/plJuVj0KVGn?=
 =?us-ascii?Q?u0T3dGh2JKoCwL0NhNUVFHUK1VnMjNVIhkB0M0MtTUxcNEQZGcn5DnTCBmhg?=
 =?us-ascii?Q?PaVzXxvuYv/llouuymZGUcF25srqUISw1BtodCFhePxCLTVp6bVVHrBLDeia?=
 =?us-ascii?Q?UFbOci3P74U0dNrmAdOi42RB3fkWBQxI3J4p9Hwf40hz+3Yh8RAWzDBIWwSK?=
 =?us-ascii?Q?hZPXEfaKkpFWRjhfW5Kawt3gp5LAz0KbNsP/db+PN52LcMLVZtl6KgLqgCd6?=
 =?us-ascii?Q?C5w+D+QcCdzLWLlN9kbrwcj6ZMrVWZU4c/DS1uZwj81gnknq+gJG8irUvNLu?=
 =?us-ascii?Q?CnNJyN91rM9w5cVW2OAzcjR3BA7FyI0wppzKcoDmty8lYEkSpliNPhvvRD5j?=
 =?us-ascii?Q?lhYFiFm56mcsRmq1EiYbtBTPyyBuluS9tVmcFAETX+2Ka7+eGCakMWbME3AM?=
 =?us-ascii?Q?jNf7NBFcj+17Da9zpyr9/667RpzszoKhnxdk4BZXmZCPoBvAYoW1Dk0jPe+k?=
 =?us-ascii?Q?enoeNtWMdSVJ4AHgqI5y5Ch7GFzccMvLGiDS8TvDl7/05D3BlmikkpI60pOB?=
 =?us-ascii?Q?rTaxKrbxxuVbPnvBHfc2shcfcxAcYO834BxzbNUquXYNH5SUMsAbcUKA+Jei?=
 =?us-ascii?Q?JmNTvo6jquVZwwqymhAns/HR7NIIzLdU0jNwOKL3eISIl/tKS85b0gwmo2jQ?=
 =?us-ascii?Q?IhstanJKsnJD7i59ivslsryX38Mfgss16Bi/own7wPom1PiXr54vD6Wi2N3r?=
 =?us-ascii?Q?R/dSyid8JqCQ1ku+5rJOjuDPLOAS90EKB/nr3iSxbfgswYE5vi1WGVQgpBOe?=
 =?us-ascii?Q?HKDjqsKdVvpQuXWCErUucZyB5Yz9nh0V3b4ZbiHFyMbJaf7UTjQGS21d0D42?=
 =?us-ascii?Q?bQj0YLZwH0e1DI6SbxRpvvUbN9NLU5Z2j6WHj68UnBGhFYN/YjLolJ/+Chya?=
 =?us-ascii?Q?y6Mf1a7CghgkjkYoy6Bo56v4/gHlKJCaqHfQ64OcwApRuD6J4n6/sbsVzR3c?=
 =?us-ascii?Q?zrg=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bece71b1-ff85-4c76-aac6-08da9993d18d
X-MS-Exchange-CrossTenant-AuthSource: DM5PR06MB2537.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2022 16:35:38.5529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR06MB7560
Received-SPF: pass client-ip=2a01:111:f400:7e8d::80e;
 envelope-from=heecheol.yang@outlook.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

I send this patch to continue our works discussed about two years ago.
Due to my personal issue, I couldn't noticed that there were some issues
in license statements in the code. 

I am very sorry for my late response and politely  request to check this patch.

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


