Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51191EF45F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 11:38:47 +0200 (CEST)
Received: from localhost ([::1]:35990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jh8oI-0001yc-Of
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 05:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jh8jL-0000eC-CQ
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 05:33:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28572
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jh8jK-0004bB-JG
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 05:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591349618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GPfSgBN6V2tVMS8P3LJc7AXq2ATI7aQPyqGZHft5RHs=;
 b=eauUALdcI6Q2RDVZJ10I27gVuLzdDWJY4wh/AekhzwG0kf9kQG2x6Z9cEHy6TBJGyYpTcn
 euXz1ICtFYWqgA3kDB1a7Ib46/vsH4QI236+UCqmJJiS3VcW5SRmDLDB30WnI/ID/RSAbP
 3e0Pr7/0vLR2+K6nbzxpcpyEY5v1L8Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-PBp12A0CN2CXEp13tVaPIA-1; Fri, 05 Jun 2020 05:33:34 -0400
X-MC-Unique: PBp12A0CN2CXEp13tVaPIA-1
Received: by mail-wm1-f72.google.com with SMTP id h6so2546399wmb.7
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 02:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GPfSgBN6V2tVMS8P3LJc7AXq2ATI7aQPyqGZHft5RHs=;
 b=spUEJrFnEyFz9gG31vzQENM5HMQXPEzxFlBuVNHCj3xs+m9DlVt/9KPyOB0xhrjHbJ
 Gr+RGWZYHKkQQLLbzkVbKVowcNXY17TGJJmLP+1yaxiJFbtIa2lC4vZwoShlqkQ0iy7b
 ykkYjm7Ij2Z7qse7NnZ1WBWubLeNlfQ9R9LWpdK3nfU23t7+2jolhCjTxYyq0B2110Om
 PUJgPw8lj+eoUrr5oQ8HoTmz9gwafi2u1QilFlRDK/Jjjm1T6yi0B5//vv7lISYwhcD/
 4pTKG4s+HHMthcJAzJ2JDoZUljpj4WBxTWjydpr0SD9qvJAFSo+sn16waOO3g5nDgNPT
 PYtQ==
X-Gm-Message-State: AOAM530UTr+ML8OUag7XNdj3uSEfzXYIfe5ECjTJY/Ohl4tgQ9E7qL9/
 F6TMSJqVl1HXuFs5ydUFzmlcsEYPOk8i4n+lQoviJOsWWwDU539P+YAN59BcNAMZegE80I7wWDL
 gvphTv1Ao+J7NghM=
X-Received: by 2002:adf:f68d:: with SMTP id v13mr8058968wrp.291.1591349613054; 
 Fri, 05 Jun 2020 02:33:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4JprA6BdHCHzcKGFelWNaOXFAl3FqcrwOipdTLH3kAjfgpCBuCLlqY361lclAxqwTf2alig==
X-Received: by 2002:adf:f68d:: with SMTP id v13mr8058950wrp.291.1591349612905; 
 Fri, 05 Jun 2020 02:33:32 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id v28sm12404343wra.77.2020.06.05.02.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 02:33:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/11] Makefile: Write MINIKCONF variables as one entry per
 line
Date: Fri,  5 Jun 2020 11:32:52 +0200
Message-Id: <20200605093256.30351-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200605093256.30351-1-philmd@redhat.com>
References: <20200605093256.30351-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:27:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Having one entry per line helps reviews/refactors. As we are
going to modify the MINIKCONF variables, split them now to
ease further review.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 6c9d718b2c..7666f81e8a 100644
--- a/Makefile
+++ b/Makefile
@@ -418,12 +418,15 @@ MINIKCONF_ARGS = \
     CONFIG_LINUX=$(CONFIG_LINUX) \
     CONFIG_PVRDMA=$(CONFIG_PVRDMA)
 
-MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host $(SRC_PATH)/hw/Kconfig
-MINIKCONF_DEPS = $(MINIKCONF_INPUTS) $(wildcard $(SRC_PATH)/hw/*/Kconfig)
+MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host \
+                   $(SRC_PATH)/hw/Kconfig
+MINIKCONF_DEPS = $(MINIKCONF_INPUTS) \
+                 $(wildcard $(SRC_PATH)/hw/*/Kconfig)
 MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
 
 $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MINIKCONF_DEPS) $(BUILD_DIR)/config-host.mak
-	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) > $@.tmp, "GEN", "$@.tmp")
+	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) \
+		> $@.tmp, "GEN", "$@.tmp")
 	$(call quiet-command, if test -f $@; then \
 	  if cmp -s $@.old $@; then \
 	    mv $@.tmp $@; \
-- 
2.21.3


