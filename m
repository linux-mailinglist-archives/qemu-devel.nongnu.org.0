Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5399F45DDEA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:48:30 +0100 (CET)
Received: from localhost ([::1]:54586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqGz7-0001GO-DR
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:48:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqGsl-0006eu-Lt
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:41:56 -0500
Received: from [2a00:1450:4864:20::430] (port=41771
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqGsj-0002Jh-JF
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:41:55 -0500
Received: by mail-wr1-x430.google.com with SMTP id a9so12517119wrr.8
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 07:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IBnkomQJkxbzzpqUI0StuDJRpi3gzRMQ5u3DHeZjNiQ=;
 b=jRA+PfTyJ1fa4QftMk97jcCbITjMbZQyn0BzbHGoY1lmTlKQfXd0Nnf6ugYw+iZHBR
 ahqWsGIBD7AExrRmk6KIV2nuZ6/+2RS7mbYepamy/+I/4m6bU5anLHJOcYxKotNKEINq
 QqFltf4jOq0dzm38BhGUJ6A9N7V4MB7G8RE/yk8JvmKl/EGSBJ0/vN9qs3mk5XjKwsZa
 3raZ/2f7RtQzHiQYohJ2Ub01vp/v/JtCSuN3RLme9ISRIPQrVvmq1HAXFBIh5w9AScoT
 ACSvxydKZBQLdFnC9yBR9HdS/1F9ZxX6nQdsR7h18jbHvlx+2JWcZgENHGPHjOt/SL4w
 Am5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IBnkomQJkxbzzpqUI0StuDJRpi3gzRMQ5u3DHeZjNiQ=;
 b=l0c25io8fygxF1lTxlwqWJVEz7eV6+krVjix6Go8HmaS4JIbSFiTphCrXkGQRuQ+Px
 GlLjQ1o1MCkyFCw3FFS44yQ4r/tYb5i2f96GXXOtG+tOcN0qjWWOKnHpDaBMEZegLxqr
 jiEDIZ3POpg6NXUxHWFSvNPtudWrUFLBWylt2RiplQe/xza43DoU6TlOPti2Xo42WC+V
 dnI3+BdiAYnJW7kRgLnE94huDz+ldGV92DHXgUIKv97HtFr181wcFMX1vbZ0DCr5kgC4
 /VcfHo6OMlkHp+rD3BdcnsrbNbkvtuddDQsyKAxikHwT1K8mbXeCnqxLq3YoxeFxD1QP
 cmjA==
X-Gm-Message-State: AOAM530rx2ipfviipJpfiyii5ASU/F7DBkzF+WQVw6EoL+KvDnaAjzLM
 HmOl/XWbqUNZZkIf4PuH8nm4m1Gbv3xO9A==
X-Google-Smtp-Source: ABdhPJxCxm6vuCtGJ+hWDZhyrzwLMeyvoYizrf+tCX2ZfdijjY69ZZKy2MlvbLTZ+fA4A9bWnXptjQ==
X-Received: by 2002:a05:6000:2a2:: with SMTP id
 l2mr7639803wry.110.1637854912194; 
 Thu, 25 Nov 2021 07:41:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z6sm4788300wmp.9.2021.11.25.07.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:41:46 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 568911FF9B;
 Thu, 25 Nov 2021 15:41:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] plugins/meson.build: fix linker issue with weird paths
Date: Thu, 25 Nov 2021 15:41:41 +0000
Message-Id: <20211125154144.2904741-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211125154144.2904741-1-alex.bennee@linaro.org>
References: <20211125154144.2904741-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, Stefan Weil <sw@weilnetz.de>,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Stefan Weil <sw@weilnetz.de>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/712
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211123205729.2205806-5-alex.bennee@linaro.org>
---
 plugins/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/plugins/meson.build b/plugins/meson.build
index aeb386ebae..b3de57853b 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -2,9 +2,9 @@ plugin_ldflags = []
 # Modules need more symbols than just those in plugins/qemu-plugins.symbols
 if not enable_modules
   if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
-    plugin_ldflags = ['-Wl,--dynamic-list=' + (meson.project_build_root() / 'qemu-plugins-ld.symbols')]
+    plugin_ldflags = ['-Wl,--dynamic-list=qemu-plugins-ld.symbols']
   elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
-    plugin_ldflags = ['-Wl,-exported_symbols_list,' + (meson.project_build_root() / 'qemu-plugins-ld64.symbols')]
+    plugin_ldflags = ['-Wl,-exported_symbols_list,qemu-plugins-ld64.symbols']
   endif
 endif
 
-- 
2.30.2


