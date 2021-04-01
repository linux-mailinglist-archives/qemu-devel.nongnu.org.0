Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BD3351510
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:19:54 +0200 (CEST)
Received: from localhost ([::1]:55746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxEn-000146-V3
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7t-0001yR-At
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7r-0004TV-Pi
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617282763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=21BqMmMNv/PMqQ81Ljex1211UdBTQEXx2NCxOhx3v7g=;
 b=CjK0mnjuEkYfUPpcyQy0yHOlSNQoLiFPOurD55uyWw481sfQQkR3nnJvobwJwHWVC3zaku
 nE5KEmcO9vtFTSq8zbeY5PrBk+AnsWjt5CkDpPGayGyfpSPz+3cZqHBThXXKVwSen5izeY
 5QynQf+sW45WHXeIcyno7dbelAC1BPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-Io9tnTK3MJWiUzooEpl_yw-1; Thu, 01 Apr 2021 09:12:40 -0400
X-MC-Unique: Io9tnTK3MJWiUzooEpl_yw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1291B801597;
 Thu,  1 Apr 2021 13:12:39 +0000 (UTC)
Received: from thuth.com (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B77051DCB;
 Thu,  1 Apr 2021 13:12:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/13] MAINTAINERS: Mark RX hardware emulation orphan
Date: Thu,  1 Apr 2021 15:12:14 +0200
Message-Id: <20210401131220.3252320-8-thuth@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Yoshinori Sato doesn't have time to manage QEMU reviews.

The code is in good shape and hasn't started to bitrot,
so mark the RX target and hardware as orphan to give the
possibility to any contributor to step in and fill the gap.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20210312155513.1849109-2-f4bug@amsat.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 155c7995d4..0a857f6b18 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -307,8 +307,8 @@ F: linux-user/host/riscv32/
 F: linux-user/host/riscv64/
 
 RENESAS RX CPUs
-M: Yoshinori Sato <ysato@users.sourceforge.jp>
-S: Odd Fixes
+R: Yoshinori Sato <ysato@users.sourceforge.jp>
+S: Orphan
 F: target/rx/
 
 S390 TCG CPUs
@@ -1405,8 +1405,8 @@ F: include/hw/*/*sifive*.h
 RX Machines
 -----------
 rx-gdbsim
-M: Yoshinori Sato <ysato@users.sourceforge.jp>
-S: Odd Fixes
+R: Yoshinori Sato <ysato@users.sourceforge.jp>
+S: Orphan
 F: docs/system/target-rx.rst
 F: hw/rx/rx-gdbsim.c
 F: tests/acceptance/machine_rx_gdbsim.py
@@ -2193,8 +2193,8 @@ F: include/hw/sh4/sh.h
 F: include/hw/timer/renesas_*.h
 
 Renesas RX peripherals
-M: Yoshinori Sato <ysato@users.sourceforge.jp>
-S: Odd Fixes
+R: Yoshinori Sato <ysato@users.sourceforge.jp>
+S: Orphan
 F: hw/intc/rx_icu.c
 F: hw/rx/
 F: include/hw/intc/rx_icu.h
-- 
2.27.0


