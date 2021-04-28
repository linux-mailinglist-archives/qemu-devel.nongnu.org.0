Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF2B36DDC4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:03:30 +0200 (CEST)
Received: from localhost ([::1]:59414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnaz-0006U7-Ba
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lbnLv-0004CT-Aq
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:47:55 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:34496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lbnLr-0006in-9U
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:47:55 -0400
Received: by mail-lf1-x133.google.com with SMTP id z13so19296948lft.1
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HsiF1/EhRsF2rPRBEnHP1f/R5pxso3L25zHd/RevGm4=;
 b=PRgBwO0WuRlzUcNODsIHd/lqqdcBDMVACPnTuaLkkNJ4tlfyrh54A+MGTMBLDwQbdU
 utk2BNZsM2hvt0kKskVH77DPQ2w3BtGBxbCznKxO3NIMJVadLgzlFsDfFo6vTN2f08Jh
 osUgFvfyGEgEC2cVHJAYCmHtqEvRVD48jj/vRmCtPqH7ggBnqJvCl+vo+IIcEyGJGGEd
 MuzeRBQnp6Yn+7wr1+E7R2/9MR4wLZvryx6Gd+q3FhACTTF2/uoxOquhV7B5eWOTVBDB
 ERT3Aim9WFMYTSrJ4dvSQXqiXIUwrM7QHU6QmLdURX69wZrgfqszRFap9lauH1Wdp584
 5I9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HsiF1/EhRsF2rPRBEnHP1f/R5pxso3L25zHd/RevGm4=;
 b=mCPZXOdpoqNk968Bx7svoA+ZgdE9P9OFLXNujNql5v3UMqPpSn3Wil94LIV55I7lxH
 zU/RFADI9YhcWAiKITk+f1uJPAwcfsEZ/NC3wuANB3EVMHTv8Gqbqk3SXgGaqNWBqIGP
 JDR+Rxm2tKdKCF9+LsilVwIzsPhohrpy1lpwQ8U8rM65n+ziQov1Y6luR6mi4Dxzv0Rq
 Zo0/2mUe/SHWQkY1VU/Yzz4AAH0vXxaQJAivAeN7oVPhWORTm86K06jC6CqVY1HuoM51
 l+f3bXTNRbtuQ4huRE5etdSSvXpkLvS0JUbg3EiWbwt/7mRuntbMBYuVv+I2TfO8UZ5U
 d1cg==
X-Gm-Message-State: AOAM532EnuUuX9OunOGQbstpaoIYa7g/z0B5EQUh3FkKp5gGujPHk08s
 qvneoDQDUD4iRkA634bx7SNy8g==
X-Google-Smtp-Source: ABdhPJzpRIeUyPQDQLxTWFIZ2vGMHOyMCVBOJSnOaeR/pWTt0ID/BM9zmQ8TsbYfh+KmpHqotKeBEg==
X-Received: by 2002:ac2:4f03:: with SMTP id k3mr1190262lfr.254.1619628469838; 
 Wed, 28 Apr 2021 09:47:49 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id v24sm86302lfp.195.2021.04.28.09.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 09:47:49 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH v7 7/7] MAINTAINERS: Added eBPF maintainers information.
Date: Wed, 28 Apr 2021 19:47:33 +0300
Message-Id: <20210428164733.56547-8-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210428164733.56547-1-andrew@daynix.com>
References: <20210428164733.56547-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::133;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x133.google.com
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

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36055f14c5..c7e9a57cd9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3312,6 +3312,14 @@ F: include/hw/remote/proxy-memory-listener.h
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
2.31.1


