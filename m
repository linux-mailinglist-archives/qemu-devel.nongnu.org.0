Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B1E67159B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:56:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI3FX-0001rE-2g; Wed, 18 Jan 2023 02:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FU-0001qE-Cx; Wed, 18 Jan 2023 02:52:44 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FS-000223-Lq; Wed, 18 Jan 2023 02:52:44 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N6KQZ-1ogIiV0IZt-016iZS; Wed, 18
 Jan 2023 08:52:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 02/15] hw/display: Move omap_lcdc.c out of target-specific
 source set
Date: Wed, 18 Jan 2023 08:52:21 +0100
Message-Id: <20230118075234.2322131-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118075234.2322131-1-laurent@vivier.eu>
References: <20230118075234.2322131-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:S/TozmtnyahcoSb05PRpxPBFnMLH1qwj2t9eyJdPJUH1VuXwwn/
 kAgkAii6MNoq3OXDEF92le99lcIxq/aYLBdGZqEdq/itUgFZS7U3OxxknECeWFujByPAFBj
 aycMr+v0zgk/xwaI+9hs0uLskFinuvkdjdVigH+1H0UNXOZwF066xHiCzBxdpdKVkORTGhM
 5lvtaxdh9CEjGv9pH/1HQ==
UI-OutboundReport: notjunk:1;M01:P0:gfiX2UupAu8=;//Tax+7LRtv9O622qnr/EW77bdE
 VapoLofZzcvaKmjEXhTPtxP+dIbcW2biE4np9s8YfXXtKlsaCOfTrjqJjofpCKIevZwYJTrD1
 8s6lWmul/FNaCbSly9mEqX8baDSPmHffumIwegF37CQa7m04ymVzAGBCb2xe3jPMBmuqusOyh
 yNekvQQIy7RY26tjguWvVGyfMJX9w5HjcM/SqquHu6s9tcAgmjfKW+/VLYP2Wriz4zVqJWMig
 kzVAeRo+MWfBE70QIlrGOGNRTeqXo28V+QMMrW/HCNMiwKfz+gN/ZJu7gBK3e+xxcQyFR7fth
 ldSAP5RxAzUycUmBDN8EUScaJewHpUYrdVUbLzrRVppXNVpzC+GgObmD2vsbAKW2mNRFuK7Q9
 KUIVXcUqxxwdEpVgu63cdER+t9cJGpsF1EwW68wb2E0tk+AIRk4RpALLj52PaFeA2wPAgcoCo
 u008wN+oN8AjgV3vPnltMTd+Ucv9x9fuqW95Pkdh/Xp41oZA7Dqns3gs5EmN0lzkh3k3h6Xt2
 jPVySmolZTR0lma41fXONYg8tv5pkcPbZrKmLil2qD/kKcC9Ls9o3Jb/uKvGBTO79VaOdXM/J
 9A+2C56fIsxaJQK/Q1GyZLq5NEj1FVwSfQoeoudlpV5oJ6WQQu018qv/TOwvQTFzVmjeF8YC9
 Hdosyi2CRjR+ydlC1Zktw3RSu/qzBxu0LwpqUR+rTA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

While only used by the ARM targets, this device can be built
once for all.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221209170042.71169-2-philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230112134928.1026006-2-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/meson.build b/hw/display/meson.build
index f860c2c562ac..f470179122c5 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -115,7 +115,7 @@ if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
   hw_display_modules += {'virtio-vga-gl': virtio_vga_gl_ss}
 endif
 
-specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_lcdc.c'))
+softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_lcdc.c'))
 
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-vga-stub.c'))
 modules += { 'hw-display': hw_display_modules }
-- 
2.38.1


