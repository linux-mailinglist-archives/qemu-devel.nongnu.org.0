Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E81401EDD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 19:03:04 +0200 (CEST)
Received: from localhost ([::1]:34742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNI1P-0007Q6-GF
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 13:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNHzH-0006hV-O7
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 13:00:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNHzC-0000gh-3u
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 13:00:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630947645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SFKiaP448NkMnd7jDjFA4+BcWfLq6xkODAvxSEvMdBI=;
 b=JQO1lt2TuQfzV/jXxO8uwr0u8R6xdLHDyjSRnHYbr4p6VOcwZi+az7wq4QedgxdFaGK/mR
 GkS2HjnBs5KZGNDP7jZVkILnLgLe8HayCUd2c2oD5lxqLep5MWdIfbbt/3p9RB1woO2/yb
 hL+5hBEvy1qYe4D0uFmo3PTpcJ1zlUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-2UDgj_agOdGArNtxoOT5rA-1; Mon, 06 Sep 2021 13:00:41 -0400
X-MC-Unique: 2UDgj_agOdGArNtxoOT5rA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC497189C45D
 for <qemu-devel@nongnu.org>; Mon,  6 Sep 2021 17:00:40 +0000 (UTC)
Received: from localhost (unknown [10.39.193.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73B59794A1;
 Mon,  6 Sep 2021 17:00:40 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web RFC] CONTRIBUTING.md: Mention maintainers
Date: Mon,  6 Sep 2021 19:00:38 +0200
Message-Id: <20210906170038.26602-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All patches to the QEMU website should be CC-ed to the website
maintainers, who (right now) are Thomas and Paolo.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
This is an RFC first because I feel bad about sending a patch that
gives people responsibilities who aren't me.  But Thomas seemed to agree
with me that making this requirement explicit would be nice, so I guess
someone has to send a patch for it...

Second, I'm not sure whether this is the ideal place.  Perhaps we should
have a MAINTAINERS file, but on the other hand, maybe that would be a
bit too much.
---
 CONTRIBUTING.md | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index b5209ac..d5cbf07 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -5,6 +5,11 @@ the the developer mailing list:
 
 https://lists.nongnu.org/mailman/listinfo/qemu-devel
 
+You should also CC the website maintainers:
+
+* Thomas Huth <thuth@redhat.com>
+* Paolo Bonzini <pbonzini@redhat.com>
+
 For further guidance on sending patches consult:
 
 https://wiki.qemu.org/Contribute/SubmitAPatch
-- 
2.31.1


