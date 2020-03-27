Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194BF19547D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 10:54:10 +0100 (CET)
Received: from localhost ([::1]:39304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHlgn-0002V4-5n
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 05:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37965)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jHlci-0003Yk-4n
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:49:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jHlch-0003wX-0G
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:49:56 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40321)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jHlcg-0003uH-Pz
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:49:54 -0400
Received: by mail-wm1-x343.google.com with SMTP id a81so11584543wmf.5
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h75bfILekusPXGlQBXuZSQUYvT0dH6xycgkUfP0rfEE=;
 b=ePMCx7Jnyf+t5ffKVM6T+xLWU8xox/L0YaDLfCiPyBU2/7Tuq2NX1p9JDSqdAcHK4a
 UHnn+Hwg3H4uh9m2T/KyTasS9pFd9muPsfCtwKBNw2Q+GiOLUIsgoUHbAyDjhaze00az
 2+xjDNKuM57bojqqeYx803PAHCU00z59seigOCd8tkvJJev0IxzAAkrQntLshItHt1Th
 eY4Ql7gYyWB4SCf8IA4uT59ACA4hTdYQOifXGINy2ZDtqB3UFiPt/t0PfxJn4oaOc2bZ
 0aD/ju8rLYJtRfTMlKP4BIrcc287T711DIKI6WaD/P3H6j4g6gkQbZBgHBVnZA5lxM5J
 SUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h75bfILekusPXGlQBXuZSQUYvT0dH6xycgkUfP0rfEE=;
 b=ET2pyadbOb9/ISj+cutOHX+fkwOwmPpT1DEPUXYRw09U+NG0Lq7lPyNgd7VP7QP0kj
 e2cHTTvF59jB6wY1FvYwlnXLBFuJY9QDfAsNCUXY59jg1OfbFw89BOOEOnB2TwgOOkqM
 WIyRHnlmW2bWAx51CBXIsTlnaBozOb9osvsep6TeA9axPM9UyYswm1QVxaxrjMxbkoDd
 8B4sIMxaxjoQeaLzUVIftky61UZLdm7UJ0oqF9LsRCSwdRirm6DJ0GwOK+G1ylapmyUA
 qNoCGwJooy6VThTz6LD9HYe/+gukzNWWaJNUNSneyQRJZCi4luxyJWGECA5nnZnHLwWs
 mnIQ==
X-Gm-Message-State: ANhLgQ0VtCw+eucqmb4ixilWq7GcBJdebuuAxgEbdLhVhJAIgG2Lkiu4
 HUiLPS+RXnCl3wvgnqhTH2eqfoveOg8=
X-Google-Smtp-Source: ADFU+vvIr4aRegORPxgo4omJNuOKvUF+VxF8PK2JiLilm7ZpGd1FvQ2R5Ou6EF3TCOFKVDlnJIbPfA==
X-Received: by 2002:a1c:1fc9:: with SMTP id f192mr4673975wmf.4.1585302593872; 
 Fri, 27 Mar 2020 02:49:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q4sm17123434wmj.1.2020.03.27.02.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 02:49:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E7E471FF92;
 Fri, 27 Mar 2020 09:49:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 6/7] target/xtensa: add FIXME for translation memory leak
Date: Fri, 27 Mar 2020 09:49:44 +0000
Message-Id: <20200327094945.23768-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200327094945.23768-1-alex.bennee@linaro.org>
References: <20200327094945.23768-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dynamically allocating a new structure within the DisasContext can
potentially leak as we can longjmp out of the translation loop (see
test_phys_mem). The proper fix would be to use static allocation
within the DisasContext but as the Xtensa translator imports it's code
from elsewhere I leave that as an exercise for the maintainer.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/translate.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 8aa972cafdf..37f65b1f030 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1174,6 +1174,11 @@ static void xtensa_tr_init_disas_context(DisasContextBase *dcbase,
     dc->callinc = ((tb_flags & XTENSA_TBFLAG_CALLINC_MASK) >>
                    XTENSA_TBFLAG_CALLINC_SHIFT);
 
+    /*
+     * FIXME: This will leak when a failed instruction load or similar
+     * event causes us to longjump out of the translation loop and
+     * hence not clean-up in xtensa_tr_tb_stop
+     */
     if (dc->config->isa) {
         dc->insnbuf = xtensa_insnbuf_alloc(dc->config->isa);
         dc->slotbuf = xtensa_insnbuf_alloc(dc->config->isa);
-- 
2.20.1


