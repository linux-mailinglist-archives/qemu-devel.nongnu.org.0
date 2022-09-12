Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B555B59B0
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 13:54:08 +0200 (CEST)
Received: from localhost ([::1]:54816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXi0t-0004AL-Tj
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 07:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oXhVh-0007v4-EK
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:21:56 -0400
Received: from mail-bn8nam11olkn2010.outbound.protection.outlook.com
 ([40.92.20.10]:8224 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oXhVg-0000Xk-1M
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:21:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dj+ZpXe8wYQ8pLGaQI6cHyxSwougaBMhVmNilEGWYHGblHoc8+ozTNEQkAgqUIBdNvbIV3QU4M1lxhoGXACPE2++Yg0pKQPb2GoJYvTs2dwAb+76UW60tGcM8FqaQmRrc3mW4WYMFvY5EpkzhezBcbiEqNO57UJkbIYnFL8vQmFiphiOPsQ/e5AEhaoBvTuZsBplOvWgezKdzFp020WhWpZdSSpiAGxXDoztYwfCbyE5Gadw972uFa3c5dZCB9cKOqWfuaRtx/vbF5AHEiuocbOjF7dGBuH1f2ewn3Dkh/+o+kCSduu89Cy9/nKVOSIOV75VupHgOABAV6UEIof3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rqzQnf+2GGCIBDxKy4lhkZGijPHzOxKp9HzxIMOvH4=;
 b=Mu09b/NBt0MI7bbHRUnJqDmrT6VHH6X1rk9rEBUk8fc5rDYS/UvY0JNZ1ESRRJ+k+dZumZ3NQQWFjaf4Qv5ofMdsechXJ0gbsoJNh+ZLPDMjswCKL0J/Rnw84BD7MEXYOWR3cl1jTPVmC9lkc/DMPbxP5eMrsLePlLcWclqaf6W1ojRFvp1lZNvVsgc4XiKn/RI86i1LTcT97LXSkaEYRYJiumeiAkosGhnvw0vyN05pFbOaapVTD7QtlqKQyywSfMzW+zH2qnF5pY3+uFT1kAdsy64XtnDdY3I5hxX9BsjgbO6pnnI6zY6Xbtg95PhjJ7iAsVcLQwN1XJyREj39ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rqzQnf+2GGCIBDxKy4lhkZGijPHzOxKp9HzxIMOvH4=;
 b=byiFVmILtSNY5fOFnw7xrnyQ64BpVTw8rtpj6AarhrR6/kMPj7ajNYH6HLyibpnztMwtginJJsqxlHmWyuWEFc8pw4LHn7nwbwNPLv3saLwLFvmwqsNqUvUk4GXFbRzCZ2o/AXhFGWJmKwapg3AuxhzQYKAr4c7wxE4yhkbR8Klobp84O5p0gMLKc0sDhL3aQdENVz+aVYvUOWl6MRUwPJuJwCYp6fAjQyQQ6kRHeBEPBXLYHh8msSULW24o04Fv4VuogUKc/Lyy/BOYcgSOk1M3R0lS8W+ay+1ZTphpD0ANkKhf0NAGoiDQ4/o3ZaTALaqqKftW0DJgisvqQ1Xemg==
Received: from DM5PR06MB2537.namprd06.prod.outlook.com (2603:10b6:3:53::19) by
 BN7PR06MB3876.namprd06.prod.outlook.com (2603:10b6:406:8d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.19; Mon, 12 Sep 2022 11:21:45 +0000
Received: from DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480]) by DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480%9]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 11:21:44 +0000
From: Heecheol Yang <heecheol.yang@outlook.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Heecheol Yang <heecheol.yang@outlook.com>
Subject: [PATCH 7/8] hw/avr/arduino: Replace magic number by gpio_port_index()
 call
Date: Mon, 12 Sep 2022 20:21:05 +0900
Message-ID: <DM5PR06MB25379825E94B8E6B44E8724CE6449@DM5PR06MB2537.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912112106.49110-1-heecheol.yang@outlook.com>
References: <20220912112106.49110-1-heecheol.yang@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [564+bIXjtp7vrxJroTPisCephRvRZzOC]
X-ClientProxiedBy: SL2PR04CA0022.apcprd04.prod.outlook.com
 (2603:1096:100:2d::34) To DM5PR06MB2537.namprd06.prod.outlook.com
 (2603:10b6:3:53::19)
