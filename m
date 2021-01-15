Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37072F7CB6
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:34:14 +0100 (CET)
Received: from localhost ([::1]:40378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PEz-00011V-IP
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0P0A-0005Ge-4g
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:18:54 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0P08-0002M2-8e
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:18:53 -0500
Received: by mail-wr1-x429.google.com with SMTP id d26so9236011wrb.12
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aUV0CSHAphut/le5gNpcaNl1Lefe5Sy6yOiBhggdhko=;
 b=lx4EF6/wzfsaV3aPhuDvxOPJZkxRyN0+bePqGuiuEk3Mskt8o4ffpYUOyft3BsxreD
 KZ1FNISb/wovOQWqi+T6vZXoCr7d7N2+Lpvtx42+D7ux/As2ZvASlgkKNIJUqUQsisYz
 y3ywxhUDTmAWDyluOHFIB/l8hR/RiZBXqsgmigCllnMnsuI9pMjM1fC+2gmlEDF8Yo9Q
 fXSrzHGYnyhP0NyDE20Q/HMKiJAUhENMWujxsSvbzEGhm5lFprkslM3q5VkE9+ggmr4E
 LbFzYHzZLjmrejZHaNuyomC44tti0MPRA/Suim6BghpKZX77S6oNCrM1WT4CV7rBpy+D
 lxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aUV0CSHAphut/le5gNpcaNl1Lefe5Sy6yOiBhggdhko=;
 b=BNoJP29pyerFDk7DaRVIHFDFEFyEjBP84JpOEx/Bm4DVnKpXeR2ctt+1xS7TX6WoO3
 Dw7Qwyb8c54pN0YM//1y6h0YIQoBrBrSaPtS7AX/WqHbSvd6UoYBZgylbONeqfXc03wE
 dIdJfeMR4fHN4EX2QVYmCIMQXjapdvUl6xPfXk40BPYJdXEPlOAVqVRD+OhpmHrJfK+7
 00gp0sGQDU2t33qSU4kBygtwslpWSFtIPO9XNCKIE8WorD/LVmFwyCky+J2XzyBH2xOH
 /0u0sTw+8vWwt25tcsNJLVXZEv0Fjc9A1B05HN73Avn16enwhAcC9peBNqEv9IgXJdRk
 bGgg==
X-Gm-Message-State: AOAM533nh8q5+u8lgvpFyD0J898ZIQJaDhNxOOibfjAg+mBaif1z8BPv
 qNoW7WNl64J8FJ7Ucmv8gpS7UA==
X-Google-Smtp-Source: ABdhPJwfYjvTGwyFQM3mxZ2yt4zwouofBUTLgrwDGwL4E0kbHQtaylEgUbC6f+RVKerrp2dEuoehkg==
X-Received: by 2002:adf:828b:: with SMTP id 11mr12826740wrc.180.1610716728086; 
 Fri, 15 Jan 2021 05:18:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v126sm1415840wma.22.2021.01.15.05.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:18:46 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1A8F51FF93;
 Fri, 15 Jan 2021 13:08:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 07/30] Makefile: wrap cscope in quiet-command calls
Date: Fri, 15 Jan 2021 13:08:05 +0000
Message-Id: <20210115130828.23968-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For prettier output.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210114165730.31607-8-alex.bennee@linaro.org>

diff --git a/Makefile b/Makefile
index f7e9eb9f08..2a926aaeb0 100644
--- a/Makefile
+++ b/Makefile
@@ -282,9 +282,17 @@ TAGS:
 
 .PHONY: cscope
 cscope:
-	rm -f "$(SRC_PATH)"/cscope.*
-	$(find-src-path) -print | sed -e 's,^\./,,' > "$(SRC_PATH)/cscope.files"
-	cscope -b -i"$(SRC_PATH)/cscope.files" -f"$(SRC_PATH)"/cscope.out
+	$(call quiet-command,			\
+		rm -f "$(SRC_PATH)/"cscope.* ,	\
+		"cscope", "Remove old $@ files")
+	$(call quiet-command, 					\
+		($(find-src-path) -print | sed -e 's,^\./,,'    \
+		> "$(SRC_PATH)/cscope.files"), 			\
+		"cscope", "Create file list")
+	$(call quiet-command, 				\
+		cscope -b -i"$(SRC_PATH)/cscope.files" 	\
+		-f"$(SRC_PATH)"/cscope.out, 		\
+		"cscope", "Re-index $(SRC_PATH)")
 
 # Needed by "meson install"
 export DESTDIR
-- 
2.20.1


