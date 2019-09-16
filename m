Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C78B3D48
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 17:07:40 +0200 (CEST)
Received: from localhost ([::1]:35690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9sbK-0005l5-UD
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 11:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53607)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1i9sCp-0006KT-5T
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1i9sCn-0007Qi-Eb
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:18 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34914)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1i9sCn-0007Q1-32
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:17 -0400
Received: by mail-wr1-x432.google.com with SMTP id v8so3819656wrt.2
 for <qemu-devel@nongnu.org>; Mon, 16 Sep 2019 07:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XFqUfZ0D+qjTEWF2tGgFMQF/kgJJHpcKbhrb9txVbKA=;
 b=B8Rm226j0iatczokUjljTF5QA7+6reh4Bx5DkXsExrYpF9oK3HeQuAjI58sNUv1vaz
 fn+7IL35uEiH+RB6lifq21t2vKQWWMgNcUrTzrWhWScFoaZNse2SiRf93x+GzXOWE43z
 Z8BqQsz2Uwc5V5R+ssrlifdNnIhpcwq75hCWY9sI/FUpYc3ErICj5HAmlrSPC7XOltcu
 vwnwAa7n20JMlon9rDvQ/QmYwQ+2nAcrNRK3pwGF3osYuGh7rF0a+m5ivvt7a7MI4VTT
 hVpYLWkcPz8I2+HXIm5HbnYDMeCps1Q0xRmuQFFkuAZ8OVewwU7BRMi9TlomlyHfNEEN
 iIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=XFqUfZ0D+qjTEWF2tGgFMQF/kgJJHpcKbhrb9txVbKA=;
 b=qxXdi9JT/St/DcWFI83Lmfv2yURRJuewtRJMJtr6GOtXtt0UwOTF1zBsutgNtrFI4U
 1pNCYjyztF3V6IdPpvo6dXaZk+2Cd8dChcyLpYgRf0QEq7CYHfYO/m+fwkEGPzXTZK6V
 HRcPPiOve0ISP6Ysd/WLJc5r0z7w+G/KPptq11GSnf0L3+Zk4tye2Kdl7HMn6QRSzx0r
 4xPclFkUjK1i264gtOyV+NInEWtmKt9F5GDhEvpm0rdW31AxWyb0FHoIKp/SBIgzUOXm
 OFWsy8lRmLsHNmyl7dbMJ1kNsTg5gCcmO4zQBLjXiARAE14A0tg3VALSQxl7APfMtXNK
 8h0A==
X-Gm-Message-State: APjAAAUszM2o7pOvwLK8N6xftubYlJkY/Q34Kk7J7fbqKnOemPprh21S
 gneQ1Fw5WBbJx2b6N8LdlpRang1/
X-Google-Smtp-Source: APXvYqxSL+q0ZO7Cx8+j3Je9PXyS769us4xiWkAjSLq0/+OeRK4ZLWvyymLeYYvHuI0p2R2TOoxpXA==
X-Received: by 2002:adf:d848:: with SMTP id k8mr112778wrl.254.1568644935671;
 Mon, 16 Sep 2019 07:42:15 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id i14sm17024298wra.78.2019.09.16.07.42.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Sep 2019 07:42:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2019 16:41:45 +0200
Message-Id: <1568644929-9124-6-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1568644929-9124-1-git-send-email-pbonzini@redhat.com>
References: <1568644929-9124-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::432
Subject: [Qemu-devel] [PULL 05/29] exec.c: correct the maximum skip value
 during compact
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
Cc: Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

skip is defined with 6 bits. So the maximum value should be (1 << 6).

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190321082555.21118-6-richardw.yang@linux.intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index d9827ef..d1969bb 100644
--- a/exec.c
+++ b/exec.c
@@ -324,7 +324,7 @@ static void phys_page_compact(PhysPageEntry *lp, Node *nodes)
     assert(valid_ptr < P_L2_SIZE);
 
     /* Don't compress if it won't fit in the # of bits we have. */
-    if (lp->skip + p[valid_ptr].skip >= (1 << 3)) {
+    if (lp->skip + p[valid_ptr].skip >= (1 << 6)) {
         return;
     }
 
-- 
1.8.3.1