X-Microsoft-Original-Message-ID: <20220912112106.49110-7-heecheol.yang@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR06MB2537:EE_|BN7PR06MB3876:EE_
X-MS-Office365-Filtering-Correlation-Id: b972d4e2-2203-4af7-bf1e-08da94b0f8c9
X-MS-Exchange-SLBlob-MailProps: AZnQBsB9Xmqxq1ifAc9vd1hrDdkf/Zi2xMcoTLlYXQUNsmelv0rAlQWyfjn/PlSqX7xHpYnbxctgIGlFuDQDrmOTEZkx7XPyDoDwiQnN8S2k4l8rSXUvBCcDbToXE7qNISc2AxTymYZOCv0ylyRlVvQpcR2IrTP0a8iQXMWyXFl16YOI6BqCpcRgaa9mdR6SbvcboNrO9JWvslufTUSbYAXY1/URp9hQaURxzErmaCj9ccQ0JoO0cy/lBMss5RXY3GKog14KwTLUqgWZezKurP2dyV4CybLdve4NaWGcCkBa6lsuaqdBVWIeBC/4y3X4k1qvdT1KeCyfZhUStcrBwEYj8T0985GToF3m0fRz148E3vwhTkTfF9qxsg5LjDCphhhUhrAgkEqx6zPoZIaNZ9zRRncsWJqrU4e/kVVNT6o2a8snv3VyT7PdQ72+nIXjp3ktkq2oj26PIJ6Lm5lvc7BUhtlpd82RPxrqWp70wbz/FzzremG4yz29EojQ8Fe/q1BTqio0ma1lYA07q9OpdTs2CYC1A3vLH99IVPiV6PW9W6XXgP7vnRizwxzcOhGGfrU70fOvJb//OU7GDulxdydA7hP/0Qj3sdUuMLufpFM+NbqSpW8al9WMfKLA5aenNImYEKdhQMEwqCM1a90EnYlLu9OV7l0uOXpFIh6sE7OwM6Db/zQonbOi1MPK/9D0wn7A2q4DQreKtsirwDT5XDfNAoRstnTwR9p231pGWvEk10kNzJjTrEfXdZa3oDV81vutcOmTklU=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ftEww+46K8Zku1TVB0yJJrguREeyVN0cN22NLgDQOYI2N0PKYfSk1zZjnv+8jC/Fe17odqjtyGHZmXeWM7srlR1OiGALHY0RWeC8WA/mZUMvwcPC+MvhvJ1S6qZgRhpyZO5KG/jtpXD9AYzsKLniYANcXM8EraTRs6IVFPSuh/LwzuDrdjnbQL3OyBNUc3GquY4F5fE988ZFRt5PkeSAtPxiLQtZL51BbZzt+p5prt9lnOGW+eqPB90FiHr9QBH7EEhpeYwqvcPDFVPs//TeW2c2IMkimtgQPiPHPyoDsm0NodZ+GGbAO8+wL/z/QOQTAz3iSQqE2d2/+kewP99ENuD2wbMIGX9hm7+WxioZnPfjsnTdm/fC0h8IkSz8W46lkkURV+U3Vr09IhBfVsOcfVk12ehJUZmmWDmQaZFQbR4exIqEToeNzG/OEa+dH/qAEzdRYrjwiUm5aYVVYrK4+VPk9rTVG3sFPuC/rx1Q0945+1R8go6BoU61vjwCjhQsxm8kaojCe6iXv9CtU/UfVBGqz/iU6AxlbCX213ZvRLisNLUeIkma4LJ8XcQxnqm/aAWZePLGYiurpzJYlQQVDbN1LLybkR8J3IpNVK39jmDgoQapEPsGg7ckf2M8DMZWFGjZWS9qEN+pQ7iqCSsf5Q==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEJXZC9rVGlqNGxDcWFMTEhPTmFvTStPOUxvSTRSVFByRHZxc2JSdjhKWmE5?=
 =?utf-8?B?ZXdPVDhrbmtSdFI5Y1VvZjRyQWRKbmlZeUdPOS9lSlJOd1dsN2ZjbVl4YUhR?=
 =?utf-8?B?TTB4YnVldHVoejUwSisySkZlVXFMU094bkhON0p1aUxpS2JTc1Y2OGVQUXZU?=
 =?utf-8?B?WmFQaEVnalhVUmV2dzdKQUFabUpFUDFUSlF2Q2lZVlNoelVtbHFRUm4rc0tD?=
 =?utf-8?B?cmdLSTVFanMxTWttcUppWE81eVBTNm9Oc0lCWFpZOWpiR0tPVm9TMWJJSDNv?=
 =?utf-8?B?TVRuTmg1ZnNEREZMU1ByU2RVZlVLRndJVTB1Ky9OSURQd3JNRU5PUmlwWjdl?=
 =?utf-8?B?a3JmSmNZdkowME5WNVBQUWtPSWErbFVDdHRwbEdJNHgyT0hGQnVTRjhTSjVB?=
 =?utf-8?B?WDlqblZOSEJZVG1ad0M0d3Nabkh6YURZOEV1QmFCV3Y1U2J4bnA2bmt0MnNs?=
 =?utf-8?B?cE5ibEZ2VDhKTkdXQ0tKazJQK3dsT3lqbXJVUi9nNE91Q1dXcFpRQXlCZjNy?=
 =?utf-8?B?VEh6emErSURmQWhLZDRabVZ5NmJCY2FEcUZyRjIwT0MyWDFHSTFkTnE4QnVN?=
 =?utf-8?B?S0RNTThuN3lubStHSVh4Yjl4K0gyaDAwVjU5MWpUL3dsOFRlOXFFU2J5RDdh?=
 =?utf-8?B?aGc5WDhSd0Jwa29nREEzQ1N6V1AvT0t5UU1JaXNpRXZkdzNjREI0STh6aXlQ?=
 =?utf-8?B?UW9tMHRSNUhCZno3NDZUN1ptdDFNTDliVTVkeWdwazg0SFNuMUpVOXZpSUlG?=
 =?utf-8?B?L29JL1dwOUNwWGN6MGp6TWZxT2hJY3VhR1h4RmM1Zm1Fb2c5NmQycmtReGgz?=
 =?utf-8?B?SDFOdWJWRldJS045Sm1mTXpaUW91Zkk1Z3h0L085SmU4UnFQZzVPSEtNVlBo?=
 =?utf-8?B?U1pTQXQxUlNJTjd4VVhTY0dJNWttbURoWkFuWXlEL29MOHdxcmlrdFhEMFA5?=
 =?utf-8?B?WndIdXNsLzZJWGNhY0N0L3BHOEh5Zm5ld2o2VE91MkxBeGlpKzhlTWpibWRn?=
 =?utf-8?B?ZllML1BRNUszQWxWQXMxbUpOUDBaV1Q1RklwdWI1R3IwR1JNdFl5QkdYS3lJ?=
 =?utf-8?B?b0tHZ3g4MzB5MDdwWjQybWdZc3VsbVEyeExUSXYxMGorVUFZczBpZ2ptZWw1?=
 =?utf-8?B?STc3S1ovYmJ1aXVsaFphZHp4THI2MjUydEhldlJmT1hZZWcvMFVmaVVJNzUr?=
 =?utf-8?B?OUtLazBVN0ZDVWw1QkxrN1lCNDRKL2lXVTMvRUV2a014ajlwL1VnRGtNeTJU?=
 =?utf-8?B?OWZTY0doV0NTd2FGQWkyWjVmU2VKWmdwV25RelZMc0d4WlphSUxhcHhPcGhS?=
 =?utf-8?B?bi81cVAxVmZmWE1kMi9lOFJEdDRYbDMxbHJ2VUtIWmRsUUF4UlZiSTRoK3E1?=
 =?utf-8?B?WUhCdENKTmJWYWxhOE9oNWRGUjhGeXlmNzJoT3RNaXIzbDc0cXFSSGhtNmNC?=
 =?utf-8?B?VnpnL1Y4NkYwWDhRSTgzRFp4MzNTT05jWTJacGwzWERHbk02cG96a21RZG9V?=
 =?utf-8?B?ZVg0L0t3R3oyQmRUdFBZcDUzbVpDVFdJbkw1NkVjWVlxR0ZMOTRBU2F6RTB1?=
 =?utf-8?B?a3pzQWpRMXlXeEJyOVBsdzRZNEhGMDdJcXlJUFBYeTBLSjIrVHk1RDVPVnhD?=
 =?utf-8?B?U0RoUHVYdlZoVjBBeFdiM3ZKL1pVMjVzd1E3NGZZOCsxZW5QUU0wV1dvTmdz?=
 =?utf-8?B?cllUUVR3MEtPeEptWUZvdGppclZhVTdvb1ptTHVGMk9qdWVOajIyd0pRdXVw?=
 =?utf-8?Q?JD1f1u35mzboakc3as=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b972d4e2-2203-4af7-bf1e-08da94b0f8c9
