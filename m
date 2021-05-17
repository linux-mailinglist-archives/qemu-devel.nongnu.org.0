Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6DC382BB0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:01:23 +0200 (CEST)
Received: from localhost ([::1]:58198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libw2-000323-Bn
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libr5-00043A-Rq
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:15 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libr4-0002zh-BA
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:15 -0400
Received: by mail-wr1-x42c.google.com with SMTP id p7so2350373wru.10
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n6qSXYJyeygMS7hOGRe1NILjaLIrw4Ci3+3bzVyP0vw=;
 b=NvNwAgn2yGxN2wfL6s8axYgXuVA0E8Npyr9ZAWBBcxPvzNPwEwfiqzyO/VoBALQHzN
 9uCtsyg0Ll3Cmes3P+yS2yuLyDBuzl+mfqxaX6bvLCmdgLwq0UGd1zahiWfFNAnlKVWC
 Ajr2AaONBNDeJ/AHWU9VSMoJxoUBtGsIoUv68zn8TZZOyinqXGDG/PK2IU9LFK46A8il
 3IktPIVRSwbeDow6sk4wd7afBv1Vk235HcBSQ76W0J7IcX3BqG7dRWtVp2FNLHI8qiQj
 cLDzBMhYp8ovmSvT5h8vXY2ZeyOEHXyUvfWPaqdmVuHaBAMgUaZyMYA3wanHdDd7o0JA
 B+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n6qSXYJyeygMS7hOGRe1NILjaLIrw4Ci3+3bzVyP0vw=;
 b=MhXTnTTP7dD3jaLPAvN3LnulvDpFGmVH1HqVuNj4s6aKGVeeJNsOC2fPlzjd+RL1LQ
 8kR3O+34xwVywp4riGYvvF+XIVn+hXmcqJeaCrJugPe60uJWN8CBw+OU+aj3vXAqTrSs
 g2Fyu4CepH0QL0CHR0gH44fCsxVRYJS+xuz+G5uCEbaWfZ/HF+8jhayf3er0ajkK+xo8
 tvdQz/mS4o0STFTr5+eikQ03j/RGFm3Obd8hRsg6KYqC5DXWbcnSvUaC4+23JXR7tsHO
 mHrOQrrXHAOpm+PzaRLG4PLV7mnbugclY0LAn5cIHOkpk7TDnMdS9Hi2NJeMHwlY9RRE
 AgPw==
X-Gm-Message-State: AOAM531d8DJpESqsuOWKi8S3nqNCZNn6P+1e4KOu3pyH1wXtBJbbfefZ
 t3xGnvK4K9ivXhoW2yKxsaZQcfHHxigjDA==
X-Google-Smtp-Source: ABdhPJzygxoSnijySjWm0bzYj3sEXlV0vEaB99JYDCeF3WjDIRd2HvkOeeSUJhcFAd8R7MD04xPkIw==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr74023234wrx.82.1621252571475; 
 Mon, 17 May 2021 04:56:11 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id z18sm16439930wrh.16.2021.05.17.04.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:56:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 09/15] softmmu/runstate: Clean headers
Date: Mon, 17 May 2021 13:55:19 +0200
Message-Id: <20210517115525.1088693-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517115525.1088693-1-f4bug@amsat.org>
References: <20210517115525.1088693-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the missing 'qemu/log.h' header and remove the
unused 'exec/exec-all.h' one.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/runstate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index ce8977c6a29..ffd8ddf1341 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -30,7 +30,6 @@
 #include "crypto/cipher.h"
 #include "crypto/init.h"
 #include "exec/cpu-common.h"
-#include "exec/exec-all.h"
 #include "exec/gdbstub.h"
 #include "hw/boards.h"
 #include "migration/misc.h"
@@ -44,6 +43,7 @@
 #include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "qemu/job.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/plugin.h"
 #include "qemu/sockets.h"
-- 
2.26.3


