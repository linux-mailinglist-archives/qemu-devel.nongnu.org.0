Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFA449F05D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 02:11:33 +0100 (CET)
Received: from localhost ([::1]:45850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDFnY-00017E-BD
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 20:11:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZO-0003ZI-F2
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:54 -0500
Received: from [2607:f8b0:4864:20::831] (port=38498
 helo=mail-qt1-x831.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZK-0005NN-B6
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:52 -0500
Received: by mail-qt1-x831.google.com with SMTP id r14so3998356qtt.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 16:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xmOvoFCjIWo0pLPcOUKEXptLOi1TcZspWIJ3n2XMMJ8=;
 b=NCQ1Ma/S3tOlnPQHEdy5oK0f1aSjXlk8LtZWow5Y6Z9pNEmwVYhf5vrbd65y5/2CfM
 U5r7faXy02+E6jNi8RQyMBNJCadJRv9Repw0hOOUW3QUqMTXaXgU1tAzv62D2FMeQ2sM
 PPv+Ru8kvyG6YztI+Y01M54IfjSgyZpFMZ3FOdVOeDvFYNlkdS8FSLeeENwgt3DKvkp/
 pSez3qZEhaVFENmHxpwmwQ8reSH09hIqcZi7uHloCaShHWsOrk8O1Ty7nK/D3cyTJKDK
 WVDfXD5tXV08r8Vyt/ywkV8oskYN+Zj4wu0hGv6QEe13JDtNBfr7EmBLEM8aocDgqaPn
 OE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xmOvoFCjIWo0pLPcOUKEXptLOi1TcZspWIJ3n2XMMJ8=;
 b=2ynibPPYF63TuQZxvmass17u13hALpF/8kkK2PZVREMWCiN8Jnpch/YqC6bZ/yO4Ox
 oRVhTIe7UuLKAS5uCQ8HMsu2/lfNIkbXaDRjoql+Li62/Sz4hrh8eBnopdGGfmqIP/p5
 TivNnalMm+uMEUZy63cUDDFr8lfdt95elHJ0tkaNrjYUhFnkhWugcA9K+Pc4GzHlRErv
 ymoVgYmnU1Lts/MBdLzN1HTMRF204YVK8cANOcNQIR0rwsoyXgc4pcfjjGBVnWzVt7OM
 +/nCdghy4j6hjgJPPHHhDbahFDoc3it0OKVXLgkfI6C+e1JoHAAHV711JFd4qyoa5nyB
 670A==
X-Gm-Message-State: AOAM531cu8WkvIMWZUdsY8oXKCMR5IAngfT65ZShVhNwNwwbARcni6R9
 4qQTnpuy09Rhy4y0mDx6fb5vKI3vl0KCIg==
X-Google-Smtp-Source: ABdhPJyNJmlabqCBfl3Ai/uwcTPm82s/eFZvVaUEOGB67B0Xr4BWomYgRzRS5vxgUhR5CHyMxJfpjg==
X-Received: by 2002:a05:622a:34d:: with SMTP id
 r13mr4609832qtw.599.1643331385408; 
 Thu, 27 Jan 2022 16:56:25 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id d8sm2182003qtd.70.2022.01.27.16.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 16:56:24 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/11] 9p: Rename 9p-util -> 9p-util-linux
Date: Thu, 27 Jan 2022 19:56:02 -0500
Message-Id: <20220128005611.87185-3-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128005611.87185-1-wwcohen@gmail.com>
References: <20220128005611.87185-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::831
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

The current file only has the Linux versions of these functions.
Rename the file accordingly and update the Makefile to only build
it on Linux. A Darwin version of these will follow later in the
series.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/{9p-util.c => 9p-util-linux.c} | 2 +-
 hw/9pfs/meson.build                    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (97%)

diff --git a/hw/9pfs/9p-util.c b/hw/9pfs/9p-util-linux.c
similarity index 97%
rename from hw/9pfs/9p-util.c
rename to hw/9pfs/9p-util-linux.c
index 3221d9b498..398614a5d0 100644
--- a/hw/9pfs/9p-util.c
+++ b/hw/9pfs/9p-util-linux.c
@@ -1,5 +1,5 @@
 /*
- * 9p utilities
+ * 9p utilities (Linux Implementation)
  *
  * Copyright IBM, Corp. 2017
  *
diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index 99be5d9119..1b28e70040 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -4,7 +4,6 @@ fs_ss.add(files(
   '9p-posix-acl.c',
   '9p-proxy.c',
   '9p-synth.c',
-  '9p-util.c',
   '9p-xattr-user.c',
   '9p-xattr.c',
   '9p.c',
@@ -14,6 +13,7 @@ fs_ss.add(files(
   'coth.c',
   'coxattr.c',
 ))
+fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-util-linux.c'))
 fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
 softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
 
-- 
2.34.1


