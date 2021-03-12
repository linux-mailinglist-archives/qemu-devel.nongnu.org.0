Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E8E3396B8
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:36:53 +0100 (CET)
Received: from localhost ([::1]:38426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmea-0006K5-Pn
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlam-0004Ml-Ma
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:52 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlaY-0002DZ-FB
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:52 -0500
Received: by mail-ej1-x636.google.com with SMTP id r17so54797194ejy.13
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k8DQFH+cYnnVYfj1j2PU6D1luYpEilshUOxymY5Gvs8=;
 b=X3O1VLbhV2KYysJkJqtWs4oE28mJ/rEngWw87+elV5KdSm+JW9gQ+KN+G1kV2O6Fwm
 MkWUytZWB2Z1EPTVpKg2dRS/H1FY34wRrZT9GO45xaw7ECHyTZiHkDWAaYUis97jX9EZ
 9kOhPjXSAqAimDWl4wOPy/ZAH0D81QFvsSTDBjErZFKMkBRL4O4+UDBAZaYh2O+r8GMc
 ThAtT8LBakZRZYmr+9HNZyf3nbtk8F2G0mRxNiy2kdWK3oMhJwo3eLKrDRp0Lnc6exWW
 SDBcBi4sFtOk3gh2v0rCs+CyMLJdwjWvEdnPt6iehyCl448yqvKkq6RvOR9AWxYu7uNc
 E03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k8DQFH+cYnnVYfj1j2PU6D1luYpEilshUOxymY5Gvs8=;
 b=FZmeOffstyat5uREo9iakPMXRZ2v3B2+64mvfSFppjIFtyK3n4FjPF6xg7NiBQtK1o
 Y71VydtPh29ig32Ow+LCm159VkgQJAqSXBGKs6wKtnicoCEFVoQt0IBDiwZL8Ah2crMV
 ppZhM5yGRNV2JcXxqK2Di2O10uOe7JFRxCexFgSXSlmLeOgjlAGZ/jIpamvDwCpuz6cT
 iQVlg5V1cNPv189xDklXrAk1mJGY1YmFUoL0soJFr6Akla8k9CuN47D963zT0FQVtsQj
 ytoq4H3MByOu8eKUQBk4GQSTkvq2a2+a/8wVj4q492bGkwUz2QsrcMuK4J/uGMDWN+0+
 98Hw==
X-Gm-Message-State: AOAM530ZjAiU/b7NWELCu9nCH7/Z1v3c/xrhyzOc4ynxnNKmMRoKGuCW
 DeH3mVloi7GsTZp7pg91Oy3gEQ==
X-Google-Smtp-Source: ABdhPJxPBNKxyH7KvUyYyV5kAUX2lBxn7iiXrbta43dwAD8YXbYv1lJTEv+Bk3pbDCihIfIWlN+YAA==
X-Received: by 2002:a17:906:7f84:: with SMTP id
 f4mr9423469ejr.525.1615570117135; 
 Fri, 12 Mar 2021 09:28:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id jj16sm3117925ejc.19.2021.03.12.09.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:28:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 896211FF98;
 Fri, 12 Mar 2021 17:28:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 09/14] plugins: add qemu_plugin_id_t to kernel-doc
Date: Fri, 12 Mar 2021 17:28:16 +0000
Message-Id: <20210312172821.31647-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312172821.31647-1-alex.bennee@linaro.org>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index c98866a637..5ac6fe5f02 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -32,6 +32,9 @@
   #define QEMU_PLUGIN_LOCAL  __attribute__((visibility("hidden")))
 #endif
 
+/**
+ * typedef qemu_plugin_id_t - Unique plugin ID
+ */
 typedef uint64_t qemu_plugin_id_t;
 
 /*
-- 
2.20.1


