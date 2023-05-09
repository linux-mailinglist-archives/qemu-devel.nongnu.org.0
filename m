Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73176FC137
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 10:06:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwIGv-00006g-3I; Tue, 09 May 2023 04:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGp-0008Uc-Bz
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGn-0008Vd-OW
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683619225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/+Lset5oEsQmEpBwGbsoSuHyreGN9KkIHHIdajSAkIw=;
 b=OYkRBZVbV0yB4KxOph8BZMBVPI58/yLuOvaX+2svvT6Ji/XmYCRi6rAeWYvGdGRK/j7/0k
 cjtqjIJURr0TrMtNmepJ2PVrs826mOAn5dueymMP9im/2caEeClPRWIOGBIoFyXv41l4cL
 FbY16l+LOzMXB/46Bmsz29cd4PvhnVc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-rmfnKBqYOzW26_nCL61Y8Q-1; Tue, 09 May 2023 04:00:21 -0400
X-MC-Unique: rmfnKBqYOzW26_nCL61Y8Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F443811E7C;
 Tue,  9 May 2023 08:00:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CABA72166B26;
 Tue,  9 May 2023 08:00:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3F2CD21F1645; Tue,  9 May 2023 10:00:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Juan Quintela <quintela@redhat.com>
Subject: [PULL 15/17] docs/devel/qapi-code-gen: Update doc comment conventions
Date: Tue,  9 May 2023 10:00:09 +0200
Message-Id: <20230509080011.3231661-16-armbru@redhat.com>
In-Reply-To: <20230509080011.3231661-1-armbru@redhat.com>
References: <20230509080011.3231661-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The commit before previous relaxed the indentation rules to let us
improve the doc comment conventions.  This commit changes the written
conventions.  The next commits will update QAPI schemas to conform to
them.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230428105429.1687850-16-armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 docs/devel/qapi-code-gen.rst | 46 +++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index 875f893be2..5618a80378 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -947,6 +947,11 @@ Example::
  #   <- get that
  ##
 
+For legibility, wrap text paragraphs so every line is at most 70
+characters long.
+
+Separate sentences with two spaces.
+
 
 Definition documentation
 ~~~~~~~~~~~~~~~~~~~~~~~~
@@ -963,22 +968,12 @@ commands and events), member (for structs and unions), branch (for
 alternates), or value (for enums), a description of each feature (if
 any), and finally optional tagged sections.
 
-The description of an argument or feature 'name' starts with
-'\@name:'.  The description text can start on the line following the
-'\@name:', in which case it must not be indented at all.  It can also
-start on the same line as the '\@name:'.  In this case if it spans
-multiple lines then second and subsequent lines must be indented to
-line up with the first character of the first line of the
-description::
+Descriptions start with '\@name:'.  The description text should be
+indented like this::
 
- # @argone:
- # This is a two line description
- # in the first style.
- #
- # @argtwo: This is a two line description
- #          in the second style.
+ # @name: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
+ #     do eiusmod tempor incididunt ut labore et dolore magna aliqua.
 
-The number of spaces between the ':' and the text is not significant.
 .. FIXME The parser accepts these things in almost any order.
 
 .. FIXME union branches should be described, too.
@@ -990,23 +985,26 @@ The feature descriptions must be preceded by a line "Features:", like
 this::
 
   # Features:
+  #
   # @feature: Description text
 
 A tagged section starts with one of the following words:
 "Note:"/"Notes:", "Since:", "Example"/"Examples", "Returns:", "TODO:".
 The section ends with the start of a new section.
 
-The text of a section can start on a new line, in
-which case it must not be indented at all.  It can also start
-on the same line as the "Note:", "Returns:", etc tag.  In this
-case if it spans multiple lines then second and subsequent
-lines must be indented to match the first, in the same way as
-multiline argument descriptions.
+The second and subsequent lines of sections other than
+"Example"/"Examples" should be indented like this::
+
+ # Note: Ut enim ad minim veniam, quis nostrud exercitation ullamco
+ #     laboris nisi ut aliquip ex ea commodo consequat.
+ #
+ #     Duis aute irure dolor in reprehenderit in voluptate velit esse
+ #     cillum dolore eu fugiat nulla pariatur.
 
 A "Since: x.y.z" tagged section lists the release that introduced the
 definition.
 
-An "Example" or "Examples" section is automatically rendered entirely
+An "Example" or "Examples" section is rendered entirely
 as literal fixed-width text.  "TODO" sections are not rendered at all
 (they are for developers, not users of QMP).  In other sections, the
 text is formatted, and rST markup can be used.
@@ -1019,7 +1017,7 @@ For example::
  # Statistics of a virtual block device or a block backing device.
  #
  # @device: If the stats are for a virtual block device, the name
- #          corresponding to the virtual block device.
+ #     corresponding to the virtual block device.
  #
  # @node-name: The node name of the device. (since 2.3)
  #
@@ -1036,8 +1034,8 @@ For example::
  #
  # Query the @BlockStats for all virtual block devices.
  #
- # @query-nodes: If true, the command will query all the
- #               block nodes ... explain, explain ...  (since 2.3)
+ # @query-nodes: If true, the command will query all the block nodes
+ #     ... explain, explain ...  (since 2.3)
  #
  # Returns: A list of @BlockStats for each virtual block devices.
  #
-- 
2.39.2


