Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3AD64BCE0
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 20:11:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Adr-0007zc-VB; Tue, 13 Dec 2022 14:08:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p5Adp-0007yS-2m; Tue, 13 Dec 2022 14:08:37 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p5Adn-0006JS-Cm; Tue, 13 Dec 2022 14:08:36 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 04D0F1FE21;
 Tue, 13 Dec 2022 19:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670958514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aVAE2JUy6EcxWtpDuGqmi0x4GKXnpAsfErWxU7vEXJ0=;
 b=NSaZRpbom36IuHzBCESSuxRdNwVQmRnIElix7Nvp3xxc5Dx54rVRlEgA+4gpIEKbGAmpRE
 p5cVZGQeDdHWqrUyGbTgYi39y4EaAh7WBawrDej4Nv+6wWJAHMQGrJHbZIRA+/FK7pEJnm
 56BE6D4IFEptklvIcVtC1Ad3j5cPD+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670958514;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aVAE2JUy6EcxWtpDuGqmi0x4GKXnpAsfErWxU7vEXJ0=;
 b=+q5kgEO+vrsJfN6MnnLCejBz02JY8nCuEYkIS9Zo3JEwn8maplt9HSVIn6Mhd95j/ndtQ2
 EEkCQ9JUu5DiUsDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2CEFF138F9;
 Tue, 13 Dec 2022 19:08:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WKjLOK7NmGOcBwAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 13 Dec 2022 19:08:30 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 4/6] target/arm: Remove unused includes from m_helper.c
Date: Tue, 13 Dec 2022 16:05:35 -0300
Message-Id: <20221213190537.511-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213190537.511-1-farosas@suse.de>
References: <20221213190537.511-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
This was extracted from the following patch in the series
https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de

[RFC v14 08/80] target/arm: tcg: split m_helper user-only and
sysemu-only parts
---
 target/arm/m_helper.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 355cd4d60a..033a4d9261 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -7,30 +7,14 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/units.h"
-#include "target/arm/idau.h"
-#include "trace.h"
 #include "cpu.h"
 #include "internals.h"
-#include "exec/gdbstub.h"
 #include "exec/helper-proto.h"
-#include "qemu/host-utils.h"
 #include "qemu/main-loop.h"
 #include "qemu/bitops.h"
-#include "qemu/crc32c.h"
-#include "qemu/qemu-print.h"
 #include "qemu/log.h"
 #include "exec/exec-all.h"
-#include <zlib.h> /* For crc32 */
-#include "semihosting/semihost.h"
-#include "sysemu/cpus.h"
-#include "sysemu/kvm.h"
-#include "qemu/range.h"
-#include "qapi/qapi-commands-machine-target.h"
-#include "qapi/error.h"
-#include "qemu/guest-random.h"
 #ifdef CONFIG_TCG
-#include "arm_ldst.h"
 #include "exec/cpu_ldst.h"
 #include "semihosting/common-semi.h"
 #endif
-- 
2.35.3


