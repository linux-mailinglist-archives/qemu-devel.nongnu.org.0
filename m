Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C7F31C6B8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 08:16:58 +0100 (CET)
Received: from localhost ([::1]:37462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBubR-0005X8-Kg
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 02:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lBuZz-0004tA-5F
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:15:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lBuZw-00049K-SF
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613459723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7/IjM9FGc292bbj1USJVBfjzMAr0vDCJboY2UBqpEDM=;
 b=BOsZAaPww1M3+vFb2HeW4oSL+H5HiD7b/7XEKQeEOEWLTx3gTQho+o2bvKYtwddayP2lyU
 roHTuSBoOeax1RXMn5wpQQbfZG4Vv+L6BGE/VyE7Z+c0kEnl9LkdDXHzXuBVeTGbgNnX0W
 N654U3r/eGmM5bueKn/XimR1AYjSr1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-ZXtrupVsPbu8FpzWC2KDbg-1; Tue, 16 Feb 2021 02:15:20 -0500
X-MC-Unique: ZXtrupVsPbu8FpzWC2KDbg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C81A56EE22;
 Tue, 16 Feb 2021 07:15:18 +0000 (UTC)
Received: from thuth.com (ovpn-112-157.ams2.redhat.com [10.36.112.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1193163F1;
 Tue, 16 Feb 2021 07:15:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] scripts/checkpatch: Improve the check for authors mangled by
 the mailing list
Date: Tue, 16 Feb 2021 08:15:12 +0100
Message-Id: <20210216071512.1199827-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There were recently some patches on the list which had their "From:"
line mangled like this:

 From: qemu_oss--- via <qemu-devel@nongnu.org>

Since our test in the checkpatch.pl script did not trigger here, the
patches finally also ended up in a pull request, with the wrong author
set. So let's improve the regular expression to also complain on
these new patterns, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e47ad878d8..7f194c842b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1499,7 +1499,7 @@ sub process {
 			$is_patch = 1;
 		}
 
-		if ($line =~ /^Author: .*via Qemu-devel.*<qemu-devel\@nongnu.org>/) {
+		if ($line =~ /^(Author|From): .* via .*<qemu-devel\@nongnu.org>/) {
 		    ERROR("Author email address is mangled by the mailing list\n" . $herecurr);
 		}
 
-- 
2.27.0


