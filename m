Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id D473F1C343C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 10:20:08 +0200 (CEST)
Received: from localhost ([::1]:40390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVWKd-0001OR-SV
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 04:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVWHd-000532-RU; Mon, 04 May 2020 04:17:01 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVWHd-00015H-56; Mon, 04 May 2020 04:17:01 -0400
Received: by mail-wr1-x443.google.com with SMTP id d15so19804314wrx.3;
 Mon, 04 May 2020 01:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pht5510wvKig/cpcPTVMYbHY0XEJUROzYxKvYncwZ+0=;
 b=YGbmdYagToq5O7iGMoj/hDlzEq2kyBrlJmp9EbnYx3+xtmXn2qWXXwx8He+sQCZUH3
 wbWCUgwUimX2gUaOtraqCIkqI2EVnGdL3Diz/uRig7FngebUXTijATXQaHXSQebBJ/fI
 h2fxvfABH88OICcBElwpNSHxnESZSv5yf1uhK7+WbzL53U2/9X+A5UwRBcWP+WPLmZP2
 eIwp8O6LgCAWyOtINpsAE/OOCCMa1sC7CXiPwBdzrkOXrMXnrbXfzVxVwbtnWz889vrc
 oC6qzjGihsxpuxtgzfZYgiOFC3BUVFvKR82u4/htxLfOfCiPfAAqqiGc0v8tHvIRvf0j
 QxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Pht5510wvKig/cpcPTVMYbHY0XEJUROzYxKvYncwZ+0=;
 b=CFFrPpOMwdGMIaHqDypbciQdO3vNGb59xtoQLixa+UAMRSl909Tv/vjPwO6A9hdScV
 o8IY3aeUGweX2dxN56KvtdDrJS30KVVZ5OTdOLfsQUr5XWLUIMgYJpqVGceqY/QSo6vo
 RCPZzHkq3siuk5PaMw+MBPbaXWs5RFUk9WtklMxA+t+Mhb6O52Ha/JYSTUNL3lNx9hcZ
 G6vem4oQRQ36yR5sTecK9R7SanjvdnromyFz157VBdrX3BlZJ/rK74KQ8vDYSpHLk7IB
 9ngLaxYfL2FmAr8Bi3zdQerrR6nApz41pEgCpuN5Y24FLHuxKvCbEbzmf6H3MRxYGJSA
 7PuQ==
X-Gm-Message-State: AGi0PuZzXS4TH3mPQNJUD2I8ilep9gjT49R53L6raOK1akOkI27p16u8
 Hv3v46nchrD1RAtC28MXioFktgan
X-Google-Smtp-Source: APiQypKMWzG8LaeDZxku7vK0lVQNHpfZWcSIq7VVW7pSNpbnGY+dNp/d4WkoKnYWGo/mMEGkNGEMvg==
X-Received: by 2002:adf:d0ca:: with SMTP id z10mr19470085wrh.172.1588580219252; 
 Mon, 04 May 2020 01:16:59 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id r15sm5092972wrq.93.2020.05.04.01.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 01:16:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/timer/sh_timer: Remove unused 'qemu/timer.h' include
Date: Mon,  4 May 2020 10:16:53 +0200
Message-Id: <20200504081653.14841-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504081653.14841-1-f4bug@amsat.org>
References: <20200504081653.14841-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Magnus Damm <magnus.damm@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove unused "qemu/timer.h" include.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/sh_timer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index b9cbacf5d0..bb0e1c8ee5 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -13,7 +13,6 @@
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/sh4/sh.h"
-#include "qemu/timer.h"
 #include "hw/timer/tmu012.h"
 #include "hw/ptimer.h"
 
-- 
2.21.3


