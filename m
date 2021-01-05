Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438E52EA82F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 11:05:54 +0100 (CET)
Received: from localhost ([::1]:44474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwjDt-0002ZR-BE
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 05:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwjCM-00022R-9s
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 05:04:18 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwjCJ-0007Un-Mg
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 05:04:17 -0500
Received: by mail-wm1-x32b.google.com with SMTP id e25so2486598wme.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 02:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OvY26+OeA5gyOKe+OcLG7rwr2aP82kVRhsB0PtbHUYY=;
 b=j5sGPoPzdMUJBccelSoHiBT76+fEEqbr/vOLpDlNtUgSpijC8Bbk5NrhE9RIwZWXFH
 P/3Nhozj4gfKdaBHGqu/j3HligNe/W9E1Wc/HBP1FlOumwock1qiJm99u2CEERq5VMpA
 dbC/nEd7I3tqbZ7jR5b4eJjwsrL5b5w5eKsqo5Ux3WSo9U0goBh4gCKZsGMWCH0/7KAz
 +b0P2g+jy7BNE7DCbVKzvLzBq0w7xrAYqWk8wsvK2Eq9guIT9MwoUbhv9dama47kLhxA
 NfKg+Fnaolm9iMylup84fuYmwRO1vve/WFHrDKa5/FR1kgPbmon50ttlpwXAsXV2Quae
 3LgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OvY26+OeA5gyOKe+OcLG7rwr2aP82kVRhsB0PtbHUYY=;
 b=D/De8V1VN5Pm9XEaoziPdGdfvtvDE0rDDQA9c3fwC+pt2xfAWL+8nDY+UAUuMY1Egp
 iBTGKRYMzmL/thH/ujeHW8axXioZ3rhVUTd+7fB3WiwpR3TOORt9XU18D4CEb7NJ2j31
 TcJwkYzkrY7aHzl6GzRqBpHkF2e5MSqIr5kVF/ip2tlhe3V3DUHhAtBoJWGykQCaK/d7
 /l/7a1brzvigzouoJlnMR/hnkBhdcULspgEeqCzyu7id5YU/ziK8Mu3jTCMMwoLvo6Yj
 KwmzwhKBMJpOai8brlzdmvMz5BhoOzyPGjJGpRHvSZ7dAwTwqZGBFAiEYHEoJ3MxpeMx
 OpMA==
X-Gm-Message-State: AOAM532OG8PjRtlVkrWwc2EvcYWschdnU2JsxvALkTUDEYnnwiS3pjXx
 fJKQBGalxGMto+4AJG/NmRZ/yA==
X-Google-Smtp-Source: ABdhPJylA6Iwk3Ea/XX06+rVlkjkNxyQqu/XVUkKfzr5Pce9GGwR7mjH8tYTxk3r4On3uKubCt9pug==
X-Received: by 2002:a7b:cbcc:: with SMTP id n12mr2712288wmi.23.1609841052845; 
 Tue, 05 Jan 2021 02:04:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o23sm101277812wro.57.2021.01.05.02.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 02:04:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DB28D1FF7E;
 Tue,  5 Jan 2021 10:04:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/iotests: drop test 312 from auto group
Date: Tue,  5 Jan 2021 10:04:02 +0000
Message-Id: <20210105100402.12350-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "auto" documentation states:

  That means they should run with every QEMU binary (also non-x86)

which is not the case as the check-system-fedora build which only
includes a rag tag group of rare and deprecated targets doesn't
support the virtio device required.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qemu-iotests/group | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index e4fb6327ae..bc5bc324fe 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -318,4 +318,4 @@
 307 rw quick export
 308 rw
 309 rw auto quick
-312 rw auto quick
+312 rw quick
-- 
2.20.1


