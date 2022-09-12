Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9869E5B5993
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 13:46:28 +0200 (CEST)
Received: from localhost ([::1]:60396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXhtT-0003aa-LR
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 07:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oXhVc-0007qR-FB
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:21:48 -0400
Received: from mail-bn8nam11olkn2010.outbound.protection.outlook.com
 ([40.92.20.10]:8224 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oXhVZ-0000Xk-R9
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:21:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwcmoaUciP6peOBAvu/bKndh+B7EfspB6V/cqqx+QXF/MoWp1HLAB+6FP0INmotGKGxSRaic6BXM4qL2P22GoH9GzTp/0fQ17rafknmn7mQknCRzFL/OUHy2hObv7VpO6sF2qY0LNutS6Qlh7rhGnC6VlqGx/BfTDQj66zQeBDiUWNW025nxLjMHKXrT0m0VWrCAaUAF/m6eOttjlF0pR/CHg1fIRDYR2txJ/Bkhq1S3MhvGbCRu8WFU9Tzou0OMhVVNSAnMEJh9M8S7IVIsZs3wwL3A7WK+iz3EOHCVlt5xqgC6qmWae0OL/HAurAboOeIVmijZsNTCtE+uIrUsRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bwz4G1iHtPY/WWZ9XHO2Z0VxZDWz0UQSBLZjsiPMCe4=;
 b=R6dRmBJrwZlv5ScWLBLEUDJGSYIEwtfOUOaEKOdzFFE9u1xvkPnsK8ygEINXl6ssMRyJilvW0+FK7DJmSlCe0Y/eZt2m4CQ+ZsFf5ztYA56aaJ5iRAuzVKPa4n78LQwY5mLPFarmbt0dQHE/N9PTZ6/jMj61JdACJWgo8CLMwccRj8nKmrmsWkBd2K/wkOdjV6AScIge2rDbQd2Xr/T3tGFSj3M4iW5oFTPYhELFSxXnf8147oc1o+2BNpL8z+5S8xz4ZB13+5LdijMIxCDOSAUKeUSbj15dlyJj8auHe1s8KnzITkXoPTVIqNGkMRAaFw98gkke/ztYr5qe7ktctg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bwz4G1iHtPY/WWZ9XHO2Z0VxZDWz0UQSBLZjsiPMCe4=;
 b=hcC5V4HzFJnVhxOOY4wLEC1dcYXw3xwgDJ7BK9AKqbZXD39rWkldrMQ/AmroRTpdMdBzutnJP8tyD+bAeBeYmkN0k2rAIJLjgDOfNaZpo4N92+qnyRjFfm+P8iaxfaS3JeIYjz+lOA8JASEEbmM0Ff9d5XtD0fRYGSzL9q8jdw6mgVGad6sDie15xCCA4fsf/Bk0/gkJ8+KjwRSrE3vAr3jC+u6qfs/jC7r1LhpRGc6cS0/eX3B8tiXnOQd5PgjCS8+1xKOc8vcnRiP1apcbyA1MkkNMRY9z73y79cYrP9uxnuClCeO/t6PiGvW3H8LV4q0QtZadDR4whR2aW93teg==
Received: from DM5PR06MB2537.namprd06.prod.outlook.com (2603:10b6:3:53::19) by
 BN7PR06MB3876.namprd06.prod.outlook.com (2603:10b6:406:8d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.19; Mon, 12 Sep 2022 11:21:38 +0000
Received: from DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480]) by DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480%9]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 11:21:38 +0000
From: Heecheol Yang <heecheol.yang@outlook.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Heecheol Yang <heecheol.yang@outlook.com>
Subject: [PATCH 4/8] hw/gpio/avr_gpio: Simplify avr_gpio_write_port using
 extract32()
Date: Mon, 12 Sep 2022 20:21:02 +0900
Message-ID: <DM5PR06MB2537F70C72B1BBA628DCD62CE6449@DM5PR06MB2537.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912112106.49110-1-heecheol.yang@outlook.com>
References: <20220912112106.49110-1-heecheol.yang@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [AZhil88ylAlWMRHYFm8VvIfWJ/dxx9HD]
X-ClientProxiedBy: SL2PR04CA0022.apcprd04.prod.outlook.com
 (2603:1096:100:2d::34) To DM5PR06MB2537.namprd06.prod.outlook.com
 (2603:10b6:3:53::19)
