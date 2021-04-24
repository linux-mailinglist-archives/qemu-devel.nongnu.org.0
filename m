Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D6B36A1F7
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:12:25 +0200 (CEST)
Received: from localhost ([::1]:38144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKtM-0001g8-54
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhx-0005Tg-Ak
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:37 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:46048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhr-0004CA-Vp
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:36 -0400
Received: by mail-io1-xd36.google.com with SMTP id z14so1402828ioc.12
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/WnAAtcFzxO8r69DXQ+9tsdNR29OS9N9nKXWHORJzaM=;
 b=VEX5J8rJOyckvhSCDN86jjM+jChyblHrk5ZAdG/G2mX+0vU5b+q7mxbdvFRIDC75Qd
 G3xuO7H1li91eEmpi+YTPyC+HKwclRaAfT9gvgYj2D2vH6paqci2//fjxysRCwnntEMv
 /lmWJjZkYD4cmn0q6gA1YULBl4iG/ARf9VQfQ6T9Dg2HtEJ7Xm90+fBzicQKtzydggg+
 DXTq7XHltDSZ3kWHD1fw92V7fftg1/aIRAVA741SNGY8XHESVwngVx+71uCj5AaR3yxu
 +OxpIg7Kf/tc91BbqZ8WMQjQc+GxfRNn8P+SQ+giBVLZ67QEsaCByc/p/SB/sJvLtWxa
 mXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/WnAAtcFzxO8r69DXQ+9tsdNR29OS9N9nKXWHORJzaM=;
 b=AjZLMAIbV51n6YHlDp7eO1L+abr0xw7Ur9GQCrkOnYMa5s6kKg7u822/gtKnTo26RX
 EKH2GWJfJ/Zq/TSl3UTxbnXmK02PA1+IDy1dcw1bX4ncngG/ZfDlQz6iy6D/J7pi9FOw
 SCPfv+I5QtyoC4QexnQ/O5gaHVjm51TivZ7rVsMXgx2IvUk0puIWYi3QMc3TAHYkpuBw
 WRypVx1DLSUdTm94/1Qx1xm/mM3LyHu4lu7fF1l0PLvSMUB2Wt0l7YVq4hZD+y5xKhFW
 Vnt2WqJtzAf6RxxeCiimyMfZgma6noWgnwY+yimXNcM8mE4Z+FhPkhK+xlPwaP0yZjaY
 5jdQ==
X-Gm-Message-State: AOAM531OLvWeTs3W8pdyTutTpy58KQF931e11llvZrs57TokhnfFYYdM
 kMZb9knSVnkUbgc/RJJ9kJz1zY11EY2595Xu
X-Google-Smtp-Source: ABdhPJytSXS4qoCI14pF68hYZchtdojQxkMuOygQJp9hLA/BSvbufP/89SmaCPm5Odt+R1lmz5bh4Q==
X-Received: by 2002:a02:a40a:: with SMTP id c10mr8202027jal.98.1619280030702; 
 Sat, 24 Apr 2021 09:00:30 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:30 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/48] bsd-user: style tweak: keyword space (
Date: Sat, 24 Apr 2021 09:59:33 -0600
Message-Id: <20210424160016.15200-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index d2bcaab741..b836b603af 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -233,7 +233,7 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 #define __put_user(x, hptr)\
 ({\
     int size = sizeof(*hptr);\
-    switch(size) {\
+    switch (size) {\
     case 1:\
         *(uint8_t *)(hptr) = (uint8_t)(typeof(*hptr))(x);\
         break;\
@@ -255,7 +255,7 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 #define __get_user(x, hptr) \
 ({\
     int size = sizeof(*hptr);\
-    switch(size) {\
+    switch (size) {\
     case 1:\
         x = (typeof(*hptr))*(uint8_t *)(hptr);\
         break;\
-- 
2.22.1


