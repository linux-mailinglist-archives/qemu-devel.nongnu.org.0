Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FC048DA84
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:13:32 +0100 (CET)
Received: from localhost ([::1]:57292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n81nA-0001Tu-0U
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:13:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n81bt-0002S1-6o
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:01:57 -0500
Received: from [2a00:1450:4864:20::133] (port=37725
 helo=mail-lf1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n81bq-0003ea-Rz
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:01:52 -0500
Received: by mail-lf1-x133.google.com with SMTP id m1so20510717lfq.4
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 07:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p2gnUwNfw1uWA7+UrRHBeWryvsdGYUBFZO3s0gh3LZQ=;
 b=Sw1RMc55ExTSY2wWH7zsA9bfw1MjWUdF5CtLrHGYz24SNxAJ2otzcnbj7gVJ2HtWOt
 4tISsQxB34SO0MRrpnRQAxkTA5KC3DLMJKpgv3GGuiFz2ti4RzfHQtH7svhrUkVCnBjw
 8s6+yTiejmTgJL9vm6fnnNujMSmgFH1jXY2DIiSorsf8f9flGMCscb4ZQgIL7FELEfzU
 v1DGZL8ONYYc6eRfCqufuDUpYcEcbRYtCdAy9PXW8u7cWCBVIPcSLqRxA8UzFfpQ1Pn7
 f9tdX6k2kZQUVlugMsddhQVg5TBRV3GZaTTUUk/dSb9yeT566M+2GadWmClqTLTdoCnj
 oYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p2gnUwNfw1uWA7+UrRHBeWryvsdGYUBFZO3s0gh3LZQ=;
 b=b65BxnLygdnz18DZ9BvCGEny0g2atYbtXWcOQ4aoWzUK6fQbpyejwL+Drb5AuxY4v8
 4+JGtbKDcTVKzTt4/SxqNAGHHoGXvSVW1GmyHBFd9Y0mT8+Caq3YNsBEb1u/BgBwr8hc
 rH87zPVA/W9QYlwFgyXeY+VEk/U2a+1ws0jO0Nhsn/Jhf4rUFuVnzvdCfJsKCc6LSFwR
 36aRYws+IDzNFoYvkboArbO0hmYckcBydg+pAiPnhqc77nERC6KYyB23gtQOUjpQN/li
 JtVsGit+DX/uwfz2YZXnWQemYlDe3L+dFzDWjyn1DySLNoUI3W5ZzjbwxI+fbiBYmDIu
 l1Sg==
X-Gm-Message-State: AOAM532pUD5F0TeAh3/QMRx5daqhA8E75ofiABZXCihNfyhjRuYf5w4h
 BdN2w/tXTmYGf3Ay/0J9KoV525mAFb3EAmr+
X-Google-Smtp-Source: ABdhPJy06jALQI2pExtpBv5tMtiDKkmQrHQeysO5IpG9T7LUBECJF0KrpT7mLgP/oCY+f9LelboLJg==
X-Received: by 2002:a05:651c:4cf:: with SMTP id
 e15mr3426095lji.43.1642086102225; 
 Thu, 13 Jan 2022 07:01:42 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.20])
 by smtp.gmail.com with ESMTPSA id w25sm314278lfl.155.2022.01.13.07.01.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jan 2022 07:01:41 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 7/7] net/vmnet: update MAINTAINERS list
Date: Thu, 13 Jan 2022 18:01:13 +0300
Message-Id: <20220113150113.58437-8-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220113150113.58437-1-yaroshchuk2000@gmail.com>
References: <20220113150113.58437-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::133
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x133.google.com
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


