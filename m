Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C5B3B77A8
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 20:16:34 +0200 (CEST)
Received: from localhost ([::1]:49782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyIHh-00048j-JR
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 14:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lyIFT-0001q8-TP
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:14:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lyIFI-0000CO-Ul
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624990444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6pg2XXBFsFzwkpGREQ0RgGr3yFOebYTPaHqf4j5+1oI=;
 b=fGD1CxjztdIhwVgrBhcJ/BWYFaseSMvf5f7dpIykza2j9xE6fKYqYf0p65AMXOI7k4Dfq2
 ztoE1S/y8OKISBgMlU8Mn/xFqcNy8E3MKQxS0ET2tAp8d28Fcxdl/hBLzNEEe69/25nfPN
 C42yEnDlYRFUGsdJD4xajJuJ2bupT0g=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-BncJ1r40O92TeUnn8uiIeA-1; Tue, 29 Jun 2021 14:14:03 -0400
X-MC-Unique: BncJ1r40O92TeUnn8uiIeA-1
Received: by mail-il1-f199.google.com with SMTP id
 s18-20020a92cbd20000b02901bb78581beaso50071ilq.12
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6pg2XXBFsFzwkpGREQ0RgGr3yFOebYTPaHqf4j5+1oI=;
 b=oNLACSXWm0C3WYiuthCHMUuWvfVJb2WRnFcZIlXZJ5vQ47bak3vp5o2bgWtzP/3JDT
 8jrcVw/fUsZV1f0JehIiBwAuofVC6JUS2wxzCM3MKUy3GNPRPK6LvmFIijt2giIM4EJ1
 bCxxdUMw+cBLSimIm4yuk+Z5aSZcx8u8VEf3CNu3sb5yCQXsTYsSG0nToJyzeB5TcVeJ
 xnsTzN64CAmzUDTSD9sqk7x/myedL+apPwq4F9OCPL5TyhmjmGAT2V53yun9p2f4mjcK
 Smo7dO2UQKm6WJAlZ6oMXlOAxcPxf9ikstu9aW4RmnMXp392qhH0GZQZcTtvgEh+lmyv
 DbXw==
X-Gm-Message-State: AOAM5323zUPiXSEbKj6xzvunB5bcR/mn6GeY+N25GJIP/zEWFWRh2WQ6
 Zlwfkqn/5IhOq9QyZSfFuAo1jJ8Upf98HeT0Pyf9hw+qlYh+LkOQu/nRrN608lx+OEjgPweO+qt
 uMhuJmKjQ8z0W8VIPeSQpdj8vx3lAHEKamHl+nUB1GRRdlkgTgHceefujnt/IMAe9
X-Received: by 2002:a05:6e02:1b8f:: with SMTP id
 h15mr23735198ili.151.1624990441998; 
 Tue, 29 Jun 2021 11:14:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLd0bBIKuAfwq68hCd/CqVuVZ9rXw8Pzsg8yfSuCjma0nikEutB6XTQvfYb+J1xB7E8Ei/Hw==
X-Received: by 2002:a05:6e02:1b8f:: with SMTP id
 h15mr23735179ili.151.1624990441814; 
 Tue, 29 Jun 2021 11:14:01 -0700 (PDT)
Received: from t490s.redhat.com
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id i6sm4436824ilm.85.2021.06.29.11.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:14:01 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] migration: Allow reset of postcopy_recover_triggered when
 failed
Date: Tue, 29 Jun 2021 14:13:56 -0400
Message-Id: <20210629181356.217312-3-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629181356.217312-1-peterx@redhat.com>
References: <20210629181356.217312-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peterx@redhat.com, Lukas Straub <lukasstraub2@web.de>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's possible qemu_start_incoming_migration() failed at any point, when it
happens we should reset postcopy_recover_triggered to false so that the user
can still retry with a saner incoming port.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 1bb03d1eca..fcca289ef7 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2097,6 +2097,13 @@ void qmp_migrate_recover(const char *uri, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
 
+    /*
+     * Don't even bother to use ERRP_GUARD() as it _must_ always be set by
+     * callers (no one should ignore a recover failure); if there is, it's a
+     * programming error.
+     */
+    assert(errp);
+
     if (mis->state != MIGRATION_STATUS_POSTCOPY_PAUSED) {
         error_setg(errp, "Migrate recover can only be run "
                    "when postcopy is paused.");
@@ -2115,6 +2122,12 @@ void qmp_migrate_recover(const char *uri, Error **errp)
      * to continue using that newly established channel.
      */
     qemu_start_incoming_migration(uri, errp);
+
+    /* Safe to dereference with the assert above */
+    if (*errp) {
+        /* Reset the flag so user could still retry */
+        qatomic_set(&mis->postcopy_recover_triggered, false);
+    }
 }
 
 void qmp_migrate_pause(Error **errp)
-- 
2.31.1


