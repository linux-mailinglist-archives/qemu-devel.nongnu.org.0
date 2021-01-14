Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43562F5742
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 03:35:32 +0100 (CET)
Received: from localhost ([::1]:55496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzsTz-0007Tr-Ov
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 21:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCn-0003ve-Sj
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:45 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCh-0003Yu-Sh
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:45 -0500
Received: by mail-pg1-x52a.google.com with SMTP id z21so2748006pgj.4
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 18:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BFho4U3fob4m3gWpchyMGBLbmRuOR0wIULlt2gnx2gA=;
 b=P8AsBAjCe1GbV/I2MyFKU+agoFuPCHOPymRwWQTXv2nvPqpqL9GU5Pcc35iufRjyGH
 1Kirl1N2o9muhkqmfR9GPr9e2n1bfx2M8e7vigBCTScsOGs7GdsqQhBAkW8dGlgun8HG
 1hygl/1M3Osn9roA64CdeurAdfay9+h2ousHY1Y4dsE7tPdOE2996gQyuJDiUCKjr/NX
 qabzgdu11LZG4RlWYimXkHS+R155yMGpf8Qq2J6mkfKVTmzQOABoDhKPkDvOVrpQ+gzy
 RCjScl1lgifWQCbFPOuwjXVpU/pbufYJKtCgbrauIQxUqbujRLjzDNm9iDtteicPxmaO
 RmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BFho4U3fob4m3gWpchyMGBLbmRuOR0wIULlt2gnx2gA=;
 b=DeMwNja62hDFRYsZx13SLJgF50e1lq0oiLUsMXZRlDZ4H4aGsFouOBG3JkR6xCca1l
 qD5r/H4l/fHlo24jyP4gdeID31Asrjmq2SIDTlakRyDuJvxbFOdB2zWPnq/TPEYL+RUz
 AJ4p8ujmKLtRN6OYJa3ueaNqnjVLu2IcgqAZvVUQjNJvlHj9I4EXuw01zLdbWbY2bI1P
 Em4GC2Ng9SXcbZDAgqQWidSu7fuswub0qh37b0sRWzDP3pBvLUdpi9EJ+bopsqDjz0q8
 6h5tsSov5WCFBTrZjMgn0e2rObck7PaBGxQilSZobFpzMayR0S/vg/u0RjInAFKH4PLf
 ehiA==
X-Gm-Message-State: AOAM530tZ9+4Pea6s5ghiQeSnyOBzxOhD4cgAbD6PA1ssJkvTyiCC1Tv
 tbOYUeHA+2gxMJ3nPN+gbe2Tdg7IdwPObQ==
X-Google-Smtp-Source: ABdhPJyNa4moMdXor+QjzO0WXacFEeIDvHfajryQFUIrtXvEYKFEYxsNjrYn+c/U1oZZwVQ5F8j6XA==
X-Received: by 2002:a65:4347:: with SMTP id k7mr5024198pgq.186.1610590658332; 
 Wed, 13 Jan 2021 18:17:38 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i7sm3771687pfc.50.2021.01.13.18.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 18:17:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/24] decodetree: Open files with encoding='utf-8'
Date: Wed, 13 Jan 2021 16:16:54 -1000
Message-Id: <20210114021654.647242-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114021654.647242-1-richard.henderson@linaro.org>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When decodetree.py was added in commit 568ae7efae7, QEMU was
using Python 2 which happily reads UTF-8 files in text mode.
Python 3 requires either UTF-8 locale or an explicit encoding
passed to open(). Now that Python 3 is required, explicit
UTF-8 encoding for decodetree source files.

To avoid further problems with the user locale, also explicit
UTF-8 encoding for the generated C files.

Explicit both input/output are plain text by using the 't' mode.

This fixes:

  $ /usr/bin/python3 scripts/decodetree.py test.decode
  Traceback (most recent call last):
    File "scripts/decodetree.py", line 1397, in <module>
      main()
    File "scripts/decodetree.py", line 1308, in main
      parse_file(f, toppat)
    File "scripts/decodetree.py", line 994, in parse_file
      for line in f:
    File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
      return codecs.ascii_decode(input, self.errors)[0]
  UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position 80:
  ordinal not in range(128)

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Suggested-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210110000240.761122-1-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 scripts/decodetree.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 47aa9caf6d..4637b633e7 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -20,6 +20,7 @@
 # See the syntax and semantics in docs/devel/decodetree.rst.
 #
 
+import io
 import os
 import re
 import sys
@@ -1304,7 +1305,7 @@ def main():
 
     for filename in args:
         input_file = filename
-        f = open(filename, 'r')
+        f = open(filename, 'rt', encoding='utf-8')
         parse_file(f, toppat)
         f.close()
 
@@ -1324,9 +1325,11 @@ def main():
         prop_size(stree)
 
     if output_file:
-        output_fd = open(output_file, 'w')
+        output_fd = open(output_file, 'wt', encoding='utf-8')
     else:
-        output_fd = sys.stdout
+        output_fd = io.TextIOWrapper(sys.stdout.buffer,
+                                     encoding=sys.stdout.encoding,
+                                     errors="ignore")
 
     output_autogen()
     for n in sorted(arguments.keys()):
-- 
2.25.1


