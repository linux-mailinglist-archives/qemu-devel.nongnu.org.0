Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E45D660203
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 15:22:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDnbQ-0006ES-Ag; Fri, 06 Jan 2023 09:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=36316be06=anthony.perard@citrix.com>)
 id 1pDnbJ-0006Du-Ty
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 09:21:45 -0500
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=36316be06=anthony.perard@citrix.com>)
 id 1pDnbH-0005Ay-Ir
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 09:21:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1673014899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=km7sV/ybAsL1Rzjn+8UjJCjAMHBXVH0YtdAgJK4muvQ=;
 b=UxaQQ0kOTlOPxHgYp/vG4tQEcsFzfgVSNKehhXtx1DSQKSSUXzr40AK9
 T4q3qIqfUYawBhPTR63DBKX5mVduAnFTIPzPF/OFVlz6oXQG1eQlZzKBs
 OvtFaG9FevxF+pYlk105CUZwoUrhR9zvuTmTkizIS/vTLMbHdqwNPFlWX U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90963865
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lbqh26wpAmVWSAaIskx6t+caxirEfRIJ4+MujC+fZmUNrF6WrkUPm
 jYcDGqFb/jcajOmfdh1PNy18kgPupLVndNgTVForSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5QRnPa4T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KX1B/
 MYoAx5cVCqKuvib/bvmY8A9qP12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiFJ0EwB3I+
 D+uE2LRBhhFMfmk7mO80iyG28mRxwD0SYguC+jtnhJtqALKnTFCYPEMbnOjq/6/mE+4WvpFJ
 kAU8zZopq83nGSiStTtGRe1pniJszYYWtxZCep87xuCooLI4xuFBkAeQzJBYcBgv8gzLRQz2
 1qU2t/kGzFrmLuST32b6/GTtzzaBMQOBTZcP2leF1JDuoS95tFo5v7Scjp9OLK6h+fFMh+h+
 QqDkTITurxOpOda+ZzuqDgrnAmQjpTOSwc04CDeUWSk8h51aeaZWmC41bTIxa0eddjEFzFtq
 FBBwpHDt75WUflhgQTXGI0w8KeVC+Fp2dE2qXpmBNEf+juk4BZPlqgAsWgldC+F3ivpEAIFg
 XM/WysLv/e/31PwN8ebhr5d7Ox0pZUM7fy/CpjpgiNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FLpz9US1HWfU7nWveqwIhPVkDnHBWKYT7HMmT8vha+eDGOC79pUktajNikdzVHIvb+V6Io
 r6zxuOByglFUf2WXxQ7BbU7dAhQRVBiXMCeliCiXrLbSuaQMD17WqC5LHJIU9ANopm5Yc+Sp
 innBBcAkgqj7ZAFQC3TAk1ehHrUdc4XhRoG0eYEZz5EB1BLjV6T0Zoi
IronPort-HdrOrdr: A9a23:v3fj6apnuo6P5hVNuxYrT/YaV5tuL9V00zEX/kB9WHVpm62j5r
 WTdZEgvnHJYVkqOE3I5urwRJVoLUm8yXcX2/hjAV7dZniFhILAFugLh7cKqAeQeBEWmNQtsJ
 uJeMBFeaLN5TARt6rHCGLTKbkdKBbsys2VrNab9lMoaTxDL5hn6QIRMHfoLqW1LjM2e6bQ0P
 Cnl7p6T//LQwVnUi3BPAhgY8Hz4+fTkY7gY1ovHgdP0nj2sRqYrITiFgSe3FM0TzNLzN4ZgB
 X4uj283Lynr/a4jjjV02O71eUwpPLRjuFbAdCKiIwyNDLhkW+TFeJccozHhikxvOasrGwLvb
 D30m8dFvU20WrVYma25SHgwBbtyxEn73OK8y7ivVLT5fbhQS48CY5/iZlCch3fgnBQxu1B7A
 ==
X-IronPort-AV: E=Sophos;i="5.96,305,1665460800"; d="scan'208";a="90963865"
To: <qemu-devel@nongnu.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Thomas Huth
 <thuth@redhat.com>
Subject: [PATCH] configure: Expand test which disable -Wmissing-braces
Date: Fri, 6 Jan 2023 15:21:10 +0100
Message-ID: <20230106142110.672-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=prvs=36316be06=anthony.perard@citrix.com;
 helo=esa6.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Anthony PERARD <anthony.perard@citrix.com>

With "clang 6.0.0-1ubuntu2" on Ubuntu Bionic, the test with build
fine, but clang still suggest braces around the zero initializer in a
few places, where there is a subobject. Expand test to include a sub
struct which doesn't build on clang 6.0.0-1ubuntu2, and give:
    config-temp/qemu-conf.c:7:8: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
    } x = {0};
           ^
           {}

These are the error reported by clang on QEMU's code (v7.2.0):
hw/pci-bridge/cxl_downstream.c:101:51: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
    dvsec = (uint8_t *)&(CXLDVSECPortExtensions){ 0 };

hw/pci-bridge/cxl_root_port.c:62:51: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
    dvsec = (uint8_t *)&(CXLDVSECPortExtensions){ 0 };

tests/qtest/virtio-net-test.c:322:34: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
    QOSGraphTestOptions opts = { 0 };

Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

While Ubuntu Bionic isn't supposed to be supported anymore, clang v6
is still the minimum required as tested by ./configure.
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index 9f0bc57546..3cd9b8bad4 100755
--- a/configure
+++ b/configure
@@ -1290,7 +1290,11 @@ fi
 # Disable -Wmissing-braces on older compilers that warn even for
 # the "universal" C zero initializer {0}.
 cat > $TMPC << EOF
+struct s {
+  void *a;
+};
 struct {
+  struct s s;
   int a[2];
 } x = {0};
 EOF
-- 
Anthony PERARD


