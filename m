Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DA32FFEF6
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 10:23:33 +0100 (CET)
Received: from localhost ([::1]:41066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2sfE-0002lY-D1
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 04:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2se9-0001wK-K3
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 04:22:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2se7-00028A-9v
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 04:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611307342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PsUl50B4Q0yPeDiJb4SPlXQsiySIOlkRRv1RmWsK7og=;
 b=NpRhsEvRHgOI+fhqsaUIn5qdPfTj2vtt39a2ACms2IyC6wG41F39n3XwVp8XOvhYr/8CsA
 zjZrIACTg9pYzQ8kXtmQ868aGaiRFupPF1Cgl8U3UmvDqVGsjyJknUN9PaG6lqvmfxOnpw
 GO2gJYpmiPcbTMe9t6Rcz4+tdZfIQVM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-gdQiewE4PYyszYW7P6kZnA-1; Fri, 22 Jan 2021 04:22:20 -0500
X-MC-Unique: gdQiewE4PYyszYW7P6kZnA-1
Received: by mail-ed1-f70.google.com with SMTP id 32so2621261edy.22
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 01:22:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PsUl50B4Q0yPeDiJb4SPlXQsiySIOlkRRv1RmWsK7og=;
 b=kM4zxlsIzu6yjiY4nxfcjw5N+F91/S7ZNzmSxeLXqhTZ+kl7bzue2jBRcvILrPnnEa
 ZknJJ7YNwOyYWxwdAM87t9LZWk63fcr7E7kK2PbV3lkcrdShQtk/f+LgIyHdCnJuB3hV
 GnviFOkC6eISkPnC86uUDQygLSaE71RSbMm7LlvUCIhWqltODUrB8hxs+yymkUl+c0r9
 JCQfD5dAVK38jdFO3SCUg7UAwHMJ/V7QETlEcVG3GvM9NJINUVbXKa2nLEceSKX6rVwo
 IjxeTzKTswaKS+1J4Iq2nktJ/di6pAyLc5ssVc/wN4YsoTkPb5y9mNkr0FE6h4dYh4us
 wIyQ==
X-Gm-Message-State: AOAM533lxDoWc9MQw4oSWUWKJr//3WnkHGeJcOICvJcucFjOWZbiZlK7
 ZtU7Kn7gxIScgUVHHcvMK4yL3zd07FmZ+0eY+qbr+Wb5p4Ct5S5putJxJGXj6p5s92nzFgAskDz
 cXkfh9IARXgVwxpYl9UD2/GbfMajA2ehrzwR9hG5UxeTZdah5xFPXknihHHvd7WiM
X-Received: by 2002:a17:906:a042:: with SMTP id
 bg2mr2308483ejb.540.1611307339197; 
 Fri, 22 Jan 2021 01:22:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKi3V7jbIUfmu9SG/9O7oIPXNH0HlMt//aarVYcbY5t2elGMkbXOSgM1ufYoSWWK4Xp++E6A==
X-Received: by 2002:a17:906:a042:: with SMTP id
 bg2mr2308462ejb.540.1611307338945; 
 Fri, 22 Jan 2021 01:22:18 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id q2sm4723658edv.93.2021.01.22.01.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 01:22:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] meson: Warn when TCI is selected but TCG backend is
 available
Date: Fri, 22 Jan 2021 10:22:05 +0100
Message-Id: <20210122092205.1855659-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122092205.1855659-1-philmd@redhat.com>
References: <20210122092205.1855659-1-philmd@redhat.com>
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

Some new users get confused with 'TCG' and 'TCI', and enable TCI
support expecting to enable TCG.

Emit a warning when native TCG backend is available on the
host architecture, mentioning this is a suboptimal configuration.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meson.build b/meson.build
index 0a645e54662..7aa52d306c6 100644
--- a/meson.build
+++ b/meson.build
@@ -234,6 +234,9 @@
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
   endif
+  if 'CONFIG_TCG_INTERPRETER' in config_host and cpu in supported_cpus
+    warning('Experimental TCI requested while native TCG is available on @0@, suboptimal performance expected'.format(cpu))
+  endif
   accelerators += 'CONFIG_TCG'
   config_host += { 'CONFIG_TCG': 'y' }
 endif
-- 
2.26.2


