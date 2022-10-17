Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88FF600E34
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 13:53:46 +0200 (CEST)
Received: from localhost ([::1]:59864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okOgj-0004XK-SK
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 07:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okOaB-0003uK-Qc
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:47:21 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okOaA-0000Y7-4w
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:46:59 -0400
Received: by mail-pj1-x1032.google.com with SMTP id fw14so10739291pjb.3
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 04:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pAE6Kz1UvNwqKa+9AtYhVCWT4MKKxa9z5ogZqixJo/k=;
 b=oZmHQr4nL2T03sRSdIrN3blWcn6SQrJYq4grPTcMCrmbJ5WalWLDT/A0PB7mxTTk9J
 C1abtGsH/MDbp0jyL+OlsQNupcN+05CBUYJ1qcSdLumuqYgGIRgoJi8dLy2uTAg1he5R
 ApmfTkqu/Gbxbyawb0pQqzVEmn9a6YhWy0hB4aJ8bMa/TGwqHGTD9zjAFgsdMF7/3xXq
 AH/mpT002Wx/JLuK0HxerthLaA6H8Q5tQL1ufWC5YKCAq7bdc9zpUuBPdotcoBxfAGm0
 YURsk4QUIPNSdrCVOPtxyS+nZs6ePKbUqWKLydTyftFzUGs3G5q1lm9oVYzfE6uhoWAW
 bDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pAE6Kz1UvNwqKa+9AtYhVCWT4MKKxa9z5ogZqixJo/k=;
 b=mEKEXEgLC4WB3y9CwZv+dLLnKnaesvUGvB+fpUAkE+RTcn5EFxI66VdG1LoBFSZdK/
 Mvht18IL1LgHEc4qsJTSUhLu3aivunCxll/R3uQ8a28FCFEHD0qWYddLcDGBogWBv5k3
 rcHYx2lNRnzLfEQ4pAmFKveD2DrFO/7viAeVe1dDkeAgXcGZIAFkJZN6IjVIWfclqVTL
 mi7PIdic8FvuzdUq1T9KPJoJjXC8US4jCPMD7ne5klCbpV4ceIsvpfEA4HYpK6Qi/Ram
 mEiVCy+Nh8t6AZKlX5sPi7vOkYyi2M4jnJ0ByPF6FTZfzUH7cqjXQtfczFVHQOO//SJy
 Hxtw==
X-Gm-Message-State: ACrzQf1nQ3ChFk+lv8G6y55wAEiWg9Y+oBFdq09IjT6Nrh2sTlojghaw
 jd/8c2L5vzi+h5iz+R3KzonLcjmn/8aLRQ==
X-Google-Smtp-Source: AMsMyM6QrA4PXchLp3qRjAyB06xYlonhBzc5vUBgLlRHFfCggEj/pJOI1IND/f1NZYYl+xy44nXIFQ==
X-Received: by 2002:a17:903:2d1:b0:183:2b26:575d with SMTP id
 s17-20020a17090302d100b001832b26575dmr11651508plk.77.1666007215407; 
 Mon, 17 Oct 2022 04:46:55 -0700 (PDT)
Received: from ubuntu.. ([65.20.73.185]) by smtp.gmail.com with ESMTPSA id
 c28-20020aa7953c000000b0053725e331a1sm6870382pfp.82.2022.10.17.04.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 04:46:55 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Shengjiang Wu <shengjiang.wu@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 1/2] tests/qtest: migration-test: Fix
 [-Werror=format-overflow=] build warning
Date: Mon, 17 Oct 2022 19:46:46 +0800
Message-Id: <20221017114647.2226535-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1032.google.com
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

When tmpfs is NULL, a build warning is seen with GCC 9.3.0.
It's strange that GCC 11.2.0 on Ubuntu 22.04 does not catch this,
neither did the QEMU CI.

Reported-by: Shengjiang Wu <shengjiang.wu@windriver.com>
Fixes: e5553c1b8d28 ("tests/qtest: migration-test: Avoid using hardcoded /tmp")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/migration-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index ef4427ff4d..83a8998e40 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2481,7 +2481,7 @@ int main(int argc, char **argv)
 
     tmpfs = g_dir_make_tmp("migration-test-XXXXXX", &err);
     if (!tmpfs) {
-        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
+        g_test_message("g_dir_make_tmp on path (%s): %s", g_get_tmp_dir(),
                        err->message);
     }
     g_assert(tmpfs);
-- 
2.34.1


