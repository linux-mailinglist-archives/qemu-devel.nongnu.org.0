Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EEB2039B4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 16:39:07 +0200 (CEST)
Received: from localhost ([::1]:39396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnNbG-0007L2-F6
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 10:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jnNUp-000764-Hd
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 10:32:29 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jnNUm-0005gd-Ki
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 10:32:27 -0400
Received: by mail-wm1-x341.google.com with SMTP id 17so1390750wmo.1
 for <qemu-devel@nongnu.org>; Mon, 22 Jun 2020 07:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Wx+3OKlQnJklFN0bA9dHl2yXauQUDmxH1f7TXMpyuU=;
 b=rtxJco2+yMnH4D5lvbxK8/HNQ0DDP3DXmhiFFU72dAsiu81+Vl7BIx/dnuho+GxfzA
 5bCat+I0W4XlVntXEUmqM5Gfp5/Wc6odLJmsrlBRLTQBgbTIwNWS+h3j7x3QNC1H6tbF
 0BTK/D7AuHdsxy2RUjXwtb2z/uhNKS6I8C8o29Us/NoafMjKYIcZaI7uQaPDyzBENoGl
 Xt2rHfZhgAdIzVaAMU7pRPQQfZzaTJMHCa6mC4QnH5o0EyUmL9sZutjFAzHUi2XjBjtA
 J5JD4uGDY+ULUFhDU/QMMswSiIAyc2jeFoZtnxlhvAEKYDEukvThTXpuOeEVK2HWWALV
 UEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Wx+3OKlQnJklFN0bA9dHl2yXauQUDmxH1f7TXMpyuU=;
 b=KPJbH0cpgXjowCk213HY33umOI7/MQbi5wucxk31rZbukq7oLrVXNLUOHJZOz3nLJq
 awNp9+yCzdtpvSnGFgF2iv0zlZl2sZnQbAXn9vPyd0h2JOYgFg2qWzXsqUcDwYy9SkDg
 MT4HGEOROTWzKqrJFhuFCx+DWjjtI7onniSHtaEFWvees4GizJuRJ4UjbxZ40B7bzJ3Z
 QUWQNqFTX/0PWDbtbliL0LWK98pxjtfaHVQMhUt4Xgl0qniwNp/dIxZGFjSCvAbHaBkd
 x5YO5PowDmT4jCJk8lmDB+07MQGA8abJfUkEE7p3X1pWTncVohCEQvyUUJWPPmIHiF+g
 Piuw==
X-Gm-Message-State: AOAM531y1ibJ6j0qDOy2nAwlHs85hxTbVFI8ptob3XGNQT0gfY1hrngF
 N7Gc8LzXp0tpyzgfa1Z0lExRwg==
X-Google-Smtp-Source: ABdhPJyKMBn6ykF2Ift71dllhkHDT+wVp8BWd1Xr9qwOSs1v/a5e/f2XF67aW4BBzTK/ut2dTUPENg==
X-Received: by 2002:a7b:c5d5:: with SMTP id n21mr18762611wmk.106.1592836342900; 
 Mon, 22 Jun 2020 07:32:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a126sm16899979wme.28.2020.06.22.07.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 07:32:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E84121FF9B;
 Mon, 22 Jun 2020 15:32:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 12/18] tests/vm: allow us to take advantage of MTTCG
Date: Mon, 22 Jun 2020 15:31:58 +0100
Message-Id: <20200622143204.12921-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200622143204.12921-1-alex.bennee@linaro.org>
References: <20200622143204.12921-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We currently limit TCG guests to -smp 1 but now we have added some
aarch64 guests we can do better when running on x86_64 hardware.
Raise the limit for TCG guests when it is safe to do so.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/basevm.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 93859362606..dd96a6d4af6 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -553,6 +553,12 @@ def parse_args(vmcls):
     def get_default_jobs():
         if kvm_available(vmcls.arch):
             return multiprocessing.cpu_count() // 2
+        elif os.uname().machine == "x86_64" and \
+             vmcls.arch in ["aarch64", "x86_64", "i386"]:
+            # MTTCG is available on these arches and we can allow more cores.
+            # But only up to a reasonable limit. User can always override
+            # these limits with --jobs.
+            return min(multiprocessing.cpu_count() // 2, 8)
         else:
             return 1
 
-- 
2.20.1


