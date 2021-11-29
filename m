Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C63D461CAE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:25:31 +0100 (CET)
Received: from localhost ([::1]:37238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrkPC-0007Wb-FM
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:25:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrkF8-0002Zp-As
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:15:06 -0500
Received: from [2a00:1450:4864:20::434] (port=44023
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrkF6-0001Wc-DE
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:15:05 -0500
Received: by mail-wr1-x434.google.com with SMTP id v11so38396409wrw.10
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 09:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VCqwrqjK7M0/foGUZbbwM5cH+2eIgsOnJoMiwsacNqQ=;
 b=MCI11MsAnbs4sSfQo6z4nRGhuNOJc3K4rITDIPSHDnzEypM8qPofA4obr62DJwsvcn
 r0fUpCBKu2eoykBYWHhJknJsunxfR1/iNKIFYQcBz3MMaQ4lBtcNNcShalY48LfI5Xtc
 Fdf72fezdGo13tm98uGZY29cg5C5JtUVDHwPefla1NMjY29ORd1wL6zfyE/zp1OWJG+a
 dWpWXYn3tKytW3D/T/mUvpzXgy+E6ZPKxTVK9L6JHiSOKKH6s3zDLnlWo5dbVikuefb9
 H4kus2PGr8FsuUN3ckZg/SncA1rOLXh9UxPxhTF+AoHh9bRyPzA9VXaf2+HR+q53bWKy
 p1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VCqwrqjK7M0/foGUZbbwM5cH+2eIgsOnJoMiwsacNqQ=;
 b=T3jVt3jFounG/VngVzmxfesLURe/AtDUorRE7jg8bm8kEJeuXkdEZLSy6ChCHVvvvv
 X+B5vU92vmayMb2b0x+qmOOAdoHFAMsMNxZFrFb70OTWubZISGxOe78ICGE++RA9oinA
 BxxyQlxJ6iNUjXE5Pp4M0AUNq6dBVUKqJdAS2Cm4Mybs5RrNI+fyFLiyqskLKXjXTmOh
 xeG8HVRM/9rb09YMTadA7J8EUmak0pDsrgTKye+UIA/9CLlaobmmKsSHr5dGCLF3KFa6
 8rV+Zgc9puyUmfy7Gp8hByzEqu7aHmqryGSPaSwv/sYofQLORGIM7E5PjQPK7+SZ3T6U
 v5nQ==
X-Gm-Message-State: AOAM53380doUkEGOOP/Wf42e1iFlzvan9bB9b/DrkjFUWNFNYyZvhDqe
 vaksRGMJ3CIDoyKmS5FbOKb7B/mtANYRNg==
X-Google-Smtp-Source: ABdhPJxdnY6dtaFyBsRYQguxzQRBJp9q5Kch1M9qg0FCA7ugdDxtTdr/mtzuSBHchzpQ64dtXIB9EA==
X-Received: by 2002:adf:8165:: with SMTP id 92mr37728935wrm.199.1638206103168; 
 Mon, 29 Nov 2021 09:15:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f13sm18220065wmq.29.2021.11.29.09.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 09:14:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6F30C1FF9F;
 Mon, 29 Nov 2021 17:14:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	peter.maydell@linaro.org
Subject: [PULL 8/8] tests/plugin/syscall.c: fix compiler warnings
Date: Mon, 29 Nov 2021 17:14:49 +0000
Message-Id: <20211129171449.4176301-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211129171449.4176301-1-alex.bennee@linaro.org>
References: <20211129171449.4176301-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Juro Bystricky <juro.bystricky@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juro Bystricky <juro.bystricky@intel.com>

Fix compiler warnings. The warnings can result in a broken build.
This patch fixes warnings such as:

In file included from /usr/include/glib-2.0/glib.h:111,
                 from ../tests/plugin/syscall.c:13:
../tests/plugin/syscall.c: In function ‘print_entry’:
/usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘out’ may be
       used uninitialized in this function [-Werror=maybe-uninitialized]
   g_free (*pp);
   ^~~~~~~~~~~~
../tests/plugin/syscall.c:82:23: note: ‘out’ was declared here
     g_autofree gchar *out;
                       ^~~
In file included from /usr/include/glib-2.0/glib.h:111,
                 from ../tests/plugin/syscall.c:13:
../tests/plugin/syscall.c: In function ‘vcpu_syscall_ret’:
/usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘out’ may be
        used uninitialized in this function [-Werror=maybe-uninitialized]
   g_free (*pp);
   ^~~~~~~~~~~~
../tests/plugin/syscall.c:73:27: note: ‘out’ was declared here
         g_autofree gchar *out;
                           ^~~
cc1: all warnings being treated as errors

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211128011551.2115468-1-juro.bystricky@intel.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211129140932.4115115-9-alex.bennee@linaro.org>

diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
index 484b48de49..96040c578f 100644
--- a/tests/plugin/syscall.c
+++ b/tests/plugin/syscall.c
@@ -70,19 +70,17 @@ static void vcpu_syscall_ret(qemu_plugin_id_t id, unsigned int vcpu_idx,
         }
         g_mutex_unlock(&lock);
     } else {
-        g_autofree gchar *out;
-        out = g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi64 "\n",
-                num, ret);
+        g_autofree gchar *out = g_strdup_printf(
+             "syscall #%" PRIi64 " returned -> %" PRIi64 "\n", num, ret);
         qemu_plugin_outs(out);
     }
 }
 
 static void print_entry(gpointer val, gpointer user_data)
 {
-    g_autofree gchar *out;
     SyscallStats *entry = (SyscallStats *) val;
     int64_t syscall_num = entry->num;
-    out = g_strdup_printf(
+    g_autofree gchar *out = g_strdup_printf(
         "%-13" PRIi64 "%-6" PRIi64 " %" PRIi64 "\n",
         syscall_num, entry->calls, entry->errors);
     qemu_plugin_outs(out);
-- 
2.30.2


