Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879A23BC96A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:19:36 +0200 (CEST)
Received: from localhost ([::1]:52390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iAx-0006T8-8H
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htp-0000hi-SN
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:53 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htk-0002Eb-Qo
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:53 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so3282405wmq.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AST6UUW8k7XqSMCzb7jJhe8TYd/yVI6QztYJ6QIq+q8=;
 b=imduceKoWO8813UgYR6gM/c/DiRQl+Emr50shCliFWnOo3mYIK6WfGDpiUVfgdPSlB
 OMfwwQrtoX0UpDLZ3Txa6ZP74Plt/0XfmjBoujxmUGHDiOdAixZqbxfDDA4K1XjMLZmw
 KysdauNPJ3FduqAW6qRYhv1VzsSwz34tncYrIxWtQTXlvV5HaaHBFjRD3O6pOgtTaoYs
 VkHcLeyL0wOOfcsEItUta7DJWBaddGneslxPnfak2F4RzCuZ4z5sy80Ye7thC7GsvwqZ
 Uv+QPmFBVnXY1caAbPQpe7Qk/V2bLV+b4+XtSi9Vy23csJINbZK8dxxTy3BSEYZ+dEAC
 SS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AST6UUW8k7XqSMCzb7jJhe8TYd/yVI6QztYJ6QIq+q8=;
 b=fAJBExiwEIQ/uCn/FjrbCmh0eDlw9LAgGydmvPV5LeUe5+YfFztIcRGU6ThTHhku0B
 3CWZ6h3ydetGtBdIsgHzvrstrgxlMLqf6aa3xGeqgW+cj4w3ds/O4knyT74Gb/hK9cw/
 Duzwlqrd6CkmmVIzoK7YPLKHY5DXkZcTg3FGQ2VTwDXj/pGSj/0KKGObRfpT9n7dtO/o
 RrfXtfPpITBfvI0fuC6XRpFWUohxXJ8QK/a8XRkMQKyMjGvGEved6sMuxKnOfR0lh2ZC
 eBPHoZ2rjIsBg/HNtkNWrpchEl0ISnFYBG4xhuZTCiloVyjD6iJCrxlzKC3X8/cCSx5E
 f3zQ==
X-Gm-Message-State: AOAM530SA51MJfver47Xdm4KFjjp/LpAbRPu+0Z+Eps/Vv2ijslI/k1N
 TyzmYVX0vi9qMSwfjcTzHRYpr6TU4PI=
X-Google-Smtp-Source: ABdhPJwHwiqO/nraKXwAemz1ohic04gvLt3SutX1Rpz1uBVVAkP94u6VKv3IkMvM9gfOkD2s82qd6A==
X-Received: by 2002:a05:600c:3b0b:: with SMTP id
 m11mr19780256wms.162.1625565707350; 
 Tue, 06 Jul 2021 03:01:47 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.46 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/40] coverity-scan: switch to vpath build
Date: Tue,  6 Jul 2021 12:01:08 +0200
Message-Id: <20210706100141.303960-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the patch that has been running on the coverity cronjob
for a few weeks now.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/run-coverity-scan | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/coverity-scan/run-coverity-scan b/scripts/coverity-scan/run-coverity-scan
index 6eefb4b558..7395bbfad4 100755
--- a/scripts/coverity-scan/run-coverity-scan
+++ b/scripts/coverity-scan/run-coverity-scan
@@ -380,15 +380,17 @@ export PATH="$TOOLBIN:$PATH"
 
 cd "$SRCDIR"
 
-echo "Doing make distclean..."
-make distclean
+echo "Nuking build directory..."
+rm -rf +build
+mkdir +build
+cd +build
 
 echo "Configuring..."
 # We configure with a fixed set of enables here to ensure that we don't
 # accidentally reduce the scope of the analysis by doing the build on
 # the system that's missing a dependency that we need to build part of
 # the codebase.
-./configure --disable-modules --enable-sdl --enable-gtk \
+../configure --disable-modules --enable-sdl --enable-gtk \
     --enable-opengl --enable-vte --enable-gnutls \
     --enable-nettle --enable-curses --enable-curl \
     --audio-drv-list=oss,alsa,sdl,pa --enable-virtfs \
-- 
2.31.1



