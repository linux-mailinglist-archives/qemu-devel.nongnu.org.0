Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C501E43AFFB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:24:58 +0200 (CEST)
Received: from localhost ([::1]:33270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJdZ-00031o-Rt
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbV-0000s8-Q8
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:49 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbN-0007Pc-1G
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:49 -0400
Received: by mail-wr1-x430.google.com with SMTP id e4so18238847wrc.7
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YuaBu1rOwjU9MDwY7+fh2xhLZTl7FZqKtWIuPxT1DVk=;
 b=NSXQdQluZUUYRYtkJZgwvJrfYfbzeATcU4Y+uDdiIWxdAg80PFHirKgNdrVjWGGgi2
 wFXsOQfbhZ0N6++K0mUx90EQrh798vUncVBF451leG2PyO4N+fBNVrDtIFHlOViZrwnk
 QIfn6DSKnwKZHJiYZaRN/ULOt4pKKQGbd8/A1G1a1Dt2FHqrUE8kjbewkw+/WM4Z3bmU
 aUBQugzzKVr1UJINVnDMP7UFb2VYwu2+7AMhIJaDZAWnPvOyJzc/9GRkDgYbGewoQE5l
 n6UZxTyGq7zshljzOK0dJ2onDbZkiiZVUwNkNWGPd+gxF5KvrG0ABQLAvobEHcJcUhaS
 ZvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YuaBu1rOwjU9MDwY7+fh2xhLZTl7FZqKtWIuPxT1DVk=;
 b=X85Keuh76nNKQmY7NdwGnRKOnx5erO2cBxn9tlgPpqSVNHV/NxuWMerassYJiSc1e2
 7uaBVhPCxZVBrhinohMChd75rW/TSJKz8keOhuKWIon1SQL097wycOBqe9u4PL1Rx+31
 hSQL/rH9H0pz/beKovkwzhQNliE8A0y55GIn5R2+ILDKYzwrh+cLwGJ08qR63aZHiV26
 aOncUZzgjRX/J423FCGIFV+PW6WCmETT6kyF437txYVEsKqj9cUgDtbtBujNKKn3eVde
 oOp4kj3APWaKjc88u7RF4TEvYnpa3Kvyr9b4c2PBebVc5VmyUf+FthU7BEAyUzy0Ss2/
 TC6g==
X-Gm-Message-State: AOAM533Q8pmSIS6UFOZLFC3/L1k91S2JypMMny3Y3EWRcRXeq75uqvYk
 GASrg/WBDcVrj23KjKkJBnUYww==
X-Google-Smtp-Source: ABdhPJxjz1VQHeGz5qJjtBwagInjheC81ZafsvDxyuJZKE0+YhA+9dkbKxGYEYpXdgWYS7fBlyYq4w==
X-Received: by 2002:adf:fe0b:: with SMTP id n11mr31374500wrr.371.1635243759671; 
 Tue, 26 Oct 2021 03:22:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q123sm183504wma.20.2021.10.26.03.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:22:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DFBD71FF99;
 Tue, 26 Oct 2021 11:22:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 02/28] tests/docker: Simplify debian-all-test-cross
Date: Tue, 26 Oct 2021 11:22:08 +0100
Message-Id: <20211026102234.3961636-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The base debian10 image contains enough to build qemu;
we do not need to repeat that within the new image.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211014224435.2539547-3-richard.henderson@linaro.org>
---
 tests/docker/dockerfiles/debian-all-test-cross.docker | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
index dedcea58b4..b185b7c15a 100644
--- a/tests/docker/dockerfiles/debian-all-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
@@ -8,11 +8,6 @@
 #
 FROM qemu/debian10
 
-# What we need to build QEMU itself
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt build-dep -yy qemu
-
 # Add the foreign architecture we want and install dependencies
 RUN DEBIAN_FRONTEND=noninteractive eatmydata \
         apt install -y --no-install-recommends \
-- 
2.30.2


