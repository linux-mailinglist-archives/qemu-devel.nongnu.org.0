Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E1953E553
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:12:27 +0200 (CEST)
Received: from localhost ([::1]:38832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEP3-0001p0-GL
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrU-0002i8-Rq
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrQ-0000fI-VY
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IggI1/QSoMlPqgNfMZWIr+E2XBEF7Oe16zLTSBey4e4=;
 b=TfGtnEM11EDG1Uu1wIrTJIvoQIFwRQRXQ/5snUe2ivjMT4BPNF4mC1itCNOkb1E6jKhp5R
 LDFr6FcHC4s8P9P859BmSmdhVAF/ygUx5KxYoZOV/y/TDHac1LrOKQQLGjeHOW0wzo0jaV
 IAcVq+u+9l85oBk/UfJ9u4gQieDhiDc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-GpBd3rx3PkOMsMs9bH6Ggg-1; Mon, 06 Jun 2022 10:37:39 -0400
X-MC-Unique: GpBd3rx3PkOMsMs9bH6Ggg-1
Received: by mail-wr1-f70.google.com with SMTP id
 p8-20020a5d4588000000b0021033f1f79aso2883997wrq.5
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IggI1/QSoMlPqgNfMZWIr+E2XBEF7Oe16zLTSBey4e4=;
 b=N7J3nrSTyUETzM82PWz1KvjZX/oPviNp/OaBsE6fqEpT+SSc4gbC8rM1PuO1E2TL+/
 QPurH3CzrM8LlPh7tgmTa+tSCAbuVGr3s63DsKpinJpqnw+/T4i0pV8c+dnB330yT3Tl
 zDewBUj7lNM68pTdK4eQ7RarnU8qnWSBua/waAS5CshtVgXSezeZIEWyD5epBo//EONH
 EQzl7E8PO76fPlvYeZ2w2dN5PnuSAQ0RvlZ7K99/b5R8V3YOaIPA1ZWb+6XPCqb5s0eT
 WmTPc1cHGBXY5dJ/mtRZ4jcW92bYUXNTyfYP0+tMvYfdEMZoyykxjc5yGLtLVqa0biam
 FbDg==
X-Gm-Message-State: AOAM530JWk9Qp83+9Np8SN3OhxHqtQVbfjiwlB9vzQcAbumaHkQFTGOc
 2y3LqgHrHPivoi0oD04C11FryLNtDajVBtdxEyJPldNDOJAM3sDmZVkSMkSQojXoqeCc8m5gzqr
 k7X6BtupxWoNCpHyX9oZlNMmSIO5duSPG2JlW5LD+uxRfRjKsaR72ZBZ0sWtfcTr0wQU=
X-Received: by 2002:a05:600c:3d8d:b0:39c:5232:107a with SMTP id
 bi13-20020a05600c3d8d00b0039c5232107amr3887519wmb.191.1654526257650; 
 Mon, 06 Jun 2022 07:37:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz78bDXzp5uQ5drUA1gLJQYSOgQiSNhs9xKKZ6BLDT8i5XjDA2asd0pPoclA/I5X8SYFlCdPw==
X-Received: by 2002:a05:600c:3d8d:b0:39c:5232:107a with SMTP id
 bi13-20020a05600c3d8d00b0039c5232107amr3887486wmb.191.1654526257322; 
 Mon, 06 Jun 2022 07:37:37 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 h24-20020a05600c145800b0039c54bb28f2sm1633051wmi.36.2022.06.06.07.37.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/29] regenerate meson-buildoptions.sh
Date: Mon,  6 Jun 2022 16:36:42 +0200
Message-Id: <20220606143644.1151112-28-pbonzini@redhat.com>
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



