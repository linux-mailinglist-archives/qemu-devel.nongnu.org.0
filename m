Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673F148DD02
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:37:18 +0100 (CET)
Received: from localhost ([::1]:34226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n842H-0006np-GR
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:37:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n83oc-0008HJ-Vh
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:23:11 -0500
Received: from [2a00:1450:4864:20::12e] (port=43770
 helo=mail-lf1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n83ob-0000sB-DK
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:23:10 -0500
Received: by mail-lf1-x12e.google.com with SMTP id x22so21908672lfd.10
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 09:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p2gnUwNfw1uWA7+UrRHBeWryvsdGYUBFZO3s0gh3LZQ=;
 b=XWw0b/bYCVrozhSlZAysQLPZ21e8i/vu46hiRxjj4juzZYmuuwEtLTkuA8H/BumaUX
 pza/Q5rtGyKpy6E1UfjFeygUOaku7k9GHvkCRvSaklAkGv7U8xLiOc3MxUcUumggebbe
 JaHq5zatvHgZX90Cj8GnMjUFvofI2gVMHeC/QC4nk3EpYqMBBW6rCS/bdHyySi4m4uAf
 QKQ9eQ751b9Gdzze/SHVN/HgH+/SqqfzY3xkViViOyMNXlLGcSxkYy7a/Puac/HHB9n6
 2MuDUr4SrVTILLn2aJW4xhjEvg9zGpizKdF48MNwF6veUJofa+CLcgDkf2Ouwg8VzyVl
 fquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p2gnUwNfw1uWA7+UrRHBeWryvsdGYUBFZO3s0gh3LZQ=;
 b=GzcxUYLEOJfwgTXDqrzPv4mpRsGC8nJMSCvLY4HH85DbCsN35wsX8iP7N3R++BZtmo
 mv6g3ZhIYecpR3EG8Qy8XOLaIY5Q71aIo+kVbMucwlSHdFcud/3AQv3npeu1Y6ySwhlA
 UbqsVz+kj6xAfFhIODjnGIWf6kr6XJaLdS7ZwPomo5zJPzkK1uk8X5UF/cKBGo4q+dBm
 0f3n2B+rjx7GbYVnduOoEH9cXlfQHRb3H8qfFcKO7nLXrQdQFMHa1qlEkk5xUkMPhwwN
 o5449W+AiBR+/4u3o4IMWTbHu2DHMEZs3zYoPY1grsPyHqifEMmNmkatzPLZ9gR3T/+W
 2fJw==
X-Gm-Message-State: AOAM533j2aSh4YR6THC+FsxHl59+C4nIkqjJmP3edq8WlynwlRYz623U
 j7zf50gqrgSMW6/9ZzXXJ976rbf4S2tWNJ9I
X-Google-Smtp-Source: ABdhPJwh/vgZi4Zmq3uRJQmPMb+ksGOfAHGGnAX4QV2QNyJMQgiqaixmFL+x+doU0G/fAl6D+64scw==
X-Received: by 2002:a05:651c:4cc:: with SMTP id
 e12mr3622564lji.310.1642094587615; 
 Thu, 13 Jan 2022 09:23:07 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id h17sm323410ljk.41.2022.01.13.09.23.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jan 2022 09:23:07 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 7/7] net/vmnet: update MAINTAINERS list
Date: Thu, 13 Jan 2022 20:22:19 +0300
Message-Id: <20220113172219.66372-8-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
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
Cc: peter.maydell@linaro.org, Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>,
 alex.bennee@linaro.org, jasowang@redhat.com, phillip.ennen@gmail.com,
 armbru@redhat.com, dirty@apple.com, f4bug@amsat.org, roman@roolebo.dev,
 r.bolshakov@yadro.com, agraf@csgraf.de, phillip@axleos.com,
 akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 qemu_oss@crudebyte.com, eblake@redhat.com, kraxel@redhat.com
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


