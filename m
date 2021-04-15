Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19FD36106F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 18:51:51 +0200 (CEST)
Received: from localhost ([::1]:58836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX5Da-0006mX-Si
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 12:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4we-0003cy-PE
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:34:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4wd-0006NU-3p
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTefL8KFB03yS8Z+kdiNHNixKSuiXSG+jyZydBtqNkg=;
 b=Uwi7iIjkgRkntdhDyh2+ctvJx6Cc89xRSfe88nuwT2/w4RMquKA/HnPKpNOR1d6cu2z2um
 syh9Bq1fcyvDVpoVp28nRmnN2AWPFcA/t3WeMGvt9IkGlb4gvmB7dPA7R3jk+tbxKGY5jX
 OaULCBrMd73JQq4xJqr9h12Wgkekq3c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-DNYkYr_iNmCXjwtI9ZbX0A-1; Thu, 15 Apr 2021 12:34:15 -0400
X-MC-Unique: DNYkYr_iNmCXjwtI9ZbX0A-1
Received: by mail-wm1-f70.google.com with SMTP id
 26-20020a05600c021ab029012e366eff83so750565wmi.4
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 09:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sTefL8KFB03yS8Z+kdiNHNixKSuiXSG+jyZydBtqNkg=;
 b=GZlVGUPXjqnQrFKf+8w6cUXFZGzVuqm5xyPx4XmaROMdfA6gQSPLNJMkmm9SzBGu5e
 /JZnXookUX8+3E6iLOg01ubaTdLySXBvwRFqtXtPHt8XX6jxC+vIw+KkZalG4xXlAGmC
 n9rgy/Am5xplp+DIXr3YGNcm+MInCNjhume1MyIAZ5/ccyg+Mq7FzqtRfxj819H8+X66
 SU1C0N94KFgkDBfI60AtHFAb6O/z0xI/TRpLcOfRB09Ui9St+wABo6ikEd3Ajq1FnjBh
 vqcaSKj7pPUUN+Rl4QPLEUmiOKTNhsoJgtmT+lObBsSrEsrv1JC4xx4XE2tvpGWFNdXj
 OVLw==
X-Gm-Message-State: AOAM530yqOjGZXsx4PyJyDVAwM+LqNc+u/Dh2mtIZxrAhwKeygdOCCHo
 aUYrfCatPSfGu/zOzOBzt/FjtkVVIejZ7xMSgz4/MGInO7aVHVAiL3ta/xTR6JwN4LqepVwa76Q
 IRO4ta1/nDQMDvTQDLnyE/G9/QI+jrUN5TOxO2HBuuaChjIhZXci7rVhlUS2L8YEN
X-Received: by 2002:a5d:40c1:: with SMTP id b1mr4607892wrq.33.1618504454360;
 Thu, 15 Apr 2021 09:34:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1mCB1CJIwc4m4QG16DAMO2mbDNJ3r+knYlQB+Gd8Tdlp9fwrgFzh3Dre9+0E9D06QxZ9Rwg==
X-Received: by 2002:a5d:40c1:: with SMTP id b1mr4607861wrq.33.1618504454205;
 Thu, 15 Apr 2021 09:34:14 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f11sm3552479wmc.6.2021.04.15.09.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 09:34:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/12] tests/meson: Only build softfloat objects if TCG is
 selected
Date: Thu, 15 Apr 2021 18:33:04 +0200
Message-Id: <20210415163304.4120052-13-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415163304.4120052-1-philmd@redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The previous attempt (commit f77147cd4de) doesn't work as
expected, as we still have CONFIG_TCG=1 when using:

  configure --disable-system --disable-user

Now than we have removed the use of CONFIG_TCG from target-dependent
files in tests/qtest/, we can remove the unconditional definition of
CONFIG_TCG in config_host.

This avoid to build a bunch of unrequired objects when building with
--disable-tcg (in particular the softfloat tests):

Before:

  $ make
  [1/812] Generating trace-qom.h with a custom command
  ...

After:

  $ make
  [1/349] Generating trace-qom.h with a custom command
  ...

A difference of 463 objects...

Reported-by: Claudio Fontana <cfontana@suse.de>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Include Paolo's feedback:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg793872.html
therefore o not include Alex's R-b tag.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Emilio G. Cota <cota@braap.org>
---
 meson.build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meson.build b/meson.build
index c6f4b0cf5e8..623cbe50685 100644
--- a/meson.build
+++ b/meson.build
@@ -262,7 +262,6 @@
                         language: ['c', 'cpp', 'objc'])
 
   accelerators += 'CONFIG_TCG'
-  config_host += { 'CONFIG_TCG': 'y' }
 endif
 
 if 'CONFIG_KVM' not in accelerators and get_option('kvm').enabled()
-- 
2.26.3


