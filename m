Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0984F52D305
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 14:51:44 +0200 (CEST)
Received: from localhost ([::1]:57730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrfd1-0003HO-4q
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 08:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nrfQT-0006Aw-FF
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:38:45 -0400
Received: from mail-tycjpn01on20708.outbound.protection.outlook.com
 ([2a01:111:f403:7010::708]:60716
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nrfQQ-00058Y-Aw
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:38:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8+oYkqQ1jIjKcQKCBDdTYGCwWYmcQ4G6c49Q4UcKrMANanjynhevqVKNiaIfh7K1jmES4wNCDWpMFMa8ZXT7ryzO2KMuwNtZGq3Ri27B3SKP9rNqQjSBuixKY9766T006+5YcecDyqJOvZ1eGJX6bATTj5L5waAM8oTrHktqEYPXZ/jwJEpXt+gEmh6XR79n8Rl9M2tcqmYqzQcV2iW8W6yp0rtgosKIKqzfzGp/kQe9AvRXdh68NHUAM+SQJx+moCt2LdA6hzRYHXBYarK1pJA5D60HzKYRmSbbHqun55SI2F+Pc0C6smCYv4OcEk8UL6daP1fL/17zgmobwdxOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIUCUuY2Lh3MTCQEfkNzPB9zDFOZpY6Y7IexX1kQCY8=;
 b=fLOYyix9mzxZxPY0rgooSSXRMmNdyqFZK04wuXvz7ZmeogLwNVaPJcP9yUp68hVH2j7J3GC+LeYdcfMNZDH6yG9AUljhDeS4jYWn7UEMATNTv2KsUbyXyeeHDT8iF+9tzHwJljtBPfIF5q3bUT46JVEvUG1A+zGpsnHiU47H/R5draILL1akppW27TH4piPHxd47SvWzsJZYzdAX4QIkvp6csbr14Bvy+mPwhoxnLAf50oQzi9z9KsI6zzJVrff1mwhXsjV65Pw8URbB+lo7OAMJkbyQPT8GCsPWaQQAQmSzdF/WQTyA2V6gibXWADyuCtMPos511ekCjSOFmtwdJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIUCUuY2Lh3MTCQEfkNzPB9zDFOZpY6Y7IexX1kQCY8=;
 b=SvqIvg9m45fdihRMohVGMjbiCPBM6RC8QQ6BpSz4Zs4o2Ql4aIOJmUeTI7IosAV3cJmRX1e/RxgDphsho5xa2TVjrmstVY0hileHhRzOYa/x9QNVsAAd3ulfYArDCV1k5AjmP2V/acdHrd/nU7fbrpKLXIIpg/X73e5eLF5vmlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYCP286MB0941.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:9e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Thu, 19 May 2022 12:38:38 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::bd99:5c83:e2dc:a8f7]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::bd99:5c83:e2dc:a8f7%7]) with mapi id 15.20.5273.015; Thu, 19 May 2022
 12:38:38 +0000
Date: Thu, 19 May 2022 20:38:30 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, contact@canokeys.org
Subject: [PATCH v5 2/6] hw/usb/canokey: Add trace events
Message-ID: <YoY6RoDKQIxSkFwL@Sun>
References: <YoY5k0PQny8WtAHi@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoY5k0PQny8WtAHi@Sun>
X-Operating-System: Linux Sun 5.15.26 
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BYAPR02CA0037.namprd02.prod.outlook.com
 (2603:10b6:a03:54::14) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f8c9c44-34c7-4e0a-c3dc-08da39947f24
