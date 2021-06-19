Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A743AD8DA
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:16:34 +0200 (CEST)
Received: from localhost ([::1]:39888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luX5d-0001vH-4L
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luX37-0008G2-35
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:13:57 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:42562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luX35-00034F-Ly
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:13:56 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso7159623wms.1
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 02:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=blw5xIS4dzmka8deH7YiGjUB6c0G+gONne7A8DHT/wk=;
 b=ZhEY4F/fjawjPVBtt6a4jMAxyFrYjJvq64U54rONwRw/HFCCqQDqHQvikcfzGgAB12
 XkgM8AORaVH97x3DE+0LU7peNRTlSw3I3cgRW2eSLH73LX6awKv12USWR+6ZSHObIYO+
 R2Xtcfc5JUvKqrr6aTkkGOSayveXK6Dvu0/MyGpWq8QcUtp6W6s8K39rpoRXjAEsUefA
 LiZhZjimi5Bm4kdzBT+rl4FhXtnLDNt62cN+MSCFxQui1i15FkQLSbCHRbw16QlK2nbM
 avg8ML2qLNUiuM6nNrBe/a/UMor0OXBzuL0QpAJrf/Y2+8pf+dMWgsShOMCLQR5B0qW5
 zpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=blw5xIS4dzmka8deH7YiGjUB6c0G+gONne7A8DHT/wk=;
 b=uR+Dd9BCm9uHUO8e9+/fMzwScTDglk0vIMnW5ssaEyAjABBohjwawRCqEyF6E1/R/T
 pMm+N4J5gaItYy5gxHR/9fE6ayi9uXjo1tjjZm3yHjL6dYfbJJ7liY5ahgthfQPHzepY
 nBALdN8+uvnTY6W+WD7yXZiBAseiEtF5z7Ktf+xVT9gRMhYJ1Vy/7R32n3ZXSA1d++nc
 P/jRVBmnHwxTFL+XoP1L15paoeMzsuCaJTA4TueGpqET0+c+d7Kl8iycO7FLmSJHhory
 bK6O8huG44bShmaEhH3tsfvPRIIOWksfMfZzGFW2pQkYa6rTGYYPDah+29bIozq7JXKW
 rttA==
X-Gm-Message-State: AOAM530KPxcJet14ZdlT7KwvpzK0ojqJXj2GG5AkCvOBO8GfmdD70JOz
 z6Nh8GFDNrdHc1q4mfw3LQafUIFBOLj+UA==
X-Google-Smtp-Source: ABdhPJx79G8lJ8ct23NduecIcWGb/OG2/88Jffz7fUM3i8jtFDSvHeBWHLKAC7QOt92VFdRVspBOjQ==
X-Received: by 2002:a05:600c:3223:: with SMTP id
 r35mr15186026wmp.80.1624094034209; 
 Sat, 19 Jun 2021 02:13:54 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z6sm8309715wrl.15.2021.06.19.02.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 02:13:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] coverity-scan: Add 'sysemu' component
Date: Sat, 19 Jun 2021 11:13:42 +0200
Message-Id: <20210619091342.3660495-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210619091342.3660495-1-f4bug@amsat.org>
References: <20210619091342.3660495-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Issues related to system emulation currently appear under the 'tcg'
component. We commonly refer to system emulation as 'sysemu', so
add it as a new Coverity component to cover files that have nothing
to do with TCG.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/coverity-scan/COMPONENTS.md | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index 183f26a32c9..7ed3f0a0077 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -115,7 +115,7 @@ slirp
   ~ (/qemu)?(/.*slirp.*)
 
 tcg
-  ~ (/qemu)?(/accel/tcg/.*|/replay/.*|/(.*/)?softmmu.*)
+  ~ (/qemu)?(/accel/tcg/.*|/replay/.*|tcg/*\.?)
 
 trace
   ~ (/qemu)?(/.*trace.*\.[ch])
@@ -129,6 +129,9 @@ usb
 user
   ~ (/qemu)?(/linux-user/.*|/bsd-user/.*|/user-exec\.c|/thunk\.c|/include/exec/user/.*)
 
+sysemu
+  ~ (/qemu)?(/softmmu/.*|/accel/(hvf|kvm)/.*)
+
 util
   ~ (/qemu)?(/util/.*|/include/qemu/.*)
 
-- 
2.31.1


