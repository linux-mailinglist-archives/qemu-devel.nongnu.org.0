Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9AE454197
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 08:06:42 +0100 (CET)
Received: from localhost ([::1]:60718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnF1l-00047K-KX
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 02:06:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mnEtY-0004t8-Tp; Wed, 17 Nov 2021 01:58:12 -0500
Received: from [2607:f8b0:4864:20::531] (port=45854
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mnEtU-0005av-D4; Wed, 17 Nov 2021 01:58:10 -0500
Received: by mail-pg1-x531.google.com with SMTP id h63so1393695pgc.12;
 Tue, 16 Nov 2021 22:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tt9YzbsEWtPuG5Ge5rnyBeLs7tuX8ZxfIZJWS1cdf10=;
 b=OgU1m2Igrr9CkwYTtIMW4qpxnAuAki2FWjBFJrlquvhJzz4hMFGgLqSl6F4CrGLLup
 xVzIj04I7lDdXjPr6tBqeUV3ZF3T9uT4TSsn7kKDKa4bNGAKPA85WUG5fZ+2+xmW/qAi
 nB49qMnWXICVgGoxiKQiWCNXnLcS5umYbCOwckGtIDcY+gK0QPTNaot0S6MSnWX1ZCKH
 EToWEGcAFcCWqz61mN8qKeqscXac2vMEOTKwxZCb2WgbcEF8aQQeGfFy0bBB87C7c64Q
 sH3RR9wD3ffsTe5p4B+V91LGDkSfxLjL8uiDrRVvyTOLPBmFMidpg4Fnm2whafzDbJKT
 LQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Tt9YzbsEWtPuG5Ge5rnyBeLs7tuX8ZxfIZJWS1cdf10=;
 b=dP2Nznq686HwIU8qjlZSu+yRJz5eNxPNVqYDgwpQL2aj2UMXvSyJtJGw8DCPQlKgAh
 xavYyduutApbyABFjt9ztlx9jpOZ3/xVWELGaqlCU2i7pMEQnp3B+2StVjsSvbYm54tf
 gSGOaQBMqKHydEtQgTqo/bY5njITBXzgmx86FV8OmC6MZBruVRdY4Tpp55TsPqdoMKDr
 JmMqzQsnTEhLL9V9IoszP6WMIRm9xyhI3Npg3M2HJyEyZSUDZY4REzgA6IcmLCtc35FD
 JxnaUdD2WsN+irvI6x1nN4AMz/x5+yG1DXZwUF+BjSiy55Hwayi+xqsSgtB3Ucz1Dkte
 gqYw==
X-Gm-Message-State: AOAM532qUAdY9TZIue+cNVi5jq6CXwfm8sjv4FWQrZH9mg2FEkuVI6dS
 yj0FnI6bK1dCQsgTCt/4K5E=
X-Google-Smtp-Source: ABdhPJzAy20UCsHFAlmqwW0vh51PRwpD6+ZTpMZamY1zZlNzEuzSBxisc4vIOitn0ezrtr0qFqtgFg==
X-Received: by 2002:a05:6a00:17a4:b0:49f:c0c0:3263 with SMTP id
 s36-20020a056a0017a400b0049fc0c03263mr46683270pfg.81.1637132286665; 
 Tue, 16 Nov 2021 22:58:06 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id d13sm21914618pfu.196.2021.11.16.22.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 22:58:05 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/4] docs: aspeed: Update OpenBMC image URL
Date: Wed, 17 Nov 2021 14:57:50 +0800
Message-Id: <20211117065752.330632-3-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117065752.330632-1-joel@jms.id.au>
References: <20211117065752.330632-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the latest URL for the OpenBMC CI. The old URL still works, but
redirects.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 docs/system/arm/aspeed.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 41a9bd5608e8..b87697fcf0b1 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -82,7 +82,7 @@ The Aspeed machines can be started using the ``-kernel`` option to
 load a Linux kernel or from a firmware. Images can be downloaded from
 the OpenBMC jenkins :
 
-   https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/distro=ubuntu,label=docker-builder
+   https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/
 
 or directly from the OpenBMC GitHub release repository :
 
-- 
2.33.0


