Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6812B5BBA
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 10:23:13 +0100 (CET)
Received: from localhost ([::1]:53730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexCj-00017a-0o
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 04:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kex8v-00029k-RK
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:19:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kex8t-0006RZ-PL
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605604754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WW3ubRoSnF3KNEtPsddWc59JkzXMJ/9aeihwbTBzIG0=;
 b=Ec2PTRA+oU+49EFgS7DvvT3E6krCwp9xHiLrCqV2Vi2HG6kGPbTIaArizUAzz3ZvpWLsRt
 WQ3Ysc5zXJo9sTT4Bfno3eKrhjhZwjBbIk1QLhkOpSW9xcY+iORshdQjyEvuiJ1YPPR8eN
 fyCjZ5feBAQfqRaCkUQAkb1tjQ6sOI4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-15r8EqsiPDW1NqNwTKCDnw-1; Tue, 17 Nov 2020 04:19:12 -0500
X-MC-Unique: 15r8EqsiPDW1NqNwTKCDnw-1
Received: by mail-wm1-f69.google.com with SMTP id v131so1434068wma.1
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 01:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WW3ubRoSnF3KNEtPsddWc59JkzXMJ/9aeihwbTBzIG0=;
 b=Fx+ZS/AJLCs2YihYJGmXmZMbP1ug3EAC+xhbDTIxyCjDZqj2LbZGmxUU13RvDCbqCh
 Vg37Ybx2Ivv57jYksVB359Afmf+gXt4yH/nfAnURKmEznpApfdjKI3O1VJjqYADBe/0/
 ddpqbmgXW4jqFA7+TlaMimzAiCgSXxMBKaJKGSKLd8lfBuos2M0O/LPshsZcc+evV8FJ
 Cz1k8+6FSyva8fwt4dxXCdcFqmiZbWSWH1JuBGsfLh+2JiNj1KsdhCineSgt36fkfLk/
 17+gN0h8o0ftkX4M8ntUD7ltICASvWybh4uWKO2z4eXWs4/QWmkXMwwc0bDKSRwVAIll
 cLQw==
X-Gm-Message-State: AOAM532Ouc0aLnNVt7Q4ZErh+YZee/uw+C2FodcdzKdxq8/L6hj+iBxp
 DEccUn+iN5wdTBUD8GMpz+z7YT2r3EiHlWUhCjm1+ciyV4Ik7jI7sD5Hga1JImVyv+DVjLN+apQ
 xBovFavRpCk7Fo/SlA0Ayhwa62wFEYQ1PxNYN+PQXrzqzbLpicjDdrGoK2NFs
X-Received: by 2002:a1c:4d0f:: with SMTP id o15mr3207015wmh.142.1605604750938; 
 Tue, 17 Nov 2020 01:19:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeKWvCl/BOiKzPc0J8k5/taWfXhJYt9ZOZ6fSZIYWywQ6rGfFQ0+fIkcPPD55d7Y6LS6CRJQ==
X-Received: by 2002:a1c:4d0f:: with SMTP id o15mr3206997wmh.142.1605604750705; 
 Tue, 17 Nov 2020 01:19:10 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id v19sm27673031wrf.40.2020.11.17.01.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 01:19:10 -0800 (PST)
Date: Tue, 17 Nov 2020 04:19:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 4/7] configure: mark vhost-user Linux-only
Message-ID: <20201117091848.695370-5-mst@redhat.com>
References: <20201117091848.695370-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201117091848.695370-1-mst@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


