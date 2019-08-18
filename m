Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F52B9151C
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Aug 2019 08:41:38 +0200 (CEST)
Received: from localhost ([::1]:39470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzEsj-0006Pm-Jx
	for lists+qemu-devel@lfdr.de; Sun, 18 Aug 2019 02:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36390)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzErF-00056J-NH
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 02:40:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzErE-0000k7-Ev
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 02:40:05 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53149)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzErE-0000jl-9G
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 02:40:04 -0400
Received: by mail-wm1-x332.google.com with SMTP id o4so340101wmh.2
 for <qemu-devel@nongnu.org>; Sat, 17 Aug 2019 23:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ndW1MBgJZz0GTxmVD7WEDsm+sYC3ktueJpfSWfiaaTM=;
 b=qoY56WUDRp6DtmMmltOtCtCTw4MUD/Bv76rI9FOuCrfsHp08pjhiZ2MYi5yxJehjcQ
 w4e346MZwjgUBxjJmHNW8rSTLlN5uPvPJ0Gv8gtlRQjpTprkmQ3VhHq0y+tpzjhmrlSQ
 DmYe39POfLI2JSnftP+vCzTolbTgB+7Vl4B5xsDs5JMthov+VfrV16uMWwqyn6DlNs1X
 V2F+s5WOXScUBu5en1rdPYenF8M0e2F3Cgz8RoB55s6g8bBWD0QFIH2tX8zZ3blq8Z+k
 gfs9b0eRdPhcLlI7Ee0KKmF/npsP0hiw71wA5K7qWsOvQvX8H9FYaRFZ/Ah8OBuYrQC6
 mYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ndW1MBgJZz0GTxmVD7WEDsm+sYC3ktueJpfSWfiaaTM=;
 b=RAlzgTyujKqFXylhj+1feHCUg0TsEQBptJTfHfHUljXhypjfI4xZ3aTFEUt4jQFx7E
 LIYLbE31FYnSjejbT6/ipwIPXuGMLdVUNFeIrqFUr4bkUcQHKA0JzT4wDajnO6JkXnSJ
 wNx2ID5kmkI6NuTIoawnbaXaTtdsiDNSjvKFs03QPT0XIR3NAXX9v8Xlavhj98uu7jy/
 4rok6xiLgxqaL46kAKRD3s+Xt+W98kl8C9OViH/y4jYGo/Jp8SQa2ZKuHIavS+JOmNqg
 Ao2jgl6zgtotUvLON79XnS6kTbGxKYedVSLuJarj44iSe9QXDB784oQaAeA/RYH+Jr9b
 dWtg==
X-Gm-Message-State: APjAAAWLkm12ExoJaSvh+XfTYjYVQV24za9xfPE1/Sivf9vF2u+CM5NM
 NY8RxXuJ/UTt/89QCwJWe06ctjCTQTU=
X-Google-Smtp-Source: APXvYqyOSPMEGn6k8O6ndoXjWN7BVw9DcbsZ2TQD2ClEWvkreYmJiy7dz4TXiTCA/aXx1tzgHYn5aw==
X-Received: by 2002:a1c:1d86:: with SMTP id
 d128mr13225477wmd.123.1566110403060; 
 Sat, 17 Aug 2019 23:40:03 -0700 (PDT)
Received: from cloudburst.Home ([2a02:c7f:a69:1700:8897:9507:94c2:b98d])
 by smtp.gmail.com with ESMTPSA id r5sm9015435wmh.35.2019.08.17.23.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2019 23:40:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 18 Aug 2019 07:39:57 +0100
Message-Id: <20190818063959.14533-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190818063959.14533-1-richard.henderson@linaro.org>
References: <20190818063959.14533-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::332
Subject: [Qemu-devel] [PATCH v2 1/3] decodetree: Allow !function with no
 input bits
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Call this form a "parameter", returning a value extracted
from the DisasContext.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/devel/decodetree.rst         |  8 ++++-
 scripts/decodetree.py             | 49 ++++++++++++++++++++++++-------
 tests/decode/err_field6.decode    |  5 ++++
 tests/decode/succ_function.decode |  6 ++++
 4 files changed, 56 insertions(+), 12 deletions(-)
 create mode 100644 tests/decode/err_field6.decode
 create mode 100644 tests/decode/succ_function.decode

