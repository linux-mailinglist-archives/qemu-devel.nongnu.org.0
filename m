Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2A953E552
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:12:07 +0200 (CEST)
Received: from localhost ([::1]:38514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEOk-0001c5-Iw
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrW-0002il-1O
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrU-0000fq-H4
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=REGlmdVS1lYdUH1ngn7i4jdmEYP4WYH5gSTgDPDmR4w=;
 b=hjmF3M92HVSRndGVv67cAQlQVIPHpi+pc4sKU1zTW+bWxkgHLIq1m2b3P8rhAIW9Y2ykVN
 5FE/b1/hXwphNGjPba0w47jhm7s+ZpMWAS+kJVX4Rg2spAk8y98UNVB+inUttIzUJ/Fm18
 DWzqB8WawNPYclJDRa+EQkEGLlIeMoo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-LbYUEg3GOfS4ux-6Y8SgJg-1; Mon, 06 Jun 2022 10:37:42 -0400
X-MC-Unique: LbYUEg3GOfS4ux-6Y8SgJg-1
Received: by mail-wm1-f72.google.com with SMTP id
 az7-20020a05600c600700b0039c3ed7fa89so5529366wmb.8
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=REGlmdVS1lYdUH1ngn7i4jdmEYP4WYH5gSTgDPDmR4w=;
 b=afTRYibquXJ4mnWeSDECuhcbooYmNCkPj5PTZkdVc6aoGAQeI64+yYv9VbLrvf/A1d
 uyXdgtsILGSvkvg3VhTu+RT7kFDqU3ySalWmBGwMtlg3+mpYXZp6YlflDBD/WFB9IrwJ
 Q+38GLWkvplM6w5JU8lb6a3ntABIZdMLxGuf2GihbaKqBZQPxB+kvV042gWtDugwKJUP
 cHpJMdwrag+GfiXLiVjbjkzoSehr54HdpeH5z9owG4eFQ5X14B7hUDitFpW/Basu6mAq
 /7puW/r1Zpqu2HNAkQG5gdDvqwe5w3KV2i30aSyAV635E3nKcHx0L9plF1JfnC7aOF9o
 mdgA==
X-Gm-Message-State: AOAM530xqI7VSp/0svFRyNFEh1qjbhJ4quFCeZkn/3RPsFGIlXYyhTd+
 6yglp+ceFu6Lg0yHTlj28oVLZF8Ck8py+57sdoIVDZiXWZ9SeVy3h9VrarXh1YcX706FcVwvAic
 bfnS6tGrP/qKVeQI0hAEttAUZgkXHz3oJIW9f3UkRdGKOTH5+9w40rlQvXuEkgIRkFdA=
X-Received: by 2002:adf:fb0c:0:b0:215:6216:6ed2 with SMTP id
 c12-20020adffb0c000000b0021562166ed2mr15175682wrr.450.1654526261108; 
 Mon, 06 Jun 2022 07:37:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAWEixaPtJHV0Kg7d8kP08xZSm/UJxEAtR2tsijKje1PWeF3MmhVSVfNsDoLoEtlpKQ8whpQ==
X-Received: by 2002:adf:fb0c:0:b0:215:6216:6ed2 with SMTP id
 c12-20020adffb0c000000b0021562166ed2mr15175651wrr.450.1654526260750; 
 Mon, 06 Jun 2022 07:37:40 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a05600c41d600b00397550b387bsm20841082wmh.23.2022.06.06.07.37.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/29] meson: qga: do not use deprecated meson.build_root()
Date: Mon,  6 Jun 2022 16:36:44 +0200
Message-Id: <20220606143644.1151112-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

The function will return the build root of the parent project if called from a
subproject; that is irrelevant for QEMU's usage but rarely desirable, and
therefore the function was deprecated and replaced by two functions
project_build_root() and global_build_root().  Replace it with the former.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/meson.build b/qga/meson.build
index 619ff095bc..65c1e93846 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -125,7 +125,7 @@ if targetos == 'windows'
                               wixl, '-o', '@OUTPUT0@', '@INPUT0@',
                               qemu_ga_msi_arch[cpu],
                               qemu_ga_msi_vss,
-                              '-D', 'BUILD_DIR=' + meson.build_root(),
+                              '-D', 'BUILD_DIR=' + meson.project_build_root(),
                               '-D', 'BIN_DIR=' + glib.get_variable('bindir'),
                               '-D', 'QEMU_GA_VERSION=' + config_host['QEMU_GA_VERSION'],
                               '-D', 'QEMU_GA_MANUFACTURER=' + config_host['QEMU_GA_MANUFACTURER'],
-- 
2.36.1


