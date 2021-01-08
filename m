Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613442EF712
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:12:52 +0100 (CET)
Received: from localhost ([::1]:57250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxwFm-0006lp-Ud
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxwD4-0005YR-8y
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:10:02 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxwCz-0002lJ-S9
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:10:00 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 91so9866711wrj.7
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 10:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u12OZGwUYSRhqf5Zl/ovMgA/ZyRB7aMBFfpQgY5/rgs=;
 b=ZW0j5P/7jTbMSvIYOA6zJCcnIJHg1JH4jI7S5hUmGGGebfRLR3vDU1N9xfLvWp1iKm
 5Ct9FUIGV0uVXTuT4NNcHjKZxMNTeZfh/uJvuz1hnq8cDTRg6VpfwMXxkBMtR+HmKv1t
 yWtlTExymIvvwCuHqNNeDYi2OZTfovjUeSGceC47kr1TZ3cKRJI/6Y+CqsKRux7LjRWX
 /MZHTyygIQChISWmi/kh/byyOVSXz5tN0R8es91T+q2YOQ4cAoZjZRpNiOVsI7wppT/C
 +kvdlYFQjtE8nEz+/cJS3eozq6Ef9Q+EipJMGM5e0hc+MwnreLRwhUnNDHizfTof8jYt
 ZVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=u12OZGwUYSRhqf5Zl/ovMgA/ZyRB7aMBFfpQgY5/rgs=;
 b=eVoNtv+Wlivx4tvFuZVZjmDHLHKWzSyKMXb+udVX35Re94B7BEp7NNV6GHC6v3EdZI
 MEG0vblnllY/wD+jmuOa7eUlclgN99L6U2dQ7LEz7h6H/Bxk+qp6YZNz5Ot1s3ua6kDA
 0TtJbZD5Y/QNfyTNulwCPmExAm10W+ZD3ueLgm1+6Zayo0Gwtr1olqaQHtovqzKBsA85
 gf4FFVlrW5C4WSSdp4MmOnFvVMtwvkqABUutATB0F9VbxinI+Pd86VPohZVSprYRAMDw
 W+QvKEZZ8fw30ArXvh6NskRg6Zftt2dfHUSiVJ1JiMfqsbTFXi3RKUQ9tV0/ZW94ffbq
 Q4qw==
X-Gm-Message-State: AOAM533i5fT+c+K+4/vE3cL6JqVP4Pb/tJDEQu2lNYlxv62ugkxUOG+M
 kxn/tCzod1eOe+xFk+BtPpOTe3VfoyA=
X-Google-Smtp-Source: ABdhPJzzv3DZv/ZKzEcDGOpOPckEkP0BuiKkZxsRGFIqrrJ0f7YhEq+tnqkEl6lz2OE9/l+PE7y71w==
X-Received: by 2002:a5d:6ccb:: with SMTP id c11mr4813607wrc.224.1610129395003; 
 Fri, 08 Jan 2021 10:09:55 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id o83sm12820962wme.21.2021.01.08.10.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:09:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] decodetree: Open files with encoding='utf-8'
Date: Fri,  8 Jan 2021 19:09:52 +0100
Message-Id: <20210108180952.358947-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: utf-8 output too (Peter)
    explicit default text mode.
---
 scripts/decodetree.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 47aa9caf6d1..d3857066cfc 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -1304,7 +1304,7 @@ def main():
 
     for filename in args:
         input_file = filename
-        f = open(filename, 'r')
+        f = open(filename, 'rt', encoding='utf-8')
         parse_file(f, toppat)
         f.close()
 
@@ -1324,7 +1324,7 @@ def main():
         prop_size(stree)
 
     if output_file:
-        output_fd = open(output_file, 'w')
+        output_fd = open(output_file, 'wt', encoding='utf-8')
     else:
         output_fd = sys.stdout
 
-- 
2.26.2


