Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C848340380D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:43:06 +0200 (CEST)
Received: from localhost ([::1]:37584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNv2n-0001TP-Rx
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuS6-0006w5-DD
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:12 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuS2-0003Eh-A2
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:10 -0400
Received: by mail-wr1-x431.google.com with SMTP id g16so2421271wrb.3
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OFxC3PMcGDPUTIq1mYdRtX5DKUYLQy7cB0NmvTziU58=;
 b=JO0YnAr5aNq1OQ4jxsORJX5UVSCu0t7Xk3FVdZjxOFA/L+baKwJpw6NX/2Y6lW5kzA
 NUhZjh7P8WJcJQ7Ny9csvnWwXtF0cYAiH0BPhbq4gaaarUE80dKf69zIakhqYMZHH3Ef
 n9pFz5+iEM9sUqxtkiNVFsyKe0/FU6T9fvQSeMem9f69au0oQAOLpEjkUpnDpNgB2f0o
 M6/40EovVijGaSK27N4GAkBxb1L7C35B9oXDw/2rQYgU6rJgkB8doFexs3h6XttwCtz3
 gJpSiDPg6K0UfGdbvnJJcA7mMJC7Jqvvr53siP31Qezj/+M2j6SfjI8AtMCH9n5gux5u
 XSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OFxC3PMcGDPUTIq1mYdRtX5DKUYLQy7cB0NmvTziU58=;
 b=47q8fare5E3xVjS5qqJchbAyJc0BLHjx6fV/VMGOiSgY16C4p6bQiacbl66Pj/sdxw
 7HsndV7x2V8QjKUzyrA+O67nYvmTi8ASutllP3CuP0mUXz5df1Xvnz6KmEGAiLfLxhlL
 bCloXEhWDHYZNnVYJTjRpMRsDlRClAFMx4TcDY2LBJnDGWNq2oTW9cUy6bIMZ1SSXE8S
 YM84gDQ64nMYdmzhHpRkgNw1gc1NBTHMb52VWZiFq+1dKYYa9OcPQd5kVcRXaFan+ZMT
 t+SBzjy4x9WeOUA+QMFy6d2oprgINQv3dg4YRbe2ejyKnGuiQ54wG6jgtG3E4JcJBr/a
 BZEw==
X-Gm-Message-State: AOAM532MxNKeBsOW5Ahiz6R8GcaEIiNSolwkcp6m4AOEKZsAAFjIbWC4
 /So5D/nv0kxEFvH01x/ifDNsYjVkM7M=
X-Google-Smtp-Source: ABdhPJyAjtD31JHd8YKVYbxz00deUyXuiYNichvxODMg+QJTe00ORmb9tDx789vJL7+y9d2TEPXCyg==
X-Received: by 2002:a5d:6210:: with SMTP id y16mr2987439wru.290.1631095504207; 
 Wed, 08 Sep 2021 03:05:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:05:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 39/43] docs/system: standardize man page sections to ---
 with overline
Date: Wed,  8 Sep 2021 12:04:22 +0200
Message-Id: <20210908100426.264356-40-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Man pages in docs/system use file inclusion heavily.  Use headings with
overlines in the main files, so that the same included file work well
from both manuals and man pages.

This style of heading is a bit more heavy-weight, so it is not used by
the other man pages in interop/ and tools/.  If in the future they
are changed to use include files, for example to avoid having sections
named "synopsis" or "description", they can switch to --- with overline
as well.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/qemu-block-drivers.rst | 3 +++
 docs/system/qemu-cpu-models.rst    | 9 ++++++---
 docs/system/qemu-manpage.rst       | 5 +++++
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/docs/system/qemu-block-drivers.rst b/docs/system/qemu-block-drivers.rst
index eb276481d6..c2c0114cec 100644
--- a/docs/system/qemu-block-drivers.rst
+++ b/docs/system/qemu-block-drivers.rst
@@ -4,16 +4,19 @@
 QEMU block drivers reference
 ============================
 
+--------
 Synopsis
 --------
 
 QEMU block driver reference manual
 
+-----------
 Description
 -----------
 
 .. include:: qemu-block-drivers.rst.inc
 
+--------
 See also
 --------
 
diff --git a/docs/system/qemu-cpu-models.rst b/docs/system/qemu-cpu-models.rst
index 8c51e2bf49..5cf6e46f8a 100644
--- a/docs/system/qemu-cpu-models.rst
+++ b/docs/system/qemu-cpu-models.rst
@@ -4,18 +4,21 @@
 QEMU / KVM CPU model configuration
 ==================================
 
+--------
 Synopsis
-''''''''
+--------
 
 QEMU CPU Modelling Infrastructure manual
 
+-----------
 Description
-'''''''''''
+-----------
 
 .. include:: cpu-models-x86.rst.inc
 .. include:: cpu-models-mips.rst.inc
 
+--------
 See also
-''''''''
+--------
 
 The HTML documentation of QEMU for more precise information and Linux user mode emulator invocation.
diff --git a/docs/system/qemu-manpage.rst b/docs/system/qemu-manpage.rst
index d6f44e265b..c47a412758 100644
--- a/docs/system/qemu-manpage.rst
+++ b/docs/system/qemu-manpage.rst
@@ -10,6 +10,7 @@
 QEMU User Documentation
 =======================
 
+--------
 Synopsis
 --------
 
@@ -17,11 +18,13 @@ Synopsis
 
    |qemu_system| [options] [disk_image]
 
+-----------
 Description
 -----------
 
 .. include:: target-i386-desc.rst.inc
 
+-------
 Options
 -------
 
@@ -34,11 +37,13 @@ not need a disk image.
 
 .. include:: mux-chardev.rst.inc
 
+-----
 Notes
 -----
 
 .. include:: device-url-syntax.rst.inc
 
+--------
 See also
 --------
 
-- 
2.31.1



