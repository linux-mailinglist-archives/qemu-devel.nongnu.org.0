Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DAB4AA58A
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 03:08:26 +0100 (CET)
Received: from localhost ([::1]:51472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAUz-0005Gn-DT
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 21:08:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7L-0003xS-Ac
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:44:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7G-0003NX-31
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9SAeYk6Qwn6EXatjRomDHKxEpW2B7uuJLKwuu/8IMtM=;
 b=YMuAJonMh/TdzXaToxXNMEo9DwVuQch1oZheYUozTSf9HzfP+deY9KewVAV8TFnjTxJUoQ
 gBNFcxezQmxv1t00jpKqP4bluE6TEHVqjjylNSGj3lMEQ0wGoQW1XS1fB5l4zJuh/b67KU
 NWYbvKzB25eqrB88SE/HyIdAAaTuKNY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-kG7zUz51NEmCaYVYzY_tOA-1; Fri, 04 Feb 2022 20:43:46 -0500
X-MC-Unique: kG7zUz51NEmCaYVYzY_tOA-1
Received: by mail-wr1-f71.google.com with SMTP id
 g17-20020adfa591000000b001da86c91c22so2800695wrc.5
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:43:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9SAeYk6Qwn6EXatjRomDHKxEpW2B7uuJLKwuu/8IMtM=;
 b=Veg43FL378ytjH0qa+vwXeI84HR73F0G8jiWfIK8aQSJKJTMQzQtsE4f6jCBwhkaLM
 p4akVrlhu78OvaLt9xDogLn61t54e2Y9JrQJlA7J+jWs3AdY1502Ybp5B3XTe4z/zhz/
 COWkidwXK9/2jY5iPkIRrRgoIHcvYUYeVozrNfzzXa3kvKb84XCvml/fiUTA0N9kMjUb
 8qUBaVBD4VAuM9d+KHNIHRreegeyKysVrVD2rWEmFnZJgJKUHi7ZSBzdLKTVGZrigBDN
 /Bh5unNJFCwqrVeE+woTv/VMcticPM59MSG1oAfMvSJwlp3aCwNB7FiUcmYOiuA3g79X
 1Rig==
X-Gm-Message-State: AOAM531z/vYv+4baEJ6bxh8RXKwEw83RM8xGRG7L/wZc4AoL4OAmFGJG
 WMnaGStzsyO3hMZ1vDvhWH844/mfipU5aF7LvLfR8DW5tOGuCgDAkA4K4PPhpF360/aawTXSaNG
 2rUiB9ItrLHC2R6RzZRF7CA4CRpYI+4A0yPG+mAyRMq3qa1hxzzusmpg3WTJO
X-Received: by 2002:a05:600c:38a:: with SMTP id
 w10mr4516797wmd.12.1644025424579; 
 Fri, 04 Feb 2022 17:43:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4dXgEwNpQTRUD9bVaD+xUzm836e/CqksROYUPU4zr8cKpB3G3k3/wRcYbhvHWYw4T6TaW5A==
X-Received: by 2002:a05:600c:38a:: with SMTP id
 w10mr4516774wmd.12.1644025424257; 
 Fri, 04 Feb 2022 17:43:44 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id s78sm550336wme.16.2022.02.04.17.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:43:43 -0800 (PST)
Date: Fri, 4 Feb 2022 20:43:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/32] ACPI ERST: bios-tables-test.c steps 1 and 2
Message-ID: <20220205014149.1189026-24-mst@redhat.com>
References: <20220205014149.1189026-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220205014149.1189026-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Eric DeVolder <eric.devolder@oracle.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric DeVolder <eric.devolder@oracle.com>

Following the guidelines in tests/qtest/bios-tables-test.c, this
change adds empty placeholder files per step 1 for the new ERST
table, and excludes resulting changed files in bios-tables-test-allowed-diff.h
per step 2.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <1643402289-22216-2-git-send-email-eric.devolder@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
 tests/data/acpi/microvm/ERST.pcie           | 0
 tests/data/acpi/pc/DSDT.acpierst            | 0
 tests/data/acpi/pc/ERST.acpierst            | 0
 tests/data/acpi/q35/DSDT.acpierst           | 0
 tests/data/acpi/q35/ERST.acpierst           | 0
 6 files changed, 5 insertions(+)
 create mode 100644 tests/data/acpi/microvm/ERST.pcie
 create mode 100644 tests/data/acpi/pc/DSDT.acpierst
 create mode 100644 tests/data/acpi/pc/ERST.acpierst
 create mode 100644 tests/data/acpi/q35/DSDT.acpierst
 create mode 100644 tests/data/acpi/q35/ERST.acpierst

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..603db07711 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/ERST.acpierst",
+"tests/data/acpi/q35/DSDT.acpierst",
+"tests/data/acpi/q35/ERST.acpierst",
+"tests/data/acpi/microvm/ERST.pcie",
diff --git a/tests/data/acpi/microvm/ERST.pcie b/tests/data/acpi/microvm/ERST.pcie
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/pc/ERST.acpierst b/tests/data/acpi/pc/ERST.acpierst
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/ERST.acpierst b/tests/data/acpi/q35/ERST.acpierst
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


