Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330EB43B0C7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 13:08:03 +0200 (CEST)
Received: from localhost ([::1]:43166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfKJG-00007s-7r
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 07:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfJiH-00033m-9X
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfJiF-0004iK-Dg
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635244186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uye296k7RKqFulpK69XM8lsTICdM10NRbCE5xqoJ1Q4=;
 b=ZPw2L9zHP5WLweasJx2hy/iVoWDYtBMWp6298Fb/xGo7hJIqxdYq+xbNySJLQV2frYH+s2
 QW0evMoixfr/uhzkK2DbL+G+oyAFcD/QCqj8k/cxRPvA7Vr8rHBtp8U4/u5usptdlCuBaW
 MYYJL3Z5VsaWfSZOzZ+DH8Rf113E+Cg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-puING16tPXW7EpTfvLBUqQ-1; Tue, 26 Oct 2021 06:29:45 -0400
X-MC-Unique: puING16tPXW7EpTfvLBUqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C8F780DDE1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 10:29:41 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E68F100763D;
 Tue, 26 Oct 2021 10:29:40 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] virtiofsd: Remove unused virtio_fs_config definition
Date: Tue, 26 Oct 2021 11:29:30 +0100
Message-Id: <20211026102933.103139-3-dgilbert@redhat.com>
In-Reply-To: <20211026102933.103139-1-dgilbert@redhat.com>
References: <20211026102933.103139-1-dgilbert@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

"struct virtio_fs_config" definition seems to be unused in fuse_virtio.c.
Remove it.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <20210930153037.1194279-4-vgoyal@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 8f4fd165b9..da7b6a76bf 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -82,12 +82,6 @@ struct fv_VuDev {
     struct fv_QueueInfo **qi;
 };
 
-/* From spec */
-struct virtio_fs_config {
-    char tag[36];
-    uint32_t num_queues;
-};
-
 /* Callback from libvhost-user */
 static uint64_t fv_get_features(VuDev *dev)
 {
-- 
2.31.1


