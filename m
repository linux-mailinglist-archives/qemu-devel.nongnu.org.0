Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBF21CAB9F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 14:45:41 +0200 (CEST)
Received: from localhost ([::1]:38744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX2Nn-0005Zs-Ve
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 08:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jX2KG-0008VN-EE
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:42:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60180
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jX2KF-0007zj-Da
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:42:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588941718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g/aQIlT38OPKHRz+3cy98qVjUyVKDpccNgycSxCZJBw=;
 b=ipU9kyNcxv6kIyDwhevq00Z67VifDE9XCmLSrtrhCaDOziYjJL8OG02QEU9zL6QqDJOTUq
 zRK8m3FhRZkLMb5HXULBOlZ1k3Im2PHkJqzJatpuhzI0mWD9ipuToMoBqm9iRubA2g+NOG
 8D2OcZJUjNO6YQTogCGwHG9epA1Z4Ks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-f4e9F2d8NKqqtIxcu8KwYw-1; Fri, 08 May 2020 08:41:56 -0400
X-MC-Unique: f4e9F2d8NKqqtIxcu8KwYw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78253464;
 Fri,  8 May 2020 12:41:55 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-190.ams2.redhat.com
 [10.36.113.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7748F19167;
 Fri,  8 May 2020 12:41:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/30] vmdk: Rename VmdkMetaData.valid to new_allocation
Date: Fri,  8 May 2020 14:41:15 +0200
Message-Id: <20200508124135.252565-11-kwolf@redhat.com>
In-Reply-To: <20200508124135.252565-1-kwolf@redhat.com>
References: <20200508124135.252565-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 02:23:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

m_data is used for zero clusters even though valid =3D=3D 0. It really only
means that a new cluster was allocated in the image file. Rename it to
reflect this.

While at it, change it from int to bool, too.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200430133007.170335-2-kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vmdk.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index b02fdd14b2..ecfb4a86d2 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -180,7 +180,7 @@ typedef struct VmdkMetaData {
     unsigned int l1_index;
     unsigned int l2_index;
     unsigned int l2_offset;
-    int valid;
+    bool new_allocation;
     uint32_t *l2_cache_entry;
 } VmdkMetaData;
=20
@@ -1492,7 +1492,7 @@ static int get_cluster_offset(BlockDriverState *bs,
     unsigned int l2_size_bytes =3D extent->l2_size * extent->entry_size;
=20
     if (m_data) {
-        m_data->valid =3D 0;
+        m_data->new_allocation =3D false;
     }
     if (extent->flat) {
         *cluster_offset =3D extent->flat_start_offset;
@@ -1630,7 +1630,7 @@ static int get_cluster_offset(BlockDriverState *bs,
             return ret;
         }
         if (m_data) {
-            m_data->valid =3D 1;
+            m_data->new_allocation =3D true;
             m_data->l1_index =3D l1_index;
             m_data->l2_index =3D l2_index;
             m_data->l2_offset =3D l2_offset;
@@ -2021,7 +2021,7 @@ static int vmdk_pwritev(BlockDriverState *bs, uint64_=
t offset,
             if (ret) {
                 return ret;
             }
-            if (m_data.valid) {
+            if (m_data.new_allocation) {
                 /* update L2 tables */
                 if (vmdk_L2update(extent, &m_data,
                                   cluster_offset >> BDRV_SECTOR_BITS)
--=20
2.25.3


