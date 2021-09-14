Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC4140AED1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:23:00 +0200 (CEST)
Received: from localhost ([::1]:49242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8Op-0003GM-Ev
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQ8Jd-0004I1-JY
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:17:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQ8Jb-0001EJ-Gz
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:17:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631625453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SLvKeav5abcu16BZHpLmZ+FG0S8Fq8C31clQ43GdR0U=;
 b=gG9l+r1TSN9V1Rg7DFO0RlsHSIYaljGkQhaCafxux9JiufzyRmlxoRURXyqw77vCbz+Ip/
 XjktPgB56ykUEeLSWUsK6gOndBM8mx0MWyTsubYhDGvg7ZtfJhO/MBEpS/cD92r2LrCUam
 ODDWuQ+I73WaVrjqTOOI4hTM6bY0IQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-_eAxuLIYNLWcgMXHM9MhHA-1; Tue, 14 Sep 2021 09:17:32 -0400
X-MC-Unique: _eAxuLIYNLWcgMXHM9MhHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 588469017C1
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 13:17:31 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C9EB102AE4B;
 Tue, 14 Sep 2021 13:17:21 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com,
	david@redhat.com
Subject: [PATCH] virtio-balloon: Fix page-poison subsection name
Date: Tue, 14 Sep 2021 14:17:16 +0100
Message-Id: <20210914131716.102851-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The subsection name for page-poison was typo'd as:

  vitio-balloon-device/page-poison

Note the missing 'r' in virtio.

When we have a machine type that enables page poison, and the guest
enables it (which needs a new kernel), things fail rather unpredictably.

The fallout from this is that most of the other subsections fail to
load, including things like the feature bits in the device, one
possible fallout is that the physical addresses of the queues
then get aligned differently and we fail with an error about
last_avail_idx being wrong.
It's not obvious to me why this doesn't produce a more obvious failure,
but virtio's vmstate loading is a bit open-coded.

Fixes: 7483cbbaf82 ("virtio-balloon: Implement support for page poison reporting feature")
bz: https://bugzilla.redhat.com/show_bug.cgi?id=1984401
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/virtio/virtio-balloon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 5a69dce35d..c6962fcbfe 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -852,7 +852,7 @@ static const VMStateDescription vmstate_virtio_balloon_free_page_hint = {
 };
 
 static const VMStateDescription vmstate_virtio_balloon_page_poison = {
-    .name = "vitio-balloon-device/page-poison",
+    .name = "virtio-balloon-device/page-poison",
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = virtio_balloon_page_poison_support,
-- 
2.31.1


