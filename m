Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B0A6481A9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:28:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bW1-0003yN-Jv; Fri, 09 Dec 2022 06:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUY-0003wm-Gw
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUV-0000xZ-Vp
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oOQAWMPSQz988D3IvpBBn7kMOWDVijqq8387gXlMuac=;
 b=A78Nllz0LA5BT0lVddargIMok6nuj73DXHIZBhEvrLz08IgYc6kr8vzq1SboDvBWCAV6Yg
 oXtE78DUYM/LuvFy0g7C/owRFT/EUB2bgI6WTubTDqOPPzfDJdS7tg8FcenIVXJLO9jxcc
 qZW/dCE3KpsZS8AOzpIDKxs9gxQ27Ec=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-296-TZdBhQEZMNifo3vva9n7lg-1; Fri, 09 Dec 2022 06:24:26 -0500
X-MC-Unique: TZdBhQEZMNifo3vva9n7lg-1
Received: by mail-ej1-f71.google.com with SMTP id
 hr21-20020a1709073f9500b007b29ccd1228so2923668ejc.16
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oOQAWMPSQz988D3IvpBBn7kMOWDVijqq8387gXlMuac=;
 b=JaRXXYamEKs9q7Y5ndaY7z473gfEdmEwTcD5mDyEByKS19SjM7PfLJj31Cz/wOSREy
 dgnZiFAXAdQWlaEb6Q4JqPPlVZPnEYlWyUkaL0lchxTH2fMKti8TR5F+0MQf/7xXWp4M
 FCJAsPMqMdzb3gq98Y03IhKfS9wA2Wq7f+Yv8294aBuRV45kIZPnixanvKd3IG3sH0GC
 VHrtgFYTZcLxo54djfE4/TYhhG+RIu61UrqyKBVNIfDXoKaKFW0OkMBYc7O+OViWwdg4
 66K1vjmHB9xtroJiSerIJf+g9qZ7oCo7kH8XmVA9OzhglMmEZNWR33hFodQ1OfIrlLUX
 YrtQ==
X-Gm-Message-State: ANoB5pnnY1NPDn3Dcdejq6r/PD7TctJjEvAlFk0PvX7P78+vzlUSCLo+
 NnNyHwFBUVXBb6tr79dRGQqipJiRfJyG0gbRahrDLGCOWhmPak/T3pb8ZkS9dq+jIhZdqTP1TmZ
 7CWjJDwWY1iqcTAEjFSikTnUxSt1W5U1uwAHUGXA6xgtcOti1B1EchRdvZP+gBO8sSuo=
X-Received: by 2002:a17:907:cb83:b0:78d:f455:30fa with SMTP id
 un3-20020a170907cb8300b0078df45530famr5645422ejc.34.1670585065341; 
 Fri, 09 Dec 2022 03:24:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf71BOS4H6KKTeCNM9XESgn+vcxCTg1lTnQcpIrE4Ji49g/aqVyVCIPvd3RdePnGhGMK0iBM+A==
X-Received: by 2002:a17:907:cb83:b0:78d:f455:30fa with SMTP id
 un3-20020a170907cb8300b0078df45530famr5645398ejc.34.1670585065045; 
 Fri, 09 Dec 2022 03:24:25 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a056402070e00b00463a83ce063sm498413edx.96.2022.12.09.03.24.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:24:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/30] configure: remove backwards-compatibility and obsolete
 options
Date: Fri,  9 Dec 2022 12:23:44 +0100
Message-Id: <20221209112409.184703-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/configure b/configure
index 4d14ff9c319c..adfff30a6204 100755
--- a/configure
+++ b/configure
@@ -838,17 +838,6 @@ for opt do
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
@@ -868,19 +857,10 @@ for opt do
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


