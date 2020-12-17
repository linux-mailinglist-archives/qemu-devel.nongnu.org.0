Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4D12DCDDE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 09:52:01 +0100 (CET)
Received: from localhost ([::1]:52602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpp0z-0005Tm-1T
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 03:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpozF-00049x-UB
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 03:50:13 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:38653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpozE-00070e-A7
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 03:50:13 -0500
Received: by mail-ed1-x531.google.com with SMTP id cw27so27768345edb.5
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 00:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQWAnc6Cy9wCfLr/SfdyiSneflQ+1u+pan2MYebIIjs=;
 b=P4flaldiYERsJakV0ICGnrcaB8i+fWH9bG3LHwG/R9/huiAO77zPAFzTMWOBlUesqj
 D4J3p94KhN+8Ju6SZmu/8m9c9iN7MC/fkRphTvwLENhMk3lUGwqsQhEpJMp7ZjNRVMkK
 hyGahAWIR1ihPiiAERnWAF3GkcKdXJ56RYSe0hOxyXLboqN9oZ+GiUpJ6gzR6FC2N9yM
 7ZkjxVxLSwQzJoTOSTwEhBViWCqEzXyS4eX9Eclz26cp1ehVphCzolme8q5oi0IEST2B
 YQdeyZ9cPsiioQl5LnDeGDIwF8p+zhkvm6B79+X2pxpIUswji1udjA3IJPO0IxJNvV+I
 0rzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AQWAnc6Cy9wCfLr/SfdyiSneflQ+1u+pan2MYebIIjs=;
 b=Xqh57ZVMI/OpTfpw4nlv9481SgDHgvTOjubDTpy4PobJtLoRI4JBkr5rtPWhyXu2ET
 /gs8QReUiPlmARkxWVp5OZ7716UoiKk0h/K25E4ea9JDO55Q1UdNwzxArLMXk96Bb1sS
 I5PNdBsgmphlhNgNSSi0jEBz65krPRbMwe3zn0vMdC7ndFyAwfwIR0fQfv3Fby2FM1CH
 4t48Hc9R0AWWJb+MwALQFBwzzGpsD9IzzTpjldRFiTvh/7ZIlda8jE8poj/hDWyz5ADu
 CJTFyyI6thkTpBXGdVkmmjXoqUnlH4WUTEe30ZBJUt73l7zaBedMXgEFaQmERFT1SFSL
 NNUw==
X-Gm-Message-State: AOAM530b+mv5RKlnazGH9h7IUPqYPjy6YyT+WU7Lpu5YkFEgd3w8Y9iM
 lpp/JcDX4xtVJgCHsIGVGyH89Ke6O74=
X-Google-Smtp-Source: ABdhPJwLmkkSZoxeGIAPsO40f8vJaE/jCwQ3RnKGaxpoHJkASRYl9IgApOM8pQyDEeccLMqM6oKk1g==
X-Received: by 2002:a05:6402:8da:: with SMTP id
 d26mr10070053edz.157.1608195011015; 
 Thu, 17 Dec 2020 00:50:11 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dd12sm22949542edb.6.2020.12.17.00.50.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 00:50:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] configure: remove CONFIG_FILEVERSION and
 CONFIG_PRODUCTVERSION
Date: Thu, 17 Dec 2020 09:50:05 +0100
Message-Id: <20201217085005.10644-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217085005.10644-1-pbonzini@redhat.com>
References: <20201217085005.10644-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

version.rc can just use existing preprocessor symbols.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure  | 9 ---------
 version.rc | 4 ++--
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 568818e72d..74eebfd692 100755
--- a/configure
+++ b/configure
@@ -5929,15 +5929,6 @@ if test "$bigendian" = "yes" ; then
 fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
-  rc_version=$(cat $source_path/VERSION)
-  version_major=${rc_version%%.*}
-  rc_version=${rc_version#*.}
-  version_minor=${rc_version%%.*}
-  rc_version=${rc_version#*.}
-  version_subminor=${rc_version%%.*}
-  version_micro=0
-  echo "CONFIG_FILEVERSION=$version_major,$version_minor,$version_subminor,$version_micro" >> $config_host_mak
-  echo "CONFIG_PRODUCTVERSION=$version_major,$version_minor,$version_subminor,$version_micro" >> $config_host_mak
   if test "$guest_agent_with_vss" = "yes" ; then
     echo "CONFIG_QGA_VSS=y" >> $config_host_mak
     echo "QGA_VSS_PROVIDER=$qga_vss_provider" >> $config_host_mak
diff --git a/version.rc b/version.rc
index d8e1569991..0daadbf981 100644
--- a/version.rc
+++ b/version.rc
@@ -2,8 +2,8 @@
 #include "config-host.h"
 
 VS_VERSION_INFO VERSIONINFO
-FILEVERSION CONFIG_FILEVERSION
-PRODUCTVERSION CONFIG_PRODUCTVERSION
+FILEVERSION QEMU_VERSION_MAJOR,QEMU_VERSION_MINOR,QEMU_VERSION_MICRO,0
+PRODUCTVERSION QEMU_VERSION_MAJOR,QEMU_VERSION_MINOR,QEMU_VERSION_MICRO,0
 FILEFLAGSMASK VS_FFI_FILEFLAGSMASK
 FILEOS VOS_NT_WINDOWS32
 FILETYPE VFT_APP
-- 
2.29.2


