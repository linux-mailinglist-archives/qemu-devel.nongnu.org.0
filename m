Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04BB3402DD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:11:19 +0100 (CET)
Received: from localhost ([::1]:52206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpcc-0004tT-Qs
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMpaq-0004OU-HF
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:09:28 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:38748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMpam-00015k-1F
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:09:28 -0400
Received: by mail-ed1-x52b.google.com with SMTP id h13so5891646eds.5
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 03:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s2uszBdp11PrlvtUl1YErxnqMINsPyjPYNNsEMGiVN0=;
 b=XrHlzpQgO5DifXqsHNY4QcirevhHKCluIkYx9tJXdJlkKjPlgvDRoDWFtGzlt/j5k0
 cK1oBzGOQoworU1zuPCbiCAY5ykIp70/uNoBfubftpfuSFojgsNn8gAAMg8NM3ySL4S5
 dTtRQ13x95V1+aLxnH49R/K9XA1cr8VzbWPFGkGK37y5pcm7zIb/zhajxL7dbMXMjHUY
 vnWdHUjKcNdYFINB/0/G+6ZEQrFOqBsaf/RIYCOIAXPBNOsrey4MJRfQq1hQ9L55q2d+
 H72Gab72eXNiDlm2qrgzKbk9FA8kQWXrZKvfdjUcMAeA2mNp29/VO3LdwRJWDIUY3Ggp
 Ei1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s2uszBdp11PrlvtUl1YErxnqMINsPyjPYNNsEMGiVN0=;
 b=iGpW8T3NwvNrhgo3b2xsxO9Y1OAW4O0Q0xJXZ6o+rsRfnk/k1Leb6iuBTQywAeG9BE
 tBPPs6rL6onTWg3u0yixUuWbggWrgbMdCpBN0otCv1mp/0C7+Lpwfd8YsDHdckZdgGGC
 TP+I0AyemDEC0RVO67OxLA2SDPWtW8dpuDUvIN1Ph1q242C8ugl2Ryi7rnXNHpx3pD37
 uuuL7K2/0MuZmaBil3CA9qw09csjz5U3FcQh2rEDe8IM3+7UXG29wnpc9Pv6umAu+OD1
 mkTQZRquI2m5Lb5+45ibb0/12x0UhPEgkXyKUvuTNqcPkFCCpaj/7t93Y0A1pnKvwFgd
 ZiBg==
X-Gm-Message-State: AOAM5326prLD95NesmFpk1HQNiH3kKGxO+wzqTl4OZX0hJgIk8qFII+8
 U7vCJiEgNtYX8v7jbqasv2JEOA==
X-Google-Smtp-Source: ABdhPJwhqZSN+jdTMs/Im2VSD62UB4uVnlBpm7T2ryLhlynbjwHpxIYI7/kJzSydSXMHBgRRaTJPLw==
X-Received: by 2002:a05:6402:408:: with SMTP id
 q8mr2561212edv.201.1616062162047; 
 Thu, 18 Mar 2021 03:09:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f19sm1597304edu.12.2021.03.18.03.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 03:09:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 70E721FF7E;
 Thu, 18 Mar 2021 10:09:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tools/virtiofsd: include --socket-group in help
Date: Thu, 18 Mar 2021 10:09:11 +0000
Message-Id: <20210318100911.16261-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I confused myself wandering if this had been merged by looking at the
help output. It seems fuse_opt doesn't automagically add to help
output so lets do it now.

Updates: f6698f2b03 ("tools/virtiofsd: add support for --socket-group")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tools/virtiofsd/fuse_lowlevel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 1aa26c6333..58e32fc963 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2450,6 +2450,7 @@ void fuse_lowlevel_help(void)
     printf(
         "    -o allow_root              allow access by root\n"
         "    --socket-path=PATH         path for the vhost-user socket\n"
+        "    --socket-group=GRNAME      name of group for the vhost-user socket\n"
         "    --fd=FDNUM                 fd number of vhost-user socket\n"
         "    --thread-pool-size=NUM     thread pool size limit (default %d)\n",
         THREAD_POOL_SIZE);
-- 
2.20.1


