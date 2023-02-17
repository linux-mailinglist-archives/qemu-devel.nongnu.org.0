Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6AE69A4A4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 05:09:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSs48-0000iA-9T; Thu, 16 Feb 2023 23:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs46-0000hf-9x
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:09:42 -0500
Received: from esa4.hc2706-39.iphmx.com ([216.71.146.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs44-00019C-Kl
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:09:42 -0500
X-IronPort-RemoteIP: 209.85.160.199
X-IronPort-MID: 258600152
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RnaE8Kzte/2DHdstv/l6t+eJxCrEfRIJ4+MujC+fZmUNrF6WrkVRn
 WcYCjjXaPvca2CnKdB1PN+wph8O75fXmtNnTAtr+S00HyNBpPSeOdnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9j8kk/nTHNIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYz18B56r8ks156yo4GNA5DTSWNgQ1LPgvyhNZH4gDfzpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZGBiuFIPM0SRqkEqShgJ70oOHKF0hXG7Ktm+t4sZJ
 N1l7fRcQOqyV0HGsL11vxJwSkmSMUDakVNuzLfWXcG7liX7n3XQL/pGS0E9AaIq2LlOMFpy7
 tlbOg8ORR2eiLfjqF67YrEEasULKcDqOMYGpiglw2iIXLApRpfMR6iM7thdtNsyrpoWTLCOO
 oxAN2IpNUWRC/FMEg5/5JYWleO4gHXlWzdF7l+ZuMLb5kCJkVwviOC0bYC9ltqieuVewkO9v
 mX/0D7aGDs8OYe6zTzd7Sf57gPItWahMG4IL5Wh+/t3xVGe2GEXIBsRU1S9vL++kEHWZj5EA
 0kd+y5rtLRrsULyH4i7UBq/r3qJ+BUbXrK8DtEH1e1E8YKMiy7xO4TOZmcphAAO3CPueQEX6
 w==
IronPort-HdrOrdr: A9a23:fvf2oqiVwbAKK2mFwwXWy+RKunBQXhYji2hC6mlwRA09TyVXrb
 HLoB19726KtN9xYgBdpTnkAsO9qBznhPhICOUqTNWftUzdyRCVxeJZnPbfKkPbalTDH4dmvM
 8KAstD4Z/LfCJHZK7BgDVQeOxQp+VvnprY4Nv2/jNGYTsvRZtdzzpUPC6mL2wefng5OXP7Lv
 ahDwh8ygZItU54Ui3CPAh8YwELnbKrqK7b
Received: from mail-qt1-f199.google.com ([209.85.160.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 23:09:38 -0500
Received: by mail-qt1-f199.google.com with SMTP id
 i5-20020ac813c5000000b003b86b748aadso2426515qtj.14
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 20:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kzjbw0bY3n9Mlk4J3cnpwOVTTHZIbU7scMt6+artRNQ=;
 b=gfizW9x7d5YXITKrQS5ZNYS+wQAQBbY/urGuEd1KFYc9jz3B5uKWDjXBN17ATEvgZr
 9NhByC5fvyNIpMC4FYnV29y4b9Cezs3FFpmvBxOdMgcyPbbNc3LJQ+MBD0YmQoCev3ap
 JdZ8xFqZ/VaDZocsliHT59g2rXMaYgmZvwnZJ5siU3Eg9QebHfon6ZYgtcG0ZN/MNME7
 LHOHIr5lsMND1RBsQ6gV8+XucONbEpknx+cMYuXmoMKFxgpqFcrGBgW6IJSiBMk4gdxl
 WO72qz1VxE6oG65RGLAkOYmvS+JKVdL3okvB4ZlIl/xQXKP2ZkFwGjmtgSCrh7dell+a
 SJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kzjbw0bY3n9Mlk4J3cnpwOVTTHZIbU7scMt6+artRNQ=;
 b=tOGT8LN+YTGCSln7GpQ+cj9YVF9gt0bMt5Kqe04LbmYMImPZPKycEHFhvzIuX+x+TD
 gDBlCa6yfxFdS1dwlxwERpC2Z2kLDmjyG0refjq7iVnhE5oYuKzYhYaZzHqVD08vd8S5
 dNrFqVgLLUW31rWu3JqRPRgQQN68Ehxntsy893/hCA0j+oQXpsN3zHud+NJ1T2+RuU38
 0IN6bAkQ70WBj5l+8RQfLAcyBC3od9W+d3pExjMIODKy55nXY7GBSD7Cl3okEyz/t4xD
 dh95sOu5Q5kPN5z4WYpgijNFNyUTxL/5iW+QVub6SBSEVmjgUwdy3eMcq7Gheb6tLU4h
 EQSQ==
X-Gm-Message-State: AO0yUKWNTkUUjiH6JJMaKuSK/ZDKFv6v0B0QYEwOOet4mHHcqgCKs0VO
 yFbYE7phFVhKQkPW6rGw4ej9nltSu8jNf7O1yIOkJsDFm2qRcCzwJPHTwKiVqqjL6jx8moTWXxX
 DGxbp3jLBXUh4x/X8WqaNXXHllIUvhj9FcZRPBQ==
X-Received: by 2002:a05:622a:296:b0:3b2:1003:37e5 with SMTP id
 z22-20020a05622a029600b003b2100337e5mr14382973qtw.55.1676606976649; 
 Thu, 16 Feb 2023 20:09:36 -0800 (PST)
X-Google-Smtp-Source: AK7set/pKL8WUlnDeHl1prs4II+qAaPdAnfudsL1DccPZb+yHNyE4m0spghavVkr9gl9Zy9/nfXCoQ==
X-Received: by 2002:a05:622a:296:b0:3b2:1003:37e5 with SMTP id
 z22-20020a05622a029600b003b2100337e5mr14382952qtw.55.1676606976369; 
 Thu, 16 Feb 2023 20:09:36 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 13-20020ac8564d000000b003afbf704c7csm1392066qtt.24.2023.02.16.20.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 20:09:35 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PULL 04/10] fuzz/generic-fuzz: add a limit on DMA bytes written
Date: Thu, 16 Feb 2023 23:08:49 -0500
Message-Id: <20230217040855.16873-5-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217040855.16873-1-alxndr@bu.edu>
References: <20230217040855.16873-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.146.118; envelope-from=alxndr@bu.edu;
 helo=esa4.hc2706-39.iphmx.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.649, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As we have repplaced fork-based fuzzing, with reboots - we can no longer
use a timeout+exit() to avoid slow inputs. Libfuzzer has its own timer
that it uses to catch slow inputs, however these timeouts are usually
seconds-minutes long: more than enough to bog-down the fuzzing process.
However, I found that slow inputs often attempt to fill overly large DMA
requests. Thus, we can mitigate most timeouts by setting a cap on the
total number of DMA bytes written by an input.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index f4acfa45cc..c525d22951 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -51,6 +51,7 @@ enum cmds {
 #define USEC_IN_SEC 1000000000
 
 #define MAX_DMA_FILL_SIZE 0x10000
+#define MAX_TOTAL_DMA_SIZE 0x10000000
 
 #define PCI_HOST_BRIDGE_CFG 0xcf8
 #define PCI_HOST_BRIDGE_DATA 0xcfc
@@ -61,6 +62,7 @@ typedef struct {
 } address_range;
 
 static bool qtest_log_enabled;
+size_t dma_bytes_written;
 
 MemoryRegion *sparse_mem_mr;
 
@@ -194,6 +196,7 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
      */
     if (dma_patterns->len == 0
         || len == 0
+        || dma_bytes_written + len > MAX_TOTAL_DMA_SIZE
         || (mr != current_machine->ram && mr != sparse_mem_mr)) {
         return;
     }
@@ -266,6 +269,7 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
                 fflush(stderr);
             }
             qtest_memwrite(qts_global, addr, buf, l);
+            dma_bytes_written += l;
         }
         len -= l;
         buf += l;
@@ -645,6 +649,7 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
 
     op_clear_dma_patterns(s, NULL, 0);
     pci_disabled = false;
+    dma_bytes_written = 0;
 
     QPCIBus *pcibus = qpci_new_pc(s, NULL);
     g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
-- 
2.39.0


