Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB2748B79C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 20:47:09 +0100 (CET)
Received: from localhost ([::1]:40862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7N6q-0003KC-GD
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 14:47:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1n7N52-0002MU-Ng
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:45:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1n7N4y-0006ri-Nv
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:45:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641930302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WlIU/TmVDNyZugEtC4LFKe1yofyXVcSuGQgl3Q0++V0=;
 b=glGXfegZ7YW9BC4g3qyz+V2FV0xkfQXgeDtG5vctW36mAVF1kLLMvi/w3681hXH9+mQSMW
 Gi0RdzKBDjIGqSzS8U5fMmHVZbp6ND+S/dbP2AF22oSa7OSV25KudQxPZDCcra+v8VBS3L
 wJdnXGfE5n8j6gPxXrmbW6fsCQeeGj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-T1O-6N_4PluIVjZToF0y1A-1; Tue, 11 Jan 2022 14:43:17 -0500
X-MC-Unique: T1O-6N_4PluIVjZToF0y1A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F01FF100C611;
 Tue, 11 Jan 2022 19:43:16 +0000 (UTC)
Received: from loop.redhat.com (unknown [10.35.206.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5712B5BE08;
 Tue, 11 Jan 2022 19:43:15 +0000 (UTC)
From: Nir Soffer <nsoffer@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] nbd/server.c: Remove unused field
Date: Tue, 11 Jan 2022 21:43:13 +0200
Message-Id: <20220111194313.581486-1-nsoffer@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Nir Soffer <nsoffer@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NBDRequestData struct has unused QSIMPLEQ_ENTRY filed. It seems that
this field exists since the first git commit and was never used.

Signed-off-by: Nir Soffer <nsoffer@redhat.com>
---
 nbd/server.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/nbd/server.c b/nbd/server.c
index 3927f7789d..ce5b2a1d02 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -70,21 +70,20 @@ static int system_errno_to_nbd_errno(int err)
     default:
         return NBD_EINVAL;
     }
 }
 
 /* Definitions for opaque data types */
 
 typedef struct NBDRequestData NBDRequestData;
 
 struct NBDRequestData {
-    QSIMPLEQ_ENTRY(NBDRequestData) entry;
     NBDClient *client;
     uint8_t *data;
     bool complete;
 };
 
 struct NBDExport {
     BlockExport common;
 
     char *name;
     char *description;
-- 
2.34.1


