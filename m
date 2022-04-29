Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4F2515007
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:57:21 +0200 (CEST)
Received: from localhost ([::1]:57432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSzg-0000fY-KG
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkST7-0002QX-1h
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:42 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:37468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSy-0006B6-EQ
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:33 -0400
Received: by mail-ed1-x52d.google.com with SMTP id k27so9463493edk.4
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5dZfwdJ4KB4Qq58kgohQA1IWa42zobeM0mK5lcpU0t8=;
 b=PFHMEJx/kM6Jt2NWRUVRJ5PNgAilvlw7ImonAiswbjJu7QnwEeMF7Dqhyt2eGr6F56
 sEWFXej4oRCVhjEylucE95xb9Ax2MgdZABrWAtGiUxN44miCCkSOMR9YcpQdNPaywbzA
 rSTZvP6qFYfSqnTv+X4VFylnbod95Q/NfqoKsPkM0R8LOrTb5QW+ZD3SktHibKQvP1L4
 dCKN9k2JPn+EDFSOg98DYLCyrKv5Xu6mF8oVk+xJetY/HZgoiitVAsvCZRwtif6KwPkE
 wgC3IRQzcEr/q6wOntw1dS8+z0yVOSZSBh/WXshuvenrzC15tMRh1TcGt/wMgZrT52+y
 OB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5dZfwdJ4KB4Qq58kgohQA1IWa42zobeM0mK5lcpU0t8=;
 b=qvPeo8T0z56ibaVwXoeejLYlCvHuxHhmKg8WS41zDNoaq1ArYczX5JrHpMigRjR/80
 9OqeP7Vrxt/8AqC6JZ1dRZRDeH+jc9GvPUlqgaDS/N4XOb7TKA3zptI0QefbpFlscLN1
 2ocQslRXczS86l2ml2aqLP+dp+9+j/X6wvF0pAPGFYDpbGe5TlbYXSEj1DUqSjBeY6/t
 GDnMaSrmFC/JAEzPCNGERInBDXHYmGLD+iEO0S6PrKIxVxpBGyLFlKVxvKwK6VlLUUXn
 pPbp1+QxO5gdeIlJuy7fhPIOgczeP6j8TfC1a5IGnHqluXpQs0XRB1gJDqt3+ISV4u3q
 t7Xg==
X-Gm-Message-State: AOAM5304FVJj2af4Ge5qn892y4A71A2ZZiIlGPlPENVwk5UxVLPHLEs7
 YnB2kn1VVm3me0ibQRI+qOJMu9/VCZW9fA==
X-Google-Smtp-Source: ABdhPJw6YsCVAXtxQhSW4e7iodTqpR8eveb/g5HinNRIiQG/qpFjAJrSD5vxTra+cJsWAiJVFNKFRQ==
X-Received: by 2002:a05:6402:358d:b0:426:1804:93eb with SMTP id
 y13-20020a056402358d00b00426180493ebmr14296289edc.334.1651245811074; 
 Fri, 29 Apr 2022 08:23:31 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/25] build: move vhost-user-fs configuration to Kconfig
Date: Fri, 29 Apr 2022 17:23:08 +0200
Message-Id: <20220429152312.335715-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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

vhost-user-fs is a device and it should be possible to enable/disable
it with --without-default-devices, not --without-default-features.
Compute its default value in Kconfig to obtain the more intuitive
behavior.

In this case the configure options were undocumented, too.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 12 ------------
 hw/virtio/Kconfig |  5 +++++
 meson.build       |  1 -
 3 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/configure b/configure
index d268a9cf49..9a83d64c9d 100755
--- a/configure
+++ b/configure
@@ -286,7 +286,6 @@ vhost_kernel="$default_feature"
 vhost_net="$default_feature"
 vhost_crypto="$default_feature"
 vhost_user="no"
-vhost_user_fs="$default_feature"
 vhost_vdpa="$default_feature"
 debug_tcg="no"
 sanitizers="no"
@@ -873,10 +872,6 @@ for opt do
   ;;
   --enable-vhost-crypto) vhost_crypto="yes"
   ;;
-  --disable-vhost-user-fs) vhost_user_fs="no"
-  ;;
-  --enable-vhost-user-fs) vhost_user_fs="yes"
-  ;;
   --disable-zlib-test)
   ;;
   --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
@@ -1537,10 +1532,6 @@ test "$vhost_crypto" = "" && vhost_crypto=$vhost_user
 if test "$vhost_crypto" = "yes" && test "$vhost_user" = "no"; then
   error_exit "--enable-vhost-crypto requires --enable-vhost-user"
 fi
-test "$vhost_user_fs" = "" && vhost_user_fs=$vhost_user
-if test "$vhost_user_fs" = "yes" && test "$vhost_user" = "no"; then
-  error_exit "--enable-vhost-user-fs requires --enable-vhost-user"
-fi
 
 # OR the vhost-kernel, vhost-vdpa and vhost-user values for simplicity
 if test "$vhost_net" = ""; then
@@ -2089,9 +2080,6 @@ fi
 if test "$vhost_vdpa" = "yes" ; then
   echo "CONFIG_VHOST_VDPA=y" >> $config_host_mak
 fi
-if test "$vhost_user_fs" = "yes" ; then
-  echo "CONFIG_VHOST_USER_FS=y" >> $config_host_mak
-fi
 
 # XXX: suppress that
 if [ "$bsd" = "yes" ] ; then
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index b642ae1081..f8e235f814 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -78,3 +78,8 @@ config VHOST_USER_RNG
     bool
     default y
     depends on VIRTIO && VHOST_USER
+
+config VHOST_USER_FS
+    bool
+    default y
+    depends on VIRTIO && VHOST_USER
diff --git a/meson.build b/meson.build
index db585832a4..53654fc08e 100644
--- a/meson.build
+++ b/meson.build
@@ -3692,7 +3692,6 @@ summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
 summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
 summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
 summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
-summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
 summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
 summary_info += {'build guest agent': have_ga}
 summary(summary_info, bool_yn: true, section: 'Configurable features')
-- 
2.35.1



