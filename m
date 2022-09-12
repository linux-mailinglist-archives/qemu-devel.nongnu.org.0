Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F2A5B5964
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 13:38:18 +0200 (CEST)
Received: from localhost ([::1]:55548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXhlX-0005Am-BX
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 07:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oXhVY-0007jg-CG
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:21:44 -0400
Received: from mail-bn8nam11olkn2010.outbound.protection.outlook.com
 ([40.92.20.10]:8224 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oXhVW-0000Xk-OI
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:21:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwqQySUhozxZy/oMyLMSx4xLAqnXuNX6o/Vk5p1GVS5F6T84f4NfzJ2b1C1gBzSyHGLzmuJqc+kD44NzURT+uGTl/NIjCMBsQSllH51outeMVXpoRq3uVzTml+ypMfU1FF9rmNPbBeurg2smYtPsx2Ljd16BOhNITx9RD5O2d6ZC4BTJHSyNWq9oCVoC2XUt3WZpnxfC915Qh3YtZME4mTffe532CSz5N/tGoqXVzao4k4zwy2DP1zCSQWYfa8dvvKIiWzjjkCRY5zC4hv8/VyuU6EB4a3y353RAl6nECvXcBlQSt3X2PPZuS0tfsrpckxPy/XPPkEdSNDUA5M9uqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEiyinYvw2kKUvor9sZLFsEdYO5eoW0e48t9r2U2SAY=;
 b=OUk4H8F7Ih1BWVJwcCSleBfdDYLXZf4hBf03MSfmDOlAyvdebKvJqOyO9g8z6ah+1qHOlrXvUmTssgimgvGU1cEifWCgWbVIt7HeArW+RV80r4JX9k8DwGyWbKcytwpd3okwEzvourn/ey7sfPt/p2JdG5acaFme9d+1lJwf8QsXHeTIcnVGISiJLj5Q+1xCu2WDdmnyegkX+C9sUOp8IJWQ0syYS2ESS1CsDJMIkmr9NGFSkWzyJVDQWd5i3gdHre/xsJ8+Z5M7K3BaPDbmLc037Ysj8xMsrXMditgGa2I3U4dPO4oHYA295taKTPqqpt+im/I6wcV3p35DeOWHGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEiyinYvw2kKUvor9sZLFsEdYO5eoW0e48t9r2U2SAY=;
 b=q2apund1QVOZu7dB7TgSOEBV4CEUDX+yYizlpGVsutwwKLoHvuUO8gN0LqOqkk6G1cmXTi8nJmFL7r6yvlphFDvRxn/DsCltkBaSJu5zmwX6zJLJKphxkAttMGvnMgnf0H8mTh7i5cFbtlJfF/cvtBP3SIMMP0jrX6/Ic+C6asSlRsI5YLvGJtHS5LHt3a+5MhMbT1+2juDX2kZAyPmM6sexVqafndfbg6u3XGC+VU87fgxu7cb1beSvKagPKAVyrWi1aElgg/VGEh/JlK+UZAR1HBzelTu5qgqGgcoCFnrma0F8Yb35izPi4wgTiU5cAhzuayvaSpPFR/5Hf36yTw==
Received: from DM5PR06MB2537.namprd06.prod.outlook.com (2603:10b6:3:53::19) by
 BN7PR06MB3876.namprd06.prod.outlook.com (2603:10b6:406:8d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.19; Mon, 12 Sep 2022 11:21:36 +0000
Received: from DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480]) by DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480%9]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 11:21:36 +0000
From: Heecheol Yang <heecheol.yang@outlook.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Heecheol Yang <heecheol.yang@outlook.com>
Subject: [PATCH 3/8] hw/gpio/avr_gpio: Add 'id' field in AVRGPIOState
Date: Mon, 12 Sep 2022 20:21:01 +0900
Message-ID: <DM5PR06MB2537ECF173F0297D7FB1CD4AE6449@DM5PR06MB2537.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912112106.49110-1-heecheol.yang@outlook.com>
References: <20220912112106.49110-1-heecheol.yang@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [5BwSmc28BRzJUcnxwKNMrjcxikChErt4]
X-ClientProxiedBy: SL2PR04CA0022.apcprd04.prod.outlook.com
 (2603:1096:100:2d::34) To DM5PR06MB2537.namprd06.prod.outlook.com
 (2603:10b6:3:53::19)
