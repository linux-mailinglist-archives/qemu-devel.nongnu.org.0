Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BE95E92C6
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:40:24 +0200 (CEST)
Received: from localhost ([::1]:47218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocPzj-0001vl-12
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPr5-0002hG-7C
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:34 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqo-0006K6-AE
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:11 -0400
Received: by mail-pf1-x436.google.com with SMTP id b75so4165109pfb.7
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=wXX7o9vyXe+cnIaSrbOC6Qyjf1ISL58lfb5Pt+UbcI0=;
 b=Qa+OVJtg9ub68JAm+Aq1Joqx7kI7m0t08L/SSoIAQeudgicfopSh0GBKuLLTkIeZLa
 UnAwoOMKnMF0mLBlrso63fIHCfzTmHUwa1aIvVCJgmzJiXR2ShaXOT5+9pUFbv/gDB5S
 qGNmTn/Dkx4Gxm2BmNTmrMt0SzQUQvxHydHAISMMWtlkBlrmQLisedUOFPY9NEunDgTw
 oM9swQa0yXjVmqmjGuri1T5+abxWA8Ir0Y5eB+ahKuBtp310qzC4R8IhrO+cmuCQzR+B
 OhXbc0BPjlAqMNvecD0XjpH/lIt7C/Ycr4TxMzzYj0/lujICW4JZWLmYE+R7pPDAXFY/
 Sy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wXX7o9vyXe+cnIaSrbOC6Qyjf1ISL58lfb5Pt+UbcI0=;
 b=6XU+gRNKA46AQK8EM7n4D8urQVEpLlWSmo/p2tYaz/1ZMIl1FR13zOUxURax6/Q225
 E8phbi0YAW9Vo7zAwbWDnY1p5auC60b7wCHCg5WTXPkYMU2X8p3Em8R0mdySUqMT/GFK
 zSiSVBh28S90ZkKsQSsN5YXRAEJdsnkPpaHGw44MLL3dqNFprh5bC6bf2ur7DOZ7zlId
 DbXSdNNKKRrRdsMupviTt6gXZZISFI/e12xUQkNlXmJG8M62FQsQHmM7S3Ixx4I7GZ3i
 KaFxdhuqD06+wVMujPZuOgeMgCE8xa3TPcG4PbuBq4etkQRN2ncsqjPIob4AevpmiEOG
 sOag==
X-Gm-Message-State: ACrzQf1lFWFm+XFleBXg1Tt8/MwgwJoPcJP2Z+y6Xai7loA93Vahx6Mb
 utNXZ3xMx9zdZhZ5JdPeZ426yDJ4aC4=
X-Google-Smtp-Source: AMsMyM7jgcjb4M6hCBRjyjVlhNtX+SqKlZs4Pn+Be5BXTXL7QXDOgpLkLcHc0kS7kdxBZ4esPpC4sg==
X-Received: by 2002:a63:f20e:0:b0:439:398f:80f8 with SMTP id
 v14-20020a63f20e000000b00439398f80f8mr15043585pgh.494.1664105469013; 
 Sun, 25 Sep 2022 04:31:09 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:08 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 10/54] tests/qtest: generic_fuzz: Avoid using hardcoded /tmp
Date: Sun, 25 Sep 2022 19:29:48 +0800
Message-Id: <20220925113032.1949844-11-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_dir_make_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- Split to a separate patch

 tests/qtest/fuzz/generic_fuzz_configs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 0775e6702b..a825b78c14 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -20,8 +20,8 @@ typedef struct generic_fuzz_config {
 } generic_fuzz_config;
 
 static inline gchar *generic_fuzzer_virtio_9p_args(void){
-    char tmpdir[] = "/tmp/qemu-fuzz.XXXXXX";
-    g_assert_nonnull(g_mkdtemp(tmpdir));
+    g_autofree char *tmpdir = g_dir_make_tmp("qemu-fuzz.XXXXXX", NULL);
+    g_assert_nonnull(tmpdir);
 
     return g_strdup_printf("-machine q35 -nodefaults "
     "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
-- 
2.34.1


