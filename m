Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925CC529E05
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:29:47 +0200 (CEST)
Received: from localhost ([::1]:54292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqtWU-0002VV-Cb
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTK-00080h-TD
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTJ-0003Xe-E5
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652779588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ntfkbmefi/h16+5K9PpeVr2uI+6+dLOQnH86jaPDoIQ=;
 b=H8IdZfXoriSXQqN2gf/X81EUACnkT7r/Y8jTjQ/pktRSwkOO4JxFiSr+WTHADfGQ5488p+
 WHor447utP9vixUnNpVPAXUHDYCNljskRyCoQzyJcXTDI1ag3+bKYUZzIJmxfw+RuZ5q3a
 WJ0SF7WtnEhUzvBAQ5yhiWSkIpyzMII=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-VaUXEqFQMOi-J-2p-YqG7g-1; Tue, 17 May 2022 05:26:27 -0400
X-MC-Unique: VaUXEqFQMOi-J-2p-YqG7g-1
Received: by mail-ed1-f70.google.com with SMTP id
 p13-20020aa7c4cd000000b0042ab847aba8so2824657edr.0
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 02:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ntfkbmefi/h16+5K9PpeVr2uI+6+dLOQnH86jaPDoIQ=;
 b=38CxOXe/QTEl+5SdYP/CgInnpz0fr5V4PF6G+L1i82Oy0z6u42cq5yDO3YWmRvvGfe
 MzvCINWpqxNAUIzPNho91+imaooR9hZ3Ulzu2U08Y8lLsdreOrkgsoxLUm3QEUs+bkh2
 RlVlpmvw+MNt15+ubDmXVxSrNWswFZrQfezeuoigbGe5StIw6h7uFm5Ik/80N2oJNDXj
 5r2kXpg2qSN0VMRuNTLzWCaZdlwLWY31qdAnWFlfFWimhR3iweDzvV0ROnA0iLFwBS2a
 IBhK5FdSWC3Q9GvSPLTbd5tseO8U/A79JNqZaHP8GXFcdapMyxBuchmcr7icyK8Sh0Ar
 wRoQ==
X-Gm-Message-State: AOAM530/FpxBH6THjEyE5FKJU15fQjB/zh+nK9wKA3GXDt5nsYs3s5kx
 EumMREgR6H3xjVi40vMjcSZUbuMIDoq0eN8K2XfyCeBTF54oApqCO/uUvEdtgw5J+sMVc43/N1x
 gnt64JU1QAUgglbdHsOVh42AaVwuP6yxuuXOsUOLA8xz/RBLKEojxS7cQEZAtf/mXFCQ=
X-Received: by 2002:a17:907:110d:b0:6f5:64f4:9202 with SMTP id
 qu13-20020a170907110d00b006f564f49202mr18670010ejb.111.1652779585653; 
 Tue, 17 May 2022 02:26:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/shp8WchQJ/z68LK6v3oCGuka5pOg7OyDyB5Z6LAKM3SHQwMnDAUUK76Nv6PyMJLFgHjs0Q==
X-Received: by 2002:a17:907:110d:b0:6f5:64f4:9202 with SMTP id
 qu13-20020a170907110d00b006f564f49202mr18669994ejb.111.1652779585307; 
 Tue, 17 May 2022 02:26:25 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a170907272400b006f3ef214e5bsm796424ejl.193.2022.05.17.02.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:26:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 02/16] build: clean up ninja invocation
Date: Tue, 17 May 2022 11:26:02 +0200
Message-Id: <20220517092616.1272238-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220517092616.1272238-1-pbonzini@redhat.com>
References: <20220517092616.1272238-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Fix an incorrect "@@:" and move "-d keepdepfile" to the NINJAFLAGS variable.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index b842dbccdb..fad312040f 100644
--- a/Makefile
+++ b/Makefile
@@ -143,7 +143,7 @@ MAKE.q = $(findstring q,$(firstword $(filter-out --%,$(MAKEFLAGS))))
 MAKE.nq = $(if $(word 2, $(MAKE.n) $(MAKE.q)),nq)
 NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
         $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
-
+        -d keepdepfile
 ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
 ninja-cmd-goals += $(foreach t, $(.check.build-suites), $(.check-$t.deps))
 ninja-cmd-goals += $(foreach t, $(.bench.build-suites), $(.bench-$t.deps))
@@ -160,8 +160,8 @@ $(ninja-targets): run-ninja
 # --output-sync line.
 run-ninja: config-host.mak
 ifneq ($(filter $(ninja-targets), $(ninja-cmd-goals)),)
-	+$(quiet-@)$(if $(MAKE.nq),@:, $(NINJA) -d keepdepfile \
-	   $(NINJAFLAGS) $(sort $(filter $(ninja-targets), $(ninja-cmd-goals))) | cat)
+	+$(if $(MAKE.nq),@:,$(quiet-@)$(NINJA) $(NINJAFLAGS) \
+	   $(sort $(filter $(ninja-targets), $(ninja-cmd-goals))) | cat)
 endif
 endif
 
-- 
2.36.0


