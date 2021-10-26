Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A535D43B080
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:49:54 +0200 (CEST)
Received: from localhost ([::1]:43250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfK1h-0005hp-O6
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJi3-00027W-2S
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:35 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJi0-0004gI-2k
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:34 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z14so17136758wrg.6
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NuonZsDU5COcIiEjm2vWe6QiJRH6ZRkN+cgKnmHcCFM=;
 b=n5TC6htiIzDtAXJZqFxxy5nZuz9rPBK09zAAvF/b5WndQgOcT6vkoRxkvkxlytBUbZ
 Hyw9CCvZMNFKjnMq/zsKsDss2gzSyc8vmxY3he1z23j8XlySQOkhh7IB0Jxl/0ux75eh
 2cesVd0glPSXnk/Y4R/3hsjMsyVybLx/P7w7NFZV6w8MPpNEoL1Iab+Jpn5WJDVOvW6e
 AguXuO61brPBnHUjizL1tuJdmp6skxaSyJOUTEWZLVQePsS1WatzfBATXYjqIEYp63h+
 WuTKUn2YzeR3DBkRuw48cKRWB5qPXavQDdQcfH5VmnjD5akiZ8eT2Qg845UTObhdM9W0
 03Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NuonZsDU5COcIiEjm2vWe6QiJRH6ZRkN+cgKnmHcCFM=;
 b=hfCpPhN38JPILWWoXL6WSi3n1DfTN7I4H+EiFVRFsU/ILozty8wvvIFO3aE4rHThSs
 EnXbTxdE8LWT8CeX41IsiEqbd4ORdaH3+hqJtLXstCvMqb1HoGcsCMWKg9a4mDa2SWbL
 YihJjIVDEGaItt4e9C1NvcNEHRQGqSOsQ+WVgXb1gsJ5H6v1kxHWcCAAz/bLnbNQJxay
 fsp/rW+jeLX5WRTl4lqijRStzuTHnl3gJSnAiWGFpnZSAtFDU4NrFw3cX+hF4807UFtD
 rQWJxoyhpFywDYWqW3eSEo/0svUsZ0yim6sDm+0N1rlCXO9MW/BfUxSijSStUE/Zn4Mf
 6U6g==
X-Gm-Message-State: AOAM533KPPsgGlDbmHRfUFIuTkUWXs4yr2Tu3xmb80zhy/kNJ6c4VqVZ
 xSLdX9YwzJyhEjr1OOj6fnmeIQ==
X-Google-Smtp-Source: ABdhPJziGXVcRnX7S8FN5bKburyYMBRQ+Xg4dSaOkvv3xeavcq4WOvHInOmkG7ebgu6NABeSAydk9w==
X-Received: by 2002:adf:8bc4:: with SMTP id w4mr16633998wra.36.1635244170474; 
 Tue, 26 Oct 2021 03:29:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b6sm3728416wrd.85.2021.10.26.03.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:29:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D5AAA1FFBA;
 Tue, 26 Oct 2021 11:22:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 23/28] tracing: remove the trace-tcg includes from the build
Date: Tue, 26 Oct 2021 11:22:29 +0100
Message-Id: <20211026102234.3961636-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 Luis Vilanova <vilanova@imperial.ac.uk>, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Luis Vilanova <vilanova@imperial.ac.uk>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/trace-tcg.h | 6 ------
 trace/meson.build   | 1 -
 2 files changed, 7 deletions(-)
 delete mode 100644 include/trace-tcg.h

diff --git a/include/trace-tcg.h b/include/trace-tcg.h
deleted file mode 100644
index da68608c85..0000000000
--- a/include/trace-tcg.h
+++ /dev/null
@@ -1,6 +0,0 @@
-#ifndef TRACE_TCG_H
-#define TRACE_TCG_H
-
-#include "trace/generated-tcg-tracers.h"
-
-#endif /* TRACE_TCG_H */
diff --git a/trace/meson.build b/trace/meson.build
index 573dd699c6..e279e33d4d 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -62,7 +62,6 @@ trace_events_all = custom_target('trace-events-all',
                                  install_dir: qemu_datadir)
 
 foreach d : [
-  ['generated-tcg-tracers.h', 'tcg-h'],
   ['generated-helpers.c', 'tcg-helper-c'],
   ['generated-helpers.h', 'tcg-helper-h'],
   ['generated-helpers-wrappers.h', 'tcg-helper-wrapper-h'],
-- 
2.30.2


