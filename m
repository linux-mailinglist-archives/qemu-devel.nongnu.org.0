Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DDE4879D7
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 16:43:36 +0100 (CET)
Received: from localhost ([::1]:45476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5rOx-0007Ts-Th
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 10:43:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n5rLQ-0004DN-Sn
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:39:58 -0500
Received: from mail-os0jpn01on2091.outbound.protection.outlook.com
 ([40.107.113.91]:24638 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n5rLO-0004Zw-4s
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:39:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jbye5Rss/viT+l312gf5xTBYEFtVKvseB4cS86z1GV3b/YCdBj+LJcj5z/rrn73sXNc6dGVtU/nEFRpH18ZRhHwyznZ2ZLf+IOJFyDgMDZAe4qjhiTlK/ujXA5dlh672IjGwPLDV8Xs8u5VMiq/qAUuZ1MLXb9QDXpZlh87wrLZobK7lBfY8BgwtomhZWf5uAiZn1b1PzRH0KTIXMooe3H5i0V0zdQllwtYT2hs6uSfLI2RZM1zNsLD3YR7Pyh2Fut2suhSfQoMsM5QGSFiaI5ddVQQu1u7pRFuzTYkRDUSMQqtx7msPxKitOde/2l/StC0We0yixfgjqhwGoRyauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/I7QvrESmq7TuEpKAJQgb63CLpNr1uH5y60V6ZAgIY=;
 b=OnGxJxgl1EWPnh97EaCUNKghOQjrLkOdyjLjrE2u1kBaiVexlbu226mJMqg6NbD6ySk9Yk4g9CNJKMqpxsushiUv+1DUgxr3/NuT45zC81os1vPTQ4Rmwnp3lIBrgAheFs1pVnioOvNgLmag2p6ygaic9F22dBzZ6l+b976G5wxS9m8aQ3xKkmnGM8T62AjW/f6hSIOUg8jIicB7O03SorgPKuw9W2EgU3vO6jkN1YdcsYMkzIYrOaYAc6T+3rSSV0DhAj8Sn7gFlgYEZvNUzyk6GZ8atmpuTFIhpW7rwMCkALDEW1nziBh7oqu6wK84+84qzLsltvX1b2NAMEJx3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/I7QvrESmq7TuEpKAJQgb63CLpNr1uH5y60V6ZAgIY=;
 b=QsuumYWfLGlo+pQPoQXKuLYhUCdhgj6jdJJnI2Dh6mvJ1ST/sOR6P7XS3Dcx8+7/5kA3vNXMEk6ax4UYyu+sYYl7i9K0lhs8yBxkIunQjUPQ8PtwifazUgQCHATrf9tCcP9YIlMmKI5PaJVngKyWyduPJ8PWT5gm+9jvEAOnT5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYBP286MB0432.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:801d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.10; Fri, 7 Jan 2022 15:34:48 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%7]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 15:34:48 +0000
Date: Fri, 7 Jan 2022 23:34:45 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] hw/usb: Add CanoKey Implementation
Message-ID: <YdhdlSdyL59m3Zsc@Sun>
References: <Ydhc8cTsH0QNINT/@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ydhc8cTsH0QNINT/@Sun>
X-Operating-System: Linux Sun 5.10.81
X-Mailer: Mutt 2.1.3 (2021-09-10)
X-ClientProxiedBy: HK2PR0302CA0023.apcprd03.prod.outlook.com
 (2603:1096:202::33) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69b766ed-a772-4551-77f5-08d9d1f33ce9