X-Microsoft-Original-Message-ID: <20220912112106.49110-4-heecheol.yang@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR06MB2537:EE_|BN7PR06MB3876:EE_
X-MS-Office365-Filtering-Correlation-Id: 9682c184-120b-429d-8009-08da94b0f58e
X-MS-Exchange-SLBlob-MailProps: AZnQBsB9Xmqxq1ifAc9vd1hrDdkf/Zi2a6IIQGjhfdfYlpGBX9OOP8ADg1Am7PCnTsy2v4XS2g7EPRiHV3bc6BLdqsIgRmL9X5bsk7myO/jA9kwYT9q1/0WTTtRwJE7KgR8qBWYaG3UYeApCVJXzjK4nNrpzH4I28+1oapzz5T6ven4qYPU7SnF7GYTtNPYgkkTG0CBhHHrs3hc9HR45IX/e7lUXpBWz7T7hflQnVxVpFWRRmesVgM2uQV0azmlEFldhQMulIq5ueGythj32lAdOgj5Sbxk+Kp51pYv0dLHcX94X2Ae1GIFgJfyXygUqBQDtgDTFpKtvP06Wrh09uVwA9tRT+ulB531O4QmxvcDgJLs83fL99zkoUvRdZ0NsESL2tREPSuUqKdw9HpWCR1YlWE7OAdB8x1yKjDTsWmqezKIPubu3yWzIRemz2EYg5fiD06h2JIx4A3UoS0AZ1QlZk/+5pvOokWZGMSLZDeF/jOwnIKakEY3c11EhAyjuMo5tMmYDi+KtJ8g6GHMlY4KXfubvHSslGIAwdiP3Xx1VUjepyt4Lco4IT7kp0VCJqMR2LGOpf7fgwLDfTTnEU8ZrZ3+WmwIH+unwQsvQnAQewHxeUzaupazwihsnNeghJJsmJ2t7vR+Zky9k4VO8yQUi5ZsSBeBOOHuq/Cy68OSO2El/250Ano52vjHUVqJKkSc45SAgpjBN6vhoRdWlTmuThY1gKQ8T6pyqDpKLTosABD57RjTTXbJBOpRQMhujksXg+nUUPd8=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DbplEV6D3qXUWCe9Hhvvu32FSJyIRaZc1PPsCCuL/oV9nLiF5PS/yeXDDZ2CBoMiv+ymAcBKdJ7yaETijYjEKN33mY+68zlVF1BsuojhJCS3vgEBgPqJ7lX9NMv/WMPCbqJgD3iIJtq/r2TITf4emv0A6nf2V2NCYP1zvpQhASK3+W9mzTQikLEcir5/ZbYWy2SPWalrNdE7gCISqGi38ik1HqPnvpPJ8HHu8c0n/wEhXtqXwmL9fTHBuybE6rlX7mzxJkQbpajmBTFDQGJAnee/7IcosMsa1biwRG3xeUUm30uHs3mo9KtGSv+ZhEJLg9veNnodo2nxSKhEgNydy8uRpPFKzhJ+UKBJlbLWKG+R/VAmqroNPzgm13VAko8cXmU+yB2vzdB4gl8K1RHSbcUna5+AnOFSjTB1YKtYrFz3HGUKsd+ttxsyMNo07a96b/hCBSzz2a5DAmuE3z5mdGM0aytajxW+60JOLKCyf/KGTafM4+Jjiq1OP2CEMIpAsCMK5ZqIYRmrlBj9vsu5SjSJpeRNYZqfyoo3T+zsyaOjmn6LJGteRNej/Udglg86RtPuP9nze7AytelffTFfwzgU9DFgxh4lI3QL2/vKXIJjbeaF/6tsZV3jFjtg+wcT
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTJKTnRYM1gyTHY3cXViODhrdk5DOVNhUlEzTkpaSm1Pd084am1TN25iQXBa?=
 =?utf-8?B?Q2hBdDdiNnlmQ3MwQ3VYWWlwNUUzdFpBU2RCeHpzaE43R0VoTEVBYmFvOGZI?=
 =?utf-8?B?d3RmTm9kS0lXS01WY3RwMVhXT0RmMjRIV3N2UkhSR3JmTkxUSjNCVlEzMzNX?=
 =?utf-8?B?V2xnem1JaHlCcVYxb2FNVFFpdDJEUmpFWDMrT1kvMk5aMmhpMG8vdXA4K2gr?=
 =?utf-8?B?VlJaTHJnUG1iY3V6bHIveUsza0xzZDE2N2VDOFJKa3JqMVhmWFRhaUI4eU9H?=
 =?utf-8?B?RHZBaTlzVTZkWkZUMlY5dmFjUEZ5VnRYTHcrTDZqbXBlMWtZakhnaWkrK2V1?=
 =?utf-8?B?WmFRZTBQYjM2d3cyQ2swNlBEdjBRdmV2MXl4Mjgvc1o5UGxyRXFWVW43VUZJ?=
 =?utf-8?B?a21tV0xqN2pxanJyZUt0ZnlsMXNvRmZZVHEwSnhoejJOaTZWVDJ1emc4RDhH?=
 =?utf-8?B?Q2ltcTFoSEoxcC95N1JrN1ZSbXFJQnpGbnNtSHlleW51MkJxYlZCUHdDNzR3?=
 =?utf-8?B?YlBKdEhreU9lQWMzamo4YzZkNk9HS2ZieGp5a3prUngrYTFSN1JtQmlDNWNW?=
 =?utf-8?B?UWNGM3lnemFBWlRWekw5THNxWitsQS90SEY2ZWRCMTVlcFlkc3BLeWtla1Qw?=
 =?utf-8?B?NnFxc09Sb1k3TC93cTFHTWNla2M0akdkS0F3RnNSRDhMdjdkTHA3QVljL3JT?=
 =?utf-8?B?UzBXU3ZYVzhxTTBjMHBva3J1U0w1bXBCZTVuU1VNZVUyNzZyWGdYdE4yc3NT?=
 =?utf-8?B?c0FBRGRBd3dITEY3NGZ3L2NaK2ppMm1vT2hjOVlraTVNUmNQcTdSanVZbWd5?=
 =?utf-8?B?ZlNSekZQdmovTWpxQmlyN2gyanBGeHA1OXdDaEJ1YWJMSGxuQy9kY1dzOU1E?=
 =?utf-8?B?V2hnTDNPb0ZQd3Z0T0xINVA3MHlrS1RRaUczaFlNemlBUHdOeUJEMndRRGN4?=
 =?utf-8?B?UHVQZmU2WWtMTmNHRkh4cTdkS3ZmSm1FRG1RU29kamlVdTUwdnZ6Z3NMZ1dV?=
 =?utf-8?B?Tk02UjZQRzJvOXQwc0pyc2IyODJXTlRyYkFRRGRwL1M5YkJucExzN25ncTVC?=
 =?utf-8?B?aklOZXZmL09oYVhHYWU3cEtZS1ZHOHdDVFZiMkdGOEk4T1k5Z1g0RUh3dDhj?=
 =?utf-8?B?VnZzWnNCSmkxVkJVSGJSN2N6LzNPMEdDZlJNRGxacTdZWWQ0SGZaa3I3bWlV?=
 =?utf-8?B?UXJ3VnpIenBORE1HZU53VjZla3Fqc012Rkx6ZXYvRmdwU2ROdUhmWWJsNmdY?=
 =?utf-8?B?MThYYW13a2g1UVlnUzlzN0k2V0JTb0hJODlxTGQ1SWpiSWF1ODBsY2NlM3dZ?=
 =?utf-8?B?V3d2YnZOY3RYQXlMRk03a25nK2s3YW5VakhMNG5lakwzZ3lyaHhKT0lkSzhV?=
 =?utf-8?B?QkIyMWMxZVQvQnNVeVFGeTZVYTlXQmZJOTY1MnhvSklXTnZ3NFBROWR2aVVH?=
 =?utf-8?B?SHByb3JjZlNkc1lhdlAxczNKdDNrOGdINnVmcXRqd1NNcC9GNDdnYURwcjJL?=
 =?utf-8?B?T0hUcG5xRzdkT2FPUmxnbDFhczEwWFdCeUpmMVdUaU5mZDV4L0VQZG9oTlZN?=
 =?utf-8?B?RDdlUXR5RnpUTW5KbHF6aUQ4RXc3OTlKdWZ5SjhUN0lrZEYra3hFODBrdlhz?=
 =?utf-8?B?eENJV1dGWmtJRnpPSkpNQlJJVHI0V0M3NFloUzllSDZyNHFvTFJPVjJLUGIz?=
 =?utf-8?B?aE4ya0NpU1NqenFRM2hzSXNEYnNxZWhLeTZ6WU84YkJZWUpsWFR1TUdzYlZn?=
 =?utf-8?Q?NOvcuQgnwit5GXEqcw=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9682c184-120b-429d-8009-08da94b0f58e
