Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEBB3799DC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 00:16:56 +0200 (CEST)
Received: from localhost ([::1]:41404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgECt-0006Ny-HG
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 18:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgEBW-0004L2-H3
 for qemu-devel@nongnu.org; Mon, 10 May 2021 18:15:30 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:34648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgEBU-00017h-VW
 for qemu-devel@nongnu.org; Mon, 10 May 2021 18:15:30 -0400
Received: by mail-oi1-x229.google.com with SMTP id l6so17258212oii.1
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 15:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QZYqQKuDETSDlfQMwi/K3kvQYbYQppdk7ceGQ960fsc=;
 b=Bcvjder7QqdVLEVUzjHPQRPtbZYmFbGHW2hvJXQHnD0NaiT1qb+EzAcbcgg1WEz2FJ
 5zDQVSoejZPHbLGg2kNsMwueVm22Ivb/oUYS5nl7prckG79zKCdDiYgLsz/sl3RCX1IF
 2BLtDlVTL+Hv/tEJm5BIKIg4vDWj9l5unZi8OsoHdlIV71Hz3sXSfWrxP6MGU6OkDEZD
 RBbJT95eXaOnCCjalZZXbIX5LvuEfDpub78Es1N4m8l0YqeJzyIGEW51oU4qVTdakkpx
 Oilxw9JWLjkkpOEBslAKsX+Hx/7tAeKTA/27rEc3q89K2SJ8k9zuoPdt/S1aUt7iDOiE
 P8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QZYqQKuDETSDlfQMwi/K3kvQYbYQppdk7ceGQ960fsc=;
 b=FDHlgPx1ZNIk5/qpkdOokXufMM5HIBPD1lc3TgusamlYOfEoBo5qYL/DY2svmssQaL
 58b43C7UgXBaLEFMuDG3Q9X8856a8aC3PVIokyuBgZnLIcyP4N0ygbcj4ioQqQsVoOux
 53DqtyhfS/2u2MMh8GorMJfu5TEjsHzfLWQ9NtpL3QLwRX9YVoU9bJh0CWiSvAbSGnQn
 EFXXMITa1DHqiB/0bKzTQK27tIrTmh4I6pdjC7/fJ6pz3iVF/6lpSGVhoH5kLYVEIALk
 UCQwxdxaKG/Xdi9rTHJpWHeAOD7ikcVahmxoOgw6Q1I+OXa3a2AmW2DLbe13zBw2zO6I
 6mlA==
X-Gm-Message-State: AOAM532SgmhWgLR7BlLYJ1nt4M6taqIx41BQf9OfArkTH4R8fjSOcItO
 9kAPJ8RsBsedeBS7CMQgXsBkUyUAU8Ihug==
X-Google-Smtp-Source: ABdhPJz1KnoaiAa8ZcxS20q6xKL9XhDrPc6tXXdYy5zx8mhi/WjWDrxnebGyzsNlsWMPSZlYBzknYQ==
X-Received: by 2002:a05:6808:313:: with SMTP id
 i19mr5934555oie.53.1620684927585; 
 Mon, 10 May 2021 15:15:27 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id p64sm2874405oib.57.2021.05.10.15.15.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 May 2021 15:15:27 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] bsd-user: Stop building the sparc platforms
Date: Mon, 10 May 2021 16:15:10 -0600
Message-Id: <20210510221511.14205-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210510221511.14205-1-imp@bsdimp.com>
References: <20210510221511.14205-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::229;
 envelope-from=imp@bsdimp.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The forked bsd-user tree doesn't really support these platforms.  They aren't
functional at the moment anyway. Remove them from the build so that the major
reorg patch series can focus on one platform (x86) before adding addition
platforms once things are shuffled. This should make it easier to review
and satisfy that all revisions of a patch series are buildable.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 default-configs/targets/sparc-bsd-user.mak   | 3 ---
 default-configs/targets/sparc64-bsd-user.mak | 4 ----
 2 files changed, 7 deletions(-)
 delete mode 100644 default-configs/targets/sparc-bsd-user.mak
 delete mode 100644 default-configs/targets/sparc64-bsd-user.mak

diff --git a/default-configs/targets/sparc-bsd-user.mak b/default-configs/targets/sparc-bsd-user.mak
deleted file mode 100644
index 9ba3d7b07f..0000000000
--- a/default-configs/targets/sparc-bsd-user.mak
+++ /dev/null
@@ -1,3 +0,0 @@
-TARGET_ARCH=sparc
-TARGET_ALIGNED_ONLY=y
-TARGET_WORDS_BIGENDIAN=y
diff --git a/default-configs/targets/sparc64-bsd-user.mak b/default-configs/targets/sparc64-bsd-user.mak
deleted file mode 100644
index 8dd3217800..0000000000
--- a/default-configs/targets/sparc64-bsd-user.mak
+++ /dev/null
@@ -1,4 +0,0 @@
-TARGET_ARCH=sparc64
-TARGET_BASE_ARCH=sparc
-TARGET_ALIGNED_ONLY=y
-TARGET_WORDS_BIGENDIAN=y
-- 
2.22.1


