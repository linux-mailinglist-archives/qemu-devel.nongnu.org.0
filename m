Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926564ECF32
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:55:58 +0200 (CEST)
Received: from localhost ([::1]:43468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZgIH-00037Q-Lu
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:55:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2P-00063z-Nz
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2M-0005H0-Sg
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648676370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OERMik/jgoqTPzyk0AcH69K8eYObqTsscfN0u+1c7yM=;
 b=IEnQ2sTrvxCSMfR1vJH/7ZRNrsG3R7nFJ+bTnIB0gDmCaFyNjDpnBGhRC3afz9jOcum4WF
 yj7qFCcHd61zgeieZ4F1VEksYbs7jACdK7U8R4LpF1E7S5Vu3jrNaX9UV9WtKXbp7ymEIf
 OacgdpCY6ykheZ9YXoEb0KAoYN2vcYY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-yLxsVD0QOY-bv2yURuYaqg-1; Wed, 30 Mar 2022 17:39:28 -0400
X-MC-Unique: yLxsVD0QOY-bv2yURuYaqg-1
Received: by mail-qv1-f69.google.com with SMTP id
 r2-20020a056214068200b00440e24889e6so17020802qvz.23
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OERMik/jgoqTPzyk0AcH69K8eYObqTsscfN0u+1c7yM=;
 b=cZpRy4+3DhRfeg8vjoXEIlRLhAk3VGyNOaPo1S+EAIpAMjhJWKhSj1aj4BPUk1NQN1
 ZG6fRwRY/nLHc9dgI1DmajUaSsoxG8NMZE6pmUToqt4EHlGkyTGaKi7wZFhJ9a4t8H7z
 XAcnt94qYiSk61D7IDFeF+xkNvoERQViOrTSMfveQfsMrtkm470ubILUKB4K4kz/1uSx
 CHvyLevjD3sibbyUB2XHHwrfNliNdXShWWgsPrssdanOZicQ9CelGm5VJ4v/NKHUGeT5
 I+UYuFYhDQkTX3sOQwPOx/4aaUkTD+RL8HyHBRjrIY+EQnUKKY7jjaNgnrKzMsxPaz+O
 iEvw==
X-Gm-Message-State: AOAM533uqeKJdUmHBnpYttQJurPJeOBEM8TAw5xb0EDoQCkN6lCwq57N
 dVQGf7PcZZ6Fk+JvlFRqfe4ax5rzTF811XA8k5Nwk1ifaYoBR3VbBemvQtTLDftLur1xnCn5Ga9
 o09nxnpcTbGNAgnzbG6TB8+oH7ld2O5d1hjZyox3MruC2yfMzMfIgGjUDRDww43iF
X-Received: by 2002:a05:620a:108f:b0:67b:465f:56ba with SMTP id
 g15-20020a05620a108f00b0067b465f56bamr1287577qkk.297.1648676367797; 
 Wed, 30 Mar 2022 14:39:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytwoLdGG9xwzhx0hJLnX1wglUWh9z2EEkg+FRBX5GjY6doSFL0aFx5dZqDBvP6/TO7sxBlsA==
X-Received: by 2002:a05:620a:108f:b0:67b:465f:56ba with SMTP id
 g15-20020a05620a108f00b0067b465f56bamr1287552qkk.297.1648676367532; 
 Wed, 30 Mar 2022 14:39:27 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a16d700b0067e98304705sm11306313qkn.89.2022.03.30.14.39.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Mar 2022 14:39:27 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/19] migration: Export tls-[creds|hostname|authz] params
 to cmdline too
Date: Wed, 30 Mar 2022 17:39:05 -0400
Message-Id: <20220330213908.26608-17-peterx@redhat.com>
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

It's useful for specifying tls credentials all in the cmdline (along with
the -object tls-creds-*), especially for debugging purpose.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 899084f993..d99a0ecb7b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4349,6 +4349,9 @@ static Property migration_properties[] = {
                       DEFAULT_MIGRATE_ANNOUNCE_STEP),
     DEFINE_PROP_BOOL("x-postcopy-preempt-break-huge", MigrationState,
                       postcopy_preempt_break_huge, true),
+    DEFINE_PROP_STRING("tls-creds", MigrationState, parameters.tls_creds),
+    DEFINE_PROP_STRING("tls-hostname", MigrationState, parameters.tls_hostname),
+    DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
 
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
-- 
2.32.0


