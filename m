Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E50B333AB6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:52:56 +0100 (CET)
Received: from localhost ([::1]:54668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwSV-0007o0-IC
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lJwPP-0003ue-RI
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:49:43 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:33490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lJwPN-0003ki-LU
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:49:43 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so1445414wma.0
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2fdnCYcGz/rNz0f0M+8dUoADYZZ+wtTRYedFfAAe2jw=;
 b=jFwrzPwQhOC8f102XAFqiS+gkUbiwME3c/OtjNbBttpIvjClburZA47oeKXUZhX8/U
 jcNWrKwO9IbUNjDOugKXGmjTcgN8KBHP6bkDdIRkwUigwOTlFcf49OUktXb8w3y8j83z
 1J9Drw2+8UuiUtb+xFqrr3yqbKn1FemXJmzVHd5kWJI5qLraQot11a5bZUPbR7K3ydIf
 hSPs3jOGbF00BJOD2toEsQagQVblZDXlBKDBx9ncY6lAS/sS1rYflHFgKBqMEmfXGt+P
 NWEayZDEnUwFC/GxO1xu4XwHyaPtWJqLQSdIdcMI7/cos6714lpM20oPCinhOnfSnb0B
 VyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2fdnCYcGz/rNz0f0M+8dUoADYZZ+wtTRYedFfAAe2jw=;
 b=jGj4kzTYIn/vWfV2GbKZLwU355JIPwcj/6St65cG7ev7hOTTlKE4YHCVt0BiUNGOqt
 QHHOMVNltbgOnT+FzGdQnKz+eB+RxBbRNdAvmxWGdb9+sKd1WbjltB1W3HvJWrlTDAbz
 toN0nv16uKlXKZr01BMeqlta1EIP0EC385WrxSwizZpjEaXurtEDo8NPUUF6SW6w2fBa
 1NnB9QcGx4Ey8WkiVtkJ/OOmA0mIeWf15sAwoCIcUr1oWOB6D5QT25zlYGmu/Lx3mWpY
 PW3Md/oQefeQS7zk9a4M3c5COPpjT5oh1zoC6sSb+pDHGY89XgNYWFGqSpxDo4gsc2F/
 jSxg==
X-Gm-Message-State: AOAM530+2mYihG5wrtOltUSul4n9pnNA4IWG3G+rSxuMoQ4dlQN19eGn
 Sabtz/rLK17ni+py7o4XeMgLJ8CN43E=
X-Google-Smtp-Source: ABdhPJyPuBdeuNrMohXxzVpdrrDBu5+2U3AxXf191RnnvgKg9WvAtZA/Ncn1AA4xLPhx6LabHHN6GA==
X-Received: by 2002:a1c:600a:: with SMTP id u10mr2096250wmb.139.1615373380546; 
 Wed, 10 Mar 2021 02:49:40 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 s11sm9060808wme.22.2021.03.10.02.49.40 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 02:49:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] meson: bump submodule to 0.57.1
Date: Wed, 10 Mar 2021 11:49:35 +0100
Message-Id: <20210310104937.253532-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310104937.253532-1-pbonzini@redhat.com>
References: <20210310104937.253532-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main advantage of 0.57 is that it fixes
https://github.com/mesonbuild/meson/pull/7900, thus avoiding unnecessary
rebuilds after running meson.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson b/meson
index 776acd2a80..7182685b22 160000
--- a/meson
+++ b/meson
@@ -1 +1 @@
-Subproject commit 776acd2a805c9b42b4f0375150977df42130317f
+Subproject commit 7182685b2241e88340b6c3340afba59a26be213f
-- 
2.29.2



