Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF137286A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:04:32 +0200 (CEST)
Received: from localhost ([::1]:37636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrup-0003oP-3j
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrsw-0002Pl-5B
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:34 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrst-00034c-K0
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:33 -0400
Received: by mail-wm1-x32c.google.com with SMTP id o127so880904wmo.4
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TuKozATKQ3Td5Fp2Tf/kZG/QQ+gsJcItcXeBYs6um/I=;
 b=zT2tMGNoVR0OUhvLLWkQe4JvtgcVPBP4Aspd3sBsRqReY/olChOA4aL7fB+rlYm7gk
 D1a2nm4miKfB7+7VcorGbe7JhaebukSozKB4IooX36xl/mRS1AJfk+omU4DYx4S5IgM4
 nOpeuq3E7+s3lNYTThInz71z8WL1O2pkK9TwNtrKl0jLn5dsq7maH0eiYAVRItptdfq1
 uP9rLZDOHl8NZqpNDxtu+ePmBuDgd6Jj7r66xoeKbVFG7k7OVFroWVEyn8x0vQ7rxToC
 lqbsczI5QA3NeVtpVgJNCZwZChQWFHvi+arNJpKPQSJpjum89IleapmsFjzoQ/rx2PWB
 Sq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TuKozATKQ3Td5Fp2Tf/kZG/QQ+gsJcItcXeBYs6um/I=;
 b=RCJe7i3/UN1OrinhihWCs+r3F8CNhtYNRMUgzFJvzN4OBfrNbMwxSBKN6vylP/Xdh9
 MBOKWKOvvViTK1wElwJT8Ov/4dEXxzuVT1Nl6hcHVdmDaznAweSkeZMxIy/u/iSzcEW/
 a4teoX7HZou5tCIyoB8Wof4qdxH3WM5f5imkMiZoSwtLKbsQNcjF2XZjbWeQ7a0G8z/Z
 klGgDALIwt0bpnEgpBV6LUAPfyjRiufviBtf9dSVWhQmdWMiRVYyxEwV3HSzFTmzADA1
 +N2pous11fEiXLet9UTlq1wII3eZbsWYgKN2B7LsnRCs1mVgCsCX4uOhv90RmweQ3bFH
 LHTQ==
X-Gm-Message-State: AOAM530oUHLBxCdXc4nAwgtsIXZVqbI8Sjd9qxQT2MUsg18ArzApe6SJ
 t4jaNn+NO1XLXidOU9luku7oPA==
X-Google-Smtp-Source: ABdhPJyBCnD/gUX2nWh08tUTnZN+PJ83KVW0jgYHajQAAUPtsw1h2Kn/+bb7Nttvg2kVWY06gPShTg==
X-Received: by 2002:a7b:c8ca:: with SMTP id f10mr26462250wml.118.1620122549654; 
 Tue, 04 May 2021 03:02:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j13sm20955286wrd.81.2021.05.04.03.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:02:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AB3211FF8C;
 Tue,  4 May 2021 11:02:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/30] tests/docker: fix copying of executable in "update"
Date: Tue,  4 May 2021 11:01:55 +0100
Message-Id: <20210504100223.25427-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have the same symlink chasing problem when doing an "update"
operation. Fix that.

Based-on: 5e33f7fead ("tests/docker: better handle symlinked libs")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
---
 tests/docker/docker.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index d28df4c140..0435a55d10 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -548,7 +548,14 @@ def run(self, args, argv):
         libs = _get_so_libs(args.executable)
         if libs:
             for l in libs:
-                tmp_tar.add(os.path.realpath(l), arcname=l)
+                so_path = os.path.dirname(l)
+                name = os.path.basename(l)
+                real_l = os.path.realpath(l)
+                try:
+                    tmp_tar.add(real_l, arcname="%s/%s" % (so_path, name))
+                except FileNotFoundError:
+                    print("Couldn't add %s/%s to archive" % (so_path, name))
+                    pass
 
         # Create a Docker buildfile
         df = StringIO()
-- 
2.20.1


