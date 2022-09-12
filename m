Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D779C5B59A6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 13:51:25 +0200 (CEST)
Received: from localhost ([::1]:46722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXhyG-00008F-U8
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 07:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oXhVT-0007eK-TB
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:21:39 -0400
Received: from mail-bn8nam11olkn2010.outbound.protection.outlook.com
 ([40.92.20.10]:8224 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oXhVQ-0000Xk-KV
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:21:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZpIjyGrInpktuCOnCrZ1X5ILEzzNWCIKLTLsFCcxdyfHgud7q/soxwRagJURpp9yvxEq44DdsIyMaVwKtM1MYHoA4C04t4SARHcWkc3hWl623PcObSSuMlKFya94bPmoMgH7fDb7bMnK6Juf7psD++QqHLnOWWOHUTdSqZ76roKyx9vnTgqpfE47f8ZzkDj451CA5gPsWDDYljgkTcBWPSHco26t7fbTigTVeO7ShxRp+9lc7IiKBxF/ylFKmEOLaoJTHPx7ouB6YFXGduRbOSs2CwKNDjxmmHRxPP2Y2ZwmJvS5WYVvOi+2czzc+DHMNA77vOvGOEApK2Ft3oqzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rY1oX1cB7RQ3YY4fNzRMSNgscPJmY6KBbSLMASS4x9g=;
 b=WPQmeLzJphIwNTE17jfAA+/ODFt8XCEeAcZR4ycXhAuZfxLmkWNyxMyJ1SRX2X12M3v40x6gfTRtnCTSQurUYP4lu5ep+Bfr1WZk4VO2VpXeoQbkPIMBzvEVDRUS+lV9aCWHYUDO1z28xGWGpyyeIZnWJHamdtLLtb7YykYKouCpCk6Cn6aHxgQcnkKijI4m4ZlPSqNidZpP7zJJOSt4iOg9ucJB+iAhugepTp+DZ7StLEx18VI3eT2YOBwa0Gpun2i9VYxanDhwI8u3ECFCF3tFhmlCuszVXqRcCi3E4QvHtbsJWrI4QdKIPQmYewoQfVoDZdzP7+f15cD0ovIhXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rY1oX1cB7RQ3YY4fNzRMSNgscPJmY6KBbSLMASS4x9g=;
 b=nJfV0TBa6xPwHtvrChPXnjhJMIR8angMYN3nsr8Tk1tNoJohC7I6MAZjtYdiczd/gUudw4xqx269EQ3DW3dCk7KQg169I0YyKIYdbYU9fy9nfQS96ABwik9M+kKMUhEUQqdKvnPLNRv/77FdpBjX8EWWUgUNmZGcogU/kEd8kMPPH0TiWfBUa4X5fU6Id/S5hRXIuwVRG4D36AGD4rkI2p01RT5eiWAMmA9bbBEopZvq2vXjBBZYlJGmzioCdNvm3AiRIrmRn1K54j8jd4UsUktk50KHPlvJEUrdfAVFQmy5nRESRy6hRKp2fSn3o29BEAeZsHPRUKS2D4OERjfUWA==
Received: from DM5PR06MB2537.namprd06.prod.outlook.com (2603:10b6:3:53::19) by
 BN7PR06MB3876.namprd06.prod.outlook.com (2603:10b6:406:8d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.19; Mon, 12 Sep 2022 11:21:33 +0000
Received: from DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480]) by DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480%9]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 11:21:33 +0000
From: Heecheol Yang <heecheol.yang@outlook.com>
To: qemu-devel@nongnu.org
Cc: Heecheol Yang <heecheol.yang@outlook.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 1/8] hw/avr: Add limited support for avr gpio registers
Date: Mon, 12 Sep 2022 20:20:59 +0900
Message-ID: <DM5PR06MB253775CC03F84F6A36F44370E6449@DM5PR06MB2537.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [Pnus1anDHztPOuZ1buaPCYJuok3tSTWf]
X-ClientProxiedBy: SL2PR04CA0022.apcprd04.prod.outlook.com
 (2603:1096:100:2d::34) To DM5PR06MB2537.namprd06.prod.outlook.com
 (2603:10b6:3:53::19)
