Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE703CC939
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 14:57:53 +0200 (CEST)
Received: from localhost ([::1]:52746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m56Mi-00051O-QM
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 08:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bj-0003kN-Jk
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:33 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bf-0003Us-Qt
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:31 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso9141489wmc.1
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 05:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lhPK/MgzzWgIQuDKMvdlrdmQb+MRcqpffc7m8kQ3zIs=;
 b=mtA2lVt8pCgr1IPPcB+pfiqaGvq02D7lJM+hekFBDhooyA34TVyb2hYy67OzHANJSw
 /p4CRN3gVyDDY1rD90IhOoey34u4bvFB3pu4DKE0NWb3Bddr4RK4rEhJQk0cc/Hpbjlw
 9NxRnKgmKEQuqWDrgmeVyJYKbOmxP4jbJf0gO9SbgxUhiZnZCMQReryw6Siiye5mmzlo
 jlDWP6BFqdXSf4xdCvjEQTWn8C31kGKIntprWM81jpKNqR0vWid+TCZ8IrIsi2QUww7Y
 yQgMJPxA1qKgBydgpPzhj/VS3Y/TSwmK7Ku0acl1UCmbmeV/jL6EZxNt+ZU+jq2ytaDF
 HZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lhPK/MgzzWgIQuDKMvdlrdmQb+MRcqpffc7m8kQ3zIs=;
 b=tBhwQ4/KIVV1ieeJ41oz9tur0EujGBLyoyHQSv7CHIjP2uA7yxczZDfC05UchnXK8z
 Wixzw00g/qoPNXlrvPo88KYu5ZFsLF2h7eZTxTPIzGJTLdG5AOycaXT8FxkIFiaH9DbC
 tjx2PTOUxXFbEL06+lwfH2H1Oj5UtxGfiNo1tb7VLwKFbQKu6a/sXIZYEU8MsGaPgkpC
 6vu4HsTiZMh3YvX5bBLv99LMXzwpWq4EC4PuRoW++j1vdJ0DygplwIO1D/STvctIRJZr
 OA9il1rMZ/yTz9kJTzrf6OkitCMZatrIdMri2OxgKiwx2dhE3G6BJTfFIWivxzZr1Q8V
 Z+zA==
X-Gm-Message-State: AOAM531w13aS564ZD7DzUb5E+dxFvmNdjEJMTjS2gUf6ttApzaROIa8b
 G1K6oGRQw8Ix0SDStqyT11DkdzmY6jDmzg==
X-Google-Smtp-Source: ABdhPJzqRGR7khnPR9FP6BMRUkb2zGyttWVyvc8erId3mkFCj0EJRWfUXxDuCC5zV2TM7gVDjjh1fQ==
X-Received: by 2002:a7b:cd15:: with SMTP id f21mr21947830wmj.148.1626612386445; 
 Sun, 18 Jul 2021 05:46:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l23sm4053391wme.22.2021.07.18.05.46.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 05:46:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/12] docs: Remove "Contents:" lines from top-level subsections
Date: Sun, 18 Jul 2021 13:46:13 +0100
Message-Id: <20210718124621.13395-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210718124621.13395-1-peter.maydell@linaro.org>
References: <20210718124621.13395-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since the top-level subsections aren't self-contained manuals
any more, the "Contents:" lines at the top of each of their
index pages look a bit odd; remove them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20210705095547.15790-4-peter.maydell@linaro.org
---
 docs/devel/index.rst   | 2 --
 docs/interop/index.rst | 2 --
 docs/specs/index.rst   | 2 --
 docs/system/index.rst  | 2 --
 docs/tools/index.rst   | 2 --
 docs/user/index.rst    | 2 --
 6 files changed, 12 deletions(-)

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 9299d2a502d..153979caf4b 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -5,8 +5,6 @@ This section of the manual documents various parts of the internals of QEMU.
 You only need to read it if you are interested in reading or
 modifying QEMU's source code.
 
-Contents:
-
 .. toctree::
    :maxdepth: 2
    :includehidden:
diff --git a/docs/interop/index.rst b/docs/interop/index.rst
index 8b34da6f551..b1bab81e2ee 100644
--- a/docs/interop/index.rst
+++ b/docs/interop/index.rst
@@ -4,8 +4,6 @@ System Emulation Management and Interoperability
 This section of the manual contains documents and specifications that
 are useful for making QEMU interoperate with other software.
 
-Contents:
-
 .. toctree::
    :maxdepth: 2
 
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index 4c0d2a37cb8..b7b08ea30d7 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -4,8 +4,6 @@ System Emulation Guest Hardware Specifications
 This section of the manual contains specifications of
 guest hardware that is specific to QEMU.
 
-Contents:
-
 .. toctree::
    :maxdepth: 2
 
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 2a9bd759807..058cabd36cc 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -6,8 +6,6 @@ for full system emulation (as opposed to user-mode emulation).
 This includes working with hypervisors such as KVM, Xen, Hax
 or Hypervisor.Framework.
 
-Contents:
-
 .. toctree::
    :maxdepth: 3
 
diff --git a/docs/tools/index.rst b/docs/tools/index.rst
index ffb14b9690b..ef6041a490f 100644
--- a/docs/tools/index.rst
+++ b/docs/tools/index.rst
@@ -4,8 +4,6 @@ Tools
 This section of the manual documents QEMU's "tools": its
 command line utilities and other standalone programs.
 
-Contents:
-
 .. toctree::
    :maxdepth: 2
 
diff --git a/docs/user/index.rst b/docs/user/index.rst
index 6ac2ac089fd..9faa4badd78 100644
--- a/docs/user/index.rst
+++ b/docs/user/index.rst
@@ -5,8 +5,6 @@ This section of the manual is the overall guide for users using QEMU
 for user-mode emulation.  In this mode, QEMU can launch
 processes compiled for one CPU on another CPU.
 
-Contents:
-
 .. toctree::
    :maxdepth: 2
 
-- 
2.20.1


