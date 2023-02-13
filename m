Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9636693C57
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:31:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRObK-0001fz-KS; Sun, 12 Feb 2023 21:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRObI-0001fO-GY
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRObH-00037l-0u
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676255390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W0nw1KUXQEI1xmDznSZCB7Y0xnFRisWgzKRd5bzpoYs=;
 b=izVUHUS6O72zYnoDEThDasLwdqv0y3xtZjyrF3HSf93hBmcfFZXRDGQc3imb+E5ywp/sc6
 UPJ4RZUPlPuplXKNlAUHppZS+yvvltheKhNKHm2yJyOz6G5aiWPRRNa0ExHHNP5CJZ1dSS
 vApo7CpwSHKvev3wI4czexF9uSeEV+E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-ER3vT6_LPK2RKfhHlnixcg-1; Sun, 12 Feb 2023 21:29:49 -0500
X-MC-Unique: ER3vT6_LPK2RKfhHlnixcg-1
Received: by mail-wm1-f71.google.com with SMTP id
 j20-20020a05600c1c1400b003dc5dd44c0cso5417477wms.8
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:29:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0nw1KUXQEI1xmDznSZCB7Y0xnFRisWgzKRd5bzpoYs=;
 b=2uDk0JPbVLVB2SKqWm3FqQvSHORTwlOMtRbSoH7vhq69op9evM2JKmDgpJvp86HC7y
 j/BBg/4dbYAsIUBjKQZM1ICM+7jVhf4G6o840QE+uME0/qKUzX7b1YY19IcpIUQcrfi7
 4TliCi5+Cp8XfSEQ7gjRW8jwzO4z6bT3mwg8L+Szof0eBf+b7WQPWdE061QZ8HZXVhQg
 slwMvR8ixvjwTQAyB5OAxqlaN/YpyqNNcyQCbPRkR+S7YgliQ5c9qnERD3iWHftZICHv
 aRNHixce6hLHTbzoVMeEG6JZkZ39n+fQAGBwjclLJnBXPlA7TlytpshfAwtHqsF+wZfl
 m8MQ==
X-Gm-Message-State: AO0yUKUmkiXK9tFPBH0TcXUwaSug6+/Nv+S2IWChC4PpxbFrI8lBSxj0
 t9mzOJ9hQvnFvfkjEGT1t4cf8KEhY459wh/+lENHOYOL3xfxHA6HV/6UuBPVCEzOaVJnwRfOUA/
 /cFvv/dXHwVgMVgT2Lgan4mNVXMi/v8mp66EJfNFZSqXm76wf8e628dBsvKUerm6s1jshnxfk
X-Received: by 2002:a5d:54c2:0:b0:2c5:5574:5d5f with SMTP id
 x2-20020a5d54c2000000b002c555745d5fmr2753745wrv.57.1676255387500; 
 Sun, 12 Feb 2023 18:29:47 -0800 (PST)
X-Google-Smtp-Source: AK7set+IfMyiKrMVGyZxcMV28tfgSW1ky+Zg7v8is/7d+LHfzSAxPDuD2M7ITqxcYPHG9kILEX7i7g==
X-Received: by 2002:a5d:54c2:0:b0:2c5:5574:5d5f with SMTP id
 x2-20020a5d54c2000000b002c555745d5fmr2753729wrv.57.1676255387278; 
 Sun, 12 Feb 2023 18:29:47 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 h18-20020a5d4312000000b002c54d970fd8sm5217585wrq.36.2023.02.12.18.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:29:46 -0800 (PST)
From: Xxx Xx <quintela@redhat.com>
X-Google-Original-From: Xxx Xx <xxx.xx@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PULL 20/22] migration/multifd: Join all multifd threads in order to
 avoid leaks
Date: Mon, 13 Feb 2023 03:29:09 +0100
Message-Id: <20230213022911.68490-21-xxx.xx@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213022911.68490-1-xxx.xx@gmail.com>
References: <20230213022911.68490-1-xxx.xx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

From: Leonardo Bras <leobras@redhat.com>

Current approach will only join threads that are still running.

For the threads not joined, resources or private memory are always kept in
the process space and never reclaimed before process end, and this risks
serious memory leaks.

This should usually not represent a big problem, since multifd migration
is usually just ran at most a few times, and after it succeeds there is
not much to be done before exiting the process.

Yet still, it should not hurt performance to join all of them.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 3dd569d0c9..840d5814e4 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1030,8 +1030,9 @@ void multifd_load_cleanup(void)
              * however try to wakeup it without harm in cleanup phase.
              */
             qemu_sem_post(&p->sem_sync);
-            qemu_thread_join(&p->thread);
         }
+
+        qemu_thread_join(&p->thread);
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
-- 
2.39.1


