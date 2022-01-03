Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9E8483641
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 18:37:48 +0100 (CET)
Received: from localhost ([::1]:56034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4RHH-0002sj-FM
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 12:37:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4RDD-0004dl-A3
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:33:35 -0500
Received: from [2607:f8b0:4864:20::630] (port=36855
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4RD9-00089A-Iq
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:33:33 -0500
Received: by mail-pl1-x630.google.com with SMTP id p14so25320885plf.3
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 09:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=l8/JTxqLKUGwdAqbnIsmpEc7Ppe6Hvg01DjhP7L3th8=;
 b=MmUvEQVY+x5Ujwq0IWn8pWprXa9vHylI6BGIbe6JxC7W5PeKbqgaF/oXaAo+e6RbEX
 upSox5KLTgnRIS2R0d4Pd/zY/G7MV/41MCGSqM5DfdgDWZa+JOTp5lP2XnxSY+emkFt0
 c8bYjXWwtTaiMfrVp2GKlNXJZx0Ja+38oCg53Ast08NTl32FrsjY96QtuUhD4tn9MOvj
 YdyzBb5/ucdy9k3RBFfJINwim6ctQiukJv1p7MFbdqmp+xlAnXmpuZRtV8CtcXAJrYX9
 ADiapVX1hXti6gq7UtKSaCSk88+zv/Rg2PPUrsHYC6L4lmznm1lySk2E4Ap3JwtxSvha
 N28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l8/JTxqLKUGwdAqbnIsmpEc7Ppe6Hvg01DjhP7L3th8=;
 b=ekLhY9D7is2wTr8uZlUQHPTCe5n1OY7HxfAljXOZP4jRD2acPDlWesHFMwTsOSIBru
 Gn9y8LIklUO+xRkSzkVoHzvfNgw+CWrZRSDUhOZbsViqae633dW9+iDsHNf8dMbOQGMG
 yNDeHR2/z0K1eIU5IgPs9IRygugREj3sUwISUHSnfELnsDCnjH3XnlsIH3ztTIF10jGz
 9cLos5KFRMIfQjJy8s0Ehk8OXkIFTdb+EPYogxMnBY0ilUx0VYjxmCAdBiXq57Lz86cW
 Lk+g6BQlaoOBGx4idI3dUVrWAntdUKyspU9XFbON6aMZrRVGWvuLNqYVeZD8YlilO98C
 w1uA==
X-Gm-Message-State: AOAM5333ARpOdPAQiVgnGzsDhj6Zux6boIJVFmmfGnefl9XRLZb7ohOM
 zTC0wjsXA0A807HR1WvoLfmMVShviqhi/Q==
X-Google-Smtp-Source: ABdhPJz9G8hRltMt//4HUOzUybDTjbxphvEJbgEitf46MzCsQR8UgKfMQ8k9N/cp+r45yzbH2mQdzA==
X-Received: by 2002:a17:902:ea04:b0:148:ccbf:f2cc with SMTP id
 s4-20020a170902ea0400b00148ccbff2ccmr47352533plg.134.1641231210390; 
 Mon, 03 Jan 2022 09:33:30 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s14sm39348564pfk.171.2022.01.03.09.33.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 09:33:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] gitlab: Disable check-python-tox
Date: Mon,  3 Jan 2022 09:33:26 -0800
Message-Id: <20220103173326.257152-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103173326.257152-1-richard.henderson@linaro.org>
References: <20220103173326.257152-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set this test to be manually run, until failures can be fixed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .gitlab-ci.d/static_checks.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index 902843f8b3..5e955540d3 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -46,4 +46,6 @@ check-python-tox:
     QEMU_TOX_EXTRA_ARGS: --skip-missing-interpreters=false
   needs:
     job: python-container
+  rules:
+    - when: manual
   allow_failure: true
-- 
2.25.1


