Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01912646BA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 15:18:42 +0200 (CEST)
Received: from localhost ([::1]:38484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGMTJ-0000c3-VM
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 09:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kGMQ0-00047y-W1
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 09:15:17 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kGMPy-00068x-I8
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 09:15:16 -0400
Received: by mail-wr1-x436.google.com with SMTP id s12so6632377wrw.11
 for <qemu-devel@nongnu.org>; Thu, 10 Sep 2020 06:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uwY/+7vlmf43PbXcBb0gVGgVr3dkngqHO5dviJBNyX8=;
 b=MiDiAxtWsFdTp6EJ/FvvAikoaY4/KXoz65QsAw/nHrANWFIIXKvr+UT1xJu0BxVYcY
 qINcYD+QU8LFMp1F6qVuuD4U0d6WspcvU9ngACbOd3r2Mn6tHJ8g23zbrsOWKJynJuFZ
 cbpBl8XQHTy7neDmkijFbZDPfC1pssAJSAYTpGVKX7ePP+FnTyAnOJk9jyJc1iiJ6Fcb
 dCxNErL/mdfvgpUchIiLxCv6e8gNYsAQtdCEF1iy6n5DLBV0Ylpo98m4aYeLszn1OTN0
 DEkI/0SuZiuul8u1LvXaMOheNqY7PR5IoFYNZG75/rspKtUb4u2WPq8XSXsAHCRtix6/
 //hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uwY/+7vlmf43PbXcBb0gVGgVr3dkngqHO5dviJBNyX8=;
 b=bqeaZJ0r66nAuInmn58hBwAAIdaGr1JzhFcwPmAQFqeCT2N+iqwWqGnqKD77lrzEKl
 AyLLFrWUKks51/PJ2iPcmQEH0YNL/k6Dy+BKLMppLFvz7yljJWOUQMB2b2nRC5brTAwO
 QGVBy9Floa7nHYG8Rd1XLyYFLd1jBxzQFkrr9wqv/4bcgo0pNSVOg+2axxsM+5eyxmze
 AXLSCIYhHCBDNjqI2VjyH0Gg9e70AjLXor0tyowNAF6b2kwkwl4PGS6Th3bwEpusiWfI
 ogNgOoOXLuckRPhFpRdTiz2e3bcBUmlzI8Uo5Kw45pC+lEPNM4pjhD5wg/Dcqqfq4NpQ
 1VSg==
X-Gm-Message-State: AOAM533W1cG9zg2YlOLUv43ry+VN8kJBgHnbgioENUvkMripdnznZEoK
 S7Z4vrAmmJP8hGV4/JnH+uXFiA==
X-Google-Smtp-Source: ABdhPJyxRnDHhJY3C2dhZ9Md/N6Q4QK/sNkuI1i1EPfwlcyMHjOza56HgRx3IDyKq8FW7+cQoiPtmw==
X-Received: by 2002:a5d:514e:: with SMTP id u14mr8864053wrt.211.1599743713144; 
 Thu, 10 Sep 2020 06:15:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c206sm3802345wmf.47.2020.09.10.06.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 06:15:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CEE051FF91;
 Thu, 10 Sep 2020 14:15:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/10] docs/system/deprecated: mark ppc64abi32-linux-user for
 deprecation
Date: Thu, 10 Sep 2020 14:14:59 +0100
Message-Id: <20200910131504.11341-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200910131504.11341-1-alex.bennee@linaro.org>
References: <20200910131504.11341-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's buggy and we are not sure anyone uses it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20200909112742.25730-6-alex.bennee@linaro.org>

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 851dbdeb8ab..a158e765c33 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -424,6 +424,13 @@ linux-user mode) is deprecated and will be removed in a future version
 of QEMU. Support for this CPU was removed from the upstream Linux
 kernel in 2018, and has also been dropped from glibc.
 
+``ppc64abi32`` CPUs (since 5.2.0)
+'''''''''''''''''''''''''''''''''
+
+The ``ppc64abi32`` architecture has a number of issues which regularly
+trip up our CI testing and is suspected to be quite broken. For that
+reason the maintainers strongly suspect no one actually uses it.
+
 Related binaries
 ----------------
 
-- 
2.20.1


