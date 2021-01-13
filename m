Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC2B2F4E79
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:25:34 +0100 (CET)
Received: from localhost ([::1]:39668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzi1d-0007BU-RK
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhql-0005TY-GQ
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:19 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqj-0008V3-U7
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:19 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d13so2473179wrc.13
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 07:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J+ZyOmTbZGGF/na3FZVEfTeH0nNY0n7pW1MJ+4E4laE=;
 b=nwiyoitfntPLq+VXtYNDrE7WAryAojWCnSt89Qv78d3kCFQEf/BrOI4szYR2exejKX
 hT7DiVPax3Mt0fMPM80PdsGyR7bpUrix954wNxwAwZS0Vc2GMfLLg/+BQBVqY6ms/YHd
 PWhrnr+8yI1DRBxU0VD39XCAWuWVJw16x/DTHYJ0Rqd2l3jBxKTRmt3szeFK40VRh8vs
 eZwM5ANzQfeJ8paTKhzR8GeGkHymHvJIT0QqnNUfnp4MAz1/EBDCukOIKEmnUP8GPpRv
 x7NxZErwypRykX66uEUVURmr2Rj/yjTrT0PG3pvlTrveOnHl3YKG8jdLInB51P4XUQ+9
 MEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J+ZyOmTbZGGF/na3FZVEfTeH0nNY0n7pW1MJ+4E4laE=;
 b=nj5XWneLWSYF8pDYm5pDXxEbxaTKygVGRz+xALlMowgym1MT8ETkfqZtUAvRWb5DJi
 7A1mge1qV9l76Slgaq53lgx3NlJqkrUlxroUAmAAOt3UR23y8EuEWKEJC7Y9bA1LgopE
 V9Xe+qpH7iSGvTKBBNEgniJ0N1zD3GIHlHmTB7CVO5YNQXW3eVPhLI2BHmct27dbqzD6
 9PnBoYgizGWD4q978EExxA0c3trmY3UZf2qdpSGKhHI5fcn9EG5PUEH6P/H+uZH2BLVU
 Qz6tv6Qe8TCbxoGfEmQ/VtZJljTuszp9qWLtunjSYjRTibTHJMaMvkBTqDvhMr91Fx6w
 WMCw==
X-Gm-Message-State: AOAM531TiU2j0/nwBKXXE6Xp3t4pqStcXDBfi384YKpVXJHgfArMYPXb
 /79Htp7kSm0q7qSJ/ZIiWnkdnA==
X-Google-Smtp-Source: ABdhPJyKOZl2zg+acGOOKWXanwa4rGesTNsr4QAwIRdGZJ8EYsehRWH6TFrKByitH1ZEImxCz6Nkzw==
X-Received: by 2002:adf:fb49:: with SMTP id c9mr3167758wrs.72.1610550856489;
 Wed, 13 Jan 2021 07:14:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c13sm2545926wml.44.2021.01.13.07.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 07:14:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EC8951FF90;
 Wed, 13 Jan 2021 15:14:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 4/9] Add newline when generating Dockerfile
Date: Wed, 13 Jan 2021 15:14:03 +0000
Message-Id: <20210113151408.27939-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210113151408.27939-1-alex.bennee@linaro.org>
References: <20210113151408.27939-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Alessandro Di Federico <ale@rev.ng>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Message-Id: <1610080146-14968-36-git-send-email-tsimpson@quicinc.com>
---
 tests/docker/docker.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 36b7868406..884dfeb29c 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -332,9 +332,9 @@ class Docker(object):
                          (uname, uid, uname))
 
         tmp_df.write("\n")
-        tmp_df.write("LABEL com.qemu.dockerfile-checksum=%s" % (checksum))
+        tmp_df.write("LABEL com.qemu.dockerfile-checksum=%s\n" % (checksum))
         for f, c in extra_files_cksum:
-            tmp_df.write("LABEL com.qemu.%s-checksum=%s" % (f, c))
+            tmp_df.write("LABEL com.qemu.%s-checksum=%s\n" % (f, c))
 
         tmp_df.flush()
 
-- 
2.20.1