diff --git a/docs/devel/decodetree.rst b/docs/devel/decodetree.rst
index 44ac621ea8..ce7f52308f 100644
--- a/docs/devel/decodetree.rst
+++ b/docs/devel/decodetree.rst
@@ -23,7 +23,7 @@ Fields
 
 Syntax::
 
-  field_def     := '%' identifier ( unnamed_field )+ ( !function=identifier )?
+  field_def     := '%' identifier ( unnamed_field )* ( !function=identifier )?
   unnamed_field := number ':' ( 's' ) number
 
 For *unnamed_field*, the first number is the least-significant bit position
@@ -34,6 +34,12 @@ present, they are concatenated.  In this way one can define disjoint fields.
 If ``!function`` is specified, the concatenated result is passed through the
 named function, taking and returning an integral value.
 
+One may use ``!function`` with zero ``unnamed_fields``.  This case is called
+a *parameter*, and the named function is only passed the ``DisasContext``
+and returns an integral value extracted from there.
+
+A field with no ``unnamed_fields`` and no ``!function`` is in error.
+
 FIXME: the fields of the structure into which this result will be stored
 is restricted to ``int``.  Which means that we cannot expand 64-bit items.
 
diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index d7a59d63ac..31e2f04ecb 100755
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -245,7 +245,7 @@ class ConstField:
 
 
 class FunctionField:
-    """Class representing a field passed through an expander"""
+    """Class representing a field passed through a function"""
     def __init__(self, func, base):
         self.mask = base.mask
         self.sign = base.sign
@@ -266,6 +266,27 @@ class FunctionField:
 # end FunctionField
 
 
+class ParameterField:
+    """Class representing a pseudo-field read from a function"""
+    def __init__(self, func):
+        self.mask = 0
+        self.sign = 0
+        self.func = func
+
+    def __str__(self):
+        return self.func
+
+    def str_extract(self):
+        return self.func + '(ctx)'
+
+    def __eq__(self, other):
+        return self.func == other.func
+
+    def __ne__(self, other):
+        return not self.__eq__(other)
+# end FunctionField
+
+
 class Arguments:
     """Class representing the extracted fields of a format"""
     def __init__(self, nm, flds, extern):
@@ -433,17 +454,23 @@ def parse_field(lineno, name, toks):
 
     if width > insnwidth:
         error(lineno, 'field too large')
-    if len(subs) == 1:
-        f = subs[0]
+    if len(subs) == 0:
+        if func:
+            f = ParameterField(func)
+        else:
+            error(lineno, 'field with no value')
     else:
-        mask = 0
-        for s in subs:
-            if mask & s.mask:
-                error(lineno, 'field components overlap')
-            mask |= s.mask
-        f = MultiField(subs, mask)
-    if func:
-        f = FunctionField(func, f)
+        if len(subs) == 1:
+            f = subs[0]
+        else:
+            mask = 0
+            for s in subs:
+                if mask & s.mask:
+                    error(lineno, 'field components overlap')
+                mask |= s.mask
+            f = MultiField(subs, mask)
+        if func:
+            f = FunctionField(func, f)
 
     if name in fields:
         error(lineno, 'duplicate field', name)
diff --git a/tests/decode/err_field6.decode b/tests/decode/err_field6.decode
new file mode 100644
index 0000000000..a719884572
--- /dev/null
+++ b/tests/decode/err_field6.decode
@@ -0,0 +1,5 @@
+# This work is licensed under the terms of the GNU LGPL, version 2 or later.
+# See the COPYING.LIB file in the top-level directory.
+
+# Diagnose no bits in field
+%field
diff --git a/tests/decode/succ_function.decode b/tests/decode/succ_function.decode
new file mode 100644
index 0000000000..7751b1784e
--- /dev/null
+++ b/tests/decode/succ_function.decode
@@ -0,0 +1,6 @@
+# This work is licensed under the terms of the GNU LGPL, version 2 or later.
+# See the COPYING.LIB file in the top-level directory.
+
+# "Field" as parameter pulled from DisasContext.
+%foo  !function=foo
+foo   00000000000000000000000000000000 %foo
-- 
2.17.1


