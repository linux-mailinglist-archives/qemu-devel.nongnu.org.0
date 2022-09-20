Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C99A5BF16D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:43:46 +0200 (CEST)
Received: from localhost ([::1]:59314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamu1-0004RD-Fc
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oalsh-0006sM-4x
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:38:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oalsX-00083U-HD
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663713488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dOg7YzY/mkr3otFyOnd2Dn/gzU4N2yp13eSItCpsyek=;
 b=S8CYjqQ9WpPeC8p2At2pzX70RFW/W7xXbldFZ4vBbI6wvOq7XJ5ai+EtnQZh4hqjKDIwh5
 MhQvaX1sH36c3rMou1ej0/uqoWlJdtBVHst60xptqQCexa35wlVe2URBoNW3Re49v+p/Do
 NvFPwxXUVClPYa2rwNEE4wuJHLHnpZs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-qB9oTsFVNJincN832VpdGQ-1; Tue, 20 Sep 2022 18:38:07 -0400
X-MC-Unique: qB9oTsFVNJincN832VpdGQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 v15-20020a05620a0f0f00b006ceab647023so3086474qkl.13
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 15:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=dOg7YzY/mkr3otFyOnd2Dn/gzU4N2yp13eSItCpsyek=;
 b=LI+ZBVqGNIUf5rdNk2ZHEMd6N0cSsoHM1Q+q2WjbOpZ4WyTYYalaXgYdAhvUbvjx/a
 23BihNxgRacCc5fWZytQrWlsALVYla1XBhoYje1j7zimdfuG7mFlagBJa4JuQ/Z5eAfj
 sbsZB8lMWXKj/BBoGwps4MPgAhbaAx0KpYj7FH9HGL4mPbUXHBqp69r9DVUAfSbEwIlB
 sfXye2ISNP56JUi7GXGimm72aTMfy9Rk3sz5y08gL3Utz7qsbewR0dRMyJQD4WjAtFzA
 5ENBZyKcDugZv0TWddjot6bFLQDCCmZ+smkuLGIT9z1nnWALLlQ759gil83z1RbklNj9
 yRKg==
X-Gm-Message-State: ACrzQf1Y7VtpbsqeFVsqpq54tMXOoyYKZuOie3yGOF1J273sL1A8az01
 OvMlkPGN9dhzg12WJDS0uT8Gf0Lsr5J5DELPwA9hkrXjwWVrZXRiiRstQKNDhbbWvxf/qpsFtmW
 6fDX38AypWuOmkNHMXkn715E2+JiZmBHpkcBPHV6qlWBLE2Q+xGl9Q4ZIX8Yq9vSa
X-Received: by 2002:a05:622a:54d:b0:35c:f693:d754 with SMTP id
 m13-20020a05622a054d00b0035cf693d754mr6056042qtx.181.1663713487194; 
 Tue, 20 Sep 2022 15:38:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Kp849JM4xPq/fx4/0T/b3iS1FvDj9Sl/auChUiwOdgYDmYnP7WJ5o+6R0vjUzjjRrb4IflQ==
X-Received: by 2002:a05:622a:54d:b0:35c:f693:d754 with SMTP id
 m13-20020a05622a054d00b0035cf693d754mr6056023qtx.181.1663713486937; 
 Tue, 20 Sep 2022 15:38:06 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 de4-20020a05620a370400b006bbb07ebd83sm697499qkb.108.2022.09.20.15.38.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Sep 2022 15:38:06 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH 4/5] migration: Disallow postcopy preempt to be used with
 compress
Date: Tue, 20 Sep 2022 18:37:59 -0400
Message-Id: <20220920223800.47467-5-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220920223800.47467-1-peterx@redhat.com>
References: <20220920223800.47467-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

The preempt mode requires the capability to assign channel for each of the
page, while the compression logic will currently assign pages to different
compress thread/local-channel so potentially they're incompatible.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index fb4066dfb4..07c74a79a2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1341,6 +1341,17 @@ static bool migrate_caps_check(bool *cap_list,
             error_setg(errp, "Postcopy preempt requires postcopy-ram");
             return false;
         }
+
+        /*
+         * Preempt mode requires urgent pages to be sent in separate
+         * channel, OTOH compression logic will disorder all pages into
+         * different compression channels, which is not compatible with the
+         * preempt assumptions on channel assignments.
+         */
+        if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
+            error_setg(errp, "Postcopy preempt not compatible with compress");
+            return false;
+        }
     }
 
     return true;
-- 
2.32.0


