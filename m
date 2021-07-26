Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20DF3D5BB4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:31:44 +0200 (CEST)
Received: from localhost ([::1]:42368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81dv-0005ir-P3
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m81WK-0005p3-WC
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:53 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m81WI-0008UH-PR
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:52 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c16so1465753wrp.13
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 07:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JXrACPGjJOl3ZLJ79V5z4zW3o5n82UJCSBx/ivJqqSs=;
 b=ZR5K3lRPENDy/hWL++45V1vyRgdWrQdWgY0/u2u94TmcaSBP66JcZIicFyND5I5Ih7
 UJX9MVuvQa4wFBsWkUWRV8xqxE7WPSVrT5cVpaKKl7rrNNekYBFgZUIqA1JwWaO6+Cun
 rlRR+ifTqA6X2OWQUoY73VoKVUk7LxSfjfLLnL04D2Ok1daJjaBKzM5dVaO1+3CjEco4
 bMNmdBcHEy/i+BiGJ0ftlbWMOZPN6CINnX9iQgdyVGwrELMkYBMMl9li87aR/qrkfGP2
 gFXOwIlt329hnGiqKqJhTn+BGiHp8QtV8fZ66+Lgvbw3TXuc7DTwgzut4p+vdR9cykfB
 hvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JXrACPGjJOl3ZLJ79V5z4zW3o5n82UJCSBx/ivJqqSs=;
 b=Qhuc0Bf456snE8vOqiPvJWFJRio6QRPLnc3v+cwD0uRx6J+lWnuhBXV6trUw+jdkSV
 9xsacGBUsDmGg3YrCaJyoqSFDKcYwKnwykID/h/6kSwu0oSIXn94UnC1cM5Lp6VpwEHw
 5fuyQCR/hTDAA0uwi0bGVP0SUj23NQcKbGlFtA9GZLS4Nc8Qxrd4JYzVp7VGGkOJyJXh
 upBCxUjP1VIcyXjIE/mnca3Oy+X6FAr+bI8H9xwcKn0GF1DNvDPsZewLvBcd6410phYn
 qa1aP6tJ3F6dfa9R/EjcQIpG6gZErU9W0eKRBOXwhL5pvRLo1JcEpXhr4KxUT2JFT9mY
 3oGw==
X-Gm-Message-State: AOAM532Ww//1oU/0gw6QuaY1XfaXmsYHQYq+vaKr5rggWdJ+i4I55kZL
 G+e0MXwdzIBN0yZMSsbPIRUC8u8V+R7qKw==
X-Google-Smtp-Source: ABdhPJwXpjvE1oH52Gbqbqqarf5UjYU5hhfLcmpJ4KfwDF/t+LFy+7InLEHRqY8Vyzbl6CiSVXwslg==
X-Received: by 2002:adf:ffca:: with SMTP id x10mr102553wrs.221.1627309429569; 
 Mon, 26 Jul 2021 07:23:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 6sm13823427wmi.3.2021.07.26.07.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:23:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 10/10] docs/tools/virtiofsd.rst: Delete stray backtick
Date: Mon, 26 Jul 2021 15:23:38 +0100
Message-Id: <20210726142338.31872-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210726142338.31872-1-peter.maydell@linaro.org>
References: <20210726142338.31872-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The documentation of the posix_acl option has a stray backtick
at the end of the text (which is rendered literally into the HTML).
Delete it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/tools/virtiofsd.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index c4ac7fdf38f..b208f2a6f05 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -102,7 +102,7 @@ Options
     default is ``no_xattr``.
 
   * posix_acl|no_posix_acl -
-    Enable/disable posix acl support.  Posix ACLs are disabled by default`.
+    Enable/disable posix acl support.  Posix ACLs are disabled by default.
 
 .. option:: --socket-path=PATH
 
-- 
2.20.1


