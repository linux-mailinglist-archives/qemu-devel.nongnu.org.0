Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEFC20557D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 17:07:00 +0200 (CEST)
Received: from localhost ([::1]:41888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnkVn-0003BX-Dx
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 11:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jnkMH-0007rT-LN
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 10:57:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35757
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jnkMF-0003mi-4y
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 10:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592924225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=kIDvPuB8KHqCOD97URxiiLd4BWyBBgGXBC7RqCRKmCw=;
 b=AVTBsUjSEzka8Wv9GpoT1z6BPNRuDUg7jgxvCoUKWkRx/tXkUu1hjNy0BpsMfHt2sd002e
 y9EHIPJntOF7jb4B/LKiSv85YnsrqU6vAzHwvqclmLtOaV+12973P/u1h3ipTe2rSrZEmb
 1Bo68WEkvn/pkfIhmNogUs0Mslqp4mo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-7OIPjzOXM7meTpjf_AI4ag-1; Tue, 23 Jun 2020 10:57:03 -0400
X-MC-Unique: 7OIPjzOXM7meTpjf_AI4ag-1
Received: by mail-wr1-f71.google.com with SMTP id y16so12233421wrr.20
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 07:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=kIDvPuB8KHqCOD97URxiiLd4BWyBBgGXBC7RqCRKmCw=;
 b=eiB6a73jZ9so90oGxsyPBWuLiGSn92PVFDjDIHQega8lzpXBxInxb8oyglucJv4MA0
 NvveEEe8tyKCSOhAbqU4Q4I/ybEkne003SAAqJPJ3mhyne/TGa39qjTRaIgK88PP/PZm
 wxq1a8w1Eq7NFKEFgfQ9kupCzoEXjstCpwMi4yPcQhu2Jl/3gQtrPaA5JUc7jDD1t2Zi
 vDlBcmcdpmYhLYT1t/oMkG2Ait+ddwfm18+JRUFyQIwOOQ7odlYL9HJzRUtQnQZze32F
 kkLvdba71bHS/09r+nU28YMEWDBuTUTiMELwqYUucsDAdQ89MHsL0VUqMe3QosIouBWS
 6N5g==
X-Gm-Message-State: AOAM532wm4UeWwMcqO6PsQjE1dmll4B0jywRLlo7IPByjjxYoor+zMLP
 9fGobpTt3kbNGYe2cjBK3rJmHsavQVxdHsFN2Qece67iZsF3xFC+r6FfzS4RMRNW3tIn58tNHtX
 BZq4QT9EgTb/h4mI=
X-Received: by 2002:a7b:cc08:: with SMTP id f8mr26089337wmh.106.1592924222208; 
 Tue, 23 Jun 2020 07:57:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxC/JDUCeWsSN7TILJPGuAsQQn4ik7dj6gztwccS6Pz5E2hG1G/cRA+pzF+O4T2vObZXoBvQg==
X-Received: by 2002:a7b:cc08:: with SMTP id f8mr26089321wmh.106.1592924222035; 
 Tue, 23 Jun 2020 07:57:02 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 f2sm3924171wmj.39.2020.06.23.07.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 07:57:01 -0700 (PDT)
Date: Tue, 23 Jun 2020 10:56:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Revert "tests/migration: Reduce autoconverge initial
 bandwidth"
Message-ID: <20200623145506.439100-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:53:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 6d1da867e65f ("tests/migration: Reduce autoconverge initial bandwidth")
since that change makes unit tests much slower for all developers, while it's not
a robust way to fix migration tests. Migration tests need to find
a more robust way to discover a reasonable bandwidth without slowing
things down for everyone.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

---
 tests/qtest/migration-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index dc3490c9fa..21ea5ba1d2 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1211,7 +1211,7 @@ static void test_migrate_auto_converge(void)
      * without throttling.
      */
     migrate_set_parameter_int(from, "downtime-limit", 1);
-    migrate_set_parameter_int(from, "max-bandwidth", 1000000); /* ~1Mb/s */
+    migrate_set_parameter_int(from, "max-bandwidth", 100000000); /* ~100Mb/s */
 
     /* To check remaining size after precopy */
     migrate_set_capability(from, "pause-before-switchover", true);
-- 
MST


