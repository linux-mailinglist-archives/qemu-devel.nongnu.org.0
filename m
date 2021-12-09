Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F238446F43C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 20:47:55 +0100 (CET)
Received: from localhost ([::1]:53184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvPOU-00061f-Jz
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 14:47:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvPML-0004MI-Pr
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 14:45:41 -0500
Received: from [2a00:1450:4864:20::42c] (port=34760
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvPMJ-0008CW-NM
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 14:45:41 -0500
Received: by mail-wr1-x42c.google.com with SMTP id j3so11617151wrp.1
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 11:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5PEQGZl48JLyiMPJrYocwgG7rzgazf0ReO3wQ7rARg0=;
 b=oiW6aMCK7TBPj42Qu6Phd+I4qz2ZQX3NNnHYQOwnK9cuJA0S7oahw3TdebgL25U5ux
 ONji6HNJUvf7nPRFKU3i0FpNyCZzSfGIBjPPmO2XA8ZS4S8ZGO3o53APayBIhfCcjBPE
 wCMwWqlGjpQn7e7tqypLrF+Z4mfhWsyQfrgLwOy6KbZ70BNK1L/H5gziciU+M7nTLHRc
 ResXXQquPqxBeME2lRgQVGdacuLiqPfJ31BSixDef1w8I1NYtussbd93tAiRF6zuDtoA
 IxsEBvUY0uNVlWDBdVRxlszoMgJA3dizTtyQT9rLyojnigC6zP42aYF3qIoM4eqqkqC3
 SqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5PEQGZl48JLyiMPJrYocwgG7rzgazf0ReO3wQ7rARg0=;
 b=ozozsTFMnKiyhGKrwg5vg0JqCa9EOo73gYQ4xmJ3PZNlgUus38nDVcDyF+BSH9awAd
 KJkmmLvpeSCUv43uWQoEeheZDeKtLi4aAnl5E4Fq2WzBdgbrejJLHnaiP52M+LEVE3xX
 KJswnArV3AYTynz0WxgcjaFNXj0UM4wELIEYFgw+HAzaF6PR4gVQ3xSdRi5xeBp9n10/
 YZxfjGlQS1U5P/VDEPOgpFdFmmLoQmq0FJy0I3RelJGZ9Vp/KS1a/9ULJSCEFdB4Hkon
 Dz8MhhUw77Xvs1Qioybj2NxwUFkhVcVTkqZI0mFWBzQUPloIf2zGLsz0a+A84yJphQWP
 e/4Q==
X-Gm-Message-State: AOAM5332ygdbypeGuFiQXl2OgC2lf1gCQQaGlSHaFs2MdrWUbeCLFMnU
 Od/4XQ2TY8OqNk0XqImMfIJqo6vZmESJlA==
X-Google-Smtp-Source: ABdhPJxznRRHIfy2Um0Q2fRcPIU5SFtR5p7la5lQ19SvdhMRCUyUenroT858A386nxqEQTv6iqgh7g==
X-Received: by 2002:a5d:468f:: with SMTP id u15mr8891825wrq.171.1639079136276; 
 Thu, 09 Dec 2021 11:45:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id b15sm855425wri.62.2021.12.09.11.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 11:45:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for-7.0] scripts: Explain the difference between
 linux-headers and standard-headers
Date: Thu,  9 Dec 2021 19:45:32 +0000
Message-Id: <20211209194532.1502920-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you don't know it, it's hard to figure out the difference between
the linux-headers folder and the include/standard-headers folder.
So let's add a short explanation to clarify the difference.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1 of this was from Thomas; I suggested some expanded wording
and since that made the patch pretty much entirely my text
Thomas suggested I send this under my name.
---
 scripts/update-linux-headers.sh | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index fea4d6eb655..d23851e1d3b 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -9,6 +9,22 @@
 #
 # This work is licensed under the terms of the GNU GPL version 2.
 # See the COPYING file in the top-level directory.
+#
+# The script will copy the headers into two target folders:
+#
+# - linux-headers/ for files that are required for compiling on a
+#   Linux host.  Generally we have these so we can use kernel structs
+#   and defines that are more recent than the headers that might be
+#   in /usr/include/linux on the host system.  Usually this script
+#   can do simple file copies for these headers.
+#
+# - include/standard-headers/ for files that are used for guest
+#   device emulation and are required on all hosts.  For instance, we
+#   get our definitions of the virtio structures from the Linux
+#   kernel headers, but we need those definitions regardless of which
+#   host OS we are building on.  This script has to be careful to
+#   sanitize the headers to remove any use of Linux-specifics such as
+#   types like "__u64".  This work is done in the cp_portable function.
 
 tmpdir=$(mktemp -d)
 linux="$1"
-- 
2.25.1


