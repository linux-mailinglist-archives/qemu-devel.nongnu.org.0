Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5FE3C79B3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:32:18 +0200 (CEST)
Received: from localhost ([::1]:42636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qwr-0000wG-Hk
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QeI-0004ZS-Vl
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:13:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QeH-0001Ft-Dv
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rnZmrpdt3JApfVreMKFcNarnw8Jq+7AjA6w24KOMdJg=;
 b=A3W4bO3kzhBFhda4cz/GicrtJ5UiAByZmr4+Wr/V9csKWxJqSUNAcA+Tl5z+Izo3d7OSmK
 dZlZSljOJLKwwz1+uxUbqRBIM/erSmiOFzcVqLeID2tQMDGQ+QQ66P7ro1wmvd1IWtP47b
 kdoxGpJE5TelIkQCHbyTlDLO35KxOjQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-wGJlETSbMGWEQRnkywzYuQ-1; Tue, 13 Jul 2021 18:10:20 -0400
X-MC-Unique: wGJlETSbMGWEQRnkywzYuQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 y6-20020a7bc1860000b0290227b53c7cefso154069wmi.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rnZmrpdt3JApfVreMKFcNarnw8Jq+7AjA6w24KOMdJg=;
 b=QU3e10yOGvsSlA1128WsstfyJxSE+82xkl/AFkfadFoRc3ov3XLEKtrBZI30RRLpnu
 t7oW8O6aPZ1rEvnFoGl5f2AvCk86Afl8PfFLoy52UglceWP0OfOrBMzc3BZyvyKVrBNV
 NhBoteMKyllRA2lg6evTBjIK4Bp+NNwL07O3FwFZoh3lTDNHjMHtNq5TqOEijSfoD6aa
 He/+BrnMOrCxxdtCvMAGtBnnrrKuCN5fUVl1LJ+EQaMhAPSLh+cFWWQ8U+KYEFxCOZ/E
 TkDRNDgF8PjHp6UIZbZmhLCNDrd1YV4hfw+UssfNt4SlTC+kU/sBthiA/N4CGichERgJ
 2mMQ==
X-Gm-Message-State: AOAM5313CgFB4cmHprfGfbzTL9U21o+OipIcoU/+FYVwM2vlZwFmfvSi
 Ym2G1z2rtsyrzJ+pV+azfBzeson1tGWxYyGb+/+yEzFxuF/fC8HWUsvIqf1SVvyv1V2wc0cqdsM
 kizOzTphthl7dS46RwZH9pPl3bxcQuspP6V7tiKgQ35AUJBHIYfkfzX2L9uqY
X-Received: by 2002:adf:c5d2:: with SMTP id v18mr8527894wrg.386.1626214219478; 
 Tue, 13 Jul 2021 15:10:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdzz3bEUOywHFnqb/VTv9et5wSKLMkC4N26VJuhjg3hFNr7Nfag3flL1TPknrB4EkXEKsqxQ==
X-Received: by 2002:adf:c5d2:: with SMTP id v18mr8527882wrg.386.1626214219317; 
 Tue, 13 Jul 2021 15:10:19 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id l24sm3452028wmi.30.2021.07.13.15.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:10:18 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:10:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/23] bios-tables-test: Allow changes in DSDT ACPI tables
Message-ID: <20210713220946.212562-5-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Julia Suvorova <jusual@redhat.com>

All DSDT Q35 tables will be modified because ACPI hot-plug is enabled
by default.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-Id: <20210713004205.775386-5-jusual@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..c5167f48af 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,12 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.tis",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.acpihmat",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.nohpet",
-- 
MST


