Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CECF53E551
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:12:01 +0200 (CEST)
Received: from localhost ([::1]:38418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEOd-0001Y1-T4
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrU-0002i1-Qx
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrS-0000fR-KT
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGkxBUipSzfB6+E2sZAGdDLFTlTNb1Nue4FDrBmMfFQ=;
 b=ODJcnZ1tryuw7v8mBrEin42eHlPSlIpL8HUj5iamCUXZ0NbxwlzzvO2/phtMYAEARQGyTn
 uv/5aCFmSgrH2Lb0i/6VapAsfj0tC2QS6rIpXJcj7URiOrN+do3h3V++TJ8XqLmmh8zGlP
 em+qUwDHxt8DDQzpuGUhmXUpJhqzANA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-ofJzuCo-OUS-Vqqfn6mBUg-1; Mon, 06 Jun 2022 10:37:41 -0400
X-MC-Unique: ofJzuCo-OUS-Vqqfn6mBUg-1
Received: by mail-wr1-f69.google.com with SMTP id
 c16-20020a5d4cd0000000b00213b1d4a96cso2301202wrt.1
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qGkxBUipSzfB6+E2sZAGdDLFTlTNb1Nue4FDrBmMfFQ=;
 b=lt744QUDn20m8rWwGZDxXTD6OKltrroeovxoLqjLJdApEUwKe+EihAV/0uyD4KJfMM
 Ao60cw//O4IEUm7A9GWtBJC8trlK9ZC3aH8DTIFhlKpOW/vZ6FZ3i6Oe6d2MX/FS/4wX
 PvrJQ1fmBGRJOBsmh1TrJcc8lRveW9nfV5oHJtH/1J+Zd9awpjw6WBlHExsMN3Splwv7
 t4+epvUwGtYCvRTaFCxoRZ50PO7h4ZGjEqHwkgh1TBZkerclPWxBqy5VtBnt+SXxPpZX
 ucT4vy8YpwZgYDtxB8I/u5zl3C+8dRXdW23Nq1IjCQ7OdL1IszObnYQdZWla3V3ULJtk
 tdtQ==
X-Gm-Message-State: AOAM531EVm8+iIbSw+asmwUHYAc8QSFYsMMp2jkcsxrv0lPT4G0SA8JX
 MC13sb5E7uTeAI+kt1ET45uTgwcV4WdQ6xWK0Oiih6svVOHdaKRsj2MUrp3S8V9G8A02XdejpGA
 Sn0nYLDq9TypuLBbU8Xivl1V9d7VtRP+BBpG9dUuqJFy49c9t7WgK16QLr27C41WWCs0=
X-Received: by 2002:a7b:c3c2:0:b0:394:9229:3b40 with SMTP id
 t2-20020a7bc3c2000000b0039492293b40mr23719280wmj.195.1654526259577; 
 Mon, 06 Jun 2022 07:37:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpqeqvt1dlbmYZmlsjo1TQPyb7e/6xbiqogn0B1DXD3ObGGrItzbZBtU46aW01DjIBrm3+Rw==
X-Received: by 2002:a7b:c3c2:0:b0:394:9229:3b40 with SMTP id
 t2-20020a7bc3c2000000b0039492293b40mr23719253wmj.195.1654526259299; 
 Mon, 06 Jun 2022 07:37:39 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 i19-20020a1c5413000000b0039c457cea21sm7768036wmb.34.2022.06.06.07.37.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/29] configure: remove reference to removed option
Date: Mon,  6 Jun 2022 16:36:43 +0200
Message-Id: <20220606143644.1151112-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
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
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index b9ccff9067..ac18ed4f3a 100755
--- a/configure
+++ b/configure
@@ -1035,7 +1035,6 @@ Advanced options (experts only):
   --with-git-submodules=ignore   do not update or check git submodules (default if no .git dir)
   --static                 enable static build [$static]
   --bindir=PATH            install binaries in PATH
-  --efi-aarch64=PATH       PATH of efi file to use for aarch64 VMs.
   --with-suffix=SUFFIX     suffix for QEMU data inside datadir/libdir/sysconfdir/docdir [$qemu_suffix]
   --without-default-features default all --enable-* options to "disabled"
   --without-default-devices  do not include any device that is not needed to
-- 
2.36.1



