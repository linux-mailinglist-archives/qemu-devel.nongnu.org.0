Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5B654DDF7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 11:13:35 +0200 (CEST)
Received: from localhost ([::1]:45756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1lZF-0004no-Gs
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 05:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvx-0001yN-UP
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvw-0002vF-Ec
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TkMcaMw54kqRicgUZ5/Gqp/miDgkyZfV9Nj3WpRnuSs=;
 b=Bxt1seUvDOEujU4H6R3HLs3EF/WoeI3kFR3zGaLfZ2F73Dn+RpySC1565Vdr17ayz+7y/Z
 kuTXCMOy8i3pIBC9AEPZzrTYtNVTjPHfyKA4M8/rMy8QILe3myd8cLeiJD71OtzDbYzvjv
 jW3axJJKWvSilDy/1BG2rLXkgJ9XugY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-9AkW6TKgNzGiUB-7uylaHw-1; Thu, 16 Jun 2022 04:32:54 -0400
X-MC-Unique: 9AkW6TKgNzGiUB-7uylaHw-1
Received: by mail-ed1-f72.google.com with SMTP id
 n8-20020a05640205c800b00434fb0c150cso744193edx.19
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TkMcaMw54kqRicgUZ5/Gqp/miDgkyZfV9Nj3WpRnuSs=;
 b=l8WBPJuGJ3i1AyCIQNU2wj2wA5qk+4fbnKNvy9dOEXDxqcXtPdZ9Ko8wo64zBp0u9Y
 Egb4TVcP+r+zZIRaFt6euWdVQYk06OsFg4Okvhz+Rl+agXKfsCrEiRnrc75dkEdo6mYv
 3uEvP9se0sjji8isQepoe4kB0az0bm+XQ8tAZYduLxWEwWOG2P7pNdfwjVFq16TZRUEd
 x8IeEdalfua1D4gX9B21utNdPHC0dOUrll40CVsdX/FWi8BKN5Z7N7XF/CUiVtECxSWT
 K8lqL7ZY8REkjN99Pn55iNX4V3c/8r6hpj0lRDlNmM7cyxSsMF2tn4Dn/z8Sd3hpLwWr
 wfag==
X-Gm-Message-State: AJIora/68Jqad6j2fnQcjmFomW0vNfOIE10bt8fgu/BhzzoH6fEQyIv7
 lk2JH8rYyZEbVnNZ5gXhUUB+aCYYbBK1ac035IVP9xioWTaMcA0R2ehFqO/UmRNvj/Jsinlb2bv
 2857fZZ24XP7LgiOFjnNxOWKSJlG+T0vFlnuOpv9Y70dOv2+sK01IS5GGU1RYI1gRFbg=
X-Received: by 2002:a05:6402:51d3:b0:431:6c7b:28d with SMTP id
 r19-20020a05640251d300b004316c7b028dmr4762729edd.281.1655368372822; 
 Thu, 16 Jun 2022 01:32:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tuhrK9XpTUW2FyQvB7ISqXwQhzoZw71gSUcdX/AzGfjVcQImCIq/X9xN1MW6tLZsOqeAR1Yg==
X-Received: by 2002:a05:6402:51d3:b0:431:6c7b:28d with SMTP id
 r19-20020a05640251d300b004316c7b028dmr4762711edd.281.1655368372630; 
 Thu, 16 Jun 2022 01:32:52 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 d5-20020a170906344500b006fed062c68esm464309ejb.182.2022.06.16.01.32.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/21] meson: put cross compiler info in a separate section
Date: Thu, 16 Jun 2022 10:32:08 +0200
Message-Id: <20220616083209.117397-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616083209.117397-1-pbonzini@redhat.com>
References: <20220616083209.117397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

While at it, remove a dead assignment and simply inline the value of the
"target" variable, which is used just once.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index fe5d6632fb..0458b69cdf 100644
--- a/meson.build
+++ b/meson.build
@@ -3744,21 +3744,24 @@ endif
 summary_info += {'strip binaries':    get_option('strip')}
 summary_info += {'sparse':            sparse}
 summary_info += {'mingw32 support':   targetos == 'windows'}
+summary(summary_info, bool_yn: true, section: 'Compilation')
 
 # snarf the cross-compilation information for tests
+summary_info = {}
+have_cross = false
 foreach target: target_dirs
   tcg_mak = meson.current_build_dir() / 'tests/tcg' / 'config-' + target + '.mak'
   if fs.exists(tcg_mak)
     config_cross_tcg = keyval.load(tcg_mak)
-    target = config_cross_tcg['TARGET_NAME']
-    compiler = ''
     if 'CC' in config_cross_tcg
-      summary_info += {target + ' tests': config_cross_tcg['CC']}
+      summary_info += {config_cross_tcg['TARGET_NAME']: config_cross_tcg['CC']}
+      have_cross = true
     endif
-   endif
+  endif
 endforeach
-
-summary(summary_info, bool_yn: true, section: 'Compilation')
+if have_cross
+  summary(summary_info, bool_yn: true, section: 'Cross compilers')
+endif
 
 # Targets and accelerators
 summary_info = {}
-- 
2.36.1



