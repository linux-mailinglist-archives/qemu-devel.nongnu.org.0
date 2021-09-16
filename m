Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0345140DCA0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:22:07 +0200 (CEST)
Received: from localhost ([::1]:48062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQsH8-0007Zi-3B
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs63-0000Y9-4w; Thu, 16 Sep 2021 10:10:39 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:52565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs60-0005qg-Oz; Thu, 16 Sep 2021 10:10:38 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mgf8s-1n7u0i0kG4-00hAGr; Thu, 16
 Sep 2021 16:10:32 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/10] qdev: Complete qdev_init_gpio_out() documentation
Date: Thu, 16 Sep 2021 16:10:19 +0200
Message-Id: <20210916141026.1174822-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916141026.1174822-1-laurent@vivier.eu>
References: <20210916141026.1174822-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GZJrsP6kufVP8PIjyrUuEN9PI3SUddyaiHpfN8gf4VU8RSDOQCF
 JFwJv3f9Fco6k69+imjAlLKMglpvqtN6mLd3XSvloCB2D7xRfxqVtp7shNy9YmCDw4avlfe
 n4rHB/l/58nxJSsN353PhjOtYcykplmcABqI6ND7GUcC9Os3Rgo9anYZlGPiyEcZFhwzdmc
 EhV+Po+Ro6Issdgsb6MyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EuZUTzNfUmU=:Y53JEfeYe1xxAC5NUkJUIL
 K/ZycGEs/gegRUWEykNaYgWx90ByDDKmENcep835sD6aPBojnZ9pD4KQuJvon7mXjGxzQ36qP
 FV39thpHMxSzlsVqYGrQaAn9vohJdON4FdamKC5/uQzRhWn9q5g4GAF+pHj7YUkgfrEoy5QLK
 oj6hV/Kx9WQ9OXoxIkteUUENeQKK8tfNDV3pChBKwOwlmSo1r3CbvqPVXA44ct/h9Lw56QPep
 mKIQeVAKlfuv0rvieEOJ1JbrYn+9BnYpxyrjcYqEMVYNIcPQ8SZN/2SojiCUZ7lIPRrplymUM
 xzP1nuVFbX4iq3sMzBjiZKAJe1yxxZF37mKoO+mUJHTvk5qn7qEw/ahhX8SUzPPG/oJtW8PK7
 MHJmZYf6GQT5wySNr/IufkY9T8EKoZm78wN8WNI3JI6Y8zsrvmXROfS7QegkWWPphmhoobrFZ
 4SYDl4UeMRxlV+WsCN5gTBYJJawnrOcRqYtiizdHL4X7H6uIaI4S7bg81n3bEOkVJLdwmStNW
 oRS2unrzQFwhFkUjWQzEj0MOSGgAuqPzIdr0sQV4GQhOXD0fwI4uZBQXjfjeTQloM23+fCajW
 qoFDduKranRVxSFBfIBL1l9Pwr5NSx20nCuocW8vR3CSStgtTCcah4NkR58erEgu5gYpaMpFf
 D4hgAIXl7jdaNjQZXRBN0sHjsOGoGQXF+xOG3a5ffbZOdqZ3bAY8UMeFhMbZHFtpe6BEy8/yh
 CxYLQT+liy/Rnm24Avu9Wzm3kyI749ccG/PezA==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

qdev_init_gpio_out() states it "creates an array of anonymous
output GPIO lines" but doesn't document how this array is
released. Add a note that it is automatically free'd in qdev
instance_finalize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210819142731.2827912-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/qdev-core.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 762f9584dde1..34c8a7506a1b 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -598,6 +598,10 @@ void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n);
  *
  * See qdev_connect_gpio_out() for how code that uses such a device
  * can connect to one of its output GPIO lines.
+ *
+ * There is no need to release the @pins allocated array because it
+ * will be automatically released when @dev calls its instance_finalize()
+ * handler.
  */
 void qdev_init_gpio_out(DeviceState *dev, qemu_irq *pins, int n);
 /**
-- 
2.31.1


