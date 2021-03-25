Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDDA3495D4
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:42:22 +0100 (CET)
Received: from localhost ([::1]:56266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPS7p-0006X9-Fq
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lPS2c-0000Rc-QH
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:36:58 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:35362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lPS2Y-0006xd-RN
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:36:58 -0400
Received: by mail-lj1-x235.google.com with SMTP id a1so3715318ljp.2
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 08:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=raTfUr1RGQH+ppir40P92/t2f2syOAqFxlFGwTenY2U=;
 b=1KzRm+N0kMUspFqLx2GicZ/llffvnSk2MXj3mqk6pLEfK3CSB2J0Ss3ipKZq9sLdLZ
 L5Ihhx7zGjAYlYaLlHMVluQtS06ZR/ppvVO0Xu6i7n/w4W2FJqvwDJWPgy9Xg7+D/+Ck
 gwD9FpoRbrs82ue8GCW4EmINWO5rI5YFOUBcXaI2LQlxH/1SkMaNfNeOXNrYYjKU0hWQ
 Gn0cjpXAbGTKsFkDGIGSOu24sxha9ZzL+pDF5Zw4IJ7eiT0T3sBSZit/wvzrrPCPtBCV
 LvzXl5tfjvehIVn6GRMykY9pwbi9sNgUY1xjQdeATrsI3eizAzCmRdBH3KC+wWt/dodx
 OfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=raTfUr1RGQH+ppir40P92/t2f2syOAqFxlFGwTenY2U=;
 b=oPJjq2mBOYnBnMB5SX2NTRrsjeuVytA/J6x1ShXbZAhGGxttc5qJRcRH7pElMwHJm4
 j8P92+1Z/akTFnx4IdBSw7vSvnhaatfWWPXjL2tdADQOeajpFahGk7FhShNJPYI31lac
 70a9q6YA17UpKkvAuaTzZl6hB2K+SNvvxNH1wQflTTc9duwxsEmBkxOFQIrH5k5MzoCj
 yB3fIcHmbG45Sz/XIfxCPpjM2tHOcAfMvTA9K+qquOM7hyNWSKvMfEAqdG/W0hJ9ixgR
 uF5InB9v/FOoSnb56NwpjJ7kvKlFLNnwUM9OpCGluu+yQ03LgOGpSDMS6lfc16kvbEi8
 5Sww==
X-Gm-Message-State: AOAM533Sdki6xGuLl6pKSx9uEWlohczUEHoVtSBgKXBxPv5/g1njoxUz
 Irj+UTIIuGOlCzs999OHC/CBgpLc8R/FZt2F
X-Google-Smtp-Source: ABdhPJwall/1hi+Mk+Olb+Mcspht5XBx+XAmrlyOv6TEGHTfL3gKXaNwaM3iYmf6hPUmic6uxzId+A==
X-Received: by 2002:a2e:720c:: with SMTP id n12mr6114191ljc.67.1616686613348; 
 Thu, 25 Mar 2021 08:36:53 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id w23sm796694lji.127.2021.03.25.08.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:36:53 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH v5 7/7] MAINTAINERS: Added eBPF maintainers information.
Date: Thu, 25 Mar 2021 17:35:29 +0200
Message-Id: <20210325153529.75831-8-andrew@daynix.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210325153529.75831-1-andrew@daynix.com>
References: <20210325153529.75831-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::235;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew <andrew@daynix.com>

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e4be6b667..0f74778ed7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3304,6 +3304,14 @@ F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 
+EBPF:
+M: Jason Wang <jasowang@redhat.com>
+R: Andrew Melnychenko <andrew@daynix.com>
+R: Yuri Benditovich <yuri.benditovich@daynix.com>
+S: Maintained
+F: ebpf/*
+F: tools/ebpf/*
+
 Build and test automation
 -------------------------
 Build and test automation, general continuous integration
-- 
2.31.0


