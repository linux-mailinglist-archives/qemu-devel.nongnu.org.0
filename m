Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D481321E124
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 22:07:06 +0200 (CEST)
Received: from localhost ([::1]:48980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv4jB-0004Iy-TO
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 16:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jv4gf-00088E-Tf
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 16:04:29 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jv4ge-0006Io-AA
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 16:04:29 -0400
Received: by mail-wr1-x443.google.com with SMTP id b6so18142536wrs.11
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 13:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q6cYMqIkyzOX02PZCCZFUIzSlg7qzIM3UYcqhB9l+V0=;
 b=Dm/LzKWTHcv4R9bX/1f7jVEdJXV6pp0jm5BwwyhZOws8gjhr5pfomQ0gaFV+No/ks5
 nlJ1Q8vxM7P/HvAgRv1RMGZkD82bAAAJq6qc6kPVnE2paZ584WNIymAoiWSkHKCQwfNy
 +okgcVwZxMwB89UVZJ01m3inQ1TDHIog4pTOuuQFJRLx+QqfZ+JAgWfMS17V8J0216Hh
 z6gGF13YhgFw/uDVNknA3UWpT5Vgl+on4LED/1B7qugbmx2vgawTPzoE4HMzUe6cSjFt
 PPedllNzn3LcSFIyYMmAak6/YF93OwFM6TLW5JurFx80Snac9lxZ07IfIi2zt85UkMPB
 +maQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q6cYMqIkyzOX02PZCCZFUIzSlg7qzIM3UYcqhB9l+V0=;
 b=rSle5sisCTU7XKlvm0Qxzi3v2Bzl4CRKcEv6GKhhNBeaQzsajvDJhYhaKYbkJS3Oq3
 VdNeX4o9FZwhwRNBlK2JUIIfjl/2FeiNa/xYoXa6CBK2VgrsuwUg7hW/SkLeWXTia9ks
 FQ5l8LxE26KC8XjoaG6CMrSBxgVic+zsc/8Dmst80W6lOEhpDHfNjjhyY0LDi9jEBtFd
 n6VLkU5s3RU5Afst64bxicXM6nlvgkw27HSvz48absftptKcs/cr9jJwLNw1qB7zMv/v
 w1GKk8S/cUCtZvU6rJzsIP97DUHbaTMEgRLNNqPkEvl0fNg5czKjzKlMJKXZU3JrN9ev
 p8lg==
X-Gm-Message-State: AOAM530m6ztQx42qUrf1e6+25aYGHQGrcUM+GrZMtl0U+TH7qig2BNji
 0NKP9FNRe6tK6BMRIBFPjbNXeg==
X-Google-Smtp-Source: ABdhPJwNWY3SgMXfjVwiYGdGYbA0lFpxY7vc3rvcdRQJAaD6W9w5gd+jwh61WKVoGWKcs6MW/BhWHA==
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr1212492wrj.14.1594670666857; 
 Mon, 13 Jul 2020 13:04:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s8sm24970176wru.38.2020.07.13.13.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 13:04:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 59E921FF96;
 Mon, 13 Jul 2020 21:04:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 08/11] docs/devel: fix grammar in multi-thread-tcg
Date: Mon, 13 Jul 2020 21:04:12 +0100
Message-Id: <20200713200415.26214-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200713200415.26214-1-alex.bennee@linaro.org>
References: <20200713200415.26214-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: fam@euphon.net, berrange@redhat.com, robert.foley@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, cota@braap.org, kuhn.chenqun@huawei.com,
 peter.puhov@linaro.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Review comment came just too late ;-)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/multi-thread-tcg.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
index 42158b77c7..21483870db 100644
--- a/docs/devel/multi-thread-tcg.rst
+++ b/docs/devel/multi-thread-tcg.rst
@@ -107,7 +107,7 @@ including:
 
   - debugging operations (breakpoint insertion/removal)
   - some CPU helper functions
-  - linux-user spawning it's first thread
+  - linux-user spawning its first thread
 
 This is done with the async_safe_run_on_cpu() mechanism to ensure all
 vCPUs are quiescent when changes are being made to shared global
-- 
2.20.1


