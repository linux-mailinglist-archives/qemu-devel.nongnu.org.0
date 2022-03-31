Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2C54EDCB9
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:24:08 +0200 (CEST)
Received: from localhost ([::1]:53294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwed-0007yP-GV
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:24:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwR6-0004VJ-Et
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:10:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwR4-0001eI-TC
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648739406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QTrDs9GixbZVy8Cnd3HQuKCvJ4SqLTdPVQ5e8X7M4T0=;
 b=KBvWnWH7fgVtMEd9vZ4miuBd7DykDT3e0WaZ1+wGJCyGLPrl0w0rkKSpSR3WYgF/CEWGeY
 xNdiHDNEQLG6vUWMu3lz4YLGq+DGYgs3gTMJ+R9D7GESMb5d9BFXNJQMNy08Nl9ulefIxs
 DC8OxgJIiaF+R2iW1znBQxDjeDcBWPc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-aLZGbjS_O1STRBPYU66AuA-1; Thu, 31 Mar 2022 11:09:00 -0400
X-MC-Unique: aLZGbjS_O1STRBPYU66AuA-1
Received: by mail-qv1-f71.google.com with SMTP id
 z1-20020ad44781000000b00440ded04b09so18735670qvy.22
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QTrDs9GixbZVy8Cnd3HQuKCvJ4SqLTdPVQ5e8X7M4T0=;
 b=q2Cawh/ULxa8gA68DWeedQy4MBrksRN7k+k8vAhk3xVtyQX6yd3C9Dnt2coDisBAmV
 Q7tZa9G86t3mH5iy9RGaor5t/Dj7di2dwUERzGsMGNojd26WunWtRgBwHs/F+gqKbsSd
 jzkDaiIKoWd0sTZcbZXfkzBeH/jjWZnoArUVcz4CSprylAzEdqmP6hmSTAt6CHAlFScF
 JB8xEY3k17zCIN0wZksVN4B1WaDYEvL9zNVO8vz34PcyxiSpwgULo468lsR1HbRtyldF
 /2FLYTWH8ncCE/2HLsxtzF2+0+6SbQUi8XDgEVrCrMW5DQd9h7PNFt9nqy9+hsRFj4pC
 wU5Q==
X-Gm-Message-State: AOAM532mqR5i4q7nBJz109EJqDvXc3PSfne3AOCZA301WAsPxCCetYJf
 OEI6rHbKa/AbuByuZFPb3ZBh9wdf8ABIwMWWz9PgdbuZ+FZbhYnUJMTvIs6yrvMIXtYZN+FzqGG
 Ov7Ku8ucxUawlhaUiGZfOWAeDXuHdz7QnZoHUI9I/msB5FgV4p4E4bz28b3SB68b2
X-Received: by 2002:a05:6214:4017:b0:440:d478:c167 with SMTP id
 kd23-20020a056214401700b00440d478c167mr4515234qvb.79.1648739339979; 
 Thu, 31 Mar 2022 08:08:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSicRRFPsc6xixqGWuDZeyyTC8jhMHugUR7ViWnyHFbuTtpMUY3BOWyPaSEYrvsrrTO4oYwg==
X-Received: by 2002:a05:6214:4017:b0:440:d478:c167 with SMTP id
 kd23-20020a056214401700b00440d478c167mr4515192qvb.79.1648739339531; 
 Thu, 31 Mar 2022 08:08:59 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 21-20020ac85715000000b002e1ce9605ffsm20246871qtw.65.2022.03.31.08.08.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Mar 2022 08:08:59 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/19] migration: Postpone releasing MigrationState.hostname
Date: Thu, 31 Mar 2022 11:08:39 -0400
Message-Id: <20220331150857.74406-2-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331150857.74406-1-peterx@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We used to release it right after migrate_fd_connect().  That's not good
enough when there're more than one socket pair required, because it'll be
needed to establish TLS connection for the rest channels.

One example is multifd, where we copied over the hostname for each channel
but that's actually not needed.

Keeping the hostname until the cleanup phase of migration.

Cc: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/channel.c   | 1 -
 migration/migration.c | 5 +++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/migration/channel.c b/migration/channel.c
index c4fc000a1a..c6a8dcf1d7 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -96,6 +96,5 @@ void migration_channel_connect(MigrationState *s,
         }
     }
     migrate_fd_connect(s, error);
-    g_free(s->hostname);
     error_free(error);
 }
diff --git a/migration/migration.c b/migration/migration.c
index 695f0f2900..281d33326b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1809,6 +1809,11 @@ static void migrate_fd_cleanup(MigrationState *s)
     qemu_bh_delete(s->cleanup_bh);
     s->cleanup_bh = NULL;
 
+    if (s->hostname) {
+        g_free(s->hostname);
+        s->hostname = NULL;
+    }
+
     qemu_savevm_state_cleanup();
 
     if (s->to_dst_file) {
-- 
2.32.0