X-Microsoft-Original-Message-ID: <20220912112106.49110-3-heecheol.yang@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR06MB2537:EE_|BN7PR06MB3876:EE_
X-MS-Office365-Filtering-Correlation-Id: f35e4ed3-4187-4045-e06d-08da94b0f485
X-MS-Exchange-SLBlob-MailProps: AZnQBsB9Xmqxq1ifAc9vd1hrDdkf/Zi2kLSRSMlRV6h3UIp1FGAQDr36H3K/Q/B+36LZmEh7v0Jn4IbS/eD8QuhiyjwOIyWZaIz5xOd1x/hnoRwZ3LifgImDZEDO4YTqK5+uWIl7Q0TwsAnRtiknRH48zV8wYLt5PSbDVR32RBdfkXqo0JzXb2jLJjuRYIz/DqfXLyyXMgEf/c5w6YYqQnmD+vv6FAswdiURFBe5LKuNCzC5oQwWjXzc30MoG7htAJk1qL0BahEbXI/GejFf4nz5TtSiEG1Wo6jA8Wmswj3ePuVddHgchrFT1Mmj7F6fYNHphfxHvJY7h38legb5eyqdNmKx2NFcPSGR9TkoATEw3ImAg4Xqufjkh16zgLpsTNVb8C411owmvoEMI7+buo84+LKEh44AlVzcQSs8A+UYsa4tBpXCVRyT67IMu3dXxXq8oyiWLj+LEspoAtRogtxDMfZGaQbTqoB6BqNJKaFa4VV9dJa/W7gGOq9XugBrduQyGHAIJgddzMMA5mWzFii+vn+dA352/iSJQ+Hh1Q7DFJ6cUnu7LIn+jorMKs13wcwQ6Cqre5WzLJbDaRQFYnlqSLW1udrYT0CgmUxuzYAZvqDXVcBRepfF56evJFVuk21ztgpKU6mTqoZLU35aM7IFi82YD1xqw0iVHs9rOhd2I9b2rR2P83zD0Yp8kAP75NOcCmOh0cO02rqi+fTXRWctzGS2JhdHt/GwaphJZr7z/KGf0Vly8on1d8TFds4w0/cRyIMjRjU=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r75ae4FMcarW4fBr7kkY1FfF1tGXcK2sdmYkZwUK17QLd+9mABoI42lSDSf+PYcV7dPfiGva6abxnwq0Er4RKF72+P9lRBiDC9cYxXCutrw+JZCycP5Z5SGylFInT/AiWiUWTzAaEnRu59/rRzN+fSCkd+FrGn7V5rmJxCYIbbyXpJvsFFogbcvk3gP+DauHksMXXgdAEqsTGGP1T1GKUKp8NSZadD3kZOXhhT5Yca9LMjrXQJeFB3R8rcFTQLF83dHqKgrtUSyRflqcryoS1WW5Fh7+4N0xpqgvyHVI532wbKEwT9QTUeF18dJGpt6DQhpgPP/DeTQv666M+T8WfgJDpzWIyVJJn/20UYm8RIxLeA/WpuPXBbaOep3R849+022Z5sMXNWVgsYq5rftjVKThZCtuE22y/Jp3uoxhDnJe+uOZ6NtlC42JH+OMIo7+EyYTHDaJa0vejQddv/Cab3mhH0Z65zELYuPRICDiNu+nbnAfke5NULFW0GTAO3FpUEB9GXl32+YyNjVOYx5VWhNqTmgX/QfCLYGq6tws5Lcw7G0zmgGXtsSUE4l+v6fcVCym4eUYJ2j/p/7r52Zu4Gpof824IXVseLKR0XsB64pfk5ytAeGUjfeVRTPQ8oZdwPI1T3VvQxKG58IbZOtZvA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnZ5TG15NktYZ3VzcUVZdjJrdHBIZ0pEWHlXS3Zjc0g1TzAvQWdpY01JeENv?=
 =?utf-8?B?NnJvRTB2cGtPNTlJcWhabmJPdWFjL2lDand6cStsMHQwK0FGV0lqa1ZvVUdx?=
 =?utf-8?B?MEFqVjZ6aVJPZW50NWhLZlVJdERFT052VjRxcnI1dnVCdk1xenR2dGFkaDRi?=
 =?utf-8?B?YTFyeWxZU291ODVrZ1B5VEUvVEFiM3hjS2dBL2ZvblVqZUVyeHlkNTd2ODZx?=
 =?utf-8?B?bUlBQXVDM0hpaTh0eWIrWHptb0ZaUDF1YS9hM3dsNHB3cWNJSXNHVUxzMnVT?=
 =?utf-8?B?MkUrV0pWNzY2Uzl2d05xMHdSVnpDdHBvODY0Z1RFakEwN3NPR3AxZENOUnlG?=
 =?utf-8?B?aHYxTGZRMlJHZGdzNkROMTE4UE9GU3ZzanNmTFR2dzE2b1c3TUJwYkxBWE5I?=
 =?utf-8?B?VUVhSE9USkJlQ3pJU2x0SFhESXFSZ3JBOTRINXFGNU1FY3YwUHBkV1pGN0VU?=
 =?utf-8?B?RHVHU3FlSm0rSGNMcGZHd2E5dXo2Y0JwdXlYUDN0OWlYTThvQjEzN3FGM05z?=
 =?utf-8?B?M3R3VWZGQ2hONFdsWENEU0dDbnVjdEl0UnRPdExQeWQwSWhUSGQ5RitmbWMx?=
 =?utf-8?B?MkhoRitsKzBDZVNNbFlMSy9MZm9DaUxCbHhvWTA1QVo3c2ZCeWx6WEZKWHRB?=
 =?utf-8?B?cklaTDVxdm9vZDM4alZCM21PNU9VeHErZjNTU2R3bGtWNlUwZWxuSXRaejBF?=
 =?utf-8?B?a2I1UjZwaFAwaFdQMS9tR2xxMHB3eDlVS2k1ZTlGT3V1UVJyWE9kcnQ0KzdI?=
 =?utf-8?B?Yk9HNU85U2FST3VUSnFaSkROeS8vWG8zNHBKNFUrWWpBeERvTDNpRHhQS1Nr?=
 =?utf-8?B?Z0k3NVJmeGJ0SUtCd2VONkVpa3JLSlU2aTZPZGovU2xKQVdZTVFtUU1kaWZs?=
 =?utf-8?B?NUN4NElMMVoyTy9qZDB1SkpsOGxvK3AwOXNyU0M0TVlkMUc4RWNwNU9jUE0z?=
 =?utf-8?B?RjNSa0dJa3UxMmhwOStMQTlQWXh0a1ZFZTJOVXlHa3FpcUZuQ0tYdENNd3NS?=
 =?utf-8?B?WExrWmhmUjNXMXZOYytDaXB5cnRsWWNIT0cyZTB3YVBPdFdXTVU5YVV2L0pI?=
 =?utf-8?B?ZmVWWWNsOHpuZVVtYnRGbkZuMjdkK3kwVWx5ejZDYjQ3bXJlNGZrSFhOSWc5?=
 =?utf-8?B?TEZxS1h2Z3VsVnliSlh3NnRxcEZuNkVleW9PYlc4bXV5bGo1cXVTRHpadHdp?=
 =?utf-8?B?S1AxVmlNVHI1dFY4UEhuK1VFUzIxY1lYVGJoUDE1M2c1Q3ZPQWNBWmFDVlRZ?=
 =?utf-8?B?UWtPb2dTUmFpMmx3L2FFck8zekhrK0hsOEh3UGF6QzJSV0dtRDh1bmk4aHRM?=
 =?utf-8?B?KzVIQjNYbGtrSDY0YXR3TlZlTmQ4ZEZYYlE0d25zMG9aRzJkNTZvaEJVOTl4?=
 =?utf-8?B?N1BVTmsyL0ZBdzRVeGh5MXdZdGNpWjBtQWJHM1V1R1EyOThrekVXZFVTSHh4?=
 =?utf-8?B?T3pKY3IyZEFTM1J2cjdscDQyZEJoSkNnZ010MEE4djREWHE2aWMwdU5wSUFE?=
 =?utf-8?B?QzdkS1JZY2NrNmFVZmRCTTB3cW54L0wxQThwU0NpUm4xZlRDUWl6TUd1YlhH?=
 =?utf-8?B?VjI4aGxNbVVFMTFqeENkbXgxRlZoSWJSNko1NFpOa010aXpuM3o0VW54Smhq?=
 =?utf-8?B?S25QRGdYc2labnlxODlqYXpqRGRmRVVoL0ZlVW1JdVMvbGRVVDRweUdPeFZQ?=
 =?utf-8?B?bVZ6Tm1hdDQ1ZTRVcW9yQnVKZmQ4aFZ3aFJ5UUtMOUUyNDBmMUphYnltY3BF?=
 =?utf-8?Q?apqjS58wGrqA+QV8xE=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35e4ed3-4187-4045-e06d-08da94b0f485
