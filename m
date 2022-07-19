Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4EA579676
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 11:38:31 +0200 (CEST)
Received: from localhost ([::1]:48978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDjgU-0006SF-GZ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 05:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oDjcx-0001VV-IA
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 05:34:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oDjcv-0000Qv-2V
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 05:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658223288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bPXIpCM8zHIlVcNcC0Ag1GGxuLFE2QgmEO781sVav7g=;
 b=FhqtL4eeqFOngpgPcpwtiW/NsBVgsdVdZa8vVJhO9V46IzDhpf5E2voA3thx1CcXnneoj4
 dFiIOlUERoACpdflUa3qHVQT95Cm9E3HkYNpsislYD3tEnsMMuN8TN3zVjxTCS5oCLpY3J
 qf0hJT2kGjx1hg9NS2cpmiNdbkGfP2I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-YnGu2iiWN1-HZ5a6qjHIVw-1; Tue, 19 Jul 2022 05:34:46 -0400
X-MC-Unique: YnGu2iiWN1-HZ5a6qjHIVw-1
Received: by mail-ed1-f72.google.com with SMTP id
 bs1-20020a056402304100b0043ad1e84611so9704523edb.15
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 02:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bPXIpCM8zHIlVcNcC0Ag1GGxuLFE2QgmEO781sVav7g=;
 b=MyQTZoPJWiixIbPJ8VgMLsXbhQsHr2TF8cxZb1uxGo8x6d8ktKJLCrj9PjbFqgtFgW
 R2oUdJbBGNGAa2Xefb73CkL1YC3wp0Uar8fN1YBcveTjpNZhcOJAK1Dp88t08W4Ex+IY
 8OZXZtTRstM0cNb73Di/d5H533fdyncmInwvNkw6D8HykZweqtmKGAsShpbg4+t1wYLy
 n/ZrIT1dM5e6+YBtGf8V4BJmQvrLtKa7Bkg/f3d7syRWYm5NJQJKeqbbCAUBHG1f2f+a
 OaBLSeMxLMVAE3bRSPrWwaORKiwJQ2hmYg3ulMLs7TyhNNU7OpqlLE0uYAoguC3Tjdqj
 5Ecg==
X-Gm-Message-State: AJIora/FmvGn7ydhX8VcgKzguWzpFzQt+9UfhI0+682IvrIdNZEtHtWB
 ZhgxMoQCnVfYDbDST9ieYYZcApXtZe+3SrH2WRvPMZ5tEL6o1mf7XKR0rTujokL8T6MEWUlNCXc
 UAajwhowWULTIdYPFRVvhL435OgoZvCNZ8U+MJq87A1xrOZ8n4u/XTrC8ww1F6l3p6fY=
X-Received: by 2002:a17:906:b6c7:b0:726:60aa:1b81 with SMTP id
 ec7-20020a170906b6c700b0072660aa1b81mr29815538ejb.383.1658223285068; 
 Tue, 19 Jul 2022 02:34:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1srG0mkpDCIrGsS3STwph8ueVEuVvTEpt8uqIJzzL98NOxl5kFArkMEHbLuvgxVxtSQ4B8VBw==
X-Received: by 2002:a17:906:b6c7:b0:726:60aa:1b81 with SMTP id
 ec7-20020a170906b6c700b0072660aa1b81mr29815519ejb.383.1658223284775; 
 Tue, 19 Jul 2022 02:34:44 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 t4-20020a1709067c0400b0072124df085bsm6642118ejo.15.2022.07.19.02.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 02:34:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 3/3] util: Fix broken build on Haiku
Date: Tue, 19 Jul 2022 11:34:39 +0200
Message-Id: <20220719093439.528810-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719093439.528810-1-pbonzini@redhat.com>
References: <20220719093439.528810-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Thomas Huth <thuth@redhat.com>

A recent commit moved some Haiku-specific code parts from oslib-posix.c
to cutils.c, but failed to move the corresponding header #include
statement, too, so "make vm-build-haiku.x86_64" is currently broken.
Fix it by moving the header #include, too.

Fixes: 06680b15b4 ("include: move qemu_*_exec_dir() to cutils")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220718172026.139004-1-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/cutils.c      | 4 ++++
 util/oslib-posix.c | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/util/cutils.c b/util/cutils.c
index 8199dac598..cb43dda213 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -35,6 +35,10 @@
 #include <sys/sysctl.h>
 #endif
 
+#ifdef __HAIKU__
+#include <kernel/image.h>
+#endif
+
 #ifdef G_OS_WIN32
 #include <pathcch.h>
 #include <wchar.h>
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 7a34c1657c..bffec18869 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -62,10 +62,6 @@
 #include <mach-o/dyld.h>
 #endif
 
-#ifdef __HAIKU__
-#include <kernel/image.h>
-#endif
-
 #include "qemu/mmap-alloc.h"
 
 #ifdef CONFIG_DEBUG_STACK_USAGE
-- 
2.36.1


