Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6050C3C8AC4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:23:07 +0200 (CEST)
Received: from localhost ([::1]:45220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jXG-0006DG-BH
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVL-0003Vn-Vx
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:08 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVK-00021l-BF
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:07 -0400
Received: by mail-wr1-x42f.google.com with SMTP id f17so4378421wrt.6
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=slJvTGDmyftDfr3qcoh2jhupfHgPzTcDS2fG9KBTqr0=;
 b=X2dmbdQ5QxpwgQb6lffE5yO1NQswoazcDvMgJykiQdLCp5p5fYHICWIlxrdfpbCzcJ
 BIffa2DCSPuLLaZ+ZTqmoQA5qseHT2yuZPbfoAcf8ubDxTdMqyNBb4agwZV0H5A6X1j8
 p4i7j7xWNTSJbyo+Y7DB3d2qNhFJXpbNfQTD+okU3OHhmNKIrBY2MICyI1NmQT3F1ltV
 wwlFs5yoeGX3V5nzK15YlnaPHmydZA41jeHWgj9ULbn1U2Ye9QLKbzFiEv8tATvvAugq
 OXNFAhrH7PR+2HqEvoq6rfA8c6Pmny24a2uJ+oxygZ7gcYdQkqxp55JhIQ1RUT8wnxLr
 nAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=slJvTGDmyftDfr3qcoh2jhupfHgPzTcDS2fG9KBTqr0=;
 b=eGAajtvmZuJjtikQGHUmM1IzEgvFnvY+6rNoMf4c8Ds4bRqHc+eXs/AyEdE+jfxZI/
 kmLbsk4LAnD0ZfeQNYG0BLQFGcsNS74HwFihNT/Xr3bJfKFKXERo1mdT2Xss5/4EzsWG
 5EvkoWJs9n8z4ApxozxBvummaHQyS7dc1mFP0akAjJAjxUxDQu/69XKOba+tsY6cTXLN
 aAHl3ImEiiNUCtKFAOovQSTlyKPAvwlpzT7oe9pXuwi9apUeid4uxlG2JoopoFu5WtRQ
 lYrSgl+mfBSh2uL+snxriR2VoBsWSvgzQRi/ox5RpwvmIRQYt4eEg83Hu5+YE6qEa2E5
 752w==
X-Gm-Message-State: AOAM5314CSIKZfTuqhxifbxuAfaIgNP+su+Gz0OqgPz2PChI7i5DLV21
 ycqM0MSBbZrYwXUI7nsOPDnpCw==
X-Google-Smtp-Source: ABdhPJwSE8B5BGHzTL4nyaxuAbPbqxMbcGnk/KU4MUVP2rJzRj3oJrEtzJLG0qmONuCvbgmQNF5ZCw==
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr14666041wrw.412.1626286865123; 
 Wed, 14 Jul 2021 11:21:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r4sm3591248wre.84.2021.07.14.11.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:21:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1CA4D1FF91;
 Wed, 14 Jul 2021 19:20:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/21] contrib/gitdm: add some new aliases to fix up commits
Date: Wed, 14 Jul 2021 19:20:40 +0100
Message-Id: <20210714182056.25888-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
 Yuval Shaia <yuval.shaia.ml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Yuval Shaia <yuval.shaia.ml@gmail.com>
Message-Id: <20210714093638.21077-6-alex.bennee@linaro.org>
---
 contrib/gitdm/aliases | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/contrib/gitdm/aliases b/contrib/gitdm/aliases
index c1e744312f..c6ed215e68 100644
--- a/contrib/gitdm/aliases
+++ b/contrib/gitdm/aliases
@@ -31,6 +31,9 @@ pbrook@c046a42c-6fe2-441c-8c8c-71466251a162 paul@codesourcery.com
 ths@c046a42c-6fe2-441c-8c8c-71466251a162 ths@networkno.de
 malc@c046a42c-6fe2-441c-8c8c-71466251a162 av1474@comtv.ru
 
+# some broken tags
+yuval.shaia.ml.gmail.com yuval.shaia.ml@gmail.com
+
 # There is also a:
 #    (no author) <(no author)@c046a42c-6fe2-441c-8c8c-71466251a162>
 # for the cvs2svn initialization commit e63c3dc74bf.
-- 
2.20.1