X-MS-Exchange-CrossTenant-AuthSource: DM5PR06MB2537.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 11:21:38.5164 (UTC)
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
Message-Id: <20210313165445.2113938-7-f4bug@amsat.org>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Signed-off-by: Heecheol Yang <heecheol.yang@outlook.com>
---
 hw/gpio/avr_gpio.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c
index 3db55bfa77..e4c7122e62 100644
--- a/hw/gpio/avr_gpio.c
+++ b/hw/gpio/avr_gpio.c
@@ -39,20 +39,15 @@ static void avr_gpio_reset(DeviceState *dev)
 static void avr_gpio_write_port(AVRGPIOState *s, uint64_t value)
 {
     uint8_t pin;
-    uint8_t cur_port_val = s->reg.port;
-    uint8_t cur_ddr_val = s->reg.ddr;
 
     for (pin = 0u; pin < AVR_GPIO_COUNT ; pin++) {
-        uint8_t cur_port_pin_val = cur_port_val & 0x01u;
-        uint8_t cur_ddr_pin_val = cur_ddr_val & 0x01u;
-        uint8_t new_port_pin_val = value & 0x01u;
+        uint8_t cur_port_pin_val = extract32(s->reg.port, pin, 1);
+        uint8_t cur_ddr_pin_val = extract32(s->reg.ddr, pin, 1);
+        uint8_t new_port_pin_val = extract32(value, pin, 1);
 
         if (cur_ddr_pin_val && (cur_port_pin_val != new_port_pin_val)) {
             qemu_set_irq(s->out[pin], new_port_pin_val);
         }
-        cur_port_val >>= 1u;
-        cur_ddr_val >>= 1u;
-        value >>= 1u;
     }
     s->reg.port = value & s->reg.ddr;
 }
-- 
2.34.1


