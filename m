Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759FF276E17
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 12:02:16 +0200 (CEST)
Received: from localhost ([::1]:45402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLO4t-0004pW-FW
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 06:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNUF-0002GC-9h
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:24:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNUD-0006Ap-MG
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600939460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RBG1ZGgAoLoIXzfTRD9TPMnTRDIWPXDgcxH722TtDY8=;
 b=goz1sLc1V1W+e9oFgo5n656oOjK0aSzBCXPhJNuOhfHFE5mnPESeXwRiwUOALjBOH1xJIv
 QRrzX0iQLMSYv/rCdN8C4ixkwmIN8l/iJbnRGYk+kKbgz5jga5sMhZ4Rw2A5P1Ix0CsIpa
 i+oMz9crNpTvV7G6M1OyxeNvixnjylg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-I7XYTYygPNWgVjof1tw9wg-1; Thu, 24 Sep 2020 05:24:18 -0400
X-MC-Unique: I7XYTYygPNWgVjof1tw9wg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11DEB1891E9C
 for <qemu-devel@nongnu.org>; Thu, 24 Sep 2020 09:24:18 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CF2F61983;
 Thu, 24 Sep 2020 09:24:12 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 67/92] qom: Use kernel-doc private/public tags in structs
Date: Thu, 24 Sep 2020 05:22:49 -0400
Message-Id: <20200924092314.1722645-68-pbonzini@redhat.com>
In-Reply-To: <20200924092314.1722645-1-pbonzini@redhat.com>
References: <20200924092314.1722645-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

Use kernel-doc syntax for indicating private and public struct
fields.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20200910221526.10041-3-ehabkost@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qom/object.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index fe0c9b7735..473dc21bf4 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -520,7 +520,7 @@ typedef void (ObjectFree)(void *obj);
  */
 struct ObjectClass
 {
-    /*< private >*/
+    /* private: */
     Type type;
     GSList *interfaces;
 
@@ -546,7 +546,7 @@ struct ObjectClass
  */
 struct Object
 {
-    /*< private >*/
+    /* private: */
     ObjectClass *class;
     ObjectFree *free;
     GHashTable *properties;
@@ -908,7 +908,7 @@ struct InterfaceInfo {
 struct InterfaceClass
 {
     ObjectClass parent_class;
-    /*< private >*/
+    /* private: */
     ObjectClass *concrete_class;
     Type interface_type;
 };
-- 
2.26.2



