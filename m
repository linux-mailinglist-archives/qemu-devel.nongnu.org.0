Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4013847136A
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 11:50:14 +0100 (CET)
Received: from localhost ([::1]:49336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvzxF-00018P-Bh
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 05:50:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mvzrl-0000vV-3L
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 05:44:33 -0500
Received: from [2a00:1450:4864:20::12a] (port=34637
 helo=mail-lf1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mvzrj-000846-99
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 05:44:32 -0500
Received: by mail-lf1-x12a.google.com with SMTP id m6so10559731lfu.1
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 02:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wTbVbo9ur7WLaFFQEbjRi1oejMLe54z9lZ3u3znGArs=;
 b=AyyLz5XcRj69iMijB/9i9pLexD6tDQCi8Wln1etRQX2qK+2OVxvWXj4HFgvuTETnHT
 nWgPYSbF2aesBhgFM9kSG/CK2a7lM471Jd5CRtaQhS7svYvIwJjP+dkaAcZkeiqkN4Za
 vk6HyTG9tz/PJuGZdiPdu661RNENhG2K2EfowF2MFU0vbQVEi7+PP/L6BIgw1QTTxeBH
 ZmQz20uHnOS45GgeG1UX4oY0KyHgwpo0FMHJWyPEYTzu/WRtqzv5NI9SpJ8TwcovZgd2
 N8pTdyPRPmAQk3A1mfsFxQyMU0ewJ290zLWvvCpVz1MU8CylEn2TQydnrat702HN8VLL
 9KTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wTbVbo9ur7WLaFFQEbjRi1oejMLe54z9lZ3u3znGArs=;
 b=AWRvBH1X5t3zUAfCpwO+20M8FAyJDTH3nSzAMWsQYoWplzHojCoBPt1VxDaReOh+W3
 yV8XvXm+3YTEA2wQXO0s8YC7ifKcm1U2zB0ZdF1hkconvPBTebLSJDvChCQ0yBsbZAYh
 qvFOfHmf95HRoHNFhYC22w+yV7QdTyxzjwg6xEKjpGgzvgOH+ulOhvnNpl6Ngd1uC2WJ
 9xRWq06/C+VLDTHBQSWh3BVvqpALatS9lKxcu9mkYsfAJAbM7FU3KgiTikkyoTVQDuL1
 rdk6d3cr5cDEKzxH672wQXaL1m9vThQ7+lmnFT7tRaqhBVuuyvzHYxlVt4rEI3cVrAnz
 DHWQ==
X-Gm-Message-State: AOAM531weGc1gbme9A3UAJQGedP+9xl8Z58csGqPyl5zUS0Y9WFV3MAs
 ZU7rXeSKqOdfigQBUo+DgJ8gZENgfOo=
X-Google-Smtp-Source: ABdhPJz1xkf0uBl8rL3O6l1cMOEXb9NBvNCb/g/AwzGEo/fLYGcXaWkzPqFQHn2atgPMYjsNup+hvQ==
X-Received: by 2002:a19:d61a:: with SMTP id n26mr17921457lfg.313.1639219469490; 
 Sat, 11 Dec 2021 02:44:29 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2a:abdc:fce0:e51a:d86:d956])
 by smtp.gmail.com with ESMTPSA id h22sm581971lfc.137.2021.12.11.02.44.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 Dec 2021 02:44:29 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 7/7] net/vmnet: update MAINTAINERS list
Date: Sat, 11 Dec 2021 13:44:13 +0300
Message-Id: <20211211104413.50524-8-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211211104413.50524-1-yaroshchuk2000@gmail.com>
References: <20211211104413.50524-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12a.google.com
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


