Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F75358EAD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 22:46:31 +0200 (CEST)
Received: from localhost ([::1]:60748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUbXq-0002kc-AM
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 16:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lUbSv-0000F3-Ga; Thu, 08 Apr 2021 16:41:25 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:39706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lUbSt-0008KF-Ss; Thu, 08 Apr 2021 16:41:25 -0400
Received: by mail-qk1-x72d.google.com with SMTP id q26so3698800qkm.6;
 Thu, 08 Apr 2021 13:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hc20wtf5uf4KNJbPsDj3PYHBINas25exqNtVOcohAEo=;
 b=duvOegbsZMukkNua8qmFE6RZEvkSrzsq2kqt7T1ejS2dghnGCaz64kKD1bvijLV4KN
 1AZAug/D2Ui0pD9Q2qXjk7e33HiFBoW+/tFCn/G3/yRGE4rIJ9y7vjHx4l7GktlivMMj
 xPV1z7Ye/3GrXFC7TDOD3kJu7EeJrlcmPjW1BhAWKs7n9k6ePdTlHijRU73TMPJoxJe8
 d330Nsexs4vJKHjGiwNLzB1CedfgKNgOMlSTDAbdIDQX4OpDqagRhwqBCpnWv3Gfvs/4
 KMOc2bTNJuKKZ4+/RWrZBnX4z2O3Lv4e2CgvDNDAETdsJ5gumasYZUjXQYNcMw5IPVYW
 vpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hc20wtf5uf4KNJbPsDj3PYHBINas25exqNtVOcohAEo=;
 b=rTCIyOvY6eTPrqlTBzIYvWWGGxQEII9yLCcu9E7LJZ8lQcvC4zVN8lPIP5F9FURk/Q
 6ymLraWH1vwHzS7CJfOHmPI2JMvJRlJD8zE8i/QqfkLP4Ph5jE0kTroA86YPeogLxNyf
 lWVShr48snG50Uzb/6nk6ub+5tRzcuG05U0h1rPBASlvxjUAyqzBLbBGe/pHhSTAEw8S
 FT/nxY/zqoLwlQKtxWVSLyOI0Cl1/1D2KZIF6kpTf0HCCcZIquJnHXRhzR4BuYcX9xAf
 xdbLy6ouIqRyf/L3dW7yKuv3NcF9boBZatU2qXfko7S3Obc6gVIiVhKYE/7EhqubjWNp
 pQsQ==
X-Gm-Message-State: AOAM532okA4L7aFCyiKcrdxIy71t4CZpzF+oNg5i5v+TbvhbCrkaWPa3
 YjiOK4Le5FiWN7N0grmlj1YjAIN1LZetxA==
X-Google-Smtp-Source: ABdhPJzIP4zUB8bR+YIi0jKURK3RkFvPKWDhWflv/nwWNFHKrgdnaOMszpeQCOlGOzux9XpjDEuEMA==
X-Received: by 2002:a05:620a:220e:: with SMTP id
 m14mr10802459qkh.303.1617914482453; 
 Thu, 08 Apr 2021 13:41:22 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:92e9:c7f0:1492:45b3:f90e])
 by smtp.gmail.com with ESMTPSA id a207sm327104qkc.135.2021.04.08.13.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 13:41:22 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] spapr.h: increase FDT_MAX_SIZE
Date: Thu,  8 Apr 2021 17:40:49 -0300
Message-Id: <20210408204049.221802-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408204049.221802-1-danielhb413@gmail.com>
References: <20210408204049.221802-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Certain SMP topologies stress, e.g. 1 thread/core, 2048 cores and
1 socket, stress the current maximum size of the pSeries FDT:

Calling ibm,client-architecture-support...qemu-system-ppc64: error
creating device tree: (fdt_setprop(fdt, offset,
"ibm,processor-segment-sizes", segs, sizeof(segs))): FDT_ERR_NOSPACE

2048 is the default NR_CPUS value for the pSeries kernel. It's expected
that users will want QEMU to be able to handle this kind of
configuration.

Bumping FDT_MAX_SIZE to 2MB is enough for these setups to be created.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/hw/ppc/spapr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index bf7cab7a2c..3deb382678 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -95,7 +95,7 @@ typedef enum {
 #define SPAPR_CAP_FIXED_CCD             0x03
 #define SPAPR_CAP_FIXED_NA              0x10 /* Lets leave a bit of a gap... */
 
-#define FDT_MAX_SIZE                    0x100000
+#define FDT_MAX_SIZE                    0x200000
 
 /*
  * NUMA related macros. MAX_DISTANCE_REF_POINTS was taken
-- 
2.30.2


