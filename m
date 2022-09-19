Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121CD5BD459
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:05:43 +0200 (CEST)
Received: from localhost ([::1]:48374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaL9J-00061l-Uq
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKgB-0003LD-Ts
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKg1-0003CD-JT
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+qG6qdgR8Jto65cTPgnYEY9MvMDpxeVZ+fynp1vP//c=;
 b=IOZWC4l5gYPkPPk7GyYtY3kOcbPqJu+Z3sJyFg6rTlzU9CfP4SgI083MM4h4JGbDGmxX0G
 NiGku4hRmErWpzEjCQI5M67GhmZ03+Hrh3J3/2HOkhu7AiBDr9B+3mT7jOdNZK34bVDXVr
 a2+ITrYuEYmJ4omM7iZ7qIBdD+VhxW4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-IgcyNbP2NN69B6KRv224DQ-1; Mon, 19 Sep 2022 13:35:23 -0400
X-MC-Unique: IgcyNbP2NN69B6KRv224DQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 i132-20020a1c3b8a000000b003b339a8556eso2854wma.4
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+qG6qdgR8Jto65cTPgnYEY9MvMDpxeVZ+fynp1vP//c=;
 b=VljHfnSGV4iXp/0YdHp4zUMqkpzZgNTMCedAAb48VHhCB/+S30yw6sBU7ETAkXScRe
 fEWRREgokJwNSkdiK8VfD04THiU708Z9+Dz26ijyHQQyynHK9BHQRHPWvW1sLlzTy14f
 1lP/vLJ4vz4tNnWzIBq13X9TwrWwDpsHigOwl8eePShcuRcrhyWXnKYVqQ1CyiBEKwJ7
 TGVVaUGcRkc2SW8sH+5LT+JVdRP+wbGL6LsXjug9v/kaAATKt5kUL1LLZQ27R9Qw8JUc
 IBrxS/76GMozt+hnPXBZmnWCZ0tljUIxXDAaqDJ9Mul7yHYKHDK5+HXAydhcroW3qX1Q
 dFvA==
X-Gm-Message-State: ACrzQf2z6xoStixqpy0InCLltvrdqi6qcbEq2UfXM85/RIhJJqOrN2jY
 xjESttjSeSCExOZVKCTTzyWzwg70+PfWv8gAvX4Zv7z0Yuf2By2mqucy+q3AjXjcEdDdzXtGrL/
 h09B0oGlArOVAG94Kz8KEkkkXu+Ih293z27KnV1rZ3Nb+4FxhKmJ2enoiIbe5g1Vi6W8=
X-Received: by 2002:a05:600c:4e44:b0:3b4:bed2:4f5e with SMTP id
 e4-20020a05600c4e4400b003b4bed24f5emr11651331wmq.193.1663608921966; 
 Mon, 19 Sep 2022 10:35:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7PBVp2V8xXAr9Km1zDKYhmda/HUrhIa5R/ttM3dCnPrNuM6ZOx6X3cBW8nBRvfuk35nBJY8A==
X-Received: by 2002:a05:600c:4e44:b0:3b4:bed2:4f5e with SMTP id
 e4-20020a05600c4e4400b003b4bed24f5emr11651312wmq.193.1663608921618; 
 Mon, 19 Sep 2022 10:35:21 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a1c5448000000b003b486027c8asm14221441wmi.20.2022.09.19.10.35.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:35:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/21] build: remove extra parentheses causing missing rebuilds
Date: Mon, 19 Sep 2022 19:34:48 +0200
Message-Id: <20220919173449.5864-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
References: <20220919173449.5864-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Because of two stray parentheses at the end of the definition of
ninja-cmd-goals, the test that is last in the .check-TESTSUITENAME.deps
variable will not be rebuilt.  Fix that.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 13234f2aa4..b576cba5a8 100644
--- a/Makefile
+++ b/Makefile
@@ -145,7 +145,7 @@ NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
         $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
         -d keepdepfile
 ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
-ninja-cmd-goals += $(foreach g, $(MAKECMDGOALS), $(.ninja-goals.$g))))
+ninja-cmd-goals += $(foreach g, $(MAKECMDGOALS), $(.ninja-goals.$g))
 
 makefile-targets := build.ninja ctags TAGS cscope dist clean uninstall
 # "ninja -t targets" also lists all prerequisites.  If build system
-- 
2.37.2


