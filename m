Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032D2526E60
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 09:08:33 +0200 (CEST)
Received: from localhost ([::1]:54432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nplt7-0000A1-SJ
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 03:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nplbb-0008BQ-2o
 for qemu-devel@nongnu.org; Sat, 14 May 2022 02:50:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nplbY-0007fT-9y
 for qemu-devel@nongnu.org; Sat, 14 May 2022 02:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652511019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FEUjVCbP7E9+0iLTdLAwCl6ilV5z1Ymdz2a6B1RFVzE=;
 b=B30DE5gg07iM0A2Fp5jivjiwYefoiFO5DWkigfVua8hT9j/1pp7nLKETWAUtZ43uBw8noC
 nVJLgzBR+55WILfu36XB75xJMAKtajoWPozXeQCLK7FLfmzFAWCecd4Lk+pHbHRflWr+Sn
 h7MRdZhlcRBBHlfik2xYhdhU4QKssU0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-QFphSwiCO_ul-46whtrJxw-1; Sat, 14 May 2022 02:50:18 -0400
X-MC-Unique: QFphSwiCO_ul-46whtrJxw-1
Received: by mail-wm1-f72.google.com with SMTP id
 h6-20020a7bc926000000b0039470bcb9easo3856420wml.1
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 23:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FEUjVCbP7E9+0iLTdLAwCl6ilV5z1Ymdz2a6B1RFVzE=;
 b=FwXOAfuKzanvKN9cXT7966yZzl0s6MGnbaMBodeJoa2HGTxVonrMljY06pCDL4+zeM
 8fgOq3IM5TIe85AiPprY01u8vlHNy6pQWSgifrDV6ZDejCniG7I8+g4OY43ZtJhtguWZ
 votLeA11SFduUci4F0cFzOq02m+oJOBtXTGls4BuhfuoKbXrz3/Vv7nPNrZFDZxhgd1G
 iPfdNWIQX3C2pdZagwEq5Ap0C/xywN8BhBHUIu780NTbMIe+AfqJTCwRtP5rbp3gbRFQ
 cmB2mid4l6079sLQO6mEWtB0/g3oKKfStoIegMl9tvS68QY4E3GYb+UKwKvb9bBzT2B7
 oezA==
X-Gm-Message-State: AOAM531bJaoeBIAeefDsZR3aClKxnY6jhx4ZKf44mjU0u22ISKIg4PpT
 O2IwVgX7q4FEwMrSVkOGcxy9WpU+cI5DhLs4Z3CRKywGo8J5fpw0pW8UWb3C+lyEVoH96kM/ynQ
 L7ZBlZFbriuwqZ1hQPa78yC79V6piUevXQ/2mU+76ny+QozrTjk1UAPJ70iaQKF8nAlo=
X-Received: by 2002:a05:6000:38b:b0:20c:53af:747d with SMTP id
 u11-20020a056000038b00b0020c53af747dmr6540628wrf.22.1652511017032; 
 Fri, 13 May 2022 23:50:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvfJ822hbg6rnyGOARRrMbPSjySxb4bbLEu26XdrixLVS5JoUT5VTYLu5dFcbBqg2cLw88rA==
X-Received: by 2002:a05:6000:38b:b0:20c:53af:747d with SMTP id
 u11-20020a056000038b00b0020c53af747dmr6540615wrf.22.1652511016774; 
 Fri, 13 May 2022 23:50:16 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adfa70d000000b0020c5253d8bfsm4091945wrd.11.2022.05.13.23.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 23:50:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	nsaenzju@redhat.com
Subject: [PATCH v3 1/3] thread-pool: optimize scheduling of completion bottom
 half
Date: Sat, 14 May 2022 08:50:10 +0200
Message-Id: <20220514065012.1149539-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220514065012.1149539-1-pbonzini@redhat.com>
References: <20220514065012.1149539-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The completion bottom half was scheduled within the pool->lock
critical section.  That actually results in worse performance,
because the worker thread can run its own small critical section
and go to sleep before the bottom half starts running.

Note that this simple change does not produce an improvement without
changing the thread pool QemuSemaphore to a condition variable.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/thread-pool.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/util/thread-pool.c b/util/thread-pool.c
index 196835b4d3..4979f30ca3 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -127,9 +127,8 @@ static void *worker_thread(void *opaque)
         smp_wmb();
         req->state = THREAD_DONE;
 
-        qemu_mutex_lock(&pool->lock);
-
         qemu_bh_schedule(pool->completion_bh);
+        qemu_mutex_lock(&pool->lock);
     }
 
     pool->cur_threads--;
-- 
2.36.0


