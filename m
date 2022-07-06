Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FE25692E3
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 21:54:05 +0200 (CEST)
Received: from localhost ([::1]:55314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9B64-0006jn-98
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 15:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Aki-0003HC-DB; Wed, 06 Jul 2022 15:32:06 -0400
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30]:42529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Ake-00067t-Bh; Wed, 06 Jul 2022 15:31:57 -0400
Received: by mail-vk1-xa30.google.com with SMTP id r184so1085426vkg.9;
 Wed, 06 Jul 2022 12:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i/LMMGPQ7xLb10MBpUuhhIbs+RytHagc/2nRY+hrpBc=;
 b=maNxiGubTYfEXngTAHeyvLh2tW/acAkB5BQ7qlGCvgdMfLABKMSLCOFYr0pp8gudDR
 VlbKPipKAgvTPWEFAm6o288BPRJIWYcpuLPpczYxKqMaE2Fii9mQzxKi3xWuira65cQw
 V+lVZfLGhs02jhadFdn1+1sh42jNbaJnKQ4hbFNH6lCZgPjHdW+/SlGCFfu9yaXguK/d
 Ws0C2fFqhqp/oB2xE5e7qRTHvXU74DYOy1AlpzxthXsBgvzsNDaYI7uoJuOiOtpkG5OI
 80EA98fAvGaNK8k7H3lcP2ypCNphxrecsLkgMhlI8jAqyXMQoDlokDJF8EdaSifc7TFg
 AWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i/LMMGPQ7xLb10MBpUuhhIbs+RytHagc/2nRY+hrpBc=;
 b=5kOtHwFi+te25tVuybeM7HNd0ETHR3tdpNU12ODXzXGj08Jd059+Veuov1BgSMF9+M
 RgpofbvFillQxUpg4aqM/0vSC6DecKIJZ/sjkr4Hsk+61urE5+oog3iCksWObTYl5NCd
 RX1GS4OffZw0ncn0xOTihD7otw6MoO93CMSFsqse1Cvlcnnyf5qzXzAMPCI/VJYBuO5u
 fwDPi3Jlv8wA7gOOSHNLEUn8oxlYvCoD/d9o9KsdLzDpWjW8ib8sGHZVVzyUCLbt2Wpo
 +qePji0GoZzas2ydyzYPGLr0/fZyRXYAaff5XrhHGRU7Yq6QKl490SQXx2mkEZzVvAR+
 3kSQ==
X-Gm-Message-State: AJIora9qZimGqHstB9UBXnV0tDMHNaJL2eUPRqSOsdhvTaeCJEyTy0sB
 VbgHj6qVte10EDL3aejFRi4H6nmjceo=
X-Google-Smtp-Source: AGRyM1t6eV36gGl5hUN4b8b+7X/UmSAM+qhEJAit+sBP6OLggabRX2HUHf7swkIF+AhVma5aER4Gjg==
X-Received: by 2002:ac5:ccf2:0:b0:370:b800:bfc0 with SMTP id
 k18-20020ac5ccf2000000b00370b800bfc0mr18521286vkn.15.1657135914458; 
 Wed, 06 Jul 2022 12:31:54 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 p2-20020ab01ec2000000b003828ebf6b49sm6034791uak.4.2022.07.06.12.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 12:31:53 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 jianchunfu <jianchunfu@cmss.chinamobile.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 3/5] target/ppc: Add error reporting when opening file fails
Date: Wed,  6 Jul 2022 16:31:38 -0300
Message-Id: <20220706193140.468009-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706193140.468009-1-danielhb413@gmail.com>
References: <20220706193140.468009-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: jianchunfu <jianchunfu@cmss.chinamobile.com>

Add error reporting before return when opening file fails in
kvmppc_read_int_dt().

Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
[danielhb: use error_setg() instead of fprintf]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index bc17437097..7611e9ccf6 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1896,7 +1896,7 @@ static int kvmppc_find_cpu_dt(char *buf, int buf_len)
     return 0;
 }
 
-static uint64_t kvmppc_read_int_dt(const char *filename)
+static uint64_t kvmppc_read_int_dt(const char *filename, Error **errp)
 {
     union {
         uint32_t v32;
@@ -1907,6 +1907,7 @@ static uint64_t kvmppc_read_int_dt(const char *filename)
 
     f = fopen(filename, "rb");
     if (!f) {
+        error_setg(errp, "Error opening %s: %s", filename, strerror(errno));
         return 0;
     }
 
@@ -1940,7 +1941,7 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
     }
 
     tmp = g_strdup_printf("%s/%s", buf, propname);
-    val = kvmppc_read_int_dt(tmp);
+    val = kvmppc_read_int_dt(tmp, errp);
     g_free(tmp);
 
     return val;
-- 
2.36.1


