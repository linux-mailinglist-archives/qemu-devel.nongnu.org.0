Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA6E2B39F2
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 23:41:49 +0100 (CET)
Received: from localhost ([::1]:56982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keQiS-0004UZ-AT
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 17:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQX7-00040z-Lz
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:30:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQX5-0001ir-LR
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:30:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605479402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WW3ubRoSnF3KNEtPsddWc59JkzXMJ/9aeihwbTBzIG0=;
 b=YTOd1bAyGTdZWAUfOHL0k/Pp5674lroDVUT1ghUbY4pNX9XRtnvCaUJFPJQITv5mt8Iyx2
 ciZjO+glvCseG5shLbmK4V8Seibe59mAcbHHmurXstpl+4bJ+L5JJqVwo5Zf4RdLutm1wn
 4W/Z/5CXyy3g0xS7t5PaBYpJgY0EXgk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-KeQr4k6fO_KLrKfwUIEF9w-1; Sun, 15 Nov 2020 17:27:23 -0500
X-MC-Unique: KeQr4k6fO_KLrKfwUIEF9w-1
Received: by mail-wm1-f72.google.com with SMTP id h9so7809289wmf.8
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 14:27:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WW3ubRoSnF3KNEtPsddWc59JkzXMJ/9aeihwbTBzIG0=;
 b=no5T8zRYAg4lyiK8WREnHOiVOvyTrbawvrxS521VuwVEsFGr9YhJEr7TWoJohkMerA
 aJxeNOFnSdRC24cX2l1qnb+UnJoU/PWqw8Kfb6q4wADb63l6byaLnU6/gVD5iOPhmjHJ
 I9MJOBZqX0gzUap4Opd7WxILrKARxD6O3EECanx8GOycduPQWhLdOVW/SePqayP76DKB
 Kyaqs17oCNSsub/lnUSRsodl/hl5AGDRyroE/t+m9B1w2AT3i5tzVzLRyD+Pn7mBhwNU
 rz0MJ7hbJkDP4ycKI9YLMR8Zw/E1qDWCtAxQM/J1cAauCjaMh1Se6cD7Oi5PDQCzWZ+/
 DDhw==
X-Gm-Message-State: AOAM531iXGEWRn+fduxLGgZ29mRghOKWqjUzpaMQh/dS0h018QjMpCdI
 uYhaUlOsN5ZTNi7PflKDBIQe3e1rvoyHq05mQ7JmTqiK7aTwnTlKqdcYYt6zmz6E6Cgkxm9R/FV
 QMmrSuBsJ/iRdLv58grO9MF9Uronr4yj0ZSRbptXlDNwF+gykm1l8b0Osc1YR
X-Received: by 2002:a1c:81d7:: with SMTP id
 c206mr12110861wmd.140.1605479241622; 
 Sun, 15 Nov 2020 14:27:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhGj6Yggd0xU77iG7riwuhQu/Z80rFsYm8ZlXFmw//AAVknzu6VpPTLWJUnQFulPEpLvzxKg==
X-Received: by 2002:a1c:81d7:: with SMTP id
 c206mr12110842wmd.140.1605479241393; 
 Sun, 15 Nov 2020 14:27:21 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id e3sm3367424wro.90.2020.11.15.14.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 14:27:20 -0800 (PST)
Date: Sun, 15 Nov 2020 17:27:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/17] configure: mark vhost-user Linux-only
Message-ID: <20201115220740.488850-5-mst@redhat.com>
References: <20201115220740.488850-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201115220740.488850-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 17:27:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

The vhost-user protocol uses the Linux eventfd feature and is typically
connected to Linux kvm.ko ioeventfd and irqfd file descriptors. The
protocol specification in docs/interop/vhost-user.rst does not describe
how platforms without eventfd support work.

The QEMU vhost-user devices compile on other POSIX host operating
systems because eventfd usage is abstracted in QEMU. The libvhost-user
programs in contrib/ do not compile but we failed to notice since they
are not built by default.

Make it clear that vhost-user is only supported on Linux for the time
being. If someone wishes to support it on other platforms then the
details can be added to vhost-user.rst and CI jobs can test the feature
to prevent bitrot.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201110171121.1265142-4-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index 516f28a088..3fbc2a0c68 100755
--- a/configure
+++ b/configure
@@ -328,7 +328,7 @@ vhost_net=""
 vhost_crypto=""
 vhost_scsi=""
 vhost_vsock=""
-vhost_user=""
+vhost_user="no"
 vhost_user_blk_server="auto"
 vhost_user_fs=""
 kvm="auto"
@@ -718,7 +718,6 @@ fi
 case $targetos in
 MINGW32*)
   mingw32="yes"
-  vhost_user="no"
   audio_possible_drivers="dsound sdl"
   if check_include dsound.h; then
     audio_drv_list="dsound"
@@ -797,6 +796,7 @@ Linux)
   audio_possible_drivers="oss alsa sdl pa"
   linux="yes"
   linux_user="yes"
+  vhost_user="yes"
 ;;
 esac
 
@@ -2341,9 +2341,8 @@ fi
 # vhost interdependencies and host support
 
 # vhost backends
-test "$vhost_user" = "" && vhost_user=yes
-if test "$vhost_user" = "yes" && test "$mingw32" = "yes"; then
-  error_exit "vhost-user isn't available on win32"
+if test "$vhost_user" = "yes" && test "$linux" != "yes"; then
+  error_exit "vhost-user is only available on Linux"
 fi
 test "$vhost_vdpa" = "" && vhost_vdpa=$linux
 if test "$vhost_vdpa" = "yes" && test "$linux" != "yes"; then
-- 
MST


