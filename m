Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02465F7B3D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:14:46 +0200 (CEST)
Received: from localhost ([::1]:55974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpzp-0007JM-QN
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sisshiki@isshiki-clinic.com>)
 id 1ogpTw-0003LN-AS
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:41:48 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:43764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sisshiki@isshiki-clinic.com>)
 id 1ogpTo-0000sD-S5
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:41:47 -0400
Received: by mail-pl1-x632.google.com with SMTP id z20so4861102plb.10
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 08:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=isshiki-clinic-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=myO3ktHeJT6MCrgSHvLKUCdHXWktxN7tncXD07KwBmU=;
 b=ZVCB9kCTOQtpyK0zpD4ysqoq95hu/l1TWqJDZzx9RFwAnWDG1NTf5qHPSXzjx3PsC6
 LerGQ6fA9EesxMec8f4/4Gy0e7SDfI1CtLKQquDAx1XdN9aPrHUm5iawUV6caMvDZfV1
 CZeBi/fQIXYfbrBFKO5iEBJ7eGvRqKGLdohpY2trVexHL4HXzCyi4+Gf1n5nvtyBjJAw
 CjHOPvZFKGZkuPllB3sv8wB1xv9hn29oBCAUeeNW6phl1P+Ll3tOKWghRfYtqoatVfJe
 J3L2Xur8yy4IqpbLCgo6jfKzwe/5T8hOR4aSDOQA/rQZ1SqAAGYHmfwwzLfAGbqw76GW
 FUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=myO3ktHeJT6MCrgSHvLKUCdHXWktxN7tncXD07KwBmU=;
 b=wKCkv5YhtVYUERzwaTbDL89uKxnh+ELfBe4qMXk9ZSwFqMHP7Hgpd9ct2ChG065TFm
 /i6/oAvn7Zox4aLCS2xKOaPUtgdZkfKlI80IL5LZJxohDgAgnRLYRitEAPW4PQvu0cGk
 8Eelp0ZrSScs0AnjjIXKcVzZFgA0rQJDfxsLb8+UjoRP22itLXmAy7YsveQkU7LGqJcF
 Ojl8SrZqRaZ8yvaaQ7k/B3w08bUJHxd8QWrRMswo01Enhg33GaMK7EBwRuwka1XrEYfv
 8LMpJkkdVLcDrXrgq3mHnEOZ/CNOBATK/lsdfU0NgjJkccIXsAJxCZOv2qXzpokH4kM7
 IwEg==
X-Gm-Message-State: ACrzQf2Exm3B4Nv6U9vWe+M5w7GYqt7AVUcmUrDvmT+r5bDFzj4HpKGk
 Nz7r4K3BUXSMdzXB8s7HrqeopQ==
X-Google-Smtp-Source: AMsMyM7Q3gmqye+5MAd+eFw+NrKANIS8IS1sH6Y+4snsm3WbLvZLcBj0Lo64OgnU24viJf9+0f6tIA==
X-Received: by 2002:a17:902:d48e:b0:178:b5d:ab3 with SMTP id
 c14-20020a170902d48e00b001780b5d0ab3mr5660641plg.22.1665157298350; 
 Fri, 07 Oct 2022 08:41:38 -0700 (PDT)
Received: from DESKTOP-8TCEJFK.localdomain
 (215.134.178.217.shared.user.transix.jp. [217.178.134.215])
 by smtp.gmail.com with ESMTPSA id
 gm7-20020a17090b100700b0020669c8bd87sm1668482pjb.36.2022.10.07.08.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 08:41:37 -0700 (PDT)
From: Soichiro Isshiki <sisshiki@isshiki-clinic.com>
X-Google-Original-From: Soichiro Isshiki <sisshiki@mac.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: sisshiki1969 <sisshiki@mac.com>
Subject: [PATCH v2] linux-user: mprotect() should returns 0 when len is 0.
Date: Sat,  8 Oct 2022 00:40:40 +0900
Message-Id: <20221007154039.10239-1-sisshiki@mac.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=sisshiki@isshiki-clinic.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: sisshiki1969 <sisshiki@mac.com>

On Fri, Oct 7, 2022 at 9:38 AM Richard Henderson <richard.henderson@linaro.org> wrote:
| Although, sorta, this smells like a kernel bug.
| Why should mprotect(-4096, 0, 0) succeed while mprotect(-4096, 4096, 0) fails?

This may be kinda bug compatibility...

| But anyway, if we're going to fix len == 0 to match, we might as well fix all 3 test
| ordering bugs at the same time.

Yes, I agree, and made another patch.
A validation for wrap-around was added, I think it is neccesory.

A tiny test code was shown below.

```sh
> cat test.c
#include <sys/mman.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
  char *addr;
  int prot = PROT_READ | PROT_EXEC;
  int map = MAP_SHARED | MAP_ANONYMOUS;
  addr = mmap(NULL, 4096, prot, map, -1, 0);
  if (addr == 0) {
    perror("mmap");
    exit(EXIT_FAILURE);
  }
  
  void *addrs[] = { (void *)77, NULL, addr };
  for (int i = 0; i < 3; i++) {
    if (mprotect(addrs[i], 0, PROT_READ) == -1) {
      perror("mprotect");
    } else {
      printf("OK\n");
    }
  }

  // invalid prot
  if (mprotect(addr, 2048, PROT_READ | 0x20) == -1) {
    perror("mprotect");
  } else {
    printf("OK\n");
  }
}
> cc test.c -o test
> ./test
mprotect: Invalid argument
OK
OK
mprotect: Invalid argument
> qemu-x86_64 test          # current master
mprotect: Invalid argument
OK
mprotect: Cannot allocate memory
mprotect: Invalid argument
> build/qemu-x86_64 test    # after the patch applied
mprotect: Invalid argument
OK
OK
mprotect: Invalid argument
```

seems good.

Soichiro Isshiki

Signed-off-by: sisshiki1969 <sisshiki@mac.com>
---
 linux-user/mmap.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 28f3bc85ed..757709eeba 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -124,17 +124,20 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
     if ((start & ~TARGET_PAGE_MASK) != 0) {
         return -TARGET_EINVAL;
     }
-    page_flags = validate_prot_to_pageflags(&host_prot, target_prot);
-    if (!page_flags) {
-        return -TARGET_EINVAL;
+    if (len == 0) {
+        return 0;
     }
     len = TARGET_PAGE_ALIGN(len);
     end = start + len;
+    if (end <= start) {
+        return -TARGET_ENOMEM;
+    }
     if (!guest_range_valid_untagged(start, len)) {
         return -TARGET_ENOMEM;
     }
-    if (len == 0) {
-        return 0;
+    page_flags = validate_prot_to_pageflags(&host_prot, target_prot);
+    if (!page_flags) {
+        return -TARGET_EINVAL;
     }
 
     mmap_lock();
-- 
2.25.1


