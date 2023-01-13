Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D854669E85
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:47:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMoo-0006nY-Q9; Fri, 13 Jan 2023 11:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pGMom-0006gl-0G
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:22:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pGMoj-0005mk-GT
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:22:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673626928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7TzEFAxcv2PQvpAb3thNAe0/ZFRqlJRdD22F8VbnDMU=;
 b=VLLfJEWPVViEklHzZHVB/ebDYPc5rjtU08KzYhwQOWbkApRjDu4EgUT1I0cTAMTxIrGhfe
 6d/4r2BNESyTe7J1U/WPYPuvnDMdl6L1dueO8iQcJ0jm+iBDzH+06JESX5P2GrhlF7Y7sz
 Vf6jR4AfZptcwaQzlpX1XdBveW/f2iA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-_4Fo9XqrM-atXzU2U2gbZw-1; Fri, 13 Jan 2023 11:22:03 -0500
X-MC-Unique: _4Fo9XqrM-atXzU2U2gbZw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2A6A100F909;
 Fri, 13 Jan 2023 16:22:02 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9059440C2008;
 Fri, 13 Jan 2023 16:22:02 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 3/9] audio: remove unused 'name' in QEMUSoundCard struct
Date: Fri, 13 Jan 2023 11:21:54 -0500
Message-Id: <20230113162200.3010804-4-berrange@redhat.com>
In-Reply-To: <20230113162200.3010804-1-berrange@redhat.com>
References: <20230113162200.3010804-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 audio/audio.c | 2 --
 audio/audio.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index f397072a1f..94a16c2dda 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1833,7 +1833,6 @@ void AUD_register_card (const char *name, QEMUSoundCard *card)
         card->state = audio_init(NULL, name);
     }
 
-    card->name = g_strdup (name);
     memset (&card->entries, 0, sizeof (card->entries));
     QLIST_INSERT_HEAD(&card->state->card_head, card, entries);
 }
@@ -1841,7 +1840,6 @@ void AUD_register_card (const char *name, QEMUSoundCard *card)
 void AUD_remove_card (QEMUSoundCard *card)
 {
     QLIST_REMOVE (card, entries);
-    g_free (card->name);
 }
 
 static struct audio_pcm_ops capture_pcm_ops;
diff --git a/audio/audio.h b/audio/audio.h
index 01bdc567fb..eefb809a54 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -82,7 +82,6 @@ typedef struct SWVoiceIn SWVoiceIn;
 
 typedef struct AudioState AudioState;
 typedef struct QEMUSoundCard {
-    char *name;
     AudioState *state;
     QLIST_ENTRY (QEMUSoundCard) entries;
 } QEMUSoundCard;
-- 
2.38.1


