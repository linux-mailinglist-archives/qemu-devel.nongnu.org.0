Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A221C5A9F2C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:38:00 +0200 (CEST)
Received: from localhost ([::1]:50652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTp4h-0004Ig-PE
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosD-0007kE-7M
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTos3-0008JL-An
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLdasqLgdNc/RmPv5zMxDcuKU1CYFijFkgMsj5cBido=;
 b=DhzddJgvK5IG8XO5bPr2qEEXNPg0f5fNt2YwzTYlsvBA6kZcJaKtCMVFUIAx6HlR5FUjAK
 jnpFicbUhmmPc/dlIKyehUMbuQ1xeQoPRo97igzkAvq+Immffe5+/eNOXWXDUTYfiFJLTd
 hgH+Hfh+S9R672COyzm00E3dKWqfJ/g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-326-sGgQIdWuOHe9YvazPyGimQ-1; Thu, 01 Sep 2022 14:24:52 -0400
X-MC-Unique: sGgQIdWuOHe9YvazPyGimQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 f14-20020a0564021e8e00b00448da245f25so5641011edf.18
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=LLdasqLgdNc/RmPv5zMxDcuKU1CYFijFkgMsj5cBido=;
 b=NEMgE+J4PXBGZU5BEAKeg/xE4dJnUG8+4E7rY7c/9AIpLk9ZPDvLofDaw3Osqn2Xyo
 ebZaveiccBzW+YopwsHSHI+7FUxiYiXF/zWR3s+RCkLg9HpSyyrA7/xSSbW0O/DSDUZG
 RXKTz2EAfFnhsUZZXjXnDlcM9V7KExXyhxg82wjDQiuYXfYa6Uez87at7Rz/IBuRa8gS
 tNWlyhYHPyUZwqQ4XjL8iOSxh2sJA5F/glgNgbzkpimlRZIuw92r69yDWZgdenG1FyWw
 9VlFWel9v9WfKUwdmajBFw0i/zPS5oOXslpE4uz/lxm0McD0qcIgg/g+8xFevVjTv+S1
 XNLg==
X-Gm-Message-State: ACgBeo3nr+TZM+r25CsVbpkQSWccvip0qCeORhoWb8ITmnybBbC6fABD
 4teN8wRZfwoe47hi1mgbAeZZ1dMDaDGGus4E7mA/PPcJnwXz3TimgAgzqm6ze7OSL+kGAGGZ9Wh
 ODjNXrdswx3Kv0hyJqaj80DCtXM1Fa+Io+jbJCdgep6v/Q/r6GJvDmoH86jg2RTcxpoQ=
X-Received: by 2002:a17:907:7b95:b0:72f:9c64:4061 with SMTP id
 ne21-20020a1709077b9500b0072f9c644061mr24626357ejc.351.1662056687253; 
 Thu, 01 Sep 2022 11:24:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4ra+k7CJy1hBbzpSTyjaAuksBB9JK+PHH45zTyQzqRi3gZzECDmuym5oymn0LWXguyyEyjHg==
X-Received: by 2002:a17:907:7b95:b0:72f:9c64:4061 with SMTP id
 ne21-20020a1709077b9500b0072f9c644061mr24626341ejc.351.1662056686928; 
 Thu, 01 Sep 2022 11:24:46 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 g2-20020a17090604c200b0073c1e339a37sm8971817eja.149.2022.09.01.11.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:24:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Anton Kochkov <anton.kochkov@proton.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 07/39] meson: be strict for boolean options
Date: Thu,  1 Sep 2022 20:23:57 +0200
Message-Id: <20220901182429.93533-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.08, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Anton Kochkov <anton.kochkov@proton.me>

While Meson buildsystem accepts the 'false' as a value
for boolean options, it's not covered by the specification
and in general invalid. Some alternative Meson implementations,
like Muon, do not accept 'false' or 'true' as a valid value
for the boolean options.

See https://mesonbuild.com/Build-options.html

Signed-off-by: Anton Kochkov <anton.kochkov@proton.me>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220817143538.2107779-1-anton.kochkov@proton.me>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson_options.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson_options.txt b/meson_options.txt
index e58e158396..63f0725174 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -82,9 +82,9 @@ option('tcg', type: 'feature', value: 'enabled',
        description: 'TCG support')
 option('tcg_interpreter', type: 'boolean', value: false,
        description: 'TCG with bytecode interpreter (slow)')
-option('cfi', type: 'boolean', value: 'false',
+option('cfi', type: 'boolean', value: false,
        description: 'Control-Flow Integrity (CFI)')
-option('cfi_debug', type: 'boolean', value: 'false',
+option('cfi_debug', type: 'boolean', value: false,
        description: 'Verbose errors in case of CFI violation')
 option('multiprocess', type: 'feature', value: 'auto',
        description: 'Out of process device emulation support')
-- 
2.37.2



