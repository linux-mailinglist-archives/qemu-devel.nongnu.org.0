Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F7B3874CA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:09:35 +0200 (CEST)
Received: from localhost ([::1]:35926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livjK-0001wW-Ef
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhG-0007m9-Rj
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:26 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhF-0005PB-4X
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:26 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 u4-20020a05600c00c4b02901774b80945cso1045339wmm.3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hNbaGxhqPGsZO3tTrtNT3mznUNT/xWUzHwS2o2IUsWc=;
 b=XDBDblTNM9H+yWCwcRRwxuhMSDMhDUBbD9nKQzW2pfvGaHiCU5olEvRchcROt4uz1Q
 zGMaen+sU2nsF8e5qlq6Vq5E2bm/1fsLVwla85rqnnYbpq72pwf/f9p9fddgc2zFxp/T
 6LqTCNKobQUlH3S/BM93jxXFQEpTCXHFs5az3MI1uRBMaq73CIsbP74i/u2eobIuhO4A
 sDs+xG5pylyc6jHkaWJ4SxkfAtTXb3nJYL8d2bNxGTcgZgvpRUQ1cQr1u/fDnHvIHEq2
 loL2NQuBG1d1HVPS1XOZBMl8Ke213U9iKrFopoYowbi48k82OTU/07T/NVL3IMTl0Hd7
 VwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hNbaGxhqPGsZO3tTrtNT3mznUNT/xWUzHwS2o2IUsWc=;
 b=KxTb9ia/TTJOcgq+BJ21POZAUHFaI2WArXAzuSF1e0u09hsxPhOoVE8kcjECVMh4CK
 nBzqw83wal7a1T5O1joLWwtBayhWA2vvPX8x+Cs+OtwMavwplq8LDQFs67urb95TckxQ
 /C1k58Z3SVeIMGbB04MHlBzEHCvoUrtVQNnWZ2VFxjmh9e/AgupGdXFe3MLxdthaztwf
 6f9gaJW3EpsEOOnKxB4bjiqREnl2IZ3fMkSvLGkAKxqQLzYv9ZYw4DFuUqjqNAU2fisu
 +HryuodCdWkk27k5uQ1HK5EBzrA1HGxikxf0GSvZ3/ahP8mqi9yZ6J7hcvtv8uBPDHg1
 XU3w==
X-Gm-Message-State: AOAM5323jS7fpj+kf+Jw8Pf6dW5vuWyAE81bqN1BDUeU8+SwjDDno8gV
 5BFsFYaKHy+xPW2ILp1Ry6ih/g==
X-Google-Smtp-Source: ABdhPJyz62oqBEM1GvkX4eUi7ZXpnm17mNko6kze7YiIYzlOEFFVYZHQPGyPVa3bEh8d0i+xzHrPQw==
X-Received: by 2002:a05:600c:3798:: with SMTP id
 o24mr3917792wmr.12.1621328843629; 
 Tue, 18 May 2021 02:07:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x2sm7276469wmj.3.2021.05.18.02.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:07:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D5251FF87;
 Tue, 18 May 2021 10:07:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 01/29] tests/docker: fix copying of executable in "update"
Date: Tue, 18 May 2021 10:06:52 +0100
Message-Id: <20210518090720.21915-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have the same symlink chasing problem when doing an "update"
operation. Fix that.

Based-on: 5e33f7fead ("tests/docker: better handle symlinked libs")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210512102051.12134-3-alex.bennee@linaro.org>

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


