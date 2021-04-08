Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542A9358A1A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:49:22 +0200 (CEST)
Received: from localhost ([::1]:36282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUXqL-0000Jx-4x
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUXnW-0006ys-8O
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:46:26 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUXnT-0001AB-G5
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:46:25 -0400
Received: by mail-wr1-x429.google.com with SMTP id i18so2858184wrm.5
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 09:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G/que/tSyRJj+PBYVj3/Vhhviyxz9Ud52tSZWaOPYGk=;
 b=bJ3smp3gvjZF/PZvFtlkugmpSRh3Z5qi4SIs36q7iLSE07j8Fr9Uqty4oy5JRa0ei5
 C8loFAwY4+KQlLXdZ3sfdKyX9sAI1Jy9NnfWbrw1CTa22C+z8Io4ttF3SMoHHD1s4apz
 nsJgGJqEruvajqvW0fG8F+s3Xf3VTDJQ3nvPu0AiZdDEICL38sba0lpzePn3JKaIfOFh
 SfJ7zpRRWuOEhD3dkNBUolZ3++rIpwxzlpPsB0iSOBFd8L+ZS9os4rCrj16SkuxAL/YB
 iJ6eRwx+3vjsr5BXRkZzt6ut+OzT/6ac2fAkzx9R0fg4hh1QOLkin8gkt48KoA7IJe4M
 o4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G/que/tSyRJj+PBYVj3/Vhhviyxz9Ud52tSZWaOPYGk=;
 b=bD/GCTIkuiI4pMmyzCUAk2kDJ81+r/3qahDUXuOOlQAOLK37fFr0bVJpN81RznbwPF
 yMyRcPKQgqCKdnm+6Q05V+DmlwKHgTlSYcXIF/TKPQiGweBQOn8qO8ACxasgdWCSGf58
 Irw5DbEtJSLLy6Ho98Sq0jf7Huy5qiC+7hxkfpR0T2MTlGVSTsIwMYETDDh47hHN0tU5
 6fOHXgz2c5+sBty7emVwWe81GbBV2w4BOb6HLl6hsnL02MvPs+/h9vmypl3nMFqZn+Os
 oO9wiyiZlvpcYqYVtrS9xn6QPFoi+PjTKCPucSQnyASkpsjfo7vp/Ua1Ep6pJwWWafHR
 aY9g==
X-Gm-Message-State: AOAM531OSVrWKxoEQZHYp4GipGvyjDVGV+aT7E4jUb/OJ2qATwjVP4EV
 7rbtuiKSvo8WPVmF18OXE5Xhdw==
X-Google-Smtp-Source: ABdhPJxqm7APuC6DiAY9IPrgA43SkfTQ6qUbz5cXA3lsfw1jxwYysBXeVicC6Og/5iYY7/GXxIRgxw==
X-Received: by 2002:a05:6000:1b0b:: with SMTP id
 f11mr13125406wrz.246.1617900381557; 
 Thu, 08 Apr 2021 09:46:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g16sm49791988wrs.76.2021.04.08.09.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 09:46:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E1FBA1FF7E;
 Thu,  8 Apr 2021 17:46:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] scripts/checkpatch: fix uninitialised value check
Date: Thu,  8 Apr 2021 17:46:10 +0100
Message-Id: <20210408164610.14229-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, berrange@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was starting to show up in the check-patch test on gitlab.

Fixes: d2f1af0e41 ("checkpatch: don't emit warning on newly created acpi data files")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8f7053ec9b..3d185cceac 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1532,6 +1532,7 @@ sub process {
 		     ($line =~ /\{\s*([\w\/\.\-]*)\s*\=\>\s*([\w\/\.\-]*)\s*\}/ &&
 		      (defined($1) || defined($2)))) &&
                       !(($realfile ne '') &&
+                        defined($acpi_testexpected) &&
                         ($realfile eq $acpi_testexpected))) {
 			$reported_maintainer_file = 1;
 			WARN("added, moved or deleted file(s), does MAINTAINERS need updating?\n" . $herecurr);
-- 
2.20.1


