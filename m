Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7653DD546
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:09:14 +0200 (CEST)
Received: from localhost ([::1]:41110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWkr-0002oy-Cn
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaK-0000Nl-Go
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:20 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:52037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaJ-0003ZO-1L
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:20 -0400
Received: by mail-wm1-x32c.google.com with SMTP id u15so10252544wmj.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=x8RJzHi+/BlMs3RtR+24I7t54meXItlsIyK745HJ9J0=;
 b=MpuFau0Qn8ySebK8aZFb+bdSBN1+EFeZkg8tUGLAzEZ8Sax9VdiUyXGmiJ6Eo8eluD
 MNVQScQ0JFaEHSSkaSAhXD0CAKrky0qIKqH10JqAYCXXcXD+rYanBCN6FHU5KbAOnrrq
 yZxhIDxCPHM2T9GfUQGOK1b7jEPC8a6TB8TbeQfscB3IbxAGIiAne32XANi508EeUHMK
 5I3G3f10kiAyJR81kRZvEPe27AxTfEJCp1hwGlFn8R2E5iB3Dhd/drfzIEGVgqZcuqj8
 8tFE5/oUsY7mQzkM/Yuc+deOHwK1Oo3MPAFjyFd5KjbgEo7AU5eUwqp+noOnPbnFTamI
 Brew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x8RJzHi+/BlMs3RtR+24I7t54meXItlsIyK745HJ9J0=;
 b=cvHDufRNEVm0+cKeSXAUBMmCqPxeyb80Y9l+NO2GzlHZcceNdgW+DqerUpurhc936y
 saBYPQWAwnNRJkUFhVubrXa5hdQv+5CE65fsb74nEENmhpppEo9OM20ru8P57pAKE8ee
 IsBzD1ZwDHsaz4thOmj2mN9xXnc+fxil2J967fAIuwYbYLrG+o5Ll6uezZBPMDCO7eH2
 WXgF6+H4b4YSmwFLrNBaX0yP3aKDfwMbq5F9Ztt8wCeh8WZxJ3ExA77WzExmPfjpT7AE
 iknBLiKkH5PPaT5rnQV2oVwoUZglTFRzCCtmRzWQfYRoi+UEJ4E4Gar/1pTA/oRf/D1J
 eLBQ==
X-Gm-Message-State: AOAM531AiGrpsfimNA884gfLLPmvJKp9ZQhUhPCamPv/z/Im8fhk0cWJ
 RRZl3K39ERuSvc43ADupfCAQDunR9NxGSA==
X-Google-Smtp-Source: ABdhPJzstM26D4hu/yuSn6HCL601TcheDO2ALt5YkP0AtWm7OhW8MUHmBDGMeAGyqgULPnHotIQYew==
X-Received: by 2002:a05:600c:4e87:: with SMTP id
 f7mr14890355wmq.121.1627905497835; 
 Mon, 02 Aug 2021 04:58:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/21] docs: Move licence/copyright from HTML output to rST
 comments
Date: Mon,  2 Aug 2021 12:57:57 +0100
Message-Id: <20210802115812.10731-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
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

Our built HTML documentation now has a standard footer which
gives the license for QEMU (and its documentation as a whole).
In almost all pages, we either don't bother to state the
copyright/license for the individual rST sources, or we put
it in an rST comment. There are just three pages which render
copyright or license information into the user-visible HTML.

Quoting a specific (different) license for an individual HTML
page within the manual is confusing. Downgrade the license
and copyright info to a comment within the rST source, bringing
these pages in line with the rest of our documents.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 20210722192016.24915-3-peter.maydell@linaro.org
---
 docs/interop/vhost-user-gpu.rst |  7 ++++---
 docs/interop/vhost-user.rst     | 12 +++++++-----
 docs/system/generic-loader.rst  |  4 ++--
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/docs/interop/vhost-user-gpu.rst b/docs/interop/vhost-user-gpu.rst
index 3268bf405ce..71a2c52b313 100644
--- a/docs/interop/vhost-user-gpu.rst
+++ b/docs/interop/vhost-user-gpu.rst
@@ -2,9 +2,10 @@
 Vhost-user-gpu Protocol
 =======================
 
-:Licence: This work is licensed under the terms of the GNU GPL,
-          version 2 or later. See the COPYING file in the top-level
-          directory.
+..
+  Licence: This work is licensed under the terms of the GNU GPL,
+           version 2 or later. See the COPYING file in the top-level
+           directory.
 
 .. contents:: Table of Contents
 
diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 7fc693521e5..edc3ad84a35 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -3,11 +3,13 @@
 ===================
 Vhost-user Protocol
 ===================
-:Copyright: 2014 Virtual Open Systems Sarl.
-:Copyright: 2019 Intel Corporation
-:Licence: This work is licensed under the terms of the GNU GPL,
-          version 2 or later. See the COPYING file in the top-level
-          directory.
+
+..
+  Copyright 2014 Virtual Open Systems Sarl.
+  Copyright 2019 Intel Corporation
+  Licence: This work is licensed under the terms of the GNU GPL,
+           version 2 or later. See the COPYING file in the top-level
+           directory.
 
 .. contents:: Table of Contents
 
diff --git a/docs/system/generic-loader.rst b/docs/system/generic-loader.rst
index 531ddbc8e34..4f9fb005f1d 100644
--- a/docs/system/generic-loader.rst
+++ b/docs/system/generic-loader.rst
@@ -1,8 +1,8 @@
 ..
    Copyright (c) 2016, Xilinx Inc.
 
-This work is licensed under the terms of the GNU GPL, version 2 or later.  See
-the COPYING file in the top-level directory.
+   This work is licensed under the terms of the GNU GPL, version 2 or later.  See
+   the COPYING file in the top-level directory.
 
 Generic Loader
 --------------
-- 
2.20.1


