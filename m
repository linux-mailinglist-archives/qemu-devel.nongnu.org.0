Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E9F3DF6AA
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 22:56:45 +0200 (CEST)
Received: from localhost ([::1]:38734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB1Su-0008IM-59
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 16:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mB1Of-0000Xa-0j
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 16:52:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mB1Ob-00083D-J6
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 16:52:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628023937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ytx1VsHr+GHgepRgy2kP+RSokzemsu2iW7Qn2KcuMSc=;
 b=Ps+AoQlL1KNQcO0+AGibJFogYHNWGaI7BnIiwVzy8gyQA0axVr0OJYaMCFwdOrc6SXlYf8
 O3oFowQbjjDSmm4If6CaQOGjVHzdiTWYVZbneRH7IdtHDCt7Usxq+a0WFZ9s8MpyTI/eKA
 7AASaEByam14lJGvepY/9qAD0lgwZ94=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-SGjmVhiMPhe1hwMT2pvufQ-1; Tue, 03 Aug 2021 16:52:15 -0400
X-MC-Unique: SGjmVhiMPhe1hwMT2pvufQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 ci25-20020a1709072679b029058e79f6c38aso102784ejc.13
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 13:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ytx1VsHr+GHgepRgy2kP+RSokzemsu2iW7Qn2KcuMSc=;
 b=ZrE6uKhYQAFyzr5Aw+Wb0kBmzEQrevzXt5y70o9xNZc1A8TGCiDycqD4+JhjFi2P6U
 l9aBRAgyMAphS5Nh2Yc5T7uC48dpqK/b5IjjBZq0m2OkyA+82oCuXUUrA5W2/IohZF8r
 RgG89rr95gvx8NM1h3bLYoeM1X/fR2/UukEISjykuJZo3lk+lYm+E/IZDdbvj4UXlUBm
 1SE3T4sGWzxXkZO7ZCbGDiAoPs9iTG67nG6TPuzmI7tZ2ik+F51wYjJqLQVEUcgq3dyo
 7mNHObJWw+3+GKMBxhsZ7czLeZkUnxWk/JYneSsfYnWUZVZrEVAdeumyPx8mddxo6TNs
 eFOA==
X-Gm-Message-State: AOAM5338AK5bJXya5h58pV5oJmhj0OwPI4T7vSBylIRYzNtF8TrHhCvv
 DNprOgrShY0yopmYjq3yzh1p8asW498VPceA0oE4q3idJXYQd5NQG/DKA53GWZp8mSKh/lvMPJY
 n1vQZ0BFbKVIGsWh+hwwBXfLXWTV4+XfjzNr+yWL+noG20n1sD7YygLVT5pZZ
X-Received: by 2002:a05:6402:274f:: with SMTP id
 z15mr28474921edd.21.1628023934560; 
 Tue, 03 Aug 2021 13:52:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxX+qPLTXj7p5xv2dpjl/Yg3BGlKXfOYnjljVpYh1M6ZrLXR16uPiJg690xHTFpcmFPhV9zow==
X-Received: by 2002:a05:6402:274f:: with SMTP id
 z15mr28474911edd.21.1628023934441; 
 Tue, 03 Aug 2021 13:52:14 -0700 (PDT)
Received: from redhat.com ([2.55.141.248])
 by smtp.gmail.com with ESMTPSA id bd24sm20310edb.56.2021.08.03.13.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 13:52:14 -0700 (PDT)
Date: Tue, 3 Aug 2021 16:52:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] arm/acpi: allow DSDT changes
Message-ID: <20210803205043.165034-4-mst@redhat.com>
References: <20210803205043.165034-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210803205043.165034-1-mst@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to commit ccee1a8140 ("acpi: Update _DSM method in expected files").
Allow changes to DSDT on ARM. Only configs with pci are
affected thus all virt variants but for microvm only the pcie variant.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..8a7fe463c5 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/DSDT",
+"tests/data/acpi/virt/DSDT.memhp",
+"tests/data/acpi/virt/DSDT.numamem",
+"tests/data/acpi/virt/DSDT.pxb",
+"tests/data/acpi/microvm/DSDT.pcie",
-- 
MST


