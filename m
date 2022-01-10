Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4813A489BEE
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:13:33 +0100 (CET)
Received: from localhost ([::1]:60376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wMW-0002ho-DO
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:13:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vr3-0002Pk-8b
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:41:06 -0500
Received: from [2a00:1450:4864:20::52a] (port=34648
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vr0-0000WC-Nc
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:59 -0500
Received: by mail-ed1-x52a.google.com with SMTP id u25so54504283edf.1
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lV2rTUdM+LnDXLeS+qWWf2AzxWW8/OVgd5CrN+RzjDc=;
 b=lhiTo6HprJxgJbrP3KGandBTZZSQlCiy9mBKkm3yqHPo6bLFFdSf99+sHnc+Px9bi4
 c5V7tFa8QCT2Y5JVYIeZNplktM7/280CL9GmzK3xaN3N9ZQucUzDO8qzBYz8FwPqAUwj
 xKAI551EcSc6rwqgQ7+oCoQcDBUIWUicydMYVQGwLkLlDXZjf6s17/6Gytx6Tc1XpOpG
 GZ12j4CmITCGBd8j6QEHFYdqqBaE5gbFC9JCo6UyWrnq+FmVYUr6BDo6i7nuLwjG7oWJ
 zE1aLZIFB4zNeKc36XAfv0MT3gx4fPgLTuvJv44cDlxXYyS06ukXGZjhSsiuO7qFvzxt
 iQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lV2rTUdM+LnDXLeS+qWWf2AzxWW8/OVgd5CrN+RzjDc=;
 b=bPnrLqTMbPHMM9SPVcQSfAjtxo2eUiM4fVkHUFarH7ScFN4Ep5vKQU8WcqpnqRshHm
 VEKvRawxxC4wcursgw/fY46pmNB7/jVSK7vUbXNVqMKdBZnTs1PCGFfQOpABRAjmR9RG
 ioR+3aqfoohACThaeDtOilMQxJyYGDEZAt9CkHIDHWfZrmbe3iTnRJy6W/dqafFUM9zr
 Wxb9i6mPKDJSZ4YiQguiUV7/SvFT2K0z+hVb8t7tKdgEZHpy9QihCCK1FkPd2y5m+cPb
 fXbOn1qDEn0y9dVAT35IGCaaENR53TPw0FmFLwFgeUqSPxT6hWT1cFd55bEJFRSRfv4y
 zwGQ==
X-Gm-Message-State: AOAM531xHpt5LxjRSbInBMd6/lwvrjBuEQL0HKXAu2k9TO2VM4PE3Ltp
 S9swje6EsRUxrA5UQccah5nloERjDJY=
X-Google-Smtp-Source: ABdhPJwu9hHsZzOC2dCcgTYz7u5ESE3Kq3oPz5q6ModDfgaeZFOxpKkCKUEAWhV6KU23PF/Q0XXUlg==
X-Received: by 2002:a17:906:ce44:: with SMTP id
 se4mr41822ejb.209.1641825657547; 
 Mon, 10 Jan 2022 06:40:57 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.40.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:40:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/18] meson: add comments in the target-specific flags section
Date: Mon, 10 Jan 2022 15:40:28 +0100
Message-Id: <20220110144034.67410-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
References: <20220110144034.67410-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meson.build b/meson.build
index 36fc720ba3..6489ff8425 100644
--- a/meson.build
+++ b/meson.build
@@ -238,6 +238,7 @@ endif
 # Target-specific checks and dependencies #
 ###########################################
 
+# Fuzzing
 if get_option('fuzzing') and get_option('fuzzing_engine') == '' and \
     not cc.links('''
           #include <stdint.h>
@@ -249,6 +250,7 @@ if get_option('fuzzing') and get_option('fuzzing_engine') == '' and \
   error('Your compiler does not support -fsanitize=fuzzer')
 endif
 
+# Tracing backends
 if 'ftrace' in get_option('trace_backends') and targetos != 'linux'
   error('ftrace is supported only on Linux')
 endif
@@ -262,6 +264,7 @@ if 'syslog' in get_option('trace_backends') and not cc.compiles('''
   error('syslog is not supported on this system')
 endif
 
+# Miscellaneous Linux-only features
 if targetos != 'linux' and get_option('mpath').enabled()
   error('Multipath is supported only on Linux')
 endif
@@ -271,6 +274,7 @@ if targetos != 'linux' and get_option('multiprocess').enabled()
 endif
 multiprocess_allowed = targetos == 'linux' and not get_option('multiprocess').disabled()
 
+# Target-specific libraries and flags
 libm = cc.find_library('m', required: false)
 threads = dependency('threads')
 util = cc.find_library('util', required: false)
@@ -311,6 +315,7 @@ elif targetos == 'openbsd'
   endif
 endif
 
+# Target-specific configuration of accelerators
 accelerators = []
 if not get_option('kvm').disabled() and targetos == 'linux'
   accelerators += 'CONFIG_KVM'
-- 
2.33.1



