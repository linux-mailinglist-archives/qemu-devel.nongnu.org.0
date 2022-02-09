Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86D64AFFAA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 22:58:49 +0100 (CET)
Received: from localhost ([::1]:45620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHuzA-00076p-KK
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 16:58:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuvX-0004rJ-OI
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:55:03 -0500
Received: from [2607:f8b0:4864:20::102e] (port=42651
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuvW-0007qI-2W
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:55:03 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 h7-20020a17090a648700b001b927560c2bso2453969pjj.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 13:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x8Cva6nCIUoDekI5oK77jag6eRVxIc3cZd/244xh9Bg=;
 b=SLUho44oz/7RWNSV3AiGmK1BzYcEV3CxyN99HxZk/C4oyUNi+yekCHONkJ6XVrLxQn
 yMbsnzXxwv5hHqqF/pWVvIOuMHFhXd4eqgTgv4FzhN9UKRdD2spIwc00lxt09bB6ZFhr
 jiBCv0X3eY/Gwj2gJ0lIuvLppn7puDa3f30OE1BFWCyYfFOZOUbj2mViUEMTQm5Ea1Uk
 Z2loe4TflPSRDE2vKLrwaeK7+iNpmtRGy12gxE20Sb+QpD739GGg8UeIf0zs0rDV6wbr
 hSqWJZUy+i+eG9vvk33grafpkXMkMfz62+cOQvqxp7DnPbjzt8q2u487nowGhMrcr3/e
 BZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x8Cva6nCIUoDekI5oK77jag6eRVxIc3cZd/244xh9Bg=;
 b=r0MXm9sxQcnQb3b37fZpWFJY1ksCDr3mHDbxIP/JWv5Jt/7FCS/BGCS/7i0iSPxBoF
 U/FbaVu8KMwuYbJKDgiDeoT+JUmgN3GhrKWq8WsGYLZzYsCFvl+ej0qLsyGd+zCVoxsW
 yx7ITKnjt05TW4fkN7gaDSE7EBqojHrUTIaq4j5PsAX4ISVO+vlNxN+SE6mbbLySxJNm
 i8Z3QRbF7iUscfFIleza6daCqwZrhWjgq4uDvK4XogcipzhXLsS8no+PSbenalQ9chsy
 1bVcvTi9dabCpAY7DM9boFIgfkxXuDb+KbR/hnGHZ8Zw8UIqUScekqfS62URFUUqNlzr
 97ww==
X-Gm-Message-State: AOAM5324CvQISosFnTExQWCy53s4pQEoJS323oXEVCDPA2CMqQVD8dAK
 FymUqxtlHx7UUgPr9KNJoVnhT6WLBGM=
X-Google-Smtp-Source: ABdhPJx/oWD+ZfiDV/pRR8BmcjWcFJThKkeuUbdpKh8OPQ4FbIvvl8ey/aspaprKsvu0DTLcoVamLw==
X-Received: by 2002:a17:90b:38c7:: with SMTP id
 nn7mr4870729pjb.124.1644443700753; 
 Wed, 09 Feb 2022 13:55:00 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id o8sm21188521pfu.52.2022.02.09.13.54.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 13:55:00 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 01/15] meson: Display libfdt as disabled when system emulation
 is disabled
Date: Wed,  9 Feb 2022 22:54:32 +0100
Message-Id: <20220209215446.58402-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209215446.58402-1-f4bug@amsat.org>
References: <20220209215446.58402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

When configuring QEMU with --disable-system, meson keeps showing
libfdt as "auto". Mark it as disabled instead.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 571af34b7d..3c274386bb 100644
--- a/meson.build
+++ b/meson.build
@@ -2271,8 +2271,8 @@ if get_option('cfi') and slirp_opt == 'system'
 endif
 
 fdt = not_found
-fdt_opt = get_option('fdt')
 if have_system
+  fdt_opt = get_option('fdt')
   if fdt_opt in ['enabled', 'auto', 'system']
     have_internal = fs.exists(meson.current_source_dir() / 'dtc/libfdt/Makefile.libfdt')
     fdt = cc.find_library('fdt', kwargs: static_kwargs,
@@ -2315,6 +2315,8 @@ if have_system
     fdt = declare_dependency(link_with: libfdt,
                              include_directories: fdt_inc)
   endif
+else
+  fdt_opt = 'disabled'
 endif
 if not fdt.found() and fdt_required.length() > 0
   error('fdt not available but required by targets ' + ', '.join(fdt_required))
-- 
2.34.1


