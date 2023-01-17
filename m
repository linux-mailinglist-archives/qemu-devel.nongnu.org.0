Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD87670B51
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:10:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu9h-0002C7-Kq; Tue, 17 Jan 2023 17:10:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9e-00022E-EK
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:10:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9c-0007cZ-92
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:10:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6A9Htc+Z2aHcoCigPArM3A4fI1fi4lE0wvMzM8VmSJE=;
 b=NBySccfOQQYGlJm0SpalF9xhRFemPPDtN2Nus6EUUWL31Q1dTuipMPJa+PESI+jyD5H6+z
 Skq6ssn5+7DFOCERMIIYTHXiu0F//j6zCHdUa1tyh14MJ2764pDWzUlEBg77B6iN/5UtZw
 eniV6mXelXAbN6xR8NswKyZ/sQhnObY=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-6XYlK0yjMzqI1Pf-R7FBXg-1; Tue, 17 Jan 2023 17:10:01 -0500
X-MC-Unique: 6XYlK0yjMzqI1Pf-R7FBXg-1
Received: by mail-vk1-f199.google.com with SMTP id
 o85-20020a1f2858000000b003d5eb4cc1e6so9532744vko.2
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:10:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6A9Htc+Z2aHcoCigPArM3A4fI1fi4lE0wvMzM8VmSJE=;
 b=pnDpxDnJxQvO4cDgSI1Jf5A8yB7TxOqrtE+Ds+XKOADrQz01QDRS2gzb+bj963nCDR
 m9OCe/F5HXDyvSql1NwjrMfOuxG5nTT+FKgz/OKhMh7Zd9YFQUK1YvtlQzPf0gjeEIqm
 vUG4p57QvTCsD/w7V5WwVQgHeinw95nM8Ki74In/wDDeCuoO/XDzIuawDLyq5yR9/RE9
 ZnqwAJN9ESEcz0tAdKF4IW/TKsfZl5ugdblG4hqKqfG7TJcEQvIzQyfqgXRZy2kHfbWD
 nGhMdk2iR99tGxZkTnasBiYMEMu+VIgJ1vr8V7vl/l29JP8kQSXGESBQffUgGVC3utXz
 ofrw==
X-Gm-Message-State: AFqh2krzE0lJgEOUSDj8SgjZIsewqNXz0G0bTObe8ryWXK/GvZclbhBg
 UnMrugYcri+r2fWAg5WUYJjJQxhZyOkSgMwAXh918O9DGtPWei3hpz1zBETlUdLR2FoEmTAxaIn
 L/rZqEWmkLovNjO9EZZ3Np5uYM279TX5E3Z5pTldXORYuFul4dIfYv4JuVw3pwJPE
X-Received: by 2002:a1f:ad4e:0:b0:3d1:ca4:ddeb with SMTP id
 w75-20020a1fad4e000000b003d10ca4ddebmr2635785vke.6.1673993400029; 
 Tue, 17 Jan 2023 14:10:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvuKtccrQPnGQCdL6FMlATKT6ZxY1cEzCxiYY5nk1zDP68LAxq+2TqCCocSzDQWsakoYzYbpQ==
X-Received: by 2002:a1f:ad4e:0:b0:3d1:ca4:ddeb with SMTP id
 w75-20020a1fad4e000000b003d10ca4ddebmr2635750vke.6.1673993399562; 
 Tue, 17 Jan 2023 14:09:59 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:09:57 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 16/21] migration: Enable doublemap with MADV_SPLIT
Date: Tue, 17 Jan 2023 17:09:09 -0500
Message-Id: <20230117220914.2062125-17-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230117220914.2062125-1-peterx@redhat.com>
References: <20230117220914.2062125-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

MADV_SPLIT enables doublemap on hugetlb.  Do that if doublemap=true
specified for the migration.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/postcopy-ram.c | 16 ++++++++++++++++
 migration/ram.c          | 18 ++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 86ff73c2c0..dbc7e54e4a 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -694,6 +694,22 @@ static int ram_block_enable_notify(RAMBlock *rb, void *opaque)
      */
     reg_struct.mode = UFFDIO_REGISTER_MODE_MISSING;
     if (minor_fault) {
+        /*
+         * MADV_SPLIT implicitly enables doublemap mode for hugetlb.  If
+         * that fails (e.g. on old kernels) we need to fail the migration.
+         *
+         * It's a bit late to fail here as we could have migrated lots of
+         * pages in precopy, but early failure will require us to allocate
+         * hugetlb pages secretly in QEMU which is not friendly to admins
+         * and it may affect the global hugetlb pool.  Considering it is
+         * normally always limited, keep the failure late but tolerable.
+         */
+        if (qemu_madvise(qemu_ram_get_host_addr(rb), rb->postcopy_length,
+                         QEMU_MADV_SPLIT)) {
+            error_report("%s: madvise(MADV_SPLIT) failed (ret=%d) but "
+                         "required for doublemap.", __func__, -errno);
+            return -1;
+        }
         reg_struct.mode |= UFFDIO_REGISTER_MODE_MINOR;
     }
 
diff --git a/migration/ram.c b/migration/ram.c
index 37d7b3553a..4d786f4b97 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3891,6 +3891,19 @@ static int migrate_hugetlb_doublemap_init(void)
 
     RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
         if (qemu_ram_is_hugetlb(rb)) {
+            /*
+             * MADV_SPLIT implicitly enables doublemap mode for hugetlb on
+             * the guest mapped ranges.  If that fails (e.g. on old
+             * kernels) we need to fail the migration.  Note, the
+             * host_mirror mapping below can be kept as hugely mapped.
+             */
+            if (qemu_madvise(qemu_ram_get_host_addr(rb), rb->mmap_length,
+                             QEMU_MADV_SPLIT)) {
+                error_report("%s: madvise(MADV_SPLIT) required for doublemap",
+                             __func__);
+                return -1;
+            }
+
             /*
              * Firstly, we remap the same ramblock into another range of
              * virtual address, so that we can write to the pages without
@@ -3898,6 +3911,11 @@ static int migrate_hugetlb_doublemap_init(void)
              */
             addr = ramblock_file_map(rb);
             if (addr == MAP_FAILED) {
+                /*
+                 * No need to undo MADV_SPLIT because this is dest node and
+                 * we're going to bail out anyway.  Leave that for mm exit
+                 * to clean things up.
+                 */
                 ret = -errno;
                 error_report("%s: Duplicate mapping for hugetlb ramblock '%s'"
                              "failed: %s", __func__, qemu_ram_get_idstr(rb),
-- 
2.37.3


