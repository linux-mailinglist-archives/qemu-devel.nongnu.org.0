Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE19815CA27
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 19:19:46 +0100 (CET)
Received: from localhost ([::1]:57596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2J5V-0004dF-TL
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 13:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2Ik3-00015h-9T
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 12:57:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2Ik0-0003WG-Kp
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 12:57:35 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:34729)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2Ik0-0003UU-DB
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 12:57:32 -0500
Received: by mail-wr1-x443.google.com with SMTP id n10so5873416wrm.1
 for <qemu-devel@nongnu.org>; Thu, 13 Feb 2020 09:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AtxEKrKRqNjfOrT9JbNHlMjgTudjr9VoMdnqfaiOYHo=;
 b=I4+X7x9nkXMTo3cW1cxmLx38gFKcu8rtt/clXujOGlYgO52GPOYXm9m7aa5BaF+cuh
 FZgA8Zzf1dVhOJ2m+hGauORRaOpBG5SGgaZ8KBKbcbpHb/sFFUHJDug5MD9HgXR7ejjM
 CVVofs86mfTAkNntXKmQFKnIJ5+8VBQxrJ900CkNK0U/TDs0YLoXSkOzTSgU18jPyety
 tAGFB8yaVkHM10Zj+igXo4yiYuvuA77bwkgRFBSWo5N1nJIEv1zM1BiWggJUJbaR2gUr
 pwelvJH+WDrHyC5GnexthFbD6bSDPyLw0B+ncOK0hZjHo/X0maAFtcWVPU4C+VToDiLX
 /auA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AtxEKrKRqNjfOrT9JbNHlMjgTudjr9VoMdnqfaiOYHo=;
 b=a4CXxcyaFD89ucaavogANBMz1BK/9WSVO2KQsrz9b+2xXeuKFhsIvEi/YTKqrrj2PA
 e+Q+lw9KGZ5uFfOBSWrImkfZPKKw+iAdTbtgCdp0CScr/oRNsvFb3SuNtUjJIYx/7WVz
 d6BILHrRb5+U1KIqE57nbnrCEgkEIO1jbObVLyqHVEEK+yck8iKzPao8qQp3eBt2kr9C
 z04yc8SC7m4B0BPjPmTVwQDB1EL46R6iIYYaNzg09NR/syuuwlI8weI4ddbbjkrNlPYh
 LJD6bKURlJ5uyH6kAraJk5fLergE3eF96cP/xoHzatMGZfJZHRnxNh07YuDcBiNFYrr/
 +qdw==
X-Gm-Message-State: APjAAAWkIU9IiyPCbBj13t6mUB9GUD5W7FYajWU0x6A6m+YT8AEb3MaX
 SUIol1zeXPupEY1Uulv91mcV0diXFis=
X-Google-Smtp-Source: APXvYqwOWyzmktsHVOUDehBMzDvEIIkgU8lsnBIJM6aitMr1yPcrFkAv94uS8gdIOLe1Rs0WCJq7YQ==
X-Received: by 2002:a5d:65c5:: with SMTP id e5mr22464807wrw.311.1581616651041; 
 Thu, 13 Feb 2020 09:57:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p26sm3692913wmc.24.2020.02.13.09.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 09:57:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/30] docs/devel/qapi-code-gen.txt: Update to new rST
 backend conventions
Date: Thu, 13 Feb 2020 17:56:47 +0000
Message-Id: <20200213175647.17628-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200213175647.17628-1-peter.maydell@linaro.org>
References: <20200213175647.17628-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the documentation of QAPI document comment syntax to match
the new rST backend requirements. The principal changes are:
 * whitespace is now significant, and multiline definitions
   must have their second and subsequent lines indented to
   match the first line
 * general rST format markup is permitted, not just the small
   set of markup the old texinfo generator handled. For most
   things (notably bulleted and itemized lists) the old format
   is the same as rST was.
 * Specific things that might trip people up:
   - instead of *bold* and _italic_ rST has **bold** and *italic*
   - lists need a preceding and following blank line
   - a lone literal '*' will need to be backslash-escaped to
     avoid a rST syntax error
 * the old leading '|' for example (literal text) blocks is
   replaced by the standard rST '::' literal block.
 * headings and subheadings must now be in a freeform
   documentation comment of their own
 * we support arbitrary levels of sub- and sub-sub-heading, not
   just a main and sub-heading like the old texinfo generator

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/qapi-code-gen.txt | 90 ++++++++++++++++++++++++------------
 1 file changed, 61 insertions(+), 29 deletions(-)

diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
index 59d6973e1ec..688eb2a0237 100644
--- a/docs/devel/qapi-code-gen.txt
+++ b/docs/devel/qapi-code-gen.txt
@@ -795,21 +795,39 @@ See below for more on definition documentation.
 Free-form documentation may be used to provide additional text and
 structuring content.
 
+==== Headings and subheadings ====
+
+A free-form documentation comment containing a single line
+which starts with some '=' symbols and then a space defines
+a section heading:
+
+    ##
+    # = This is a top level heading
+    ##
+
+    ##
+    # This is a free-form comment which will go under the
+    # top level heading.
+    ##
+
+    ##
+    # == This is a second level heading
+    ##
+
+Section headings must always be correctly nested, so you can only
+define a third-level heading inside a second-level heading, and so
+on. The documentation generator will catch nesting mistakes and report
+a syntax error.
 
 ==== Documentation markup ====
 
-Comment text starting with '=' is a section title:
+Documentation comments can use most rST markup. In particular,
+a '::' literal block can be used for examples:
 
-    # = Section title
-
-Double the '=' for a subsection title:
-
-    # == Subsection title
-
-'|' denotes examples:
-
-    # | Text of the example, may span
-    # | multiple lines
+    # ::
+    #
+    #   Text of the example, may span
+    #   multiple lines
 
 '*' starts an itemized list:
 
@@ -825,37 +843,35 @@ A decimal number followed by '.' starts a numbered list:
     #    multiple lines
     # 2. Second item
 
-The actual number doesn't matter.  You could even use '*' instead of
-'2.' for the second item.
+The actual number doesn't matter.
 
-Lists can't be nested.  Blank lines are currently not supported within
-lists.
+Lists of either kind must be preceded and followed by a blank line.
+If a list item's text spans multiple lines, then the second and
+subsequent lines must be correctly indented to line up with the
+first character of the first line.
 
-Additional whitespace between the initial '#' and the comment text is
-permitted.
-
-*foo* and _foo_ are for strong and emphasis styles respectively (they
-do not work over multiple lines).  @foo is used to reference a name in
-the schema.
+The usual '**strong**', '*emphasised*' and '``literal``' markup should
+be used. If you need a single literal '*' you will need to backslash-escape it.
+As an extension beyond the usual rST syntax, you can also
+use '@foo' to reference a name in the schema; this is rendered
+the same way as '``foo``'.
 
 Example:
 
 ##
-# = Section
-# == Subsection
-#
-# Some text foo with *strong* and _emphasis_
+# Some text foo with **bol** and *emphasis*
 # 1. with a list
 # 2. like that
 #
 # And some code:
-# | $ echo foo
-# | -> do this
-# | <- get that
 #
+# ::
+#
+#   $ echo foo
+#   -> do this
+#   <- get that
 ##
 
-
 ==== Definition documentation ====
 
 Definition documentation, if present, must immediately precede the
@@ -870,6 +886,12 @@ commands and events), member (for structs and unions), branch (for
 alternates), or value (for enums), and finally optional tagged
 sections.
 
+Descriptions of arguments can span multiple lines; if they
+do then the second and subsequent lines must be indented
+to line up with the first character of the first line of the
+description. The parser will report a syntax error if there
+is insufficient indentation.
+
 FIXME: the parser accepts these things in almost any order.
 FIXME: union branches should be described, too.
 
@@ -883,6 +905,16 @@ The section ends with the start of a new section.
 A 'Since: x.y.z' tagged section lists the release that introduced the
 definition.
 
+The text of a section can start on a new line, in
+which case it must not be indented at all. It can also start
+on the same line as the 'Note:', 'Returns:', etc tag. In this
+case if it spans multiple lines then second and subsequent
+lines must be indented to match the first.
+
+An 'Example' or 'Examples' section is automatically rendered
+entirely as literal fixed-width text. In other sections,
+the text is formatted, and rST markup can be used.
+
 For example:
 
 ##
-- 
2.20.1


