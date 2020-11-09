Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2646D2AB31E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 10:06:18 +0100 (CET)
Received: from localhost ([::1]:36052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc37x-00019C-7G
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 04:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kc34G-00056X-AL
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 04:02:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kc34E-0004Z8-JI
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 04:02:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604912545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iDvvt1yKkSwe7BIjolzHKCMnGtVeYevZcFWtbX7oWrc=;
 b=WjqGDQOoyPHBjgn2VyRTxo5ugCfxRdFGlYtTfhp/I3WQb+39pcFNTgMELxQQMAAmDwDByP
 q4bosA265TjMy89lDcGKS9aLspGZxX4FWj9DxleXAl+YiYHzXXpQjvR4dj3NgdaUKC1iSa
 JOlmCBKgpZcAwE8qIWY+kXQ7gbqk568=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-lKzxeb9cN524VDhuVtyVdg-1; Mon, 09 Nov 2020 04:02:23 -0500
X-MC-Unique: lKzxeb9cN524VDhuVtyVdg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 650635F9DB;
 Mon,  9 Nov 2020 09:02:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3270B619C4;
 Mon,  9 Nov 2020 09:02:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C57B01129947; Mon,  9 Nov 2020 10:02:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] qapi/block-core: Improve MapEntry documentation
Date: Mon,  9 Nov 2020 10:02:19 +0100
Message-Id: <20201109090220.825764-5-armbru@redhat.com>
In-Reply-To: <20201109090220.825764-1-armbru@redhat.com>
References: <20201109090220.825764-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 01:25:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

MapEntry and BlockDeviceMapEntry are kind of the same thing, and the
latter is not used, so we want to remove it.  However, the documentation
it provides for some fields is better than that of MapEntry, so steal
some of it for the latter.

(And adjust them a bit in the process, because I feel like we can make
them even clearer.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201104165513.72720-2-mreitz@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 1b8b4156b4..3f86675357 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -244,17 +244,25 @@
 #
 # Mapping information from a virtual block range to a host file range
 #
-# @start: the start byte of the mapped virtual range
+# @start: virtual (guest) offset of the first byte described by this
+#         entry
 #
 # @length: the number of bytes of the mapped virtual range
 #
-# @data: whether the mapped range has data
+# @data: reading the image will actually read data from a file (in
+#        particular, if @offset is present this means that the sectors
+#        are not simply preallocated, but contain actual data in raw
+#        format)
 #
-# @zero: whether the virtual blocks are zeroed
+# @zero: whether the virtual blocks read as zeroes
 #
-# @depth: the depth of the mapping
+# @depth: number of layers (0 = top image, 1 = top image's backing
+#         file, ..., n - 1 = bottom image (where n is the number of
+#         images in the chain)) before reaching one for which the
+#         range is allocated
 #
-# @offset: the offset in file that the virtual sectors are mapped to
+# @offset: if present, the image file stores the data for this range
+#          in raw format at the given (host) offset
 #
 # @filename: filename that is referred to by @offset
 #
-- 
2.26.2


