Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16386210CFF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 16:01:18 +0200 (CEST)
Received: from localhost ([::1]:39586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqdIb-0007tS-1p
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 10:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jqdEZ-0002OW-Bl
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 09:57:07 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:47060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jqdEW-0005rB-2u
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 09:57:07 -0400
Received: by mail-wr1-x432.google.com with SMTP id r12so23891641wrj.13
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 06:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m1Iumf3YfxuO4NhxteboEtLnibs/CAVIrPHuCmkmoi4=;
 b=SnlSS0zQX/Muk/NpdPlmirftbBZaI2iqZ7F8X01Q4MwhLWbv0XGRNNcT9/z4GjyVvY
 P99F3fUTrkK6ml5XHzFcxfCOwTzNswE1JKNc+2iiu8l24KZJIImlOmLCMIiYcc0D682j
 juKhCS9RWfILHaYvlM6O+XzlOHOAZaF1dtmiK+ZOLQg2+5/cRAVGaIF+ZyKfrOvNYsGw
 5shIZGmXnDFscDaUWiFXEkgKttzgUj+Ucn6Njgcu2ABlGsisvbuTe58/kbcozDu7lB6H
 Y0TRdMoOcXwjT88OCehjlrSKDo3v5hLqOSb/wrJ1UNH4EogGz4OCzl23Mi/F1jxoJPV4
 JrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m1Iumf3YfxuO4NhxteboEtLnibs/CAVIrPHuCmkmoi4=;
 b=XEM2PXeGUlbbQozPuq3jesgSugRSVArWaTUTWBYzDLoOSuirRKfx3qd1oUfHPk9bZ8
 RhDvwIv16TNPLWZM7OOv4voh7zIOx1eeUXA27iPdIN5SdwQgdge5+lGSNN6axO1jV6f8
 XK/twOXH/c7RWEao6vHVeAk7c2yY+JR8WVufGD7TfqCJyUe/yGJWwgtE3tyeB0g1ymmS
 WpeHN4XQupFrWjwHBus51ZcP1mrnBcm4xxTz/P+e2LAWbOzqZynJgrdzQK0FMEAMWTFB
 uKJWbS3rep4sof9ZdlzeQsp61hwGTY3TP2vMoZHThRt2BwQS7ZlKl4hrv9yYbU7FWfFQ
 q3lA==
X-Gm-Message-State: AOAM532G4jHTybbm8JmuWtoilhKwYMchm9U0DmUAFft37csL5s5dANtc
 WimK1Mx+x7cokibkQE6bH8LKuR1vGmw=
X-Google-Smtp-Source: ABdhPJxHAp9VDh3w7xsyS9lmWls5rfYiofvVyk9rdc29YD9ZqNlElGudl6VuU8oPe0au0wvO0dIM4Q==
X-Received: by 2002:a5d:4e48:: with SMTP id r8mr26381040wrt.309.1593611822633; 
 Wed, 01 Jul 2020 06:57:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 65sm7973132wma.48.2020.07.01.06.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 06:57:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4DFE71FF91;
 Wed,  1 Jul 2020 14:56:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v4 05/40] tests/vm: pass args through to BaseVM's __init__
Date: Wed,  1 Jul 2020 14:56:17 +0100
Message-Id: <20200701135652.1366-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200701135652.1366-1-alex.bennee@linaro.org>
References: <20200701135652.1366-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, berrange@redhat.com, Robert Foley <robert.foley@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Robert Foley <robert.foley@linaro.org>

Adding the args parameter to BaseVM's __init__.
We will shortly need to pass more parameters to the class
so let's just pass args rather than growing the parameter list.

Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200601211421.1277-2-robert.foley@linaro.org>
---
 tests/vm/basevm.py | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index a80b616a08d..5a58e6c3930 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -61,11 +61,10 @@ class BaseVM(object):
     # 4 is arbitrary, but greater than 2,
     # since we found we need to wait more than twice as long.
     tcg_ssh_timeout_multiplier = 4
-    def __init__(self, debug=False, vcpus=None, genisoimage=None,
-                 build_path=None):
+    def __init__(self, args):
         self._guest = None
-        self._genisoimage = genisoimage
-        self._build_path = build_path
+        self._genisoimage = args.genisoimage
+        self._build_path = args.build_path
         self._tmpdir = os.path.realpath(tempfile.mkdtemp(prefix="vm-test-",
                                                          suffix=".tmp",
                                                          dir="."))
@@ -78,7 +77,7 @@ class BaseVM(object):
         self._ssh_pub_key_file = os.path.join(self._tmpdir, "id_rsa.pub")
         open(self._ssh_pub_key_file, "w").write(SSH_PUB_KEY)
 
-        self.debug = debug
+        self.debug = args.debug
         self._stderr = sys.stderr
         self._devnull = open(os.devnull, "w")
         if self.debug:
@@ -92,8 +91,8 @@ class BaseVM(object):
                        (",ipv6=no" if not self.ipv6 else ""),
             "-device", "virtio-net-pci,netdev=vnet",
             "-vnc", "127.0.0.1:0,to=20"]
-        if vcpus and vcpus > 1:
-            self._args += ["-smp", "%d" % vcpus]
+        if args.jobs and args.jobs > 1:
+            self._args += ["-smp", "%d" % args.jobs]
         if kvm_available(self.arch):
             self._args += ["-enable-kvm"]
         else:
@@ -456,8 +455,7 @@ def main(vmcls):
             return 1
         logging.basicConfig(level=(logging.DEBUG if args.debug
                                    else logging.WARN))
-        vm = vmcls(debug=args.debug, vcpus=args.jobs,
-                   genisoimage=args.genisoimage, build_path=args.build_path)
+        vm = vmcls(args)
         if args.build_image:
             if os.path.exists(args.image) and not args.force:
                 sys.stderr.writelines(["Image file exists: %s\n" % args.image,
-- 
2.20.1


