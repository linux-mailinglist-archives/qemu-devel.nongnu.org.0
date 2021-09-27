Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1120E419B91
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:18:54 +0200 (CEST)
Received: from localhost ([::1]:58158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuHF-0001oY-4x
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2H-0003Op-9Q
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2E-0003Il-GT
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XNDsKvAscMS2RHzun2iIZm543slpyVWUrcnGtw4rUrY=;
 b=jUrX6CBCblXZjVAO2z/6KUZ25ZDng90KBL5yL+qo1VCiWPOJ6UxkOF4fcg0w4nXDEfJ7vN
 3LCzZkder6vqYI2tMeurJiE0qV/UkZRlec0R7ghxGafmsUHV9qmJzs548WABT3OcbiW+Aa
 8kG+yVIJXCANVzAPK8zzeSOvQTlWlsQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-btHM4gcoOOCyhtGd8YfaFw-1; Mon, 27 Sep 2021 13:03:20 -0400
X-MC-Unique: btHM4gcoOOCyhtGd8YfaFw-1
Received: by mail-wm1-f72.google.com with SMTP id
 j21-20020a05600c1c1500b00300f1679e4dso461252wms.4
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XNDsKvAscMS2RHzun2iIZm543slpyVWUrcnGtw4rUrY=;
 b=apYGPF04m2ogJE5/PoUhY8HO8b141RHpaPkZoXiql0QGL3f2PULomZT9l4DVa5rhbm
 MXOQZjLMRM7BFwv4cXDSBJTq/dqS08P6ZxpW/xtrWD3+iHnYCG7fWPkHYI6Oidq/dg8S
 sU/gsgRUTgAummoMBogxGc3yluXoxBXTuF6PwLqycO209Xn6wf174s3as/6CEbCE6eX/
 GtcE7gU+eTP8ieu2OV8N5Dpq8EOrTtfOSVemmIyd2lae2M7AHahc5QNbE+qQ/ZOmdXla
 lssxqf/KCCd0nhD3xC73ow6Mcv7F5ndsw5r78/jrmLYK4SoXeK/if//oKrEnIZH24/9E
 kNeA==
X-Gm-Message-State: AOAM531fLtKyeeL1pecupGT5W2ocRAPi7VhpCOpvpo79hOUNAzB5sla9
 /CRiiVVZdte+5QhTbE0PgBjT+u99pdYRSSETNYLvBW4M3lEXfqbtDB13twcfZC7syIwW3ugZG0V
 eJaPf6lJy7XhzxWJR3RSinCbzpXURg0nGtNlU2ZXgrl3RLtj1kqQRVHlUX3m9GZrq
X-Received: by 2002:adf:e742:: with SMTP id c2mr251102wrn.18.1632762198360;
 Mon, 27 Sep 2021 10:03:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhSNGqlupuDrsuITJ488kpOwCbFYU2Adc1aVVZIz8EDu1ROfHvNkaiSnGkV6qim06FGaa2jA==
X-Received: by 2002:adf:e742:: with SMTP id c2mr251077wrn.18.1632762198150;
 Mon, 27 Sep 2021 10:03:18 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id i1sm18025916wrb.93.2021.09.27.10.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:03:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/21] avocado_qemu: explicitly return None to avoid R1710
Date: Mon, 27 Sep 2021 19:02:17 +0200
Message-Id: <20210927170227.2014482-12-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927170227.2014482-1-philmd@redhat.com>
References: <20210927170227.2014482-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Willian Rampazzo <willianr@redhat.com>

The linter is complaining the `pick_default_qemu_bin` is not explicitly
returning None. Fix it to explicitly return None and avoid R1710
inconsistent-return-statements.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210920204932.94132-6-willianr@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index c3613f92620..35318ce2a9c 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -72,6 +72,7 @@ def pick_default_qemu_bin(arch=None):
                                               qemu_bin_relative_path)
     if is_readable_executable_file(qemu_bin_from_bld_dir_path):
         return qemu_bin_from_bld_dir_path
+    return None
 
 
 def _console_interaction(test, success_message, failure_message,
-- 
2.31.1


