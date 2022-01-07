Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E7048758C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 11:30:08 +0100 (CET)
Received: from localhost ([::1]:40338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5mVb-00071V-JY
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 05:30:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n5mMp-0001wp-8Y
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:21:03 -0500
Received: from [2a00:1450:4864:20::12a] (port=46663
 helo=mail-lf1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n5mMn-0001eu-Px
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:21:02 -0500
Received: by mail-lf1-x12a.google.com with SMTP id p13so13793517lfh.13
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 02:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rGMfLqzw0kCAI6ug/boPoiiViahKvJD7Hrxine2QKnY=;
 b=oe1y7xHhtw2z+1mImziNcgCSVN4LskSDiGBGR1EhgB5IJ7TMb+RFEuzdItEh/5PCVM
 yvJ1CINih875hz7LrKo45lTT00nuPM4GhqrSy/EiEz+BQYeVhizkjJxo3RGOPZR5GMJD
 NDrqWjVcvd6njWNzL1hpZ4l5fK0ubjl/H6eSj+yDDYMIJNlJUzIleFuKvCoKjHIPKiil
 kTo+e6waoyxW0i/AL2d1bi1kZrs+EhDCQRzLN5UejHX9/f3H302gFHYKJnfoFN23lc/m
 n4+gNINiQjQvFaOJvf3HWcGu1cIS2xxYRLxRABC6w6sIpAQ+pW0ySsRML17KuQ3KqGP8
 ihXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rGMfLqzw0kCAI6ug/boPoiiViahKvJD7Hrxine2QKnY=;
 b=pVqNjXTzMaIEbZjxLvqQOth9efN18SF9Zbpz3eSJTYvp6cncwZqd2hLuCCAM5cO9i2
 yPLspAgVqJ4BF//3qiiJC0xXII+bFobGsx1jHxRCt065sEC3lEGtgyqF8kjyQbLr4oU8
 B1tbncfZFsq9ahXuNbbdeKPU4QZH70nembQpUTBvcJR97amh8zCy/S5hN6F2FamWiM/q
 zbE/nT5rvnMamtbzZsirpUTGrdWbKbx5clTe/aoETNEOR1UgKAqC3Dtf7oC7sCxjBLlU
 Ueo8aBcnhFPRi7JDsV9miC+kz6mvrvZfT50xwtQqbm4SBmT3KtI3K7xb+pOITgolIAqy
 wKFg==
X-Gm-Message-State: AOAM5332wXZitv1dhMisXexJwrgLwO1CN2g7EwQozILl/NnYR0LgVIRz
 c1l8N4R8zJ6ZB4YqZcQDYRCUKsDF46M=
X-Google-Smtp-Source: ABdhPJwNRNCWyh4XTs5QegDjEwAJM+PLHBJEig2rVr2lwHspjoHu6xwhB1Yn12asbMtOU0tNcgg0NQ==
X-Received: by 2002:a05:6512:b0d:: with SMTP id
 w13mr9708023lfu.240.1641550860059; 
 Fri, 07 Jan 2022 02:21:00 -0800 (PST)
Received: from localhost.localdomain ([62.140.238.4])
 by smtp.gmail.com with ESMTPSA id p15sm524259lfd.69.2022.01.07.02.20.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jan 2022 02:20:59 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 7/7] net/vmnet: update MAINTAINERS list
Date: Fri,  7 Jan 2022 13:20:19 +0300
Message-Id: <20220107102019.37013-8-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220107102019.37013-1-yaroshchuk2000@gmail.com>
References: <20220107102019.37013-1-yaroshchuk2000@gmail.com>
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
index f871d759fd..7184e41b8b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2633,6 +2633,11 @@ W: http://info.iet.unipi.it/~luigi/netmap/
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


