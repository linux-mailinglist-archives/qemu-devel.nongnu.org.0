Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FDF43B133
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 13:25:05 +0200 (CEST)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfKZi-0000QB-V1
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 07:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfKLg-0003hM-W4
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 07:10:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfKLc-0005Yt-C1
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 07:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635246627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y9WHk2vijC92BVSL64OdXsCmyjOnosDFALxFGp0h1MM=;
 b=ZTXRTy5EHmDsoP16IXu4NEhBCGe/NgNljOhNKO37dU5Dxkc2TjEvt/OaA3R/O4xN2NJviC
 gYpn3qOOIFRcVK0h1M6b74xGxwgTDX2vCHhfFesWranUYlls1T1c6UJwMWW3+dsOyckczK
 kgfK9ak3X+w9AeL0frDk6PTNLjWxLzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-RXeigo9lNdyaZBQI7ERrYg-1; Tue, 26 Oct 2021 07:10:26 -0400
X-MC-Unique: RXeigo9lNdyaZBQI7ERrYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A39281030C2B;
 Tue, 26 Oct 2021 11:10:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FDD85F4EE;
 Tue, 26 Oct 2021 11:10:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EB64B11380B8; Tue, 26 Oct 2021 13:10:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] docs/devel/qapi-code-gen: Belatedly document feature
 documentation
Date: Tue, 26 Oct 2021 13:10:23 +0200
Message-Id: <20211026111023.76937-3-armbru@redhat.com>
In-Reply-To: <20211026111023.76937-1-armbru@redhat.com>
References: <20211026111023.76937-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, jsnow@redhat.com, eblake@redhat.com,
 mdroth@linux.vnet.ibm.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 6a8c0b5102 "qapi: Add feature flags to struct types" neglected
to document how to document feature flags.  Make up for that.

Cc: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/qapi-code-gen.rst | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index 1f6805a705..4b79623f51 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -949,15 +949,16 @@ definition must have documentation.
 Definition documentation starts with a line naming the definition,
 followed by an optional overview, a description of each argument (for
 commands and events), member (for structs and unions), branch (for
-alternates), or value (for enums), and finally optional tagged
-sections.
+alternates), or value (for enums), a description of each feature (if
+any), and finally optional tagged sections.
 
-Descriptions of arguments can span multiple lines.  The description
-text can start on the line following the '\@argname:', in which case it
-must not be indented at all.  It can also start on the same line as
-the '\@argname:'.  In this case if it spans multiple lines then second
-and subsequent lines must be indented to line up with the first
-character of the first line of the description::
+The description of an argument or feature 'name' starts with
+'\@name:'.  The description text can start on the line following the
+'\@argname:', in which case it must not be indented at all.  It can
+also start on the same line as the '\@argname:'.  In this case if it
+spans multiple lines then second and subsequent lines must be indented
+to line up with the first character of the first line of the
+description::
 
  # @argone:
  # This is a two line description
@@ -979,6 +980,12 @@ The number of spaces between the ':' and the text is not significant.
 Extensions added after the definition was first released carry a
 '(since x.y.z)' comment.
 
+The feature descriptions must be preceded by a line "Features:", like
+this::
+
+  # Features:
+  # @feature: Description text
+
 A tagged section starts with one of the following words:
 "Note:"/"Notes:", "Since:", "Example"/"Examples", "Returns:", "TODO:".
 The section ends with the start of a new section.
-- 
2.31.1


