Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE756B1E92
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:47:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBtm-0000Lt-IP; Thu, 09 Mar 2023 03:45:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBth-0000JS-L7
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBtg-0000Aw-2u
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678351511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5cdLVRYibCexX5z7fj2qq9ISnkCMmfES7H7wn1Me+4=;
 b=F//0lzTFfOHxCFUrgzDkJNqNCCaEMMFWlt4qbbQNUzElLrGGYB27hnrTcwOfbTcLmguFhj
 /jDJwt8Rvok2ZjnQh1BcwZ6xMhz3x4SYnNs9+E3FsKjRmoONDfOF/1Zm1L5I7PlC0EkZG3
 /ts84u2nUGNNnKLWlPlTqDEJrfVKlfw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-hMbpGvIeMZOKtJeXYrZYYA-1; Thu, 09 Mar 2023 03:45:10 -0500
X-MC-Unique: hMbpGvIeMZOKtJeXYrZYYA-1
Received: by mail-ed1-f69.google.com with SMTP id
 da22-20020a056402177600b004c60694083eso1902376edb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:45:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l5cdLVRYibCexX5z7fj2qq9ISnkCMmfES7H7wn1Me+4=;
 b=6Rn5dJPMIkuCgCnWWDXuQHb+NlyZSB4gBfZfWPPlyXW8EqPI4OxPZgDItuhN9+ZDCf
 zRqxX/yq45Uo3r6CEUzhNink1NG/fYGQ7AIW4RRweW95AcVY4BaRKyIkmpz6U9o7tHF+
 a6m12nZTz56ljq8/dnxgWfB13p2F12UJxAzxxZU4CoVaAhAqleGDcXkX/xQmbyLyaHB7
 jD/VJPolEU3QRxjJlERDbmmEHnPosIjKKdqc7hRB2gjOFG/MLZ9rMlTLLPYnBKvTqvvL
 OzZfI/JXfX6ZbDzS3+YD7lyFqhmrKeIcla56d5fMno8cVMzHDMxqx2Ga8Tcp7GzDK3n3
 g7NQ==
X-Gm-Message-State: AO0yUKWe6fdh136Td1wz6QUzNAgXSFbnnVdBO2wdjWLm6GRbRAYiaudZ
 5JINkfGGdj5bOmTaCyPHwAHxh5fqEr/BL/SwGz2q0rNMXWkSjDpLNrmkaTs4WDn3B+B4Pmbc0y4
 VYr3Zn0cSKrvRaUW/iRnUS13SeJfQdKvQguer+wdJ9DinVEo0w3dTvUF1+mj52fCl4Qh+edL6HE
 Q=
X-Received: by 2002:a17:907:3f90:b0:8ec:439f:18fb with SMTP id
 hr16-20020a1709073f9000b008ec439f18fbmr21910761ejc.29.1678351508900; 
 Thu, 09 Mar 2023 00:45:08 -0800 (PST)
X-Google-Smtp-Source: AK7set8mPkYRW4PsdTEZ9LMiDHwYHUk0AetiDxxjpCfIunggztT1fg8XfW3vy8cWpvU3igiPsDntXQ==
X-Received: by 2002:a17:907:3f90:b0:8ec:439f:18fb with SMTP id
 hr16-20020a1709073f9000b008ec439f18fbmr21910751ejc.29.1678351508723; 
 Thu, 09 Mar 2023 00:45:08 -0800 (PST)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 dc23-20020a170906c7d700b008b17e55e8f7sm8502061ejb.186.2023.03.09.00.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:45:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH 7/9] tests: mark more coroutine_fns
Date: Thu,  9 Mar 2023 09:44:54 +0100
Message-Id: <20230309084456.304669-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309084456.304669-1-pbonzini@redhat.com>
References: <20230309084456.304669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-thread-pool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/unit/test-thread-pool.c b/tests/unit/test-thread-pool.c
index 6020e65d6986..493b966b94f9 100644
--- a/tests/unit/test-thread-pool.c
+++ b/tests/unit/test-thread-pool.c
@@ -71,7 +71,7 @@ static void test_submit_aio(void)
     g_assert_cmpint(data.ret, ==, 0);
 }
 
-static void co_test_cb(void *opaque)
+static void coroutine_fn co_test_cb(void *opaque)
 {
     WorkerTestData *data = opaque;
 
-- 
2.39.2


