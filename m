Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7537347ACF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:34:12 +0100 (CET)
Received: from localhost ([::1]:48412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4aJ-00083r-Q9
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wm-0006KH-Hd
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:32 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wk-0007Kp-Mb
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:32 -0400
Received: by mail-wr1-x429.google.com with SMTP id j7so24687465wrd.1
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PaDgr+5ItkcZ/CJQx3dfdKXW7BWt6FoKuOekenfvtes=;
 b=ubQNhG8kVhkRLawbFS2Plko7ii6srVsy2TwMG4fHzSl69bEncBO0EtqgicFg6/4vSP
 YjnxQMW0Y7eUpabKd8YIJRfNj9ooqzbTY0CAKLvCJ3FdxvUMwrn6A9Vlx3cS3pSXo3PV
 IeFg/JbM3WwcJ4nsRv6iMZwxKdGw1lm55IoExS2gsmQm32hEr90m76waOxA5L+P5cgRy
 +TTs0XoHegJw0/t2wilef1zyC0XfM51zeE9nmzl6RgfKMUheMS/4aA7axIy0oQJQ2Rvk
 iDBzK+0TIg/XCksCzmrHAKVlgMmhYBIH+md967ywh6qVsnmKTzwhciizXmVTFrK2i/Fs
 kl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PaDgr+5ItkcZ/CJQx3dfdKXW7BWt6FoKuOekenfvtes=;
 b=BvDGT8bNXbj/SmydovYhOcxokSMbOdtEVIBvf5Xr2+l5lQV7Df0ktsUwmGqllfNqvA
 JitUpgaPvPiHsWJw0CIgG9+tWGlRldM9ZbxFFuC0YTt6NE3kMBu2epJx8JTrCwMGrLa/
 M/8IOexQoORA2mgGSHf8/clicQG2MKSq19lhrK/4SJF57sZzxf+tr/uwhZvIeXvcGJIz
 iOE85B8z+ybXzGpXTLxBJKwFFtJfkiK72LDTI2pvPq22VvjcMResBg5rNGOIsv+EmO8E
 K2BrRVW3m6hU/EEPomzTWOML9aT5ERMVRmXn9L0/n58/gAKUl6Rw249JglxrrkT94NUy
 vaxg==
X-Gm-Message-State: AOAM533RabbKXWDz5Z6x7FJ/ocAMXJUT3FqYGvgUmIYrVNSdAwFm7Klu
 pKb3iqXkwhOfXHlQnC2hAnUwuA==
X-Google-Smtp-Source: ABdhPJxBg0AwpKtSBhvioA1oQsnd6FwR7oZxpjJL2ZBBiGtoN8/Q0Tx7f/boawfJnsgd/YwpVg4Rbg==
X-Received: by 2002:a5d:4e43:: with SMTP id r3mr3730027wrt.280.1616596229376; 
 Wed, 24 Mar 2021 07:30:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s9sm3047150wmh.31.2021.03.24.07.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:30:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1229F1FF90;
 Wed, 24 Mar 2021 14:30:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 04/22] tools/virtiofsd: include --socket-group in help
Date: Wed, 24 Mar 2021 14:30:03 +0000
Message-Id: <20210324143021.8560-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I confused myself wandering if this had been merged by looking at the
help output. It seems fuse_opt doesn't automagically add to help
output so lets do it now.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Updates: f6698f2b03 ("tools/virtiofsd: add support for --socket-group")
Message-Id: <20210323165308.15244-5-alex.bennee@linaro.org>

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


