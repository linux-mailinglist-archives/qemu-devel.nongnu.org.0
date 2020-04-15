Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6EF1A9B1B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 12:43:45 +0200 (CEST)
Received: from localhost ([::1]:47618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOfWC-0003lY-TX
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 06:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45436)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jOfUm-00026b-WA
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:42:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jOfUm-00036M-1q
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:42:16 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38765)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jOfUl-000362-Sl
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:42:16 -0400
Received: by mail-wm1-x334.google.com with SMTP id g12so10552834wmh.3
 for <qemu-devel@nongnu.org>; Wed, 15 Apr 2020 03:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VTWM8r5mCw2pzFl9GbjwfDDSYLryAvqKFCJ6J7AJAD8=;
 b=T2xZitaonTiKrWYTYhX0M3MR7904lttjgsnJiQr4DI3r1pyBgCOG38qNG09QNGZhad
 PsfuChVfCHTH/I64/2pfjJGfpQVxkjrjblvqy3/ERlagiWEMGsU8KMeO4dSog5aaCvnB
 5QOrzmQ+Cjb96ov5iDpitVHePVfGDl6pEvWNy53mpA/c2akLyc9OLAfdj07qL0gkpk4w
 bZFE5Y/ldb2cJVpjy8t+xCC4ohjoX5SDU9hlB+17IzLfMeojAsZXom5A3kyjlVgsbe/C
 h+Vv+pAuThUsDeRC6umn2nQauS2HoAPvYCuTxws+as7zDs82hl+tImtebA4cpZmx6DZO
 DsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VTWM8r5mCw2pzFl9GbjwfDDSYLryAvqKFCJ6J7AJAD8=;
 b=kRxcSJlozUszKNktzMV4Ta7pbS972ExuiQUHsAzZRaxT0u2jubDKi4uoot+h1TYuDK
 ws4KCJPTy6vWVu/EfIE1tHlBM25BnKV/WZJnZMuQ7Z/CWBAMyB8sSnrVqFP4sBja28IU
 v7kwwXeNNMaG85POdtmJ8VN8pDbqQQUZ6LT59UFZ3ynnKjDU8dZ5QelInQ+GSc6tPuZE
 73xS85j/vQ3m3OAhxWTYK4REEFdOUvMLkaL6rL5T2kbPAVIQsaI//hv3vg4g7BdKfxtb
 hJopt7/rqoHSQGVC4vsyOWFsa7RK5IYndv1hnsKS3BCNF0IwULGPesJYzpq40FJ26r1+
 GkHA==
X-Gm-Message-State: AGi0Puaxfjx1Oq6E3LLa4HpnRUgzLjYGMjU6yXQp6xYMztroQrQ5eGPI
 LbQ/wwb52Q3uKWM/tPG/HIEeZP1MlQ4=
X-Google-Smtp-Source: APiQypKsdEamL/Q6na/YywMLtLktfXnvTQxHZ++brc9HNQxesOlcBnvqf5VeLoBMQkZPz6qObvht+g==
X-Received: by 2002:a1c:e187:: with SMTP id y129mr4831464wmg.133.1586947334888; 
 Wed, 15 Apr 2020 03:42:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y9sm21672499wmm.26.2020.04.15.03.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 03:42:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2BC661FF8C;
 Wed, 15 Apr 2020 11:42:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 2/8] configure: redirect sphinx-build check to config.log
Date: Wed, 15 Apr 2020 11:42:05 +0100
Message-Id: <20200415104211.9388-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415104211.9388-1-alex.bennee@linaro.org>
References: <20200415104211.9388-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::334
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Otherwise it's hard to debug whats going on.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200414200631.12799-8-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 9b1f5b33e45..25f7d915720 100755
--- a/configure
+++ b/configure
@@ -4942,7 +4942,9 @@ has_sphinx_build() {
     # sphinx-build doesn't exist at all or if it is too old.
     mkdir -p "$TMPDIR1/sphinx"
     touch "$TMPDIR1/sphinx/index.rst"
-    "$sphinx_build" $sphinx_werror -c "$source_path/docs" -b html "$TMPDIR1/sphinx" "$TMPDIR1/sphinx/out" >/dev/null 2>&1
+    "$sphinx_build" $sphinx_werror -c "$source_path/docs" \
+                    -b html "$TMPDIR1/sphinx" \
+                    "$TMPDIR1/sphinx/out"  >> config.log 2>&1
 }
 
 # Check if tools are available to build documentation.
-- 
2.20.1


