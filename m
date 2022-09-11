Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF3E5B51D0
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:13:11 +0200 (CEST)
Received: from localhost ([::1]:50746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXW8U-0003yK-PP
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXVwI-0004sq-VD
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:00:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXVwG-0006OS-2J
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=60ZCEpPNxCwMjWmNStrObBA/6q5Os6NikAkMLpEdLr4=;
 b=hiJ6pQkA299QUvIzLQmdwKyiolOTHmvwJ34leDSqyJGt6Av6VwlxOETqvDTrirpcBr9rE/
 deFooM5NdOL0AuR8315Zxc8ZLjYcmPkwTnuXEKqvsFls7VLktwTXn0uGyGK0SLx9mU6z20
 UXq1fmmL8Dfb+f14F/a5lD9sKo0hBUI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-pzyCTK2qPta-lOXalVTeIg-1; Sun, 11 Sep 2022 19:00:29 -0400
X-MC-Unique: pzyCTK2qPta-lOXalVTeIg-1
Received: by mail-ed1-f69.google.com with SMTP id
 b13-20020a056402350d00b0043dfc84c533so4909069edd.5
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=60ZCEpPNxCwMjWmNStrObBA/6q5Os6NikAkMLpEdLr4=;
 b=wzlbCM+47ImepSLtq1iulVE547sFtrYj5OB9Q9XImHL6cpIUp0Z0T5N9X5QQutPHeK
 dBXloxr3/qdYAcvxw/WbBgLOk2w7fsqeAL5W6GRbxgDjkwNxGAqxypNtqIoFkPTlehsM
 1gWHOGmzNghbzMNNhoce8yEmMq1duNAsad1SuRm1uH7IoB21QuLtbYgw+HlfLn8LEvgy
 F10DonevtiklQJrZzhw11ynZSl16FI0/zzgNt0VMjQT1t6VOSpdAbHYmnY96D8WgCyt3
 dQmGz5lBPLpXsvPda7iZiyYLwoZnlHNErpmyerESMK6rddB3M7hATuoZB7oEM6fbueAj
 Ik1g==
X-Gm-Message-State: ACgBeo0xVkYnJejBcAItM4dHwQwflxBp33CBj8dEE5Eial0bKSYXyTvZ
 Gu5YqLQtNkgFjuRHAD36jfGCjJXgpgUIA2r39hTHSY4Akzz1AQJw5sgd7uaaxv4uQQDWDRUDP+k
 ofwyIwd5lkjgumgTMi3VvLRPGtv1z3cucoNQHIml9Y4QnP74Un9LmDtpm8qbOZ+w30CI=
X-Received: by 2002:aa7:c78e:0:b0:441:c311:9dcd with SMTP id
 n14-20020aa7c78e000000b00441c3119dcdmr19707501eds.155.1662937228584; 
 Sun, 11 Sep 2022 16:00:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6GIK8JOl53CFHXy/HEiJqy2O/25+RgqOOquuqf335gOdzjTqwdnP1vr9cdwoW0SZ/VFtY8Dg==
X-Received: by 2002:aa7:c78e:0:b0:441:c311:9dcd with SMTP id
 n14-20020aa7c78e000000b00441c3119dcdmr19707483eds.155.1662937228292; 
 Sun, 11 Sep 2022 16:00:28 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a170906681000b0072b13ac9ca3sm3491189ejr.183.2022.09.11.16.00.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:00:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] tests/tcg: refine MMX support in SSE tests
Date: Mon, 12 Sep 2022 01:00:13 +0200
Message-Id: <20220911230014.340601-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230014.340601-1-pbonzini@redhat.com>
References: <20220911230014.340601-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extend the support to memory operands, and skip MMX instructions that
were introduced in SSE times, because they are now covered in test-mmx.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/i386/test-avx.py | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/tests/tcg/i386/test-avx.py b/tests/tcg/i386/test-avx.py
index 2516c66445..e16a3d8bee 100755
--- a/tests/tcg/i386/test-avx.py
+++ b/tests/tcg/i386/test-avx.py
@@ -103,7 +103,11 @@ def regstr(self, n):
 
 class MMArg():
     isxmm = True
-    ismem = False # TODO
+    def __init__(self, mw):
+        if mw not in [0, 32, 64]:
+            raise Exception("Bad mem width: %s" % mw)
+        self.mw = mw
+        self.ismem = mw != 0
     def regstr(self, n):
         return "mm%d" % (n & 7)
 
@@ -169,6 +173,9 @@ def __init__(self, w):
     def regstr(self, n):
         return mem_w(self.w)
 
+class SkipInstruction(Exception):
+    pass
+
 def ArgGenerator(arg, op):
     if arg[:3] == 'xmm' or arg[:3] == "ymm":
         if "/" in arg:
@@ -179,7 +186,13 @@ def ArgGenerator(arg, op):
         else:
             return XMMArg(arg[0], 0);
     elif arg[:2] == 'mm':
-        return MMArg();
+        if "/" in arg:
+            r, m = arg.split('/')
+            if (m[0] != 'm'):
+                raise Exception("Expected /m: %s", arg)
+            return MMArg(int(m[1:]));
+        else:
+            return MMArg(0);
     elif arg[:4] == 'imm8':
         return ArgImm8u(op);
     elif arg == '<XMM0>':
@@ -217,8 +230,12 @@ def __init__(self, op, args):
 
         try:
             self.args = list(ArgGenerator(a, op) for a in args)
+            if not any((x.isxmm for x in self.args)):
+                raise SkipInstruction
             if len(self.args) > 0 and self.args[-1] is None:
                 self.args = self.args[:-1]
+        except SkipInstruction:
+            raise
         except Exception as e:
             raise Exception("Bad arg %s: %s" % (op, e))
 
@@ -339,10 +356,13 @@ def main():
                 continue
             cpuid = row[6]
             if cpuid in archs:
-                g = InsnGenerator(insn[0], insn[1:])
-                for insn in g.gen():
-                    outf.write('TEST(%d, "%s", %s)\n' % (n, insn, g.optype))
-                    n += 1
+                try:
+                    g = InsnGenerator(insn[0], insn[1:])
+                    for insn in g.gen():
+                        outf.write('TEST(%d, "%s", %s)\n' % (n, insn, g.optype))
+                        n += 1
+                except SkipInstruction:
+                    pass
         outf.write("#undef TEST\n")
         csvfile.close()
 
-- 
2.37.2



