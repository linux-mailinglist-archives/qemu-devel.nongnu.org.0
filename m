Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B03514FE4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:49:08 +0200 (CEST)
Received: from localhost ([::1]:57612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSrj-00072k-DA
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSn-0001pr-Au
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:21 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:34703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSl-00068N-Oq
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:21 -0400
Received: by mail-ej1-x629.google.com with SMTP id g6so16130337ejw.1
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ILW7a6YSitOsVJxzuyE5svZCe+2dMekkGFJpwShkepY=;
 b=NWeR6n1iZP82R8Zt6bNRPxeYP0LAR1rvxl+l/F8Hy11RMz0GkgMft3WBEvwbVTey7u
 5a20w2q05M1sDjcPI6gplHy5E1wB4vZrJjLNjuTTgbHd8pe4vug5kPXINlBgJT3QBmXU
 2MI1dYjARzWu1+2B4kk2+UbSx5HYJYVRZOxFFS4DnsNiNm8fKYjblxPXW2bv1CeuXGCh
 4Rhf8f866cINNV22Cu1UIm69MUqxHFazHUHqYWBGHWkJJ+Zwgv4xanLu51z27Wfm/1di
 YeDzTdMQopK2TEGKjcxUZqzFKetRecV0vgpQSm0/EavhvLIYKt3UN8r2oml+kI4zzolu
 coNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ILW7a6YSitOsVJxzuyE5svZCe+2dMekkGFJpwShkepY=;
 b=xC9nnXplMhIdEQhjWv7yY7S43/u/GEdV0Q3QTp0QE9Ek9tZqpk9Q4TBuf2XK3iWS4b
 6MPQWTwGCheYFndqagxlHaky4NGx51i62VBvOV6qGYY4aplZ0M6JrjMFpQVCQP1k8A/q
 CwRYEXIZ8mZsPIAiReDJ0CNNC0Utm9yVp5EVA04ZYVH8TzOcPQNL1Adz+ZugipvNLZrx
 scSkmbCgZUoRbF10dA10rgAwI8igjmrja+N6YNFj0tV7brlAYzlq+jizet8O+9PyrGbq
 eV00VLsgciEkm29o0C3LSoOjZ8HLOCSuCr8RbeGJeQ+ztjjYsg17f2o5qgIWonq+rF+Z
 EaKA==
X-Gm-Message-State: AOAM533X/PJlDpo7JiD3Mt7+w2Qhezkns6zHcQx+bI5iVVTZj6IyKpmS
 1ZQIki3GEUAq0tGkNfaVHD3q5zK87KRg5Q==
X-Google-Smtp-Source: ABdhPJysEDEcefNZJ+VvysvDZ8XQ0xx3iJeJjc9ffre6AcAn8t9KxHPpJnxA435mLrGtEdOKQj9G5w==
X-Received: by 2002:a17:907:7295:b0:6f3:eca6:8b87 with SMTP id
 dt21-20020a170907729500b006f3eca68b87mr5403666ejc.754.1651245798427; 
 Fri, 29 Apr 2022 08:23:18 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/25] configure, meson: move iasl detection to meson
Date: Fri, 29 Apr 2022 17:22:53 +0200
Message-Id: <20220429152312.335715-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   |  2 +-
 meson.build | 16 +++++++++-------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index 519982800e..b146763fbd 100755
--- a/configure
+++ b/configure
@@ -2508,7 +2508,7 @@ if test "$skip_meson" = no; then
         -Daudio_drv_list=$audio_drv_list \
         -Ddefault_devices=$default_devices \
         -Ddocdir="$docdir" \
-        -Diasl="$($iasl -h >/dev/null 2>&1 && printf %s "$iasl")" \
+        -Diasl="$iasl" \
         -Dqemu_firmwarepath="$firmwarepath" \
         -Dqemu_suffix="$qemu_suffix" \
         -Dsmbd="$smbd" \
diff --git a/meson.build b/meson.build
index 50eb19e0ba..84f3ae7bd6 100644
--- a/meson.build
+++ b/meson.build
@@ -167,6 +167,12 @@ if 'dtrace' in get_option('trace_backends')
   endif
 endif
 
+if get_option('iasl') == ''
+  iasl = find_program('iasl', required: false)
+else
+  iasl = find_program(get_option('iasl'), required: true)
+endif
+
 ##################
 # Compiler flags #
 ##################
@@ -1584,8 +1590,8 @@ foreach k : get_option('trace_backends')
   config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)
 endforeach
 config_host_data.set_quoted('CONFIG_TRACE_FILE', get_option('trace_file'))
-if get_option('iasl') != ''
-  config_host_data.set_quoted('CONFIG_IASL', get_option('iasl'))
+if iasl.found()
+  config_host_data.set_quoted('CONFIG_IASL', iasl.full_path())
 endif
 config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') / get_option('bindir'))
 config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
@@ -3630,11 +3636,7 @@ summary_info += {'sphinx-build':      sphinx_build}
 if config_host.has_key('HAVE_GDB_BIN')
   summary_info += {'gdb':             config_host['HAVE_GDB_BIN']}
 endif
-if get_option('iasl') != ''
-  summary_info += {'iasl':            get_option('iasl')}
-else
-  summary_info += {'iasl':            false}
-endif
+summary_info += {'iasl':              iasl}
 summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
 if targetos == 'windows' and have_ga
   summary_info += {'wixl':            wixl}
-- 
2.35.1



