Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4896062A3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:15:44 +0200 (CEST)
Received: from localhost ([::1]:55008 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWKJ-0002W9-Dy
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:15:35 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWDE-0005q1-UB
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDM-0000Sf-P8
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:59:57 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDK-000502-Vt
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:59:56 -0400
Received: by mail-wr1-x433.google.com with SMTP id bp11so34018642wrb.9
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iz+OO37Rc1Fpza5z6M/NPmMQWlASISSXaZ/UQ65BqzA=;
 b=i1OPlnvA3C1ZeWlRWrXuuGzDBnDLV/geOskE7mfOnhY75FX1aNeaHWQ715790tFP8L
 kb7XrwsQ8xBnV7gboRMQ08OJaJvcnrVrVgb1p3D6TvgMOjCTiUJNmNHAnx7SvjfkSfX6
 +XA6Wt3DOdbDUE7nxFKaB/aO8JS37d76NWcfO+B1dm8sZw2cDACrBuw30JPNwjmZRqaJ
 SjMjwqffxUjuveRHG0Gq/Y0FLuEACGr+DlnBw3l88qqvo6oJFYJwruKnXbu0QK1uzQgt
 ztRIMIlsezHhwDdRGcEzbXIi1s7OomDdkK4MjwzYVe8R8Wrk+pSicQxtrx+kU5I+eo8S
 5BoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iz+OO37Rc1Fpza5z6M/NPmMQWlASISSXaZ/UQ65BqzA=;
 b=r/T+A7plV/gSmA89j5iNw9VorADCfcqxjcxry2yJ6WRrXJcbq+cBAq5P83Z5OFgxIB
 EjG1qSBPzdtbqZHTP1GCs/FtXiAUNxmCKz/8y2A3ZZnKucYE7gs6oQOBjbGejznw1oTO
 vFemosvZBS2Bc07s39TZ5hsLJ1uhasftgwG7wV5Mo0K2Qeote2+G3PJ6C9SfCfofTsnp
 fO04Hm0iEJ+/9oOQQ+/FD7zDh8RTw0KCcGGO/mOvFtTkha+6h2wctZYSgxiMizxiVZnV
 0ub8t9qp5Ltp4tPb+dCZ7uSFbg/n/GLkxUdJEDeCt4llZk6VI9NhRvHUQ5PNupFTPgUs
 RD2A==
X-Gm-Message-State: ACrzQf2n4CibzueLvdZzsE8cbUK3TPYHkilHPjeX3/rKP9QXIWw+Gxmi
 Eu6Jhbi/LXPmNkMzuXtw+2lFLA==
X-Google-Smtp-Source: AMsMyM7/zKuprxpoAGSf2DrnlHv+vbES5aulW9bCBoqNzYEk/1y0JY966RfklI2iTT6riijN1WQirg==
X-Received: by 2002:adf:f850:0:b0:22e:7ae8:a38f with SMTP id
 d16-20020adff850000000b0022e7ae8a38fmr8210769wrq.68.1666267192066; 
 Thu, 20 Oct 2022 04:59:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a5d52ca000000b0022e653f5abbsm16570118wrv.69.2022.10.20.04.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:59:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 45C341FFCE;
 Thu, 20 Oct 2022 12:52:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PATCH v3 24/26] target/s390x: don't probe next pc for EXecuted insns
Date: Thu, 20 Oct 2022 12:52:07 +0100
Message-Id: <20221020115209.1761864-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We have finished the TB anyway so we can shortcut the other tests by
checking dc->ex_value first.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/s390x/tcg/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f4de8efe3a..95279e5dc3 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6624,9 +6624,9 @@ static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 
     dc->base.is_jmp = translate_one(env, dc);
     if (dc->base.is_jmp == DISAS_NEXT) {
-        if (!is_same_page(dcbase, dc->base.pc_next) ||
-            !is_same_page(dcbase, get_next_pc(env, dc, dc->base.pc_next)) ||
-            dc->ex_value) {
+        if (dc->ex_value ||
+            !is_same_page(dcbase, dc->base.pc_next) ||
+            !is_same_page(dcbase, get_next_pc(env, dc, dc->base.pc_next))) {
             dc->base.is_jmp = DISAS_TOO_MANY;
         }
     }
-- 
2.34.1


