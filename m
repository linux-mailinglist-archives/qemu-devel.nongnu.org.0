Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F57C693C56
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:31:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROb8-0001Zp-BI; Sun, 12 Feb 2023 21:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROb6-0001ZK-Vx
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROb5-000358-Fr
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676255378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x9OoujK3z66uinkW5o8sulP0PBTebtU4f6y178F9c/w=;
 b=cbCtnHfQe2nmbdn9BhihHuB+0mdDcS3r1hBwq6XmUTrGJECYCd48t5MYkBRmGpGH5vhBDN
 /HpQFk5kTXiLxN9bXwC07AFhNOPQZioAw3R66PzhHTfp3cDaSx5FAA2egUXDMp38nfx3Cl
 l0WGoo/kBrML1G9oeT8N2Ultp7XKgsk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-281-RTe50vzsPPuB0-LGGk4lSg-1; Sun, 12 Feb 2023 21:29:30 -0500
X-MC-Unique: RTe50vzsPPuB0-LGGk4lSg-1
Received: by mail-wr1-f69.google.com with SMTP id
 i4-20020a5d5224000000b002c559840c76so63752wra.3
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:29:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x9OoujK3z66uinkW5o8sulP0PBTebtU4f6y178F9c/w=;
 b=XG2Mempcas7sn/Vu5xIhWC4bSED1ET7ae90CTcdpgIbOjHEeylyoWmd2qtZ5Dl1fr7
 UVOhsq2xUzSB4eZ7V7d0xkMlUY0NLN50tVBjTr0t/268rj4gPUKRRpki6Jn597jPOApr
 3s7FTmJjKxu45BKhub1b8vuNTbunYRwoxz9GD8zBCcHMZwguNunqbghULBqkXQYTz+N4
 50HvJS74cEDFiyBMA83mekSfFYGcH+X6C2IG1c9dAYLjGPVY8CMmjS1/gMsoX+0yei++
 MvTrUxOT6rPVDUrCE7TmlvRWOICYQzfhvPp3Nk0e5aKPDJU/2ke6vdh793a/lvCs5JuP
 3UwA==
X-Gm-Message-State: AO0yUKUmS+ZF56Hfttouvn2qMaZh5p8K/0VwtuYRIEZUF0G/NHSB0+Xy
 dqRDRUH8T56LSEQGJGsmsiG4ft7bkdH+sMCXrjfhTCzabYH21r9K3htMUDLG8zZjZUz3DzT40qH
 4AOgxXN9ZAdWbw5GzNJ625V5fIm8fIa5FDxm4Pc1u2wvBSIYqW3mkrKtmzkSFX8oZJLOh1gja
X-Received: by 2002:adf:dc04:0:b0:2c3:ea92:3494 with SMTP id
 t4-20020adfdc04000000b002c3ea923494mr18343390wri.55.1676255368416; 
 Sun, 12 Feb 2023 18:29:28 -0800 (PST)
X-Google-Smtp-Source: AK7set+I1g+CjQEsCE9I+sUqcpmuWn8GMN5Pg5a9hM8lnrQcitUKUf6RFY2A0VQFHTwHB+L4NfTg3g==
X-Received: by 2002:adf:dc04:0:b0:2c3:ea92:3494 with SMTP id
 t4-20020adfdc04000000b002c3ea923494mr18343372wri.55.1676255368146; 
 Sun, 12 Feb 2023 18:29:28 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 a7-20020a056000050700b002c3e3ee7d1asm9338278wrf.79.2023.02.12.18.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:29:27 -0800 (PST)
From: Xxx Xx <quintela@redhat.com>
X-Google-Original-From: Xxx Xx <xxx.xx@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 09/22] migration: Calculate ram size once
Date: Mon, 13 Feb 2023 03:28:58 +0100
Message-Id: <20230213022911.68490-10-xxx.xx@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213022911.68490-1-xxx.xx@gmail.com>
References: <20230213022911.68490-1-xxx.xx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

From: Juan Quintela <quintela@redhat.com>

We are recalculating ram size continously, when we know that it don't
change during migration.  Create a field in RAMState to track it.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 migration/ram.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 1727fe5ef6..6abfe075f2 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -330,6 +330,8 @@ struct RAMState {
     PageSearchStatus pss[RAM_CHANNEL_MAX];
     /* UFFD file descriptor, used in 'write-tracking' migration */
     int uffdio_fd;
+    /* total ram size in bytes */
+    uint64_t ram_bytes_total;
     /* Last block that we have visited searching for dirty pages */
     RAMBlock *last_seen_block;
     /* Last dirty target page we have sent */
@@ -2546,7 +2548,7 @@ static int ram_find_and_save_block(RAMState *rs)
     int pages = 0;
 
     /* No dirty page as there is zero RAM */
-    if (!ram_bytes_total()) {
+    if (!rs->ram_bytes_total) {
         return pages;
     }
 
@@ -3009,13 +3011,14 @@ static int ram_state_init(RAMState **rsp)
     qemu_mutex_init(&(*rsp)->bitmap_mutex);
     qemu_mutex_init(&(*rsp)->src_page_req_mutex);
     QSIMPLEQ_INIT(&(*rsp)->src_page_requests);
+    (*rsp)->ram_bytes_total = ram_bytes_total();
 
     /*
      * Count the total number of pages used by ram blocks not including any
      * gaps due to alignment or unplugs.
      * This must match with the initial values of dirty bitmap.
      */
-    (*rsp)->migration_dirty_pages = ram_bytes_total() >> TARGET_PAGE_BITS;
+    (*rsp)->migration_dirty_pages = (*rsp)->ram_bytes_total >> TARGET_PAGE_BITS;
     ram_state_reset(*rsp);
 
     return 0;
-- 
2.39.1


