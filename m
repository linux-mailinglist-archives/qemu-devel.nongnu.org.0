Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342D633EA9A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:33:57 +0100 (CET)
Received: from localhost ([::1]:59074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQgm-0000c2-72
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQbj-0004o9-KK
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:28:43 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQbh-0003GC-VA
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:28:43 -0400
Received: by mail-ej1-x62b.google.com with SMTP id ci14so934548ejc.7
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 00:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SLpgbU4y8oq4TnAY1QjnMUkHwHhGEj8HGSa5T/LlBKc=;
 b=tpMK56EmS7tdJij07sRlK+oMsf9/aKHxmItX7cZ5EL1D9pRGXhf+ex0dc47Od3vqvL
 FCKS3d0dDoOEoxbMS3Ozc/nxnKK4zcIKeIXtJprHqaFmMNvtwzS5gL2YEOimINvJ6ePW
 o0eLbslCvDT+BV0h6uSXKJ2nsldtF4ieRXYVAzlFMobB6u8fIjcshvJhhm8j2H6oyDGb
 L6LyGzz7oSVBjQB54romeXfJZimcsQUhVxCtB8SMkKEldG+31BadWSyBQ8/cGy576Osg
 A5EaH1F+WJkjvOoOT8Xgeabd8THuTfMhMh17qZIWfCXWmF51rkGJvU/5//vVgFskDGGP
 C+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SLpgbU4y8oq4TnAY1QjnMUkHwHhGEj8HGSa5T/LlBKc=;
 b=lRnFKsdtwrvdm9lpm0idLgwerEuPkll8qF34q6bGXRPZeZxoF07L3UogV6vw4I77BM
 eJcaEfBzcI4+gE/XSW23DYdnVwYxGny8Nwb/HLY3TleJOb6UIUE6NGWl5g1HdKQgD/2R
 J4tv4WMPeigvZPAWMl430wws++cWY6sPUTp2l96ZvuVrmle2y+8k/yHNluhdP+6sy4xV
 gr2ccbimRTmIK5VBk9a72YYwLCz09UBA5rUTGDaOHcxqDAHRFs/p7wziFpZiw5EC117m
 Egfoq1n7Oz4mIZCf4emQOrQ9kixJn/WqsJw1sQY9o2P5KZZhQun6kgIOAfbDTBRDXaOi
 XOOw==
X-Gm-Message-State: AOAM530g31me0/fRIgTJehETeDUow03if5ZRQF8IZnVDA8uVVY1kipUx
 WHMsduwehXfSyowBEiZ+HJM7ZQ==
X-Google-Smtp-Source: ABdhPJxK9xCx5LZ9j6kqVmcdQFpFOEXWg3dh7xD7vlaTOs49rCzrMTPi+wjOrRMAnarb/PfXeMoSJA==
X-Received: by 2002:a17:907:d15:: with SMTP id
 gn21mr32915875ejc.337.1615966120325; 
 Wed, 17 Mar 2021 00:28:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t17sm12001361edr.36.2021.03.17.00.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 00:28:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DDAB91FF9D;
 Wed, 17 Mar 2021 07:22:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 14/15] plugins: Fixes typo in qemu-plugin.h
Date: Wed, 17 Mar 2021 07:22:15 +0000
Message-Id: <20210317072216.16316-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317072216.16316-1-alex.bennee@linaro.org>
References: <20210317072216.16316-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

Getting the comment consistence with the function name

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201013002806.1447-3-luoyonggang@gmail.com>
Message-Id: <20210312172821.31647-15-alex.bennee@linaro.org>

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 9e67ab1aa2..97cdfd7761 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -256,7 +256,7 @@ void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
                                            qemu_plugin_vcpu_tb_trans_cb_t cb);
 
 /**
- * qemu_plugin_register_vcpu_tb_trans_exec_cb() - register execution callback
+ * qemu_plugin_register_vcpu_tb_exec_cb() - register execution callback
  * @tb: the opaque qemu_plugin_tb handle for the translation
  * @cb: callback function
  * @flags: does the plugin read or write the CPU's registers?
@@ -282,7 +282,7 @@ enum qemu_plugin_op {
 };
 
 /**
- * qemu_plugin_register_vcpu_tb_trans_exec_inline() - execution inline op
+ * qemu_plugin_register_vcpu_tb_exec_inline() - execution inline op
  * @tb: the opaque qemu_plugin_tb handle for the translation
  * @op: the type of qemu_plugin_op (e.g. ADD_U64)
  * @ptr: the target memory location for the op
-- 
2.20.1


