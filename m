Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF1F5B595A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 13:31:26 +0200 (CEST)
Received: from localhost ([::1]:45248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXhev-0000C8-Ah
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 07:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oXhVW-0007gm-0x
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:21:42 -0400
Received: from mail-bn8nam11olkn2010.outbound.protection.outlook.com
 ([40.92.20.10]:8224 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oXhVT-0000Xk-VL
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:21:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZot8PvGynTTeQhoZmZZeWxZmAe+o1/+SvSt1RtmH3v0o8/dIiAbDdoeugfzZFdfqulmMkcJ4h7LcPm381CAaRJf5PvliXysjXAIuy5baijVYS6ps9zNesoY5GgS+OsR9Z7LIn/2UuZNPG66Ypml1B1vBcEI1Kv/eiJbXtzBKbm3eZ/3eCllV8/dpSPFGTSgEsoV31jKOHGc+FvhBCN081zpLVnIB0VHz6i+70NkI4Yp1L9MhMv5Yq9U9dwaV0QzN08oDjMyHG/nYMb5avuCVcoJoVuNeR57xY7irA6HDZG9IZwiOwUIUUAYbcLk7L0eDyjlPHlfWemOr1aowYd7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwZ5WB1B1qbAZfzz3qbQen4pI2w7ntGOf1IvAOQLH8c=;
 b=R+iW+BT48NUVGAGhWH3Mw6AQ2oUoC3PK+N2eQWvhawN/jznFvUEWtpBhxwQgUYzAIL/JSdTR25KpVgX+RV1OUIj91lOAwQ8kkprkW1zvDQKXhj12lMBGYdjlKb1USatkhDjLMWee4Pl5A1pbmNlFHxZ38dDA8+/BocJ6MwLtjEUIg/RUrqA/sKMIRMHZ7EkBcAP4ZmoXBAGg6Hx714Kmwq2b+/9DDhnGPTBszS4jvN3jSxJtx3t5sDwjrjTdMrcbi1NiSO7nmYSWEyKMdFylUIBZRYNr+rrhMCGCX64YOv0Q0LLnz+dx3J7VCBAnqqzp3snXTMM9DpQsf53FxD5xDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwZ5WB1B1qbAZfzz3qbQen4pI2w7ntGOf1IvAOQLH8c=;
 b=WU3stvPcjb0B+d8eFhmoS6M8xXqdWaCpFry+p1f2OwhLNUkdXWVSgpu78PvKwypgMkHVCBo6CEoIpK+NNaDuafeQf/q9EfSpJ1sZRQ5mV8wWqBvVXAP3Gmepw+nS7q3amqUBLW5xO2DZqluFTyaN6Mvf7vfrrhvWzBtydWRWFo7OVkF6rxPV08CR/3c9mYufZADD/JQcM359lC7Z7d2eLT6dCAA0RoaALeoMY7repXeEGXP/Az69/7yMfHKdt7vPXI1yD7zyRrA6exLq+rqwROl+wQlT1gdxUKD2VYE+gwOiNMaV0sw1i3cykfWJx2auE2TDcJgXKGTZPIjTA8tYTg==
Received: from DM5PR06MB2537.namprd06.prod.outlook.com (2603:10b6:3:53::19) by
 BN7PR06MB3876.namprd06.prod.outlook.com (2603:10b6:406:8d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.19; Mon, 12 Sep 2022 11:21:35 +0000
Received: from DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480]) by DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480%9]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 11:21:35 +0000
From: Heecheol Yang <heecheol.yang@outlook.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Heecheol Yang <heecheol.yang@outlook.com>
Subject: [PATCH 2/8] hw/gpio/avr_gpio: Add migration VMstate
Date: Mon, 12 Sep 2022 20:21:00 +0900
Message-ID: <DM5PR06MB253710C6AE4AAAA42DFBBBC2E6449@DM5PR06MB2537.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912112106.49110-1-heecheol.yang@outlook.com>
References: <20220912112106.49110-1-heecheol.yang@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [IUp9DDtu+9vZLeUsnL4OyD8S7FWJnCcx]
X-ClientProxiedBy: SL2PR04CA0022.apcprd04.prod.outlook.com
 (2603:1096:100:2d::34) To DM5PR06MB2537.namprd06.prod.outlook.com
 (2603:10b6:3:53::19)
