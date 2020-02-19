Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C538F164B3D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 17:57:29 +0100 (CET)
Received: from localhost ([::1]:56536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4SfA-00073K-MB
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 11:57:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41897)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1j4SO7-0002eW-A9
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:39:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1j4SO6-0007xG-BN
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:39:51 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:37067)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1j4SO6-0007wc-5c
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:39:50 -0500
Received: by mail-pf1-x432.google.com with SMTP id p14so329535pfn.4
 for <qemu-devel@nongnu.org>; Wed, 19 Feb 2020 08:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=65Z4dVpY1gcxOALaGKWcd1F123zs7S6VnJl6E5T0NNc=;
 b=GaYQurh2Pbai5CmUe8nJnrigPOexEmspPBW9Vvhv/61ZKiAtSs1NFM/UrgjVVEnULP
 JjA550fgVdtnZXr1M+iug2JpLmj30Q6/9TX42IoUz1CHeENELRhgDdfG6rKSeV38YJCB
 S/0ztD8PuNRkexDJTcg5/N79p/TtIihjFZPIVMhM0XFfJ4Z/6AbkQKYrqPnSlHDsxklw
 mc0nyAmkWBa/FPdr/avrShGiBzSA8pq/tVDT9O58OuZeWswTEduJ8tG2dHT0Fw0T0LaI
 Y2fJcgbbIw08VAY77PfRSvYUBOneXIiQsdUGn/BseZ19jlBdevutjBhuu4VL5H27uVug
 gDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=65Z4dVpY1gcxOALaGKWcd1F123zs7S6VnJl6E5T0NNc=;
 b=pvsJaeh/eIm8em2KLZOR1eyPC1MA9jv3ftoNHa7phUXbVe1kkE0D3kLdC2B/9UlnUZ
 A/mogS0FjpYlcikju+yNMuH2GgDth63PVk2WII2y4xJYs4GXYyrwidh8C4JccbKE3c8N
 ytGgWIX839FYat2oL6rHCeS7ZNqF7OccR2rUmQx+wTp2+Xsp+96ZvTvvnybzcK0EmOiu
 ve3tzJJy5WG+Sa1lh/j1uQWTUFtgv23XMPhBU4uY5vPBAmj/HplbY+QL7lWYHLCndmAE
 73nLocI1icfWpIjNzJPwS5DnWzoydd9vSNY9nAzIwWekg48m8N4t4CDGevI/qGabyeyk
 iOMw==
X-Gm-Message-State: APjAAAUYdkJMtSHARLvDT5spd4xzO93WlW3WVeGnNz/pPOmoYKpN2c+j
 fQNvqtTLOFzKRhdkten0mjt2Z7V/bgI=
X-Google-Smtp-Source: APXvYqzv1TqfqMfATAwC6Pua0a0ePXkOhxT94Fzr67DVh8DsK/7N/hBOLMkw0Bxk3DvUL/p/94n50w==
X-Received: by 2002:a63:9251:: with SMTP id s17mr28329581pgn.127.1582130388959; 
 Wed, 19 Feb 2020 08:39:48 -0800 (PST)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:3cc2:5eb7:e248:ad23])
 by smtp.gmail.com with ESMTPSA id a69sm112362pfa.129.2020.02.19.08.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 08:39:48 -0800 (PST)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/14] tests/vm: Debug mode shows ssh output.
Date: Wed, 19 Feb 2020 11:35:25 -0500
Message-Id: <20200219163537.22098-3-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200219163537.22098-1-robert.foley@linaro.org>
References: <20200219163537.22098-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::432
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
Cc: philmd@redhat.com, alex.bennee@linaro.org, robert.foley@linaro.org,
 peter.puhov@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add changes to tests/vm/basevm.py so that during debug mode we show ssh output.

Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Peter Puhov <peter.puhov@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/basevm.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 4dee6647e6..c99725b8c0 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -120,11 +120,16 @@ class BaseVM(object):
         return fname
 
     def _ssh_do(self, user, cmd, check):
-        ssh_cmd = ["ssh", "-q", "-t",
+        ssh_cmd = ["ssh",
+                   "-t",
                    "-o", "StrictHostKeyChecking=no",
                    "-o", "UserKnownHostsFile=" + os.devnull,
                    "-o", "ConnectTimeout=1",
                    "-p", self.ssh_port, "-i", self._ssh_key_file]
+        # If not in debug mode, set ssh to quiet mode to
+        # avoid printing the results of commands.
+        if not self.debug:
+            ssh_cmd.append("-q")
         for var in self.envvars:
             ssh_cmd += ['-o', "SendEnv=%s" % var ]
         assert not isinstance(cmd, str)
-- 
2.17.1


