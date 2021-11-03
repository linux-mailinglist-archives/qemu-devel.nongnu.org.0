Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68438444ABE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 23:12:11 +0100 (CET)
Received: from localhost ([::1]:47518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miOUM-00035N-Ii
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 18:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xgaDYQgKCvEpnaThmlaZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--wuhaotsh.bounces.google.com>)
 id 1miOKX-0003Ic-2y
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 18:02:01 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:38861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xgaDYQgKCvEpnaThmlaZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--wuhaotsh.bounces.google.com>)
 id 1miOKH-0002aO-7N
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 18:01:59 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 j3-20020a628003000000b004811bc66186so2142469pfd.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 15:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=4NP9rIxBTEklu2hTKeeix8BSJczBevQhyLOZN1vXyl4=;
 b=HjzD7ZSHFMQUj0fc+ANHMaObSi8ycW3y9crT6lTITfS0G03l18t76hGPqBQEVEg2V7
 dYDRjQAX/M1oeqvdfnusP5sji/vSG5hP4C3IGSaR3HeZhLNNsbZIw2at1pn+6cv4e7AT
 rbR6oGPxmKBPYQLwVEc8cgpryB6G3ScWqnZJB9PwR1U0bRbhgTxALqPTj0bC6Ae5m6fQ
 I/x2dLEHKx2aWtBi/sBevE2Awvzcmnj3qOdUaSISLKQGF79za34DtQqynwoHJ9xRZOPD
 +9+dqDy4WYh8t/sNNSoRX5T6Zy+mWYvq7df6nBtabvuVUIy0Vm/he1jnqhtRgy7QZpSx
 aWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=4NP9rIxBTEklu2hTKeeix8BSJczBevQhyLOZN1vXyl4=;
 b=hSr/fsiEA0ewd9XSs3k4QsPuHp1QM6JP9eLbuwAg/5czyQEGBEME08Yfutja23a1ik
 EAFwznxjsUFX9akD8rdyCmTUGHY/AV+SZLhAjBmPVLgNsgopqmCRAyxG7eL8e/S46aVp
 kXctNyIStxyMDzUlDEcnvI8/JbP3SAnnDmmyyrxN/zkbKDUxvdPxPneJgxQSQbIFzYlx
 e/GVSuFLB9Gu0DWbgPYimliOYG4umNyIxyQHXHJ7/Az0iSTPBwRNlncLTtL9eeqeLmAt
 RLIjQqyFehiPTzS+reacHprorgp1VzxzkvRZvus3NsE15fOd0deb+y+SfrVlfhDzMkHH
 Pa5Q==
X-Gm-Message-State: AOAM532RkBlTdzlNzm3/Wjg+8e3LBVC5UNagD5WALUoF7+y5BWI5TDZm
 cHZUdmBn3UgdLxW+hmFWltpD2TlNkPxONQ==
X-Google-Smtp-Source: ABdhPJwqBHdGtRi3Y9Dd/GdNyEO7XSkgK4KfF5lQDya3EI/iar3+F1fTbCX7y1xytB7rxyGsrbdev3iWsn2YVQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:9295:: with SMTP id
 n21mr17523809pjo.229.1635976902489; Wed, 03 Nov 2021 15:01:42 -0700 (PDT)
Date: Wed,  3 Nov 2021 15:01:31 -0700
In-Reply-To: <20211103220133.1422879-1-wuhaotsh@google.com>
Message-Id: <20211103220133.1422879-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211103220133.1422879-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v4 5/7] blockdev: Add a new IF type IF_OTHER
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3xgaDYQgKCvEpnaThmlaZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This type is used to represent block devs that are not suitable to
be represented by other existing types.

Signed-of-by: Hao Wu <wuhaotsh@google.com>
---
 blockdev.c                | 3 ++-
 include/sysemu/blockdev.h | 1 +
 meson                     | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index b35072644e..c26cbcc422 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -80,6 +80,7 @@ static const char *const if_name[IF_COUNT] = {
     [IF_MTD] = "mtd",
     [IF_SD] = "sd",
     [IF_VIRTIO] = "virtio",
+    [IF_OTHER] = "other",
     [IF_XEN] = "xen",
 };
 
@@ -739,7 +740,7 @@ QemuOptsList qemu_legacy_drive_opts = {
         },{
             .name = "if",
             .type = QEMU_OPT_STRING,
-            .help = "interface (ide, scsi, sd, mtd, floppy, pflash, virtio)",
+            .help = "interface (ide, scsi, sd, mtd, floppy, pflash, virtio, other)",
         },{
             .name = "file",
             .type = QEMU_OPT_STRING,
diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index 32c2d6023c..bce6aab573 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -24,6 +24,7 @@ typedef enum {
      */
     IF_NONE = 0,
     IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF_XEN,
+    IF_OTHER,
     IF_COUNT
 } BlockInterfaceType;
 
diff --git a/meson b/meson
index b25d94e7c7..776acd2a80 160000
--- a/meson
+++ b/meson
@@ -1 +1 @@
-Subproject commit b25d94e7c77fda05a7fdfe8afe562cf9760d69da
+Subproject commit 776acd2a805c9b42b4f0375150977df42130317f
-- 
2.33.1.1089.g2158813163f-goog


