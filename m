Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF9349274B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:34:09 +0100 (CET)
Received: from localhost ([::1]:49840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9och-0002Fs-SF
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:34:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nbb-0004YO-53; Tue, 18 Jan 2022 07:28:56 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:40733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nbZ-0001uL-GS; Tue, 18 Jan 2022 07:28:54 -0500
Received: from quad ([82.142.13.186]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MSI6i-1mldzW3q6y-00ScLp; Tue, 18
 Jan 2022 13:28:51 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] qdev-core.h: Fix wrongly named reference to TYPE_SPLIT_IRQ
Date: Tue, 18 Jan 2022 13:28:41 +0100
Message-Id: <20220118122847.636461-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118122847.636461-1-laurent@vivier.eu>
References: <20220118122847.636461-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MQnKmRB8npa5YEAAaH3uoiCps7zArtRaxuKPOlKKbmIA/OPMg7g
 l0sS2p8Jep5tk45dGPh90u96Z2/IiMd1440xdqsy5pIhaeCYoxKZPYnsd06y4ykn3W82Lji
 ouxjgs4/KOPB4IsIbWXVkyZX5W08zmF7bO1o7t7WYQPAxoo78Y0aex2mJ72XZmxneVB5g/k
 ycbKAgCDuCpr+lprrdbcQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dJGRwbSZHh4=:o1UcgT2c3RTll2I26kqHwZ
 sYWwpM6JbB2CrMl0gOwABAmXrPpkxGPli+yJk72MXYFZdswj7dFDist9kBYSsDZOPLxFMqTuZ
 iCqlEIjyayn1pqA3oq5iH3s3n2FvQAo38ETZzh/cblN2AXaRQg/ZRvutd9Lq3GF2w6oFjYo4k
 X36LDHEdxxbBrQKGZJELmF6mcS1LIw9vtUkJpN4okVfeqm/spNGYBRSqh6hgJmhnwl64NdAxN
 Up5bHlgKVI+eLjxcV0skrGRwGvrRxUW9O3EQiUSM1tUsACQ/txsB3la8U845ohBnlS+PmY6RO
 t5wgDbxc0GjyISM8BNhYm1kQwxK4B7KI9FcmofGaU5Xe2LX0hqIziy3LVBDtCnrlfcH3OMz6c
 /O1zWovhtFd6qnU1DE4N16uOQOdKaFzcpW9LdPPY9r1Uyy4o73Opypr6Sx48hGgT1w/ToORIV
 dgNTiJzHAP8nPfqaj3n32CRqhq85NbnUA+JYMhmWJ5Vdr7ZaMaV8HOwFMyK7Jg78sKcouIuTc
 9UnzZPOCyjyA0II1REA8gyVDdQgj3YCmfHCTueZmwcW1ggV84SFrqTDIjvzJSolo4xyJkfwrf
 SO9EXrMWEGk9oTpQQ4U7b1P9DcuUyoEk92onviD7ddzRlN1eiZzg1Pa/uQIHcGNzH6fX0KLzp
 q2bCfRpmn7+zOtp1lqBCKgp/Zzo2+VRWRYD8CTD1dNJg5A1MM1H/d20pfWjkMrIHLuJY=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Fix a comment in qdev-core.h where we incorrectly referred
to TYPE_IRQ_SPLIT when we meant TYPE_SPLIT_IRQ.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220111172655.3546766-1-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/qdev-core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index d19c94175203..92c3d6520866 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -493,7 +493,7 @@ qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n);
  * qemu_irqs at once, or to connect multiple outbound GPIOs to the
  * same qemu_irq. (Warning: there is no assertion or other guard to
  * catch this error: the model will just not do the right thing.)
- * Instead, for fan-out you can use the TYPE_IRQ_SPLIT device: connect
+ * Instead, for fan-out you can use the TYPE_SPLIT_IRQ device: connect
  * a device's outbound GPIO to the splitter's input, and connect each
  * of the splitter's outputs to a different device.  For fan-in you
  * can use the TYPE_OR_IRQ device, which is a model of a logical OR
-- 
2.34.1


