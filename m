Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BED308843
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:29:05 +0100 (CET)
Received: from localhost ([::1]:37194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RxY-0008EB-Kz
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5Rnb-0004uk-RW
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:47 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnY-00066s-PV
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:47 -0500
Received: by mail-ed1-x52f.google.com with SMTP id g1so10129307edu.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4JrZtYPxgRs4ilVvMy8sIfDqK151Z1Ipvx+lDlV63dY=;
 b=JB0K60ZAo0Nm6gljhnckNN9upE2pr8RZ0TKlCxh7GcuVj9zBOkQ/0erbPi623x7UI2
 y27F57WvYZ9aIKrkLamqfPHgBaxp9YOVsK7yrE9gOzlAqabkT68K5DW/X1VFgp3BH2yZ
 w6bcqG3YuQyVMkB1i8eCLUNBv+4jhw6WUt8qq2gFmbzmbDrbTOajpAd6+tCoyQ51nmJF
 jDQQV72avc8hJTo09FQj/35H6I3fDOuIFYuc0YqNpMeME2PpAgU6rdZKWaiKuQUNSmH2
 7VUUVHQ/5z4RWdlJhnmKgrc65AemqhHJSUDzg6X7m9Ebs+e9I/vtyrOL6b1ZN5Xr0m+D
 UxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4JrZtYPxgRs4ilVvMy8sIfDqK151Z1Ipvx+lDlV63dY=;
 b=s7yph+BVmNh9QNA+ErohRpUlqTGEh9dVJXxuwT29l3qVFDniNNfnKZhkZwd960qMiz
 w2t0vU2wR5otiN7xlbmf/pvImKNAgQlPir9ZKJeZxeqjLNsvbvooyInaLo6YWrnJhCze
 iXH//5UGfbIcWYhjbvR5QEM0PmWSySlj2DK/CGqlVLzo8q2F+ntCl+DNeTuKT4uzM8iS
 pe7hjAoq5zJJG6+6I1lmw4JDL342z6lKHgYSArORdPINky0XUIyO3SakjVEfjW/vLVYw
 UKcCeDKrWk3dLhtMfkwsYcVzi8tje9hRSetQJ+T4nFkYXs6gefLwF49bISdcMW7AQchW
 kK6g==
X-Gm-Message-State: AOAM532B5yiIl6IFTsI1cC6GMSGKflN9zddMP5FlDeSLxo/mUMScut2W
 so54gm7XCFM5uX5MTR78k9UTQ7GO1MVS2Q==
X-Google-Smtp-Source: ABdhPJx1pq7SDDkILuZE0RpLvcQ3YbXg7o0RKH9nfdAeHGiL/zuRCg7/4CpsPdJLEvb+d5nKaltALg==
X-Received: by 2002:a05:6402:1013:: with SMTP id
 c19mr4503773edu.298.1611919122210; 
 Fri, 29 Jan 2021 03:18:42 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/36] meson: Restrict emulation code
Date: Fri, 29 Jan 2021 12:18:08 +0100
Message-Id: <20210129111814.566629-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210122204441.2145197-9-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index a9dbd2a0db..2734d765e4 100644
--- a/meson.build
+++ b/meson.build
@@ -1784,16 +1784,18 @@ libqemuutil = static_library('qemuutil',
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
 
-decodetree = generator(find_program('scripts/decodetree.py'),
-                       output: 'decode-@BASENAME@.c.inc',
-                       arguments: ['@INPUT@', '@EXTRA_ARGS@', '-o', '@OUTPUT@'])
+if have_system or have_user
+  decodetree = generator(find_program('scripts/decodetree.py'),
+                         output: 'decode-@BASENAME@.c.inc',
+                         arguments: ['@INPUT@', '@EXTRA_ARGS@', '-o', '@OUTPUT@'])
+  subdir('libdecnumber')
+  subdir('target')
+endif
 
 subdir('audio')
 subdir('io')
 subdir('chardev')
 subdir('fsdev')
-subdir('libdecnumber')
-subdir('target')
 subdir('dump')
 
 if have_block
-- 
2.29.2



