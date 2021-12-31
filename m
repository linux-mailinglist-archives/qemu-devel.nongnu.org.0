Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCFB48242F
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 14:28:13 +0100 (CET)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3Hx6-0001kW-F6
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 08:28:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HLJ-0006ln-QO
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:49:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HLI-0000o8-6U
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AG4y2rzxLZGbpvB29+PEEBcSZMHPBx+rIwBTw7mt+eU=;
 b=bbsCgI0S/TnwcZraEvjSz3RlGMNtlJVplTDe8FYAIt+ZyztLC2pceyIvqvRDnXHjGBojfT
 8e5FT+mx9OlBrx6b9itR8RMK4prB5VxQMIM/sKso3e/dmIN4lRPkNJe/ZXsI3pQZxcrWFD
 4o7PHVjPZuKjUiOqFpgqt8oMpqAgljo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-y5OGB7qSODaaGfNBGD3Zbg-1; Fri, 31 Dec 2021 07:49:06 -0500
X-MC-Unique: y5OGB7qSODaaGfNBGD3Zbg-1
Received: by mail-wr1-f71.google.com with SMTP id
 s23-20020adf9797000000b001a24674f0f7so7533537wrb.9
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:49:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AG4y2rzxLZGbpvB29+PEEBcSZMHPBx+rIwBTw7mt+eU=;
 b=hkZ+nrkLshbJifgbuO3zVvfHkyhjWOxSNRcU9pail4kV6AXN26wQJuOH8XN3GQyiW4
 sXqRjRrsc7dO6RXUTZBicFF7vGzvpai4JxEIhdNaCU1/qAPENRm3xUOG6WdGGuDU+hm1
 6jarWvlgJntfwP8j2UG5oasyAhI/nwiYKtj3CeomSpHNEP8G1owPZgH9Ej1ZFjQ3r7K/
 ITwFzCpJjke9EGMMiKJ4w9b+SN/PWgUhvyEH0vMOq/MRimeblLa+tow1LTA+lOYjr5Lt
 c2U0z7HDDWcIHIuoV8g5MTZfODZcTsC1I1yJIKrl+/0j4ip2LGHaI177BqavuwnJve+K
 Apbg==
X-Gm-Message-State: AOAM531rQazhezMpjsXHg8FQZ67mTu5N/1TVEbSTEkMxCNTKgG6x3Ut+
 JHU1/WJofQwkX4ev+VLEhqOjMBtI+5dYT4BhQyV/E7d1Pog6PoEfJ3uofM8W/3Cc2T4LHo6N85r
 IVb2RMTGeVeRLqlk8LqvPyXnDLGN/la26UorBwxpCVkoAWAXarSE2YSM0F7M35oB3
X-Received: by 2002:a05:600c:2059:: with SMTP id
 p25mr29424793wmg.151.1640954945227; 
 Fri, 31 Dec 2021 04:49:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx05hAnb72YWkxkRepho8vs7YnTo9QVVn0H4PymlCOSsxHLImvD4DGOKDMx1FXhptHL1jOISw==
X-Received: by 2002:a05:600c:2059:: with SMTP id
 p25mr29424781wmg.151.1640954945059; 
 Fri, 31 Dec 2021 04:49:05 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id n12sm19710271wmq.30.2021.12.31.04.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:49:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/20] tests/unit/test-smp-parse: No need to explicitly zero
 MachineClass members
Date: Fri, 31 Dec 2021 13:47:50 +0100
Message-Id: <20211231124754.1005747-17-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231124754.1005747-1-philmd@redhat.com>
References: <20211231124754.1005747-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

The default value of the MachineClass members is 0, which
means we don't have to explicitly zero them. Also the value
of "mc->smp_props.prefer_sockets" will be taken care of by
smp_parse_test(), we don't necessarily need the statement
in machine_base_class_init() either.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211228092221.21068-6-wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 331719bbc4b..72d83d1bbc9 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -523,8 +523,6 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->smp_props.prefer_sockets = true;
-
     mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
@@ -534,9 +532,6 @@ static void machine_generic_valid_class_init(ObjectClass *oc, void *data)
 
     mc->min_cpus = MIN_CPUS;
     mc->max_cpus = MAX_CPUS;
-
-    mc->smp_props.dies_supported = false;
-    mc->smp_props.clusters_supported = false;
 }
 
 static void machine_generic_invalid_class_init(ObjectClass *oc, void *data)
@@ -546,9 +541,6 @@ static void machine_generic_invalid_class_init(ObjectClass *oc, void *data)
     /* Force invalid min CPUs and max CPUs */
     mc->min_cpus = 2;
     mc->max_cpus = 511;
-
-    mc->smp_props.dies_supported = false;
-    mc->smp_props.clusters_supported = false;
 }
 
 static void machine_with_dies_class_init(ObjectClass *oc, void *data)
@@ -559,7 +551,6 @@ static void machine_with_dies_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = MAX_CPUS;
 
     mc->smp_props.dies_supported = true;
-    mc->smp_props.clusters_supported = false;
 }
 
 static void machine_with_clusters_class_init(ObjectClass *oc, void *data)
@@ -570,7 +561,6 @@ static void machine_with_clusters_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = MAX_CPUS;
 
     mc->smp_props.clusters_supported = true;
-    mc->smp_props.dies_supported = false;
 }
 
 static void test_generic_valid(const void *opaque)
-- 
2.33.1


