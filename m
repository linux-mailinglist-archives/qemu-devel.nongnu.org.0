Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A24529E06
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:29:53 +0200 (CEST)
Received: from localhost ([::1]:54330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqtWa-0002Wh-G5
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTM-00081d-Cb
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTK-0003Xu-RD
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652779590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XkNQvBwBHUr1EnwLPLPazbVgqhiFsZYY8y+g5y7TLyk=;
 b=WwpDUZ77t0MRhgjuoOxwYdkMJWUIUNJw4ySswnh21RcGQ7EMt8ti40bb87gNJNLYEhMejg
 my7L/Pmw6z/G0Iml4lmAf/fMe649xKJ7e1likl98RJbLIPE1ED6p6jdtKm6YMpHcqY+pA1
 /oewmQvM6UzWL7J7ziFj5N4mcR3CDgY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-0sOOP9G7O5W7ho0mGoj5cg-1; Tue, 17 May 2022 05:26:29 -0400
X-MC-Unique: 0sOOP9G7O5W7ho0mGoj5cg-1
Received: by mail-ed1-f71.google.com with SMTP id
 w5-20020a056402128500b0042aa2647eb6so5016972edv.12
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 02:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XkNQvBwBHUr1EnwLPLPazbVgqhiFsZYY8y+g5y7TLyk=;
 b=zwhWjZoKDf1YDFURbmU6T15ZidzQFwSNDGZRY5XTOkVayAqvRYLsoccV73SQPyUvgY
 UXpx/+KRgx15UaRs+PP9iYKjz0Uo8W3anWt4KwkG/IhKewKVAxM7XbpCaEX63vg1VyA7
 lk9lHnhfqLk6aWDNp+OR50mCnhSyP6jf+7mt7hImuHYBY1pUZI1JaxOpCqA2BuMpaL1r
 XMgsTRjxfvGZZE43IBrJcc8bZwOXJz4cfN9Re+lThvAYnwe2uSp9y+ROWLOrRY8RtlB9
 ft0i6UEIejVN4orOKLLxe+iB6xb/rVja49lgmKDF20H2+Knt/gy3HedR/79n41C5WfNx
 2UeA==
X-Gm-Message-State: AOAM530ltWKEk1dAwl6xfj64gGsxqR+6U9RlnfyflVdYGTh2wt/c65dq
 1953x3Mt3EGXcXdono0gPB8ZKHRnnsfTFxZTelkeZDfvuNwmIEHhaDKmioe1S/S1inh+TadyZoA
 CW3ku12DA6Z+ykdsbsxyav26y0DRNeEVSTKLqbtePkFt31DKN7fcypIxVhuwtWHOtyj4=
X-Received: by 2002:a17:907:1c24:b0:6f4:ff62:a393 with SMTP id
 nc36-20020a1709071c2400b006f4ff62a393mr18987707ejc.154.1652779587533; 
 Tue, 17 May 2022 02:26:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhrqNQtPRom/x9hXFGIV6FpI3iS9M6NvBWOsrLhSVUBelHonjmhenMMcyZws0WPnAvU1pBxA==
X-Received: by 2002:a17:907:1c24:b0:6f4:ff62:a393 with SMTP id
 nc36-20020a1709071c2400b006f4ff62a393mr18987680ejc.154.1652779587257; 
 Tue, 17 May 2022 02:26:27 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a170906729000b006fe50668941sm794346ejl.158.2022.05.17.02.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:26:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 03/16] build: add a more generic way to specify make->ninja
 dependencies
Date: Tue, 17 May 2022 11:26:03 +0200
Message-Id: <20220517092616.1272238-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220517092616.1272238-1-pbonzini@redhat.com>
References: <20220517092616.1272238-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Let any make target specify ninja goals that needs to be built for it
(though selecting the goals is _not_ recursive on depending targets)
instead of having a custom mechanism only for "make check" and "make
bench".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile              | 3 +--
 scripts/mtest2make.py | 8 ++++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index fad312040f..3c0d89057e 100644
--- a/Makefile
+++ b/Makefile
@@ -145,8 +145,7 @@ NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
         $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
         -d keepdepfile
 ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
-ninja-cmd-goals += $(foreach t, $(.check.build-suites), $(.check-$t.deps))
-ninja-cmd-goals += $(foreach t, $(.bench.build-suites), $(.bench-$t.deps))
+ninja-cmd-goals += $(foreach g, $(MAKECMDGOALS), $(.ninja-goals.$g))))
 
 makefile-targets := build.ninja ctags TAGS cscope dist clean uninstall
 # "ninja -t targets" also lists all prerequisites.  If build system
diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index 304634b71e..0fe81efbbc 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -81,12 +81,12 @@ def emit_prolog(suites, prefix):
 
 def emit_suite_deps(name, suite, prefix):
     deps = ' '.join(suite.deps)
-    targets = f'{prefix}-{name} {prefix}-report-{name}.junit.xml {prefix} {prefix}-report.junit.xml'
+    targets = [f'{prefix}-{name}', f'{prefix}-report-{name}.junit.xml', f'{prefix}', f'{prefix}-report.junit.xml',
+               f'{prefix}-build']
     print()
     print(f'.{prefix}-{name}.deps = {deps}')
-    print(f'ifneq ($(filter {prefix}-build {targets}, $(MAKECMDGOALS)),)')
-    print(f'.{prefix}.build-suites += {name}')
-    print(f'endif')
+    for t in targets:
+        print(f'.ninja-goals.{t} += $(.{prefix}-{name}.deps)')
 
 def emit_suite(name, suite, prefix):
     emit_suite_deps(name, suite, prefix)
-- 
2.36.0


