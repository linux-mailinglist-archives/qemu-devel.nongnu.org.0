Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88183339F4C
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 17:59:28 +0100 (CET)
Received: from localhost ([::1]:60374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7br-0001C7-J6
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 11:59:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7YF-0005g2-PO
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:55:43 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7YE-0001Gs-Bv
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:55:43 -0500
Received: by mail-wr1-x42d.google.com with SMTP id e9so3451616wrw.10
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BeHONAE/NnH8blFIpJrTu17FjI7Z++2Qdzw1aUIAB+k=;
 b=Brn3OT0vtz0XBjMTS4/fLWIYplS31GE5yCrnkOZ7918Ve7JJbP/LgQ9cJ9QTMzo2xC
 r1QjotdlC0vVQ1ptnSoM8gP88TU9JqPkftYIrc8ojbEpxXuusnp360u6OXldm7rmikp8
 W3NjjVbCFkLi1FGPWkK6U9KylgEA5nyJii/86Q9DV8VgsGV7AoJEnCo6dI1mvveHyloI
 4ayoycxcCdnWMLx39nm2z81Ot6/e465WkgfkZowfroK+iJfgCljv6vKAAIb0427Z1G5T
 in5hobkwBn1oTeXgwqb1buCVhV1LjGUk6UdDIg/Xp3ofJO9JVNRN8cNDpAN3C3/mYyO1
 kazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BeHONAE/NnH8blFIpJrTu17FjI7Z++2Qdzw1aUIAB+k=;
 b=aFlvRUSnMUB9XQ6LR/LFHGmYPa8DqhtW3JcMzI68laUf4SZ00hymPMlNyjI2pkkToy
 rG1sD3GUyAaSs9ep4nD0m/FcYh/YaLpotzPBIZmZVXazdddvKC8IVMevboFQQ/dQxziD
 AEGrcHzkLw07FY6Ne6RtH1qTt/fNM96S7ErHC1eFlQG7B/qd0e201kqNZjy0SMBMicw9
 jNhmwKD+EJvi3pm3TTY/wAJaZGRexPbDWACF6hnG3zGUmHje42dDQKOOBGOCr/uukhyD
 B0hS9Ie/TlJ8lztnn6fkMtycunxnPAdWSPdyW4qR6iJX7ekMvbn+gbqMijXLOnZQWLkz
 D4Bg==
X-Gm-Message-State: AOAM531/14Ik+OvSqiHM7vYPTGKLt0UoEjije8UCZDikpIU3XKDy0FSK
 YINYGI0oLBRK5ws7qxnAVnnTNGOZDuG9cQ==
X-Google-Smtp-Source: ABdhPJxE0ft8/ItcTAw1QrvKNlRKYGbk+0FhTD6/d8zIS4xKNEf7MYcm2cop2114uBbCMkBOvgm66A==
X-Received: by 2002:adf:de92:: with SMTP id w18mr19396589wrl.217.1615654539784; 
 Sat, 13 Mar 2021 08:55:39 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b17sm12894175wrt.17.2021.03.13.08.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:55:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] target/avr: Fix some comment spelling errors
Date: Sat, 13 Mar 2021 17:54:44 +0100
Message-Id: <20210313165445.2113938-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313165445.2113938-1-f4bug@amsat.org>
References: <20210313165445.2113938-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, Thomas Huth <huth@tuxfamily.org>,
 Lichang Zhao <zhaolichang@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Edmondson <david.edmondson@oracle.com>,
 Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lichang Zhao <zhaolichang@huawei.com>

I found that there are many spelling errors in the comments of qemu/target/avr.
I used spellcheck to check the spelling errors and found some errors in the folder.

Signed-off-by: Lichang Zhao <zhaolichang@huawei.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Philippe Mathieu-Daude<f4bug@amsat.org>
Message-Id: <20201009064449.2336-12-zhaolichang@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/avr/helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index 65880b9928c..b4532de2523 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -98,7 +98,7 @@ int avr_cpu_memory_rw_debug(CPUState *cs, vaddr addr, uint8_t *buf,
 
 hwaddr avr_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
-    return addr; /* I assume 1:1 address correspondance */
+    return addr; /* I assume 1:1 address correspondence */
 }
 
 bool avr_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
@@ -299,7 +299,7 @@ void helper_outb(CPUAVRState *env, uint32_t port, uint32_t data)
 }
 
 /*
- *  this function implements LD instruction when there is a posibility to read
+ *  this function implements LD instruction when there is a possibility to read
  *  from a CPU register
  */
 target_ulong helper_fullrd(CPUAVRState *env, uint32_t addr)
@@ -323,7 +323,7 @@ target_ulong helper_fullrd(CPUAVRState *env, uint32_t addr)
 }
 
 /*
- *  this function implements ST instruction when there is a posibility to write
+ *  this function implements ST instruction when there is a possibility to write
  *  into a CPU register
  */
 void helper_fullwr(CPUAVRState *env, uint32_t data, uint32_t addr)
-- 
2.26.2