X-Microsoft-Original-Message-ID: <20220912112106.49110-1-heecheol.yang@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR06MB2537:EE_|BN7PR06MB3876:EE_
X-MS-Office365-Filtering-Correlation-Id: e8e29691-d55f-4df9-5152-08da94b0f285
X-MS-Exchange-SLBlob-MailProps: a+H6FLLcF3oWV9cBtUfTzmBWzLXvjO49yqlalxHKLEC0/qW6vU+xu/7kA7yV0sUBWM15xuPlrBDe9nNETZIuMfazubTeeOQKhYjI58+RgdvpfxGQ3Bba8vuNWtjGBrWgN7UPCfATiTqOapi0NKb2SFhDxrjR8iHGeMAPSStVw8JdZQI/Xcb/rPjOCV2CJI7H7k0dMArAgYSAEdhyzMwzawohjq+YeLV2PLwJdsFpEp0N9keqbX1VvaJdcsN8RugI+28bJ7LzJkE8Zb7TdabPZRAgY2uubNx/q7cBlsdVYvqo5BVPFuByBZGX+Qqjrp2lUE8O/XiwrfYjOP6upKqGeUruE0Fz/EdO5V1ef0Jl9Kc0JFgYTO3GLCj8wLQlqBGDKEygmOPX2Nnn4esh6HxJlRgs5lMXu65dniCVcV4mFiPG3uKf0/pMd4FQTbxj8taTwk/5tYJopRwT+f89652Ctl0yWDFVpxhnQu5WB7UEVQcENatMa2GPOvYCUh4kl15amlJ7A6h14ANCFYZ9tDoSfwzgJnN/byyWvbLypHYErh3Iq1Yh5uKScfLrlS5b3YWjg47XhymwYFQ8fxhQ28ymSmTHWS4ig7m7iS1YGp58nZKgVB6p81aJ42l5/gOxZMgSgSW/n+D7/5SiaYQNzW7y0Gz32OIJc6n7Vlf6x0kzC1WDgo8ggCZcahae8/KnbBanehmktwZVEaY9xE8HqZvaSunrg33czekzspTViZT18q+pbHilkSYldO2sob1F78fEFnnylRkVtNWiqxMzKl9Hil32GFFHShjgekUkQH45Y6n2/nlPoPsTC1Udnuy52QgJ
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wK/EoZo0plYLunduNJSmFoeejnsHXOmhHRGdDUla7sBxopIEWAO5cSsq1gsanmVH/u5xkb8LTawBHKRSasRe/hcN7nTA1Kef9lKj5T4Js7jE8U6viaiVh5y2CQUkCND3Go+0IPiIvoPewyHDRzhPitqzl3GOL7zMpNK9UiAHlgjufh0zL9L6dptpOLXatec4S9+UA+RZYENBuZ7Z9iXQsxYSU0esIMH+T8d6jO8MCXaLMJ+aXVAl8XvZ8i17zKsntoqG1HvZqM09lczUoj4uIUi78xfg5vIvMQQjrt2hmaQBpEjVNAEXsX/3kmG2XfUMMHChkJkZGU77OotslWUuD+DbAy+2PBFcB1cqhdNOvOxzqZip51WGS182TRVI6e865uEhFiSwJhEficX7kZz81/OsYyvGGEfcqHYvaRGQr912KNEnSiKHx9/xiqM3y781WOC8Z3yyXS4JfB8grG72v16DEbCqScZ0Dh9v1wkG1A5qgDsGqkaY7OoH8TU5jhYUp7KelvB+TdxkYxm330gDzWL55E6DMnG2I0x6hhjQQmwnTqowICG4PlO7IuMcBjGk9XK0eYrr7DRf34TgArwqyiFrGRYXs6GndvNSbwZLYgtssxJ7xoA0TZL/7gyQy8dW
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjBsdzNEU1dXZTdmSFB5TVpGUmdLbXpOV2FlVnRrV1o0ZVNJd0NVZ01LdHZS?=
 =?utf-8?B?cnJDbmNKTStDTWZGb0d6Z1dGNXFnRk5yMXMweDdBSDFwSmd4QnNkRTUrLzhU?=
 =?utf-8?B?N1RPekVCMldQdXk3cFJVeW4wRVFNZWtoTDBGUzhLRXZkbHZCbTNrL1MvWnpM?=
 =?utf-8?B?WDU4eU1hbW9XTDBLQ0RBeG9JbDZhV0FRQ2puMFk3ZHkyeFpXbThad1JLTGho?=
 =?utf-8?B?azRDYUFwMUk4a1NZNDhMcFN2NWZSQ05SbTg3YXFYdCtHVmhZZGErVlJqQnM0?=
 =?utf-8?B?Q1g4Q2tERUlNSVkwMEIzUUNQT3ozVFFXUDBHUHFXM1hTNW90T2lzN0pYTGp0?=
 =?utf-8?B?Sk1Gc1FjTUVKMjExcXEyWmRDckZDY09nZTYzQ1V6UVoweFBFMStGdWx4bkFp?=
 =?utf-8?B?SUNsbXd3cEd4cWdKc05EV3NlMk9GdXBPSVZkTWZ4SnZvaWsraStrSEtoUmk4?=
 =?utf-8?B?U0FSajFxc3QzZmpXZG8zZTFKZ1lFaTJ6NHFQV0pOMXBEOXhEM084NmdUdXNj?=
 =?utf-8?B?bUhVd3FJTmsvSm41K3pibGJlNVk4TFZodlQwSjdBTTliOFQ4T05saTQxb0dI?=
 =?utf-8?B?S1B1VDIyYjhKajJFajBSd3RpbDdRY1FlelV4akc3bkEybCtZMFVRazkyRG9D?=
 =?utf-8?B?cHRMUVpxVEsvcm40VlpIUEZLT0gvbFlHUHphYzhsTVVjUTdGRVNQWlVnU2Ny?=
 =?utf-8?B?QmJuM3NEd3JSSnBnZEN3citseTZJNWtJSk9FNHhZcTNwUGtsWVVwTmdPMTdT?=
 =?utf-8?B?T21wMCtoaXQ1WEZ1YXNwWDNxWjRuSFU2a2t4N3Z5MzN0M1FzNnZ0S044eTFR?=
 =?utf-8?B?N1hTUkkwL2IzdmVEUU5CRVB2MW5MUmd2d2YvL1E4dGhhUk5nZWc5dlh6QmFR?=
 =?utf-8?B?ZVpQRFZLc3RtMXVKdGdPbUt0UHVTelcyQ3ltVzZvSlRqSGw1dHB4OGxJcEty?=
 =?utf-8?B?aEdFMmhHcGJvTFEvWUczdjV1MjdWZ2wwZ2txTnFYYXA5dUkvbUltZU5yZzNo?=
 =?utf-8?B?VVM5WURJeEtjdzdhRXBYZnN6THVyS21FeHZrT0tNZzNEYngxYzQyQmZmQkJY?=
 =?utf-8?B?cmJxRXN2RGRZREZXQW1sSllwc21HeGh1cnBzdHlIaGpCNjZ0cE02MkVYVXR2?=
 =?utf-8?B?cVlocVloRGpqQUdPaklsVmFjUjZmbXVxMWdkUmhHcVh1eldBSHhHY1lWc0lL?=
 =?utf-8?B?NGwzK3JiY0lBMWE2cnRlbUhXeWVXZUVFM2ZaTVJBWGp5K2lUYS8wN3ZNLzBS?=
 =?utf-8?B?cC83WEMvNG43NWRYU2p2YzByTUY5Q3hXcTNjUjhlQm80Y3dVbU1SVU1xY3VR?=
 =?utf-8?B?QnFxWkFnWDlaWDF6dkZnaEhlMXM1YjBkdlJCZzJDNVlOK3ZhcXRIRndkclZh?=
 =?utf-8?B?WXI1Uk1ZUkh4M05PaWlENS9NQzV1cVA2NDR4N21QMFZNWXduVXJqM1dMRXV0?=
 =?utf-8?B?bmFQS285V3hXWisxL2Q2SFU3bHI0a3U1Smp4OUVML0tCZks3a0NDUXUrRjJB?=
 =?utf-8?B?ZGJ2Vld2cXJsd1JGR2NKaHEzdWdGemsrY0JZZU8vUGx1eTZPOFM5M1JnOURV?=
 =?utf-8?B?d0M2MGZaMVVYOGJZVFhEbUY2MUtsMGFkV3J1RFJ2STM5UDROdWpJK1dZM1Qz?=
 =?utf-8?B?NnBDZTdRWHZ0ZTg2dnRidFBrTjdIUWdGRHYxdnhZUFM0MHhlbENLb1JzcE5P?=
 =?utf-8?B?UllUdWp1SEE5NjZIK0JUcE9qQ0R4MmVXVW9JbzByc0J4VzJnMW8zSzgzV1ZP?=
 =?utf-8?Q?l5G+OgI+Ip71eBHKmc=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e29691-d55f-4df9-5152-08da94b0f285
