Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FD12F7C3A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:13:03 +0100 (CET)
Received: from localhost ([::1]:55080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0OuU-00085t-3K
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0OqO-0006GA-Nk
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:08:50 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0OqL-0006Y0-Jz
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:08:48 -0500
Received: by mail-wr1-x433.google.com with SMTP id 91so9231062wrj.7
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sue2S9mTNcHq9hmZ1GOz9KiLULOP8mmJ5EI6Hxa2j+Q=;
 b=pQ4xJ21gboYQOn1oqGU0nQUeTscsccH72XxMQxy43zAg14VOSm48NgY3nCfFrfNALZ
 Pld/Bs/OuDj6er1XHfmadYhz4NjDc2aL8pZUECwx674gSdSxRT/R3X8TS9ZD4rV82MaS
 Rs/VIO5+frutrOyOZj1fiLjRlm4qcPfF/el5iVYxKhlw9w2vMTYOX3djkKihnN32NJDv
 qpMsHGjRBqTz8uThWnKs/dOx2Vs2ymEgqygNguVC7Za9zUVKNSnVjY5ZWH+T0gzb6yAk
 gO3ZGhltyN+Ae8TBGYV9FCxK/ssm53GxIHytGbAYlT8Pq4+GNE7D8YnSVMhLIQ3za1U7
 3VHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sue2S9mTNcHq9hmZ1GOz9KiLULOP8mmJ5EI6Hxa2j+Q=;
 b=OCLmMUv9CgqYKTmpA/TL5wZlqWxs4nHvGL8dB4uWfGX3fJY9wvmqGetYSXTFjdd70i
 z8EDYBtDf2GR+Y4/1PAdvnPRLE8kWPOJfG6No9GZWT1AIQGNPVm9vDvN0b+oddaTHsmV
 4PmkyPhbI/pogfDXQzjXOftvPwwysVHhIcKo8GL3kB0pOssmJtBnXue7DbAjvHmMYz80
 ZIR7tjB5tvQLlSLwzu3fM0RGHV7A6/7m/t6cWcW/AHExdnYKVcvQj7JIasOuCoQYTU6O
 WQdnmSfU23f0CsWGTuvkW0HFvm5Kcax5qKiknF6yh2PStWFPB+j/Jl6MRlL8gvB3RI1B
 MN2w==
X-Gm-Message-State: AOAM532/TPXjHv1Jsku5WXUwBaRU0APZISKkme1Y+9ggANigS3SkkcSe
 41CgHDKhiDfX+3ndGWtmjCHFfw==
X-Google-Smtp-Source: ABdhPJwHnkkCWKg+RLsbg45eWXoDv7bZUSKALFjACcKAGfnv6QcNKNlMH12vOP3St911eCRBqdfetw==
X-Received: by 2002:a5d:604b:: with SMTP id j11mr13292240wrt.406.1610716124400; 
 Fri, 15 Jan 2021 05:08:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d18sm12285167wmb.30.2021.01.15.05.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:08:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 93C831FF90;
 Fri, 15 Jan 2021 13:08:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 04/30] Add newline when generating Dockerfile
Date: Fri, 15 Jan 2021 13:08:02 +0000
Message-Id: <20210115130828.23968-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Alessandro Di Federico <ale@rev.ng>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <1610080146-14968-36-git-send-email-tsimpson@quicinc.com>
Message-Id: <20210114165730.31607-5-alex.bennee@linaro.org>

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 36b7868406..884dfeb29c 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -332,9 +332,9 @@ class Docker(object):
                          (uname, uid, uname))
 
         tmp_df.write("\n")
-        tmp_df.write("LABEL com.qemu.dockerfile-checksum=%s" % (checksum))
+        tmp_df.write("LABEL com.qemu.dockerfile-checksum=%s\n" % (checksum))
         for f, c in extra_files_cksum:
-            tmp_df.write("LABEL com.qemu.%s-checksum=%s" % (f, c))
+            tmp_df.write("LABEL com.qemu.%s-checksum=%s\n" % (f, c))
 
         tmp_df.flush()
 
-- 
2.20.1


