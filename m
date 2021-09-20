Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818EA410FA9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 08:52:34 +0200 (CEST)
Received: from localhost ([::1]:37924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSDAH-0000hl-1n
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 02:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mSD5Z-0001JF-Km
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:47:41 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:38592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mSD5W-0001RN-P6
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:47:41 -0400
Received: by mail-pf1-x432.google.com with SMTP id y4so13788901pfe.5
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 23:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZqOI00YgAVbzq7q0f0mJtlxPl1PXjwFKjxqTxxXLNaI=;
 b=J6lFcCyoqEw8AmL7O7JVH0Hd5qu99Qp5ZTQ4tY8FXNHUz4wHa5+c263GCqV352iLXN
 YEgTrsji2tyj84isK9ghET0CjJWLk8cJb+UOuKFKugGnOKLfNlyCzUQFFH+o0qD1eEuK
 /KXe84V4cVzWz++7S1Dk1x0ukhNJXqViL36ggassMCWz3P4EGPi8dcuZxGdSjuOcsvJK
 XOjE8HpTrsKOXW7sGpurQGoEGht5Pt0mRwP/k/ycD5uMy2jTqNps8BvnvoL46/QK3Nz1
 vYapltKG+n+Kz+M9h7COGe/fsyfx6e+VdXvJmw+TZg3AJvP0mRvGOtqC2saBndhn2bJR
 1umQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZqOI00YgAVbzq7q0f0mJtlxPl1PXjwFKjxqTxxXLNaI=;
 b=Yg1mpP4P8kT/qQP/0Q/jlkvK199eo1Cbd5DVuwA+4H4knj4ZcQsbXF2W1ei6ufOt/m
 GaPBRC2GaN11ty/+XZzFvqkM0wkUZJ+sflPcVZXw+ozo2udUTKVef6v8glte0mWt+bKL
 AYh0uH0Yn4vzQGbinfmqC1+U6oleuwgMl0+wxqhibao5ygkcjdPk6zw7MQwI2Dob8Z1j
 5Bqb1H3C/7YjDjHNMlLNNPlVO/DrLASpty0ZlUYzLUvyNokl+cDqj56eYeiiue5bNFb0
 3eo9dMoFt6cEfjlW7MvklgGy7nT9TE4oxWUGKRq4kWogG64KwrE8J1rf6Y8YAjJEaPae
 ufTw==
X-Gm-Message-State: AOAM5309ffth619iFtY2p2U6IRHd+Sl/rFMxLXB2UwHlXM9FB6YhQMbM
 jcg+c86/0kuhGpRlA6Z+zktzRrKGF984eg==
X-Google-Smtp-Source: ABdhPJyud5CL/sX+T7VyEPGqhBzNU9+VkM8+2XhqgVMdf37DcfnuEz1gFnEVpE1oHYLzyTv+vp9zVQ==
X-Received: by 2002:aa7:9542:0:b0:434:5a64:bc8 with SMTP id
 w2-20020aa79542000000b004345a640bc8mr23506254pfq.30.1632120457055; 
 Sun, 19 Sep 2021 23:47:37 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.109.20])
 by smtp.googlemail.com with ESMTPSA id u24sm13400752pfm.85.2021.09.19.23.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 23:47:36 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] tests/acpi/bios-tables-test: update DSDT blob for
 multifunction bridge test
Date: Mon, 20 Sep 2021 12:16:33 +0530
Message-Id: <20210920064633.3936409-4-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920064633.3936409-1-ani@anisinha.ca>
References: <20210920064633.3936409-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x432.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, LOTS_OF_MONEY=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We added a new unit test for testing acpi hotplug on multifunction bridges in
q35 machines. Here, we update the DSDT table gloden master blob for this unit
test.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 0 -> 8435 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 2 files changed, 1 deletion(-)

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..a6565acc5cc390826f4ac23585912f9cf1d9acb9 100644
GIT binary patch
literal 8435
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

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dabc024f53..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.multi-bridge",
-- 
2.25.1


