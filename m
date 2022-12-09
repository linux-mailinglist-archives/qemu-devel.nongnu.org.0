Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D4264819E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:27:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bWF-0004yL-Qk; Fri, 09 Dec 2022 06:26:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUZ-0003wo-6M
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUV-0000xj-Vn
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E6Kn+I8CfWpn/0AmDasqCnq+EboZ+mRrHgi6RT57zh0=;
 b=SP/trcK1D9CZ0j3OCglZFVMPtB+/PEWp6fLcNtlzvuVJs+OUECMxvPk1b6u5CJ3Y0QpuoF
 lkfN4GmkXjzep5rQfM19Ck032xGd4T3wqM0Q0RPaXiiSDOYpRzaFp8hlL+5Gx71AY3yOBZ
 gUTCAbmPZN0efoqQAi39p8FjxR1Sjto=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-418-zG4XgSFdOi27Yq8rI29ZNA-1; Fri, 09 Dec 2022 06:24:29 -0500
X-MC-Unique: zG4XgSFdOi27Yq8rI29ZNA-1
Received: by mail-ej1-f71.google.com with SMTP id
 xh12-20020a170906da8c00b007413144e87fso2910510ejb.14
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:24:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E6Kn+I8CfWpn/0AmDasqCnq+EboZ+mRrHgi6RT57zh0=;
 b=Uu/v94Dfq44fDyT/qfKk+aZB3s22M3sOyT+ULqlNNv0AtaR/QdIXaxeJqjXURaax/g
 MTZRMx/0ZmRvl3ZQdtENduzTtXPzuENM9eiP6xVIBhuHuxK1vNSoDPn7GkOFB0UH5rHG
 nVh9b7GhEDz/LVUxDwsO9hhuKWxhYHTKM6YgMnvidgPX1FadN0NMq7ZLsX/QNh+mexlk
 9GNGzJCxN/Qs2DirA94xTPf2EdQ5jTxNcwE/dIChola4YETZ5bTYf1AVooXumF7IfdCw
 fTUwWgBiS7NHk8UIoZhmfK9ECruBgjeKFD1XjXp0XpgkwvKkxZrxRdoiabZm10eogJ7Y
 1fAQ==
X-Gm-Message-State: ANoB5pkI7ERB/Lp8MnNdRRDHUPxCly08VVPUrsiYkL+xlpS39SwgLHem
 BQ6YPvgBoEPHuDQJzcYAAmoRXb8QvG9BLe0wpKfCuZCT8llh/rnQXHD0NCpeAIo3Wdidvu8Psd3
 zoPmNnzGPbJMnnC2/VoS74f8mvLvAklrgSsq+ReaRz4xhnR25N3x6VDeXWqwPZnRSGwI=
X-Received: by 2002:a17:907:9208:b0:7c0:d605:fe42 with SMTP id
 ka8-20020a170907920800b007c0d605fe42mr3677189ejb.18.1670585068137; 
 Fri, 09 Dec 2022 03:24:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6idrx+rOibinie7p68xtIqk14dxhcDXX9lHho41MOM4Qd8bBBjRXl0GS7ducEdqRE5GU7YeA==
X-Received: by 2002:a17:907:9208:b0:7c0:d605:fe42 with SMTP id
 ka8-20020a170907920800b007c0d605fe42mr3677176ejb.18.1670585067824; 
 Fri, 09 Dec 2022 03:24:27 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 v27-20020a170906489b00b007c094d31f35sm450537ejq.76.2022.12.09.03.24.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:24:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/30] meson: tweak hardening options for Windows
Date: Fri,  9 Dec 2022 12:23:45 +0100
Message-Id: <20221209112409.184703-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

-Wl,--dynamicbase has been enabled for DLLs upstream for roughly 2
years (https://sourceware.org/bugzilla/show_bug.cgi?id=19011), and
also by some distros including Debian for 6 years even
(https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=836365), so
just enable it unconditionally.

Also add -Wl,--high-entropy-va.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index 5c6b5a1c757f..d61c7a82f112 100644
--- a/meson.build
+++ b/meson.build
@@ -193,10 +193,7 @@ qemu_ldflags += cc.get_supported_link_arguments('-Wl,-z,relro', '-Wl,-z,now')
 
 if targetos == 'windows'
   qemu_ldflags += cc.get_supported_link_arguments('-Wl,--no-seh', '-Wl,--nxcompat')
-  # Disable ASLR for debug builds to allow debugging with gdb
-  if get_option('optimization') == '0'
-    qemu_ldflags += cc.get_supported_link_arguments('-Wl,--dynamicbase')
-  endif
+  qemu_ldflags += cc.get_supported_link_arguments('-Wl,--dynamicbase', '-Wl,--high-entropy-va')
 endif
 
 if get_option('gprof')
-- 
2.38.1


