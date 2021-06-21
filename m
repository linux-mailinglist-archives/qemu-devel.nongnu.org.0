Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909EA3AE8BF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 14:07:37 +0200 (CEST)
Received: from localhost ([::1]:57900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvIiG-0007xx-GI
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 08:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lvIcZ-00009T-GS
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:01:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lvIcV-0001KL-R8
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:01:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624276896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=awGEg7b28Zd4GHvRzt2YHqfD5vRAhFLohXiqTOYnhdU=;
 b=gkdMJXDx4GW+GFPBSurECWSUQROu0rAspJ2tFuoXTF0E6xyVe04FL1fWHoezqVpIu+O3c+
 fLKvn37d2vN4HNJ5rJIhN/PQjvOr1LCiuTgZWBgsrrXXQxm5egATt8S0Rtsku82yfu2YXP
 aKQvJluedt6RwRqIhwlYWF2btYOmQTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-YbLaIMcSN7i1U6soDLjg0w-1; Mon, 21 Jun 2021 08:01:34 -0400
X-MC-Unique: YbLaIMcSN7i1U6soDLjg0w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 756B11835AC4;
 Mon, 21 Jun 2021 12:01:33 +0000 (UTC)
Received: from thuth.com (ovpn-112-31.ams2.redhat.com [10.36.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A541C19C46;
 Mon, 21 Jun 2021 12:01:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/7] docs/tools/virtiofsd: Fix bad rst syntax
Date: Mon, 21 Jun 2021 14:01:21 +0200
Message-Id: <20210621120125.116377-4-thuth@redhat.com>
In-Reply-To: <20210621120125.116377-1-thuth@redhat.com>
References: <20210621120125.116377-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For literal blocks, there has to be an empty line after the two colons,
and the block itself should be indented.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210607180015.924571-1-thuth@redhat.com>
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


