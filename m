Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACB34ECEE7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:41:30 +0200 (CEST)
Received: from localhost ([::1]:58038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZg4H-0008Rm-33
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:41:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2B-0005eX-Nz
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg28-0005Di-Qd
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648676356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QTrDs9GixbZVy8Cnd3HQuKCvJ4SqLTdPVQ5e8X7M4T0=;
 b=b8zNOp2RUbK6VD4BOC5x0bDDJgrN8/DaAj4xuWQKL7VXdXD6fAzD2dMvItFf/BPqn4uOVS
 iSxpA2HgCUDGnGw/ciJXqPy1/WjKGJHvyHSzfgvnQcpzUt4B/xlquDYjGcyS4SaKx5frpr
 2ehCjUlolOlopBq/qcMQc7TZ71Ss+Qs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-IUdjSFAnMW2EzAH6v2VEww-1; Wed, 30 Mar 2022 17:39:13 -0400
X-MC-Unique: IUdjSFAnMW2EzAH6v2VEww-1
Received: by mail-qk1-f197.google.com with SMTP id
 207-20020a3706d8000000b0067b322bef9eso13449135qkg.3
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QTrDs9GixbZVy8Cnd3HQuKCvJ4SqLTdPVQ5e8X7M4T0=;
 b=YvFRym4FyJ7Ni05bZg6bvlRbl1iPWsxRkGOFif+84yEYPW3Doookru7gp8hGGSyr0H
 2MdTSgbSi1zsT3DaE27s0kBoVZR5YR/q+x8tkH+AL3UG2CDNZfu+G6mjd3wVL0vY+o7V
 hyG4eNvyubdvGnEXOzdNvKsIxXoxNshnhGB1MHV59qVxCNwj6VMNAk7U7KFDgv0aBbw7
 4Ul6Z3VSBrxM32jIbEVMa5JrILEyKJgp4FJmjWj4zu16qs/yvnaYL+sJuWs3rGywtU0F
 GfPCqZe3tvt1vir6g+83h+NxmQlifJGx2NA0MR/dDub66rdhm/junvWHRHkC93GiT3k8
 Q3YQ==
X-Gm-Message-State: AOAM5320200I2Gdx8Y1uXu2kyyvO3RpFowQ7QpZLxxVSXSOdU9pKE+Sm
 YrS/rpyAZojEgqBt/van7QTa+RRBA9kYFHSjMg4m3NeJDXTag+1acf4broINjAHB1w5iCZ9Z6oA
 uG/dUBv+CkS8ZGyBGKckGeAadBA5wkyjrNRgciE+GLTnO1KSvdWRFyLMKqiyit33t
X-Received: by 2002:a05:620a:290f:b0:67b:3212:d529 with SMTP id
 m15-20020a05620a290f00b0067b3212d529mr1337708qkp.4.1648676352415; 
 Wed, 30 Mar 2022 14:39:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3BSz/VfXC3KelRYKO4kDVbhhSzv3RHbXcAGGeQOqvvk9+qTywMOG/AQxL5uZprNX3DCNBTg==
X-Received: by 2002:a05:620a:290f:b0:67b:3212:d529 with SMTP id
 m15-20020a05620a290f00b0067b3212d529mr1337692qkp.4.1648676352135; 
 Wed, 30 Mar 2022 14:39:12 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a16d700b0067e98304705sm11306313qkn.89.2022.03.30.14.39.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Mar 2022 14:39:11 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/19] migration: Postpone releasing MigrationState.hostname
Date: Wed, 30 Mar 2022 17:38:50 -0400
Message-Id: <20220330213908.26608-2-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330213908.26608-1-peterx@redhat.com>
References: <20220330213908.26608-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
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


