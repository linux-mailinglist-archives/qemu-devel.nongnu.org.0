Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECBB2ABE36
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 15:06:34 +0100 (CET)
Received: from localhost ([::1]:59590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc7oW-0007PK-06
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 09:06:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kc7lx-00069z-17
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 09:03:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kc7lt-0000OT-Rl
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 09:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604930627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iYTUbDCzmH8zTNHNM6gmjID7+hQXYmNIWu0/XgkLc6E=;
 b=HIC4oV2gjzowzqXyGyFiCOZJyzz66cq69JCImVIIPZXGrpEZRfpEr+9n1w6LzKdoPfkv5y
 V/26XzUzCjUtUlW1g07EY4rFNajcfZTFWeg4TO8WuzsJqLZ7bF+yCoAGYfAGcdRb+lxjWK
 +oapoXMSV5PH+zqazae07xt9/lqsRXY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-CCAe6A9uP1Ko7iuunB28Fw-1; Mon, 09 Nov 2020 09:03:45 -0500
X-MC-Unique: CCAe6A9uP1Ko7iuunB28Fw-1
Received: by mail-wr1-f72.google.com with SMTP id h8so4381800wrt.9
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 06:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iYTUbDCzmH8zTNHNM6gmjID7+hQXYmNIWu0/XgkLc6E=;
 b=jK267onVz/i0C4yqSG7+/Izd5SzUBhzbwLghrkAF2MZAhfdjC8al4uhWRUsYGLN4YQ
 ynd5zF9HTATuDSPxTYaDKJku5rxYIXGoP61+3SvQ6YHzTsXFch4wnMovcaFLYqibF1o9
 zr/0Hf8Wi1pScMkSbQU5xp6tn/DcWcsdlS7LjOURAWlwN25+Yh6vJsAhCEV90DJ+/W4M
 mDTLjRrH6k5ACN2pwazc8kXJLYXBV/YdSGAoCVldZWyg7NKEqRDtNrsQNZouP2pwY7L6
 TNC2ZFgReqCWuREENeSpcrmNT1SSYoYih8Jp07HvmWthHWP+vqcjPTXkk2f24PtfVthI
 o6mA==
X-Gm-Message-State: AOAM5309xKXchrCe1SJ8X/MT9eOMDMRu8zY7cuomzooqavx5C0eNZptt
 rGYmMlAA7VG/Wb4mSqJMlgdYtPWYjbaFoJLXDcrFAvVobH4YjvS9ohSsHELEl9JofjQOhJCQips
 m+oAS1taEIFplaks=
X-Received: by 2002:a5d:5105:: with SMTP id s5mr19074482wrt.255.1604930623886; 
 Mon, 09 Nov 2020 06:03:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzzRJtTdBoNna2aRkAN9ACA3GkffgzzHNklQOc6oQBayqhC85+hz325M/RZ8871spcXUFHuA==
X-Received: by 2002:a5d:5105:: with SMTP id s5mr19074450wrt.255.1604930623651; 
 Mon, 09 Nov 2020 06:03:43 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 89sm14553920wrp.58.2020.11.09.06.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 06:03:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 v2] configure: Check vhost-user is available for
 vhost-user-blk-server
Date: Mon,  9 Nov 2020 15:03:41 +0100
Message-Id: <20201109140341.2598016-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 00:04:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Check vhost-user is available when building vhost-user-blk-server.

