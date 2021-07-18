Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE79F3CC92A
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 14:49:18 +0200 (CEST)
Received: from localhost ([::1]:58894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m56EP-0006x8-TD
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 08:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bj-0003jo-5P
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:31 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:44812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bh-0003V0-AB
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:30 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 f10-20020a05600c4e8ab029023e8d74d693so3700249wmq.3
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 05:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4I9/jw2cx7Pk8otbfx+cBDcmVAJ5Zcywf2LBoJK+/Y8=;
 b=mjJQvXj6p4xuPsgkDUvpoy+YPbFIeNHGt2j3Pl3b5eE3Hb90bFaqH3S02SCGw/TBYx
 oQOX+0L19+MjYA/nt4mXQYZef8ZexpNXvm4hpLJO3erbFsFP/v9V05/jzVApEyTZxrBd
 2VHWZJzPFFMgTOtrOGiLdmLAHb4Ozhj9gzT6OpbFMiabV9vqbuC6PriTXoB8blgSdNCB
 DU2V3G52FfJYmdLlEuMKanQEj803WYB1uF3wgtKm8bqBZVQgm1zGqztiCdeGbn34zyA+
 iOPOaJPreYlEMAVlCpe9zTSsDoaYitS3SZrEnU3qDhGJa9ORNpTbAxX7vRoLOP8d2duO
 lpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4I9/jw2cx7Pk8otbfx+cBDcmVAJ5Zcywf2LBoJK+/Y8=;
 b=JEuS8p05u4Lax0vuBo8+IXcG9+eynzJzLAxirflIq0bMf+Nl705Be+ECszQahVWXzR
 /X5JI2hS5d8rW2jE1cvnlUBVvTXoZSLoNbouTqf9uIvoRezNQdSzBHkWniu0L3wPYmqt
 R5CH+ZPntQOkW3s97eTePwPqbGHl4OJsn1gbOwRIBmeaKIS6uMGk8G7+Pk6B/x45+mRs
 Lc3mhmRRGmjeAyPoowDdrg+YYAzMtLqavesWFO1UUIA9TNzAhTwFiQjmrqoUjD1+4B5f
 0EUc8IFf0EtcQH0rs8ezwD0FfcpmBzYUtUcgLxPvcRhMOB3GrD0idBYrtjeJ5WQuOA13
 PUUw==
X-Gm-Message-State: AOAM5309JhJzpvMX1wosmc7t9Ttkt8v9V4Z2d5xZlqM0gMrJGsbMdKHE
 ICHm4rWwogWjd7kO0ng3Q/4qLwZHk+hzZA==
X-Google-Smtp-Source: ABdhPJzj2FpHF/TrhmFkBmXa2zUhTRGBUNDNy122kPknv51r/ICD9slsURsgcQyaynVOSYl1rp4jnA==
X-Received: by 2002:a1c:790e:: with SMTP id l14mr26525537wme.119.1626612387082; 
 Sun, 18 Jul 2021 05:46:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l23sm4053391wme.22.2021.07.18.05.46.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 05:46:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/12] docs: Move deprecation,
 build and license info out of system/
Date: Sun, 18 Jul 2021 13:46:14 +0100
Message-Id: <20210718124621.13395-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210718124621.13395-1-peter.maydell@linaro.org>
References: <20210718124621.13395-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have a single Sphinx manual rather than multiple manuals,
we can provide a better place for "common to all of QEMU" information
like the deprecation notices, build platforms, license information,
which we currently have in the system/ manual even though it applies
to all of QEMU.

Create a new directory about/ on the same level as system/, user/,
etc, and move these documents there.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20210705095547.15790-5-peter.maydell@linaro.org
---
 docs/{system => about}/build-platforms.rst  |  0
 docs/{system => about}/deprecated.rst       |  0
 docs/about/index.rst                        | 10 ++++++++++
 docs/{system => about}/license.rst          |  0
 docs/{system => about}/removed-features.rst |  0
 docs/index.rst                              |  1 +
 docs/system/index.rst                       |  4 ----
 7 files changed, 11 insertions(+), 4 deletions(-)
 rename docs/{system => about}/build-platforms.rst (100%)
 rename docs/{system => about}/deprecated.rst (100%)
 create mode 100644 docs/about/index.rst
 rename docs/{system => about}/license.rst (100%)
 rename docs/{system => about}/removed-features.rst (100%)

diff --git a/docs/system/build-platforms.rst b/docs/about/build-platforms.rst
similarity index 100%
rename from docs/system/build-platforms.rst
rename to docs/about/build-platforms.rst
diff --git a/docs/system/deprecated.rst b/docs/about/deprecated.rst
similarity index 100%
rename from docs/system/deprecated.rst
rename to docs/about/deprecated.rst
diff --git a/docs/about/index.rst b/docs/about/index.rst
new file mode 100644
index 00000000000..cd44456a6bf
--- /dev/null
+++ b/docs/about/index.rst
@@ -0,0 +1,10 @@
+About QEMU
+==========
+
+.. toctree::
+   :maxdepth: 2
+
+   build-platforms
+   deprecated
+   removed-features
+   license
diff --git a/docs/system/license.rst b/docs/about/license.rst
similarity index 100%
rename from docs/system/license.rst
rename to docs/about/license.rst
diff --git a/docs/system/removed-features.rst b/docs/about/removed-features.rst
similarity index 100%
rename from docs/system/removed-features.rst
rename to docs/about/removed-features.rst
diff --git a/docs/index.rst b/docs/index.rst
index 763e3d0426e..5f7eaaa632c 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -10,6 +10,7 @@ Welcome to QEMU's documentation!
    :maxdepth: 2
    :caption: Contents:
 
+   about/index
    system/index
    user/index
    tools/index
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 058cabd36cc..fda4b1b7054 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -35,7 +35,3 @@ or Hypervisor.Framework.
    targets
    security
    multi-process
-   deprecated
-   removed-features
-   build-platforms
-   license
-- 
2.20.1


