Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23A24AEFFE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 12:34:43 +0100 (CET)
Received: from localhost ([::1]:59466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHlFC-0003GU-32
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 06:34:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHl3R-00049E-Rp
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:22:45 -0500
Received: from [2a00:1450:4864:20::636] (port=33291
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHl3C-0003b0-G3
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:22:20 -0500
Received: by mail-ej1-x636.google.com with SMTP id fy20so6490290ejc.0
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 03:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kur3l8p5am4K2Uc1BMSbuTVw72wqKC9/r+/gQVVeNvc=;
 b=Va+dMTyHgMp8gXUXu+AHv8yZCAOrQhD3c5Sdpj1Djh0amIROlLmZYdCxtwBrTT8HnQ
 cuEPbv99AhF6ZNajYc/hyA3PAmhErFGAeoj33nJjx9XAbjkqsZWMXS/TB6rWSx7mzZCu
 WsbMvOLntLhRCC749Pwx0boLarWdjaX/VdX9EtAMx+ccA4KsOAH4dstYvdWd+LQLSH//
 /kJFIYt/PpJQuEbQcDAnVgTToNq0s0Ee9C3814joAMs2mcY0PSZ5O69iAOIZuXZAd3Jm
 6ScEQb2hIDATqYDk0BjxJYNYm7HCmxn3tf8mkISz86r3ZIWJUgFquRxuF1hjlOdyPOj6
 Ig/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kur3l8p5am4K2Uc1BMSbuTVw72wqKC9/r+/gQVVeNvc=;
 b=Nzix5i7j0Wo8Ojf1sk1aNlz+TV/KvnYH5mP0IB05tG4SWKncpiKlV1pm1opHfrCQd1
 d/L0Sqf+JWyQNaqggBRnNLDTRInaqkh4QojZKP/W0DGjFv7dJoRrgsnUb0rlCDtG78Cz
 XHXoLOR0FKku9iTBTuTaSRBCZvVcxH0uCxwPZZn1BjHNZqcbPfPxGDBg6sFl5EE83Asg
 W4Wb7C29vqDguuTnp3YoaDWo5ThxY2eIfWOFBdz5ESOpQTxrlrVlwmWn8uoxtye1ASN8
 BOLcmE43BbsBrOJ6IeON0JFr2ecaoN/1LBv8wa3EU2m2zUdgvXeDhiSGoeiwL8mO4YIo
 076A==
X-Gm-Message-State: AOAM533e5NvDQLGNQJpxEO7xlc840+8VeN3+EwKek5fp+4i3GiAtkaUH
 tQJXHv6vIBWmla+GD6kRmryvZg==
X-Google-Smtp-Source: ABdhPJzkDYUFZE/duE0JGZnx7YGD1QLa/FLP+FaP94ax+PrfgwsA0STR0zA50MFZCpdMoyhOtxMeZA==
X-Received: by 2002:a17:907:629f:: with SMTP id
 nd31mr1453819ejc.693.1644405736246; 
 Wed, 09 Feb 2022 03:22:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l1sm5876112ejb.81.2022.02.09.03.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 03:22:14 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 41A1A1FFB7;
 Wed,  9 Feb 2022 11:22:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	richard.henderson@linaro.org
Subject: [RFC PATCH] linux-user: trap internal SIGABRT's
Date: Wed,  9 Feb 2022 11:22:07 +0000
Message-Id: <20220209112207.3368139-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

linux-user wants to trap all signals in case they are related to the
guest. This however results in less than helpful core dumps when the
error is internal to QEMU. We can detect when an assert failure is in
progress by examining __glib_assert_msg and fall through to
cpu_abort() which will pretty print something before restoring the
default SIGABRT behaviour and dumping core.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/signal.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 32854bb375..8ecc1215f7 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -809,6 +809,8 @@ static inline void rewind_if_in_safe_syscall(void *puc)
     }
 }
 
+GLIB_VAR char *__glib_assert_msg;
+
 static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
 {
     CPUArchState *env = thread_cpu->env_ptr;
@@ -821,6 +823,10 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
     uintptr_t pc = 0;
     bool sync_sig = false;
 
+    if (__glib_assert_msg) {
+        cpu_abort(cpu, "internal QEMU error, aborting...");
+    }
+
     /*
      * Non-spoofed SIGSEGV and SIGBUS are synchronous, and need special
      * handling wrt signal blocking and unwinding.
-- 
2.30.2


