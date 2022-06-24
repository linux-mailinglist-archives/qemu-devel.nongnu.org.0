Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12C255959D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:46:36 +0200 (CEST)
Received: from localhost ([::1]:42442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4exY-0004a6-00
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efd-0006NW-Mi
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:28:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efW-0005Vv-VG
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656059278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XO0/hHLiaiRfru8/swolIqF1t4dhJ09LpUBzfgsfzkA=;
 b=hNkdtJTIKAHEtvwzyCpUM4+qQ6ZAniTi2SJ/7/bmdxcdkfNr4nnFrNCl9cQg8aLWYpp/9N
 tXhKru2jau4acF1DcXZE7QqzFPWcTOjIgSu8zqc9gjGc0W0YdZz48V+7AoXvNwwi1HqIC8
 prHexrYb7VaPZOtsWFWVe4/dQaVDeNg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-Wn4Cj0lIO2GuKxKjzczaag-1; Fri, 24 Jun 2022 04:27:57 -0400
X-MC-Unique: Wn4Cj0lIO2GuKxKjzczaag-1
Received: by mail-ed1-f69.google.com with SMTP id
 q18-20020a056402519200b004358ce90d97so1379083edd.4
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 01:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XO0/hHLiaiRfru8/swolIqF1t4dhJ09LpUBzfgsfzkA=;
 b=IdhD2ZPhnKLP2vNysMhP4efrziXNiPEdjle31kLH0BNqCGsx35ldE/J5kXh8lPmGpU
 3etV3KBhTdjxlBkConTkwMT3Q+khVPAku4DsOwW02bz/ksjOpSWA85jy5bsbpHAo7oDV
 zeA2+7Nkb5FdTrEuhvHRsgSRMAVnj9L9LloiSShzNrgHmrS1VwV/aDAiQJZNTsbzOOGS
 bLP9Dbg3GZ/oBW1XRhPgnFi5GP5biPgRrtuNQKrpVBdXBgS7elMxPi27dpKGxlC/3O+b
 cgEl4ekTwt1pBjAHkZfCBmd2usqsNDXt47fFi51lAJAN5Z/3VEclseTfL9oo26Cs0+Hw
 3XNA==
X-Gm-Message-State: AJIora/j/stX/DJ32Hq1dBNorf9gYvM4CxFoOQ2Z+GKmolbNU3S4Da66
 x+7hDWX0ztGRDtDjUF3fqk4YQpYsZr5zV6ySzQGeZhwCrsqTDXktF4IvzSobcfhtXfb4eB+m/XN
 ick59TNvRfMTJl3uzWz1ue7czhOI347IEyGR2v6AVpqdrxZBr27hOLfh+S5T8M4c/rgI=
X-Received: by 2002:a17:906:149:b0:712:c8:fa53 with SMTP id
 9-20020a170906014900b0071200c8fa53mr11899414ejh.563.1656059275602; 
 Fri, 24 Jun 2022 01:27:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sqcLBCh0eA8G2LFh3Yez1gZP8GfCIUXOmiNBl7O/HwYF9YcUQx+LrE6DKDQSs4/tH+h90qAQ==
X-Received: by 2002:a17:906:149:b0:712:c8:fa53 with SMTP id
 9-20020a170906014900b0071200c8fa53mr11899396ejh.563.1656059275330; 
 Fri, 24 Jun 2022 01:27:55 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 q2-20020a170906a08200b006fed93bf71fsm736249ejy.18.2022.06.24.01.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:27:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 12/14] audio/dbus: fix building
Date: Fri, 24 Jun 2022 10:27:28 +0200
Message-Id: <20220624082730.246924-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624082730.246924-1-pbonzini@redhat.com>
References: <20220624082730.246924-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Commit c9c847481 broken dbus audio module compilation with bad
'CONFIG_GIO' usage. Furthermore, it implied extra dependency on audio
module which aren't necessary.

The problem was that 'dbus_display' is not correctly automatically set
on MacOS, because opengl dependency wasn't taken into account.

Fixes: c9c847481 ("audio/dbus: Fix building with modules on macOS")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220622154918.560870-1-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 audio/meson.build | 2 +-
 meson.build       | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/audio/meson.build b/audio/meson.build
index 94dab16891..3abee90860 100644
--- a/audio/meson.build
+++ b/audio/meson.build
@@ -28,7 +28,7 @@ endforeach
 
 if dbus_display
     module_ss = ss.source_set()
-    module_ss.add(when: [gio, pixman, opengl, 'CONFIG_GIO'], if_true: files('dbusaudio.c'))
+    module_ss.add(when: gio, if_true: files('dbusaudio.c'))
     audio_modules += {'dbus': module_ss}
 endif
 
diff --git a/meson.build b/meson.build
index 1b255f91ef..4b2a0b35cb 100644
--- a/meson.build
+++ b/meson.build
@@ -1653,6 +1653,8 @@ dbus_display = get_option('dbus_display') \
            error_message: '-display dbus requires --enable-modules') \
   .require(gdbus_codegen.found(),
            error_message: '-display dbus requires gdbus-codegen') \
+  .require(opengl.found(),
+           error_message: '-display dbus requires epoxy/egl') \
   .allowed()
 
 have_virtfs = get_option('virtfs') \
-- 
2.36.1



