Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC435D7C3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 23:07:32 +0200 (CEST)
Received: from localhost ([::1]:57596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiPzv-0001Sx-NG
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 17:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44410)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vandersonmr2@gmail.com>) id 1hiPuL-0007Vv-42
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 17:01:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vandersonmr2@gmail.com>) id 1hiPuE-0002yx-6u
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 17:01:43 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:42247)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <vandersonmr2@gmail.com>)
 id 1hiPuD-0002c6-Qc
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 17:01:37 -0400
Received: by mail-qt1-x841.google.com with SMTP id s15so103810qtk.9
 for <qemu-devel@nongnu.org>; Tue, 02 Jul 2019 14:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FEvqCyf5pK9960bv69fbjMgMg1qD/d8JabEvvgoAOQE=;
 b=QzlX9xhzigiS/8ILb+sdOzsdHc7oHCR9fOaZE465fmtvQfBwVYz62fuhpCl4eS5Cvc
 Gtyj1/kSBu7SJ7uRUd5UOzVvJKpJvVcnTyeLmRxD/iAXEEul/T0pFvA2k7FEInYKpVlA
 uQNDb60TUoJsClF9KIx1Gf35KAD5+IXune6g5DpZjx9fvlhbBfBHEIasfbP/REpwlpA/
 ZmykZOGq8DFuPSkm+EAUHwKgWZKl8ZlXuBW5vW96Peqk6dI32UQxDFaCWEaBZ162quWu
 laCTxQIrwe/4TNvWJM1hONWHd1dEel3QsXuLqXN7W4DRzMYRaqlNDds4PefCyKyGTae5
 OGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FEvqCyf5pK9960bv69fbjMgMg1qD/d8JabEvvgoAOQE=;
 b=Oq4jMqazw5qL05PdUMmAR9TYutMIK41KnJafxppth2PFnFjExQ0AmNcV7d2Z2n8zUq
 qdQXkrrdDgE3Y61bXVmPx/osJ8zdWE5qCxwjWPY+Btp7wqssm8SJf8EtUWLrwXOZQs1z
 Zhl6i5Zhi4eiiwgwObcGIXZnoZAaTYizEpresFgjPEb+nouax+sTeTT2e+Pi6V5yOJXD
 hvd9Qdm4na4Ak9k1CjWdc3nMH/ITUEObqHCzWjk6yk7koMeD/L63CxhpYe67vyy+y7c5
 wUcmU2NvEnzlW6FZ/kg/BkV2JloInYQNrPE6OqgLXyCHoVCXp24ocqY0CgtZRo6BJhf1
 a6EA==
X-Gm-Message-State: APjAAAV0I1OYIiwxrMvFeWAw6LiBgmIt/K1LrC8/sANMS/2SSUfWQTSj
 lTpEeMMXtSw4EEE3UnSbWofJAnn8u44=
X-Google-Smtp-Source: APXvYqy3wOlki9y6bqjQUaqznjUOOwfJokY5502+RetKkQFw5WheYD2btKNEw44nVCgWAL+b3rMgAQ==
X-Received: by 2002:a0c:983b:: with SMTP id c56mr28986092qvd.131.1562101258364; 
 Tue, 02 Jul 2019 14:00:58 -0700 (PDT)
Received: from vanderson-lmcad.HotSpot300 ([189.61.239.22])
 by smtp.googlemail.com with ESMTPSA id
 s127sm6770979qkd.107.2019.07.02.14.00.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 14:00:58 -0700 (PDT)
From: vandersonmr <vandersonmr2@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Jul 2019 18:00:17 -0300
Message-Id: <20190702210017.4275-6-vandersonmr2@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190702210017.4275-1-vandersonmr2@gmail.com>
References: <20190702210017.4275-1-vandersonmr2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::841
Subject: [Qemu-devel] [PATCH v3 6/6] monitor: adding start_stats to monitor
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
Cc: vandersonmr <vandersonmr2@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

adding the option to start collecting the tb
statistics later using the start_stats command.

Signed-off-by: vandersonmr <vandersonmr2@gmail.com>
---
 hmp-commands.hx | 15 +++++++++++++++
 monitor/misc.c  | 15 +++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index bfa5681dd2..616b9f7388 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1885,6 +1885,21 @@ STEXI
 @findex qemu-io
 Executes a qemu-io command on the given block device.
 
+ETEXI
+
+    {
+        .name       = "start_stats",
+        .args_type  = "",
+        .params     = "",
+        .help       = "(re)start recording tb statistics",
+        .cmd        = hmp_tbstats_start,
+    },
+
+STEXI
+@item start_stats
+@findex
+(Re)start recording tb statistics
+
 ETEXI
 
     {
diff --git a/monitor/misc.c b/monitor/misc.c
index 1fb4d75871..d39a048fd7 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -469,6 +469,21 @@ static void hmp_info_jit(Monitor *mon, const QDict *qdict)
     dump_drift_info();
 }
 
+static void hmp_tbstats_start(Monitor *mon, const QDict *qdict)
+{
+    if (!tcg_enabled()) {
+        error_report("TB information is only available with accel=tcg");
+        return;
+    }
+    if (qemu_loglevel_mask(CPU_LOG_HOT_TBS)) {
+        error_report("TB information already being recorded");
+        return;
+    }
+    qht_init(&tb_ctx.tb_stats, tb_stats_cmp, CODE_GEN_HTABLE_SIZE,
+                QHT_MODE_AUTO_RESIZE);
+    qemu_set_log(qemu_loglevel | CPU_LOG_HOT_TBS);
+}
+
 static void hmp_info_tbs(Monitor *mon, const QDict *qdict)
 {
     int n;
-- 
2.22.0