X-MS-Exchange-CrossTenant-AuthSource: DM5PR06MB2537.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 11:21:36.9227 (UTC)
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

AVR MCU have various GPIO ports. Add an 'id' property to distinct
all instances.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210313165445.2113938-6-f4bug@amsat.org>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Signed-off-by: Heecheol Yang <heecheol.yang@outlook.com>
---
 hw/avr/atmega.c            |  1 +
 hw/gpio/avr_gpio.c         | 14 ++++++++++++--
 include/hw/gpio/avr_gpio.h |  1 +
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
index f5fb3a5225..d3a966ae94 100644
--- a/hw/avr/atmega.c
+++ b/hw/avr/atmega.c
@@ -284,6 +284,7 @@ static void atmega_realize(DeviceState *dev, Error **errp)
         devname = g_strdup_printf("atmega-gpio-%c", 'a' + (char)i);
         object_initialize_child(OBJECT(dev), devname, &s->gpio[i],
                                 TYPE_AVR_GPIO);
+        qdev_prop_set_uint8(DEVICE(&s->gpio[i]), "id", i);
         sysbus_realize(SYS_BUS_DEVICE(&s->gpio[i]), &error_abort);
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio[i]), 0,
                         OFFSET_DATA + mc->dev[idx].addr);
diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c
index da34009dae..3db55bfa77 100644
--- a/hw/gpio/avr_gpio.c
+++ b/hw/gpio/avr_gpio.c
@@ -113,6 +113,11 @@ static const VMStateDescription avr_gpio_vmstate = {
     },
 };
 
