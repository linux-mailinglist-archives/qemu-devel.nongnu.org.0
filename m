Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C13237BAE0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:39:39 +0200 (CEST)
Received: from localhost ([::1]:55524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmHC-00012U-9n
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8W-0000YI-No
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:40 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8K-0000Yp-5B
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:40 -0400
Received: by mail-wr1-x435.google.com with SMTP id d11so23064015wrw.8
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MHleu5/QXcuGG15rHKSMEafttB4DD5jpS2zsXzbXm5k=;
 b=lTcDLaeBoSsEjvdpT9tScHPhMCKmmHLdy3K5X2Qc3R16IsvGXVaTqDW5p7bAcVjEgS
 7ZlJHJr3lyGiQfm1WKlJhaYYpJmq1aO9VDB9NOjLTo36+oDsJZjinDchKhuJ8Ns/MTN3
 2x+uPKp65p/npWuv0hwXhu7LGUs1BlY99lSQ1uKmz+ElHpdtSuqbAH1IbeQ1Gv0vCKqX
 yFOUpYzaRywQMXJ2Qk6w/0hPnqODWww7vuUiVUd+hxZBXjqDB223sgy4B500aUpA+Q+y
 SFfGCK4husEh55p1ZdI1VD5IsJ2alsbY0E5ybrZo3MtQO8Yn5g44P9ktULQDAzaEUJnN
 vOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MHleu5/QXcuGG15rHKSMEafttB4DD5jpS2zsXzbXm5k=;
 b=imMs9ucarW4l4rUJjewEJTvtsxgMMva+A50kZDuw6pvkGnGBy5C/xQDNsti/+X7XBs
 eIbrxzALI32BQJM5zBCyb+it2p69bhU21OA0OLzQCzuwfwndzBAVIBI3rpDZl0QPQYcW
 jao8rWFtwiEXWTlPgljC+Qmbd7bTzzT9E/LTErX9E9C8XI0AMHEWdJyxiHuZH0/0D8mL
 b8hYqbpWMly3tcCbtEIVuL2slQjovGadPjtOS1S1XdeXotfL+NRpCM1atDu/sQdZkVGG
 MRaqMIYVuh6z5eYbs6eK3JvZrB9ZXkVm3S4VDjwi7KXBRgDluicuwZt42/gS6n/+51Ui
 SBqQ==
X-Gm-Message-State: AOAM532mxGwz23o7lOadyYm+96Af++L/9X6jHclR6Bl60xcpt2H+MnNr
 2oSYPNtUXJpxdPyRCfaj2PsD0PJHlVFGAQ==
X-Google-Smtp-Source: ABdhPJwHpKlhAVpsO5aJbKAuXOidq5jvC7MmKJFfNqUT0Ygg5RaC814fJJ969DZMvPp3Q+0Sc+VhNQ==
X-Received: by 2002:adf:d1ec:: with SMTP id g12mr44984170wrd.294.1620815426697; 
 Wed, 12 May 2021 03:30:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c16sm3812789wrn.92.2021.05.12.03.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:30:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1EF0C1FFB5;
 Wed, 12 May 2021 11:20:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 29/31] tests/tcg: fix missing return
Date: Wed, 12 May 2021 11:20:49 +0100
Message-Id: <20210512102051.12134-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was picked up when clang built the test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/system/memory.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/system/memory.c
index eb0ec6f8eb..41c7f66e2e 100644
--- a/tests/tcg/multiarch/system/memory.c
+++ b/tests/tcg/multiarch/system/memory.c
@@ -326,6 +326,7 @@ static bool do_unsigned_test(init_ufn fn)
         fn(i);
         ok = do_unsigned_reads(i);
     }
+    return ok;
 #else
     fn(0);
     return do_unsigned_reads(0);
-- 
2.20.1


