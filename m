Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6F5302683
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 15:53:05 +0100 (CET)
Received: from localhost ([::1]:58218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l43Em-0008Cy-8p
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 09:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4389-00046U-Hp
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:46:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4380-0002zS-9z
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:46:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611585961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=moujoo3wpaqNyQsY1CrjUL6h3PWNXXcWEFS2F5fvjSs=;
 b=IxWLkoyp6FgCx3bkJRVIGQwLwwQYD4GNrR8/daCUB4BYdnUawYfjYURe0S3/yeHiA6KRCn
 5PYsmz2ApRiGTipAUoiGtVqmdFG599YoVRNijFDDhb/RWlfRy9X4yVFzjHWzTyY3sKM7Av
 kRc/BosOKi+auzFJhLuCO+HD4cSxmAU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-nCjyCckmOUaYlhhUl43BcA-1; Mon, 25 Jan 2021 09:46:00 -0500
X-MC-Unique: nCjyCckmOUaYlhhUl43BcA-1
Received: by mail-ed1-f72.google.com with SMTP id 32so7527951edy.22
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 06:46:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=moujoo3wpaqNyQsY1CrjUL6h3PWNXXcWEFS2F5fvjSs=;
 b=Ap5zC8FWJU9a3EEtVqu9vt9FFnrh3HG57StZpdmhSgE38+lvH3X6HI2m1SABbY5IkE
 o3nYY1VGDqiuJHbw/+J6+AiUsITYr2Th1SprNQTvDNz0dLpcR2YM38UDWei9eEevy/zz
 g8K9flVVI0Qy1X8N+IDXc8CBGVf0kwoXjCpsNjlHAc6FZNfXbDPjiDBI2GzarKPdY+pd
 4h7+dJi+ycB2VaaXRL5YnmlFVb7b9+hJtYqweEiKrsF+Bhh6wakssBx+7QZoWlOp/Aye
 V+d+dhi/rTJjPN2Kq181p51GQVt2B3Aw+XTZEO7jSxm8QBzRZUxQI1+6gWUbqk64eRSt
 tvvg==
X-Gm-Message-State: AOAM533VYaxCUs4IfCVmDmX5f2dOjqvXv8TvaP2//VxS1JUK7bgUV3/t
 1imgrvCtI93VYevnWvp6r09TmnCMxz+ivN8X5qd6htnqCx+gzE46YNXBN8q6yTzSgRLS/L1XXsh
 7Qwomgt9HXf1uHih3HL+aoNV87khd2Tu7IZVz9M7H8Cv4tpYaqjPNHE+pGX5n1ZnI
X-Received: by 2002:a17:907:20a7:: with SMTP id
 pw7mr578437ejb.283.1611585958793; 
 Mon, 25 Jan 2021 06:45:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZjFAUdE2ZQt3llbkO2qTr/PmCco0P0DUiSz77Ob9rRL45HV+QX+FG3XB+CIWcH6hzBdnaKQ==
X-Received: by 2002:a17:907:20a7:: with SMTP id
 pw7mr578417ejb.283.1611585958640; 
 Mon, 25 Jan 2021 06:45:58 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id l1sm8336612eje.12.2021.01.25.06.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 06:45:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/4] meson: Warn when TCI is selected but TCG backend is
 available
Date: Mon, 25 Jan 2021 15:45:30 +0100
Message-Id: <20210125144530.2837481-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210125144530.2837481-1-philmd@redhat.com>
References: <20210125144530.2837481-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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

Some new users get confused with 'TCG' and 'TCI', and enable TCI
support expecting to enable TCG.

Emit a warning when native TCG backend is available on the
host architecture, mentioning this is a suboptimal configuration.

Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Suggested-by: Daniel Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meson.build b/meson.build
index 16b2560e7e7..f675c54e636 100644
--- a/meson.build
+++ b/meson.build
@@ -228,6 +228,13 @@
     else
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
+  elif get_option('tcg_interpreter')
+    warning('Use of the TCG interpretor is not recommended on this host')
+    warning('architecture. There is a native TCG execution backend available')
+    warning('which provides substantially better performance and reliability.')
+    warning('It is strongly recommended to remove the --enable-tcg-interpreter')
+    warning('configuration option on this architecture to use the native')
+    warning('backend.')
   endif
   if get_option('tcg_interpreter')
     tcg_arch = 'tci'
-- 
2.26.2


