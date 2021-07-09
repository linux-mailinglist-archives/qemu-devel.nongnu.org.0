Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA773C25A1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:13:01 +0200 (CEST)
Received: from localhost ([::1]:33438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rFU-0002X3-NW
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1rCd-0006e6-MA
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:10:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1rCa-00046a-97
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:10:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625839799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=unzpmagX5WLwVgyDgce0WBtBC+HK/S/zUbbRVB7TFIQ=;
 b=SvOx6+m8vlHkKohrPZgEEU7IVewSis45S85LkLNqb1ac2CH1srRhoM92Puz+ufo2sPrX9O
 kQpO42QQv//L27V7x8LKnhs5EMyfA5o0ZYE9in2igkOodBZxJNlUiTF1TQIFxWp9OrLJmS
 uXJGvUUqWfSEs3NX8q5PxSX877twHwg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-Z4KWrtR-N_iEvb-d-XB7tQ-1; Fri, 09 Jul 2021 10:09:58 -0400
X-MC-Unique: Z4KWrtR-N_iEvb-d-XB7tQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09BF68030D7;
 Fri,  9 Jul 2021 14:09:57 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83FF860C04;
 Fri,  9 Jul 2021 14:09:56 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] qemu-img: Reword 'qemu-img map --output=json' docs
Date: Fri,  9 Jul 2021 09:09:50 -0500
Message-Id: <20210709140951.2775730-4-eblake@redhat.com>
In-Reply-To: <20210709140951.2775730-1-eblake@redhat.com>
References: <20210709140951.2775730-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Nir Soffer <nsoffer@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reword the paragraphs to list the JSON key first, rather than in the
middle of prose.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210707184125.2551140-1-eblake@redhat.com>
Reviewed-by: Nir Soffer <nsoffer@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/tools/qemu-img.rst | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index d6300f7ee03d..1d8470eada0e 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -593,16 +593,16 @@ Command description:
   the ``start``, ``length``, ``offset`` fields;
   it will also include other more specific information:

-  - whether the sectors contain actual data or not (boolean field ``data``;
-    if false, the sectors are either unallocated or stored as optimized
-    all-zero clusters);
-  - whether the data is known to read as zero (boolean field ``zero``);
-  - whether the data is actually present (boolean field ``present``);
-    if false, rebasing the backing chain onto a deeper file would pick
-    up data from the deeper file;
-  - in order to make the output shorter, the target file is expressed as
-    a ``depth``; for example, a depth of 2 refers to the backing file
-    of the backing file of *FILENAME*.
+  - boolean field ``data``: true if the sectors contain actual data,
+    false if the sectors are either unallocated or stored as optimized
+    all-zero clusters
+  - boolean field ``zero``: true if the data is known to read as zero
+  - boolean field ``present``: true if the data belongs to the backing
+    chain, false if rebasing the backing chain onto a deeper file
+    would pick up data from the deeper file;
+  - integer field ``depth``: the depth within the backing chain at
+    which the data was resolved; for example, a depth of 2 refers to
+    the backing file of the backing file of *FILENAME*.

   In JSON format, the ``offset`` field is optional; it is absent in
   cases where ``human`` format would omit the entry or exit with an error.
-- 
2.31.1