X-MS-TrafficTypeDiagnostic: TYBP286MB0432:EE_
X-Microsoft-Antispam-PRVS: <TYBP286MB04320C88BA08C12D4AA82E1CBC4D9@TYBP286MB0432.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 47i7Uj4Nb8ymgy6jliEQr/PYq5+zlfW0pHu950tGjZkI6Ghx9Igwxlw7VWRsFofeJcr+pVknG1bGe5YiRfmB/7iKlS0JjjU6eyEkT5LvczysLQtNTHlRQyCVCODOFDHs6ZZc/OrB9qHtHzjKlIy1Z+4b04YxXKB5ImvLJ9Rqs/21jn0wxA2KIPphazQzIpAIWGpMnknurP/EyMXOPugdASSwtfP2wgmUzXNekObAF3FwqGf4u9hvjl/DrKC/53iWCYuTThWyRhyM+1owS/bF0Gbpb/QRM33oWmaf5G3Vg9FGa3ZlEAb2KLC6u4PbjJbT9qkWOA4LfK4z1zcmOlfhw9KkbMY5u5U+msxZqcrSisfJJntTDIM0FcHBmYF5uqMi8kWfpRtF/70wYPyZTo/XYkTN0If/mcEbOFBZyyw06viJUjH8O/1NkY8dmgdEKjStAfQKf/3Tdsfh31OvEaB4qPSTTMg5RHM2lQ0JiqmUSpepLUytrOVy5Yf83SfgGIh7qBNRm2+ObH9eix2m5gSqO6MpqA/+pZoCF3nCYFqiPzMJ8vXxTfa+3d2Qk2x0P8OZfXIhpCNkd503IUn4BLFvEWma1C7d+seP8PrHhP+JQInsMLXCx8ZtEhHsuGSX8LfpADywzqnK4RAxOYnRbdTBWuF/omlb2erR1fgQjMviyJrmDx61qyULQC/7v0EmmiN3GiXmtHNljHLQfI5cKUS5j3x0DAhRhNc2OZCmGzwxV/blVeh6x6mczqXLt1i5vJUJPkxITsh1CiagUW+8yTXDjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(39830400003)(376002)(136003)(396003)(346002)(366004)(4326008)(6666004)(6916009)(66946007)(9686003)(33716001)(86362001)(2906002)(6486002)(54906003)(786003)(6512007)(316002)(5660300002)(30864003)(38100700002)(83380400001)(66476007)(66556008)(186003)(8936002)(52116002)(508600001)(8676002)(6506007)(966005)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ICA5GYD36HMb5cQZTUJQ5EKcC+5yizT9lPbTInri0DHd6U1pmrghy5sOeYwW?=
 =?us-ascii?Q?PK7M4rloF1t8BxG6o33ZnwM4ksbEOs4ciRpkmaUNSjzb22rvYvLuTFWBUy1J?=
 =?us-ascii?Q?ulmJbuMpvpz2AwGm/l9C9nDPNwPWbznUfvxX/rhEt8j67gCei1eHVVbkeSto?=
 =?us-ascii?Q?kq+PeqzPviSQJKuzYQVd/gIq7msUybLaT8UqNZp9fJH3kAC31FALYKx53Bw6?=
 =?us-ascii?Q?BV26b2OHW6Xt4Q22iJieL63Tz22cPDgofmpvmE88aICuvpgfa/1oWEcPw5zP?=
 =?us-ascii?Q?6YLTIZSw9EmDHB8WPaol+4j7ggHM/FxOTv062uGtnAyp3D4vL5Sr0GjTIy8s?=
 =?us-ascii?Q?m34YUfd6WY//5TW/VyPLUb7piga/pDReeshuO4ucCEv0VGtKtvaIGTWZX07t?=
 =?us-ascii?Q?3ylHStKLryXDX7Aej6y+DKF8ekrbxcE97Hio2CPAp1rH6sSDhuQx9emGd/Ps?=
 =?us-ascii?Q?Girqq4i9Zq7yGHRClAD39hKMAu55yLWSqAvq7C66LGAsvoJm4nY7YMUn2Un3?=
 =?us-ascii?Q?A2tNlCSBc9ENnFXUQpoeMKjGuv2Gf8V5eETbw6gLvt5MA5NdWMN/xyJPZOmY?=
 =?us-ascii?Q?9Ob80OgnNuZVKbnLF5SRa26LEv+URwYmIB6gv9WRLIBPs7yvLaqttDRjjdYj?=
 =?us-ascii?Q?WI3W/j1rHjosGuPmpMg9Ez4gtFDTr9Iu8zDDGlask5TgAyaKUO4RJNsrkrZr?=
 =?us-ascii?Q?CXH0rh7bFSEZPxsG9u/Js15J0QPPsSAzWtOvwx3njD7Pv3xWWMe5A9KwB4Tw?=
 =?us-ascii?Q?l8/iw1gHyugf3weys61NY+hlQ1WwGCPjO7mAbUqUPBVf5a8x8ZTyQkebNYuu?=
 =?us-ascii?Q?k0jdJ0FeBkiACYiiXPPcKKJlr2JsbnpIYw5g61P5g1EdWbw8cdiQ4T6lvXwZ?=
 =?us-ascii?Q?e6DiaelLguzp42+O/P06qZbUN1cXrycuzvsuUe3LGQ5SxxMvVASkoROj0Fn+?=
 =?us-ascii?Q?vT4JI6e1XOi78pgan+zv4rRCUj7T+hQrpoJMuzdA78GIN29IS4hHcxztfmAB?=
 =?us-ascii?Q?X7GWwIBBNSLFZBiBBoHvIypZbH//CimOR/FzcpboV7rNUw8vqBfHVr02QVQH?=
 =?us-ascii?Q?HgDz28B2a81xs7/GkSGCxxBFaJpfSngdke/TzRPZS6oV8k+vkYfs36oNkxwr?=
 =?us-ascii?Q?sQ1XQACsczFPUeF6CajC2DWpdr8nQ9JGJnK7hb7IBBjqvUPSPDy7AEANgjKo?=
 =?us-ascii?Q?8+g0OViFrvZ4RWQLgEzts8A9KiYW4MzAtdrK5X2kT8GDBuVp+PVh1GcYRi5u?=
 =?us-ascii?Q?iZSYrY98jBagxFdYK8QUmjfitJfd9rXV/7mZiDODQGrZ85xE28CkJKynoCgf?=
 =?us-ascii?Q?ukAbzqKapoUQcIAteXzvrXLz9tYsw8kS3zvhVdn5GwC3koxIiPmKKfsuV2El?=
 =?us-ascii?Q?bn38aBANcmyf/bNbMu20xbyhMzsrmlCBWqYLik0l0ccQxTpyJgJtauLkN0mZ?=
 =?us-ascii?Q?4yb6nbdGeF5NN6UIVrA0JEfcO/uy7t83BQhqjCyd/w8KXToynVI0mQ5fgun2?=
 =?us-ascii?Q?8J0+FUBg0I5meCMQcbXnY83ubKp5grcM7vQeU9iKOnNrWOpqwFij2q5V/p08?=
 =?us-ascii?Q?Eeu7wsw/I8mnsU/uTGpPhBXzKeENmOJFk+O+NhKP?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b766ed-a772-4551-77f5-08d9d1f33ce9
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 15:34:48.0247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PkaKeWrQEQQW3D1UbfZ+IfQ4mzzmz6q5ncrZYb9KTg1XpR/42zSkXiYcW4K2Mk/F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0432
Received-SPF: pass client-ip=40.107.113.91; envelope-from=i@zenithal.me;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit added a new emulated device called CanoKey to QEMU.