This fixes:

 $ ../configure \
      --disable-vhost-user --enable-vhost-user-blk-server && \
   make qemu-nbd
 ...
 [505/505] Linking target qemu-nbd
 FAILED: qemu-nbd
 cc  -o qemu-nbd qemu-nbd.p/qemu-nbd.c.o -Wl,--as-needed -Wl,--no-undefined -pie -Wl,--whole-archive libblockdev.fa libblock.fa libcrypto.fa libauthz.fa libqom.fa libio.fa -Wl,--no-whole-archive -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -m64 -fstack-protector-strong -Wl,--start-group libqemuutil.a libblockdev.fa libblock.fa libcrypto.fa libauthz.fa libqom.fa libio.fa @block.syms -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -pthread -lgnutls -lutil -lm -lgthread-2.0 -lglib-2.0 -lbz2 -lgthread-2.0 -lglib-2.0 -lssh -lrbd -lrados -lcurl -lxml2 -lzstd -lacl -lgfapi -lglusterfs -lgfrpc -lgfxdr -luuid -laio /usr/lib64/libz.so -L/usr/lib64/iscsi -liscsi -lnettle -lgnutls -lpam -Wl,--end-group
 /usr/bin/ld: libblockdev.fa(block_export_vhost-user-blk-server.c.o): in function `vu_blk_process_vq':
 block/export/vhost-user-blk-server.c:203: undefined reference to `vu_get_queue'
 /usr/bin/ld: block/export/vhost-user-blk-server.c:208: undefined reference to `vu_queue_pop'
 /usr/bin/ld: libblockdev.fa(block_export_vhost-user-blk-server.c.o): in function `vu_blk_queue_set_started':
 block/export/vhost-user-blk-server.c:228: undefined reference to `vu_get_queue'
 /usr/bin/ld: libblockdev.fa(block_export_vhost-user-blk-server.c.o): in function `vu_blk_req_complete':
 block/export/vhost-user-blk-server.c:55: undefined reference to `vu_queue_push'
 /usr/bin/ld: block/export/vhost-user-blk-server.c:56: undefined reference to `vu_queue_notify'
 /usr/bin/ld: libblockdev.fa(block_export_vhost-user-blk-server.c.o): in function `vu_blk_queue_set_started':
 block/export/vhost-user-blk-server.c:229: undefined reference to `vu_set_queue_handler'
 /usr/bin/ld: libqemuutil.a(util_vhost-user-server.c.o): in function `vu_client_trip':
 util/vhost-user-server.c:176: undefined reference to `vu_dispatch'
 /usr/bin/ld: util/vhost-user-server.c:180: undefined reference to `vu_deinit'
 /usr/bin/ld: libqemuutil.a(util_vhost-user-server.c.o): in function `vu_accept':
 util/vhost-user-server.c:291: undefined reference to `vu_init'
 collect2: error: ld returned 1 exit status
 ninja: build stopped: subcommand failed.
 make: *** [Makefile:171: run-ninja] Error 1

Now we get:

 $ ../configure \
      --disable-vhost-user --enable-vhost-user-blk-server && \
 ERROR: --enable-vhost-user-blk-server requires --enable-vhost-user

Fixes: bc15e44cb21 ("configure: introduce --enable-vhost-user-blk-server")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Since v1:
- Addressed Thomas review comments
https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg02188.html

Supersedes: <20201106190409.10571-1-philmd@redhat.com>
---
 configure | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 805f7791503..39b65dcd070 100755
--- a/configure
+++ b/configure
@@ -2375,6 +2375,10 @@ test "$vhost_user_fs" = "" && vhost_user_fs=$vhost_user
 if test "$vhost_user_fs" = "yes" && test "$vhost_user" = "no"; then
   error_exit "--enable-vhost-user-fs requires --enable-vhost-user"
 fi
+test "$vhost_user_blk_server" = "" && vhost_user_blk_server=$vhost_user
+if test "$vhost_user_blk_server" = "yes" && test "$vhost_user" = "no"; then
+  error_exit "--enable-vhost-user-blk-server requires --enable-vhost-user"
+fi
 #vhost-vdpa backends
 test "$vhost_net_vdpa" = "" && vhost_net_vdpa=$vhost_vdpa
 if test "$vhost_net_vdpa" = "yes" && test "$vhost_vdpa" = "no"; then
@@ -2389,7 +2393,6 @@ if test "$vhost_net" = ""; then
 fi
 
 # libvhost-user is Linux-only
-test "$vhost_user_blk_server" = "" && vhost_user_blk_server=$linux
 if test "$vhost_user_blk_server" = "yes" && test "$linux" = "no"; then
   error_exit "--enable-vhost-user-blk-server is only available on Linux"
 fi
-- 
2.26.2


