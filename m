Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB92F53FA67
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 11:54:31 +0200 (CEST)
Received: from localhost ([::1]:52096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyVuw-0005UG-P0
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 05:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyVhg-0007sQ-Gn
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:40:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyVhe-0008P6-Sm
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:40:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654594846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q2LoqMCM/ZwdCe5KGPIkrHcczM4rhqTUZVWHnA+3UtE=;
 b=J8ulHi59WzYpbiedZUrurNSpp5WqpEnG1kL9/87OLC1oIHXsf9uWMiZSnm14M43DhCsv5y
 vr8N2R59Fg2CeuGnbI+Q6mnw8K0pdPJYkLflH6j/sS7UbHTJqPkOBfjrYi08pchbYHbEuw
 G6jatiisTUbCcnl6xzgh64V3I44TjwA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-Y4iGGGIsOkCOXYRDpppFfw-1; Tue, 07 Jun 2022 05:40:45 -0400
X-MC-Unique: Y4iGGGIsOkCOXYRDpppFfw-1
Received: by mail-wm1-f70.google.com with SMTP id
 p24-20020a05600c1d9800b0039c51c2da19so1513792wms.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q2LoqMCM/ZwdCe5KGPIkrHcczM4rhqTUZVWHnA+3UtE=;
 b=QWXLbaNBeLAQF7W+6KS+Y205pDEyDsJ7wYKLs9nSU6l5WGMT+udrEPrQ3hpLXo8kcm
 SkS6Frb1ahmi8gx77mRC7lSwU5s6mBngN4HeodoIo9z5KsZ60iZZLAEmKSXjRla7b95D
 58mTWBvQHIr9GtY+jJFxWVcskzUdu6Y1Gv9PgHUe7zbZ4qiZAM9ZSk6gZjWJdHwyzXJT
 LIR3o+q75AldKAlTNvfNjRGhQYWwAJFuc7q6qIAYdfX49A1XmKVQZItzYD7MqoYQJg0j
 JPeG46/6iBQGeYHnXL/X008QH44ZUD4SkWuPJriCjpWORltSyVxPjf/d+bIuBJTmBQUu
 SIHg==
X-Gm-Message-State: AOAM531Bywa9bgr0vFNEzG+2cXnecNQZZ0QmzcnwUfw4pdhwBB6Y8WH4
 NX48pujBI4Qyxfjz+S/++X8TAN/rzT90hzCajtFq2y5y+fiFpatLZFr8LrbOlt+hiOOLhAZX/6R
 7mNd4YN1XpSIT47+8wVnvkbIAm3Qwq4OHiTU7lC+xWm00PZYqAWOUt6x0gRZFDvCP0tM=
X-Received: by 2002:a05:600c:2194:b0:39c:419c:1a24 with SMTP id
 e20-20020a05600c219400b0039c419c1a24mr20409469wme.186.1654594843636; 
 Tue, 07 Jun 2022 02:40:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmW1KOPjYWoJBAinRQfiFsEpWn2WzzNeIqMD+Bnh4KV+48WCOSum39p/Nf8qB47TstFAGZFA==
X-Received: by 2002:a05:600c:2194:b0:39c:419c:1a24 with SMTP id
 e20-20020a05600c219400b0039c419c1a24mr20409434wme.186.1654594843129; 
 Tue, 07 Jun 2022 02:40:43 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a1c7210000000b0039c4d9737f3sm6424724wmc.34.2022.06.07.02.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:40:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 5/7] configure: store container engine in config-host.mak
Date: Tue,  7 Jun 2022 11:40:29 +0200
Message-Id: <20220607094031.1227714-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607094031.1227714-1-pbonzini@redhat.com>
References: <20220607094031.1227714-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

In preparation for removing $(DOCKER_SCRIPT) from the tests/tcg configuration
files, have Make use the same container engine that had been probed at
configure time.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 11 ++++++++---
 tests/docker/Makefile.include |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 6b38b0815c..0fd5a3cfad 100755
--- a/configure
+++ b/configure
@@ -1819,9 +1819,11 @@ esac
 
 container="no"
 if test $use_containers = "yes"; then
-    if has "docker" || has "podman"; then
-        container=$($python $source_path/tests/docker/docker.py probe)
-    fi
+    case $($python $source_path/tests/docker/docker.py probe) in
+        *docker) container=docker ;;
+        podman) container=podman ;;
+        no) container=no ;;
+    esac
 fi
 
 # cross compilers defaults, can be overridden with --cross-cc-ARCH
@@ -2401,6 +2403,9 @@ if test -n "$gdb_bin"; then
     fi
 fi
 
+if test "$container" != no; then
+    echo "ENGINE=$container" >> $config_host_mak
+fi
 echo "ROMS=$roms" >> $config_host_mak
 echo "MAKE=$make" >> $config_host_mak
 echo "PYTHON=$python" >> $config_host_mak
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index e68f91b853..d9b6ab7b41 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -14,7 +14,7 @@ DOCKER_DEFAULT_REGISTRY := registry.gitlab.com/qemu-project/qemu
 endif
 DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGISTRY))
 
-ENGINE := auto
+ENGINE ?= auto
 DOCKER_SCRIPT=$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
 
 CUR_TIME := $(shell date +%Y-%m-%d-%H.%M.%S.$$$$)
-- 
2.36.1