CanoKey implements platform independent features in canokey-core
https://github.com/canokeys/canokey-core, and leaves the USB implementation
to the platform.

In this commit the USB part was implemented in QEMU using QEMU's USB APIs,
therefore the emulated CanoKey can communicate with the guest OS using USB.

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 hw/usb/canokey.c | 326 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/usb/canokey.h |  60 +++++++++
 2 files changed, 386 insertions(+)
 create mode 100644 hw/usb/canokey.c
 create mode 100644 hw/usb/canokey.h

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
new file mode 100644
index 0000000000..6bd4dedfd2
--- /dev/null
+++ b/hw/usb/canokey.c
@@ -0,0 +1,326 @@
+/*
+ * CanoKey QEMU device implementation.
+ *
+ * Copyright (c) 2021-2022 Canokeys.org <contact@canokeys.org>
+ * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
+ *
+ * This code is licensed under the Apache-2.0.
+ */
+
+#include "qemu/osdep.h"
+#include <canokey-qemu.h>
+
+#include "qemu/module.h"
+#include "qemu/thread.h"
+#include "qemu/main-loop.h"
+#include "qapi/error.h"
+#include "hw/usb.h"
+#include "hw/qdev-properties.h"
+#include "desc.h"
+#include "canokey.h"
+
+#define CANOKEY_EP_IN(ep) ((ep) & 0x7F)
+
+#define CANOKEY_VENDOR_NUM     0x20a0
+#define CANOKEY_PRODUCT_NUM    0x42d2
+
+/*
+ * placeholder, canokey-qemu implements its own usb desc
+ * Namely we do not use usb_desc_handle_contorl
+ */
+enum {
+    STR_MANUFACTURER = 1,
+    STR_PRODUCT,
+    STR_SERIALNUMBER
+};
+
+static const USBDescStrings desc_strings = {
+    [STR_MANUFACTURER]     = "canokeys.org",
+    [STR_PRODUCT]          = "CanoKey QEMU",
+    [STR_SERIALNUMBER]     = "0"
+};
+
+static const USBDescDevice desc_device_canokey = {
+    .bcdUSB                        = 0x0,
+    .bMaxPacketSize0               = 16,
+    .bNumConfigurations            = 0,
+    .confs = NULL,
+};
+
+static const USBDesc desc_canokey = {
+    .id = {
+        .idVendor          = CANOKEY_VENDOR_NUM,
+        .idProduct         = CANOKEY_PRODUCT_NUM,
+        .bcdDevice         = 0x0100,
+        .iManufacturer     = STR_MANUFACTURER,
+        .iProduct          = STR_PRODUCT,
+        .iSerialNumber     = STR_SERIALNUMBER,
+    },
+    .full = &desc_device_canokey,
+    .str  = desc_strings,
+};
+
+
+/* Implement canokey-qemu functions */
+int canokey_emu_stall_ep(void *base, uint8_t ep)
+{
+    CanoKeyState *key = base;
+    uint8_t ep_in = CANOKEY_EP_IN(ep); /* INTR IN has ep 129 */
+    qemu_mutex_lock(&key->ep_in_mutex[ep_in]);
+    key->ep_in_size[ep_in] = 0;
+    key->ep_in_status[ep_in] = CANOKEY_EP_IN_STALL;
+    qemu_mutex_unlock(&key->ep_in_mutex[ep_in]);
+    return 0;
+}
+
+int canokey_emu_set_address(void *base, uint8_t addr)
+{
+    CanoKeyState *key = base;
+    key->dev.addr = addr;
+    return 0;
+}
+
+int canokey_emu_prepare_receive(
+        void *base, uint8_t ep, uint8_t *pbuf, uint16_t size)
+{
+    CanoKeyState *key = base;
+    /*
+     * No mutex here because it is usually called by
+     * canokey_emu_data_out (qemu thread), which already has mutex
+     */
+    key->ep_out[ep] = pbuf;
+    key->ep_out_size[ep] = size;
+    return 0;
+}
+
+int canokey_emu_transmit(
+        void *base, uint8_t ep, const uint8_t *pbuf, uint16_t size)
+{
+    CanoKeyState *key = base;
+    uint8_t ep_in = CANOKEY_EP_IN(ep); /* INTR IN has ep 129 */
+    qemu_mutex_lock(&key->ep_in_mutex[ep_in]);
+    memcpy(key->ep_in[ep_in], pbuf, size);
+    key->ep_in_size[ep_in] = size;
+    key->ep_in_status[ep_in] = CANOKEY_EP_IN_READY;
+    qemu_mutex_unlock(&key->ep_in_mutex[ep_in]);
+    return 0;
+}
+
+uint32_t canokey_emu_get_rx_data_size(void *base, uint8_t ep)
+{
+    CanoKeyState *key = base;
+    return key->ep_out_size[ep];
+}
+
+static void *canokey_thread(void *arg)
+{
+    CanoKeyState *key = arg;
+
+    while (true) {
+        /* Wait signal */
+        qemu_mutex_lock(&key->key_mutex);
+        qemu_cond_wait(&key->key_cond, &key->key_mutex);
+        qemu_mutex_unlock(&key->key_mutex);
+
+        /* Exit thread check */
+        if (key->stop_thread) {
+            key->stop_thread = false;
+            break;
+        }
+
+        canokey_emu_device_loop();
+    }
+    return NULL;
+}
+
+static void canokey_handle_reset(USBDevice *dev)
+{
+    CanoKeyState *key = CANOKEY(dev);
+    for (int i = 0; i != CANOKEY_EP_NUM; ++i) {
+        key->ep_in_status[i] = CANOKEY_EP_IN_WAIT;
+        key->ep_in_pos[i] = 0;
+    }
+    canokey_emu_reset();
+}
+
+static void canokey_handle_control(USBDevice *dev, USBPacket *p,
+               int request, int value, int index, int length, uint8_t *data)
+{
+    CanoKeyState *key = CANOKEY(dev);
+
+    canokey_emu_setup(request, value, index, length);
+    qemu_cond_signal(&key->key_cond);
+
+    uint8_t ep_in = CANOKEY_EP_IN(p->ep->nr);
+    uint32_t dir_in = request & DeviceRequest;
+    if (!dir_in) {
+        /* OUT */
+        qemu_mutex_lock(&key->key_mutex);
+        if (key->ep_out[0] != NULL) {
+            memcpy(key->ep_out[0], data, length);
+        }
+        canokey_emu_data_out(p->ep->nr, data);
+        qemu_cond_signal(&key->key_cond);
+        qemu_mutex_unlock(&key->key_mutex);
+    }
+
+    /* IN */
+    qemu_mutex_lock(&key->ep_in_mutex[ep_in]);
+    if (key->ep_in_status[ep_in] == CANOKEY_EP_IN_WAIT) {
+        p->status = USB_RET_NAK;
+        qemu_mutex_unlock(&key->ep_in_mutex[ep_in]);
+        return;
+    }
+    if (key->ep_in_status[ep_in] == CANOKEY_EP_IN_STALL) {
+        p->status = USB_RET_STALL;
+    }
+    key->ep_in_status[ep_in] = CANOKEY_EP_IN_WAIT;
+    memcpy(data, key->ep_in[ep_in], key->ep_in_size[ep_in]);
+    p->actual_length = key->ep_in_size[ep_in];
+
+    qemu_mutex_unlock(&key->ep_in_mutex[ep_in]);
+}
+
+static void canokey_handle_data(USBDevice *dev, USBPacket *p)
+{
+    CanoKeyState *key = CANOKEY(dev);
+
+    uint8_t ep_in = CANOKEY_EP_IN(p->ep->nr);
+    uint8_t ep_out = p->ep->nr;
+    uint32_t in_len;
+    switch (p->pid) {
+    case USB_TOKEN_OUT:
+        qemu_mutex_lock(&key->key_mutex);
+        if (p->iov.size > key->ep_out_size[ep_out]) {
+            /* unlikely we will reach here, but check still needed */
+            p->status = USB_RET_NAK;
+            qemu_mutex_unlock(&key->key_mutex);
+            break;
+        }
+        usb_packet_copy(p, key->ep_out[ep_out], p->iov.size);
+        key->ep_out_size[ep_out] = p->iov.size;
+        canokey_emu_data_out(ep_out, NULL);
+        qemu_cond_signal(&key->key_cond);
+        qemu_mutex_unlock(&key->key_mutex);
+        break;
+    case USB_TOKEN_IN:
+        qemu_mutex_lock(&key->ep_in_mutex[ep_in]);
+        if (key->ep_in_pos[ep_in] == 0) {
+            canokey_emu_data_in(ep_in);
+            qemu_cond_signal(&key->key_cond);
+            if (key->ep_in_status[ep_in] == CANOKEY_EP_IN_WAIT) {
+                p->status = USB_RET_NAK;
+                qemu_mutex_unlock(&key->ep_in_mutex[ep_in]);
+                break;
+            }
+            if (key->ep_in_status[ep_in] == CANOKEY_EP_IN_STALL) {
+                p->status = USB_RET_STALL;
+            }
+            key->ep_in_status[ep_in] = CANOKEY_EP_IN_WAIT;
+
+            in_len = MIN(key->ep_in_size[ep_in], p->iov.size);
+            usb_packet_copy(p, key->ep_in[ep_in], in_len);
+            if (in_len < key->ep_in_size[ep_in]) {
+                key->ep_in_pos[ep_in] = in_len;
+            }
+        } else {
+            in_len = MIN(key->ep_in_size[ep_in] - key->ep_in_pos[ep_in],
+                        p->iov.size);
+            usb_packet_copy(p,
+                    key->ep_in[ep_in] + key->ep_in_pos[ep_in], in_len);
+            key->ep_in_pos[ep_in] += in_len;
+            if (key->ep_in_pos[ep_in] == key->ep_in_size[ep_in]) {
+                key->ep_in_pos[ep_in] = 0;
+            }
+        }
+        qemu_mutex_unlock(&key->ep_in_mutex[ep_in]);
+        break;
+    default:
+        p->status = USB_RET_STALL;
+        break;
+    }
+}
+
+static void canokey_realize(USBDevice *base, Error **errp)
+{
+    CanoKeyState *key = CANOKEY(base);
+
+    if (key->file == NULL) {
+        error_setg(errp, "You must provide file=/path/to/canokey-file");
+        return;
+    }
+
+    usb_desc_init(base);
+
+    /* Synchronization */
+    qemu_cond_init(&key->key_cond);
+    qemu_mutex_init(&key->key_mutex);
+    for (int i = 0; i != CANOKEY_EP_NUM; ++i) {
+        qemu_mutex_init(&key->ep_in_mutex[i]);
+        key->ep_in_status[i] = CANOKEY_EP_IN_WAIT;
+        key->ep_in_pos[i] = 0;
+    }
+
+    if (canokey_emu_init(key, key->file)) {
+        error_setg(errp, "canokey can not create or read %s", key->file);
+        return;
+    }
+
+    /* Thread */
+    key->stop_thread = false;
+    qemu_thread_create(&key->key_thread, "canokey", canokey_thread,
+                       key, QEMU_THREAD_JOINABLE);
+}
+
+static void canokey_unrealize(USBDevice *base)
+{
+    CanoKeyState *key = CANOKEY(base);
+
+    /* Thread */
+    key->stop_thread = true;
+    qemu_cond_signal(&key->key_cond);
+    qemu_thread_join(&key->key_thread);
+
+    /* Synchronization */
+    qemu_cond_destroy(&key->key_cond);
+    qemu_mutex_destroy(&key->key_mutex);
+    for (int i = 0; i != CANOKEY_EP_NUM; ++i) {
+        qemu_mutex_destroy(&key->ep_in_mutex[i]);
+    }
+}
+
+static Property canokey_properties[] = {
+    DEFINE_PROP_STRING("file", CanoKeyState, file),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void canokey_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    USBDeviceClass *uc = USB_DEVICE_CLASS(klass);
+
+    uc->product_desc   = "CanoKey QEMU";
+    uc->usb_desc       = &desc_canokey;
+    uc->handle_reset   = canokey_handle_reset;
+    uc->handle_control = canokey_handle_control;
+    uc->handle_data    = canokey_handle_data;
+    uc->handle_attach  = usb_desc_attach;
+    uc->realize        = canokey_realize;
+    uc->unrealize      = canokey_unrealize;
+    dc->desc           = "CanoKey QEMU";
+    device_class_set_props(dc, canokey_properties);
+}
+
+static const TypeInfo canokey_info = {
+    .name = TYPE_CANOKEY,
+    .parent = TYPE_USB_DEVICE,
+    .instance_size = sizeof(CanoKeyState),
+    .class_init = canokey_class_init
+};
+
+static void canokey_register_types(void)
+{
+    type_register_static(&canokey_info);
+}
+
+type_init(canokey_register_types)
diff --git a/hw/usb/canokey.h b/hw/usb/canokey.h
new file mode 100644
index 0000000000..d17648fff6
--- /dev/null
+++ b/hw/usb/canokey.h
@@ -0,0 +1,60 @@
+/*
+ * CanoKey QEMU device header.
+ *
+ * Copyright (c) 2021-2022 Canokeys.org <contact@canokeys.org>
+ * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
+ *
+ * This code is licensed under the Apache-2.0.
+ */
+
+#ifndef CANOKEY_H
+#define CANOKEY_H
+
+#include "hw/qdev-core.h"
+
+#define TYPE_CANOKEY "canokey"
+#define CANOKEY(obj) \
+    OBJECT_CHECK(CanoKeyState, (obj), TYPE_CANOKEY)
+
+/*
+ * State of the Canokey (i.e. hw/canokey.c)
+ */
+
+/* CTRL INTR BULK */
+#define CANOKEY_EP_NUM 3
+/* BULK IN CAN BE UP TO 500 bytes */
+#define CANOKEY_EP_IN_BUFFER_SIZE 1024
+
+typedef enum {
+    CANOKEY_EP_IN_WAIT,
+    CANOKEY_EP_IN_READY,
+    CANOKEY_EP_IN_STALL
+} CanoKeyEPStatus;
+
+typedef struct CanoKeyState {
+    USBDevice dev;
+    uint8_t idle;
+
+    /* IN packets from canokey device loop */
+    uint8_t ep_in[CANOKEY_EP_NUM][CANOKEY_EP_IN_BUFFER_SIZE];
+    /* for IN larger than p->iov.size, we would do multiple handle_data() */
+    uint32_t ep_in_pos[CANOKEY_EP_NUM];
+    uint32_t ep_in_size[CANOKEY_EP_NUM];
+    CanoKeyEPStatus ep_in_status[CANOKEY_EP_NUM];
+    QemuMutex ep_in_mutex[CANOKEY_EP_NUM];
+
+    /* OUT pointer to canokey recv buffer */
+    uint8_t *ep_out[CANOKEY_EP_NUM];
+    uint32_t ep_out_size[CANOKEY_EP_NUM];
+
+    /* Properties */
+    char *file; /* canokey-file */
+
+    /* Emulation thread and sync */
+    QemuCond key_cond;
+    QemuMutex key_mutex;
+    QemuThread key_thread;
+    bool stop_thread;
+} CanoKeyState;
+
+#endif /* CANOKEY_H */
-- 
2.34.0


