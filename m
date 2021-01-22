Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58001300442
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:35:05 +0100 (CET)
Received: from localhost ([::1]:42602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wae-00058w-C6
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:35:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2wW4-00021c-HR
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:30:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2wW2-0004hn-NV
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:30:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611322217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2KnzrbOXQKW+gjAQaElBHDQDPnPGtc8SuMwrCUeTfQs=;
 b=a3P/4NuVJJ32+KB6ML+TjCBawsSskcqRdJDm1fDPh9hpsoeuUU4N766VK4aorBmzXCGXEt
 IJh/Xy+bxXkdjTLCg74QbrduNweyjjuYdyW/0kw+RawTGyOBm0H/oXM5dT105GHv9Dz4BN
 wkPCaS02Jzw1gObfvTJbr+UJtR9QOE8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-oC43GnOqNACugv6P_xH32Q-1; Fri, 22 Jan 2021 08:30:15 -0500
X-MC-Unique: oC43GnOqNACugv6P_xH32Q-1
Received: by mail-ed1-f72.google.com with SMTP id m16so2888399edd.21
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 05:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2KnzrbOXQKW+gjAQaElBHDQDPnPGtc8SuMwrCUeTfQs=;
 b=FC9Pol0z17jai5ylBlXr8RC2ClKWrrlkxeYYMcw1lzQsE5/caKkicuJ7Vuyg3LMYRJ
 nd4BCXTNqZ84UoBf1U6qgoZYdhbWtEesmO4Ezj7d6rzSbrSTKc6LeR5oVoPwgDefpQlA
 rUZN8SnIQeKIaIHWs3NpWfYAxUp14NLrN654NXlnjqd2p6Egd0naIzMl19M3zwzr7eJK
 ZTDGBCXxzs9f0i0zRl1TjCoOV9VFDdMX4ytg59ORmg4lBE25Cisk3ToY/aCwt6ccQn/d
 QnAyLkBaTI8XwsiCv94MojfPFjehqexCsvpuz6/jeZ7GMKUm52RNB9R2sR2lwNbA/fVv
 pLuw==
X-Gm-Message-State: AOAM532jrHnaKwB7qVco/6efYQO0p9MXaWB6nVF2T0KXkqSNeoVts9Gc
 +sN7vj1fQ/YlIUvvG1/QviD1BjJiUB/D/Lv0jYmfgvtkI+7EqVGjcTx4OgxVIj4PP0xh4UZWsve
 lwX9mu545hudmTts0KKqjkc4D8ZWbExk+i9wQNLX6x9BrcqZ4IWQw9zcDOmdshlgA
X-Received: by 2002:a17:907:a077:: with SMTP id
 ia23mr2789988ejc.434.1611322212546; 
 Fri, 22 Jan 2021 05:30:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuSfHMZ53V3OprBiAdcKi9GojHq4lJGM5X12yW0zeKyVir9ZxjyTcCxEGmOLk8eu7+nJ1Iag==
X-Received: by 2002:a17:907:a077:: with SMTP id
 ia23mr2789967ejc.434.1611322212323; 
 Fri, 22 Jan 2021 05:30:12 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k16sm4423726ejd.78.2021.01.22.05.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 05:30:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] meson: Explicit TCG backend used
Date: Fri, 22 Jan 2021 14:30:01 +0100
Message-Id: <20210122133004.1913923-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122133004.1913923-1-philmd@redhat.com>
References: <20210122133004.1913923-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


