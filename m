Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F18545B792
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:37:02 +0100 (CET)
Received: from localhost ([::1]:57792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpoi5-0006Uh-7L
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:37:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpobP-0000Ln-Qo; Wed, 24 Nov 2021 04:30:07 -0500
Received: from [2607:f8b0:4864:20::92b] (port=36577
 helo=mail-ua1-x92b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpobL-0006iR-VU; Wed, 24 Nov 2021 04:30:07 -0500
Received: by mail-ua1-x92b.google.com with SMTP id r15so3748910uao.3;
 Wed, 24 Nov 2021 01:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tyOS5VYIUzJzztHcjBVO69KRh6HJ5QWNfDlDrDvrshA=;
 b=PJf61K+w2M3e3C+s5Ng654/qqCIaC7y5IxFCcYMBwJtWQNUeSVr0UT3IhHE6miZ+zL
 /21JxsM4m+KXbZjTLdnRzjoVUQIwFDExH12ZYD7Phr4ssJ6bZ+YBb+U3WcIFvzCToLAn
 XC0i2LoEpma/UcuxVjieJSaZ55MOA7NQX0z2TDZN4ZmB8Ni1pLd4YRJ5Hro0sj0SSY3X
 LYb8uYmzPQP+XF107ZE/vJOC2P7tf0Kpam+vgPIyiyvRlF4cIgSfWONjFq8l2dwOwuQ1
 hp2avV7ECTmFxiuqR2eyXNE5C/R/pqjx1DlalaKZpOyp38m0lDTiMfN+FnCpb76TOl6c
 rjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tyOS5VYIUzJzztHcjBVO69KRh6HJ5QWNfDlDrDvrshA=;
 b=z8PCSOoix1fXdywPY/ZNxdZ7GJCB3DxZ6bGclRL1D1WlSRQTJERe4Wm1YPKu0gPvP2
 6zNQeik8oJjbLDNL2xIpgOBUfZ4PN6zg5JVWCwkw41Awdmwz+FDyCPOyjlqGNZWGE/xB
 imrXMvOyCf+AW4Rpo2YR134N/DdLLmKp50hg2o/hNIxdn8eEFAflWf3tw2Z4knibNWFf
 tgsez0X02KjQB/RZ3e+2jMDsyqnPzCh/YdxI207ZpK5EWay1uIbxX3Et8i/4ERtFKgW7
 54XqEH4wNPky8Q3zYshZDw82DGjfpMpMbLg6jmIhVjNMSRpqG14xY4GuFCZbCKqOIQSa
 8bcg==
X-Gm-Message-State: AOAM533eB5n8SLRZLiWkH2gq31Jul0osCtQf2xbOpoJlD/J4E3YY3bkX
 phjhdAJ+EUrAY/toCaQrOY81x4db7W8=
X-Google-Smtp-Source: ABdhPJxVwQE3gL6M+IW1xpd6mBxb+EO8O1jtcSZ7GIJafMQR4bmkZKpQGZm9Gj9nqGreg4MTplmRew==
X-Received: by 2002:a05:6102:3ec3:: with SMTP id
 n3mr21015849vsv.48.1637746201408; 
 Wed, 24 Nov 2021 01:30:01 -0800 (PST)
Received: from rekt.ibmuc.com ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id m15sm7682583vkl.40.2021.11.24.01.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:30:01 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v2 2/2] ivshmem-test.c: enable test_ivshmem_server for
 ppc64 arch
Date: Wed, 24 Nov 2021 06:29:48 -0300
Message-Id: <20211124092948.335389-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211124092948.335389-1-danielhb413@gmail.com>
References: <20211124092948.335389-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test, if enabled by hand, was failing when the ivhsmem device was
being declared as DEVICE_NATIVE_ENDIAN with the following error:

/ppc64/ivshmem/pair: OK
/ppc64/ivshmem/server:
**
ERROR:/home/danielhb/qemu/tests/qtest/ivshmem-test.c:367:test_ivshmem_server:
assertion failed (ret != 0): (0 != 0)
Aborted

After the endianness change done in the previous patch, we can verify in
both a a Power 9 little-endian host and in a Power 8 big-endian host
that this test is now passing:

$ QTEST_QEMU_BINARY=./ppc64-softmmu/qemu-system-ppc64 ./tests/qtest/ivshmem-test -m slow
/ppc64/ivshmem/single: OK
/ppc64/ivshmem/hotplug: OK
/ppc64/ivshmem/memdev: OK
/ppc64/ivshmem/pair: OK
/ppc64/ivshmem/server: OK

Let's keep it that way by officially enabling it for ppc64.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/qtest/ivshmem-test.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
index dfa69424ed..fe94dd3b96 100644
--- a/tests/qtest/ivshmem-test.c
+++ b/tests/qtest/ivshmem-test.c
@@ -463,7 +463,6 @@ static gchar *mktempshm(int size, int *fd)
 int main(int argc, char **argv)
 {
     int ret, fd;
-    const char *arch = qtest_get_arch();
     gchar dir[] = "/tmp/ivshmem-test.XXXXXX";
 
     g_test_init(&argc, &argv, NULL);
@@ -488,9 +487,7 @@ int main(int argc, char **argv)
     qtest_add_func("/ivshmem/memdev", test_ivshmem_memdev);
     if (g_test_slow()) {
         qtest_add_func("/ivshmem/pair", test_ivshmem_pair);
-        if (strcmp(arch, "ppc64") != 0) {
-            qtest_add_func("/ivshmem/server", test_ivshmem_server);
-        }
+        qtest_add_func("/ivshmem/server", test_ivshmem_server);
     }
 
 out:
-- 
2.31.1


