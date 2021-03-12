Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05556339684
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:30:18 +0100 (CET)
Received: from localhost ([::1]:51416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmYC-0006od-Ux
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:30:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlaf-00045p-W4
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:46 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:46851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlaR-0002Cq-42
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:45 -0500
Received: by mail-ej1-x62d.google.com with SMTP id r17so54796452ejy.13
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JlkkTcluzTbtq/zjZUoz2AwI7NG2npDobHU+H6XFiEM=;
 b=oxX0OTdmFfrpINhW2urx0EPuu+G/u7rN2H9A2ORXDRLO+yUbasiiItTY9Jj2C4wKa+
 SX3znl0hG0vJRJGovpjDB6PzASKQgBpZ8WKZWvvpXz70NxlSl5PmYMod0owQSQXngyJ5
 AAb3wropu/WKEQq2HXyjsz88ZOmAZKIQJtC/kPK4upiEZ4Xm86hvaJY9CH19hQRobXS2
 Pak6ZLE7WOIEo0/eB1KYrPXO/2dPqwtjmO4VmALockPYekeVz0zRJXNa+jZuX1x7xQWQ
 ES2rSFDf3L0bm+aQRTPVl959wRtubyCDO2mWLiXqjfPdt4lWujOCAXlvXQyByS/wc+YQ
 mTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JlkkTcluzTbtq/zjZUoz2AwI7NG2npDobHU+H6XFiEM=;
 b=FfwOHPIjGw5XUWwBy8lJ/Qq0ave9kGHpDbD9ztqI0Me8QyNC9K1b1AevOk/DucYADf
 AFu5EosD6+HxbDpfuWVwsh8K6lsM9pe5QW3FFSptoG/Cxvr6mNNwmQ3ljKUYu0T7kkER
 UH6oLTHSMsHXXVUEk4ZTpDMMALgseUqK1/wLuLQXRlcnEX2etCrV2QXQICKpap/Y6Nc2
 kCFqqccqvLo1HP3oDCb0+fiHCm9Tc403FhUYp6fV9+tWBByZ4FPUqsmPujQxsIgZi9rp
 SRma2U4H2GyBX2S9wOKDFHzfER7qm3iS3wQY5TlvCtUhRA22Xz2pPtaqEVdtsa5G+qrJ
 /PQw==
X-Gm-Message-State: AOAM530lN3PN8I0ThdLTHK/+rg1UVwib9lIVAdykFjTqwoQYwTanWP0s
 DRORxJQ04p5LNLtezUnFEya5ww==
X-Google-Smtp-Source: ABdhPJwg9SR+psoThgU9QOviX0TfivB/Yc2GzwHTmnTyXFV9mZywJXPuWtSKs1OeG+TZF8jBeavcLQ==
X-Received: by 2002:a17:906:3488:: with SMTP id
 g8mr9507564ejb.282.1615570109812; 
 Fri, 12 Mar 2021 09:28:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w24sm3393605edt.44.2021.03.12.09.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:28:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 32C031FF91;
 Fri, 12 Mar 2021 17:28:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 05/14] plugins: cleanup kernel-doc for qemu_plugin_install
Date: Fri, 12 Mar 2021 17:28:12 +0000
Message-Id: <20210312172821.31647-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312172821.31647-1-alex.bennee@linaro.org>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

kernel-doc doesn't like multiple Note sections. Also add an explicit
Return.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 4b84c6c293..ac1bb318da 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -85,15 +85,15 @@ typedef struct qemu_info_t {
  * @argc: number of arguments
  * @argv: array of arguments (@argc elements)
  *
- * All plugins must export this symbol.
- *
- * Note: Calling qemu_plugin_uninstall() from this function is a bug. To raise
- * an error during install, return !0.
+ * All plugins must export this symbol which is called when the plugin
+ * is first loaded. Calling qemu_plugin_uninstall() from this function
+ * is a bug.
  *
  * Note: @info is only live during the call. Copy any information we
- * want to keep.
+ * want to keep. @argv remains valid throughout the lifetime of the
+ * loaded plugin.
  *
- * Note: @argv remains valid throughout the lifetime of the loaded plugin.
+ * Return: 0 on successful loading, !0 for an error.
  */
 QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
-- 
2.20.1


