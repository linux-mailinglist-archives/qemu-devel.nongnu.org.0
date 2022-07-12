Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D28571AE0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 15:13:23 +0200 (CEST)
Received: from localhost ([::1]:39448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFha-0006oa-CX
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 09:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLY-0003Fa-MT
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLU-0001Vg-6N
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IEBtrhHOZoW2IpVmQ2emXJdx/NNh7WPD0iaL+UDhKTg=;
 b=V96PLMdrvH6O3N79TMUSJVtxsKjRnOWODEXcZQIXpNHjKO5v1A0ZJwvDtPcbm5ZhFahy6d
 ScZ2knbKhGxQtIkVYpBF22fcA9lVSfw993k94eQolcJII9Llbb5InuznO4/M1UigZafHCW
 svmwweltIozyhHJrpMMpQuDORfk944M=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-7BuHiN8fMS2SE_DwlFesHA-1; Tue, 12 Jul 2022 08:50:29 -0400
X-MC-Unique: 7BuHiN8fMS2SE_DwlFesHA-1
Received: by mail-ed1-f69.google.com with SMTP id
 f13-20020a0564021e8d00b00437a2acb543so6086362edf.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IEBtrhHOZoW2IpVmQ2emXJdx/NNh7WPD0iaL+UDhKTg=;
 b=o+vnV03zk/7XmhY5gSA0hNtiMNM5hDTeuhl5atNUHHVYLYK9gc7Ti7nmgiKECsQyZK
 RAucGqrM9GpRilXNne+Asv3aLArKV7V4/eph33btfH8YfaE+Ale24BOV7JNeBR5n2f2x
 vsvIIL4vnjL1V3S0T72OSQ2tCKdp2xQvfErhTnJSx8SwcshkHjm+RnUWWYNisTmFUPzr
 5amxfW55kB0xcSos6qnv3P67y5uWBEyRmI9wt+EKYitz54axQyzXyoqSlsxGdo7uFZjO
 5Dp9Hc64hk3zxgMt5AYC4SmCThfz9AGQfY+9jEWn+3ZsFeyE9yvimyJgJFmzf0EASl5D
 020w==
X-Gm-Message-State: AJIora9Av/goghLy3Da48xabrOUCGLTR06VvkMDI5evsaojEuxVIsYo+
 BQFUcumpyx1IudfT67eoJ5lcIGeYI0Sd7WUHFZufTGPsFhf3tU0qnqC+SqvMNxvoA2zjeVTUwI8
 rNiVutDUfjA/vjGM2A786DYS8z8Sfa2uNPY4Plm+l40Q1bw7UyLX8/a8qxZGbtHf8X9M=
X-Received: by 2002:aa7:c84a:0:b0:437:bc9c:af63 with SMTP id
 g10-20020aa7c84a000000b00437bc9caf63mr30491562edt.370.1657630228293; 
 Tue, 12 Jul 2022 05:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vu4zLlhw1hr+9GIvJX6L1lvEE8SZ0MaoXpH+NOCBMro1PRjhSvXxur8+8MasIu/dT3r+K5sA==
X-Received: by 2002:aa7:c84a:0:b0:437:bc9c:af63 with SMTP id
 g10-20020aa7c84a000000b00437bc9caf63mr30491542edt.370.1657630228077; 
 Tue, 12 Jul 2022 05:50:28 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 ec10-20020a0564020d4a00b0043a45dc7158sm5916949edb.72.2022.07.12.05.50.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:50:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/18] meson: place default firmware path under .../share
Date: Tue, 12 Jul 2022 14:49:56 +0200
Message-Id: <20220712124956.150451-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712124956.150451-1-pbonzini@redhat.com>
References: <20220712124956.150451-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Fixes: c09c1ce7e9 ("configure: switch directory options to automatic parsing", 2022-05-07)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson_options.txt             | 2 +-
 scripts/meson-buildoptions.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson_options.txt b/meson_options.txt
index 97c38109b1..9a034f875b 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -6,7 +6,7 @@ option('qemu_suffix', type : 'string', value: 'qemu',
        description: 'Suffix for QEMU data/modules/config directories (can be empty)')
 option('docdir', type : 'string', value : 'share/doc',
        description: 'Base directory for documentation installation (can be empty)')
-option('qemu_firmwarepath', type : 'string', value : 'qemu-firmware',
+option('qemu_firmwarepath', type : 'string', value : 'share/qemu-firmware',
        description: 'search PATH for firmware files')
 option('pkgversion', type : 'string', value : '',
        description: 'use specified string as sub-version of the package')
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index d0e14fd6de..4b7b8ffaa2 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -42,7 +42,7 @@ meson_options_help() {
   printf "%s\n" '  --enable-trace-backends=CHOICES'
   printf "%s\n" '                           Set available tracing backends [log] (choices:'
   printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
-  printf "%s\n" '  --firmwarepath=VALUE     search PATH for firmware files [qemu-firmware]'
+  printf "%s\n" '  --firmwarepath=VALUE     search PATH for firmware files [share/qemu-firmware]'
   printf "%s\n" '  --iasl=VALUE             Path to ACPI disassembler'
   printf "%s\n" '  --includedir=VALUE       Header file directory [include]'
   printf "%s\n" '  --interp-prefix=VALUE    where to find shared libraries etc., use %M for'
-- 
2.36.1


