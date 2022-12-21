Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30B16535CD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:04:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Q8-0000mt-N3; Wed, 21 Dec 2022 13:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Q4-0000j5-Ah
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Q2-0004Jq-Q7
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wyr5JrWTZ0YvqwA7HlA5lc+mTPvzQE5kv1C6a+Lq9oQ=;
 b=EtvSvOFMadOFWaOx90JXjdf2b8t6m/J2MBEE28Ii5W51CtIJDhFFmyq2dNs/8Wnsp+/4pB
 xjsnyPc6foCrjvU5liFww8uQwZ9kSpVYU9iTpKEbvjVsVHpyMQWz7md0pF2RV5Scn/BUA1
 /rBjqR0dgC0D/xeYjMZlFalMJSdvjDA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-527-ebCXXKUzPoufI4ATuijf9g-1; Wed, 21 Dec 2022 13:02:16 -0500
X-MC-Unique: ebCXXKUzPoufI4ATuijf9g-1
Received: by mail-ej1-f72.google.com with SMTP id
 xh12-20020a170906da8c00b007413144e87fso11079319ejb.14
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wyr5JrWTZ0YvqwA7HlA5lc+mTPvzQE5kv1C6a+Lq9oQ=;
 b=zOpm6m8RVH7fdCyLKndp5peRbA+lBhiV5A5L3Qunrgv/LZGwIdrBzRGd3+cMQvi6P7
 +yk2SrfEr0tRNXTJ2D0RfIJ76CoY8LKMoE5s8IQaaobSViDRKvCW2mxa0vGQ8MvKLRv+
 7SdoyzPnXkDKa0sGsmnEMlmiObw3r45KU6LnFf/bYumSL5Cjio4gMtl6i21TFnsEQewE
 mu2USWi6f7cYzaAyL4G8+cVrCc207h865GEauz+V3idOrR0nu8pWB7p1OO7eDS2dvzmz
 ijK3udF3JG7ru0AZvrYiC1jxMJMoJVU3qChx3MpJbsFvKpRBSW6k06JMihohp/CRnuI7
 Ov2A==
X-Gm-Message-State: AFqh2kq47vt7ERHfCTjhtx6BKHuKw/LTI7em9T0GDNSvcCSGBqMsuyI/
 fu9QUWEk8HMBI/0Oq/XqrtgUTC+bcEV6NFQFj/Us384fCNWlOpwwSYGeBBaPCkAzhtz5m+clV+g
 E3hYCxCPbuu8A96oCVLVoEzPJ3Nlderx27IkhtZVnhZ3X/VUERLOR3qMITb0odiXjd/c=
X-Received: by 2002:aa7:d3d9:0:b0:46b:1715:e64 with SMTP id
 o25-20020aa7d3d9000000b0046b17150e64mr5291152edr.18.1671645734683; 
 Wed, 21 Dec 2022 10:02:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvBzyFozc6ShaeNNmUzpTLsRjJxh2VpcKI4UX5QRDCGlzHk+C9G1Aw5fyhzp3Khq0ZdGTe5rA==
X-Received: by 2002:aa7:d3d9:0:b0:46b:1715:e64 with SMTP id
 o25-20020aa7d3d9000000b0046b17150e64mr5291136edr.18.1671645734447; 
 Wed, 21 Dec 2022 10:02:14 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 cf25-20020a0564020b9900b0045b4b67156fsm7349998edb.45.2022.12.21.10.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 11/24] configure: remove backwards-compatibility and obsolete
 options
Date: Wed, 21 Dec 2022 19:01:28 +0100
Message-Id: <20221221180141.839616-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/configure b/configure
index 4958ac99bcef..0667dde1654c 100755
--- a/configure
+++ b/configure
@@ -843,17 +843,6 @@ for opt do
   ;;
   --with-coroutine=*) coroutine="$optarg"
   ;;
-  --disable-zlib-test)
-  ;;
-  --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
-      echo "$0: $opt is obsolete, virtio-blk data-plane is always on" >&2
-  ;;
-  --enable-vhdx|--disable-vhdx)
-      echo "$0: $opt is obsolete, VHDX driver is always built" >&2
-  ;;
-  --enable-uuid|--disable-uuid)
-      echo "$0: $opt is obsolete, UUID support is always built" >&2
-  ;;
   --with-git=*) git="$optarg"
   ;;
   --with-git-submodules=*)
@@ -873,19 +862,10 @@ for opt do
   ;;
   --gdb=*) gdb_bin="$optarg"
   ;;
-  # backwards compatibility options
-  --enable-trace-backend=*) meson_option_parse "--enable-trace-backends=$optarg" "$optarg"
-  ;;
-  --disable-blobs) meson_option_parse --disable-install-blobs ""
-  ;;
   --enable-vfio-user-server) vfio_user_server="enabled"
   ;;
   --disable-vfio-user-server) vfio_user_server="disabled"
   ;;
-  --enable-tcmalloc) meson_option_parse --enable-malloc=tcmalloc tcmalloc
-  ;;
-  --enable-jemalloc) meson_option_parse --enable-malloc=jemalloc jemalloc
-  ;;
   # everything else has the same name in configure and meson
   --*) meson_option_parse "$opt" "$optarg"
   ;;
-- 
2.38.1


