Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6CB2A6B23
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 17:57:19 +0100 (CET)
Received: from localhost ([::1]:34960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaM62-0008GE-5D
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 11:57:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kaM4D-0006fg-54
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 11:55:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kaM4B-00045e-E0
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 11:55:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604508922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cjxDd0T9bdoRO8q4DDkradzcZ3vZHMSUn2yRu7+QmUI=;
 b=fMycvuH9LpQ7qY/xdf/ALn+lkEB2PZ1UybcUBv32iyFft201nB2Y88H1i8jiPiTa05zhqz
 SuXBhyh3aDpChAB29BODFSQdbNwtuTVulptthiLRC/6L5S1Cs85OFwTzS+4pI3viJg46fL
 /5onX6KfBeDYI6UFGxGWlOO7nec6SrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-v8TpAGmYO0mzteSZpXcn8A-1; Wed, 04 Nov 2020 11:55:18 -0500
X-MC-Unique: v8TpAGmYO0mzteSZpXcn8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00F416D240;
 Wed,  4 Nov 2020 16:55:18 +0000 (UTC)
Received: from localhost (unknown [10.40.194.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87A051002C2B;
 Wed,  4 Nov 2020 16:55:17 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] qapi/block-core: Improve MapEntry documentation
Date: Wed,  4 Nov 2020 17:55:12 +0100
Message-Id: <20201104165513.72720-2-mreitz@redhat.com>
In-Reply-To: <20201104165513.72720-1-mreitz@redhat.com>
References: <20201104165513.72720-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MapEntry and BlockDeviceMapEntry are kind of the same thing, and the
latter is not used, so we want to remove it.  However, the documentation
it provides for some fields is better than that of MapEntry, so steal
some of it for the latter.

(And adjust them a bit in the process, because I feel like we can make
them even clearer.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
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
2.28.0


