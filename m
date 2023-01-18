Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12773671591
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:55:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI3FY-0001sQ-M8; Wed, 18 Jan 2023 02:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FW-0001r0-16; Wed, 18 Jan 2023 02:52:46 -0500
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FU-00022X-Ek; Wed, 18 Jan 2023 02:52:45 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MUooJ-1p90gr1ndp-00QoFa; Wed, 18
 Jan 2023 08:52:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 06/15] hw/cpu: Mark arm11 and realview mpcore as
 target-independent code
Date: Wed, 18 Jan 2023 08:52:25 +0100
Message-Id: <20230118075234.2322131-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118075234.2322131-1-laurent@vivier.eu>
References: <20230118075234.2322131-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:t6NiMFPRVAM3GS9YH1X/Ayw2z21UADbEHyddBcaeVDVHVhdl7vc
 U066daolYxZ+Co57tmMuZxWukyxjBjJqBM4AW7MyBXEmnBJV7k+jloSVaPYPiIT5d9PwiMR
 GOVAkaOzH0ZmpS9FRtsqOPkUAhQ3Z57SQj7g5W3aBtgXOFtFbt7Bc4EuqJlETTZpA6yU56y
 pKorlRY7Rivsm20fngkVA==
UI-OutboundReport: notjunk:1;M01:P0:UqziQDf/oI4=;eqgjyGcGAQL7rR7+erqu7+Z0W9Z
 RNcV4qa3y6laVqPl78cHxFk7JxM1QmP7o6Z3aRLj2QxLhqsKtTu7cOTOCc3D769zpuE9vRg8o
 BEVuTxxyjFodB6KpcyOrDQA00LNysd9eGrZOsWL5JJOS9LaC94gHEEDy/38hM1rZ2+lLuZou7
 GK4U9azEZgNWhQrXeby/E1GEkb1zRX2TLxDiVCUWBEwBl+t5cPWoQNr/qYQUV8c5NYANqb4uc
 Gm8y2nd5bVKV9+0mNaQu9kvSQYnag1h4XDYMzZxN++Uqyv6DwDe8AMhDQ2QRrNorxxdCi7MGf
 fUMnmQIJDc9Wmup8NMycVQEB2KoHRKFgcK9iOkVM6Al90EcPoFzIqV76zbzkDMMDltXY3GE0o
 pM325f5s1ceeiyiDNNglkcZGAaA7MERzktSVYehdtcgV4Hk4Teo7wuugaOCKndpGxHSmMN6/1
 OY5HAxAuLfjOZdf5Tvg6NbAC1keJaucLW6nAT2C5G7NRQiifgCcXXl7qb3Bzvwl507ImOtdOo
 5BTtBVVBniIg09DNlDIqocI2Zc5o5aQLmcWxNGeGqBRTzWVFaUw6hGOZdwYAOg5eHiH4AXh00
 KpY3o84nz1lp0CIfTn3JqcRUVn/6zj1yGsqkRWPaQrhk744LGihT79fqwdTuQBq1fJQI0CJD2
 M5Q/QYI66ycyDHl4sdfj2Y4X1nHiV/ob92NKHRR+3w==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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

From: Thomas Huth <thuth@redhat.com>

Seems like there is nothing target-specific in here, so these files
can be moved to softmmu_ss to avoid that they get compiled twice
(once for qemu-system-arm and once for qemu-system-aarch64).

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230112134928.1026006-6-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/cpu/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/cpu/meson.build b/hw/cpu/meson.build
index 9e52fee9e778..e37490074f5e 100644
--- a/hw/cpu/meson.build
+++ b/hw/cpu/meson.build
@@ -1,6 +1,6 @@
 softmmu_ss.add(files('core.c', 'cluster.c'))
 
-specific_ss.add(when: 'CONFIG_ARM11MPCORE', if_true: files('arm11mpcore.c'))
-specific_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_mpcore.c'))
+softmmu_ss.add(when: 'CONFIG_ARM11MPCORE', if_true: files('arm11mpcore.c'))
+softmmu_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_mpcore.c'))
 specific_ss.add(when: 'CONFIG_A9MPCORE', if_true: files('a9mpcore.c'))
 specific_ss.add(when: 'CONFIG_A15MPCORE', if_true: files('a15mpcore.c'))
-- 
2.38.1


