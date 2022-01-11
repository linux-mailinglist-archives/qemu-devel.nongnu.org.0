Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C06348B94D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 22:22:57 +0100 (CET)
Received: from localhost ([::1]:50610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ObY-0008QD-2a
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 16:22:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7OTm-0006Cj-Ux
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 16:14:55 -0500
Received: from [2a00:1450:4864:20::12a] (port=36825
 helo=mail-lf1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7OTl-000327-9O
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 16:14:54 -0500
Received: by mail-lf1-x12a.google.com with SMTP id j11so1179286lfg.3
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 13:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p2gnUwNfw1uWA7+UrRHBeWryvsdGYUBFZO3s0gh3LZQ=;
 b=JJnleb2hh7qfhi6ECS5bhsFRrHHO6oa9f+yeD1hZvq2FZCNLPbttUxLUvZVQJ39//n
 KNHOcMTSPT21A1uxu0HYjXHpqhHe1Ou7TvIhjc2e75n82pQ6ZyPMUcGnDxSAMWrn50Sl
 mpmQdsPgTTipAi1PT2OKgRXCvn+jKSV/e7s8p3ED9rmv3eyWt8P+VGXaIYY8UPzqbbWH
 YQ7XJnpT5IE3C/rZsoSJQfS1hnXwva/a3MCtoIGRV0wZPHvcbYxdbwhzwZa3toNLP1br
 DtEi1SnVo+fdR/CaDOjG8AcmRisgjYz0tgwbv4CoggY+Tty6bHLTCPlJx3ApFeVYa4Cf
 W5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p2gnUwNfw1uWA7+UrRHBeWryvsdGYUBFZO3s0gh3LZQ=;
 b=oaLilWmggcRmB4uWJ/yjjjVlI6lxrA9frafM/za+q5+GfFjRgBlLH7+GVVpx63atHw
 6uyitbKC+xefqWrJC3KG4FC8dNA6RkLCYzeAbn0xVuCBfwhHU9WH/rD1EbwhHlWEsibR
 lpIJmH3qhAb8OJ8uJjKNNkDGVMY4qHBvAgZHNAfrOsE6CJX5RWhpy06DiHplAuOR6oRO
 7Wlb6yq6gILMaZQLDtKEqvy13wqaQyk2jqZUgxCmzhX8fs0q6UAx6qxV/WgE6pnwCknv
 qdt/9qzx1PKx5fjEikIbP5xIvlUJSNisi1MJ+Xw+hq1j/u/Q3JmqYurD6WBFEsY2CT84
 usZA==
X-Gm-Message-State: AOAM531K3CYOSiuEkTXsygTSCv8mYEuWBf4HraPlx+6D+/Pw3BNL6SVt
 mzZHIeXxl0ebKN5uu4T4Q+E2NEq3wOeLGA==
X-Google-Smtp-Source: ABdhPJyszbfZfZi5QVQRckglGei58etmKm12VfZZw7pd7OI+WuF1ZsWkzLYJQEcyvFfgBhRXyiKiRw==
X-Received: by 2002:ac2:5143:: with SMTP id q3mr4822681lfd.485.1641935691400; 
 Tue, 11 Jan 2022 13:14:51 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2a:6a8d:c51:3b28:285b:bcad])
 by smtp.gmail.com with ESMTPSA id u5sm1422045lja.36.2022.01.11.13.14.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jan 2022 13:14:50 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 7/7] net/vmnet: update MAINTAINERS list
Date: Wed, 12 Jan 2022 00:14:22 +0300
Message-Id: <20220111211422.21789-8-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220111211422.21789-1-yaroshchuk2000@gmail.com>
References: <20220111211422.21789-1-yaroshchuk2000@gmail.com>
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


