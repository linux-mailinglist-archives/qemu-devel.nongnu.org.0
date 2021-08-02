Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DD63DD529
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:06:59 +0200 (CEST)
Received: from localhost ([::1]:33350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWig-0005sF-5d
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaK-0000MZ-21
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:20 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaI-0003ZI-Jk
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:19 -0400
Received: by mail-wr1-x434.google.com with SMTP id h13so7694187wrp.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dYWzxaEjFe3WsD8kw53uK4SvN3H1WbPYqZcSOzz5hJc=;
 b=qOpf7rm1HPj/uOEOwbKgvTSktlpiPVjimLwm5Dkost258OK61rKIAi1TuaYu1ehzqw
 4ZZaHItYLX4YCNPgswNI7mzo72T5FVC7nnkYoz+Qsn2Ugl2HDJF+nxODOV4I+MfymEMk
 RtdyCPcLQvjQfUX4cPJKITq88YSWuS4AD4klqSp7GltTB4+Kv21gTtCH2oYWhmgfBMdu
 b6vwsTmyjflmjQGjljxKktaKB+L83fFq42fsbJpv2W85vqnsZS9hz5aWCbqBFYM+Y5qz
 TTyFSfHDtMhJQuogKVjpfLkKwJSdChvgHXfiGzkCxWwRwXEUJuH9ZOS9HpAJoRaD4ReQ
 Lmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dYWzxaEjFe3WsD8kw53uK4SvN3H1WbPYqZcSOzz5hJc=;
 b=hrNPJhxPQYOR4eQl0Qxx6uZgQGypqoJqEXcIWEOI76cBng0Iqg2znEvaLqs0R9xOhs
 +IJR/a95TpLSed4w4levh1X4F7RmnKxLdTFuUcyHJIPD+1iVIEmGXzYICPk9hKFYWhq8
 VRb0l1Sor72hLEvOSXvOLT9abjm5SeTGX9nrD4NSR7AoLNje+1oVkK6TXaBI8VdLbYvm
 +YNESN3486aL7e0LAJ+z0bkS3RFS96RUdW3bhvgVy6r2+h4Z6TnylTFkZGFNtYBtBMth
 N4rddunI1KEh1Xks3DKgctizdTIlUtKcywCwiuUECR1RttGUHfikl3Tml9yGWzFiIT8Q
 OTEg==
X-Gm-Message-State: AOAM532/RUxTMpmSdCk4hj2Q/2WO6+49PBJ3XkGiLc3n1J9i4hvJnont
 bSQoCa5JbGY3qnK8CY3zHYtLpuq2aJoH3g==
X-Google-Smtp-Source: ABdhPJxDQrQywMce4vHHtp42hA2dOG8QV2bm05iO106kMcGk3rTbYmttBQ9X9gjrRB2EXU0mNU6THw==
X-Received: by 2002:adf:c549:: with SMTP id s9mr17318115wrf.344.1627905497217; 
 Mon, 02 Aug 2021 04:58:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/21] docs: Remove stale TODO comments about license and
 version
Date: Mon,  2 Aug 2021 12:57:56 +0100
Message-Id: <20210802115812.10731-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Since commits 13f934e79fa and 3a50c8f3067aaf, our HTML docs include a
footer to all pages stating the license and version.  We can
therefore delete the TODO comments suggesting we should do that from
our .rst files.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-id: 20210722192016.24915-2-peter.maydell@linaro.org
---
 docs/interop/qemu-ga-ref.rst                 | 9 ---------
 docs/interop/qemu-qmp-ref.rst                | 9 ---------
 docs/interop/qemu-storage-daemon-qmp-ref.rst | 9 ---------
 3 files changed, 27 deletions(-)

diff --git a/docs/interop/qemu-ga-ref.rst b/docs/interop/qemu-ga-ref.rst
index db1e9461249..032d4924552 100644
--- a/docs/interop/qemu-ga-ref.rst
+++ b/docs/interop/qemu-ga-ref.rst
@@ -1,15 +1,6 @@
 QEMU Guest Agent Protocol Reference
 ===================================
 
-..
-   TODO: the old Texinfo manual used to note that this manual
-   is GPL-v2-or-later. We should make that reader-visible
-   both here and in our Sphinx manuals more generally.
-
-..
-   TODO: display the QEMU version, both here and in our Sphinx manuals
-   more generally.
-
 .. contents::
    :depth: 3
 
diff --git a/docs/interop/qemu-qmp-ref.rst b/docs/interop/qemu-qmp-ref.rst
index b5bebf6b9a9..357effd64f3 100644
--- a/docs/interop/qemu-qmp-ref.rst
+++ b/docs/interop/qemu-qmp-ref.rst
@@ -1,15 +1,6 @@
 QEMU QMP Reference Manual
 =========================
 
-..
-   TODO: the old Texinfo manual used to note that this manual
-   is GPL-v2-or-later. We should make that reader-visible
-   both here and in our Sphinx manuals more generally.
-
-..
-   TODO: display the QEMU version, both here and in our Sphinx manuals
-   more generally.
-
 .. contents::
    :depth: 3
 
diff --git a/docs/interop/qemu-storage-daemon-qmp-ref.rst b/docs/interop/qemu-storage-daemon-qmp-ref.rst
index d0ebb42ebd5..9fed68152f5 100644
--- a/docs/interop/qemu-storage-daemon-qmp-ref.rst
+++ b/docs/interop/qemu-storage-daemon-qmp-ref.rst
@@ -1,15 +1,6 @@
 QEMU Storage Daemon QMP Reference Manual
 ========================================
 
-..
-   TODO: the old Texinfo manual used to note that this manual
-   is GPL-v2-or-later. We should make that reader-visible
-   both here and in our Sphinx manuals more generally.
-
-..
-   TODO: display the QEMU version, both here and in our Sphinx manuals
-   more generally.
-
 .. contents::
    :depth: 3
 
-- 
2.20.1