X-Microsoft-Original-Message-ID: <20220912112106.49110-2-heecheol.yang@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR06MB2537:EE_|BN7PR06MB3876:EE_
X-MS-Office365-Filtering-Correlation-Id: bb8c6e34-607d-4a27-17d8-08da94b0f395
X-MS-Exchange-SLBlob-MailProps: EgT5Wr3QDKyy4kLjx+6605uc1W7Yl7+QaIaaxFq6lZEj3D5qBmCLDV4qzRA58mj+sJ2lXKzisKZAWKTgiA/aOgqO+ZYs59AO3Ej14LT4aW8ILIV65Wt2Y30+gbyDRnzO+m92j++eQN34YCrT9yO+I5JicDNKYnZnWqqy9Ba0t/qNL/ijeqxvHAJuMDEPmlsNJyjr/9yBQJnwZ67zX8a3egLSm6/ODm6O9q6YOeV9+abu5RSjwpPb6fKFa5W5GdGzYKJFYVnTB9p6wjEap+aaLFDfLOVIMbY0OalgRqIesUd972nc6z1eLfnS/OY+UJKs5fAyI5Khc/Qb15Ue2Mk4wN5tMZZ3Sw+Abarq2cdp730kLH/k+47Xc43j3BjFUjWcnZsgTGpmhzsZJNZp9WykcZmXSUYNU8RFM6Mf4eunwbSWID6K31ZptHnwTT176Iw+wc/oBSDP/2Bg08uqosE3ZBRAJPLBjxlxXVI3SyQzAVWWv2B/LdFwesCGyY4lDrx3EJM6n6OTTe0G1MN2bUldD4sMPdIn2Hp/9BhGE+nXZoQLafI5jQx3Xou9hMHXeyewy0RpSnq0xRoey22O0e2Ltli7FjGnFggK1IEj4nQGH/A1F2FEPLo4HDp1UVxWIeyiJ8upDwXTQEEw0h2n3eTCusLP1f1UvcJLQBtp/08++VgAhWp/4b2lWXUNF8GhLyH7Z5jtm2e1Rv13BqmRfxlWAJWMTjssHFapWesYvgyRb44=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bfh+wji+iLPIRg/vPmaFGPcOGiY760byf49unWyXbdeA8qOvSSOSlAd0SKI41rw6cM3H+Dzl17Efus4PnvQTeglKtB9R1n8tSH9ZzM00kM1EZxiqwcckf3zXVYTxpr3XVOFATBV+P17hmFYNF86KntVrX4DPZngkkYmqPFLC6VZtf6YstsmOo9Cm67pJYUqCbStgOg3U7lXTWM+JBFcD/DY+XlbTnrxqsSwI2h8qnEJCV2ceguSLUo4OsBUfjcrBtSyR4gS12+BKarSDHSEXDuHLJQOCy1TEhVxYvdizWEL0EuS5OAEINOEUPLm+4YFPmVNRfyCEy/VWrIk6XJT3qNUCI0SARBOM8D8GP1NLR0GPjqaMWQygVb+Gxi8kHxxc0wnfwYyzsd+VUqTw31+tzGqQ+Cp9VIlRUjFZj7QOAYrHoSnpBjQRu4lLb2wMq+KNxplDJdo8HR8gUc10OOFDiMiK4oMHK3p4atJFydO8ZpUpRbUKjs+tph50G4tYlFcjiUnPCmHrftUuBy403b9RTdfNZfJbjfSiEEF045mhBTrNM8Owf31HYvHZMTFIXa5DA4WTlpPr2ltMboEqzPCAJl9fUzjPrpb8J2fKo2vC3CdeFypj26mZb9HlM+gvl1rEa7KiU++CJYMLwPZ9mf0sMg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OG9vTmU5K1JTKzFDa2lhS0hqMHBWelVhL1puUGpIRHdSK3F0N0ZmRjlJQUpp?=
 =?utf-8?B?NDN2Y1NKK3RTeGc0dmovN1hTSjlRM2lUM3RCV09TSDlFbHFDK1h5NHplWFdk?=
 =?utf-8?B?bXFOb1lqckx6REpPN2VOZmMxdFhEV015dHFHZlJpZ1dNUG52MUFRSStsUkJo?=
 =?utf-8?B?UzF4YWM4ZHRCWHB4ZmZKTDhZa2FNSUt3bCtVRG8wSHpuSmVXZ3g2OU8rRGtE?=
 =?utf-8?B?d0FhQkM4RUpDTG9xdzZjNFMzdkRBVnRjWEZOWEpVVmg1bHVCR1kyQmxDNThG?=
 =?utf-8?B?cThWZk9FKzZpcElVRFBQell5TGRVcTFlcWNWaDBKNTB4b1VnM005YXVTMTBq?=
 =?utf-8?B?a0lTQnREL0Z6NXpybXlkWEpNcjI5M0lLNDRhRGdSZHBhQWZnMWl1eFpOdkU2?=
 =?utf-8?B?TTVlS24xZmdmZU9SUXB6YzBoR2JQempqelhGYWNLUTVuUDdLN2VyblhKZWJJ?=
 =?utf-8?B?NWNEbTl5SjRjaHM5ZEwvbDNndWxjOUFpVis2MGxtdjBxU0d3M0RHRG5FUnJv?=
 =?utf-8?B?QlhnWmhRRFZYTXhPUVdXeldIbWUrMkxEV3p5VzRHcWVkWmFVRVpPL0VqTGI5?=
 =?utf-8?B?d2MzQXNVRU5vUVhWYnIzOUE3RG00c3VaeldWUmpGd0R2MXpjenorK25FNkpF?=
 =?utf-8?B?MlVOT1d6N2V4RXh1THpxbVpSTHlpUHIzeW51NTBJdkFaaUJydm16U2txQ2ZP?=
 =?utf-8?B?NmsyczNXbFVYaWZPVjJNcFNhaXRiSXQrUTJwcVU1VzIvdUxxdWxnWSt0dGlv?=
 =?utf-8?B?KzgzSmlOOUlMN2l4VmU3ajQ4OUo2OU5zWmtSZlBiNzdIaStSRXFuN0xXQWV2?=
 =?utf-8?B?M0ljQ1hZNW1DRUozSldnQ1E4UXpUZHZWUStjbFpkeVM3UzR3ZW5RN0dBSnJN?=
 =?utf-8?B?VUdhTHIvSTZad01UWmVSM0djL3VzTEVyNXFnWHVlL2ova1BpVGRuU0ZyMjlD?=
 =?utf-8?B?cWFVUWlNbisyaFVjbHRReElEZStvbXNYSVVZOGpkNkdxRXl4dkZGTGl3QU1l?=
 =?utf-8?B?Q1hVbUVXbmRwcUZraWRiYVJWbmNZZWFUWnpYWk0yRU9vSUxTaEpNNU5Icldm?=
 =?utf-8?B?Sk1KcldTZTZvNE5pSjR4b05wNTFaMEp5cGtvcjFVWW9Db2NoMDRnS1lESUk1?=
 =?utf-8?B?Z09DRGw4Qlh1Rm1UYnlDUUVQZXRwMlVkcHFmQUM1UTFJNmdMVEpXT3B3aThK?=
 =?utf-8?B?QklZaVlseGlKRFdNQkF6QnRGdUhHbE9mQnFya2hJb1NlekI5M280cTQwWkhB?=
 =?utf-8?B?T1QwNldpQmp2YkxuUVB1ZGFuQng2MzUzMUVDM2UwdVROV1FTR2ZVeEluUDJ0?=
 =?utf-8?B?Y012WVg1K2FsOXIwNWdERGlDTUl1VVJ6UkhxeTllYmczV0djS3BaM3pKQnZ2?=
 =?utf-8?B?ZWg2ODErWk82RmZaVEtGOExDUFdVZ0s5UUZBaXVOUTZvODFDSEJFZENQR0NH?=
 =?utf-8?B?a2xTNzA1SFFqUitQN3FMQnZCZm9oZGRKaFRUam1TVC9nOHQ0YzdBTCs5aXcy?=
 =?utf-8?B?eGczcGNXbnlEU0dBdFBnL0E0QmZDS0huRUo0MHltN2loYndZK0F1TGVESDkz?=
 =?utf-8?B?aWFmUnRWL0dUVnZ5b0d6NjJMQnhWWk9IdmVqSEdwVVVYZEF3dnFYdmRnbS9Y?=
 =?utf-8?B?L2FjY3paUllnTndLUDNYR24vN3RIU0NjNmtlbzZpV25LSDZ6UDZNWHdqa3hK?=
 =?utf-8?B?NXpuU3NOY28rQ3UzOHovT3FmdllqcnF0QS9zMlpyU2ZKWjFWaGUwenBnRDhS?=
 =?utf-8?Q?EoymbxOdYrwlurg9gY=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8c6e34-607d-4a27-17d8-08da94b0f395
