Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 600C72799F9
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Sep 2020 16:08:26 +0200 (CEST)
Received: from localhost ([::1]:60410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMAsD-0003dY-Bm
	for lists+qemu-devel@lfdr.de; Sat, 26 Sep 2020 10:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kMAoj-0000eO-65
 for qemu-devel@nongnu.org; Sat, 26 Sep 2020 10:04:49 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:51362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kMAod-0005Nl-K7
 for qemu-devel@nongnu.org; Sat, 26 Sep 2020 10:04:48 -0400
Received: by mail-pj1-x1031.google.com with SMTP id a9so1006094pjg.1
 for <qemu-devel@nongnu.org>; Sat, 26 Sep 2020 07:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ZjByY0MppOyobXen+0uddzbK8uVuelULUAbb8n9Gk0=;
 b=f+8oAajkZ80oK2YqmqVhv7NBb0mYkhBkQUXSnR0DBvMyyHdMKaAQJpZ+IiDZYxhocf
 KBF8cw5phiBsn4OXTNzvEF6LYgSz2JrnFcmwD5O8CXiPP5o/XQuKeiHOs0OI4ZprlKzY
 mMiUxNcj2EuZXFlujATPQlZMGAvEvLeSWfNhFuUGIbPx7zLd4rlIwXLPo5+BYrCrEZsu
 X9DbQR9S8bk2ShsCKVShaJcjgVHM6D/jmksT0Qdv9b+mo0Ky/U84ddLEfpz7hb7q2chY
 1sbn7IBeH61DWEkEOJ3SfSmztqJMcZE/zKho7bb1VnglWy+l4bXpPIN/zo871JYYjGcx
 jCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ZjByY0MppOyobXen+0uddzbK8uVuelULUAbb8n9Gk0=;
 b=VKJf1Ytmk7JQRnL9f4rlVyiLEUDh2kZAPlAxuR8uTu5MX8nD60Fwgg14lGkZzZDayx
 BP5pvQC2DMewTNBzy5YL8ar2Anc6168h6PdH+FIvhyvC12oBkFbRx4NaBgijgUVRRXs/
 +HipzO4HyVxXbHFSuHqhwmXxlMEmjh1KBUCWKe962yTmrAHEQeZA1twqDVQCK8osCxKS
 pondf4Ez55GSbtX8LQYijC+Bei0WI9C2wxSbT0UHa6ssyFDsTA01Mfoj0bibEhT9Rk7Q
 Y8g/jIkUc8rYGR7iK1EGRFJLTooVLmUG8rBpb+/rd5wyfBTdBGoy7yWfxQrshMdg62QY
 Hbbg==
X-Gm-Message-State: AOAM532NTc9QK08vb2R73CpabJGmMVm8Z9xL955NddiWRhSPKr4IWUoA
 P3dR/WgDDAO0vvk4mPrvfNaTKl2JbooyfAum
X-Google-Smtp-Source: ABdhPJwGDuxtU+7ekrQqaSik30G4NfyRUfJaRDQ2Hx9UIlpnTgyO+6eNvVH7+TvYRQCQebo+mKZzdw==
X-Received: by 2002:a17:90b:1083:: with SMTP id
 gj3mr2175590pjb.126.1601129081810; 
 Sat, 26 Sep 2020 07:04:41 -0700 (PDT)
Received: from localhost.localdomain ([222.95.248.6])
 by smtp.googlemail.com with ESMTPSA id k3sm6091109pfp.41.2020.09.26.07.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 07:04:40 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] cirrus: Enable plugin in cirrus for windows
Date: Sat, 26 Sep 2020 22:04:15 +0800
Message-Id: <20200926140415.1286-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200926140415.1286-1-luoyonggang@gmail.com>
References: <20200926140415.1286-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x1031.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
 Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 .cirrus.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 86ea33926a..5363142373 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -104,7 +104,8 @@ windows_msys2_task:
     - C:\tools\msys64\usr\bin\bash.exe -lc "mkdir build"
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && ../configure
       --python=python3 --ninja=ninja
-      --target-list-exclude=i386-softmmu,arm-softmmu,ppc-softmmu,mips-softmmu"
+      --target-list-exclude=i386-softmmu,arm-softmmu,ppc-softmmu,mips-softmmu
+      --enable-plugins"
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make -j$NUMBER_OF_PROCESSORS"
   test_script:
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make V=1 check"
-- 
2.28.0.windows.1


