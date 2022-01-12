Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BB048C50B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:41:40 +0100 (CET)
Received: from localhost ([::1]:37020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7dsh-0008PA-Um
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:41:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7ce9-0006nE-Mi
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 07:22:35 -0500
Received: from [2a00:1450:4864:20::129] (port=42685
 helo=mail-lf1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7ce5-0003ii-Kk
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 07:22:31 -0500
Received: by mail-lf1-x129.google.com with SMTP id e3so4696439lfc.9
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 04:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p2gnUwNfw1uWA7+UrRHBeWryvsdGYUBFZO3s0gh3LZQ=;
 b=OLdCKUXJqClpjkw20HILD4we3FnwM5guRhsGkkbVCMB9XGBVJrR04eO9wtQXi3B6qL
 epBpAFkOEEUai510BwLDkPjGO0Xkvn164y5ocTb2ZG04Rlj9Z4xLbY3OaRG4FCtQcEqv
 5mLlr2hjPksFz7v9xgPUGZsFDu8fWTim3U0l7GbwjFMjo9Q6bhKcRyu6D7G1Ci5ff25Q
 xuq696HfdQ9kvu3z2Lx0Aaz7/sWcsiYivUATXhW8S1RzOdTLxOEmFIItiO2qJnF0cCca
 lz1IQW+YerJKRkRU2jiVbNwb+/a2wMi8ctu0duiSXW5cjGgy+Kb80wK1l0ffkvkVgEaK
 gwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p2gnUwNfw1uWA7+UrRHBeWryvsdGYUBFZO3s0gh3LZQ=;
 b=XPqMYlyqPNx8B20RGSpOr52aWEWpWI13CX9/a1BJu6ZHRkDGl2sIFFZZESMnBdIuFD
 1zXxsq//ErKm+rGz9eyFwUidO768vo1dPFo0UKwcv237v0j1Yi5gRpnCXFAxQOoRBmmD
 NiiWlEE5cNwXqwfPKkMhBkinRP8Jhq30eUB8IcueXC8GVxA+YtziVz04IfBGKqDeEire
 2WB5YPinHQ0Hy9W11J6Tear8ggO3+OZK2vkJcLTpOQ+Bi6FbK5E7cgW5GAN7NeufJ0Ts
 ec+APlPlsh7OdzmXtC5XGz+IAYvIoZmFCCaGk23sptgh9cwoOtg9xMVT0IU8BuMUyjIS
 5ofw==
X-Gm-Message-State: AOAM532CwdimQzkaXi/Uvodil/rlLOzu704QoPsB1LWNOWcTrz13opmV
 BF+v4keCCUyx9Nmx3LaymwLHLlEEU5PENLPm
X-Google-Smtp-Source: ABdhPJw1vSnc8dr7hJwTUm1ASLHCfxogKznhnSUqFKF4Ghgh0OGp85GTZv2g3n+4BSNGQ5Om8FdSaQ==
X-Received: by 2002:a05:6512:a94:: with SMTP id
 m20mr6964871lfu.229.1641990147976; 
 Wed, 12 Jan 2022 04:22:27 -0800 (PST)
Received: from localhost.localdomain ([77.234.205.2])
 by smtp.gmail.com with ESMTPSA id u7sm1623035lfs.218.2022.01.12.04.22.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jan 2022 04:22:27 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 7/7] net/vmnet: update MAINTAINERS list
Date: Wed, 12 Jan 2022 15:21:50 +0300
Message-Id: <20220112122150.37049-8-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220112122150.37049-1-yaroshchuk2000@gmail.com>
References: <20220112122150.37049-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::129
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, r.bolshakov@yadro.com,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c98a61caee..638d129305 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2641,6 +2641,11 @@ W: http://info.iet.unipi.it/~luigi/netmap/
 S: Maintained
 F: net/netmap.c
 
+Apple vmnet network backends
+M: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
+S: Maintained
+F: net/vmnet*
+
 Host Memory Backends
 M: David Hildenbrand <david@redhat.com>
 M: Igor Mammedov <imammedo@redhat.com>
-- 
2.23.0