+static Property avr_gpio_properties[] = {
+    DEFINE_PROP_UINT8("id", AVRGPIOState, id, UINT8_MAX),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void avr_gpio_init(Object *obj)
 {
     AVRGPIOState *s = AVR_GPIO(obj);
@@ -123,9 +128,13 @@ static void avr_gpio_init(Object *obj)
 }
 static void avr_gpio_realize(DeviceState *dev, Error **errp)
 {
-    /* Do nothing currently */
-}
+    AVRGPIOState *s = AVR_GPIO(dev);
 
+    if (s->id == UINT8_MAX) {
+        error_setg(errp, "property 'id' not set");
+        return;
+    }
+}
 
 static void avr_gpio_class_init(ObjectClass *klass, void *data)
 {
@@ -134,6 +143,7 @@ static void avr_gpio_class_init(ObjectClass *klass, void *data)
     dc->reset = avr_gpio_reset;
     dc->realize = avr_gpio_realize;
     dc->vmsd = &avr_gpio_vmstate;
+    device_class_set_props(dc, avr_gpio_properties);
 }
 
 static const TypeInfo avr_gpio_info = {
diff --git a/include/hw/gpio/avr_gpio.h b/include/hw/gpio/avr_gpio.h
index 498a7275f0..e982f627ea 100644
--- a/include/hw/gpio/avr_gpio.h
+++ b/include/hw/gpio/avr_gpio.h
@@ -48,6 +48,7 @@ struct AVRGPIOState {
     /* PORTx data changed IRQs */
     qemu_irq out[8u];
 
+    uint8_t id;
 };
 
 #endif /* AVR_GPIO_H */
-- 
2.34.1


