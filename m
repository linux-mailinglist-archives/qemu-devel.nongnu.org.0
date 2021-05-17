Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1B438397A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:18:01 +0200 (CEST)
Received: from localhost ([::1]:51616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lifwO-0004Df-Lx
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpA-0007KZ-7k
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:32 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifp7-0005ue-If
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:31 -0400
Received: by mail-wr1-x432.google.com with SMTP id h4so6982479wrt.12
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4anbRy9FviqkY8a40nrkWVmNlHFbOTFzQrhdJnRiGmo=;
 b=L2Hj3uu7QaFy58CFLBAx+cwEsGdP7c2BHHyypLdfGb/iRj4x9NLRLvu9htIwosKqwi
 nn9amdVgnS1W1aqCCG7NUT7iahvX0i5Ac350GCwienQ3nNfCGPu8Xwlm0MdnrB8E/Kq8
 BBhBhC7Eccygdxg/Eb3uym64g0ONh8yZA9mveuV84jOyhkdPdNQTat2KyhyrbH6e3uLE
 7TFu/C+xprKPitYo5HxwR7PP+l2PASGupkIEJdR4cN9bDYsBWkkffSfFrX2nKaiA+l7h
 zfW/JXybJIreC6e4hNpaHLUet5tJB+ROVMrnX+CamFGJNl9vUcHL4l55Ud0UyCh3z8J9
 iwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4anbRy9FviqkY8a40nrkWVmNlHFbOTFzQrhdJnRiGmo=;
 b=ntSCTgUCIpOlSFKmjgX7G19CsUINtJ5cjlthuYzHRK3VK5/e5k/hf7R1E6N40KmQwj
 5z2Gy/u0AJTV3vImTg7eKRd1Mj3unduYoybVDO4yM/uUxPW2O18X/RyseoVEsSVFcEdN
 OOq62rM63/ym5Uu9hKrlJ4eG+hUj6iESklZkm5M3TYEYo601VUDir83kC4+Y+JeQb9Rz
 KQypD56CxiGucs4nqRXTFtxfTXTPePcdcJRucYkr7DqMCI4FIYIsTWlrLUWjcA+Xa+C0
 73Nq49Bp8fXih017jja7jwehnX99KnsmEav4E004hM44bVatKdX2i4hx4OgjQLm3PwJN
 cTFQ==
X-Gm-Message-State: AOAM533ujf2wjC9vDIiFTlID/ZMsWZ0iFSoTcv69QaiSS35ykQ3oVs3E
 wsxcaVz0/6lz9hauR+AU6v+z2A==
X-Google-Smtp-Source: ABdhPJwoBpsGxRWYkC+l8DIMVcCHE+8yMaLRnnH5thyFOPAEHhJvE8rLCDZk0DGKWgiKlvhMU4Ii/w==
X-Received: by 2002:a05:6000:551:: with SMTP id
 b17mr540007wrf.32.1621267828193; 
 Mon, 17 May 2021 09:10:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h14sm488057wmb.1.2021.05.17.09.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:10:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4EDC61FF8F;
 Mon, 17 May 2021 17:10:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 03/29] tests/docker: allow "update" to add the current user
Date: Mon, 17 May 2021 17:09:56 +0100
Message-Id: <20210517161022.13984-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current user functionality is used for cross compiling to avoid
complications with permissions when building test programs. However
for images that come from the registry we still need the ability to
add the user after the fact.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210512102051.12134-5-alex.bennee@linaro.org>

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 9b3425fec2..7a14058801 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -517,7 +517,7 @@ def run(self, args, argv):
 
 
 class UpdateCommand(SubCommand):
-    """ Update a docker image with new executables. Args: <tag> <executable>"""
+    """ Update a docker image. Args: <tag> <actions>"""
     name = "update"
 
     def args(self, parser):
@@ -525,6 +525,9 @@ def args(self, parser):
                             help="Image Tag")
         parser.add_argument("--executable",
                             help="Executable to copy")
+        parser.add_argument("--add-current-user", "-u", dest="user",
+                            action="store_true",
+                            help="Add the current user to image's passwd")
 
     def run(self, args, argv):
         # Create a temporary tarball with our whole build context and
@@ -564,6 +567,13 @@ def run(self, args, argv):
 
             df.write(u"ADD . /\n")
 
+        if args.user:
+            uid = os.getuid()
+            uname = getpwuid(uid).pw_name
+            df.write("\n")
+            df.write("RUN id %s 2>/dev/null || useradd -u %d -U %s" %
+                     (uname, uid, uname))
+
         df_bytes = BytesIO(bytes(df.getvalue(), "UTF-8"))
 
         df_tar = TarInfo(name="Dockerfile")
-- 
2.20.1


