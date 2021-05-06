Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2454375B6E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:08:58 +0200 (CEST)
Received: from localhost ([::1]:48786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejMn-0006Mm-NV
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lejBN-0005L4-3W
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lejBI-0005Z7-O8
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620327424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5HRL0AHFGGqYtDHPTzziaPrISFrhBpm0gjO3iu+AIE8=;
 b=fyX7Szh3dX39/GYs+QkfxDQRTDsXZHhS30RPoj4uvTaO4pquoEHEB8mB2ll2BzB88eeHf2
 AqJKGOzoU9UjDCE1qi6plMuYWZcZb11vWlJ0QAPiCgJVKEVxuhNEc/4A8jMBnnkJMKgw2i
 yV7XUpkhg/ktNR6sTsLIEKAVByWPinA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-iseaBAN_OFSYvfZO3zwkUA-1; Thu, 06 May 2021 14:57:01 -0400
X-MC-Unique: iseaBAN_OFSYvfZO3zwkUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5DAF8042AE;
 Thu,  6 May 2021 18:57:00 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-37.ams2.redhat.com
 [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1260D19C46;
 Thu,  6 May 2021 18:56:58 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, groug@kaod.org, jose.carlos.venegas.munoz@intel.com,
 ma.mandourr@gmail.com
Subject: [PULL 04/12] virtiofs: Fixup printf args
Date: Thu,  6 May 2021 19:56:33 +0100
Message-Id: <20210506185641.284821-5-dgilbert@redhat.com>
In-Reply-To: <20210506185641.284821-1-dgilbert@redhat.com>
References: <20210506185641.284821-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, vgoyal@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Fixup some fuse_log printf args for 32bit compatibility.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210428110100.27757-2-dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 2c36f4ec46..93a49db3cd 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2011,10 +2011,10 @@ static void lo_getlk(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi,
 
     fuse_log(FUSE_LOG_DEBUG,
              "lo_getlk(ino=%" PRIu64 ", flags=%d)"
-             " owner=0x%lx, l_type=%d l_start=0x%lx"
-             " l_len=0x%lx\n",
-             ino, fi->flags, fi->lock_owner, lock->l_type, lock->l_start,
-             lock->l_len);
+             " owner=0x%" PRIx64 ", l_type=%d l_start=0x%" PRIx64
+             " l_len=0x%" PRIx64 "\n",
+             ino, fi->flags, fi->lock_owner, lock->l_type,
+             (uint64_t)lock->l_start, (uint64_t)lock->l_len);
 
     if (!lo->posix_lock) {
         fuse_reply_err(req, ENOSYS);
@@ -2061,10 +2061,10 @@ static void lo_setlk(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi,
 
     fuse_log(FUSE_LOG_DEBUG,
              "lo_setlk(ino=%" PRIu64 ", flags=%d)"
-             " cmd=%d pid=%d owner=0x%lx sleep=%d l_whence=%d"
-             " l_start=0x%lx l_len=0x%lx\n",
+             " cmd=%d pid=%d owner=0x%" PRIx64 " sleep=%d l_whence=%d"
+             " l_start=0x%" PRIx64 " l_len=0x%" PRIx64 "\n",
              ino, fi->flags, lock->l_type, lock->l_pid, fi->lock_owner, sleep,
-             lock->l_whence, lock->l_start, lock->l_len);
+             lock->l_whence, (uint64_t)lock->l_start, (uint64_t)lock->l_len);
 
     if (!lo->posix_lock) {
         fuse_reply_err(req, ENOSYS);
@@ -3102,9 +3102,10 @@ static void lo_copy_file_range(fuse_req_t req, fuse_ino_t ino_in, off_t off_in,
 
     fuse_log(FUSE_LOG_DEBUG,
              "lo_copy_file_range(ino=%" PRIu64 "/fd=%d, "
-             "off=%lu, ino=%" PRIu64 "/fd=%d, "
-             "off=%lu, size=%zd, flags=0x%x)\n",
-             ino_in, in_fd, off_in, ino_out, out_fd, off_out, len, flags);
+             "off=%ju, ino=%" PRIu64 "/fd=%d, "
+             "off=%ju, size=%zd, flags=0x%x)\n",
+             ino_in, in_fd, (intmax_t)off_in,
+             ino_out, out_fd, (intmax_t)off_out, len, flags);
 
     res = copy_file_range(in_fd, &off_in, out_fd, &off_out, len, flags);
     if (res < 0) {
-- 
2.31.1


