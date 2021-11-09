Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B66244AFB7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 15:47:20 +0100 (CET)
Received: from localhost ([::1]:43614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkSP8-0000LF-NU
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 09:47:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mkSN8-0007gp-Bn
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:45:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mkSN3-00033x-T0
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636469108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BHrFyIedMgFkgcfjvsjFe56Wr+AISOkv82qmkiOkMDw=;
 b=c6B87qh5GoCwhbsyHbDxVGEOWKN4HeCcSYEZ1DLsYGmHcOTJ7Hag8RceIO5R2cbYZJYQ+a
 M+J5VjGmd7gvcoj004JaCvWITazTFaaemT2IFRZs7d1BgmfstlDYq5DY6nfIDvfJTIGyO8
 AAjUTAmIkQv43xrxVTatKcpvf+OhiMw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-syfHT_0rPtuEQ2oCNPEqMA-1; Tue, 09 Nov 2021 09:45:07 -0500
X-MC-Unique: syfHT_0rPtuEQ2oCNPEqMA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso1450633wme.5
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 06:45:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BHrFyIedMgFkgcfjvsjFe56Wr+AISOkv82qmkiOkMDw=;
 b=0PadIsqRpeg6M5G+aHt6y/VhuuufRQeFEc/wHv/0d/TMxMo0NSlf4+7YvskhyzKX7S
 T9p6gRx+77pTgq8sgKULw1ATdDvDWTF78A325ejnpjuZUOJLVGMLILv1hPcmqCIBGfsV
 7bBDbWG25WBbzPHLrgTAiPJPvFqwlBeRftnWbCd6EdKj77bIZwKUhb/Sr0Wn1Srp1pYH
 rJCBXh2pr6iOHP+MnhsabMO3eymMQLuH2Bg4lbifJxQ1yFcaKBxSsNMx+v7DZmrz398S
 K/38BJJxK3vssd5lsI47WNKRtNYvkFUXKYFdzMCknAdkPcZx0lTj+cWHzF8Tt8aUgx1y
 bPUw==
X-Gm-Message-State: AOAM5309MfhnM2RS0WvQGJixvlZCmtUzhIkPb+5SPxwDBLpvJbLXJlVM
 tfOj7SVzal/VEnjniQgekIBdfTLiQ4Z1Td1DT4lr1xkBz77VkM/lsNcrSKpdPmFu/kKR2APSiB+
 OVskyqfJmkamcEjPzKBqaDA5D37701q9pTbaI/BUWhtWj9XrUHZtSAwPr5VQ2JTw4
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr8045688wmp.52.1636469106011; 
 Tue, 09 Nov 2021 06:45:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3z+Py4DaF/vHdys0Rft53Cqitjp+8hC8jQNB8CqVEwweKbCiqKCPKUiDB4pmQ5o/zYfstOA==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr8045648wmp.52.1636469105760; 
 Tue, 09 Nov 2021 06:45:05 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 i15sm2726425wmb.20.2021.11.09.06.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 06:45:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Symlink binaries using .exe suffix with MinGW
Date: Tue,  9 Nov 2021 15:45:04 +0100
Message-Id: <20211109144504.1541206-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using the MinGW toolchain, we use the .exe suffix for the
executable name. We also need to use it for the symlinks in the
build directory.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 48c21775f3a..31e8f586dc7 100755
--- a/configure
+++ b/configure
@@ -3786,7 +3786,7 @@ fi
 
 for target in $target_list; do
     target_dir="$target"
-    target_name=$(echo $target | cut -d '-' -f 1)
+    target_name=$(echo $target | cut -d '-' -f 1)$EXESUF
     mkdir -p $target_dir
     case $target in
         *-user) symlink "../qemu-$target_name" "$target_dir/qemu-$target_name" ;;
-- 
2.31.1


