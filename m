Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A305692AA
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 21:37:35 +0200 (CEST)
Received: from localhost ([::1]:43114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Aq6-0005kL-50
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 15:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Ake-0003El-9b; Wed, 06 Jul 2022 15:31:57 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35]:39881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Akb-00067V-Kp; Wed, 06 Jul 2022 15:31:55 -0400
Received: by mail-vk1-xa35.google.com with SMTP id q194so671906vkb.6;
 Wed, 06 Jul 2022 12:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zv+C2hnaWWyTyoVtR4hGQ7SdZfWBqLliCJNNJg9zX4Q=;
 b=l49r7UeBaDAv/4zgVLckueLuHdCWliD8YmHFf1gxFKZTlsgLJBKscHioPiE8P4TiTv
 Zmxp29ZMdQZdWGWlDbPWC41oZ5o9jPMxmbDvfFkb2cpkw7+XAFaLtbB/mnPhFZ0pyneS
 tDlCHf0HTJZpEI6KgjImY0XkLoNwnKeH11WQ/oOk30tJroe0JXGFE33l3nqkwlCqnJpp
 UFqYJ9Uenji1wBcrO3adzqdqtMtaAfr7B5GwdcOtANsm3ttXA9Nu6wSqQ29X5CoQQFJ/
 SW1rNCZPIPREDG+cHhkDkJSbGOFw9J4yeY4+UipjeHwjf11VOSr40cDRlrrAu4oBy1bG
 yBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zv+C2hnaWWyTyoVtR4hGQ7SdZfWBqLliCJNNJg9zX4Q=;
 b=k9pCuFRNIY/ZxyPALrmiX5IHUoRsygmUHytiDQnq8Ja0H/+cs1yFcdnWjAso7LcEI0
 8e7pXVW2iZE4BZ0OkD5PGYe43O3CAT/X050AVSJKjTcEDbDYXrFqsS8wN4h1xCgdIkNJ
 zZkQBin8xCyWwH2GFHSAFhTpgEgXhM9xuHjZTaAZaK14fXLlyK6Q3yQJKLzs4d2H8kOg
 jGS2B4wFMFvhNHAFNKnGdW4iWLv+bkxZ17DMyxtxxk1k5feM4gFcvyq7VT5nL2povov8
 bJuqeusE99SDmwkMqLtvUllhtjCNufJWhG8hyRFiKvI6rOoLevevmjuJFJdsmiQs+TBO
 IrNA==
X-Gm-Message-State: AJIora84mootbIlpogvey+Vdeh6KzWMJ+jPmMyoXkuAgxGSh3NDJOz/i
 PiDwSJCXzJtbYx92Utle+mr4zATf+wg=
X-Google-Smtp-Source: AGRyM1tK7bWVmdRQ0QD49l8sday4hVd5Wvi7DSvbp7dyhUcz9sUd+nUZFxxQlasZAZyNs5frSYupRw==
X-Received: by 2002:a1f:9e53:0:b0:370:3d3c:4ca7 with SMTP id
 h80-20020a1f9e53000000b003703d3c4ca7mr24227635vke.40.1657135912084; 
 Wed, 06 Jul 2022 12:31:52 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 p2-20020ab01ec2000000b003828ebf6b49sm6034791uak.4.2022.07.06.12.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 12:31:51 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 2/5] target/ppc: add errp to kvmppc_read_int_cpu_dt()
Date: Wed,  6 Jul 2022 16:31:37 -0300
Message-Id: <20220706193140.468009-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706193140.468009-1-danielhb413@gmail.com>
References: <20220706193140.468009-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa35.google.com
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

The function can't just return 0 whether an error happened and call it a
day. We must provide a way of letting callers know if the zero return is
legitimate or due to an error.

Add an Error pointer to kvmppc_read_int_cpu_dt() that will be filled
with an appropriate error, if one occurs. Callers are then free to pass
an Error pointer and handle it.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 109823136d..bc17437097 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1925,15 +1925,17 @@ static uint64_t kvmppc_read_int_dt(const char *filename)
 
 /*
  * Read a CPU node property from the host device tree that's a single
- * integer (32-bit or 64-bit).  Returns 0 if anything goes wrong
- * (can't find or open the property, or doesn't understand the format)
+ * integer (32-bit or 64-bit).  Returns 0 and set errp if anything goes
+ * wrong (can't find or open the property, or doesn't understand the
+ * format)
  */
-static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
+static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
 {
     char buf[PATH_MAX], *tmp;
     uint64_t val;
 
     if (kvmppc_find_cpu_dt(buf, sizeof(buf))) {
+        error_setg(errp, "Failed to read CPU property %s", propname);
         return 0;
     }
 
@@ -1946,12 +1948,12 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
 
 uint64_t kvmppc_get_clockfreq(void)
 {
-    return kvmppc_read_int_cpu_dt("clock-frequency");
+    return kvmppc_read_int_cpu_dt("clock-frequency", NULL);
 }
 
 static int kvmppc_get_dec_bits(void)
 {
-    int nr_bits = kvmppc_read_int_cpu_dt("ibm,dec-bits");
+    int nr_bits = kvmppc_read_int_cpu_dt("ibm,dec-bits", NULL);
 
     if (nr_bits > 0) {
         return nr_bits;
@@ -2336,8 +2338,8 @@ static void alter_insns(uint64_t *word, uint64_t flags, bool on)
 static void kvmppc_host_cpu_class_init(ObjectClass *oc, void *data)
 {
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-    uint32_t dcache_size = kvmppc_read_int_cpu_dt("d-cache-size");
-    uint32_t icache_size = kvmppc_read_int_cpu_dt("i-cache-size");
+    uint32_t dcache_size = kvmppc_read_int_cpu_dt("d-cache-size", NULL);
+    uint32_t icache_size = kvmppc_read_int_cpu_dt("i-cache-size", NULL);
 
     /* Now fix up the class with information we can query from the host */
     pcc->pvr = mfpvr();
-- 
2.36.1


