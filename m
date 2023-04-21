Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5129F6EA704
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:33:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn97-0008EJ-Tv; Fri, 21 Apr 2023 05:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn93-0008DN-12
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn91-000328-97
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7nCz+pXj/zxPMGaWwNK8Sp0fglY+OmoVsYHlIqiSLV8=;
 b=I50XK6wdjCbsAuUSHlO3ARYEtGmchKuAmES64UhCaiJvR/6wjsxvcfDBtqeropsLDmqhRc
 FxsHS98cnQsncFNVQh4DWUG7j3gW6tUw87dB+7o7kJUXKDPG5NYt/gDxKwMvIl5TS/aUK7
 /zjqU/X3cM0TdlmMR4SW3vLRZcZ6WI4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-6jeGrnhsPMa8SVhIk_71Zw-1; Fri, 21 Apr 2023 05:33:29 -0400
X-MC-Unique: 6jeGrnhsPMa8SVhIk_71Zw-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-50470d68f1eso1373437a12.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069607; x=1684661607;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7nCz+pXj/zxPMGaWwNK8Sp0fglY+OmoVsYHlIqiSLV8=;
 b=k1CJiL28YPaVNxauXQ1Cau0w3nXgYKAnWtjpoHuebBH9jSpaQmkMg9g4+0KUJaQ8K3
 FWWiS9+S2cisfF3Z6HlZ2AeZRVPQGTM4dFR5qgSQvSzs3gNqf4QOHtsAX7Kawch1aagt
 /iEJ3wZz5d2fkAa5wvaJM8qZ67xuQvTlEr0FYK+3UX5r2AQ7WlFk5WPU0vy3eEVUH/cy
 VzipFnkMOkRKwOA6fXit/+X14fkL0XsxeqQPPsEGVcmbZV8drvKl55CQ6RulPJ7e3pei
 vuo36n7ZWQyU9sUjXF1og2q75qUUtRuvj4DbKO7T4QR0z/6rVqHU+9yn1vuqSXAZ6MVl
 yzgw==
X-Gm-Message-State: AAQBX9cMOSaPNi8+CRwOAyUkSzHsH/XyZKMjPA+fn+ZCzS0k1c8vieH9
 3R6zeOLK9IU7+ECnjF9w9RfqR60GA8LCFmiG1Mh6UqIypYdsT/0aTE22l++2Y6o+F7+w4kwLj0U
 55VQQUA3eU7JWS4Z2/Tw7dVyd9rbnJK5Ls5ZVGVBC5rVVHKwzLILK6wvBSTlRBUaF7eM+Ao+sPT
 qz1w==
X-Received: by 2002:a17:907:9482:b0:953:93c1:e13 with SMTP id
 dm2-20020a170907948200b0095393c10e13mr1590274ejc.73.1682069607703; 
 Fri, 21 Apr 2023 02:33:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350a20ET+zlNog5V8ZZS1Bb/RD9XmdgJWy/Frfl5jdH6o4G7zMAAsjr/RogIsZk6IGbyhE+DdWA==
X-Received: by 2002:a17:907:9482:b0:953:93c1:e13 with SMTP id
 dm2-20020a170907948200b0095393c10e13mr1590256ejc.73.1682069607261; 
 Fri, 21 Apr 2023 02:33:27 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a1709063d6200b00949691d3183sm1829779ejf.36.2023.04.21.02.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PULL 07/25] configure: Avoid -Werror=maybe-uninitialized
Date: Fri, 21 Apr 2023 11:32:58 +0200
Message-Id: <20230421093316.17941-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

The configure script used to compile some code which dereferences memory
with ubsan to verify the compiler can link with ubsan library which
detects dereferencing of uninitialized memory. However, as the
dereferenced memory was allocated in the same code, GCC can statically
detect the unitialized memory dereference and emit maybe-uninitialized
warning. If -Werror is set, this becomes an error, and the configure
script incorrectly thinks the error indicates the compiler cannot use
ubsan.

Fix this error by replacing the code with another function which adds
1 to a signed integer argument. This brings in ubsan to detect if it
causes signed integer overflow. As the value of the argument cannot be
statically determined, the new function is also immune to compiler
warnings.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20230405070030.23148-1-akihiko.odaki@daynix.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/configure b/configure
index 6ed66ec6abda..22b8553b8d70 100755
--- a/configure
+++ b/configure
@@ -1749,13 +1749,9 @@ if test "$sanitizers" = "yes" ; then
   # detect the static linking issue of ubsan, see also:
   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=84285
   cat > $TMPC << EOF
-#include <stdlib.h>
-int main(void) {
-    void *tmp = malloc(10);
-    if (tmp != NULL) {
-        return *(int *)(tmp + 2);
-    }
-    return 1;
+int main(int argc, char **argv)
+{
+    return argc + 1;
 }
 EOF
   if compile_prog "$CPU_CFLAGS -Werror -fsanitize=undefined" ""; then
-- 
2.40.0


