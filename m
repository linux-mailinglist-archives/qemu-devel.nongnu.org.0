Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC10DA07F3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 18:59:34 +0200 (CEST)
Received: from localhost ([::1]:38780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i31IC-0005XE-Vz
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 12:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42500)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i31CH-0007mK-Qd
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:53:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i31CE-00010K-1l
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:53:23 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39830)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i31CC-0000uK-1L
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:53:21 -0400
Received: by mail-wr1-x429.google.com with SMTP id t16so515821wra.6
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 09:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xJKTf83Fi+RIXDJqcB6eYqb17WqVXupOn4gsH5fbN8M=;
 b=rK23+Fsok4aQ6bzSQKkw32xGCJRE8f5yWevl5C5P3QYoMlvdRfqJ4sfdHK7C6Ir0vf
 wr5AkX+ZuqiNVyEXv3S1dnb6/iGP2gYxuD1Zb1vhYj8QLCY6agz0MuT4qGFhxzP2M+3W
 Wi0httWSsrlimF69cqLGcl2B5RNQugkvTYumKT64pgVeCKFZhahRSbaPZntqgn3uKWaI
 c6qqk6Iahw/WEVRHziWmeSnieoAHAR01DurgVFC7RRYJZ50V7T934PFNv4z+/22SIOjf
 QaC0Pi97gwO9VG3WeT5UkRCOVyKDiMFFGq9B3ozyUlNeltlzSFYTjuY6gl0L+aaCd/bI
 c6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xJKTf83Fi+RIXDJqcB6eYqb17WqVXupOn4gsH5fbN8M=;
 b=O/h8H43w6cQ2eRm3eyIkJw0EYgT9DIKQj8tcZo03ZYzoX2TrCretuIBJhSprIXIFjq
 jBVx/VCB/OVh0jBCg5Ik2oyjCzPWPQTBaSgRA4xebgEw3kvTyJ4k3EObtBgAWh5P961A
 ikkHWXkX482Kl3n7mEdJi6/DVjrVuuYz61FQgD6Ox+/TzERFCWC7gRs9EnoqH8GXPB1F
 80+Bs3AnLJhbJDVJ/besGOEoZn7sLI3SfA/SsyEKco5hX3pbGp94qCUk8vFmhFFsvBAQ
 1Q1FMZ/yl4EgyjAguq+spjpAsrEaiGB6SxWrR/HPIDFXDaWWBUB62SCQc9ns9UzGKG6j
 /8zw==
X-Gm-Message-State: APjAAAUG2MulBPkNXO+MdEEn9KVxToRjqWZLDxmlKGne0bVsB+P0Mt54
 s2nKSDCNnGhC/FJxdgyOCaqIJw==
X-Google-Smtp-Source: APXvYqy5BuSzzQc7rY+JX5Krz3Z4+i5dRPW8sKK3pSKUthBpRp62tlWLq7JRd1Ncan63j6YsrFylBA==
X-Received: by 2002:adf:f0ce:: with SMTP id x14mr5917017wro.31.1567011194603; 
 Wed, 28 Aug 2019 09:53:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e13sm3283315wmh.44.2019.08.28.09.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 09:53:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 118861FF98;
 Wed, 28 Aug 2019 17:53:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 17:53:06 +0100
Message-Id: <20190828165307.18321-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828165307.18321-1-alex.bennee@linaro.org>
References: <20190828165307.18321-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::429
Subject: [Qemu-devel] [PATCH v1 8/9] accel/stubs: reduce headers from
 tcg-stub
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need much for these. However I do wonder why these aren't
just null inlines in exec-all.h

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/stubs/tcg-stub.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index e2d23edafe0..75b10ab54be 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -11,10 +11,8 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "cpu.h"
 #include "tcg/tcg.h"
-#include "exec/exec-all.h"
 
 void tb_flush(CPUState *cpu)
 {
-- 
2.20.1


