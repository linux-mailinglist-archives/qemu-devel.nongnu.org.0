Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F7133EA7F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:26:30 +0100 (CET)
Received: from localhost ([::1]:37536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQZZ-0000Am-1e
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVn-0003nl-Gz
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:35 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:33714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVl-0007xn-SW
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:35 -0400
Received: by mail-ed1-x531.google.com with SMTP id w18so1028826edc.0
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 00:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oZoHAKKtaXp3YWXMdf36XUZYzFbYS4h/e3YtWNeuchc=;
 b=gy62vv54ZkbveyrTseLe9Ytdnu2+mMur/EF87SV7aEfRn3m+Td/zG2qtIOeeTq3cAe
 s5Yv8MOfsFSXNIHRwV/q2YR6DIits+y1xAQ0Jxhmj/7XvL8ZBQBZ09LPc6oSXZWnPQVC
 XAblA+c99vyxoAwBOqxy3JyQNntruUS8VDlE5U4toOBhpCfWsvxFic1jgBn0QWKDD1uE
 0VSR02csYyBPl2ys0plRXmVc5XBbygDB1fBvsbwDJCF0tcOWjLu7IMbVE21LYsTcv+4Z
 wNm7NWgT25b8Hk/stUVzoYO3d7huueuRqgam3+a9NiK3ueagFyv3oBd3kZdao3GjYEtP
 nPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oZoHAKKtaXp3YWXMdf36XUZYzFbYS4h/e3YtWNeuchc=;
 b=gAhaFN9biHC9QqgMY3JV4CDLeob+C9EO0XVxUECFwhUm3Sd/u5kERo6wKF5jEUJVSL
 23FAF4lGQjOjpbQLqs34LG6Ero6bLZW4aq8WC5EM2RXHQ0LKeuFT3dzX8etcV5Cz+PKm
 1RRc1J0xZTq4X5A1w8Qqj7hl5Sl32gbJaceGlHDtJndlhtEnWCWVtgHAAozqnm5n5Ah4
 Cs5gfhf0g7Vno6iMRUZD9EoUn4hoFpwLm8BECmVp+P90R9NZXC3wWzUJlQ28QvHqc7cc
 lfSIrTkgUzvU9x2oNXa+n77VeJu1HcXa+JG3Qmc5AjcjC6XWXg76e8DbUuE9+sciKYZk
 p96A==
X-Gm-Message-State: AOAM531BcFosz54alt0dUCylI1UPXXwfa04Sta1hw8zt78LMKn2Ea6X4
 5O8nscGZbBy+SfLvGxEc1G1MxQ==
X-Google-Smtp-Source: ABdhPJxnOfDFMkTGx1o4BqjzC1r+hIOwDvoc80ITVlDB/J+6/b1RoHwFZeqBJip99XPn6g6Y5hr66Q==
X-Received: by 2002:a05:6402:32d:: with SMTP id
 q13mr40632958edw.17.1615965752655; 
 Wed, 17 Mar 2021 00:22:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a26sm12622593edm.15.2021.03.17.00.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 00:22:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 78EF31FF98;
 Wed, 17 Mar 2021 07:22:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 09/15] plugins: add qemu_plugin_id_t to kernel-doc
Date: Wed, 17 Mar 2021 07:22:10 +0000
Message-Id: <20210317072216.16316-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317072216.16316-1-alex.bennee@linaro.org>
References: <20210317072216.16316-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210312172821.31647-10-alex.bennee@linaro.org>

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index e4d782b628..272d240a8f 100644
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


