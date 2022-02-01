Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4AC4A6815
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:37:39 +0100 (CET)
Received: from localhost ([::1]:48992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1mM-0007co-98
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:37:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExmZ-00086d-5U
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:35 -0500
Received: from [2a00:1450:4864:20::62a] (port=35380
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExm4-0000cI-KQ
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:33 -0500
Received: by mail-ej1-x62a.google.com with SMTP id s5so56580316ejx.2
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dWP+twRL5MOC0yeCWZwM8XygbnhyPigiSEVdDfOE8/E=;
 b=HIEQSEIZ+mMnqPJNUT5xbaKv2RP9NNNyyspk7CwuN7677xm0iqyUtb3yAKQWzIdyrU
 raGzrwAiHEbhc7bv3rST57sSi859Hc084DB37XdoaULT35smzGhGrJac+GPEylJ00sMW
 7UfhOE8fM+xxXEFGqw+mWJ6isiQ2RBSr5Bb9H/SlVBBiPhvjcDUWvHUFwnlkxEPLB/BY
 XWQmzTRshY1/iApgWLfVTBXCC7ZVTCnMc2jiNm5VA4qkv3S74sDN1031+142OfXUBS3n
 c2EKTCLCZPyGkS4R/4ZoHPKZy/9nVEIw873YC5+JWl7HJa9aP/i0zoKvaWp1DgzBwjkp
 yspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dWP+twRL5MOC0yeCWZwM8XygbnhyPigiSEVdDfOE8/E=;
 b=xhHqrLRG7m0aavLgJarLlnvseSsFHVqQfd4S+RIuUh5+DkkCoX3MY5fzMjd59oCt79
 R0CI+nBaoORhYazOoZI9xojGUUAs3NWJULJkTx0vlYhyiPE7FqZZ8K5zpxBLaYIwCOJA
 1Ogib/MEw+02AKA0JMuDRgPt3RVy/aU+ggKZof5NyhWbppTxkwj6yNjgpC01FQfmiRcR
 kGQTzC/WtraRllb0Y0VxxnPsEZGcZeCH/JS3beVAWDbLDGlg597xlGDbAUdxj3792BLG
 46H1PPq3IUw6WIUwrS2CwQhsWYnWTq/lEU7cYK6g7GKERpwTJWPea/af+6g20Tvpr539
 Eg7Q==
X-Gm-Message-State: AOAM5303j1MEaPWffdxvWdY7U3RBNjKqh7o0Kjd7QN3XCDB/cyZml4S+
 hG9t/jurAggIOpQVydV+zp2z1A==
X-Google-Smtp-Source: ABdhPJzKzhv3ZgDk++srPrIxztciOUKcgCFVFJeuzGr9IT8DmnUXyRvqoWga2KTaOkyANE/FdC6lxg==
X-Received: by 2002:a17:907:86a0:: with SMTP id
 qa32mr22110503ejc.336.1643739657743; 
 Tue, 01 Feb 2022 10:20:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d26sm19725189edy.92.2022.02.01.10.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:20:51 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 091111FFBC;
 Tue,  1 Feb 2022 18:20:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 04/25] .gitignore: add .gcov pattern
Date: Tue,  1 Feb 2022 18:20:29 +0000
Message-Id: <20220201182050.15087-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 aaron@os.amperecomputing.com, robhenry@microsoft.com, f4bug@amsat.org,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, pbonzini@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The gcovr tool is very messy and can leave a lot of crap in the source
tree even when using build directories.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220124201608.604599-5-alex.bennee@linaro.org>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index eb2553026c..9726a778b3 100644
--- a/.gitignore
+++ b/.gitignore
@@ -15,3 +15,4 @@ GTAGS
 *.depend_raw
 *.swp
 *.patch
+*.gcov
-- 
2.30.2


