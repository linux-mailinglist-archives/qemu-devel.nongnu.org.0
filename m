Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DB049FCF1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:36:27 +0100 (CET)
Received: from localhost ([::1]:36318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTIY-0005AS-AT
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:36:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTD6-0002Ae-TG
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:52 -0500
Received: from [2a00:1450:4864:20::432] (port=42598
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTD0-0006Q0-2o
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:45 -0500
Received: by mail-wr1-x432.google.com with SMTP id a13so11560609wrh.9
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dwHC/ctEYOOYZjyRsSRWGZZC159ozfXxs9syF5bxiNs=;
 b=t+94CuuQrKSosJGOI4rVaV31UvLb5KpjwFV6c4gKmu4q4KvsQCCUIPFLOKZ0i8dgym
 VMIRqt95UNpB1viGiyzb3KxV23KCXvNilQ02XZKWws7LezFqq4e/BXZxFPRRnGhaOZ+h
 jn3MBNTj3c0eiiu8moaL0OqbsCb+BAFd+uKlr75XF/ChNFN1Zf4ZWtJRIz6l2Q/XaBKF
 wu52yFgeGGU5ilHCUDOtgxeqtqrQe7tCaEPQGfVloJ+KinkQ/YP5x4TYajmPQ9ks6IGO
 ufSBFbb9ht5JICzNPtpbPJjiL7s7XvTRMB+aQdvK8PokujeALmc79bLPy6AYdtm4I5HU
 7/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dwHC/ctEYOOYZjyRsSRWGZZC159ozfXxs9syF5bxiNs=;
 b=e1nIb2kl8yePsyluURqyn448E+L2iarZO1hjQQS6vW4uJuZYjaqLI77IyK1gN9fJaO
 qLmOH5vPxveCpur1dKaQCiKZKeBX+BbGXvlmsjOYskgnyS09TyKFbCUO5jHwO/D16z8X
 hKgvpVSOWU6cspFBF+s9fxIKvaanGbOdLDOkMtYOO5RhhDmZjQqtxV1hxCdbk28U5kzr
 /RF3KIaN2M8yhs5NnYJ/tv0dkfWHiIbPM4sTNZBaAXmdJfVQi94W6/LpWDJangiiv7aJ
 aS/O3Tm0ViAmlYyZZfqvrisKpy23FvdVEnJxHhP8eq78pk9vtpTQPKYB2IdqOUefzBK0
 f/Kw==
X-Gm-Message-State: AOAM530Z4dyjfc+fl91bas1q7351c8BajBdU2OnaC5Zo9xtOEC8vOmMT
 bsdJWybsMCCNBcC27mNte10yEzvnn0eIhw==
X-Google-Smtp-Source: ABdhPJwoRqT76mTqnWUXomioJhjk8iLIm0k8KzuXVKPT8NUTa9IW7Tw4OHsTtTPuUxtBnnZP0Gh+uw==
X-Received: by 2002:adf:d1ec:: with SMTP id g12mr7936088wrd.8.1643383831391;
 Fri, 28 Jan 2022 07:30:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/32] scripts: Explain the difference between linux-headers
 and standard-headers
Date: Fri, 28 Jan 2022 15:29:53 +0000
Message-Id: <20220128153009.2467560-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

If you don't know it, it's hard to figure out the difference between
the linux-headers folder and the include/standard-headers folder.
So let's add a short explanation to clarify the difference.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 scripts/update-linux-headers.sh | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index fea4d6eb655..fe850763c55 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -9,6 +9,22 @@
 #
 # This work is licensed under the terms of the GNU GPL version 2.
 # See the COPYING file in the top-level directory.
+#
+# The script will copy the headers into two target folders:
+#
+# - linux-headers/ for files that are required for compiling for a
+#   Linux host.  Generally we have these so we can use kernel structs
+#   and defines that are more recent than the headers that might be
+#   installed on the host system.  Usually this script can do simple
+#   file copies for these headers.
+#
+# - include/standard-headers/ for files that are used for guest
+#   device emulation and are required on all hosts.  For instance, we
+#   get our definitions of the virtio structures from the Linux
+#   kernel headers, but we need those definitions regardless of which
+#   host OS we are building for.  This script has to be careful to
+#   sanitize the headers to remove any use of Linux-specifics such as
+#   types like "__u64".  This work is done in the cp_portable function.
 
 tmpdir=$(mktemp -d)
 linux="$1"
-- 
2.25.1


