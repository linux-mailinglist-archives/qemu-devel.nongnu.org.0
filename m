Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECA247BEA4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 12:12:02 +0100 (CET)
Received: from localhost ([::1]:43754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzd3p-0001ap-C8
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 06:12:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzcxe-0005Mp-AE
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:05:38 -0500
Received: from [2a00:1450:4864:20::42e] (port=33338
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzcxc-000512-Oy
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:05:38 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d9so6625331wrb.0
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 03:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TpUJWRG7fXUtP+zjxXrVkC9l5NszEY9xXzN0gYS9P2c=;
 b=kym6TcHrc1s0H1oVinoDy4tET02pqKuBILVL4iJN5C7RpAqKEhy9vyax6WU0Hari4H
 BN9dty6gI1yK05hj/ogJGDF1SxPykzPmxTRnAG0vm7bntr5UibpUlfUkqt+yVUNV48qf
 KHlIy8UOlrQTKfQdzJdvMXTkUkIga7Yixq/xTOFG5Ok1Rw3dGsaiHeqfOcKY51CS9xBy
 +xKQpeNDUOyvj6SDIeQ+v83mBJYpTLJZaGU6KmTaF7SsJ1jKNUI7wfPN/BrBMWSFerzb
 w/X2uj/IOz2JDG0ovf2+ouNjuPZOm+5107f7Bm96qKcPVcaEsdCv4LqbDVg57YTbZhHH
 OHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TpUJWRG7fXUtP+zjxXrVkC9l5NszEY9xXzN0gYS9P2c=;
 b=IibJMwAOOdN7wrwAcWPw62nLx9SLWZiCHI+Y09zYBe1VB9vt0h6DPetc1grqjLXiG3
 Gt1DpwUS0/oBJolxP0LD5fqUNsDraBD0UPEs4TiIbEX3Hm7Unv64O07iMN3ccWIcNlKt
 WCH5wt3cG0bUfGQrShC8tSNaJObGAr/LU544XmOTdoAzHZrQ3akoKQQmQcj2H+6KW0s/
 dnpbuzpEenVkx6NORqFlinXM3ZlVGUsYKoCURqqKuO10PBSVv9cZromb9izSfZM0nuHh
 zJPo/SAQcRCNp5LxGh0fSaPhvkHlTbS8NSMtnoA2ZBVxtJL2ll9rWFi8YUk3gXb2tq4R
 oMoQ==
X-Gm-Message-State: AOAM533pd/0B8xWqXOmQayt7g+6BtyYMNImr+gq//WpKKeJNBXEM4Iy6
 hj+sbrbI3I2QYO4SC/e+m0hKaJDc3f0=
X-Google-Smtp-Source: ABdhPJy9YiVCLcHpKG8TjKWK780CniYrxwuLkf8ely8HsUgJAS3AXE2kPQrb4DVZ1+PYPTtJhEyP8g==
X-Received: by 2002:a05:6000:168f:: with SMTP id
 y15mr2215926wrd.61.1640084735644; 
 Tue, 21 Dec 2021 03:05:35 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id az11sm1949444wmb.30.2021.12.21.03.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 03:05:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] meson: add comments in the target-specific flags section
Date: Tue, 21 Dec 2021 12:05:26 +0100
Message-Id: <20211221110526.351709-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211221110526.351709-1-pbonzini@redhat.com>
References: <20211221110526.351709-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meson.build b/meson.build
index 09ee427ca4..0a6d57125f 100644
--- a/meson.build
+++ b/meson.build
@@ -233,6 +233,7 @@ endif
 # Target-specific checks and dependencies #
 ###########################################
 
+# Fuzzing
 if get_option('fuzzing') and get_option('fuzzing_engine') == '' and \
     not cc.links('''
           #include <stdint.h>
@@ -244,6 +245,7 @@ if get_option('fuzzing') and get_option('fuzzing_engine') == '' and \
   error('Your compiler does not support -fsanitize=fuzzer')
 endif
 
+# Tracing backends
 if 'ftrace' in get_option('trace_backends') and targetos != 'linux'
   error('ftrace is supported only on Linux')
 endif
@@ -257,6 +259,7 @@ if 'syslog' in get_option('trace_backends') and not cc.compiles('''
   error('syslog is not supported on this system')
 endif
 
+# Miscellaneous Linux-only features
 if targetos != 'linux' and get_option('mpath').enabled()
   error('Multipath is supported only on Linux')
 endif
@@ -266,6 +269,7 @@ if targetos != 'linux' and get_option('multiprocess').enabled()
 endif
 multiprocess_allowed = targetos == 'linux' and not get_option('multiprocess').disabled()
 
+# Target-specific libraries and flags
 libm = cc.find_library('m', required: false)
 threads = dependency('threads')
 util = cc.find_library('util', required: false)
@@ -306,6 +310,7 @@ elif targetos == 'openbsd'
   endif
 endif
 
+# Target-specific configuration of accelerators
 accelerators = []
 if not get_option('kvm').disabled() and targetos == 'linux'
   accelerators += 'CONFIG_KVM'
-- 
2.33.1