X-MS-Exchange-CrossTenant-AuthSource: DM5PR06MB2537.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 11:21:33.6105 (UTC)
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

Add some of these features for AVR GPIO:

  - GPIO I/O : PORTx registers
  - Data Direction : DDRx registers
  - DDRx toggling : PINx registers

Following things are not supported yet:
  - MCUR registers

Signed-off-by: Heecheol Yang <heecheol.yang@outlook.com>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Message-Id: <DM6PR16MB247368DBD3447ABECDD795D7E6090@DM6PR16MB2473.namprd16.prod.outlook.com>
[PMD: Use AVR_GPIO_COUNT]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210313165445.2113938-4-f4bug@amsat.org>
---
 hw/avr/Kconfig             |   1 +
 hw/avr/atmega.c            |   7 +-
 hw/avr/atmega.h            |   2 +
 hw/gpio/Kconfig            |   3 +
 hw/gpio/avr_gpio.c         | 138 +++++++++++++++++++++++++++++++++++++
 hw/gpio/meson.build        |   1 +
 include/hw/gpio/avr_gpio.h |  53 ++++++++++++++
 7 files changed, 203 insertions(+), 2 deletions(-)
 create mode 100644 hw/gpio/avr_gpio.c
 create mode 100644 include/hw/gpio/avr_gpio.h

diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
index d31298c3cc..16a57ced11 100644
--- a/hw/avr/Kconfig
+++ b/hw/avr/Kconfig
@@ -3,6 +3,7 @@ config AVR_ATMEGA_MCU
     select AVR_TIMER16
     select AVR_USART
     select AVR_POWER
+    select AVR_GPIO
 
 config ARDUINO
     select AVR_ATMEGA_MCU
diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
index a34803e642..f5fb3a5225 100644
--- a/hw/avr/atmega.c
+++ b/hw/avr/atmega.c
@@ -282,8 +282,11 @@ static void atmega_realize(DeviceState *dev, Error **errp)
             continue;
         }
         devname = g_strdup_printf("atmega-gpio-%c", 'a' + (char)i);
-        create_unimplemented_device(devname,
-                                    OFFSET_DATA + mc->dev[idx].addr, 3);
+        object_initialize_child(OBJECT(dev), devname, &s->gpio[i],
+                                TYPE_AVR_GPIO);
+        sysbus_realize(SYS_BUS_DEVICE(&s->gpio[i]), &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio[i]), 0,
+                        OFFSET_DATA + mc->dev[idx].addr);
         g_free(devname);
     }
 
diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h
index a99ee15c7e..e2289d5744 100644
--- a/hw/avr/atmega.h
+++ b/hw/avr/atmega.h
@@ -13,6 +13,7 @@
 
 #include "hw/char/avr_usart.h"
 #include "hw/timer/avr_timer16.h"
+#include "hw/gpio/avr_gpio.h"
 #include "hw/misc/avr_power.h"
 #include "target/avr/cpu.h"
 #include "qom/object.h"
@@ -44,6 +45,7 @@ struct AtmegaMcuState {
     DeviceState *io;
     AVRMaskState pwr[POWER_MAX];
     AVRUsartState usart[USART_MAX];
+    AVRGPIOState gpio[GPIO_MAX];
     AVRTimer16State timer[TIMER_MAX];
     uint64_t xtal_freq_hz;
 };
diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
index f0e7405f6e..fde7019b2b 100644
--- a/hw/gpio/Kconfig
+++ b/hw/gpio/Kconfig
@@ -13,3 +13,6 @@ config GPIO_PWR
 
 config SIFIVE_GPIO
     bool
