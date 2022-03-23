Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45C24E4EFC
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 10:10:57 +0100 (CET)
Received: from localhost ([::1]:35782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWx16-00078J-As
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 05:10:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1nWwxg-0005on-4N
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 05:07:24 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:41760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1nWwxd-0008AN-VH
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 05:07:23 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7CBCD3F1B6
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 09:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1648026437;
 bh=Wn0wAuNZ1fZs2kBz84E3oz947GK9dHWSMOnXkU3gI4o=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=RBar9ZflIfahmRaptZpUIX6hhZ/0nRT7JAYk6RagImyPWYwvqKl/FnKdxamt+gLXl
 JZZYaCBpHWXiU+E9y6cTcdeB5kV54mBrRQwLx9PLCmJ8CDx36P2fE4X7NFT7HeC0Yk
 uvmr8WosK0caTsPyLMzlpSiPb78YyKX1MbxX4nJOHKqK1JNnkhC7ANcXfmRYlRLRDB
 3kMYBJvMgQnpX0SuVdIDX30fxTzRaafBH5uzOcglVNgVp1zFoIvFX7HMVzPQWryFbj
 KojAJEgftd6+NLXa9OFHnvTE/S114sIgA47zU9xBelqBLzwFuWVCdv1oJS5T8odF6F
 IQvzPo34R+lZg==
Received: by mail-ed1-f70.google.com with SMTP id
 x5-20020a50ba85000000b00418e8ce90ffso642614ede.14
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 02:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wn0wAuNZ1fZs2kBz84E3oz947GK9dHWSMOnXkU3gI4o=;
 b=zMxa/rY0U4qrNIh5oxySRp6vDH0SLt1E27FJQDdwukaPz5l+1VeS7hZZyS7CdhugWk
 0ZsL8kGATqUPCy4fw+hivAnXOEfN67vT7xhEjPV5P7a4KYOp6T1LTNKlKE0zlKlXyQtg
 b84/QjwIOfqEVp7q4kNwI8FwWOKv4iK99bNxrVIgT9ah/x0tW6E2jNJEgTO/3bRYdF4d
 /uECzoaf0vDlogYIBGi/QyH/voB2vkYspVjogGPucTzpblve0WWS9HDtVF9WwbPQg4Iq
 UO0t+HQMU7n5v2OxOVzpXqxxfrqXitxV36ZvNmY/7NHhiGBs2Eoc0OVc1QHMAbW3HBuF
 Uf8A==
X-Gm-Message-State: AOAM531VIQqgAR3DytNmg64j7LOC0E1WKAD1Xi6nTg3+5g7S+8ovSE7F
 mnX6P+X2hOStYSe1n83Bol6ktqTydj7XyZ7n4kJE5mXCWAszC8KIjR9Cknu+/edCGP4pa5yzM2g
 /5qeA8w3GdFvScQh0dEhKJeo+EGetN1LR
X-Received: by 2002:a17:906:a398:b0:6ce:71b:deff with SMTP id
 k24-20020a170906a39800b006ce071bdeffmr30435594ejz.204.1648026436622; 
 Wed, 23 Mar 2022 02:07:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSNaJM3pOmXS9oGIi2yJdReRSdSgIPE/2seD6VZzaOSi9Eu7YwROCPqfm9xQsBmSR+N+NlwQ==
X-Received: by 2002:a17:906:a398:b0:6ce:71b:deff with SMTP id
 k24-20020a170906a39800b006ce071bdeffmr30435566ejz.204.1648026436292; 
 Wed, 23 Mar 2022 02:07:16 -0700 (PDT)
Received: from localhost.localdomain (068-133-067-156.ip-addr.inexio.net.
 [156.67.133.68]) by smtp.gmail.com with ESMTPSA id
 m17-20020a17090672d100b006df98bb199dsm7917103ejl.129.2022.03.23.02.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 02:07:15 -0700 (PDT)
From: christian.ehrhardt@canonical.com
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] build: disable fcf-protection on -march=486 -m16
Date: Wed, 23 Mar 2022 10:07:13 +0100
Message-Id: <20220323090713.1002588-1-christian.ehrhardt@canonical.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.122;
 envelope-from=christian.ehrhardt@canonical.com;
 helo=smtp-relay-internal-0.canonical.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christian Ehrhardt <christian.ehrhardt@canonical.com>

Some of the roms build with -march=i486 -m16 which is incompatible
with -fcf-protection. That in turn is can be set by default, for
example in Ubuntu [1].
That causes:
 cc1: error: ‘-fcf-protection’ is not compatible with this target

This won't work on -march=i486 -m16 and no matter if set or not we can
override it to "none" if the option is known to the compiler to be
able to build reliably.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/889

[1]: https://wiki.ubuntu.com/ToolChain/CompilerFlags#A-fcf-protection

Signed-off-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
---
 pc-bios/optionrom/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 5d55d25acc..f1ef898073 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -14,6 +14,10 @@ cc-option = $(if $(shell $(CC) $1 -c -o /dev/null -xc /dev/null >/dev/null 2>&1
 
 override CFLAGS += -march=i486 -Wall
 
+# If -fcf-protection is enabled in flags or compiler defaults that will
+# conflict with -march=i486
+override CFLAGS += $(call cc-option, -fcf-protection=none)
+
 # Flags for dependency generation
 override CPPFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d
 
-- 
2.35.1


