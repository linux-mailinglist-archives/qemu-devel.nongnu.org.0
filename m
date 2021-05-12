Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6852337BA40
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:23:06 +0200 (CEST)
Received: from localhost ([::1]:41750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgm1B-0005ei-E4
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglz9-0003AH-BN
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:20:59 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:50730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglz7-0003UX-Od
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:20:59 -0400
Received: by mail-wm1-x331.google.com with SMTP id n84so12680387wma.0
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TuKozATKQ3Td5Fp2Tf/kZG/QQ+gsJcItcXeBYs6um/I=;
 b=P8NWa9iW7iSICPcPLN8NbQKUvf/P6CJjrr8J9hvWxkWGzwmjPl9/shVssgGC7GUn5B
 PoByOPkDfEIIpZaItBcVHiKJMYSAdInP0vLZcQrzv9coRbsgAEbSwYxFN0/GES+YL1dS
 Dy28KoVu87eSsKX6NYikD5F0k7J01SC7PnLFuIX4FblrhcAFrLBGKOEZtPMAl3x7PdbH
 I0K7f/XneYl28jHtKXDGa1IZoTAPrqfD2MZWFLTNwHUq4RBGdl8swtF5knIb0/HK014c
 lGVPk1E2YhakSTy6+c9C3qj4nf/PFmTG0g1bYZ+t7dB5QME6NGotuV/7oxvd1OrQiE1M
 J/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TuKozATKQ3Td5Fp2Tf/kZG/QQ+gsJcItcXeBYs6um/I=;
 b=Z0SO+BUIZQEOtW/26Eo7kLKOVCWDfoVMMdbkBNwuObSRLBb6eekqSWmEiBxen/CdPt
 6+Ua3lOWXV/FzsaxLaju4Cq5dTwoQXBmM5zDvGqgEvvXly1GSVIyItDb5VNIRfmnsaTy
 KfFgIXRoUbINkjCJhvKAL6wsupfpogIK5RCCIFMRd2Z8ZO0Btm7qAJbi48MCgJlpNobM
 ib21B8LQwtlhgo7R8lI/gt2eSjASkEHO6p6+u3DwzM0hM4c56WKRT1C6KMmA9CeoW2dj
 jbF/UJ0rz3mbCl3gNJ0eccnJe9YHxtMrMJ6uCO4Vj0KfhbRJR+hIbZCo1FE2ZGode5i3
 oxfg==
X-Gm-Message-State: AOAM532urphXZ+fI8zvefP2ozaugZm+cLxKnoJFrAXuOIR5IqpVV30JN
 7yoD8sRsbcg60bpW6mVR5TTDaA==
X-Google-Smtp-Source: ABdhPJz+esCxnMqU69uZXMhN6UveMJOh2FGK9YR6+aYmJ2nCSFQKDfTRiMFN+9uopY5c839tVPtDlw==
X-Received: by 2002:a1c:750b:: with SMTP id o11mr10791629wmc.188.1620814856275; 
 Wed, 12 May 2021 03:20:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f1sm3350739wrr.63.2021.05.12.03.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:20:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4FB4A1FF8C;
 Wed, 12 May 2021 11:20:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/31] tests/docker: fix copying of executable in "update"
Date: Wed, 12 May 2021 11:20:22 +0100
Message-Id: <20210512102051.12134-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have the same symlink chasing problem when doing an "update"
operation. Fix that.

Based-on: 5e33f7fead ("tests/docker: better handle symlinked libs")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
---
 tests/docker/docker.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index d28df4c140..0435a55d10 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -548,7 +548,14 @@ def run(self, args, argv):
         libs = _get_so_libs(args.executable)
         if libs:
             for l in libs:
-                tmp_tar.add(os.path.realpath(l), arcname=l)
+                so_path = os.path.dirname(l)
+                name = os.path.basename(l)
+                real_l = os.path.realpath(l)
+                try:
+                    tmp_tar.add(real_l, arcname="%s/%s" % (so_path, name))
+                except FileNotFoundError:
+                    print("Couldn't add %s/%s to archive" % (so_path, name))
+                    pass
 
         # Create a Docker buildfile
         df = StringIO()
-- 
2.20.1


