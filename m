Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4502525479
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:09:56 +0200 (CEST)
Received: from localhost ([::1]:60092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDG7-00018h-TZ
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZW-00051p-IM
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZU-0005Eu-CM
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnNLE6Yy1TVUzMOAfYa/ccsaPtJ4wDOoPyRxJTkHmk8=;
 b=DS0sLcBhADUWGukOem8d95ytYRfYeMXe4/FDPJnAAtFqBIX2VLiFu7ZVg0PiGGhUY0L0PQ
 VBi5nLrTCoosxCJwtfX9o6f+0c5k8bFIDC8qCCGUF14gSQMhtTXaYcV2CqB0nEuqSSvKi+
 wcdboA7ReWCrACkZhoiT1qX7JGmL4LM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-lFsQ7pQJPd-n8siS2y8NrQ-1; Thu, 12 May 2022 13:25:50 -0400
X-MC-Unique: lFsQ7pQJPd-n8siS2y8NrQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 i14-20020a17090639ce00b006dabe6a112fso3141852eje.13
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xnNLE6Yy1TVUzMOAfYa/ccsaPtJ4wDOoPyRxJTkHmk8=;
 b=rCQ7A05jfWJRHmxCgs5JZSjoi8iTHedeFhL8TZZWzNLl4leWMRg+erHA9yK1zb+RaW
 F8h6pV1evwMeohuEP1wK2axfFbaknqIm8S3cC/P9TUzyzrXoVoxcqM+VGoCEa07vUj1p
 ZQdCFYuDMgIf8r1vYUK/HwZb+TB1jt2XFDqlRPuPRgI7UYUev6347MZUkTiW8trZzM1v
 Q40oCXakViRKs2XCekBA9++gJoIGtUbQz1eLYOzOJhNutiF3IwDcKmcsePp1dF6IGGp/
 OhZJiaaSS5LDe9QuStCHII27kzni7VDWn5heuZ0XYq/KYODFZGEqQ7q+C+/F3wzTcIau
 7kPg==
X-Gm-Message-State: AOAM530oxxPd/rxjMt9RfynzrGZVhDlK9v7bzsXSvbn44xiunXkBVok2
 n0BNrNrH5YvmZnl02JLYdQ2gORUx55MF2ADOVtyZCaowLhMHtwOmXxU2GPW/8Bas5AfO5zAegpx
 WXCIjlhScrAu8uZYMQDRkzG5kE8ED8AEh3gO65XMvetuPiLl6sQQCNBa8yuJecou2aoc=
X-Received: by 2002:a17:907:6e1d:b0:6f4:60e6:9fa6 with SMTP id
 sd29-20020a1709076e1d00b006f460e69fa6mr884744ejc.184.1652376349239; 
 Thu, 12 May 2022 10:25:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKNl+ToWI5gk6+PgmFUMNtVSBWxDW9CfQtd1EXYRVySmecB/Ryu/OUhJSAOT7LI/W14Zan8Q==
X-Received: by 2002:a17:907:6e1d:b0:6f4:60e6:9fa6 with SMTP id
 sd29-20020a1709076e1d00b006f460e69fa6mr884725ejc.184.1652376348926; 
 Thu, 12 May 2022 10:25:48 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 br23-20020a170906d15700b006f3ef214dd8sm2298832ejb.62.2022.05.12.10.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <malureau@redhat.com>
Subject: [PULL 20/27] net: slirp: allow CFI with libslirp >= 4.7
Date: Thu, 12 May 2022 19:24:58 +0200
Message-Id: <20220512172505.1065394-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

slirp 4.7 introduces a new CFI-friendly timer callback that does
not pass function pointers within libslirp as callbacks for timers.
Check the version number and, if it is new enough, allow using CFI
even with a system libslirp.

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Reviewed-by: Marc-André Lureau <malureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/meson.build b/meson.build
index ea72ba7c2f..9b20dcd143 100644
--- a/meson.build
+++ b/meson.build
@@ -2637,10 +2637,25 @@ if have_system
   slirp_opt = get_option('slirp')
   if slirp_opt in ['enabled', 'auto', 'system']
     have_internal = fs.exists(meson.current_source_dir() / 'slirp/meson.build')
+    slirp_dep_required = (slirp_opt == 'system' or
+                          slirp_opt == 'enabled' and not have_internal)
     slirp = dependency('slirp', kwargs: static_kwargs,
                        method: 'pkg-config', version: '>=4.1.0',
-                       required: slirp_opt == 'system' or
-                                 slirp_opt == 'enabled' and not have_internal)
+                       required: slirp_dep_required)
+    # slirp <4.7 is incompatible with CFI support in QEMU.  This is because
+    # it passes function pointers within libslirp as callbacks for timers.
+    # When using a system-wide shared libslirp, the type information for the
+    # callback is missing and the timer call produces a false positive with CFI.
+    # Do not use the "version" keyword argument to produce a better error.
+    # with control-flow integrity.
+    if get_option('cfi') and slirp.found() and slirp.version().version_compare('<4.7')
+      if slirp_dep_required
+        error('Control-Flow Integrity requires libslirp 4.7.')
+      else
+        warning('Control-Flow Integrity requires libslirp 4.7, not using system-wide libslirp.')
+        slirp = not_found
+      endif
+    endif
     if slirp.found()
       slirp_opt = 'system'
     elif have_internal
@@ -2713,18 +2728,6 @@ if have_system
   endif
 endif
 
-# For CFI, we need to compile slirp as a static library together with qemu.
-# This is because we register slirp functions as callbacks for QEMU Timers.
-# When using a system-wide shared libslirp, the type information for the
-# callback is missing and the timer call produces a false positive with CFI.
-#
-# Now that slirp_opt has been defined, check if the selected slirp is compatible
-# with control-flow integrity.
-if get_option('cfi') and slirp_opt == 'system'
-  error('Control-Flow Integrity is not compatible with system-wide slirp.' \
-         + ' Please configure with --enable-slirp=git')
-endif
-
 fdt = not_found
 if have_system
   fdt_opt = get_option('fdt')
-- 
2.36.0


