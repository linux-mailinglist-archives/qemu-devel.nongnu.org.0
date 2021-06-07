Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820B839E626
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 20:03:46 +0200 (CEST)
Received: from localhost ([::1]:43978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJbF-0001j2-5Q
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 14:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqJYG-00068V-EY
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 14:00:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqJYD-0001nX-Dm
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 14:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623088836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DcVftzWXpiruQftlh4XLQ+UAyuRA+iR7AzXrrA+sXxg=;
 b=KWzXKW+iBvlGT0meNapE+Glqg/z7AEekUVzWP5e8RpkLj+jsHz12/2iHMzA6vDd5tMsS8z
 tOiVLLWrgvYTMWzx9xzc24J4062I1+PkSgEv5h95DxMRq5AZ0H6LDNVI124zKq3O31K3Iu
 MzXHfhcOfMiTMOWaLPTnH/ce013YNRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-HHGNMaLhPwysTFXgRxbydA-1; Mon, 07 Jun 2021 14:00:34 -0400
X-MC-Unique: HHGNMaLhPwysTFXgRxbydA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC1021922964;
 Mon,  7 Jun 2021 18:00:32 +0000 (UTC)
Received: from thuth.com (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10D1E5C1D1;
 Mon,  7 Jun 2021 18:00:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH] docs/tools/virtiofsd: Fix bad rst syntax
Date: Mon,  7 Jun 2021 20:00:15 +0200
Message-Id: <20210607180015.924571-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For literal blocks, there has to be an empty line after the two colons,
and the block itself should be indented.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/tools/virtiofsd.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index 265a39b0cf..4911e797cb 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -239,7 +239,7 @@ xattr-mapping Examples
 
 ::
 
--o xattrmap=":prefix:all::user.virtiofs.::bad:all:::"
+ -o xattrmap=":prefix:all::user.virtiofs.::bad:all:::"
 
 
 This uses two rules, using : as the field separator;
@@ -250,7 +250,8 @@ the host set.
 This is equivalent to the 'map' rule:
 
 ::
--o xattrmap=":map::user.virtiofs.:"
+
+ -o xattrmap=":map::user.virtiofs.:"
 
 2) Prefix 'trusted.' attributes, allow others through
 
@@ -277,7 +278,8 @@ through.
 This is equivalent to the 'map' rule:
 
 ::
--o xattrmap="/map/trusted./user.virtiofs./"
+
+ -o xattrmap="/map/trusted./user.virtiofs./"
 
 3) Hide 'security.' attributes, and allow everything else
 
-- 
2.27.0


