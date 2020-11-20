Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B402BAF42
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:48:54 +0100 (CET)
Received: from localhost ([::1]:55170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8eb-00021I-6D
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:48:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8bt-0006O4-9J; Fri, 20 Nov 2020 10:46:05 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:54274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8bn-0002oh-Ot; Fri, 20 Nov 2020 10:46:02 -0500
Received: by mail-wm1-x32d.google.com with SMTP id d142so10760905wmd.4;
 Fri, 20 Nov 2020 07:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qQRKb03hVueEi/f7KsFBu0gr21BcWoGubc/H1nLbXsg=;
 b=uyCqTvxJRyxwIiv2fh6pFGU8yjpMLoNxdxfU1avFSVEWTlzQg0Drpzi9dFt2hdzjo4
 YKXcXxXkADVxAfQ8QcaZe8WT12CTtyRJ9hi396bRLfeHEL8F5wsnzjv9ACelyRM2TGUS
 rw9ZqIcvcYqRUHzb56HML2/7ObDBSUHhz7zAHKdbS2NBqw/ep3VSLCSfBdmXCGnG9Pk2
 KK6HjqlQRzPi2sC3dPsCDKIB5SIz7F7hD9XcPpHKpyFwMcT2Bko+xHUH1FQi0HCHYza8
 BE61njz4yGCUjdT/hvrRyMs7XgaTbe7J74Vd6NN3gKCQn3N2g7dq5lzzRlh+Q6RACEJN
 WY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qQRKb03hVueEi/f7KsFBu0gr21BcWoGubc/H1nLbXsg=;
 b=VY2XRJeC6FbDKDrRgw5HI9c9ZplL+xrDu/q7/azQMmtEpxr61Ya/wog2Gxyfuwilw2
 Q6hZGHxzhro6EGQQEM6GOlVD113CpfshuX6qx97q6ZuywZ63jiOCgeVkgdkMDqwDlOm1
 o875Bwl3IjM8vg0ZB+yBgLmCIMNF44paTghOU3nv0S/uuMNqxUbFu+ecb6Xk/epYuHy0
 RYgZh96TxhNTI4N1nfaHvYsmUBSnH+E81CLmpgulNvaJ40RbOv/oK9Zho84nveLbnbSq
 OMbx7BYB3H3VeJDlP9xnQzhe9M96JtddviAlowRGOfbO5LGHNfM3uXA0arR7IAR7I/PI
 5RTg==
X-Gm-Message-State: AOAM532XuLTFyabhmaswDf3YvO+JZVmUDOfiX5nX1wRtTGuH36kAJzwf
 YMg/J3WprvmDLvRKUjHxmy9METyTEUY=
X-Google-Smtp-Source: ABdhPJzLi3uRjkuG3WNg2p7IrKLiEnQJwGUaS2Rbc39fmBSSCStkglgc3LuJvs0AWroLrmeZjRuN1g==
X-Received: by 2002:a1c:8085:: with SMTP id b127mr9465138wmd.142.1605887157646; 
 Fri, 20 Nov 2020 07:45:57 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id d3sm5407362wre.91.2020.11.20.07.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:45:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 2/6] MAINTAINERS: Cover system/arm/aspeed.rst with
 ASPEED BMC machines
Date: Fri, 20 Nov 2020 16:45:41 +0100
Message-Id: <20201120154545.2504625-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120154545.2504625-1-f4bug@amsat.org>
References: <20201120154545.2504625-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d7a6026b91..cc883260d03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1001,6 +1001,7 @@ F: include/hw/*/*aspeed*
 F: include/hw/misc/pca9552*.h
 F: hw/net/ftgmac100.c
 F: include/hw/net/ftgmac100.h
+F: docs/system/arm/aspeed.rst
 
 NRF51
 M: Joel Stanley <joel@jms.id.au>
-- 
2.26.2


