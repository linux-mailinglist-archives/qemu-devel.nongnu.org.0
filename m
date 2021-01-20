Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1579F2FD417
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:36:32 +0100 (CET)
Received: from localhost ([::1]:60870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FX5-0004LQ-2u
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FGq-0001rX-II
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:19:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FGn-00087j-Fk
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:19:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611155979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7WrzwPEJea74ZJswOnFr7VkphOOOJIX5g6UJTnwvsY=;
 b=WGZfLDfkhMCv+Dos3gPy2YDAoPKyJTH2FLdejnY99cV7nb4KMUYiGYXVmMt2MWO6sE6+TP
 L33Y2MkYc/blz2O9Gl0pDJ0rcl9IVEqKr0zN8MFSFKSI7+7kSKaAZJ5zrAbWVgV60wavLJ
 UYW30cvHfIuZNN3+Tc5Cjvk1C0hiNlE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-BOZjcR3aO42bswSywsvHDg-1; Wed, 20 Jan 2021 10:19:35 -0500
X-MC-Unique: BOZjcR3aO42bswSywsvHDg-1
Received: by mail-ej1-f72.google.com with SMTP id n18so2882788ejc.11
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 07:19:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y7WrzwPEJea74ZJswOnFr7VkphOOOJIX5g6UJTnwvsY=;
 b=gBBHNJ4Hg608dLotCHCIOragl61CXAX0aIf7V40cpxnMrqYc3/uJFYMqSHvUmfFZwA
 a/o+px45vb7nJUsOilf1yZ2XWgnO9FXks9cnjw6zpdsedLFyoFY4gLF6e2jtlfP+h5dW
 CYxd7QkCxDXN8p97Ctqoe7q762efCXVW6HN1SvU4HTHxUq5+uMNRW2B3WNReGQJnZWe3
 rHZhQZlGrRWwvnSZL1/BM0WmQz/7FV5SKCB5vAkunAYuVwVn0IReNtBJ3XGTiaS5JvBs
 XA6mnvdO6R+hS1R45W9Knr+OQqDnXyQunCkVTpIbqpdTC0nI+524MyzM1vx3TjXQhCWO
 GY9g==
X-Gm-Message-State: AOAM530gBk2jQkUvpebYhxDAAh16Z38G3jlr596SX59hzA4xzxkSxTaK
 JtVIIHlXXXRTq8BlpK+z5yOWl9/xRiEycfGMJnE1dAaJRzz+C2tIn+w0g/CNhkAGjybA90vkA6o
 Dfjn+hXPR1k1MT6/ejiBt9vU4dqmGcaO6bTfRBzfDoKxxM6fHiQkPHydBlQfcfhql
X-Received: by 2002:aa7:c84c:: with SMTP id g12mr7537221edt.193.1611155974560; 
 Wed, 20 Jan 2021 07:19:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7vxx1anSoTYlOdWJkYboxe5XklrzPZ+yEnvfLevuhsGehW1NIAM0B2GRngRJE/A1ziRDJbw==
X-Received: by 2002:aa7:c84c:: with SMTP id g12mr7537209edt.193.1611155974418; 
 Wed, 20 Jan 2021 07:19:34 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id l16sm1280410edw.10.2021.01.20.07.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 07:19:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] configure: Emit warning when accelerator requested but
 not needed
Date: Wed, 20 Jan 2021 16:19:16 +0100
Message-Id: <20210120151916.1167448-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210120151916.1167448-1-philmd@redhat.com>
References: <20210120151916.1167448-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In some configurations it might be pointless to check and
compile accelerator code. Do not deselect the accelerator,
but emit a warning.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/configure b/configure
index a5159157a49..09e1cd8bfe6 100755
--- a/configure
+++ b/configure
@@ -5514,6 +5514,27 @@ if test $git_update = 'yes' ; then
     (cd "${source_path}" && GIT="$git" "./scripts/git-submodule.sh" update "$git_submodules")
 fi
 
+if [ "$softmmu" = "no" ]; then
+    if [ "$tcg" = "enabled" ]; then
+        echo "WARN: TCG accelerator selected but no target requires it"
+    fi
+    if [ "$kvm" = "enabled" ]; then
+        echo "WARN: KVM accelerator selected but no target requires it"
+    fi
+    if [ "$xen" = "enabled" ]; then
+        echo "WARN: Xen accelerator selected but no target requires it"
+    fi
+    if [ "$hax" = "enabled" ]; then
+        echo "WARN: HAX accelerator selected but no target requires it"
+    fi
+    if [ "$hvf" = "enabled" ]; then
+        echo "WARN: HVF accelerator selected but no target requires it"
+    fi
+    if [ "$whpx" = "enabled" ]; then
+        echo "WARN: WHPX accelerator selected but no target requires it"
+    fi
+fi
+
 config_host_mak="config-host.mak"
 
 echo "# Automatically generated by configure - do not modify" > $config_host_mak
-- 
2.26.2


