Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624133000F7
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:01:10 +0100 (CET)
Received: from localhost ([::1]:33306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2uBh-0008DK-Ub
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:01:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2u9S-000719-AA
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:58:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2u9Q-0003k1-Ox
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:58:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611313128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2KnzrbOXQKW+gjAQaElBHDQDPnPGtc8SuMwrCUeTfQs=;
 b=ZoXejHOqPOwUGHxw8yQ2sqvgkqhCn/K5TanngtZn+qsfk2kGThupmvKwrTKmbKwkCaEdEq
 1exLDm7XtgyUAKqVLZXO8MIJJvuEq7kco4rW9a7V0bgAD9H/s3V1bS4wOTUeq6fgSKdIdZ
 nMXQfBbumQ9t/nQi2Ne7Z07K9aAoGbM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-EYUEvWYINy-awD893ezwxw-1; Fri, 22 Jan 2021 05:58:45 -0500
X-MC-Unique: EYUEvWYINy-awD893ezwxw-1
Received: by mail-ej1-f71.google.com with SMTP id z2so2067120ejf.3
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 02:58:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2KnzrbOXQKW+gjAQaElBHDQDPnPGtc8SuMwrCUeTfQs=;
 b=kdpJ+6JaSsMSRdQhk18Pcd3TxBfJHD9dDhLEVNwdFBL+G+3+S++Bcxiof1dyE++GDL
 gPt+aA+4yJ3bZH8nGOf7LFfPRCvtinX0QMJrVpR+jnRkhZFBbE1DvbcTCg54XBeaCvWJ
 YdgKWnMW9r0pnUDZi0HG5CAn3h6vWcM1mbVBya0Njh3Hao4HsiunDRUb92uyPgA3kFWB
 XITlfSy45qXna10Q9pVA/uWF3rN93JGHnx1i/5TOFKbNlGX12uNGLu4/rR4cgEEjeXaW
 teNPZlZAhcw5jzPsJrsACEpJwF4nc8OdvYdE21n3O0apNZRPpmyyh372kKua8j1sdo7O
 omkw==
X-Gm-Message-State: AOAM533K45NCde9miZgvB4aORaxA2QkbpcsHxAQWfaUKu8EJsIv0fIyl
 3rFip+dUTpHEyaE0VwAI3xZMBt9fZELLGcsyU7m9YFWJJ6gE/Yw6PEvB2BsAgav+SZp2fncZ6wX
 4GshemWYwuVm+1Y+Aw9mJSP8+hA8EXjYu7fjE99yLGQ4mwJ8Hc3DZrPmoYQFgclIn
X-Received: by 2002:a05:6402:b30:: with SMTP id
 bo16mr2834013edb.84.1611313124441; 
 Fri, 22 Jan 2021 02:58:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdpx7h3XRi/IG2+3LNK6hGzVzpD5uIZNCFjwkZrcM5gP86JtKoiMXID0w8o5b/GXdGB0AIUQ==
X-Received: by 2002:a05:6402:b30:: with SMTP id
 bo16mr2833994edb.84.1611313124258; 
 Fri, 22 Jan 2021 02:58:44 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id f9sm4996441edm.6.2021.01.22.02.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 02:58:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] meson: Explicit TCG backend used
Date: Fri, 22 Jan 2021 11:58:33 +0100
Message-Id: <20210122105836.1878506-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122105836.1878506-1-philmd@redhat.com>
References: <20210122105836.1878506-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 8535a83fb70..d5b76150e49 100644
--- a/meson.build
+++ b/meson.build
@@ -229,7 +229,7 @@
 if not get_option('tcg').disabled()
   if cpu not in supported_cpus
     if 'CONFIG_TCG_INTERPRETER' in config_host
-      warning('Unsupported CPU @0@, will use TCG with TCI (experimental)'.format(cpu))
+      warning('Unsupported CPU @0@, will use TCG with TCI (experimental and slow)'.format(cpu))
     else
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
@@ -2419,8 +2419,12 @@
 endif
 summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
 if config_all.has_key('CONFIG_TCG')
+  if config_host.has_key('CONFIG_TCG_INTERPRETER')
+    summary_info += {'TCG backend':   'TCG interpreter (experimental)'}
+  else
+    summary_info += {'TCG backend':   'native (@0@)'.format(cpu)}
+  endif
   summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
-  summary_info += {'TCG interpreter':   config_host.has_key('CONFIG_TCG_INTERPRETER')}
 endif
 summary_info += {'target list':       ' '.join(target_dirs)}
 if have_system
-- 
2.26.2


