Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B32442330
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:13:04 +0100 (CET)
Received: from localhost ([::1]:47588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfY7-0001Jk-3Y
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUe-0006uR-Fz
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUa-0000aF-60
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635804563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YZFYZZ5zEoiyMjFkwTDaD6Kc9ekYQT7iiG9Yos9LPnM=;
 b=Qn9qhXotRnwBbwLmjzCtMMto2U5LxwpkSjjGEVeEWEhPSiND5Mlpnn54ojKwbNKtPi3ACN
 xEnHVfw73opWa9JppxShtcD/DIEW1/Z/ilkWdtOeObrfD2Q0FkBgaUQkW5MgebV0lDpBui
 9W8fQnjW6mDUXIJ1RXJBJ2FHhfh6kDk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-VvXcs1uQM2aak_cfQ_rjqQ-1; Mon, 01 Nov 2021 18:09:22 -0400
X-MC-Unique: VvXcs1uQM2aak_cfQ_rjqQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 a2-20020a5d4d42000000b0017b3bcf41b9so4041795wru.23
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YZFYZZ5zEoiyMjFkwTDaD6Kc9ekYQT7iiG9Yos9LPnM=;
 b=bLiQqM42CbPIMvmWzBVcZfQUDdnY2NOEZy7WBv8v11Z7DohSEFF+cDAVJndGd2GTrk
 uuKUetTUBK3SKXQIREIDip9fGJS9PMo7JaH7uwYZex+Zz8yMDi5xT3u27y4mE5vf9FA6
 aS+TK/JnJ3fUC20i+Sa6XXAa2NjSwH+/N6KSRr6eEjXexrqLSihPQdnNxO8V5UZanIYz
 KzoJY3TEJJJokdD1q5rN65AUE8DKQOHMaHFYTyZJeNmgu68Xqj2UHccNOvk7oJ+t0YkK
 r0jnZW+2i257XJEuybUWSRgtQUPOoDGid1uxLoHz8Rb5FHW7FnJrOwWbkRGLQiE1EtS5
 DBIA==
X-Gm-Message-State: AOAM531ml1BYeLw1d6lTIas2LTlz9rh/pubh9+I2tJDIDkIxNpPfdKIA
 YTg0h0zH6/U7wiN3eqVjRugOyxivwyDtFNShOwAni3rje4q6YGc5ABD1pI0fwcyzwNqrUZMzPat
 HKEWnf2Eh2uTdcFDNAe0ffAb1GoJyPP8Rpfby4Kw7vqhwob5G8VxS48Aa0GS/8Gz0h8M=
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr2002284wmc.108.1635804561272; 
 Mon, 01 Nov 2021 15:09:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxa8vqOhjEPyDeA8zcYXC8Gdajcc+LdPsZwKy493tocqfCdmTr3IvnHpn4ZYtHQE6XeYkTmSQ==
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr2002245wmc.108.1635804561097; 
 Mon, 01 Nov 2021 15:09:21 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id 126sm621666wmz.28.2021.11.01.15.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:20 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/20] migration/dirtyrate: adjust order of registering thread
Date: Mon,  1 Nov 2021 23:08:57 +0100
Message-Id: <20211101220912.10039-6-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Hyman=20Huang=28=C3=A9=C2=BB=E2=80=9E=C3=A5=E2=80=B9?=
 =?UTF-8?q?=E2=80=A1=29?= <huangy81@chinatelecom.cn>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>

registering get_dirtyrate thread in advance so that both
page-sampling and dirty-ring mode can be covered.

Signed-off-by: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>
Message-Id: <d7727581a8e86d4a42fc3eacf7f310419b9ebf7e.1624040308.git.huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/dirtyrate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index e0a27a992c..a9bdd60034 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -352,7 +352,6 @@ static void calculate_dirtyrate(struct DirtyRateConfig config)
     int64_t msec = 0;
     int64_t initial_time;
 
-    rcu_register_thread();
     rcu_read_lock();
     initial_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
     if (!record_ramblock_hash_info(&block_dinfo, config, &block_count)) {
@@ -375,7 +374,6 @@ static void calculate_dirtyrate(struct DirtyRateConfig config)
 out:
     rcu_read_unlock();
     free_ramblock_dirty_info(block_dinfo, block_count);
-    rcu_unregister_thread();
 }
 
 void *get_dirtyrate_thread(void *arg)
@@ -383,6 +381,7 @@ void *get_dirtyrate_thread(void *arg)
     struct DirtyRateConfig config = *(struct DirtyRateConfig *)arg;
     int ret;
     int64_t start_time;
+    rcu_register_thread();
 
     ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNSTARTED,
                               DIRTY_RATE_STATUS_MEASURING);
@@ -401,6 +400,8 @@ void *get_dirtyrate_thread(void *arg)
     if (ret == -1) {
         error_report("change dirtyrate state failed.");
     }
+
+    rcu_unregister_thread();
     return NULL;
 }
 
-- 
2.33.1


