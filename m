Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0971853E425
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 12:58:11 +0200 (CEST)
Received: from localhost ([::1]:35746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyAR0-0007ke-2J
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 06:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyAGN-0007f3-3Y
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:47:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyAGJ-0001cT-Qt
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654512424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IggI1/QSoMlPqgNfMZWIr+E2XBEF7Oe16zLTSBey4e4=;
 b=cP7nHoREau0CWtdE7+UK+aqJCsAG9BsRncp4GMVWU4Zk3aktiImenmbzinqAdSaa9EIouc
 EOOU2Y6DeGfiWw9pfRXbbKSUOrmNbnlvEQ5h9ZWFNyESeeOQ9593U79F7o89gmJjsBzpJj
 CMCZjCmlX9gzIhNpF0p1DeGvLpJrQO0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-yhC3riS0MVyEGyfr4i6OQw-1; Mon, 06 Jun 2022 06:47:03 -0400
X-MC-Unique: yhC3riS0MVyEGyfr4i6OQw-1
Received: by mail-wm1-f72.google.com with SMTP id
 n15-20020a05600c4f8f00b0039c3e76d646so4184204wmq.7
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 03:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IggI1/QSoMlPqgNfMZWIr+E2XBEF7Oe16zLTSBey4e4=;
 b=uq4OqkEd1Rhmg9eb9d4f26dhHHlnfNl0mWwqSCwPpt3D3Vi4gLoho1laL8Xv4scQxE
 Xs9l8l8CGh2MKoyO83U0Wp1qxq/zXkTKIzVprU6t7gk+BDdjI3dlz5sK67FH91lqReVn
 v3M6LTEGvQCG6/37HnfNge7XjzEwaLMCEzSyrS3j9uhXJIjINHIX7aXVvK7QMoKsd9vM
 iQqLjyRvKAga9Tp2hG/6rnTNjJO7+uvfFLTsMJ9UGqzin0BTCyDuiKMyFsHcB7v3+0Qc
 U1l6IPEtOMnOkoRq1TFU6gC7Ofxo9EfkWtWOrxiifBdEy0LWdH9PrbTCLCDoDXcvRW+N
 CsMA==
X-Gm-Message-State: AOAM531cquSz1p+q5usvzHCpJSZ4RZoy7q9ZQQIC6Xd8aBxw7P/DBET4
 UPAy3sBXkciogIQT7ZFARsKrdap0yDNo+bGSilR6JgvNMZbJl4wcK9xx8iR9ZkRBM+7fawPJ+RR
 k43WJXSE+XUB8UlKVRwX19ECZhoEQzcDdGk/hKKf4TNKZ8DLmkrxeOAayVQuPqyGd9Xg=
X-Received: by 2002:adf:fc01:0:b0:20c:ff9a:2c53 with SMTP id
 i1-20020adffc01000000b0020cff9a2c53mr20539859wrr.142.1654512422064; 
 Mon, 06 Jun 2022 03:47:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzY/yktRI5tmyum6026B7mF7goQ8okJWi3FMxtxiCKhOFIpB30/oqLloOD8jT5It135CSnJtQ==
X-Received: by 2002:adf:fc01:0:b0:20c:ff9a:2c53 with SMTP id
 i1-20020adffc01000000b0020cff9a2c53mr20539827wrr.142.1654512421577; 
 Mon, 06 Jun 2022 03:47:01 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 l1-20020a1c2501000000b0039c4d022a44sm3861152wml.1.2022.06.06.03.47.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 03:47:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] regenerate meson-buildoptions.sh
Date: Mon,  6 Jun 2022 12:47:00 +0200
Message-Id: <20220606104700.1106971-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/meson-buildoptions.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 731e5ea1cf..00ea4d8cd1 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -156,13 +156,13 @@ meson_options_help() {
   printf "%s\n" '  vhost-kernel    vhost kernel backend support'
   printf "%s\n" '  vhost-net       vhost-net kernel acceleration support'
   printf "%s\n" '  vhost-user      vhost-user backend support'
-  printf "%s\n" '  vmnet           vmnet.framework network backend support'
   printf "%s\n" '  vhost-user-blk-server'
   printf "%s\n" '                  build vhost-user-blk server'
   printf "%s\n" '  vhost-vdpa      vhost-vdpa kernel backend support'
   printf "%s\n" '  virglrenderer   virgl rendering support'
   printf "%s\n" '  virtfs          virtio-9p support'
   printf "%s\n" '  virtiofsd       build virtiofs daemon (virtiofsd)'
+  printf "%s\n" '  vmnet           vmnet.framework network backend support'
   printf "%s\n" '  vnc             VNC server'
   printf "%s\n" '  vnc-jpeg        JPEG lossy compression for VNC server'
   printf "%s\n" '  vnc-sasl        SASL authentication for VNC server'
@@ -430,6 +430,8 @@ _meson_option_parse() {
     --disable-virtfs) printf "%s" -Dvirtfs=disabled ;;
     --enable-virtiofsd) printf "%s" -Dvirtiofsd=enabled ;;
     --disable-virtiofsd) printf "%s" -Dvirtiofsd=disabled ;;
+    --enable-vmnet) printf "%s" -Dvmnet=enabled ;;
+    --disable-vmnet) printf "%s" -Dvmnet=disabled ;;
     --enable-vnc) printf "%s" -Dvnc=enabled ;;
     --disable-vnc) printf "%s" -Dvnc=disabled ;;
     --enable-vnc-jpeg) printf "%s" -Dvnc_jpeg=enabled ;;
-- 
2.36.1


