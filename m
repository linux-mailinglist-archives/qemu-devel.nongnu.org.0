Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2462422E97
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:58:56 +0200 (CEST)
Received: from localhost ([::1]:34962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnmJ-0005JA-R5
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmve-0002NF-AJ
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvc-0007Mo-No
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bUAeVkPkH7/rxBBxuqaE+VtjPUbGqfvU4B5RRV+zUrM=;
 b=G0eGibIgp4JHnhpFTeHzGTa5BtXd/lurQc4rFG1+/LbnhbZjl39MqC3EmjnFLnZUqxB+f3
 Dxqi+17tYuuedfWT7WCvOYsU2PuPtfI1zVWv900lru15vp6x+4ERifFV1w3B/0kk2iHnfv
 6BXon7qCxKkNbWvajz06u32KhxZa+g0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-dTt4Cu-tMH-myaJh5-Uu8Q-1; Tue, 05 Oct 2021 12:04:26 -0400
X-MC-Unique: dTt4Cu-tMH-myaJh5-Uu8Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 r16-20020adfb1d0000000b00160bf8972ceso455415wra.13
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bUAeVkPkH7/rxBBxuqaE+VtjPUbGqfvU4B5RRV+zUrM=;
 b=tJnKH+cXm8GqbbGC8DORVP3mYnEd7/uNdoMUlOR4yVvVif6M+2XouXgr8ZPrB38UC+
 jO3BqTMrZ/G+D1K8IkwwbeV56ztoOlC2CtwLcWLNziBFsCNr3hGBJd2TY4JS0i6PGTdT
 Pty4+Jd3vXfRwwx6cbQR9Jkh59z6cZHLfjA3GrqFQGi+a4SwNpDseSnzYA/UodqnQMUc
 uGTpCcx+l7ezZ5NVv53C0Iino8lPfcBQQOeWoS2wjgV5qDf24YyU1w8MUQIyW1i5DWU3
 mRj8yJg/4cav250Jz7RtC/6HumNDw9GkmkqJZ8SuAHYitEG/S+4PBcgCGX9/aYe3ipR7
 FULA==
X-Gm-Message-State: AOAM530OH1UOmOTrbu2qu88GVoJoK+NqhtgcK77j7l17wUPnGFWCinnJ
 EePDwSHOO06OzpYY2DTjEAQ76i9DrnZXRzXxla+t4LoMHjTAz6NTkq3XWE6cZflDTSlmyzLA3AX
 W1zqpbVR/ehLfVad1o6pWfhNT24aYaQjfYIg54ajre27JyvGMgWVpoLavR84Q
X-Received: by 2002:a1c:2089:: with SMTP id g131mr4366653wmg.192.1633449865204; 
 Tue, 05 Oct 2021 09:04:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2ctP6i4oN92FysQeRaq6ZHrn/hho96VNgiG0U1dEY0cg8q0r2vNr/o+dSResqi2Mhyv0L3w==
X-Received: by 2002:a1c:2089:: with SMTP id g131mr4366616wmg.192.1633449864878; 
 Tue, 05 Oct 2021 09:04:24 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id 73sm2438711wmb.40.2021.10.05.09.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:04:24 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:04:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 50/57] bios-tables-test: allow changes in DSDT ACPI tables for
 q35
Message-ID: <20211005155946.513818-51-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

We are going to commit a change to fix IO address range allocated for acpi pci
hotplug in q35. This affects DSDT tables. This change allows DSDT table
modification so that unit tests are not broken.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210916132838.3469580-2-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..c06da38af3 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,13 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.tis.tpm12",
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.acpihmat",
-- 
MST