X-MS-Exchange-CrossTenant-AuthSource: DM5PR06MB2537.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 11:21:43.9534 (UTC)
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The '1' magic value means 'Port B'. Introduce and use the
gpio_port_index() helper to explicit the port name.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210313165445.2113938-10-f4bug@amsat.org>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Signed-off-by: Heecheol Yang <heecheol.yang@outlook.com>
---
 hw/avr/arduino.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
index 73563a35d0..87124d17f1 100644
--- a/hw/avr/arduino.c
+++ b/hw/avr/arduino.c
@@ -43,6 +43,12 @@ typedef struct ArduinoMachineClass ArduinoMachineClass;
 DECLARE_OBJ_CHECKERS(ArduinoMachineState, ArduinoMachineClass,
                      ARDUINO_MACHINE, TYPE_ARDUINO_MACHINE)
 
+static unsigned gpio_port_index(char c)
+{
+    assert(c >= 'A' && c < 'A' + GPIO_MAX);
+    return c - 'A';
+}
+
 static void arduino_machine_init(MachineState *machine)
 {
     ArduinoMachineClass *amc = ARDUINO_MACHINE_GET_CLASS(machine);
@@ -59,7 +65,7 @@ static void arduino_machine_init(MachineState *machine)
                                          LED_COLOR_YELLOW,
                                          "D13 LED");
 
-    qdev_connect_gpio_out(DEVICE(&ams->mcu.gpio[1]),
+    qdev_connect_gpio_out(DEVICE(&ams->mcu.gpio[gpio_port_index('B')]),
                           amc->d13_led_portb_bit,
                           qdev_get_gpio_in(DEVICE(ams->onboard_led), 0));
 
-- 
2.34.1


