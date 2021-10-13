Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB8F42BB85
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:28:08 +0200 (CEST)
Received: from localhost ([::1]:40246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaYR-0000IX-Py
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEp-0002Mp-P0
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:54 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:36397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEj-0005ne-Ca
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:51 -0400
Received: by mail-ed1-x534.google.com with SMTP id d3so7318990edp.3
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0POeyvCNhHyE/TogB33YpCfoQlQfvkymaIGlO6Vha5A=;
 b=PvcVK9zgGtIyQCUoQMKWEDDmA4CjdY2B5or9/DV2QcmR58xAZ7egACXXKT9ye5uSg4
 coXt0LEmx47lRfkrD4oBwtrpHfKxe+cHttR+FmukbS5IfDFQhCatyGWPw8wUUGnuZSz2
 WcZ9Xn7P/NhC72Rz72JVUyiTzohoyc3Mr11Ix3Tip5WEpqEotiv+h9m0kbWqBmlwpZL1
 3Bns6L4PUpM07HLSYkSHRXL95GUcxI6yBnOcc0orB85H2MS4f6igeEBJB5vLi//RaoQ2
 fpLUelvT/bajHBcb82dDSiB2LMKQDc9HevFpdsKuLMC5T0AGhNeRpkLlsB4ySgQnXyda
 ZdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0POeyvCNhHyE/TogB33YpCfoQlQfvkymaIGlO6Vha5A=;
 b=zwCQMcbSIsNPmzQQb3dVSTPsiRYU8x/mGyEQQQxqqyxMPnfhwwCS74gTEd5pSVgdg0
 iL0+p7V0q5qLRTeB9Qv3MRGrOnpnLgWjnSm/jdC+T394yHfergxftOXwbS5YS6acQdGx
 wo8Eqfi1BJ4W3igZPlHlx71+Gq6nS9B7kSF79Y9YeWxjYifpo3RSlQKpU7p5XNM17ukM
 +HfFubOi9H5T7b7EKZUMYUYlIsl8Lop8u/yIbR4c2nXOrZbLz391WAZVVWD0CfNhmLRH
 gqcdz96iPFoRr6FqOHHdStgsw8ocYAioaLRmDv+ESO6UAlSbesDr/xfnthizcGD7jlc9
 xdLg==
X-Gm-Message-State: AOAM532XZ/ajTXqCUmBS18Gg9pcItS8fcr1nlWi1Ii4tC1RVWYitG1Em
 lTM8O8kqgHV/uRokEJwpWLWMEykcZl4=
X-Google-Smtp-Source: ABdhPJxF0/7DJyP3O9Uy3oSqM4fS5uWcxXOkPR40BSwCrFp3DvZ7Tn2jF+AEyxY3R/abKb7upFOLog==
X-Received: by 2002:a05:6402:5252:: with SMTP id
 t18mr7629475edd.129.1634116063145; 
 Wed, 13 Oct 2021 02:07:43 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/40] target/i386/sev: Rename sev_i386.h -> sev.h
Date: Wed, 13 Oct 2021 11:07:07 +0200
Message-Id: <20211013090728.309365-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

SEV is a x86 specific feature, and the "sev_i386.h" header
is already in target/i386/. Rename it as "sev.h" to simplify.

Patch created mechanically using:

  $ git mv target/i386/sev_i386.h target/i386/sev.h
  $ sed -i s/sev_i386.h/sev.h/ $(git grep -l sev_i386.h)

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20211007161716.453984-15-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/x86.c                     | 2 +-
 target/i386/cpu.c                 | 2 +-
 target/i386/kvm/kvm.c             | 2 +-
 target/i386/monitor.c             | 2 +-
 target/i386/sev-stub.c            | 2 +-
 target/i386/sev-sysemu-stub.c     | 2 +-
 target/i386/sev.c                 | 2 +-
 target/i386/{sev_i386.h => sev.h} | 0
 8 files changed, 7 insertions(+), 7 deletions(-)
 rename target/i386/{sev_i386.h => sev.h} (100%)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 0c7c054e3a..76de7e2265 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -47,7 +47,7 @@
 #include "hw/i386/fw_cfg.h"
 #include "hw/intc/i8259.h"
 #include "hw/rtc/mc146818rtc.h"
-#include "target/i386/sev_i386.h"
+#include "target/i386/sev.h"
 
 #include "hw/acpi/cpu_hotplug.h"
 #include "hw/irq.h"
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b54b98551e..8289dc87bd 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -26,7 +26,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/hvf.h"
 #include "kvm/kvm_i386.h"
-#include "sev_i386.h"
+#include "sev.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-machine.h"
 #include "qapi/qmp/qerror.h"
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f25837f63f..a5f6ff63c8 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -28,7 +28,7 @@
 #include "sysemu/kvm_int.h"
 #include "sysemu/runstate.h"
 #include "kvm_i386.h"
-#include "sev_i386.h"
+#include "sev.h"
 #include "hyperv.h"
 #include "hyperv-proto.h"
 
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index ea836678f5..109e4e61c0 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -32,7 +32,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/sev.h"
 #include "qapi/error.h"
-#include "sev_i386.h"
+#include "sev.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qapi-commands-misc.h"
 #include "hw/i386/pc.h"
diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index 170e9f50fe..7e8b6f9a25 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "sev_i386.h"
+#include "sev.h"
 
 bool sev_enabled(void)
 {
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index d556b4f091..8082781feb 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -14,7 +14,7 @@
 #include "qemu/osdep.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/error.h"
-#include "sev_i386.h"
+#include "sev.h"
 
 SevInfo *sev_get_info(void)
 {
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 5cbbcf0bb9..e43bbf3a17 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -25,7 +25,7 @@
 #include "qemu/uuid.h"
 #include "crypto/hash.h"
 #include "sysemu/kvm.h"
-#include "sev_i386.h"
+#include "sev.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
 #include "trace.h"
diff --git a/target/i386/sev_i386.h b/target/i386/sev.h
similarity index 100%
rename from target/i386/sev_i386.h
rename to target/i386/sev.h
-- 
2.31.1



