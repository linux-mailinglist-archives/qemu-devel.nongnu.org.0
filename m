Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC16351517
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:22:44 +0200 (CEST)
Received: from localhost ([::1]:34270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxHX-00043g-0w
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7x-00027W-Nz
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7w-0004W7-2F
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617282767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZV7ruC/P4oUmlbY81F616ff/NOgrTvZX1pgLpmgHdS8=;
 b=W7+UyzUY3hpWgoKjW+btBkIWlv+0a4pR8oMMzwCVM+eXinqZhwUY/tOzfWmebisFGS56Pg
 JqVONmBA71N/TgJgqlxCbQcKH3wmwXnivU3Ljd6jJ858dZFXqk+v5UuADsK/IBRwAP9P1K
 xzii6Rqo4o/V/NAr8uZv4dYvBy8feiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-L1JtNeHWPUORRQShd9UEDA-1; Thu, 01 Apr 2021 09:12:43 -0400
X-MC-Unique: L1JtNeHWPUORRQShd9UEDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8533710C40E2;
 Thu,  1 Apr 2021 13:12:41 +0000 (UTC)
Received: from thuth.com (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70E9A51DCB;
 Thu,  1 Apr 2021 13:12:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/13] MAINTAINERS: Mark SH-4 hardware emulation orphan
Date: Thu,  1 Apr 2021 15:12:15 +0200
Message-Id: <20210401131220.3252320-9-thuth@redhat.com>
In-Reply-To: <20210401131220.3252320-1-thuth@redhat.com>
References: <20210401131220.3252320-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Yoshinori Sato doesn't have time to manage QEMU reviews.

The code is in good shape and hasn't started to bitrot,
so mark the SH-4 hardware as orphan to give the possibility
to any contributor to step in and fill the gap.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
CC: Magnus Damm <magnus.damm@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20210312155513.1849109-3-f4bug@amsat.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0a857f6b18..d73a92c992 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -322,8 +322,8 @@ F: tests/tcg/s390x/
 L: qemu-s390x@nongnu.org
 
 SH4 TCG CPUs
-M: Yoshinori Sato <ysato@users.sourceforge.jp>
-S: Odd Fixes
+R: Yoshinori Sato <ysato@users.sourceforge.jp>
+S: Orphan
 F: target/sh4/
 F: hw/sh4/
 F: disas/sh4.c
@@ -1414,7 +1414,7 @@ F: tests/acceptance/machine_rx_gdbsim.py
 SH4 Machines
 ------------
 R2D
-M: Yoshinori Sato <ysato@users.sourceforge.jp>
+R: Yoshinori Sato <ysato@users.sourceforge.jp>
 R: Magnus Damm <magnus.damm@gmail.com>
 S: Odd Fixes
 F: hw/char/sh_serial.c
@@ -1425,7 +1425,7 @@ F: hw/timer/sh_timer.c
 F: include/hw/sh4/sh_intc.h
 
 Shix
-M: Yoshinori Sato <ysato@users.sourceforge.jp>
+R: Yoshinori Sato <ysato@users.sourceforge.jp>
 R: Magnus Damm <magnus.damm@gmail.com>
 S: Odd Fixes
 F: hw/block/tc58128.c
@@ -2181,7 +2181,7 @@ F: include/hw/*/*xive*
 F: docs/*/*xive*
 
 Renesas peripherals
-M: Yoshinori Sato <ysato@users.sourceforge.jp>
+R: Yoshinori Sato <ysato@users.sourceforge.jp>
 R: Magnus Damm <magnus.damm@gmail.com>
 S: Odd Fixes
 F: hw/char/renesas_sci.c
-- 
2.27.0