X-MS-Exchange-CrossTenant-AuthSource: DM5PR06MB2537.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 11:21:35.2041 (UTC)
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210313165445.2113938-5-f4bug@amsat.org>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Signed-off-by: Heecheol Yang <heecheol.yang@outlook.com>
---
 hw/gpio/avr_gpio.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c
index cdb574ef0d..da34009dae 100644
--- a/hw/gpio/avr_gpio.c
+++ b/hw/gpio/avr_gpio.c
@@ -25,6 +25,7 @@
 #include "hw/irq.h"
 #include "hw/gpio/avr_gpio.h"
 #include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
 
 static void avr_gpio_reset(DeviceState *dev)
 {
@@ -100,6 +101,18 @@ static const MemoryRegionOps avr_gpio_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static const VMStateDescription avr_gpio_vmstate = {
+    .name = "avr-gpio",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(reg.pin, AVRGPIOState),
+        VMSTATE_UINT8(reg.ddr, AVRGPIOState),
+        VMSTATE_UINT8(reg.port, AVRGPIOState),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
 static void avr_gpio_init(Object *obj)
 {
     AVRGPIOState *s = AVR_GPIO(obj);
@@ -120,6 +133,7 @@ static void avr_gpio_class_init(ObjectClass *klass, void *data)
 
     dc->reset = avr_gpio_reset;
     dc->realize = avr_gpio_realize;
+    dc->vmsd = &avr_gpio_vmstate;
 }
 
 static const TypeInfo avr_gpio_info = {
-- 
2.34.1


