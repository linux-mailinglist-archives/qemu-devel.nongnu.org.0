Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDB34B00FD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 00:11:39 +0100 (CET)
Received: from localhost ([::1]:38520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHw7d-0004Ls-Ti
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 18:11:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvxH-0004H9-Az
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:00:55 -0500
Received: from [2607:f8b0:4864:20::42d] (port=36396
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvxF-000334-T9
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:00:55 -0500
Received: by mail-pf1-x42d.google.com with SMTP id u16so1295844pfg.3
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 15:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2vlhP+I+qsoulaMdTGbCrXFc3DOLl+1M9mBK8FsFFtE=;
 b=U+TP3RXM7Dc0QrVIbeYiuN2q7j9p2snQRygVAAlRplz9hSYPN2eh+Lhuigdc3v4Aws
 ObemSf8GpcmRBJj0mGYIKvgtLgQBiuYagdKV9QNJesTc3E/uS7k3rJW7kH2Qdg8M+5EJ
 qfE35E6p4PMm7HtYNyO103KdNxT5ZwyVLvXczVDkmh7U5bqIhGRqp6tD6RUn6W6+jVUh
 Kox0VGSgDUTqFK4Oij1vFNusJJEx6lHAo/dmHZy+cEzH50WL9lc9p8vs+4xoDX/PdXok
 qWwa7wPkoPNin5q7tPYnHh1N96F73D/OMvAWgnhUXuvf9axaw9qGp869c52SKaZk6b5O
 ziJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2vlhP+I+qsoulaMdTGbCrXFc3DOLl+1M9mBK8FsFFtE=;
 b=dazEZE5rmkMaGVaENlSnnruACtYMIuuLXpBJx33Iuvh1rxCkLU7Eu/RdwrojFHrc5N
 LYymQuh7mzsTmQFoRmuEAZCiA7tPJ6GNL1MjPaDDbiyiKWA/R5hx4LqnUv2ajm6S9fqK
 5w1tQgDjd6eVD5i7nkxgQ9tlapVCgJ5bfJ91gpuTThkw2OBY4pjTPXjIHB+3q7rAwaeo
 GIVy3AisfFC0J6YOL1W6HjUgw/lJHQRoCqX0nVRCvF4tfPph/Zm352hStB28C52AGwiS
 e06Yj0TdYNtIMN0c6mlVUul9JDlZMP2kY/mnEHxxMt8/a8xR5VTPkkeCmlGhc1QvIawV
 x4DA==
X-Gm-Message-State: AOAM5338JSAf4D+XYyPFaJKL9GVHvrBEVkMPNZD0kH8/Au8dvDZ2hwz9
 UTsph1rNFw/Z4GWgQInOY8I5uiOrgdQ=
X-Google-Smtp-Source: ABdhPJz2rK3ypTqrPFOInwlOJsbKdAFPIHpL97M8AASu7Ddl2EuZIvMxJ6K9ZBYwE7R7PPNEGTquHA==
X-Received: by 2002:a63:5fd1:: with SMTP id t200mr3767044pgb.37.1644447652393; 
 Wed, 09 Feb 2022 15:00:52 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id u17sm11952230pfi.163.2022.02.09.15.00.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 15:00:52 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 2/9] coverity-scan: Cover common-user/
Date: Thu, 10 Feb 2022 00:00:23 +0100
Message-Id: <20220209230030.93987-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209230030.93987-1-f4bug@amsat.org>
References: <20220209230030.93987-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

common-user/ has been added in commit bbf15aaf7c
("common-user: Move safe-syscall.* from linux-user").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/coverity-scan/COMPONENTS.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index 183f26a32c..cea6695ecd 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -127,7 +127,7 @@ usb
   ~ (/qemu)?(/hw/usb/.*|/include/hw/usb/.*)
 
 user
-  ~ (/qemu)?(/linux-user/.*|/bsd-user/.*|/user-exec\.c|/thunk\.c|/include/exec/user/.*)
+  ~ (/qemu)?(/common-user/.*|/linux-user/.*|/bsd-user/.*|/user-exec\.c|/thunk\.c|/include/exec/user/.*)
 
 util
   ~ (/qemu)?(/util/.*|/include/qemu/.*)
-- 
2.34.1


