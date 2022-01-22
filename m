Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F0D4968BE
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 01:29:58 +0100 (CET)
Received: from localhost ([::1]:37148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB4I1-000256-PN
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 19:29:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nB49P-0000Z5-Jk
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:21:05 -0500
Received: from [2607:f8b0:4864:20::429] (port=43561
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nB49L-00023p-Rf
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:21:02 -0500
Received: by mail-pf1-x429.google.com with SMTP id u10so5750652pfg.10
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 16:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V0ZvYUjZemLKLuTFp4e46YKCNcQO2PZPxXJ/DwDtTQc=;
 b=lcQ9Tf1RilRpADjb5Fw+koiFo5+cvQFXz/VrafjMQh/gs1a4wZ6mERtmuSrHUx7jLg
 Gmpff8L+UwqbbdR49R7JsgHOKLM1dS/1dq305MHEhy7r44XUzuPsU1NJ7iqZOj96hs7/
 GL2VB4qGH5KeLcbJXXQF+UQzDhtwbDEJiGpHi11jD9aC5CyxBEQxN0GZVsI/3mijjLVR
 s/phCYxiLibc1gS9HPqCO2d9pcB36bBXbDh0yo5b/4isMLIA/5mRQ4YPDNXLg1NoU464
 3YwNXfJfC99YmOgg1XcshJnFEj9PdaSpN5CZmfTV8RjUaVRcArDNUP9VB0mL+WhnBAa3
 o1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=V0ZvYUjZemLKLuTFp4e46YKCNcQO2PZPxXJ/DwDtTQc=;
 b=Dk63I5sFDQdFGOeX4kEPAUDjYIMItnQ7sdlYp/3ehHkisQLD7tbrNHtApd/mQxJZ4R
 pXVfhgMnO7rAkikpk1HWNxXCcZJnlRMDu/P8eN2gtlRtbN05XtebimDVhVojs8/XXqNt
 +jeTU2BppYOxNQXbjGbX9ntMCsgTDZz3pKc6bf9OZRC9HHsEDrPrbSBVb/7UGgISveU+
 03/dDplsj4tWd12e3KDuhJXFz6lOWXtBMbhceAQsKx05bu2btcI0AIsT1s2XZ5CoG+Mt
 sPae6N8TA1PVTorx9fO9K/L7Kjm/+hUCvufkSSIAsocpMMxzzYfaG8+BkeK0CswiHqt/
 fJNw==
X-Gm-Message-State: AOAM530F2DCjCB+jozaP9+H8rbpLXi5tvI9JcCODWR4lVgqhODYo3BJl
 TkAUhIMYkyanl9Wklkap9QhAsAk8+EU=
X-Google-Smtp-Source: ABdhPJyieUFV5onqfOWqaB/g0jMnNR75TIfsKfDTyyKMghQ009Q+0wSGD7lPbO76hdCdPHto2DrO0A==
X-Received: by 2002:a05:6a00:168b:b0:4a8:d88:9cd with SMTP id
 k11-20020a056a00168b00b004a80d8809cdmr5791251pfc.11.1642810858260; 
 Fri, 21 Jan 2022 16:20:58 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id g18sm5845747pgh.45.2022.01.21.16.20.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jan 2022 16:20:58 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] meson: Use find_program() to resolve the entitlement.sh script
Date: Sat, 22 Jan 2022 01:20:52 +0100
Message-Id: <20220122002052.83745-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Using ../configure without any particular option generates 31 targets
on Darwin, and meson search for the entitlement.sh script 31 times:

  Program nm found: YES
  Program scripts/undefsym.py found: YES (/opt/homebrew/opt/python@3.9/bin/python3.9 /Code/qemu/scripts/undefsym.py)
  Program scripts/feature_to_c.sh found: YES (/bin/sh /Code/qemu/scripts/feature_to_c.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
  Configuring 50-edk2-i386-secure.json using configuration
  Configuring 50-edk2-x86_64-secure.json using configuration

Use find_program() which seems to cache the script path once found.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index 833fd6bc4c..355f4c1acf 100644
--- a/meson.build
+++ b/meson.build
@@ -3052,17 +3052,14 @@ foreach target : target_dirs
         install_input += meson.current_source_dir() / entitlements
       endif
 
+      entitlement = find_program('scripts/entitlement.sh')
       emulators += {exe['name'] : custom_target(exe['name'],
                    input: build_input,
                    output: exe['name'],
-                   command: [
-                     files('scripts/entitlement.sh'),
-                     '@OUTPUT@',
-                     '@INPUT@'
-                   ])
+                   command: [entitlement, '@OUTPUT@', '@INPUT@'])
       }
 
-      meson.add_install_script('scripts/entitlement.sh', '--install',
+      meson.add_install_script(entitlement, '--install',
                                get_option('bindir') / exe['name'],
                                install_input)
     else
-- 
2.34.1


