Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1C15692AB
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 21:37:40 +0200 (CEST)
Received: from localhost ([::1]:43276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9AqB-0005rw-7g
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 15:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Akl-0003Hx-2I; Wed, 06 Jul 2022 15:32:12 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:35400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Aki-00068K-H0; Wed, 06 Jul 2022 15:32:02 -0400
Received: by mail-ua1-x92d.google.com with SMTP id s3so3964283uaq.2;
 Wed, 06 Jul 2022 12:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=asn4YzwX5mBIX1qiRMLgANcS1JnrdHbUQq3YD07AP3I=;
 b=q4jqDVug9z/qMpFh7w5UpRCbFEpoYTUGTkJOcaff2PA3+DoVcsSbnmbnWA6TFK5Ra9
 eq+wNityOhZjbOdPnkqC6ZzSpmLypht8BSE+eQgEMZ/dmbZ8TGqdDJ4sTjCbLEmurBzy
 gF+Ko0y0BwQtatVuQR09mXWJUrSOT5CxsiFJPPJIeCMr7ubYiUdEooxLYmFFyEbGvxwQ
 lnQHZaryK2rzyGHkXXXjPJEdpMB7grvNjdagpWSDA4dzdZ4vUybFzT/n8X9zVoH2bjDh
 k5vwQ29kKiDg/Dx+8nS8UV/d1sHmUMVU2nqg+PGOz9cImu8yBcF1NuD2LC75d5HZsSfl
 xXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=asn4YzwX5mBIX1qiRMLgANcS1JnrdHbUQq3YD07AP3I=;
 b=oXC+ix/o/En0NTmwotGZ0ndpfJfTMDEk3oB8CFkPfuuDaauGuCu4uTGk3qSMpLXuEI
 AMWH5KkVq77k8JFNbkJ0TjgOqBRk6RjOvVbeoG9A0H2KzOWRr2Y4iuN7B8qba2/IyufG
 mqtYEfi+9gQ6qIrV6eAZomJhWB7755CPTic8PAP9LqlSCKB0pA4S5Q1iKM4s4NUsvDlk
 5NZKSx8wLpswgdjvJEQEzVvl6BjS46yfQkw/CoSA77Bc5xTnRpNvkQwKdqnfxi82DNL0
 AWGJ9U5IDUNWzG8v8oe8vkdN0Rq4UY9RQ5FG8vBwmZn+vA16wir8t3ahSUwcaUoAr2YS
 mnYQ==
X-Gm-Message-State: AJIora/ZyET2awECwkIXTJrn7dQR6SuZ2Lsk96qrxBvYmArhfDWg8yKz
 pAqZZokd/8ltPIFUDqlHxJVIFXEWkk8=
X-Google-Smtp-Source: AGRyM1unTgxBTM2gBCvkVxk6WznNvX80kaC4PTMBNxBW8i7ddPyjXbrIPQCFVIB7AzcoWedpI8VYgw==
X-Received: by 2002:ab0:298e:0:b0:382:982e:9ba8 with SMTP id
 u14-20020ab0298e000000b00382982e9ba8mr8576762uap.36.1657135917987; 
 Wed, 06 Jul 2022 12:31:57 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 p2-20020ab01ec2000000b003828ebf6b49sm6034791uak.4.2022.07.06.12.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 12:31:57 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 5/5] target/ppc: exit(1) on failure in
 kvmppc_get_clockfreq()
Date: Wed,  6 Jul 2022 16:31:40 -0300
Message-Id: <20220706193140.468009-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706193140.468009-1-danielhb413@gmail.com>
References: <20220706193140.468009-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92d.google.com
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

When running under KVM accel it is expected to have 'clock-frequency' in
the DT. Not having this attribute is too risky for both the machine
emulation and userspace.

We have a way of telling whether this error scenario might happen or not
via kvmppc_read_int_cpu_dt() now being able to report errors. From now
on, when running KVM, we will assume that 'clock-frequency' will always
be present in the DT.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index c218380eb7..d9febb2c63 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1945,9 +1945,24 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
     return kvmppc_read_int_dt(tmp, errp);
 }
 
+/*
+ * Read the clock-frequency from the DT. On error (e.g.
+ * 'clock-frequency' is not present in the DT) will
+ * report an error and exit(1).
+ */
 uint64_t kvmppc_get_clockfreq(void)
 {
-    return kvmppc_read_int_cpu_dt("clock-frequency", NULL);
+    Error *local_err = NULL;
+    int ret;
+
+    ret = kvmppc_read_int_cpu_dt("clock-frequency", &local_err);
+
+    if (local_err) {
+        error_report_err(local_err);
+        exit(1);
+    }
+
+    return ret;
 }
 
 static int kvmppc_get_dec_bits(void)
-- 
2.36.1


