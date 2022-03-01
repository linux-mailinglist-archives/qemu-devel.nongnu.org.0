Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11024C871C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 09:51:11 +0100 (CET)
Received: from localhost ([::1]:48170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyDu-00048e-O5
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 03:51:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy2y-0003fM-D7
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:39:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy2w-0007uU-Ua
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646123990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WVAvZ0HPGkUtqiJCQBEwgvy+s0e8LwsA8UQ0Uhpgy1E=;
 b=UsZi9F+VdpjdKwL3Tgg6uyQyC6kXLPGutL8nWiAzre9oHhBX9diu+MUrPi+YU/1GDovqdH
 TlSt6BX3/YlfF3kuVxX5Rx+Ac4Kjvzso1xPu4TZnqqbg3PTJcDoXAlWdjThsHDxZyEXgM9
 IcAewFED5STffrja55Bp8PkuDIeId8M=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-Eq6wgeT9MtmSnpr-siMsUw-1; Tue, 01 Mar 2022 03:39:49 -0500
X-MC-Unique: Eq6wgeT9MtmSnpr-siMsUw-1
Received: by mail-pf1-f197.google.com with SMTP id
 t134-20020a62788c000000b004e1367caccaso9357265pfc.14
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:39:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WVAvZ0HPGkUtqiJCQBEwgvy+s0e8LwsA8UQ0Uhpgy1E=;
 b=AGDgiASlQxQYXx3lojUdR498sm2nZePme3VojcVsninNJfBCCSMUUW1Ks3RfKw42Nd
 s7GCqxu4KM02J+lP0T0cttEPLatOxTsfgfh023Y89iir1eHoqki/RaCa/DSWgD/u6uxv
 InQZgQ0lH6gnSbDRboXv6euNHi0EzcOdikpDTc+WCwXCkU9PDQB27zt/ih2GgYOojmG5
 tjKTiX5qfMLqnoCK9MNLM3X0z2R2+oZlFT0AQUlwNLPQNdTiJ1j+Umfi+tMoCZobS/4y
 GYl/XjyTLQK2fhp3sXXUipWErI776T8PmGst18aOOCCuaCz/SdydZFTs2hgKl6oPy1kG
 LxKw==
X-Gm-Message-State: AOAM532tMfwbYTnZA028/V4R+Dr545O926usk/i5pPINkPARWS0/jx9T
 vCQgOwNoxAHGZnrtPXWeeBS478fBk/QplrHDSFVgLOGaOVL5p7a5bUwhX8tXULfrLnmwpWwagke
 CpDCJAg63LFE9D8SYpw1yHrMqrm72ntVjctCEW7vyAZbWlz0/NdE7ddRK9f+9A2tN
X-Received: by 2002:a17:90a:10c8:b0:1bc:e369:1f2c with SMTP id
 b8-20020a17090a10c800b001bce3691f2cmr20578054pje.193.1646123988241; 
 Tue, 01 Mar 2022 00:39:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7eqSKl/oQ6mo67/dudsiE71eArMnnsBCW2n7s9UWCoR8g1COgRU1nVEswURLgYHaV9x12xQ==
X-Received: by 2002:a17:90a:10c8:b0:1bc:e369:1f2c with SMTP id
 b8-20020a17090a10c800b001bce3691f2cmr20578038pje.193.1646123987883; 
 Tue, 01 Mar 2022 00:39:47 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.39.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:39:47 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/25] migration: Dump ramblock and offset too when
 non-same-page detected
Date: Tue,  1 Mar 2022 16:39:05 +0800
Message-Id: <20220301083925.33483-6-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301083925.33483-1-peterx@redhat.com>
References: <20220301083925.33483-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In ram_load_postcopy() we'll try to detect non-same-page case and dump error.
This error is very helpful for debugging.  Adding ramblock & offset into the
error log too.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 0fc6b8e349..3a216c2340 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3707,8 +3707,12 @@ static int ram_load_postcopy(QEMUFile *f)
             } else if (tmp_page->host_addr !=
                        host_page_from_ram_block_offset(block, addr)) {
                 /* not the 1st TP within the HP */
-                error_report("Non-same host page %p/%p", tmp_page->host_addr,
-                             host_page_from_ram_block_offset(block, addr));
+                error_report("Non-same host page detected.  Target host page %p, "
+                             "received host page %p "
+                             "(rb %s offset 0x"RAM_ADDR_FMT" target_pages %d)",
+                             tmp_page->host_addr,
+                             host_page_from_ram_block_offset(block, addr),
+                             block->idstr, addr, tmp_page->target_pages);
                 ret = -EINVAL;
                 break;
             }
-- 
2.32.0


