Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2F620C3E4
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Jun 2020 21:54:16 +0200 (CEST)
Received: from localhost ([::1]:58370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpGtz-0006Fi-19
	for lists+qemu-devel@lfdr.de; Sat, 27 Jun 2020 15:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jpGrf-0002Pl-UB
 for qemu-devel@nongnu.org; Sat, 27 Jun 2020 15:51:51 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:42890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jpGrd-0003vO-Uq
 for qemu-devel@nongnu.org; Sat, 27 Jun 2020 15:51:51 -0400
Received: by mail-ed1-x534.google.com with SMTP id z17so9469754edr.9
 for <qemu-devel@nongnu.org>; Sat, 27 Jun 2020 12:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ewVRNpPM318EJDye8jWm3GOz5oUfVOplXqMzHurSGg=;
 b=o5I1tuYGiKveP+FpsujSYCCGkyNgfFs1pdxxZNSjbdDJKfxc5+DBbu1R6MYcAYm7vx
 HA2kjHs8AfHIqno7r+W6IV47taOeKIsQh31PwEM1XL7P4+3L/e9BAjxabT/MeVpKfSAY
 vzzNeQivEINoQ5FDNPgaYm71wSOMTe13R2K10KFTAz9KyaDtU+yptmCsVwZ87E1J7pYH
 xki49/EDZaWtQznPQYw3WLBZd7AZvDjL7JcrEOURfdC47sWkSHrIKTbd6XZ5sIUSnQqA
 baSZ/tIqfC0VfHrKRkYRMULJeEaSVGUQl1bE3En+RYcd0HQbNnKPIRKxiHqKL3ZwNdWj
 DfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ewVRNpPM318EJDye8jWm3GOz5oUfVOplXqMzHurSGg=;
 b=gIuZiXbM6t/YZVFlLac2STLf9/WtfpfA2jEtYswGd3gj5qdBxWpSUWIVCc5HIM6+DZ
 tmLooBpTNEFaPfNA6hH0bkHOAKcguJvnOsmN8+oFebcICrKUm9YLLOLhEg6AhcL6V1yA
 RkvyyiRKFRQkYUsXa1MhuvZPyfSFyFXIVKqNpUQjc1bT/pTif7hoJ8xFjlwXEDl7Pq+C
 QVxDLPHQjwR1wK4X2xi6+PG8UKTjF8kH8wxLDHu6TWYSenjjueovzr0NyyEnIeVIUCCl
 i7j8oe3Q1oHPn6+Dki7jq1mzSPVPL9/FQRSPeBUe0PCtJpt1yz8zHRzT4I800/bJrk0q
 EutQ==
X-Gm-Message-State: AOAM531PcsWurhkRuBpub4l/Ah7Ictmn5l+4/vuFX5qdH9IHxCoPDx9g
 g3R3p6mg0VBCjdJrO4IP3ajuH1PK
X-Google-Smtp-Source: ABdhPJy97j1wxwprDhJ3uL7PZdbxgJLII+FU84hvO4T1OtN7Kdlb9trnNVUoJs1OzK1FoHOl3fqVzw==
X-Received: by 2002:a50:8425:: with SMTP id 34mr10057553edp.314.1593287508619; 
 Sat, 27 Jun 2020 12:51:48 -0700 (PDT)
Received: from rtrkw774-lin.syrmia.com ([46.240.135.226])
 by smtp.gmail.com with ESMTPSA id y11sm5298734ejw.63.2020.06.27.12.51.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Jun 2020 12:51:48 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 6/6] MAINTAINERS: Add 'Performance Tools and Tests' subsection
Date: Sat, 27 Jun 2020 21:51:43 +0200
Message-Id: <1593287503-25197-7-git-send-email-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593287503-25197-1-git-send-email-aleksandar.qemu.devel@gmail.com>
References: <1593287503-25197-1-git-send-email-aleksandar.qemu.devel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-ed1-x534.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: aleksandar.qemu.devel@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit creates a new 'Miscellaneous' section which hosts a new
'Performance Tools and Tests' subsection. This subsection will contain
the the performance scripts and benchmarks written as a part of the
'TCG Continuous Benchmarking' project. Also, it will be a placeholder
for follow-ups to this project, if any.

Signed-off-by: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Message-Id: <20200626164546.22102-4-ahmedkhaledkaraman@gmail.com>
---
 MAINTAINERS | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe925ea..dec252f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1096,11 +1096,10 @@ F: hw/isa/vt82c686.c
 F: hw/pci-host/bonito.c
 F: include/hw/isa/vt82c686.h
 
-Loongson-3 Virtual Platform
+Loongson-3 virtual platforms
 M: Huacai Chen <chenhc@lemote.com>
 R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 S: Maintained
-F: hw/mips/loongson3_virt.c
 F: hw/intc/loongson_liointc.c
 
 Boston
@@ -3026,3 +3025,10 @@ M: Peter Maydell <peter.maydell@linaro.org>
 S: Maintained
 F: docs/conf.py
 F: docs/*/conf.py
+
+Miscellaneous
+-------------
+Performance Tools and Tests
+M: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
+S: Maintained
+F: scripts/performance/
-- 
2.7.4


