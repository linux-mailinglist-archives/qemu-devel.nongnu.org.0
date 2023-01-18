Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838CC671584
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:54:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI3FY-0001rk-0Y; Wed, 18 Jan 2023 02:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FV-0001qi-JU; Wed, 18 Jan 2023 02:52:45 -0500
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FT-00022D-Sb; Wed, 18 Jan 2023 02:52:45 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MKKhF-1p0nkG14Pv-00LoIK; Wed, 18
 Jan 2023 08:52:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 04/15] hw/tpm: Move tpm_ppi.c out of target-specific source set
Date: Wed, 18 Jan 2023 08:52:23 +0100
Message-Id: <20230118075234.2322131-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118075234.2322131-1-laurent@vivier.eu>
References: <20230118075234.2322131-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4hciKJQLb+ncwQShOYcADmPKZxhXHBFuOhNgSrF34KLiGYmKHOp
 N9JR62WOcIIl4ay54cQuS/eyQ+zjeIGJvwzM0hTDacc3DOQOMVsu+uweCQEOIm5yOS9ZxQL
 FWbnZD4FXO1bOEcn14wVUZxX341uCfRegnwHtO6tbqfVwFHtSNy+cwjR/aEJIpyizQSan32
 SVrcE+0wg7zefnSVobrsA==
UI-OutboundReport: notjunk:1;M01:P0:JH/fIg5DEoo=;lkvQwm69xOxRvNeHStBUrLW0hsl
 yFUvpOEeJqMYlrdSIYeu8o+Owllla7pU9aE0XbV5n2TVbV7HpTmcYlpg0fCfWo07DBcbhUcBw
 Rn0XdftaI2vunJ3D92JD+gLP1dtwnJwHKX8kUoWiGyIb9YwHeWI19tjFCxP8JJpM2hbSJ/JpD
 C0CbWYbKNCC/IhvYYwfxK2mLtCKa0WooqA3oZCpZSyqLmrvPKMLG1Z6Y8bfyx1OJi2dd6sH5G
 7ygDVog8bCebTZ+Kyu/I7fpK+K60UIP2g5ACpyCjppqQdWc6SQjhn4JO1yNlX8kYGhn8CUeNa
 PcK3zMIDDFsT9Cb0TWZYsqx1F0zuF4wjWjtDfN776DSuSRfdHf1wShbwb3v53cUFZzncrsKCV
 ea/aqQbVsnh7deDtX+UKEuoBgVw6NY6UubyDO/nj5ZL9Ysez5xkKXqWN4q/OyBLWxmg2PC25e
 BbOoFQt+damhwvNcVxWDUP1IGXj3RBwwVF54PEIycCmSXnrU3qDdiv7HTcMqds6aq3pot2FHB
 3S9cn3u3TtNdSwUcf27EY7c2gBLsU122mGbAznZd6QjayXP+AdKlKwT1IXwMHzYCJzxeuFqGV
 xqPTnqg+/Bi10B4YIiqUqdenid2ZXxIJcYqIe1018rNpo+V5eNlriu/j2nF4r55+c9oas0rYQ
 bf6LLQ1N/F2X49IsSjGKi1dFDBj9p6wuwhrmN92UCg==
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The TPM Physical Presence Interface is not target specific.
Build this file once for all targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221209170042.71169-4-philmd@linaro.org>
[thuth: Drop the CONFIG_SOFTMMU statements, they are not needed here]
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230112134928.1026006-4-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/tpm/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
index 1c68d81d6ab2..7abc2d794a84 100644
--- a/hw/tpm/meson.build
+++ b/hw/tpm/meson.build
@@ -2,7 +2,7 @@ softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_tis_common.c'))
 softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true: files('tpm_tis_isa.c'))
 softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: files('tpm_tis_sysbus.c'))
 softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
+softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_ppi.c'))
+softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_ppi.c'))
 
-specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_TIS'], if_true: files('tpm_ppi.c'))
-specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_CRB'], if_true: files('tpm_ppi.c'))
 specific_ss.add(when: 'CONFIG_TPM_SPAPR', if_true: files('tpm_spapr.c'))
-- 
2.38.1


