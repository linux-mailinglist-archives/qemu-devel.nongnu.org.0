Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3E947F4D0
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Dec 2021 01:21:37 +0100 (CET)
Received: from localhost ([::1]:37660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1HI8-0001Dd-LA
	for lists+qemu-devel@lfdr.de; Sat, 25 Dec 2021 19:21:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n1HGP-0007lN-JG
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 19:19:49 -0500
Received: from [2a00:1450:4864:20::52a] (port=36553
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n1HGO-0003Tb-3A
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 19:19:49 -0500
Received: by mail-ed1-x52a.google.com with SMTP id q14so39140594edi.3
 for <qemu-devel@nongnu.org>; Sat, 25 Dec 2021 16:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Td334/xpy5Tg3nWQ3FdXFPFWOrjdn/tEhC+TQvBQk8=;
 b=DcQMXPZSZ8iq+fH2+iTTEYgHuFaTPuFrL3h1q6d6tnIX9Tv/zAhD1VTue1mpiUc/lu
 uuYE29kxdsW6/puREmHAf35xR4znScT+pS9iV0002YktOWbyeuucH0z+u3e9oQPqKw5Z
 TWoo5Nnjx4mo5MTjRh11TaxbFdfGqyfixAkoAaxqckz+vBIP48mE0/0kscu46AOsJtYN
 E7PaFCnwjSCn9IGvg+oqB6Ukm9wK0KYvJp2xJEVzKMnEfv/GIgJ/bHvulRmJVMwKof48
 63VfAAyc6jO3bkGXYPgWLwH3pJxXdT4RrduKRhBVSh8EPPj5+qvHx/1U1AcAZkS+BnWZ
 VEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2Td334/xpy5Tg3nWQ3FdXFPFWOrjdn/tEhC+TQvBQk8=;
 b=CXY5ek+PotTrKaiEZmfJEwJR+V/O+G+qUmdyBJVn7VMKwn533YCZ05qgC47R9GaIRi
 VFziagUPyDbz+yUpZXes/gA1c7P0iDDbqH1hSN0C05wxe5EPD8Xbjw5UygkHafdf8/05
 isq1oy53ks2LC4oL6QherbG2UmBC+USGESIpIXqqTDM1ae2PTVw2ByZDSsruhVQxatxJ
 WLU3E9aN+C81IXMzAC0VTn4ON9qCoeF0DM32+81NYl7HCiz0Tpuft9zDz3KiAIC+5enT
 OExqhQOcmhKBWG5g+zSqyfE7DgfouJ5+MQRhjbin/IeLJlUQPjFanCtixjtUskyh5ued
 a9vg==
X-Gm-Message-State: AOAM530Upvj0FUR5LVfuePd8zYhPbWF9t0oVBHgXqL3OnOUuAx3qAl2d
 H9WuAA9uMPIW5/NX0j/XU04nOdXxsLCaOA==
X-Google-Smtp-Source: ABdhPJw6aEGLyI43eA+THfnBrFVSTlbnhUwcJNbaTWeKxynm7UW7wWnkyDxdAM1LXo/LVDtfuykHcQ==
X-Received: by 2002:a17:906:8a43:: with SMTP id
 gx3mr9188456ejc.185.1640477986654; 
 Sat, 25 Dec 2021 16:19:46 -0800 (PST)
Received: from x1w.redhat.com (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id di16sm3835185ejc.82.2021.12.25.16.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 16:19:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/2] tests/tcg/mips64el: Run float tests
Date: Sun, 26 Dec 2021 01:19:31 +0100
Message-Id: <20211226001931.3809249-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211226001931.3809249-1-f4bug@amsat.org>
References: <20211226001931.3809249-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unfortunately this fails:

  $ make run-tcg-tests-mips64el-linux-user
  ...
  Files float_convs.out and tests/tcg/mips64el/float_convs.ref differ
  --- float_convs.out     2021-12-26 01:03:48.585973637 +0100
  +++ tests/tcg/mips64el/float_convs.ref   2021-12-26 00:29:35.804465340 +0100
  @@ -1,40 +1,40 @@
   ### Rounding to nearest
  -from single: f32(nan:0xffffffff)
  -  to double: f64(nan:0x007ff7ffffffffffff) (INVALID)
  -   to int32: 2147483647 (INVALID)
  -   to int64: 9223372036854775807 (INVALID)
  -  to uint32: 2147483647 (INVALID)
  -  to uint64: 9223372036854775807 (INVALID)
  make[2]: *** [tests/tcg/multiarch/Makefile.target:32: run-float_convs] Error 1

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/tcg/mips64el/Makefile.target | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 tests/tcg/mips64el/Makefile.target

diff --git a/tests/tcg/mips64el/Makefile.target b/tests/tcg/mips64el/Makefile.target
new file mode 100644
index 00000000000..dcb1e9d72ac
--- /dev/null
+++ b/tests/tcg/mips64el/Makefile.target
@@ -0,0 +1,2 @@
+float_%: CFLAGS+=-march=loongson3a
+float_%: QEMU_OPTS+=-cpu Loongson-3A4000
-- 
2.33.1


