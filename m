Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E71A571AD4
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 15:07:14 +0200 (CEST)
Received: from localhost ([::1]:59342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFbd-00013P-8h
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 09:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLZ-0003Fb-5y
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLX-0001WM-OE
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VRrYKlDmJSTg+EmFGqVl3x/Dcb1GLjJtX5irMQnBiqU=;
 b=iUevqCQpMvJWG9hYeR8ZnmqIPNmLUh44gFTvu1Ff/juHJMgRpmlnSo66InDto0A2WVDi4o
 oBN11exS4vK4ZyK6HTmsVemnF2yrbU3zfBUPW3giTLUtTBZ/uLxI96VmYy+dBrfSld8TwA
 EcDeA0TkMzHyJZkCdPdjHRgswcggdqM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-vLFJrqgrMxKcfXZyU77Y0g-1; Tue, 12 Jul 2022 08:50:26 -0400
X-MC-Unique: vLFJrqgrMxKcfXZyU77Y0g-1
Received: by mail-ej1-f70.google.com with SMTP id
 sa13-20020a1709076d0d00b0072a8791298aso2259186ejc.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VRrYKlDmJSTg+EmFGqVl3x/Dcb1GLjJtX5irMQnBiqU=;
 b=zbYJJPkR930XU7uacXjLYFSuoff4zrS/dg9foJwSVsTk/IJMhupqiPVuhnAzmChAif
 dA6jxIggyWczfS3J2YkkWpoi+6HAKEEaHdw+XpngiYFiC0eLZYQUQS9dmHNBZDUYUyxb
 F7emA/pnn6PYg7bbNDFgPTBZ4SlHuyAnME6W94TL0+2MjmDD7uo12Y0G8y4kiT/H1yEc
 8DH8jOM1ADz6erOIkqJncgGs7f2GOTECynO8Vo+bHshe7t5WItLkKv+wDbpqaoPttRCk
 sSEfuD4+sdt0/3NLSX8fgOyGfwNq4RNtuM92VvRp8zpWanWa8quDel47Cq2w/6p2pL7i
 xtlg==
X-Gm-Message-State: AJIora+z6ilcN8khJl6i7u3VE3YAWJv10m7L97JGF36L6/3nMCUd0Q8T
 vQfIsWKGy8l74a0DRfTg6ewu3XJI614pIAWlqPnZfLrJ5RwOEgPMc9EYwdJAIQzRhbq/b8SzfqG
 0w2wY/JDLRHGaLJrgygrzDAOfH+00+wKfgTHe4qFQA/fVrPhRl+yQOOxKwusTvTbTCDw=
X-Received: by 2002:a05:6402:1914:b0:43a:d548:8adc with SMTP id
 e20-20020a056402191400b0043ad5488adcmr13885457edz.214.1657630224993; 
 Tue, 12 Jul 2022 05:50:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tYeB+Mpcvx6iV5Tl26e1eLdsBKIZZHK5tYDbj6cd3+BD7JNkK0eC1fBlHFhVTo1ahZRIUpWg==
X-Received: by 2002:a05:6402:1914:b0:43a:d548:8adc with SMTP id
 e20-20020a056402191400b0043ad5488adcmr13885416edz.214.1657630224681; 
 Tue, 12 Jul 2022 05:50:24 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 ap13-20020a17090735cd00b0072a66960843sm3832951ejc.51.2022.07.12.05.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:50:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PULL 16/18] build: Do not depend on pc-bios for config-host.mak
Date: Tue, 12 Jul 2022 14:49:54 +0200
Message-Id: <20220712124956.150451-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712124956.150451-1-pbonzini@redhat.com>
References: <20220712124956.150451-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Commit 45f1eecdd63f9e4fa93fef01dd826e7706ac6d7b removed the dependency
from configure to pc-bios

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220624150258.50449-1-akihiko.odaki@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ec4445db9a..b4feda93c8 100644
--- a/Makefile
+++ b/Makefile
@@ -87,7 +87,7 @@ x := $(shell rm -rf meson-private meson-info meson-logs)
 endif
 
 # 1. ensure config-host.mak is up-to-date
-config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/scripts/meson-buildoptions.sh $(SRC_PATH)/pc-bios $(SRC_PATH)/VERSION
+config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/scripts/meson-buildoptions.sh $(SRC_PATH)/VERSION
 	@echo config-host.mak is out-of-date, running configure
 	@if test -f meson-private/coredata.dat; then \
 	  ./config.status --skip-meson; \
-- 
2.36.1



