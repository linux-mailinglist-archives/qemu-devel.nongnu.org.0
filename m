Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF05E5A52C7
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 19:10:51 +0200 (CEST)
Received: from localhost ([::1]:39818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSiHj-0006Or-3Z
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 13:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4Z-0002d9-CE
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4X-0008G8-V6
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661792232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cC3mgjSqsxkLeKj7H0avzhkHAl95oTqWqQAf5MqmKUk=;
 b=R+vbtWr7BpbC0Z2D9rFzBheGusxCb717WrrrpntnjjHUa33mVxaCXeBAcArqjrJRFiw4IY
 /h23OxsrZ9spXMwZ5+dmoE5qaUOrYJXLoYPLMWXsYBEXxFuGWUiHDqqTd7IWgEaZGCc0pD
 xx897V5ljhbatsmPkAOSeLuZCxn2G2U=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-487-0w4yNk2BM369AmLjINyEYg-1; Mon, 29 Aug 2022 12:57:11 -0400
X-MC-Unique: 0w4yNk2BM369AmLjINyEYg-1
Received: by mail-io1-f72.google.com with SMTP id
 x9-20020a056602210900b006897b3869e4so5051027iox.16
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 09:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=cC3mgjSqsxkLeKj7H0avzhkHAl95oTqWqQAf5MqmKUk=;
 b=JXhkqqX6DW9KhQFb5goKXpep9RTV/a81plVO70D2w5wRh+aTBHDA6k20APYyraqJe8
 vav9gExmkJbj2/kErO6IWNLdgZ2hm3riosd8WccPzbQ+cyFzvlIsvt81iHGoezA3bXur
 qXKelSWTSEhbFlwhyoG/grBcaD+WdycTcCAS3/Oon9DcHwB9CHokyEJ32JViP5G8tb73
 gDlZ98qUWgTEErUKnn/g80+N0psHJDhWiXTB/NrYPnF5JzvTbryC45YbA9oiVXqiYM1v
 5beBqgnSW2AUbe8eQR/N6AgvaO0DDaPu+AHO8ATbEcvbFEe7lj99k9Ye5OY2bbBnChSX
 rM5g==
X-Gm-Message-State: ACgBeo14Oqoe06grXg4W1ytkF0sPs6FUAAycDms6BKNsveeQWkjTWoS4
 ekkINMm86ZOYbzkdkk2Sj/bvAMPlY8y6JiILPRcH47qfdb3mC3t9pALCUkRKvGSdKkWxvNiNQrx
 lukZPb08kFAKsenNdiwhld9NaOykw0zE7ZSxBtq8giUqie0eh4aobwejKzfc7f8Fh
X-Received: by 2002:a6b:5d0f:0:b0:688:6559:7a00 with SMTP id
 r15-20020a6b5d0f000000b0068865597a00mr9005444iob.42.1661792230803; 
 Mon, 29 Aug 2022 09:57:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5kqEtgNIcXipnoc3ypE8mxcYkk9943WRYI/A++IoF5+jN2Rr8Fk9QU69MwkIOxjD6Z0t/AHg==
X-Received: by 2002:a6b:5d0f:0:b0:688:6559:7a00 with SMTP id
 r15-20020a6b5d0f000000b0068865597a00mr9005432iob.42.1661792230561; 
 Mon, 29 Aug 2022 09:57:10 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a056638228900b00344c3de5ec7sm4404709jas.150.2022.08.29.09.57.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Aug 2022 09:57:10 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Subject: [PATCH RFC 05/13] migration: Disallow postcopy preempt to be used
 with compress
Date: Mon, 29 Aug 2022 12:56:51 -0400
Message-Id: <20220829165659.96046-6-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220829165659.96046-1-peterx@redhat.com>
References: <20220829165659.96046-1-peterx@redhat.com>
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

The preempt mode requires the capability to assign channel for each of the
page, while the compression logic will currently assign pages to different
compress thread/local-channel so potentially they're incompatible.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index bb8bbddfe4..844bca1ff6 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1336,6 +1336,17 @@ static bool migrate_caps_check(bool *cap_list,
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


