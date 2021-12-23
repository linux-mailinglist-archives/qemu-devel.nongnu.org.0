Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB847E306
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:13:10 +0100 (CET)
Received: from localhost ([::1]:55720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0My4-0003vc-VW
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:13:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdQ-0004Kj-0k
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:48 -0500
Received: from [2a00:1450:4864:20::42c] (port=36421
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdN-0008QP-5N
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:47 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r17so10965937wrc.3
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/yoSotUhPZRyouKzfRrZfly5S4178QI/W+Dp24FNbbA=;
 b=qFj/3cOXxh4EA0EfcNVVlEYaneTWizQ4OT//NuUEBiUPkW3BdOpTUcRI7dEk42r+mR
 46M/mMj0ksls0TKju6b9qywP0LokQzh4GWFnmCuqqKfu3sC1+n3D+lPBWA/gDl0boAS3
 yyplv/LypuHlle6zdTMUHoVBAinsqsve67lbNCgBPR+6xN7jn4tG2w2ww9Y9nrnSL6W8
 XzMO0DIO9vVenKZgXGnRHQtBPBjmVk64clBM7CQfv8hAmN6eM6m6ZqGnhrMlGx/RpDQn
 NIOMqlcrO0nfyg+jXm2P6ij+/IqIJzipiOkcc0VvhV5KT2AlxJHnslxYndQ7JMHD7BsS
 uExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/yoSotUhPZRyouKzfRrZfly5S4178QI/W+Dp24FNbbA=;
 b=TaiDcTDV9xTF4YiBkTamE1PjhdUc7YVCGf28I3V9lNCmq2NguMKXFUx9wS6fyAz7/0
 NxXdQwynKmyLTEDu07FUj/DHl5/u0hUl3li4Vx3g88ptgsdjfagX325frG0wbCxVN9fD
 6mSeNDP+X/IdAJBkWEkPgJQBJ816eh9ZYzlRY2jhx0bdPNLpLGgXANFxsCtHghwb9Dnr
 mtVWhWLdlWvnie1B+Ca43v43jUsKJ0GqzVePEt5pR5lgZnW5vrr1HeftnIkDVqgzmKlI
 Hv/JkPichFmExH2IxU4c6uZNtVnJDVjb5oGrJfHJgTxo8MO1dGNMmX6PfVNImmH5wS+0
 IJbg==
X-Gm-Message-State: AOAM53235dRmluiIe5eLEaZ0djSK5p/m4d7mdsVHOjZPuDV2/s2MsT0p
 8Ztyn2pPmhvBDI1hS9mbD2M2E6k9hAw=
X-Google-Smtp-Source: ABdhPJz6rTvlBWSx2VdBuKa239LSYPog0tWPD1GhX4LsX/vLs35ikAx76YL7INc6nIQSrPp4L9KllQ==
X-Received: by 2002:a05:6000:1567:: with SMTP id
 7mr1531752wrz.513.1640260303431; 
 Thu, 23 Dec 2021 03:51:43 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o2sm4537106wru.109.2021.12.23.03.51.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:51:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/15] meson: add comments in the target-specific flags section
Date: Thu, 23 Dec 2021 12:51:32 +0100
Message-Id: <20211223115134.579235-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115134.579235-1-pbonzini@redhat.com>
References: <20211223115134.579235-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meson.build b/meson.build
index a61eb7cee5..3519ed51e3 100644
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



