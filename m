Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBBB2F4E60
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:21:22 +0100 (CET)
Received: from localhost ([::1]:56408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhxU-0002Gq-Gp
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:21:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqq-0005fc-Kx
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:24 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqo-00006V-TN
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:24 -0500
Received: by mail-wr1-x436.google.com with SMTP id t16so2504879wra.3
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 07:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yU/oPNCcQU7/4kC+ZCz+tw6aTovOGv7Kkq2eB/9h1SU=;
 b=ogteIiE9pzQ5WqRJ51ukTDRLnzpl6FLu6rTw2iMI60T/S44zVn02nmFvdR7/gs9YBk
 DoxSv+7fPssN4PqiTZPs3fRhgXHOiYyQDMGg+X8y8y9fvFr2VlQsycNwALtA3O7B18/i
 IBRpl26ahtHs+hfvf4+tMWJviZy2AbV9XtSWbhcgf6W5Kpx6FmbZjvGcYqt8f6TNqmB4
 kkDcNg+yL0T+tbocE/GqtGbRvods9/ASTdBaFoieOkb7kwyBCNkedkFDbimynnZFVNSI
 Apu/rptJlic6cay/gC8at4Cf71iT2uEvlU/RyWnWgenR+r4V5OlP+kiltl2l/IYG2GaB
 Rn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yU/oPNCcQU7/4kC+ZCz+tw6aTovOGv7Kkq2eB/9h1SU=;
 b=lC2sfLVEaWPaxzTSoj1RcggehLc/cXBBitGBDzJUTXgWw/atpSH9lUkvaqvlzctN7n
 MCYmJj596/GEqRKDqHesw5Ie055ekGJ60zxaMgjEYP4YTvqK7DlBeqtR3jzTUkE8vmxK
 3joRrFSS+YozWEaf55c8FCN6nQ0GR84876MJIr/1ncMArTnFRWWx5Nj0p0nfGP88BbCh
 T6TQvb0OvmjJBoAjBxElGT7kE8ZxY/RE94vfL7M7QiJSpBas4dOf90cTEuNfk7gBCgGG
 n13aujCjQpv3qbcqE1M6cKr/+BOhVfZ+qDJM7YyUnRRFlBGHWR0Ku/HhFMp2hJVQjldg
 hDYw==
X-Gm-Message-State: AOAM531C/U4eLm4ldzJxfJAgA0D1DUlAzQtICVGHeW9s1TQILNwX2V1d
 +UwNnGBxAULGzAXZcHfZtGQ/jS770J+0zw==
X-Google-Smtp-Source: ABdhPJzqvmOKIWopzYgRnXwJhSzq26YT28QgmPpqyg/LlW1g3dQmfGwrpM0inAhVf9WFnBwIrNp/Vg==
X-Received: by 2002:adf:d4cb:: with SMTP id w11mr3043652wrk.276.1610550861636; 
 Wed, 13 Jan 2021 07:14:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g14sm3491173wrd.32.2021.01.13.07.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 07:14:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 353FB1FF93;
 Wed, 13 Jan 2021 15:14:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 7/9] Makefile: wrap cscope in quiet-command calls
Date: Wed, 13 Jan 2021 15:14:06 +0000
Message-Id: <20210113151408.27939-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210113151408.27939-1-alex.bennee@linaro.org>
References: <20210113151408.27939-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For prettier output.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

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


