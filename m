Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEA1387AC2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:10:54 +0200 (CEST)
Received: from localhost ([::1]:57584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj0Qt-0004Yz-Ag
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lj0PD-0003Rv-7q
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:09:07 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lj0PB-0007Nf-LG
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:09:06 -0400
Received: by mail-wr1-x42a.google.com with SMTP id p7so6662489wru.10
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 07:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PcR7/YFoVEAW3KXaSgVxAKjpvFQVGHErY729FLY+4X0=;
 b=Y2FMoYAZKtUNcivtTc71NPh9OX5QCYwBpNxswQJRPElpdIjb0d6ioDGwS4xMX1/0ve
 0+BziGw3j3a5A3nHVOENZxMdj/rZZL/dNS3oAwqEVIicr0hB4xcwm13/uy81lwCTmoct
 JpiwWESvwmXG8MjjwJ9dLPGFnce/8UkpLKVEOZEK9nfRXS/kjRje/XmkGJHmwbdCVEV2
 yi36Mn6RL0jMRRrzok8cVanO/HyCNL59XNWATa4nBw0NNc7FZUPIskiiInxlBXDrZeBr
 gsfEfEgGRRiGKxo72JGCxesqXCaHUccbjEo8519Wo5OGWzr25HSRTuFF1iuc49L35c+B
 jNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PcR7/YFoVEAW3KXaSgVxAKjpvFQVGHErY729FLY+4X0=;
 b=e80VYQrY0aTL0UWDoBJHE/IMSviNCM2djxcZRyjern2gArYDoJLcpB1VC0RhOkrwaA
 p+pREYQrKubRcro4HSGvOOBPmYR5cu3+9c8WtOopry87qVX50/6H9hmiU24429gQKi6Q
 /aV+/t52pZ5wDALRY5n9P1s/4SJzKz1oGJmDyM0BnGd8/DULVQOEufQmr8y8ZNvl4cnP
 1sH4yThysT8hbYHN1en7SDJYF8HJ5cq0b9Yj2P16NfLh0N/7JP/uYSLhbYHUWMx2UE3s
 hdf2aiS1JHSkpEzzDttt91cUNWfIuA6/k75zdh/RSECaAVr+cStoEyvXehKEn+qgUqVk
 maxg==
X-Gm-Message-State: AOAM531UEobCcDyO1DXH4kt3RkA+TWinmmsU7ppRkWDdQ1M2Qd9+HUR/
 QedGPCVwDtSIAklFj62hyigKrQ==
X-Google-Smtp-Source: ABdhPJw/LgZvX+hsxQL4z9KPARaFIFQsHXxnSz7ypSnSF79GCV6W8JAnSaUkWLOZhtwbrwMDcsltlw==
X-Received: by 2002:adf:f884:: with SMTP id u4mr3312348wrp.266.1621346943776; 
 Tue, 18 May 2021 07:09:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p6sm6198715wma.4.2021.05.18.07.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 07:09:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1ED591FF7E;
 Tue, 18 May 2021 15:09:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] hmp-commands: expand type of icount to "l" in replay
 commands
Date: Tue, 18 May 2021 15:08:55 +0100
Message-Id: <20210518140855.27026-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is not a 32 bit number, it can (and most likely will) be quite a
big one.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 hmp-commands.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 435c591a1c..5ee9cfd520 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1667,7 +1667,7 @@ ERST
 
     {
         .name       = "replay_break",
-        .args_type  = "icount:i",
+        .args_type  = "icount:l",
         .params     = "icount",
         .help       = "set breakpoint at the specified instruction count",
         .cmd        = hmp_replay_break,
@@ -1699,7 +1699,7 @@ ERST
 
     {
         .name       = "replay_seek",
-        .args_type  = "icount:i",
+        .args_type  = "icount:l",
         .params     = "icount",
         .help       = "replay execution to the specified instruction count",
         .cmd        = hmp_replay_seek,
-- 
2.20.1


