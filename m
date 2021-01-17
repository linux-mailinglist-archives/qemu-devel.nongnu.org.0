Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FA52F921F
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 12:51:42 +0100 (CET)
Received: from localhost ([::1]:50590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l16ar-0003Mz-Jw
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 06:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16Vs-0001WC-6k
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16Vp-0008Bm-MV
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610883989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qs7ogMByT0cgmdesR1LdPto4mpNAsIOhgrB6/0e9rnI=;
 b=VHFM/jSb9jRvKR0tfNAb1OYJcz0/0aVyAvruLCOFrRV1Qc8ujGrQVwR4Qz7gcmtpAVLKso
 fjOJZ/Sbmz5mg+C3g2jJphNvXC7oY8UM4NNgH6sZhhFAG5nBMy4oWNxI1gPP8dobmUnk48
 WsFEvPOdYa+atHW6c8zsjDyecwT40eY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-V44mx7w3M6q2Zv15s32RQQ-1; Sun, 17 Jan 2021 06:46:27 -0500
X-MC-Unique: V44mx7w3M6q2Zv15s32RQQ-1
Received: by mail-wr1-f72.google.com with SMTP id b8so6770462wrv.14
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 03:46:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qs7ogMByT0cgmdesR1LdPto4mpNAsIOhgrB6/0e9rnI=;
 b=g5n2V9WosbCxkTvwN1vvOg/3IznCWFiw11947Ju6w06atKgbia04gT86WfN05Z4i7H
 YqF5M1H/+cQ4T0Xa4+B0GKGFUV737YjsnRj3KQRcSnIfVxw9VkAqqJ79FZgesgMRjkSG
 0fiiYYZNj/ftf0oYvnQjeBWHm1nQ3nu1FXixmNdmhxkF4cvCJ1Wnivnfirfqx4yb2rVw
 vRlqBSmXb96/1OncvoLgA82wmSxyNsmnmmxtWwfrnfbkXjD0RiLJ9+WTuYGNsPF5lpB2
 UzJpEcNONLTH25FlEKvJ2DzLRPm/yU7WSjYPp9tOOPRZzzpEU2bR4RtcNPmtw0X4M0NN
 IZpw==
X-Gm-Message-State: AOAM531Gau8ENt+IK+SJqk+omkFlaPwCoM+kanrf2QOqBV7WcSnJytop
 qpkRNU9XPchsKuQp+JJvcKNZR2g1hwyqbp89RTnKXXCnppBiZB0WyI7eNad4gynNEUS0C4o8LyD
 zzaNCWaWtFMjvgzPv1A3z8RyoXIisqKr+regqkEZWZnmavmwKry3GLEgBNrpL
X-Received: by 2002:a1c:2155:: with SMTP id h82mr16346442wmh.132.1610883985634; 
 Sun, 17 Jan 2021 03:46:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz72L8QUuPCDGLBWF4EGSv0o1wptbruzZxfMiQO3E+/sqIitMNvl0dvIwBJfe5HEb2jbthvDQ==
X-Received: by 2002:a1c:2155:: with SMTP id h82mr16346433wmh.132.1610883985484; 
 Sun, 17 Jan 2021 03:46:25 -0800 (PST)
Received: from redhat.com (bzq-79-176-30-58.red.bezeqint.net. [79.176.30.58])
 by smtp.gmail.com with ESMTPSA id
 w1sm23392739wrr.84.2021.01.17.03.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 03:46:24 -0800 (PST)
Date: Sun, 17 Jan 2021 06:46:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/10] acpi: Allow DSDT acpi table changes
Message-ID: <20210117114519.539647-4-mst@redhat.com>
References: <20210117114519.539647-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210117114519.539647-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jiahui Cen <cenjiahui@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiahui Cen <cenjiahui@huawei.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Message-Id: <20210114100643.10617-2-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..42418e58e7 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/microvm/DSDT.pcie",
+"tests/data/acpi/virt/DSDT",
+"tests/data/acpi/virt/DSDT.memhp",
+"tests/data/acpi/virt/DSDT.numamem",
+"tests/data/acpi/virt/DSDT.pxb",
-- 
MST


