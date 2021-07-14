Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB37D3C8714
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:13:15 +0200 (CEST)
Received: from localhost ([::1]:57382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gZW-0000ke-SX
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUf-00062J-Mj
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:13 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUd-0003pW-7N
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:13 -0400
Received: by mail-wm1-x32d.google.com with SMTP id f190so233874wmf.4
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yrx1SOe1aGBqVEv0LQKxCqdsL1GTA/wjDq9K47Jj8UM=;
 b=mZlZ3TtHcxRa1J4MZnCo8eUPy4Mr7ZI3VW9mr3XVFaYwTgfUDt6PEIbt8IYJpYJ1ej
 jziptejAui+v87hziYDTWOKms6JJbKwIdhdXDH/tdwpblA746y1QGs6IvqwZXD84szQp
 YgWpOxQFZPv81poQM1KcQPRJ4Lu12wZNRqzYTtpojntaFNaPfxMnrTGt7eSORLRcDJLq
 xphgL8e7Ew5DtY5YGx4jdSWkBM7u1Ni3hnp8vlM6yUgoVIxNoE9NSc0HSlRbxqiFFmTw
 ob707JeNOiAsQT/JP7VWcfJvDD2TRjmpRvLBdBsyfm4uFOasNhwp8HYfbVKxKkOCixMd
 s3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yrx1SOe1aGBqVEv0LQKxCqdsL1GTA/wjDq9K47Jj8UM=;
 b=GCXCSSGLT9NByRWMyciMWMOD+vpURabTGYct9w0w4TaisGIFQ53eY3tyqJ+qI7Uq7o
 PjW+uCWGToZl5dSYJ2BnE7uC74eGOeixSW6r392AMrNPU0Tra1gc7ANBJcVIPvVcu4/S
 Tk9AUdSrJe1LARylbO+XDJn0wMCQnQj8mDUcKvdRRSvuBOCckf/7QeAMTVFIMOpgthxW
 Qom6/mR9/yNzHemvW1bxem6zrZegvkap9ubs6TpsKL6DMubqjE2lxSfNhi09nlNP4PI4
 DOeB5kbu9ZDL75X7KN95zyO/KJqbIBvKGFDk2tFlnqMlvn+5ALHo15PkZru4mNKnatsu
 WG1A==
X-Gm-Message-State: AOAM530zqMVyKiiy3Lf7p4Gk7ornIzNo12xrPuiLNHhoR3h8DffEqlf6
 BLQyrpjcVH/WHB+cMkkELsDsgw==
X-Google-Smtp-Source: ABdhPJyIDel39NBtNNVITkhVlYlcBUa7ZabKmPXLD0emL/hYBq1PT+RYgTviS9s7s7yFFsGRKW6HvQ==
X-Received: by 2002:a05:600c:358e:: with SMTP id
 p14mr11572647wmq.136.1626275289495; 
 Wed, 14 Jul 2021 08:08:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n20sm2367927wmk.12.2021.07.14.08.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:08:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 59D3C1FFC5;
 Wed, 14 Jul 2021 16:00:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 44/44] MAINTAINERS: Added myself as a reviewer for TCG
 Plugins
Date: Wed, 14 Jul 2021 16:00:36 +0100
Message-Id: <20210714150036.21060-45-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623125458.450462-6-ma.mandourr@gmail.com>
Message-Id: <20210709143005.1554-41-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 83b55030ad..c4439a9488 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3018,6 +3018,7 @@ F: include/tcg/
 TCG Plugins
 M: Alex Bennée <alex.bennee@linaro.org>
 R: Alexandre Iooss <erdnaxe@crans.org>
+R: Mahmoud Mandour <ma.mandourr@gmail.com>
 S: Maintained
 F: docs/devel/tcg-plugins.rst
 F: plugins/
-- 
2.20.1


