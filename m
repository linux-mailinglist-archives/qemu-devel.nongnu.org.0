Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251D15BF1B7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:08:10 +0200 (CEST)
Received: from localhost ([::1]:34276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oanHd-00067l-9a
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oalsq-0007NG-9W
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:38:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oalsX-00083N-9V
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663713487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0XVf+orfGCsPIiWN3l0aR530llnvOFKGwsBNJGUsUSI=;
 b=bJtkPYAESGXqlVjsFh3AWrX33swsITEark32m3zv4gLZaO69j+Zm/5GxemKtdby1aNbxcF
 GPO6ynx5F9wVWlRAgC0CGDCPUJgSGPMkd1uvBqHzO7nnq6mGed0ft9ziXy2LT4HSj24zGf
 WAcKIvYar7iZN3bLyUcgGnAvuMS/UYQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-548-mkFGLCNkPc6eO6Pg82KBYA-1; Tue, 20 Sep 2022 18:38:06 -0400
X-MC-Unique: mkFGLCNkPc6eO6Pg82KBYA-1
Received: by mail-qv1-f70.google.com with SMTP id
 g4-20020ad45424000000b004a9bb302c85so3034406qvt.22
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 15:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0XVf+orfGCsPIiWN3l0aR530llnvOFKGwsBNJGUsUSI=;
 b=soxpbwsH155PoyDev5cD1Xil2hDFVTNhVfwwSOzLFt1W0jPMdO4JkXnyDA3EctwzW8
 wFThAIJlgfpMKRASj2hUfvRd/wTrbeuKMcbo6hZM2ysE8hnXZVnOPCOYnZoP5Uz+07zE
 +n8QgnNCwWOfIRKukE5UmZR0IfwfZlxKAUWhNG4EpUo2tCup0/3+SOIDUfV9DPchubxV
 Uj8d1/clqMwtglbIMny0w5JggVoo9iJzQxL301dLoVQVOjY91Y2G2xFo9kzgE/ja1lmV
 szUOPsERowlcyKyMKiupSfJ/4WfY37ppooh3BdHcrm9FFIXL5LLNx+jeteLw46q+wxEg
 N+rQ==
X-Gm-Message-State: ACrzQf3drZe+a4q7rIuFTGpCifnZMXsgewAC+1WKVkCQyYybyjiR2qTj
 8i3yugeyPjnrgPZoRVbMFoQppg3mbX164S08V87QDWzB2JQRoKzmgR0N9A1kYJHlGnXU3clHD+B
 3ns6wQrf0DjyCXV7NmgpjVzYacsOQvsOtwugd7jKVziiieL8JcGA2WFB5ojju72wq
X-Received: by 2002:a05:6214:2528:b0:4ad:6fa4:4170 with SMTP id
 gg8-20020a056214252800b004ad6fa44170mr231182qvb.113.1663713485943; 
 Tue, 20 Sep 2022 15:38:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7S5uDSbODjLRlC56UDvQ+11TjV2SXEk0XrBH7zFpVkrcntQtGcRYToGgJouXj0XadmWpEugg==
X-Received: by 2002:a05:6214:2528:b0:4ad:6fa4:4170 with SMTP id
 gg8-20020a056214252800b004ad6fa44170mr231167qvb.113.1663713485685; 
 Tue, 20 Sep 2022 15:38:05 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 de4-20020a05620a370400b006bbb07ebd83sm697499qkb.108.2022.09.20.15.38.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Sep 2022 15:38:05 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH 3/5] migration: Disallow xbzrle with postcopy
Date: Tue, 20 Sep 2022 18:37:58 -0400
Message-Id: <20220920223800.47467-4-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220920223800.47467-1-peterx@redhat.com>
References: <20220920223800.47467-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

It's not supported since the 1st day, as ram_load_postcopy does not handle
RAM_SAVE_FLAG_XBZRLE.  Mark it disabled explicitly.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index bb8bbddfe4..fb4066dfb4 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1268,6 +1268,11 @@ static bool migrate_caps_check(bool *cap_list,
             error_setg(errp, "Postcopy is not compatible with ignore-shared");
             return false;
         }
+
+        if (cap_list[MIGRATION_CAPABILITY_XBZRLE]) {
+            error_setg(errp, "Postcopy is not compatible with xbzrle");
+            return false;
+        }
     }
 
     if (cap_list[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
-- 
2.32.0


