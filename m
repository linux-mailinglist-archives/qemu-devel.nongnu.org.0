Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A51357A06
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 04:05:40 +0200 (CEST)
Received: from localhost ([::1]:43764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUK39-00009u-Vs
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 22:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lUJvx-0008E0-2e
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 21:58:14 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:37871)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lUJvq-0005yP-AS
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 21:58:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617847086; x=1649383086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3Rppj2s7jZ1Z41UJcQSSACKrGDHP04Gtlikpj5w9uXA=;
 b=imGb2yZPmj50zN7pBD9pW4NJvODnx7yNV+rHTf5A9uVoGqoBZS1b2E2i
 942596M3ieYsZC3dU7qMHm7H7W/MX1guJn5g+TNyVpepv/MCRRei8U2FI
 IBFNG10QTJSdgqc9NHdaVA2y+9Bayh7W8AI56wrMp6Y/tpTi8ovA+X7l2 M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Apr 2021 18:57:56 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 07 Apr 2021 18:57:56 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id D63EEF43; Wed,  7 Apr 2021 20:57:54 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/26] Hexagon (target/hexagon) move QEMU_GENERATE to only
 be on during macros.h
Date: Wed,  7 Apr 2021 20:57:36 -0500
Message-Id: <1617847067-9867-16-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617847067-9867-1-git-send-email-tsimpson@quicinc.com>
References: <1617847067-9867-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/genptr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 6b74344..b87e264 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -15,7 +15,6 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#define QEMU_GENERATE
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
@@ -24,7 +23,9 @@
 #include "insn.h"
 #include "opcodes.h"
 #include "translate.h"
+#define QEMU_GENERATE       /* Used internally by macros.h */
 #include "macros.h"
+#undef QEMU_GENERATE
 #include "gen_tcg.h"
 
 static inline TCGv gen_read_preg(TCGv pred, uint8_t num)
-- 
2.7.4


