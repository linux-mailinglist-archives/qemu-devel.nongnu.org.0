Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E881415078
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:29:02 +0200 (CEST)
Received: from localhost ([::1]:38422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7vR-0007Aj-1C
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mT7VX-0005wh-P3
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:02:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mT7VT-0008GR-KO
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:02:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632337329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=9UpxaD7aFIe/K6LlYP5Rf37+eRiivxr+F6I4MeUAdtk=;
 b=ClNIE1UXPw6qTIK2N3/BdCLTMCLI/WC/MhOvjl3Fh8ItE7WQjxOVjhJCgvw9cUwpRjQF/q
 V0KrJAiMbkhu1AQgD+8VNJCnT2QJvDbgLwa/caqZufwMhaBSoVdoE+tFzCZG0ucA3WXw9b
 OMMXcVLNTk4IRRd4Q3b1ei1pA+/EWAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-GJq9ZAXTOZSMiJH2S5sqkA-1; Wed, 22 Sep 2021 15:02:02 -0400
X-MC-Unique: GJq9ZAXTOZSMiJH2S5sqkA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EE91835DE0
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 19:02:02 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5C5A5D9CA;
 Wed, 22 Sep 2021 19:02:01 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 7FAC5222E4F; Wed, 22 Sep 2021 15:02:01 -0400 (EDT)
Date: Wed, 22 Sep 2021 15:02:01 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org, virtio-fs@redhat.com, dgilbert@redhat.com
Subject: [PATCH] virtiofsd: xattr mapping add a new type "unsupported"
Message-ID: <YUt9qbmgAfCFfg5t@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Right now for xattr remapping, we support types of "prefix", "ok" or "bad".
Type "bad" returns -EPERM on setxattr and hides xattr in listxattr. For
getxattr, mapping code returns -EPERM but getxattr code converts it to -ENODATA.

I need a new semantics where if an xattr is unsupported, then
getxattr()/setxattr() return -ENOTSUP and listxattr() should hide the xattr.
This is needed to simulate that security.selinux is not supported by
virtiofs filesystem and in that case client falls back to some default
label specified by policy.

So add a new type "unsupported" which returns -ENOTSUP on getxattr() and
setxattr() and hides xattrs in listxattr().

For example, one can use following mapping rule to not support
security.selinux xattr and allow others.

"-o xattrmap=/unsupported/all/security.selinux/security.selinux//ok/all///"

Suggested-by: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 docs/tools/virtiofsd.rst         |    6 ++++++
 tools/virtiofsd/passthrough_ll.c |   17 ++++++++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)

Index: rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c
===================================================================
--- rhvgoyal-qemu.orig/tools/virtiofsd/passthrough_ll.c	2021-09-22 08:37:16.070377732 -0400
+++ rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c	2021-09-22 14:17:09.543016250 -0400
@@ -2465,6 +2465,11 @@ static void lo_flock(fuse_req_t req, fus
  * Automatically reversed on read
  */
 #define XATTR_MAP_FLAG_PREFIX  (1 <<  2)
+/*
+ * The attribute is unsupported;
+ * ENOTSUP on write, hidden on read.
+ */
+#define XATTR_MAP_FLAG_UNSUPPORTED     (1 <<  3)
 
 /* scopes */
 /* Apply rule to get/set/remove */
@@ -2636,6 +2641,8 @@ static void parse_xattrmap(struct lo_dat
             tmp_entry.flags |= XATTR_MAP_FLAG_OK;
         } else if (strstart(map, "bad", &map)) {
             tmp_entry.flags |= XATTR_MAP_FLAG_BAD;
+        } else if (strstart(map, "unsupported", &map)) {
+            tmp_entry.flags |= XATTR_MAP_FLAG_UNSUPPORTED;
         } else if (strstart(map, "map", &map)) {
             /*
              * map is sugar that adds a number of rules, and must be
@@ -2646,8 +2653,8 @@ static void parse_xattrmap(struct lo_dat
         } else {
             fuse_log(FUSE_LOG_ERR,
                      "%s: Unexpected type;"
-                     "Expecting 'prefix', 'ok', 'bad' or 'map' in rule %zu\n",
-                     __func__, lo->xattr_map_nentries);
+                     "Expecting 'prefix', 'ok', 'bad', 'unsupported' or 'map'"
+                     " in rule %zu\n", __func__, lo->xattr_map_nentries);
             exit(1);
         }
 
@@ -2749,6 +2756,9 @@ static int xattr_map_client(const struct
             if (cur_entry->flags & XATTR_MAP_FLAG_BAD) {
                 return -EPERM;
             }
+            if (cur_entry->flags & XATTR_MAP_FLAG_UNSUPPORTED) {
+                return -ENOTSUP;
+            }
             if (cur_entry->flags & XATTR_MAP_FLAG_OK) {
                 /* Unmodified name */
                 return 0;
@@ -2788,7 +2798,8 @@ static int xattr_map_server(const struct
 
         if ((cur_entry->flags & XATTR_MAP_FLAG_SERVER) &&
             (strstart(server_name, cur_entry->prepend, &end))) {
-            if (cur_entry->flags & XATTR_MAP_FLAG_BAD) {
+            if (cur_entry->flags & XATTR_MAP_FLAG_BAD ||
+                cur_entry->flags & XATTR_MAP_FLAG_UNSUPPORTED) {
                 return -ENODATA;
             }
             if (cur_entry->flags & XATTR_MAP_FLAG_OK) {
Index: rhvgoyal-qemu/docs/tools/virtiofsd.rst
===================================================================
--- rhvgoyal-qemu.orig/docs/tools/virtiofsd.rst	2021-09-22 08:37:15.938372097 -0400
+++ rhvgoyal-qemu/docs/tools/virtiofsd.rst	2021-09-22 14:44:09.814188712 -0400
@@ -183,6 +183,12 @@ Using ':' as the separator a rule is of
   'ok' as either an explicit terminator or for special handling of certain
   patterns.
 
+- 'unsupported' - If a client tries to use a name matching 'key' it's
+  denied using ENOTSUP; when the server passes an attribute
+  name matching 'prepend' it's hidden.  In many ways it's use is very like
+  'ok' as either an explicit terminator or for special handling of certain
+  patterns.
+
 **key** is a string tested as a prefix on an attribute name originating
 on the client.  It maybe empty in which case a 'client' rule
 will always match on client names.


