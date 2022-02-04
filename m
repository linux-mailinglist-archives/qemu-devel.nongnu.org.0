Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294AB4AA176
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:56:32 +0100 (CET)
Received: from localhost ([::1]:50898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5d9-0001nV-9s
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:56:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5R1-0006ol-Ix
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:59 -0500
Received: from [2a00:1450:4864:20::431] (port=43651
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qz-0007NK-C0
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:58 -0500
Received: by mail-wr1-x431.google.com with SMTP id r19so2632482wrg.10
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1u4nTPcgCnoP5nWCHXH8kN4KACknk+m+YDzrxf6W/lA=;
 b=iEA6tSnDsH/F9vPYjKrNzVdSng4oSLncb8uAbMG5wljA/+o8ckt9QWV4pTn4haH2bI
 0+f4kfSuckQNPiwOga2s9O+rhjxPEFezYxhutYEL72B/vZ5l6BZCCngv2/YlZqX2Lyzg
 ykpisJPQ31WoRgXNMkxtjHubJZtMS58oBuDF2BReJ44rhgOKFsku87kJCX4rrwvIdmbL
 9jepMWGrtPU78wVsyCnMF7VD87DATHugmm1jJUzz+wm3hI2NXAYEOZDtammjhiZNEnpw
 Q7UwSUlPaqiT99t30fETGJR68weyaIqn2cnFwlpzzP0Gf2km7kymt5sdhYBIn9lPaTXJ
 7EUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1u4nTPcgCnoP5nWCHXH8kN4KACknk+m+YDzrxf6W/lA=;
 b=igQ4DSxC/rTFgI+UI4hM/2dUHLutJfmGOMV7iJGLKRgUFGRdrO6IcYO+nzrCUXK9i7
 yMZlbkBPdougZIc8S6YTvRonYfvbDG+Q0jd6LJzLwR9vj+9vIeTdI0WVoaEDXi3ufGLn
 w/b7YGa5X/LViTlqPBYoLLDw9A60dU/SXZvieHD3tJL3AY+3wQj/Wk4ZgUhwBtzWXmrL
 4Ik7tmhdUMnlgtnOV237CZ6Zf32xeUFX5sgT0GxPZiElEqqm1Yiag55oaSin5SvVo8Tf
 XLN3+0bi3x5ABncBbduHvBFiTFr2HH1oEjsCmIw0z9P7+bVskOswoxL4vZYXk4go0+/C
 uuAA==
X-Gm-Message-State: AOAM532pL8oBzIa48kotrU60oESHD3DDUfSSgYpk1AqMVV7DbGIs0LO0
 OohT15wV4l4JUyzUKkIgwxh0ow==
X-Google-Smtp-Source: ABdhPJzPeMWvg/OIOZctPLjiOKqciCt8RsjAJwtuLzPL0S3H7gEg0PNQAYktKFoJ2B18qbqEx5GhyQ==
X-Received: by 2002:a5d:458d:: with SMTP id p13mr547103wrq.580.1644007436173; 
 Fri, 04 Feb 2022 12:43:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q13sm2192719wrm.58.2022.02.04.12.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:43:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 83A3D1FFC6;
 Fri,  4 Feb 2022 20:43:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 14/26] tests/lcitool: Allow lcitool-refresh in out-of-tree
 builds, too
Date: Fri,  4 Feb 2022 20:43:23 +0000
Message-Id: <20220204204335.1689602-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

When running "make lcitool-refresh" in an out-of-tree build, it
currently fails with an error message from git like this:

 fatal: not a git repository (or any parent up to mount point /)
 Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).

Fix it by changing to the source directory first before updating
the submodule.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220201085554.85733-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/lcitool/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/lcitool/Makefile.include b/tests/lcitool/Makefile.include
index cff7c0b814..6b215adcd1 100644
--- a/tests/lcitool/Makefile.include
+++ b/tests/lcitool/Makefile.include
@@ -13,5 +13,5 @@ lcitool:
 lcitool-help: lcitool
 
 lcitool-refresh:
-	$(call quiet-command, git submodule update --init $(SRC_PATH)/tests/lcitool/libvirt-ci)
+	$(call quiet-command, cd $(SRC_PATH) && git submodule update --init tests/lcitool/libvirt-ci)
 	$(call quiet-command, $(LCITOOL_REFRESH))
-- 
2.30.2