+
+config AVR_GPIO
+    bool
diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c
new file mode 100644
index 0000000000..cdb574ef0d
--- /dev/null
+++ b/hw/gpio/avr_gpio.c
@@ -0,0 +1,138 @@
+/*
+ * AVR processors GPIO registers emulation.
+ *
+ * Copyright (C) 2020 Heecheol Yang <heecheol.yang@outlook.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) version 3 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "hw/gpio/avr_gpio.h"
+#include "hw/qdev-properties.h"
+
+static void avr_gpio_reset(DeviceState *dev)
+{
+    AVRGPIOState *gpio = AVR_GPIO(dev);
+
+    gpio->reg.pin = 0u;
+    gpio->reg.ddr = 0u;
+    gpio->reg.port = 0u;
+}
+
+static void avr_gpio_write_port(AVRGPIOState *s, uint64_t value)
+{
+    uint8_t pin;
+    uint8_t cur_port_val = s->reg.port;
+    uint8_t cur_ddr_val = s->reg.ddr;
+
+    for (pin = 0u; pin < AVR_GPIO_COUNT ; pin++) {
+        uint8_t cur_port_pin_val = cur_port_val & 0x01u;
+        uint8_t cur_ddr_pin_val = cur_ddr_val & 0x01u;
+        uint8_t new_port_pin_val = value & 0x01u;
+
+        if (cur_ddr_pin_val && (cur_port_pin_val != new_port_pin_val)) {
+            qemu_set_irq(s->out[pin], new_port_pin_val);
+        }
+        cur_port_val >>= 1u;
+        cur_ddr_val >>= 1u;
+        value >>= 1u;
+    }
+    s->reg.port = value & s->reg.ddr;
+}
+static uint64_t avr_gpio_read(void *opaque, hwaddr offset, unsigned int size)
+{
+    AVRGPIOState *s = (AVRGPIOState *)opaque;
+    switch (offset) {
+    case GPIO_PIN:
+        return s->reg.pin;
+    case GPIO_DDR:
+        return s->reg.ddr;
+    case GPIO_PORT:
+        return s->reg.port;
+    default:
+        g_assert_not_reached();
+        break;
+    }
+    return 0;
+}
+
+static void avr_gpio_write(void *opaque, hwaddr offset, uint64_t value,
+                                unsigned int size)
+{
+    AVRGPIOState *s = (AVRGPIOState *)opaque;
+    value = value & 0xF;
+    switch (offset) {
+    case GPIO_PIN:
+        s->reg.pin = value;
+        s->reg.port ^= s->reg.pin;
+        break;
+    case GPIO_DDR:
+        s->reg.ddr = value;
+        break;
+    case GPIO_PORT:
+        avr_gpio_write_port(s, value);
+        break;
+    default:
+        g_assert_not_reached();
+        break;
+    }
+}
+
+static const MemoryRegionOps avr_gpio_ops = {
+    .read = avr_gpio_read,
+    .write = avr_gpio_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void avr_gpio_init(Object *obj)
+{
+    AVRGPIOState *s = AVR_GPIO(obj);
+
+    qdev_init_gpio_out(DEVICE(obj), s->out, ARRAY_SIZE(s->out));
+    memory_region_init_io(&s->mmio, obj, &avr_gpio_ops, s, TYPE_AVR_GPIO, 3);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+}
+static void avr_gpio_realize(DeviceState *dev, Error **errp)
+{
+    /* Do nothing currently */
+}
+
+
+static void avr_gpio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = avr_gpio_reset;
+    dc->realize = avr_gpio_realize;
+}
+
+static const TypeInfo avr_gpio_info = {
+    .name          = TYPE_AVR_GPIO,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AVRGPIOState),
+    .instance_init = avr_gpio_init,
+    .class_init    = avr_gpio_class_init,
+};
+
+static void avr_gpio_register_types(void)
+{
+    type_register_static(&avr_gpio_info);
+}
+
+type_init(avr_gpio_register_types)
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index 7bd6a57264..ef372bdd3b 100644
--- a/hw/gpio/meson.build
+++ b/hw/gpio/meson.build
@@ -12,3 +12,4 @@ softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_GPIO', if_true: files('sifive_gpio.c'))
+softmmu_ss.add(when: 'CONFIG_AVR_GPIO', if_true: files('avr_gpio.c'))
diff --git a/include/hw/gpio/avr_gpio.h b/include/hw/gpio/avr_gpio.h
new file mode 100644
index 0000000000..498a7275f0
--- /dev/null
+++ b/include/hw/gpio/avr_gpio.h
@@ -0,0 +1,53 @@
+/*
+ * AVR processors GPIO registers definition.
+ *
+ * Copyright (C) 2020 Heecheol Yang <heecheol.yang@outlook.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) version 3 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef AVR_GPIO_H
+#define AVR_GPIO_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+/* Offsets of registers. */
+#define GPIO_PIN   0x00
+#define GPIO_DDR   0x01
+#define GPIO_PORT  0x02
+
+#define TYPE_AVR_GPIO "avr-gpio"
+OBJECT_DECLARE_SIMPLE_TYPE(AVRGPIOState, AVR_GPIO)
+#define AVR_GPIO_COUNT 8
+
+struct AVRGPIOState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion mmio;
+
+    struct {
+        uint8_t pin;
+        uint8_t ddr;
+        uint8_t port;
+    } reg;
+
+    /* PORTx data changed IRQs */
+    qemu_irq out[8u];
+
+};
+
+#endif /* AVR_GPIO_H */
-- 
2.34.1


