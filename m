Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83EE18F97C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 17:17:35 +0100 (CET)
Received: from localhost ([::1]:36550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGPle-0002ho-LS
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 12:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35334)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jGPjX-0000vH-S0
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 12:15:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jGPjW-0002RK-Re
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 12:15:23 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44935)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jGPjW-0002Qm-LW
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 12:15:22 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m17so8851026wrw.11
 for <qemu-devel@nongnu.org>; Mon, 23 Mar 2020 09:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Ty4eO6Ev+04Qtw2TEL/gDfTLAR/usVuftyy5cqXWdU=;
 b=klOX9BlInJBQoNAgsYn4YZtvK/QTIiFx2R2cTPqOVAS/B5w840Kb0BuaM1Uu3b43Si
 eVdbXxVq+mbYGbeNwWJH0Gtzd4BKbywROQgbnIivgKazNifCbyJhPxDgp/L9+QgLOQgQ
 BdwMcD10qhEBY12H68uKyZQbVu7Ua/5U0Czb1lh2eMVKrKt8qbuMCIyi2PN/sWjdAD2F
 0UXjHVL0dM1VPXXFtYUw2Q33mWi7vTSAnnCWJnX65KEykG082SPkfOvWsCTAvnIiunwi
 UHWnEWtxoR3StScRYPZDH8mDH5TUGXF28IlwuzbbKei9oIJMtaZvbdQQR+qYALbM2+AS
 a9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Ty4eO6Ev+04Qtw2TEL/gDfTLAR/usVuftyy5cqXWdU=;
 b=hBMTieLk+ltIMWllXtpvXBTr9n9E1GaFGrf3V3PERkWShlxFN+TFAX7ObKn08osR/B
 s7eNnWmvjqiAYTrJRnQWvatkkc6+qR55Q7FiqB3+A5DIHwLv4kqFnlfDQh87l8enlom7
 F/eLo07t0Z0GH80Nz9zycK5pwC4extON/W0lXK5tOkqJcIgvYkqTLROsjnuxdrKRNvaM
 ylNwefcQy2IhT+M0Ku/orDWH51f+feVg5RiqSEXVq4KOlxdH/oaH2VwyXG3YmeYz4iw2
 9K0cALdIVpUHbp1Ut3U5TRKR5HBy2h0CEPuYUf3AY5XRCMfWzmXb71oG23PKBbN2OK8e
 1DJA==
X-Gm-Message-State: ANhLgQ3XeJhH/GodVPPqJ+cDURTkKUdywQdbuknkaAisFF/MYu/vihuv
 Yx9EjiZVjwY9bxt+F6YkeM5VUw==
X-Google-Smtp-Source: ADFU+vuepE8Hu+0s4HejdSNeTqhhWWoq8kyFTLcCzgiSzukgCu/OLzMZ+05xR1IUcWAiuOw83KJfuQ==
X-Received: by 2002:a5d:644c:: with SMTP id d12mr31522581wrw.54.1584980121634; 
 Mon, 23 Mar 2020 09:15:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o67sm90472wmo.5.2020.03.23.09.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 09:15:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A77211FF91;
 Mon, 23 Mar 2020 16:15:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 05/11] tests/vm: fix basevm config
Date: Mon, 23 Mar 2020 16:15:08 +0000
Message-Id: <20200323161514.23952-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200323161514.23952-1-alex.bennee@linaro.org>
References: <20200323161514.23952-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42e
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the patch was merged it was part of a longer series which had
already merged the config changes. Semu-revert the config related
changes for now so things will build.

Fixes: b081986c85fd2
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/basevm.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index cffe7c4600e..756ccf7acae 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -358,23 +358,23 @@ class BaseVM(object):
                           "local-hostname: {}-guest\n".format(name)])
         mdata.close()
         udata = open(os.path.join(cidir, "user-data"), "w")
-        print("guest user:pw {}:{}".format(self._config['guest_user'],
-                                           self._config['guest_pass']))
+        print("guest user:pw {}:{}".format(self.GUEST_USER,
+                                           self.GUEST_PASS))
         udata.writelines(["#cloud-config\n",
                           "chpasswd:\n",
                           "  list: |\n",
-                          "    root:%s\n" % self._config['root_pass'],
-                          "    %s:%s\n" % (self._config['guest_user'],
-                                           self._config['guest_pass']),
+                          "    root:%s\n" % self.ROOT_PASS,
+                          "    %s:%s\n" % (self.GUEST_USER,
+                                           self.GUEST_PASS),
                           "  expire: False\n",
                           "users:\n",
-                          "  - name: %s\n" % self._config['guest_user'],
+                          "  - name: %s\n" % self.GUEST_USER,
                           "    sudo: ALL=(ALL) NOPASSWD:ALL\n",
                           "    ssh-authorized-keys:\n",
-                          "    - %s\n" % self._config['ssh_pub_key'],
+                          "    - %s\n" % SSH_PUB_KEY,
                           "  - name: root\n",
                           "    ssh-authorized-keys:\n",
-                          "    - %s\n" % self._config['ssh_pub_key'],
+                          "    - %s\n" % SSH_PUB_KEY,
                           "locale: en_US.UTF-8\n"])
         proxy = os.environ.get("http_proxy")
         if not proxy is None:
-- 
2.20.1


