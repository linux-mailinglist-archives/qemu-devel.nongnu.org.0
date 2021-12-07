Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C5946B8EF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:26:24 +0100 (CET)
Received: from localhost ([::1]:56636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXfz-0005U9-LR
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:26:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1muXYn-0001s9-OC
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:18:57 -0500
Received: from [2a00:1450:4864:20::12e] (port=43538
 helo=mail-lf1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1muXYm-0007E4-A4
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:18:57 -0500
Received: by mail-lf1-x12e.google.com with SMTP id b40so32336043lfv.10
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 02:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wTbVbo9ur7WLaFFQEbjRi1oejMLe54z9lZ3u3znGArs=;
 b=lbCdXhh3u+o5rCYEedRg9y21pqHaMtBc8eLJX2WXzWuWKYu6zgj0p+72t7UjGHeGO2
 T5YGz/SKDavYVyQZVhqe2sLO6tSJ+HwIH0DhhhCqTvNFEiDIm+UQa07AK5NAK+jYaCyT
 coIRxDHdq9EU/QepS22nw7s7yB9hZgMTYinLEqcKg7YONnbNOg5SQ3JdKW3IdnLHAZYh
 woztjpmOaB2wiQzCk3r2tZv6vuiL3/8xmgsTtnfIGuZk0kLbSvAv0NHIamuWuZJMUPEW
 dsxZYbDiwCsW58yXLqNNuQ6I+H8Q8RUydFvZQpAqdaiyMlQ2bY0p/h3JJ/C5AkEhM2Jb
 eKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wTbVbo9ur7WLaFFQEbjRi1oejMLe54z9lZ3u3znGArs=;
 b=Ho7uQTQZ56KDnd+ieEhFjVvRFyIBDovl5OrcvgVl13SzJ7G/RXzGwWzFh2FJojGiAU
 h1DQqCXyLyzijL2qCyAYJ072Q2xm5UTNC0SBHNTZylSJG2bdoqju8VPoJ9s+oAj2WH+K
 T/kLMZ0j12fdyRW7MP9/yU5X01sDoWR6OrTcd6Rii0nfOsrq8H+SmH/x66BA3oZ3Rdfo
 NRlF/vrR5585iR6WuiyjQCPGLwKDNDzjkooonHtx8Ft3p6T3V0EGs7nd0nG0a4EEM5Fc
 IL2HR2hD4kL3eeqwvZDnGpllmjlkq0Jeu/rv+GHVNJO9LQi3eIFRoXItoG63eeIZh32Q
 m7rg==
X-Gm-Message-State: AOAM5313iD6zl3HaHJ8l3Is3DqJQd3ph91wi/3OZc/sNVhsfkQ6VC6kH
 tHu959D1gqFMyXYyumTGY1m1EzQySvAjfw==
X-Google-Smtp-Source: ABdhPJxPjgxsRrSqb2VpOh0zt2sSQ89GFv8b8RYQ3vADiTY5rxADjdapfVDTLO/XlJY3su0wESyjgA==
X-Received: by 2002:a19:7b1b:: with SMTP id w27mr39650840lfc.379.1638872334486; 
 Tue, 07 Dec 2021 02:18:54 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id w10sm1629022lfn.308.2021.12.07.02.18.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 02:18:54 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 7/7] net/vmnet: update MAINTAINERS list
Date: Tue,  7 Dec 2021 13:18:28 +0300
Message-Id: <20211207101828.22033-8-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211207101828.22033-1-yaroshchuk2000@gmail.com>
References: <20211207101828.22033-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
index 7543eb4d59..5c696e38da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2631,6 +2631,11 @@ W: http://info.iet.unipi.it/~luigi/netmap/
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


