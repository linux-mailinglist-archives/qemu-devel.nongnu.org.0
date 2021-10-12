Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C60B429EEE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 09:47:40 +0200 (CEST)
Received: from localhost ([::1]:58766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maCVf-00018C-5H
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 03:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCM9-0000Qp-E9
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:37:50 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:40065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCM0-00052C-Tb
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:37:49 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.5])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 1C40021D20;
 Tue, 12 Oct 2021 07:37:37 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 12 Oct
 2021 09:37:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006790c14c4-7504-4b07-8b94-effe6ada1987,
 B93E5558764F88B003587FF4B0B721A638511A69) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 13/18] hw: aspeed_gpio: Fix pin I/O type declarations
Date: Tue, 12 Oct 2021 09:37:23 +0200
Message-ID: <20211012073728.257748-14-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012073728.257748-1-clg@kaod.org>
References: <20211012073728.257748-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f74e55bc-02b7-4991-9520-01baab35bf4d
X-Ovh-Tracer-Id: 4269412447473208111
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtjedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Peter Delevoryas <pdel@fb.com>, Rashmica Gupta <rashmica.g@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Delevoryas <pdel@fb.com>

Some of the pin declarations in the Aspeed GPIO module were incorrect,
probably because of confusion over which bits in the input and output
uint32_t's correspond to which groups in the label array. Since the
uint32_t literals are in big endian, it's sort of the opposite of what
would be intuitive. The least significant bit in ast2500_set_props[6]
corresponds to GPIOY0, not GPIOAB7.

GPIOxx indicates input and output capabilities, GPIxx indicates only
input, GPOxx indicates only output.

AST2500:
- Previously had GPIW0..GPIW7 and GPIX0..GPIX7, that's correct.
- Previously had GPIOY0..GPIOY3, should have been GPIOY0..GPIOY7.
- Previously had GPIOAB0..GPIOAB3 and GPIAB4..GPIAB7, should only have
  been GPIOAB0..GPIOAB3.

AST2600:
- GPIOT0..GPIOT7 should have been GPIT0..GPIT7.
- GPIOU0..GPIOU7 should have been GPIU0..GPIU7.
- GPIW0..GPIW7 should have been GPIOW0..GPIOW7.
- GPIOY0..GPIOY7 and GPIOZ0...GPIOZ7 were disabled.

Fixes: 4b7f956862dc2db4c5c ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
Fixes: 36d737ee82b2972167e ("hw/gpio: Add in AST2600 specific implementation")
Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Rashmica Gupta <rashmica.g@gmail.com>
Message-Id: <20210928032456.3192603-2-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/gpio/aspeed_gpio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index dfa6d6cb40a9..33a40a624ac4 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -796,7 +796,7 @@ static const GPIOSetProperties ast2500_set_props[] = {
     [3] = {0xffffffff,  0xffffffff,  {"M", "N", "O", "P"} },
     [4] = {0xffffffff,  0xffffffff,  {"Q", "R", "S", "T"} },
     [5] = {0xffffffff,  0x0000ffff,  {"U", "V", "W", "X"} },
-    [6] = {0xffffff0f,  0x0fffff0f,  {"Y", "Z", "AA", "AB"} },
+    [6] = {0x0fffffff,  0x0fffffff,  {"Y", "Z", "AA", "AB"} },
     [7] = {0x000000ff,  0x000000ff,  {"AC"} },
 };
 
@@ -805,9 +805,9 @@ static GPIOSetProperties ast2600_3_3v_set_props[] = {
     [1] = {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
     [2] = {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
     [3] = {0xffffffff,  0xffffffff,  {"M", "N", "O", "P"} },
-    [4] = {0xffffffff,  0xffffffff,  {"Q", "R", "S", "T"} },
-    [5] = {0xffffffff,  0x0000ffff,  {"U", "V", "W", "X"} },
-    [6] = {0xffff0000,  0x0fff0000,  {"Y", "Z", "", ""} },
+    [4] = {0xffffffff,  0x00ffffff,  {"Q", "R", "S", "T"} },
+    [5] = {0xffffffff,  0xffffff00,  {"U", "V", "W", "X"} },
+    [6] = {0x0000ffff,  0x0000ffff,  {"Y", "Z"} },
 };
 
 static GPIOSetProperties ast2600_1_8v_set_props[] = {
-- 
2.31.1


