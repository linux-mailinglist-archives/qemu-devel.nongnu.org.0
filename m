Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C914A1397E9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 18:38:49 +0100 (CET)
Received: from localhost ([::1]:53686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir3fs-0008Cc-6e
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 12:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42218)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ir3e5-0006Wf-Vx
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 12:36:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ir3e5-00020C-1u
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 12:36:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57581
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ir3e4-0001zC-Ug
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 12:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578937016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WNez6IxU3/7Q9hEtGYz6qTWwUPHKrvmn+EW+Tm1OE9s=;
 b=SEwDcn008NnNG4m5iKEABWtZ3SITHL+DUYTlOO8ZUBXBxw2j3b7Lw8PkluY82kMZk0wc4z
 oXnPSUvXlUC3cKpeEehSvEqvAQ8esqwIYiwT+un+j4hj6bA0jMvxFTwj6kVd1yrY3BwesC
 tlkqH0IZ5iq2mNxIuP+Y6ZLDk8JrJ4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-wuh5-3Z2MXyhowKFmj048w-1; Mon, 13 Jan 2020 12:36:55 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BA2C801E72
 for <qemu-devel@nongnu.org>; Mon, 13 Jan 2020 17:36:54 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3345D5C1B0;
 Mon, 13 Jan 2020 17:36:53 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vkuznets@redhat.com, mst@redhat.com,
 jasowang@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 1/3] vhost: Add names to section rounded warning
Date: Mon, 13 Jan 2020 17:36:45 +0000
Message-Id: <20200113173647.84842-2-dgilbert@redhat.com>
In-Reply-To: <20200113173647.84842-1-dgilbert@redhat.com>
References: <20200113173647.84842-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: wuh5-3Z2MXyhowKFmj048w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Add the memory region names to section rounding/alignment
warnings.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/virtio/vhost.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 4da0d5a6c5..774d87d98e 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -590,9 +590,10 @@ static void vhost_region_add_section(struct vhost_dev =
*dev,
              * match up in the same RAMBlock if they do.
              */
             if (mrs_gpa < prev_gpa_start) {
-                error_report("%s:Section rounded to %"PRIx64
-                             " prior to previous %"PRIx64,
-                             __func__, mrs_gpa, prev_gpa_start);
+                error_report("%s:Section '%s' rounded to %"PRIx64
+                             " prior to previous '%s' %"PRIx64,
+                             __func__, section->mr->name, mrs_gpa,
+                             prev_sec->mr->name, prev_gpa_start);
                 /* A way to cleanly fail here would be better */
                 return;
             }
--=20
2.24.1


