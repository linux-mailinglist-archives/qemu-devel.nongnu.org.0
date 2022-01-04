Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CF448446B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:18:12 +0100 (CET)
Received: from localhost ([::1]:49098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4lZj-00014s-GL
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:18:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGc-0007Fh-Eh
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:26 -0500
Received: from [2a00:1450:4864:20::52e] (port=39641
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGa-0004Tn-21
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:25 -0500
Received: by mail-ed1-x52e.google.com with SMTP id f5so149581616edq.6
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 06:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lV2rTUdM+LnDXLeS+qWWf2AzxWW8/OVgd5CrN+RzjDc=;
 b=KgdmmJec8msFScG84e3fan2poIS6D0pP6xFW+7zg9eADRsIPffYGpmpnJD6YykgOkA
 egec8zJBAIQQ23UbMVApG54svDg74UKwBl2PYx0AglE4HcP0hPXMF4AatG9UZ9shRDoW
 FEqtfS01VQmrSfdtjaMWvDQ/YwH1mC4i5/0v/N8rrPP43e+3gA4or+/bVPFfRf6Zhuhu
 DrWVbjSCOdSyP1AQlOOgu4Wzw75HLswquRhdH9WdO/DYMBLNjjJ2UqKLzmArkOLlwBYv
 tC4AZ0WqFVOA6fy/sm4P7L+G89mrI89iOxDj8eGFm53ugQ9w5Cce7chP16PV66g88vgO
 +CQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lV2rTUdM+LnDXLeS+qWWf2AzxWW8/OVgd5CrN+RzjDc=;
 b=NkTR2ga0suVrZrEpzx/JuC5RHmN+ImL2ekogtwYsgpNJtG0CXxf1HFyJatxcS8QcN0
 iuPMFTtVMnHPevIsA+Wv6CcyDc0mIHbepiJ2jBV+K6BBGc521ap/QYfrOXLBkrqaJytv
 8bzFDA+tQILVjaj8hkvMUmSvm6NliF94yG+kTTzssc9LfYVToT+KTxMYBKQQqkhVKv7e
 7eLicFnIKZTeMi60aoR8V+qowHxcYczpR3NRTNrisdrheRhXLPE0iWW9PjpNLkuLUxEX
 tMBhg266CYBegsIrCz5cVlydTuLxMPg10eJXudSNCMsNsOR5E8sjvoB2oiG6UUqF9y+y
 7RlA==
X-Gm-Message-State: AOAM532vSkksWzo7ry8poxh8hqIMt8JoNkiulQaw8OzFaVmjg3BBm0G6
 q2HAA8qixQRBffACAq9AeuR1rv9lOC8=
X-Google-Smtp-Source: ABdhPJwcMfWYAIEyyqZ/WZE0rK+aM6FJm+NWQptKiZljAsaXwTCeUbe8sjxHQ5x7Nwl4m9UkQ8nT8w==
X-Received: by 2002:a05:6402:2024:: with SMTP id
 ay4mr49378120edb.16.1641308302570; 
 Tue, 04 Jan 2022 06:58:22 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j21sm11475964ejj.133.2022.01.04.06.58.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 06:58:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/15] meson: add comments in the target-specific flags section
Date: Tue,  4 Jan 2022 15:57:46 +0100
Message-Id: <20220104145749.417387-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104145749.417387-1-pbonzini@redhat.com>
References: <20220104145749.417387-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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



