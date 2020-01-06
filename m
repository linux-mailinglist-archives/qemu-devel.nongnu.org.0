Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9828131784
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 19:31:34 +0100 (CET)
Received: from localhost ([::1]:57735 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioXA5-0000pA-F1
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 13:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45325)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <danielhb413@gmail.com>) id 1ioX42-0001wc-Vo
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 13:25:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1ioX41-00044w-QQ
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 13:25:18 -0500
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:38115)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1ioX41-00044T-MG; Mon, 06 Jan 2020 13:25:17 -0500
Received: by mail-qk1-x742.google.com with SMTP id k6so40295908qki.5;
 Mon, 06 Jan 2020 10:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BIyO2R/e5VA+08g+h58CqbpLSi6LpjdAOK3scVDW2ro=;
 b=IxLtAmrPYJNVPDNfzTVeql5qlu94afy0FGMz/4NHeAI8s0HsNdythteFYv1RHMX/7u
 7P7pJqBh2NU48A6Wkpnxv6m/c9zkiNqus/asZembCTFVE8hbDUKs65Ww92pWcL6lkxvz
 xB69e7QKjTfWFw3jXSFHlhdO+ldo28ujYOCo+t0G1fHutArsYNeZZ8YABPncOwSLWIck
 YVnOcR7pCiwLMJN0u668fCZVWvHHttQ0FUv2NHRG7Vy3yN68a6409BHPyYbBJxa5xuAq
 L36dMdJ94SEZPMUV9NpZsZQoREYeWi/Ke3Xc8Y6SDs6sapalojsmJsSk8eOUO4svV4dR
 uJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BIyO2R/e5VA+08g+h58CqbpLSi6LpjdAOK3scVDW2ro=;
 b=YUiCNJf4A19LHG7MBeFaaHbgX+KBkGCPhdNElaTvoX+TllUWFA8hL11pQqO4W0rOMg
 Ufm+FrKkx2N4meq78ugxrffmsf5sujDEaVI/n16QXmroP7zhKL496sBPaI+Jg8TbZQYR
 6rWCF1Kz1gKKrO4E1RQvyVAYgCg+AXn2/UhoPXrbgeBPlvU8gqWFIu9s16qaJuQjRNDi
 DBpBiDWqzjvNBS7Xy+8Mv9Z90aUdhJMzEDsWeK+GcoYCin8mSe+HjeDlvw26/0BHpdVd
 GIuX6JOxhw6mPZzonP/bR/3emk4LtkmKdA7CdTrqA/2ipc01MDG7XM4UcO2IQhbUSP+p
 P9rA==
X-Gm-Message-State: APjAAAVCgsflyiwrDgwIkVmDcbpMGmbZJXVdSlU4AJfa85+/EJXvxN2X
 Ge34t8aoEW9HzSoUnsviX+cHpjqi
X-Google-Smtp-Source: APXvYqxH254lKZYuyTcHA2ZEi/wut8AKP6ECTaVz8jKgldIYPG/JO+PG1eBhuv5eAT4iDYHgzKuwEg==
X-Received: by 2002:a37:8e03:: with SMTP id q3mr82843572qkd.395.1578335117004; 
 Mon, 06 Jan 2020 10:25:17 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:655b:9e1c:e865:3705:e1df])
 by smtp.gmail.com with ESMTPSA id b81sm21026522qkc.135.2020.01.06.10.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 10:25:16 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 14/59] block/file-posix.c: remove unneeded labels
Date: Mon,  6 Jan 2020 15:23:40 -0300
Message-Id: <20200106182425.20312-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106182425.20312-1-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
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
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'out' label from cdrom_probe_device() can be removed, and its
only instance replaced by 'return prio'.

In raw_co_create(), 'out' can be replaced by 'return -errno' in
the error condition it is being called.

CC: Kevin Wolf <kwolf@redhat.com>
CC: qemu-block@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 block/file-posix.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 1b805bd938..b1a6549806 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2265,9 +2265,8 @@ raw_co_create(BlockdevCreateOptions *options, Error **errp)
     /* Create file */
     fd = qemu_open(file_opts->filename, O_RDWR | O_CREAT | O_BINARY, 0644);
     if (fd < 0) {
-        result = -errno;
-        error_setg_errno(errp, -result, "Could not create file");
-        goto out;
+        error_setg_errno(errp, errno, "Could not create file");
+        return -errno;
     }
 
     /* Take permissions: We want to discard everything, so we need
@@ -2342,7 +2341,7 @@ out_close:
         result = -errno;
         error_setg_errno(errp, -result, "Could not close the new file");
     }
-out:
+
     return result;
 }
 
@@ -3554,7 +3553,7 @@ static int cdrom_probe_device(const char *filename)
 
     fd = qemu_open(filename, O_RDONLY | O_NONBLOCK);
     if (fd < 0) {
-        goto out;
+        return prio;
     }
     ret = fstat(fd, &st);
     if (ret == -1 || !S_ISBLK(st.st_mode)) {
@@ -3568,7 +3567,6 @@ static int cdrom_probe_device(const char *filename)
 
 outc:
     qemu_close(fd);
-out:
     return prio;
 }
 
-- 
2.24.1


