Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB16A54DD1B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:43:24 +0200 (CEST)
Received: from localhost ([::1]:38902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1l63-000583-Qy
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvq-0001qW-1x
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvn-0002tv-Us
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fBsuJkBaK49xYkBSfED4nMxGZwjPP4fEEospD3RWZ9s=;
 b=iC6Tn01XolT/S8MsQ0FfEA+LYLYm1zn6bxmNd3nzJfkjYqwPJGkZl2Tbcz8X39GXEj4evD
 aotAFVbZx2st2f/9fyds/odLNvzWeqIr78M8HdM1gQ7xWrDdMHBqgg8mbWOrrZ119DytMG
 tletaiXxbDnwMtE8uMiq+O6CkcD1rMw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-byVIDIcsPOucvfhN85Pj5Q-1; Thu, 16 Jun 2022 04:32:45 -0400
X-MC-Unique: byVIDIcsPOucvfhN85Pj5Q-1
Received: by mail-ej1-f72.google.com with SMTP id
 l2-20020a170906078200b006fed42bfeacso309763ejc.16
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fBsuJkBaK49xYkBSfED4nMxGZwjPP4fEEospD3RWZ9s=;
 b=cVRsOH4KBxfYgoZt49OWmpCgY2nmY1Xp+zQqDGDX+vv50V0ChfG9e5MEuM/Qhz9MCM
 o8ACQ6GtGzKqyABT1NPmXDzOdrXdlBxYVwsFZ9WHaU22TaUfXl3yf/Mi5YCF4V2Lmjo6
 7Rf8HRipybkzo9Erxu88jb0jGSRsP36J7bWblcQ0VYKtMa3UsQFRbtvx2jVVwJyTbe80
 VrXEG5LKV+y29LKtNC2tMhgRA94t3WpVAL5vsce/t3wRtOXAdEGhqa2OYeaa35YmHe3T
 TyMUiw0IUaSlPY2pAbo5ey1f0FxxPkGTEv6zyW+I5sbBez620bQHSf/7d/31O3A9/crh
 EmRw==
X-Gm-Message-State: AJIora8rEvHxISmQAi7LVtNHyQ+qHrp5m0FJ+QrSBNyc1Hk0DOtStdz6
 5J1uEBzsPiXCrDwttN3Zh3R82Dp/kCccT5QXjOfBkjGDaSdCGHVepnnNudex2oSV2NF+3KdsSBS
 bB59i89gvZXLs7rxQFNh9qrmARYgKESvj8u9IjlwKz4rzme1LnInahUFMh8s8OzLLaXg=
X-Received: by 2002:a17:907:8a13:b0:707:194c:30df with SMTP id
 sc19-20020a1709078a1300b00707194c30dfmr3498007ejc.154.1655368364509; 
 Thu, 16 Jun 2022 01:32:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uipCy8p0xfLhig9U9WWEasEK4+HTgyz83btBdzalHYCMS4RvJ0FelFis+JSrJkEvDGTEhoUQ==
X-Received: by 2002:a17:907:8a13:b0:707:194c:30df with SMTP id
 sc19-20020a1709078a1300b00707194c30dfmr3497996ejc.154.1655368364296; 
 Thu, 16 Jun 2022 01:32:44 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 o16-20020a50fd90000000b0042617ba63basm1251028edt.68.2022.06.16.01.32.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/21] configure: update list of preserved environment variables
Date: Thu, 16 Jun 2022 10:32:03 +0200
Message-Id: <20220616083209.117397-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616083209.117397-1-pbonzini@redhat.com>
References: <20220616083209.117397-1-pbonzini@redhat.com>
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
index 4b12a8094c..d41c7eddff 100755
--- a/configure
+++ b/configure
@@ -2722,13 +2722,12 @@ preserve_env CC
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



