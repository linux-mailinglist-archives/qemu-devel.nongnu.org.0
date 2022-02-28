Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32604C6E75
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:41:49 +0100 (CET)
Received: from localhost ([::1]:36748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgHU-0000Tr-SG
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:41:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOg6I-0007mm-M8
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:30:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOg6D-000379-9d
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:30:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646054997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/lewJrRSfJXFTmQvo0shNdvUQ3o7Rur2WIEkDbW+aCI=;
 b=VkAtIC3cMyLFMxKNag71LFWwccGzlu8AR1HC1Ni1Bjh3n9F0cmxC4VgKJx0V3iwMrdMonU
 j9MFQmlfjxUXpcjNg0aS48WA/4A+J146DIPrmYdP4sTAIfBJiFB1gtPyK/qA3qJK1tOgyK
 KlJd1CdhWdB9BMqVgCtqN3QwPtzDfYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-TRQQw0a8MhyE1fcd76L3gg-1; Mon, 28 Feb 2022 08:29:53 -0500
X-MC-Unique: TRQQw0a8MhyE1fcd76L3gg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F3F91854E21;
 Mon, 28 Feb 2022 13:29:52 +0000 (UTC)
Received: from thuth.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 927287A3F3;
 Mon, 28 Feb 2022 13:29:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] tests/tcg/s390x: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
Date: Mon, 28 Feb 2022 14:29:36 +0100
Message-Id: <20220228132936.1411176-7-thuth@redhat.com>
In-Reply-To: <20220228132936.1411176-1-thuth@redhat.com>
References: <20220228132936.1411176-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 David Miller <dmiller423@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Miller <dmiller423@gmail.com>

tests/tcg/s390x/mie3-compl.c: [N]*K instructions
tests/tcg/s390x/mie3-mvcrl.c: MVCRL instruction
tests/tcg/s390x/mie3-sel.c: SELECT instruction

Signed-off-by: David Miller <dmiller423@gmail.com>
Message-Id: <20220223223117.66660-4-dmiller423@gmail.com>
[thuth: Squash mnemonic -> .insn patch, white space cleanup, improve asm usage]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/Makefile.target |  3 +++
 tests/tcg/s390x/mie3-compl.c    | 48 +++++++++++++++++++++++++++++++++
 tests/tcg/s390x/mie3-mvcrl.c    | 27 +++++++++++++++++++
 tests/tcg/s390x/mie3-sel.c      | 38 ++++++++++++++++++++++++++
 4 files changed, 116 insertions(+)
 create mode 100644 tests/tcg/s390x/mie3-compl.c
 create mode 100644 tests/tcg/s390x/mie3-mvcrl.c
 create mode 100644 tests/tcg/s390x/mie3-sel.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 1a7238b4eb..8c9b6a13ce 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -7,6 +7,9 @@ TESTS+=ipm
 TESTS+=exrl-trt
 TESTS+=exrl-trtr
 TESTS+=pack
+TESTS+=mie3-compl
+TESTS+=mie3-mvcrl
+TESTS+=mie3-sel
 TESTS+=mvo
 TESTS+=mvc
 TESTS+=shift
