Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC00123C6D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 02:31:32 +0100 (CET)
Received: from localhost ([::1]:48094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihOBX-0005po-0E
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 20:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55274)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihOAM-0004zs-LV
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 20:30:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihOAK-00052j-Ja
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 20:30:18 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41273)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihOAJ-00050H-Un
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 20:30:16 -0500
Received: by mail-wr1-x442.google.com with SMTP id c9so473576wrw.8
 for <qemu-devel@nongnu.org>; Tue, 17 Dec 2019 17:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=yx4+N0YqtdkyV6PrveYjZLcjfbc3XqUAJOQk41V1MmY=;
 b=tUqDMCkFqHTvzehdY1+tpTJcwrJGMc+y9MTdkLm1jmnF/kxbMCZPKW59MapK8jx46i
 AGqlGgMQ/OHerikBTI2+P7sLiO7DGvOUZE/x7i+xWC7tvZ5LAAr75jWbb7nC61VwdZU5
 BLaXgGnd4H2PZJnZaJf89VKPvJQcBppXcoRrr2IGHrjCg5CPgRqUpAz/ydqE3qWiNJUG
 ym2i+idq8mu1srSODCjmTDUpaXnK0fPa3O1o/ThT33t8QoujlN11odJ47+VO5IBaBjZ+
 Y3HdfmqBxwosGFC6wivKFnebPjvuMuDx5Y4Ob02G+XbkoCz/k4LLv7QqHn3fLAmhuvi8
 BEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=yx4+N0YqtdkyV6PrveYjZLcjfbc3XqUAJOQk41V1MmY=;
 b=Zso7soMBzsmmBb8iV/p/WUE157xutARH7gm+Qi5qI6wcFy/j7IWrrHcnUSiSemOHLC
 vjArnhv5S+Gj77S7aLQurbByjynJ5UzaTuCMSDThUWFr2d+Q5U0PEUBofBPtimWhlGYh
 1sqJnKgW/y0dmBoa1JMi7fu3qbTw28VgyjJClJgx5uCmpRYPiB2mFD/XzxO5DeEGi+na
 l1oQJh6Yt0IWFfAB0xbB7PZhFUiZZp5u3kXDoXMKyKpc86kKu81IEh3W18gIBeltNRri
 aoozZEDpR7aMZUzMrZwzeaDc8EcFCtGEbnfGev+9FZn/3tT+VLhm0jXUe4nN0brDLCQR
 /vEQ==
X-Gm-Message-State: APjAAAX5cg3X60IwXraPr96/8NeGFBdHAniJgT6qxT3EmcStumzfCQPw
 vECA5ox4mxHkljSVBeyHqRsC24w1
X-Google-Smtp-Source: APXvYqzqHqyA+2m212V9HDljU5G2U6q1HK7TphbeOgi6os8Ub8TxccduM+/BIzb7hZqPloM33HCJ1A==
X-Received: by 2002:adf:ebc3:: with SMTP id v3mr811535wrn.280.1576632613415;
 Tue, 17 Dec 2019 17:30:13 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id f12sm651283wmf.28.2019.12.17.17.30.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Dec 2019 17:30:12 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docker: gtester is no longer used
Date: Wed, 18 Dec 2019 02:30:11 +0100
Message-Id: <1576632611-55032-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are using tap-driver.pl, do not require anymore gtester to be installed
to run the testsuite in docker-based tests.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/common.rc | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tests/docker/common.rc b/tests/docker/common.rc
index 512202b..02cd67a 100755
--- a/tests/docker/common.rc
+++ b/tests/docker/common.rc
@@ -53,12 +53,7 @@ check_qemu()
         INVOCATION="$@"
     fi
 
-    if command -v gtester > /dev/null 2>&1 && \
-           gtester --version > /dev/null 2>&1; then
-        make $MAKEFLAGS $INVOCATION
-    else
-        echo "No working gtester, skipping make $INVOCATION"
-    fi
+    make $MAKEFLAGS $INVOCATION
 }
 
 test_fail()
-- 
1.8.3.1


