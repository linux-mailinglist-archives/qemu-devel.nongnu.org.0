Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EEE313E2F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:56:31 +0100 (CET)
Received: from localhost ([::1]:52190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Bi2-0006gc-Sd
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:56:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95q8-0003n0-7U
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:40:30 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95pQ-0007kf-In
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:40:14 -0500
Received: by mail-wr1-x433.google.com with SMTP id g6so3913306wrs.11
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KuHSv4f+eWd3LUAAxodJ01HAzlmeXXXkmri5CwIIPdg=;
 b=wSK6i0wNCZ5EbK6m2GCZ5gIyAn7gYssRaNHqR3MdrAANvACeml+jWV19CsBeTSycMi
 QUQCYuSBBW9tmrfzrnaibyIDe0pTHcxSV4y8uQPyMEEHOqYKGuuKs2fIEUSkpWl5GJGT
 p+yyPEaEebGyMPdggbO/trzJRGGKTcLpZ3lqVBwINJDKUs5eXAoSkMACja9PFqhtprJq
 R6JKsk7U0PHAjttQuT+Rc4rDEO3sVbLYKJ2xX1GsCdgr5HHCS6BDgOpKjvcniWSGUS5l
 PqjP4t1j/uxfZYKmq9E8fOJj5ZbgxIhnvRrFlChX7clus73p/5yxSalg8BupfZK9+o4P
 S+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KuHSv4f+eWd3LUAAxodJ01HAzlmeXXXkmri5CwIIPdg=;
 b=Rvn7LmgbeBRy7zOH6gDKTE7jSO7V6Jls6ckfDYne3sAEhWeaK9gBim3rVtAkwR8Nrt
 qaexMSgmN2qPjUIsfZDuLVl0hEY4lB+hOsPK0weyMtRCmXPxcDQcilU0FSsI8PK2Iecw
 9IOAiC6UwkRj3b3O3AkZrTIOxZcBxoQl3wjExyMw+Ee6U1F3SqyjmMNeLps7+uV0QTXm
 ZDoCxyeDSu8lwXM2erDepQ7IRAHH6hjdoqvI2tPRaqr4rXNty7SnSsUedaaraN1EJ8FZ
 yRZKPPg05So+m2OzselbFH9e+PiQuSNDbWqZMiFfUiLXf5UoYF2973eJSRUTUutaQQRT
 zd3A==
X-Gm-Message-State: AOAM5320o1hIOJb0mygd/EH3nVHyROp2RN2jMXqf4StZ4mFOGCOx8C/R
 5oHrMY2nLyu+YniZl5/g53IqNA==
X-Google-Smtp-Source: ABdhPJyzHAubfaCRE3iTeTxTZaPZWtLvtAx9JL4loD+ZlamnJ9573YP8pHaSQdE2XZ58+U7sSt+ziA==
X-Received: by 2002:adf:9e47:: with SMTP id v7mr19368896wre.185.1612787922515; 
 Mon, 08 Feb 2021 04:38:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z8sm27763630wrh.83.2021.02.08.04.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:38:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 902B01FF98;
 Mon,  8 Feb 2021 12:38:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 09/16] configure: bump the minimum gdb version for check-tcg to
 9.1
Date: Mon,  8 Feb 2021 12:38:14 +0000
Message-Id: <20210208123821.19818-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208123821.19818-1-alex.bennee@linaro.org>
References: <20210208123821.19818-1-alex.bennee@linaro.org>
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
Cc: Luis Machado <luis.machado@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For SVE, currently the bulk of the GDB TCG tests, we need at least GDB
9.1 to support the "ieee_half" data type we report. This only affects
when GDB tests are run; users can still use lower versions of gdb as
long as they aren't talking to an SVE enabled model. The work around
is to either get a newer gdb or disable SVE for their CPU model.

Reported-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Luis Machado <luis.machado@linaro.org>
Message-Id: <20210202134001.25738-9-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 36036aa2f2..57813eba7b 100755
--- a/configure
+++ b/configure
@@ -6115,7 +6115,7 @@ fi
 
 if test -n "$gdb_bin"; then
     gdb_version=$($gdb_bin --version | head -n 1)
-    if version_ge ${gdb_version##* } 8.3.1; then
+    if version_ge ${gdb_version##* } 9.1; then
         echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
     fi
 fi
-- 
2.20.1