diff --git a/tests/tcg/s390x/mie3-compl.c b/tests/tcg/s390x/mie3-compl.c
new file mode 100644
index 0000000000..35649f3b02
--- /dev/null
+++ b/tests/tcg/s390x/mie3-compl.c
@@ -0,0 +1,48 @@
+#include <stdint.h>
+
+#define FbinOp(S, ASM) uint64_t S(uint64_t a, uint64_t b) \
+{ \
+    uint64_t res = 0; \
+    asm ("llihf %[res],801\n" ASM \
+         : [res]"=&r"(res) : [a]"r"(a), [b]"r"(b) : "cc"); \
+    return res; \
+}
+
+/* AND WITH COMPLEMENT */
+FbinOp(_ncrk,  ".insn rrf, 0xB9F50000, %[res], %[b], %[a], 0\n")
+FbinOp(_ncgrk, ".insn rrf, 0xB9E50000, %[res], %[b], %[a], 0\n")
+
+/* NAND */
+FbinOp(_nnrk,  ".insn rrf, 0xB9740000, %[res], %[b], %[a], 0\n")
+FbinOp(_nngrk, ".insn rrf, 0xB9640000, %[res], %[b], %[a], 0\n")
+
+/* NOT XOR */
+FbinOp(_nxrk,  ".insn rrf, 0xB9770000, %[res], %[b], %[a], 0\n")
+FbinOp(_nxgrk, ".insn rrf, 0xB9670000, %[res], %[b], %[a], 0\n")
+
+/* NOR */
+FbinOp(_nork,  ".insn rrf, 0xB9760000, %[res], %[b], %[a], 0\n")
+FbinOp(_nogrk, ".insn rrf, 0xB9660000, %[res], %[b], %[a], 0\n")
+
+/* OR WITH COMPLEMENT */
+FbinOp(_ocrk,  ".insn rrf, 0xB9750000, %[res], %[b], %[a], 0\n")
+FbinOp(_ocgrk, ".insn rrf, 0xB9650000, %[res], %[b], %[a], 0\n")
+
+int main(int argc, char *argv[])
+{
+    if (_ncrk(0xFF88, 0xAA11)  != 0x0000032100000011ull ||
+        _nnrk(0xFF88, 0xAA11)  != 0x00000321FFFF55FFull ||
+        _nork(0xFF88, 0xAA11)  != 0x00000321FFFF0066ull ||
+        _nxrk(0xFF88, 0xAA11)  != 0x00000321FFFFAA66ull ||
+        _ocrk(0xFF88, 0xAA11)  != 0x00000321FFFFAA77ull ||
+        _ncgrk(0xFF88, 0xAA11) != 0x0000000000000011ull ||
+        _nngrk(0xFF88, 0xAA11) != 0xFFFFFFFFFFFF55FFull ||
+        _nogrk(0xFF88, 0xAA11) != 0xFFFFFFFFFFFF0066ull ||
+        _nxgrk(0xFF88, 0xAA11) != 0xFFFFFFFFFFFFAA66ull ||
+        _ocgrk(0xFF88, 0xAA11) != 0xFFFFFFFFFFFFAA77ull)
+    {
+        return 1;
+    }
+
+    return 0;
+}
diff --git a/tests/tcg/s390x/mie3-mvcrl.c b/tests/tcg/s390x/mie3-mvcrl.c
new file mode 100644
index 0000000000..57b08e48d0
--- /dev/null
+++ b/tests/tcg/s390x/mie3-mvcrl.c
@@ -0,0 +1,27 @@
+#include <stdint.h>
+#include <string.h>
+
+static inline void mvcrl_8(const char *dst, const char *src)
+{
+    asm volatile (
+    "llill %%r0, 8\n"
+    ".insn sse, 0xE50A00000000, 0(%[dst]), 0(%[src])"
+    : : [dst] "d" (dst), [src] "d" (src)
+    : "memory");
+}
+
+int main(int argc, char *argv[])
+{
+    const char *alpha = "abcdefghijklmnop";
+
+    /* array missing 'i' */
+    char tstr[17] = "abcdefghjklmnop\0" ;
+
+    /* mvcrl reference use: 'open a hole in an array' */
+    mvcrl_8(tstr + 9, tstr + 8);
+
+    /* place missing 'i' */
+    tstr[8] = 'i';
+
+    return strncmp(alpha, tstr, 16ul);
+}
diff --git a/tests/tcg/s390x/mie3-sel.c b/tests/tcg/s390x/mie3-sel.c
new file mode 100644
index 0000000000..b0c5c9857d
--- /dev/null
+++ b/tests/tcg/s390x/mie3-sel.c
@@ -0,0 +1,38 @@
+#include <stdint.h>
+
+#define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \
+{                            \
+    uint64_t res = 0;        \
+    asm (                    \
+         "lg %%r2, %[a]\n"   \
+         "lg %%r3, %[b]\n"   \
+         "lg %%r0, %[c]\n"   \
+         "ltgr %%r0, %%r0\n" \
+         ASM                 \
+         "stg %%r0, %[res] " \
+         : [res] "=m" (res)  \
+         : [a] "m" (a),      \
+           [b] "m" (b),      \
+           [c] "m" (c)       \
+         : "r0", "r2",       \
+           "r3", "r4"        \
+    );                       \
+    return res;              \
+}
+
+Fi3 (_selre,     ".insn rrf, 0xB9F00000, %%r0, %%r3, %%r2, 8\n")
+Fi3 (_selgrz,    ".insn rrf, 0xB9E30000, %%r0, %%r3, %%r2, 8\n")
+Fi3 (_selfhrnz,  ".insn rrf, 0xB9C00000, %%r0, %%r3, %%r2, 7\n")
+
+int main(int argc, char *argv[])
+{
+    uint64_t a = ~0, b = ~0, c = ~0;
+    a =    _selre(0x066600000066ull, 0x066600000006ull, a);
+    b =   _selgrz(0xF00D00000005ull, 0xF00D00000055ull, b);
+    c = _selfhrnz(0x043200000044ull, 0x065400000004ull, c);
+
+    return (int) (
+        (0xFFFFFFFF00000066ull != a) ||
+        (0x0000F00D00000005ull != b) ||
+        (0x00000654FFFFFFFFull != c));
+}
-- 
2.27.0


