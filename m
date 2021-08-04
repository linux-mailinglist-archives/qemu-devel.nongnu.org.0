Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF993E01E9
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:28:14 +0200 (CEST)
Received: from localhost ([::1]:49074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBGwP-000793-DA
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBGrx-0008F4-4m
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 09:23:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBGrv-0000Yv-NF
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 09:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628083414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SoGkSIAnJ0kgVRDCH6twelENAsbQmr58yidUpWccB4E=;
 b=jDUjr9YvpllWhaercvXcYiBCxolpCJr327SyID3ZN+EkOFwJuLxWKtUDkcN04mZFhG3Jin
 wsPfR5zN99pmdoFUrWKuUE2H2NE0E0br9Ewq8EOcvn+c0IT0WvUGuULwXabPJxrJQ7HF6Q
 TNYuWnf8jOYQKZDg+l27SZcScPaLMUw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-uXNr6HqqNR-MN0PUpgS5tg-1; Wed, 04 Aug 2021 09:23:34 -0400
X-MC-Unique: uXNr6HqqNR-MN0PUpgS5tg-1
Received: by mail-qt1-f199.google.com with SMTP id
 h18-20020ac856920000b029025eb726dd9bso1052026qta.8
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 06:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SoGkSIAnJ0kgVRDCH6twelENAsbQmr58yidUpWccB4E=;
 b=OFc+NooM3gRpOB1JEbc7ZhIBt+EQ7AjWxFBa4e503JFPnWMyrshcbg7Kk4vLJUuk47
 4v/SX7lY4Ov5lcy8v306GgwIMSno98JizgbBvwQr6tzeXdiS2UmU9BZTZOjRt5IsO3Xu
 FZvIt69dcp0aHvGqn9uz/ziJJib9OgKZJ2RUtiWa9jJWzg3JruolQUXHJPnKCcmlD8iF
 Piz5vHDBK8/NfkrsfE3PjHCKv0b+5I7eL4Qhanx9WRDQKoeuh2yI1pqTJedBE3+2ou08
 XsiMOlyXDxp2Oq8rPA36HW+WcdONPDrJP91YPmESO2VM+/tronQ6Ab+VnyTWnClp6Oa7
 LzRg==
X-Gm-Message-State: AOAM532FhugMTWmGm6zYRezTXVQlsCNzSk6r4XNlnKdB+xNe7Kniey3r
 V2LQWLuGbfkrpPRM3pgd+OOf9nYum7vr49rYy8G5UlSA02n94tAFbjE4n9CHY0PkMYarmRm2QgJ
 TxN+ZJR1QZrRLqYdb/J4/EyFwbMww/cYJ0asPGRqLGnvtWtaI9dhajHKtPDXXyoUa
X-Received: by 2002:a0c:b450:: with SMTP id e16mr26833981qvf.25.1628083413358; 
 Wed, 04 Aug 2021 06:23:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmBk7Y3vhg9297xPzYf77TDhWHwr0Nt7zuDtAmAzjI73YOURVT+2AxLN/gkS+kbgalXze62w==
X-Received: by 2002:a0c:b450:: with SMTP id e16mr26833949qvf.25.1628083413140; 
 Wed, 04 Aug 2021 06:23:33 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-92-76-70-75-133.dsl.bell.ca. [76.70.75.133])
 by smtp.gmail.com with ESMTPSA id z29sm1388608qkg.9.2021.08.04.06.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 06:23:32 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] Makefile: Fix gtags generation
Date: Wed,  4 Aug 2021 09:23:27 -0400
Message-Id: <20210804132328.41353-2-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210804132328.41353-1-peterx@redhat.com>
References: <20210804132328.41353-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 peterx@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should use "-print" or otherwise all "-prone" is ignored.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 401c623a65..d39d3670de 100644
--- a/Makefile
+++ b/Makefile
@@ -250,7 +250,7 @@ gtags:
 		"GTAGS", "Remove old $@ files")
 	$(call quiet-command, 				\
 	        (cd $(SRC_PATH) && 			\
-		 $(find-src-path) | gtags -f -), 	\
+		 $(find-src-path) -print | gtags -f -),	\
 		"GTAGS", "Re-index $(SRC_PATH)")
 
 .PHONY: TAGS
-- 
2.31.1


