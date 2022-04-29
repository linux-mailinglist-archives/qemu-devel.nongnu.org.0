Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C8C51506A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 18:08:01 +0200 (CEST)
Received: from localhost ([::1]:45570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkT9z-0003Xk-Un
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 12:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSx-0002MD-B0
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:31 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSv-0006AS-LD
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:30 -0400
Received: by mail-ed1-x52b.google.com with SMTP id g20so9456143edw.6
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yyMUsE17gssDDV3IZZB5UBisTN7P3ts18R3UmNR6bDU=;
 b=j2UaWtQtN/z531qX71c4PB6FOs0llO0AAN7WORUvx2mMXeheHmojwvtUJFFwDOoVDY
 +/w/vAvrpVqNBk+BXawoexgNxJj8S/0jwm6wjQguvJnBcTWfXZj8mQc/kYdqBThKm89Z
 WtMdahHXyTKVFhDTEZpoh6t8okG1SxrdedfKnc29Kf2+NcrFLBCwWGQ2PwXL9807uwtp
 hi08Waf38+tXGjQ0ZMQYUEYbAObAys4e133Z0uHnJSa+hMK/2T0npkbrnETJjCgtQ8C2
 Hg7CFp4QGGASwxsSiJXU1NTukhzuTEQqaSd1KvQn5h8jEraxQDFEP777dsLTwJVMCSvc
 +q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yyMUsE17gssDDV3IZZB5UBisTN7P3ts18R3UmNR6bDU=;
 b=HEw+L0KWk/hYewELtxGk1RSLdnxMvVVGNT+jYbm+Czkulhtdl70Eauc7ppew27Iy4W
 jo4uTd9d9cCDin0JquneK7YFvw59bltQao83CrL6OG7s6S9ij5vQhwsVQu2hXG4Yd5jO
 xrXOEDLJYhXMEPepX0jJg3tI7+XqT5TlUrlhGGP4CZ7ry3Nm9GuA0oXsHe8nXzEr7Srt
 QolhGqkRrO0zAfETDOUIPH566kH7Px51Py65/ZZ6PVIzLkVcwYmRdwtaQffbB2NipDof
 cfJxNwpENWNiEf0fZkqZEoxPvDTEdidWKiucEPTOWI7HDscZqEmmRtzoZybqEDlO2z/M
 jIYw==
X-Gm-Message-State: AOAM531U185/xdmOv/6/A/BYgkxALcmRraEatgd+T7hxrk2yCzKXTVi7
 t9fJmLtaAxwlZ8CMwjXTyZleOzEt7z/KDQ==
X-Google-Smtp-Source: ABdhPJxMr9WAnMAyG6ZXUNZiYctzyrUXKrwuEOG5uk0DVvKosfuxSiUy2EpWRf0mMdbCFSi2j+2/ew==
X-Received: by 2002:a50:bae7:0:b0:425:c0fa:e0a7 with SMTP id
 x94-20020a50bae7000000b00425c0fae0a7mr39621444ede.104.1651245808369; 
 Fri, 29 Apr 2022 08:23:28 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/25] configure: simplify vhost-net-{user, vdpa} configuration
Date: Fri, 29 Apr 2022 17:23:05 +0200
Message-Id: <20220429152312.335715-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
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

Cleanup to ease review of the conversion to meson.  vhost_net_user and
vhost_net_vdpa are never assigned anything in the command line parsing
loop, so they are always equal to $vhost_user and $vhost_vdpa.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/configure b/configure
index 1c88e697c5..d6ddd4f05f 100755
--- a/configure
+++ b/configure
@@ -1555,10 +1555,6 @@ if test "$vhost_vsock" = "yes" && test "$vhost_kernel" != "yes"; then
 fi
 
 # vhost-user backends
-test "$vhost_net_user" = "" && vhost_net_user=$vhost_user
-if test "$vhost_net_user" = "yes" && test "$vhost_user" = "no"; then
-  error_exit "--enable-vhost-net-user requires --enable-vhost-user"
-fi
 test "$vhost_crypto" = "" && vhost_crypto=$vhost_user
 if test "$vhost_crypto" = "yes" && test "$vhost_user" = "no"; then
   error_exit "--enable-vhost-crypto requires --enable-vhost-user"
@@ -1567,16 +1563,11 @@ test "$vhost_user_fs" = "" && vhost_user_fs=$vhost_user
 if test "$vhost_user_fs" = "yes" && test "$vhost_user" = "no"; then
   error_exit "--enable-vhost-user-fs requires --enable-vhost-user"
 fi
-#vhost-vdpa backends
-test "$vhost_net_vdpa" = "" && vhost_net_vdpa=$vhost_vdpa
-if test "$vhost_net_vdpa" = "yes" && test "$vhost_vdpa" = "no"; then
-  error_exit "--enable-vhost-net-vdpa requires --enable-vhost-vdpa"
-fi
 
 # OR the vhost-kernel, vhost-vdpa and vhost-user values for simplicity
 if test "$vhost_net" = ""; then
-  test "$vhost_net_user" = "yes" && vhost_net=yes
-  test "$vhost_net_vdpa" = "yes" && vhost_net=yes
+  test "$vhost_user" = "yes" && vhost_net=yes
+  test "$vhost_vdpa" = "yes" && vhost_net=yes
   test "$vhost_kernel" = "yes" && vhost_net=yes
 fi
 
@@ -2105,10 +2096,10 @@ fi
 if test "$vhost_net" = "yes" ; then
   echo "CONFIG_VHOST_NET=y" >> $config_host_mak
 fi
-if test "$vhost_net_user" = "yes" ; then
+if test "$vhost_user" = "yes" ; then
   echo "CONFIG_VHOST_NET_USER=y" >> $config_host_mak
 fi
-if test "$vhost_net_vdpa" = "yes" ; then
+if test "$vhost_vdpa" = "yes" ; then
   echo "CONFIG_VHOST_NET_VDPA=y" >> $config_host_mak
 fi
 if test "$vhost_crypto" = "yes" ; then
-- 
2.35.1



