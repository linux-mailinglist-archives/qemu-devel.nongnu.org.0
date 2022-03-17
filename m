Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29FA4DD18A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 00:58:36 +0100 (CET)
Received: from localhost ([::1]:36228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV00p-0007l4-RR
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 19:58:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUzsP-0001fO-A8
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 19:49:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUzsJ-0005ek-0j
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 19:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647560986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WH76NAyFYTutB95N/Tv755dauL1lUiYIkgbsbAkFzFQ=;
 b=TuygjA4s+6TZ05hWR+N57V3FruSENoXsFlhTcXjUxeqsJcAr/d1V0Ssx5RhWvOan8u6OGR
 jc/F5eIHmxFd6Wjo54gFEs8Rfs6sVsIkNGyK+0Z0UjI+/8IOqeevqv/xPYIAFM50bQeEwV
 l4W8TgAJs3ntu7ixDxUagLeV6zpx7UE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-hlrFIZKmMvyhS7Gwu00xtw-1; Thu, 17 Mar 2022 19:49:43 -0400
X-MC-Unique: hlrFIZKmMvyhS7Gwu00xtw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0676C899EC1;
 Thu, 17 Mar 2022 23:49:43 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9FCF112C256;
 Thu, 17 Mar 2022 23:49:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/18] python/utils: add add_visual_margin() text
 decoration utility
Date: Thu, 17 Mar 2022 19:49:20 -0400
Message-Id: <20220317234937.569525-2-jsnow@redhat.com>
In-Reply-To: <20220317234937.569525-1-jsnow@redhat.com>
References: <20220317234937.569525-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>> print(add_visual_margin(msg, width=72, name="Commit Message"))
┏━ Commit Message ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┃ add_visual_margin() takes a chunk of text and wraps it in a visual
┃ container that force-wraps to a specified width. An optional title
┃ label may be given, and any of the individual glyphs used to draw the
┃ box may be replaced or specified as well.
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Acked-by: Hanna Reitz <hreitz@redhat.com>
---
 python/qemu/utils/__init__.py | 78 +++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init__.py
index 7f1a5138c4..5babf40df2 100644
--- a/python/qemu/utils/__init__.py
+++ b/python/qemu/utils/__init__.py
@@ -15,7 +15,10 @@
 # the COPYING file in the top-level directory.
 #
 
+import os
 import re
+import shutil
+import textwrap
 from typing import Optional
 
 # pylint: disable=import-error
@@ -23,6 +26,7 @@
 
 
 __all__ = (
+    'add_visual_margin',
     'get_info_usernet_hostfwd_port',
     'kvm_available',
     'list_accel',
@@ -43,3 +47,77 @@ def get_info_usernet_hostfwd_port(info_usernet_output: str) -> Optional[int]:
         if match is not None:
             return int(match[1])
     return None
+
+
+# pylint: disable=too-many-arguments
+def add_visual_margin(
+        content: str = '',
+        width: Optional[int] = None,
+        name: Optional[str] = None,
+        padding: int = 1,
+        upper_left: str = '┏',
+        lower_left: str = '┗',
+        horizontal: str = '━',
+        vertical: str = '┃',
+) -> str:
+    """
+    Decorate and wrap some text with a visual decoration around it.
+
+    This function assumes that the text decoration characters are single
+    characters that display using a single monospace column.
+
+    ┏━ Example ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
+    ┃ This is what this function looks like with text content that's
+    ┃ wrapped to 72 characters. The right-hand margin is left open to
+    ┃ acommodate the occasional unicode character that might make
+    ┃ predicting the total "visual" width of a line difficult. This
+    ┃ provides a visual distinction that's good-enough, though.
+    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
+
+    :param content: The text to wrap and decorate.
+    :param width:
+        The number of columns to use, including for the decoration
+        itself. The default (None) uses the the available width of the
+        current terminal, or a fallback of 72 lines. A negative number
+        subtracts a fixed-width from the default size. The default obeys
+        the COLUMNS environment variable, if set.
+    :param name: A label to apply to the upper-left of the box.
+    :param padding: How many columns of padding to apply inside.
+    :param upper_left: Upper-left single-width text decoration character.
+    :param lower_left: Lower-left single-width text decoration character.
+    :param horizontal: Horizontal single-width text decoration character.
+    :param vertical: Vertical single-width text decoration character.
+    """
+    if width is None or width < 0:
+        avail = shutil.get_terminal_size(fallback=(72, 24))[0]
+        if width is None:
+            _width = avail
+        else:
+            _width = avail + width
+    else:
+        _width = width
+
+    prefix = vertical + (' ' * padding)
+
+    def _bar(name: Optional[str], top: bool = True) -> str:
+        ret = upper_left if top else lower_left
+        if name is not None:
+            ret += f"{horizontal} {name} "
+
+        filler_len = _width - len(ret)
+        ret += f"{horizontal * filler_len}"
+        return ret
+
+    def _wrap(line: str) -> str:
+        return os.linesep.join(
+            textwrap.wrap(
+                line, width=_width - padding, initial_indent=prefix,
+                subsequent_indent=prefix, replace_whitespace=False,
+                drop_whitespace=True, break_on_hyphens=False)
+        )
+
+    return os.linesep.join((
+        _bar(name, top=True),
+        os.linesep.join(_wrap(line) for line in content.splitlines()),
+        _bar(None, top=False),
+    ))
-- 
2.34.1


