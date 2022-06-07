Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E97753FD2F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 13:16:58 +0200 (CEST)
Received: from localhost ([::1]:53388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyXCc-0005f0-Lw
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 07:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyWm0-0004fK-Oo
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:49:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyWlx-0002Ad-U9
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654598955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fa48vhW3f9fkS5cyywlrDJU2Iw3lwRLu3wX/8f2EsVk=;
 b=DtkKuEW1S6yC+0ajcx2fZjnWnC4lKKxkHJGYcgt5+rhb4fN4XaPQoeIOwhJ3VZTb3JSLCf
 QRBHDy9RR4Q4quYPN0DGuoOPEvDn5/JRNFbHKNKc/53wzoiMmuo0IDNSvuKqXeRjT+2b6Q
 2wtlcDoc63YHT7cz188b3I8zmhh4dzs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-tf12LqpQOSKyZE7xtRA9tw-1; Tue, 07 Jun 2022 06:49:14 -0400
X-MC-Unique: tf12LqpQOSKyZE7xtRA9tw-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg7-20020a05600c3c8700b0039468585269so5638620wmb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 03:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fa48vhW3f9fkS5cyywlrDJU2Iw3lwRLu3wX/8f2EsVk=;
 b=PT9g+fh3uvx+xVb4CO6EL5xABXBgWxj15gdgBE7IQP7WtX8XANvg7G05zvy3QZllv/
 TUKAxxrH/kpP67bnyufYV0C6hOkMi7BnlxktWylHUdNYcDWQiYaW3FBycZDXP68lisjW
 dAkwNAzA8gwLuaQ69LxBHG9W0N1tjHMMeb3gALpMFzdEVI29s6KYq2XKna2+UI83IMPk
 Zb5F1hf0faNv/pwIgmGd8Yc2xPs0QSZ0qp0P0Nwxgm4r9Ar3IBQtmmRledc1hlf+4cp+
 zZRDnCztaGovShs9fx1Wa2tr4dGE4BXc03vBjmg2HBqnXIgo5WqdPX3FrX2+vj3zxKCL
 5XmQ==
X-Gm-Message-State: AOAM531gAnKgCP9kGRQHB/BhRMvWOOpCDlSGxOURF+fVClPy3xLdnOsj
 UakNhps1zETLxAkZyPgt68cYmV7ArkMhRzdWSCOupItP72SRTr6nindYHE+DWweyhIvq//Zp/Gx
 EeQ0m8Uvx7kB3/AyT7H6rYIBkl1CHkR0hkm4w5tZxB9WUBckh9ViiXXuSSytijlrBWec=
X-Received: by 2002:adf:ebce:0:b0:20d:7859:494d with SMTP id
 v14-20020adfebce000000b0020d7859494dmr26784511wrn.590.1654598952598; 
 Tue, 07 Jun 2022 03:49:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpeHpqiVIKgIc7BlBS+a6z0TfEfPONcWhHrAZqwSUZ5DiSukk+mPe/flK3TxZgNkPUMceAPQ==
X-Received: by 2002:adf:ebce:0:b0:20d:7859:494d with SMTP id
 v14-20020adfebce000000b0020d7859494dmr26784467wrn.590.1654598952092; 
 Tue, 07 Jun 2022 03:49:12 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a5d460a000000b0021552eebde6sm11494829wrq.32.2022.06.07.03.49.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 03:49:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: update list of preserved environment variables
Date: Tue,  7 Jun 2022 12:49:07 +0200
Message-Id: <20220607104908.1263321-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
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

INSTALL and LIBTOOL are not used anymore, but OBJCFLAGS is new and
was not listed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configure b/configure
index f35847c3cd..ce81419629 100755
--- a/configure
+++ b/configure
@@ -2737,13 +2737,12 @@ preserve_env CC
 preserve_env CFLAGS
 preserve_env CXX
 preserve_env CXXFLAGS
-preserve_env INSTALL
 preserve_env LD
 preserve_env LDFLAGS
 preserve_env LD_LIBRARY_PATH
-preserve_env LIBTOOL
 preserve_env MAKE
 preserve_env NM
+preserve_env OBJCFLAGS
 preserve_env OBJCOPY
 preserve_env PATH
 preserve_env PKG_CONFIG
-- 
2.36.1


