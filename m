Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746A44B7C5C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 02:28:24 +0100 (CET)
Received: from localhost ([::1]:49708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK97H-000361-IV
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 20:28:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nK4Pl-0008DK-92; Tue, 15 Feb 2022 15:27:09 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=33624
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nK4Pj-0007aV-Il; Tue, 15 Feb 2022 15:27:08 -0500
Received: by mail-io1-xd2a.google.com with SMTP id s1so1919339ioe.0;
 Tue, 15 Feb 2022 12:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject
 :content-language:to:cc:content-transfer-encoding;
 bh=NGYEIlnPhUsWcDIwrr8gRKmZ9vEPRIz/ybDhQD7VgnY=;
 b=j6S8CeV2IqmaE46Djh+SJAHwQtlTPoxxphYJCia8fOiB7Wy54he8qy8X78qsiEGufM
 Rf87NKvRysS+c+shJ8bjWo74HRiceo/gidqi0VgOrWl++wUBMvMmlHKOadnG/vdtZMBj
 M95NX0YelW4y4QAmAGd2EHsw3/8CaEw+FrS0mKRprU68PAyJpWFb955+hoxH5yHfn9Vo
 WzyO7qM+/RM90sUEtYGmSNhuK/pthFzNpg7UR4tNVOtpKD1Rw9oflBbxC2iPArNUtC1J
 97XF2VGNqkdT24DJ7Pn+fc7CoNeqmHLv21T/sjswehAvd62D+LWHjpVKelQIvFxJN14o
 HMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:content-language:to:cc:content-transfer-encoding;
 bh=NGYEIlnPhUsWcDIwrr8gRKmZ9vEPRIz/ybDhQD7VgnY=;
 b=nSzBNmnzuzNIJR/AlpzVCOi5kjk1bT7LjhofYc5zTQ3ZHnvCGGze4QO3v0BuKn82Xa
 uF5ac9SjTZCm44BfePMA6CR7+ZEW1cQ/Lh9erCQZtN7cxr/mMRjDJVkDYjgKfyW1t1Gs
 r2mF1Sgz0cKMdV9Us7o5I56NnRUW2tCmzboI19fudmOD5Q78exJHxRbIzrt+UP5vqpK5
 kZbBp9uS15dGfJJ97c9Qb/yY0vKTHOXV+ykz73levCsZV/9NWXEcNdDlIcyno/hp9MuM
 NyzzyH+5NttiDglmNfANieoECg6F4/LnNDjZBAOsN+M85mpWWw5YoKThUJ2kOagwoq5A
 Entw==
X-Gm-Message-State: AOAM530ovO8lU8pkPK7euS7dxb6TnaNXGfw/3JbP4puyarL0t2DqhJkx
 4/ju/Q1AYaBtVi+seNkUp8JWnrY+3tXaTfvgclM=
X-Google-Smtp-Source: ABdhPJzmAK40hjewRiMKYMF7ASd1WlE/Fqby7LrYHRiIVwtvBP+cXhYmLgcJTz7sdMAyoKxEMUQlzQ==
X-Received: by 2002:a05:6602:330b:: with SMTP id
 b11mr374298ioz.156.1644956826301; 
 Tue, 15 Feb 2022 12:27:06 -0800 (PST)
Received: from [10.10.0.23] (mont-dyn-147-119.pwrtc.com. [205.174.147.119])
 by smtp.gmail.com with ESMTPSA id l1sm23740561iln.29.2022.02.15.12.27.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 12:27:06 -0800 (PST)
Message-ID: <b69367a6-7744-6dbf-c370-3019bd66965c@gmail.com>
Date: Tue, 15 Feb 2022 15:27:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: David Miller <dmiller423@gmail.com>
Subject: [PATCH v3 3/3] s390x/tcg/tests: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
Content-Language: en-US
To: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=dmiller423@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 15 Feb 2022 20:21:13 -0500
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tests/tcg/s390x/mie3-compl.c: [N]*K instructions
tests/tcg/s390x/mie3-mvcrl.c: MVCRL instruction
tests/tcg/s390x/mie3-sel.c:  SELECT instruction

Signed-off-by: David Miller <dmiller423@gmail.com>
---
  tests/tcg/s390x/Makefile.target |  2 +-
  tests/tcg/s390x/mie3-compl.c    | 56 +++++++++++++++++++++++++++++++++
  tests/tcg/s390x/mie3-mvcrl.c    | 31 ++++++++++++++++++
  tests/tcg/s390x/mie3-sel.c      | 42 +++++++++++++++++++++++++
  4 files changed, 130 insertions(+), 1 deletion(-)
  create mode 100644 tests/tcg/s390x/mie3-compl.c
  create mode 100644 tests/tcg/s390x/mie3-mvcrl.c
  create mode 100644 tests/tcg/s390x/mie3-sel.c

diff --git a/tests/tcg/s390x/Makefile.target 
b/tests/tcg/s390x/Makefile.target
index 1a7238b4eb..16b9d45307 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -1,6 +1,6 @@
  S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
  VPATH+=$(S390X_SRC)
-CFLAGS+=-march=zEC12 -m64
+CFLAGS+=-march=z15 -m64
  TESTS+=hello-s390x
  TESTS+=csst
  TESTS+=ipm
diff --git a/tests/tcg/s390x/mie3-compl.c b/tests/tcg/s390x/mie3-compl.c
new file mode 100644
index 0000000000..1254fe21fb
--- /dev/null
+++ b/tests/tcg/s390x/mie3-compl.c
@@ -0,0 +1,56 @@
+#include <stdint.h>
+
+
+#define F_EPI "stg %%r0, %[res] ": [res] "+m" (res) : : "r0", "r2", "r3"
+
+#define F_PRO    asm ( \
+    "llihf %%r0,801\n" \
+    "lg %%r2, %[a] \n" \
+    "lg %%r3, %[b] "   \
+    : : [a] "m" (a),   \
+        [b] "m" (b)    \
+    : "r2", "r3" )
+
+#define FbinOp(S, ASM) uint64_t S(uint64_t a, uint64_t b) \
+{ uint64_t res = 0; F_PRO; ASM; return res; }
+
+/* AND WITH COMPLEMENT */
+FbinOp(_ncrk,  asm("ncrk  %%r0, %%r3, %%r2 \n" F_EPI))
+FbinOp(_ncgrk, asm("ncgrk %%r0, %%r3, %%r2 \n" F_EPI))
+
+/* NAND */
+FbinOp(_nnrk,  asm("nnrk  %%r0, %%r3, %%r2 \n" F_EPI))
+FbinOp(_nngrk, asm("nngrk %%r0, %%r3, %%r2 \n" F_EPI))
+
+/* NOT XOR */
+FbinOp(_nxrk,  asm("nxrk  %%r0, %%r3, %%r2 \n" F_EPI))
+FbinOp(_nxgrk, asm("nxgrk %%r0, %%r3, %%r2 \n" F_EPI))
+
+/* NOR */
+FbinOp(_nork,  asm("nork  %%r0, %%r3, %%r2 \n" F_EPI))
+FbinOp(_nogrk, asm("nogrk %%r0, %%r3, %%r2 \n" F_EPI))
+
+/* OR WITH COMPLEMENT */
+FbinOp(_ocrk,  asm("ocrk  %%r0, %%r3, %%r2 \n" F_EPI))
+FbinOp(_ocgrk, asm("ocgrk %%r0, %%r3, %%r2 \n" F_EPI))
+
+
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
index 0000000000..00f9c150a1
--- /dev/null
+++ b/tests/tcg/s390x/mie3-mvcrl.c
@@ -0,0 +1,31 @@
+#include <stdint.h>
+#include <string.h>
+
+
+static inline void mvcrl_8(const char *dst, const char *src)
+{
+    asm volatile (
+    "llill %%r0, 8 \n"
+    "mvcrl 0(%[dst]), 0(%[src]) \n"
+    : : [dst] "d" (dst), [src] "d" (src)
+    : "memory");
+}
+
+
+int main(int argc, char *argv[])
+{
+    const char* alpha = "abcdefghijklmnop";
+
+    /* array missing 'i' */
+    char tstr[17] = "abcdefghjklmnop\0" ;
+
+    /* mvcrl reference use: 'open a hole in an array' */
+    mvcrl_8(tstr+9, tstr+8);
+
+    /* place missing 'i' */
+    tstr[8] = 'i';
+
+    return strncmp(alpha, tstr, 16ul);
+}
+
+
diff --git a/tests/tcg/s390x/mie3-sel.c b/tests/tcg/s390x/mie3-sel.c
new file mode 100644
index 0000000000..e771b1e413
--- /dev/null
+++ b/tests/tcg/s390x/mie3-sel.c
@@ -0,0 +1,42 @@
+#include <stdint.h>
+
+
+#define F_EPI "stg %%r0, %[res] ": [res] "+m" (res) : : "r0", "r2", "r3"
+
+#define F_PRO    asm (  \
+    "lg %%r2, %[a]  \n" \
+    "lg %%r3, %[b]  \n" \
+    "lg %%r0, %[c]  \n" \
+    "ltgr %%r0, %%r0"   \
+    : : [a] "m" (a),    \
+        [b] "m" (b),    \
+        [c] "m" (c)     \
+    : "r0", "r2", "r3", "r4")
+
+
+
+#define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \
+{ uint64_t res=0; F_PRO ; ASM ; return res; }
+
+
+Fi3 (_selre,     asm("selre    %%r0, %%r3, %%r2 \n" F_EPI))
+Fi3 (_selgrz,    asm("selgrz   %%r0, %%r3, %%r2 \n" F_EPI))
+Fi3 (_selfhrnz,  asm("selfhrnz %%r0, %%r3, %%r2 \n" F_EPI))
+
+
+int main(int argc, char *argv[])
+{
+    uint64_t a = ~0, b = ~0, c = ~0;
+    a =    _selre(0x066600000066ull, 0x066600000006ull,a);
+    b =   _selgrz(0xF00D00000005ull, 0xF00D00000055ull,b);
+    c = _selfhrnz(0x004400000044ull, 0x000400000004ull,c);
+
+    if( (0xFFFFFFFF00000066ull != a) ||
+        (0x0000F00D00000005ull != b) ||
+        (0x00000004FFFFFFFFull != c) )
+    {
+        return 1;
+    }
+    return 0;
+}
+
-- 
2.32.0