X-MS-TrafficTypeDiagnostic: TYCP286MB0941:EE_
X-Microsoft-Antispam-PRVS: <TYCP286MB0941FF65B6049432DB37D27CBCD09@TYCP286MB0941.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 12ZCZI4WXSTEnC5WlIhC/pjNbiW4zHLYpDLOCk6zfnsDKwRLYjZtaZjPrAApQ+0rKmA3azHSjS/89yno6OyExR+kd3ev872hxmQ4tzH3CodjeQQvjIMFrfcmetdmKq95LLK6M5mE7kAdVYC2QJ95XDmA1e+YdIC9h2wZyqHqTMN1ZJQg7EKyi0/j8v6yTP/Q9ZRQdnS6yVZba8Lss1N9WCPifjvQ/BwupXRh7YsQTOjbTyXPFvBrDcDEuC9ssckeQcioH3Py5pKaVsr/3oJ1hEiyg7WBMzsdMxxDDf67XOi/wyd7nUSRqM7M+uHN5wtG0fiuUff0EbhsvwZcPqWamoXQLiE3hVz35gE8RZOIB2fXe118pNaRx9CZcoMfoo9OJad8CHAYIa4jSdPGFdRcjHXWKraYT0wvsDTMsA9w1rbn7TAc6NyMjNDBbotkbcxMfVc8CRGC1es0ffCvHNTsyv7zTJ/YyOb//So7d6a8qizS69F2uPM4yeVZ3ei+rGPPsD0oPdOMONYyc7mFcidgKOknSmwrTOG5wBBP4Zt6srmNfHTZgCdff4FYKV4lN2ICA9pgyL70y009y4W0wx+p8uR8AjoiY6HYyCQYx6vw6hcsm1RrQ8+H886fy+ywSy+FudiTUEYB5okKxk/BvGjpQ/LxebSI4ws1D7i8xdzNR+YNWk+h6QeA4SYDCp/1hS8KE3RDf43KV6YVdOmCnjCNkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(136003)(396003)(39830400003)(346002)(376002)(33716001)(2906002)(41300700001)(8676002)(508600001)(38100700002)(110136005)(4326008)(41320700001)(6486002)(316002)(786003)(6666004)(83380400001)(52116002)(9686003)(6512007)(6506007)(5660300002)(66476007)(66946007)(66556008)(8936002)(86362001)(186003)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6aN9PNs/NfOPv7U+XIOqv4UT7fRx+IiyROY/SFgpYt1842kmQvPbHz5sdZeU?=
 =?us-ascii?Q?OaYIrmdQIF2y1U+fYA2CBI8Iztg4c/yKM7+IXOK0mrGvfE1bOO9rjAVOqL6u?=
 =?us-ascii?Q?j5M8E5vHlTvPmqmjwCPR3J8K0KAVjnc3C1Y9MmXkJF1zr9Xg82R9Aki0Nr8z?=
 =?us-ascii?Q?kd7/igFtX33MX1T/GBt9H5danKNe/kI3ZfO2bPxyxEmFPf6ZwNU/lLSdwoeI?=
 =?us-ascii?Q?X0yOys3T9luVhw9jJHiWzyX+18rNOOeNhGOBHA6FkuHHksbFHkAtqVOvIqzO?=
 =?us-ascii?Q?eMFNR9N3NvhWVGv5tSVzQu46CtacW1X5IblvwyGoHZc7KIJ1KD2kPDQNfKxq?=
 =?us-ascii?Q?vAcyT/L42XQsRluFu0g4mRYVJdSmTLUgwcJUt00A9YTRV9Ki0Sjf10IufbAL?=
 =?us-ascii?Q?78cG+MlR04e9PjpKy3wJoYIiAN1bMDqZkSeMQVxJz8gDD7wFqdY0SP4eQ+xY?=
 =?us-ascii?Q?6NsXTS2MZL4+Zt6fPlgEsQMPQH5ZZx7ci7GCk+i9o0tCfMqBQg9TeHL7qffp?=
 =?us-ascii?Q?pMYC5Azvtor35cGihW86sP9BhQB9C5XkdZHxcLKgKzRtjKXw0QUZEjOb0Uwf?=
 =?us-ascii?Q?r0Lf+aqciBLxhbpP1tFYnYkstk2pxxqMJf+kPhdVZR8JpiwyDdoIy+/AjCwL?=
 =?us-ascii?Q?dxAO6Mpc1AFc3mY+kuGuV+Pwu3tVlvDy7xw0t6zlupRWVjshBBcsAvZtN3Ef?=
 =?us-ascii?Q?i9hoiiY0fLJJlJnVEVWcxvmTAq/5nxVh8A0OsJaTT7Zg/M+BlI7ArRXuc7uD?=
 =?us-ascii?Q?roTzvjb8ziF+U1mIhacVFKHsl/D1fRoUWfoKduhvbsfAXuF0n9oeBq1ioBcP?=
 =?us-ascii?Q?qnLWQp37610GxekrM2+DBh3yAj/Dm4dArpRkTAsHAIGwJtG+Xk0Ob8Hj0sF7?=
 =?us-ascii?Q?Y89QVyDS+UouTi7d6NbWzWQx/h0qg7uxA1UHLdSWqkfMc6ZxxeRdYPz3daXg?=
 =?us-ascii?Q?oP0OGxFdkUrPsJDgNwUOEyM1zLRDMlj3gewwloIervvkDOaUv4MWbiVjJGDJ?=
 =?us-ascii?Q?HlBt7ijPDq9ORhdBhzAlKy/wy59WlRh6SxERnt+AaeJhi6i3T6O9VfYaX2tr?=
 =?us-ascii?Q?XSdfwa/z1h3qA09WtUD7y5nk1GQE6iCxoIsByg5fI1ac/ggxLy+L/pM46lhz?=
 =?us-ascii?Q?JIR9XUlPYlu5e9mL0oXFlI6rNS3/YjSqsbmo7ni007TcHV9VhqPx8RPPH1e3?=
 =?us-ascii?Q?k/OeyttF9vEgCgZ4MiQe7Zy1YodviO6ggYrrm/bXZ8xGT5mFgNJW8825VDKb?=
 =?us-ascii?Q?JYJ9D+krh3hxFYGqCaYYgfpx1V/wKQPU7QTNMNXeCXXYC3kOJcVHSSTA9X2n?=
 =?us-ascii?Q?liXcOVC/D7+MRlcpOijqyxrbSAY3f3uJrFKoWceyWs8n1Ff12hQELs3OyELE?=
 =?us-ascii?Q?vfYG0g/IaPufvnZcjD4ZOfR/0JFmgGq53rLBvdr8KtUFPxKtKKvVr/dTMjBQ?=
 =?us-ascii?Q?A34HYS1yonF3q0068vzjGNJz09GyxdUL4kSHjy1+E8dp8yio81G5zazphnj1?=
 =?us-ascii?Q?BsQO58SuDcDt85UleYjXnMJXwsZx26q8IwKmBboNEy21P1k3ZnYrt68piXJQ?=
 =?us-ascii?Q?v/zf8OLhiKzi/Nda8ne/IzgMdBG+NJ4xQxMq5wAdbmyC4sXy6MkFwgxfaI7X?=
 =?us-ascii?Q?NXIlpFLjTYuGUwUV6x0Mkz+HESdAT2ew4HQAkH/VyiIfB0dpE+7JkfY0RH44?=
 =?us-ascii?Q?gf0L1cawWLHfIAbVOHX3udKMUOFYCEqyJ+LQODoiB18PG4z+ErXAl/qWj4W4?=
 =?us-ascii?Q?XHzOhyBnfw=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8c9c44-34c7-4e0a-c3dc-08da39947f24
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 12:38:38.0529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHq/7QVyYBYlK6v4uSXqCL0OPLGS+15OFpErzMqocz8aD2hSoX1lSn2XEcVfkubA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB0941
Received-SPF: pass client-ip=2a01:111:f403:7010::708;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 hw/usb/canokey.c    | 13 +++++++++++++
 hw/usb/trace-events | 16 ++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
