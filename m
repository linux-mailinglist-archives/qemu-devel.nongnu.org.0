Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A242549A7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 17:40:28 +0200 (CEST)
Received: from localhost ([::1]:52410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBK0p-0002Ot-3W
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 11:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kBJy2-00076F-3b
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 11:37:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52988
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kBJy0-00086R-DZ
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 11:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598542650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2QYq4Wy4BL95yd485TZY7hK9rTHHXrGNPSze6UgH9cw=;
 b=Itbx5pf5r9WrN/M2PT80eaWKnJMWrYOfvnZSAxY3Y3IdqGeTcbhqsCke5qK1AyeCDCkriJ
 WbK/6wZcfGJgfGALfuHUpvXGrMCRV3k645/AHHLAWF7mezi329RW8PFaHRsSAjPSAuo0D1
 4VDPwVx7ADWtWvQnmqnNxm6cp+iifYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-xffI8G3hNNGY2OLdFPJLQw-1; Thu, 27 Aug 2020 11:37:28 -0400
X-MC-Unique: xffI8G3hNNGY2OLdFPJLQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 964A6185FD81
 for <qemu-devel@nongnu.org>; Thu, 27 Aug 2020 15:37:27 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-163.ams2.redhat.com
 [10.36.114.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 913FF5D9E8;
 Thu, 27 Aug 2020 15:37:26 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com
Subject: [PATCH v2 6/6] tools/virtiofsd: xattr name mapping examples
Date: Thu, 27 Aug 2020 16:36:57 +0100
Message-Id: <20200827153657.111098-7-dgilbert@redhat.com>
In-Reply-To: <20200827153657.111098-1-dgilbert@redhat.com>
References: <20200827153657.111098-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 02:56:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Add a few examples of xattrmaps to the documentation.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 docs/tools/virtiofsd.rst | 49 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index 2efa16d3c5..a138549862 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -161,6 +161,55 @@ in which case a 'server' rule will always match on all names from
 the server.
 
 
+xattr-mapping Examples
+----------------------
+
+1) Prefix all attributes with 'user.virtiofs.'
+
+::
+
+-o xattrmap=":all:prefix::user.virtiofs.::all:bad:::"
+
+
+This uses two rules, using : as the field separator;
+the first rule prefixes and strips 'user.virtiofs.',
+the second rule hides any non-prefixed attributes that
+the host set.
+
+2) Prefix 'trusted.' attributes, allow others through
+
+::
+
+   "/all/prefix/trusted./user.virtiofs./
+    /server/bad//trusted./
+    /client/bad/user.virtiofs.trusted.//
+    /all/ok///"
+
+
+Here there are four rules, using / as the field
+separator, and also demonstrating that new lines can
+be included between rules.
+The first rule is the prefixing of 'trusted.'.
+The second rule hides unprefixed 'trusted.' attributes
+on the host.
+The third rule stops a guest from explicitily setting
+the 'user.viritofs.trusted.' path directly.
+Finally, the fourth rule lets all remaining attributes
+through.
+
+3) Hide 'security.' attributes, and allow everything else
+
+::
+
+    "/all/bad/security./security./
+     /all/ok///'
+
+The first rule combines what could be separate client and server
+rules into a single 'all' rule, matching 'security.' in either
+client arguments or lists returned from the host.  This stops
+the client seeing any 'security.' attributes on the server and
+stops it setting  any.
+
 Examples
 --------
 
-- 
2.26.2