index 6cb8b7cdb0..4a08b1cbd7 100644
--- a/hw/usb/canokey.c
+++ b/hw/usb/canokey.c
@@ -14,6 +14,7 @@
 #include "qapi/error.h"
 #include "hw/usb.h"
 #include "hw/qdev-properties.h"
+#include "trace.h"
 #include "desc.h"
 #include "canokey.h"
 
@@ -66,6 +67,7 @@ static const USBDesc desc_canokey = {
  */
 int canokey_emu_stall_ep(void *base, uint8_t ep)
 {
+    trace_canokey_emu_stall_ep(ep);
     CanoKeyState *key = base;
     uint8_t ep_in = CANOKEY_EP_IN(ep); /* INTR IN has ep 129 */
     key->ep_in_size[ep_in] = 0;
@@ -75,6 +77,7 @@ int canokey_emu_stall_ep(void *base, uint8_t ep)
 
 int canokey_emu_set_address(void *base, uint8_t addr)
 {
+    trace_canokey_emu_set_address(addr);
     CanoKeyState *key = base;
     key->dev.addr = addr;
     return 0;
@@ -83,6 +86,7 @@ int canokey_emu_set_address(void *base, uint8_t addr)
 int canokey_emu_prepare_receive(
         void *base, uint8_t ep, uint8_t *pbuf, uint16_t size)
 {
+    trace_canokey_emu_prepare_receive(ep, size);
     CanoKeyState *key = base;
     key->ep_out[ep] = pbuf;
     key->ep_out_size[ep] = size;
@@ -92,6 +96,7 @@ int canokey_emu_prepare_receive(
 int canokey_emu_transmit(
         void *base, uint8_t ep, const uint8_t *pbuf, uint16_t size)
 {
+    trace_canokey_emu_transmit(ep, size);
     CanoKeyState *key = base;
     uint8_t ep_in = CANOKEY_EP_IN(ep); /* INTR IN has ep 129 */
     memcpy(key->ep_in[ep_in] + key->ep_in_size[ep_in],
@@ -125,6 +130,7 @@ uint32_t canokey_emu_get_rx_data_size(void *base, uint8_t ep)
  */
 static void canokey_handle_reset(USBDevice *dev)
 {
+    trace_canokey_handle_reset();
     CanoKeyState *key = CANOKEY(dev);
     for (int i = 0; i != CANOKEY_EP_NUM; ++i) {
         key->ep_in_state[i] = CANOKEY_EP_IN_WAIT;
@@ -137,6 +143,7 @@ static void canokey_handle_reset(USBDevice *dev)
 static void canokey_handle_control(USBDevice *dev, USBPacket *p,
                int request, int value, int index, int length, uint8_t *data)
 {
+    trace_canokey_handle_control_setup(request, value, index, length);
     CanoKeyState *key = CANOKEY(dev);
 
     canokey_emu_setup(request, value, index, length);
@@ -144,6 +151,7 @@ static void canokey_handle_control(USBDevice *dev, USBPacket *p,
     uint32_t dir_in = request & DeviceRequest;
     if (!dir_in) {
         /* OUT */
+        trace_canokey_handle_control_out();
         if (key->ep_out[0] != NULL) {
             memcpy(key->ep_out[0], data, length);
         }
@@ -163,6 +171,7 @@ static void canokey_handle_control(USBDevice *dev, USBPacket *p,
     case CANOKEY_EP_IN_READY:
         memcpy(data, key->ep_in[0], key->ep_in_size[0]);
         p->actual_length = key->ep_in_size[0];
+        trace_canokey_handle_control_in(p->actual_length);
         /* reset state */
         key->ep_in_state[0] = CANOKEY_EP_IN_WAIT;
         key->ep_in_size[0] = 0;
@@ -182,6 +191,7 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
     uint32_t out_len;
     switch (p->pid) {
     case USB_TOKEN_OUT:
+        trace_canokey_handle_data_out(ep_out, p->iov.size);
         usb_packet_copy(p, key->ep_out_buffer[ep_out], p->iov.size);
         out_pos = 0;
         while (out_pos != p->iov.size) {
@@ -226,6 +236,7 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
                 key->ep_in_size[ep_in] = 0;
                 key->ep_in_pos[ep_in] = 0;
             }
+            trace_canokey_handle_data_in(ep_in, in_len);
             break;
         }
         break;
@@ -237,6 +248,7 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
 
 static void canokey_realize(USBDevice *base, Error **errp)
 {
+    trace_canokey_realize();
     CanoKeyState *key = CANOKEY(base);
 
     if (key->file == NULL) {
@@ -260,6 +272,7 @@ static void canokey_realize(USBDevice *base, Error **errp)
 
 static void canokey_unrealize(USBDevice *base)
 {
+    trace_canokey_unrealize();
 }
 
 static Property canokey_properties[] = {
diff --git a/hw/usb/trace-events b/hw/usb/trace-events
index 9773cb5330..914ca71668 100644
--- a/hw/usb/trace-events
+++ b/hw/usb/trace-events
@@ -345,3 +345,19 @@ usb_serial_set_baud(int bus, int addr, int baud) "dev %d:%u baud rate %d"
 usb_serial_set_data(int bus, int addr, int parity, int data, int stop) "dev %d:%u parity %c, data bits %d, stop bits %d"
 usb_serial_set_flow_control(int bus, int addr, int index) "dev %d:%u flow control %d"
 usb_serial_set_xonxoff(int bus, int addr, uint8_t xon, uint8_t xoff) "dev %d:%u xon 0x%x xoff 0x%x"
+
+# canokey.c
+canokey_emu_stall_ep(uint8_t ep) "ep %d"
+canokey_emu_set_address(uint8_t addr) "addr %d"
+canokey_emu_prepare_receive(uint8_t ep, uint16_t size) "ep %d size %d"
+canokey_emu_transmit(uint8_t ep, uint16_t size) "ep %d size %d"
+canokey_thread_start(void)
+canokey_thread_stop(void)
+canokey_handle_reset(void)
+canokey_handle_control_setup(int request, int value, int index, int length) "request 0x%04X value 0x%04X index 0x%04X length 0x%04X"
+canokey_handle_control_out(void)
+canokey_handle_control_in(int actual_len) "len %d"
+canokey_handle_data_out(uint8_t ep_out, uint32_t out_len) "ep %d len %d"
+canokey_handle_data_in(uint8_t ep_in, uint32_t in_len) "ep %d len %d"
+canokey_realize(void)
+canokey_unrealize(void)
-- 
2.35.1


