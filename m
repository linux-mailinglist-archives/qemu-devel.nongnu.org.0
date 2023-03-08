Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8730C6AFC01
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:16:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiMX-0007SC-NW; Tue, 07 Mar 2023 20:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMU-0007Eq-Ey
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMS-0001hN-L4
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fBOKE0cyKeoFLUCat4Ux/9uXF2e8CfWnWBPumDi1QW0=;
 b=S0WBTiVngCPumCtH+HGV0HNY2D6wxz9RL1VjOt3E5ZljbG8JKIc/JBXoRtyqfwh4DYYv50
 RDhPoEpRtM3CN3lREmWDA7CEp0iFg1CWvy/TYVXVZmPDzG74CqpzlPxLBrys8E5Ra4mbXC
 kG4+PvoIGfl1bw9MzKhD0PO4b24DSmE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-2OrRgSVwM-aLcMeppOJ1qQ-1; Tue, 07 Mar 2023 20:12:54 -0500
X-MC-Unique: 2OrRgSVwM-aLcMeppOJ1qQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 dn8-20020a05640222e800b004bd35dd76a9so21591149edb.13
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237969;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fBOKE0cyKeoFLUCat4Ux/9uXF2e8CfWnWBPumDi1QW0=;
 b=Bqhon6sr3ZHSxVlmMKhdBkogmHZQIpTWQnE5E8gz3nDIGPrk2hdkmdwWUYOlm6CLxA
 qttPYmrbDz+DCJckK1/sQic9ZtQPtVa9yjghpWuhexHQ0aXQIGBdkZOJbQvefHeVZeBQ
 izDaA3VJ8nfCcZDTtMWHMScaJhSdd9RWJ5tchOK8SRDbccAyg7lxLVySd1Y0IcVtLYC5
 /sSBkyVxSQBRhGHWjqkA08a/E+6VNhDM3aTy9ZFSmI70eDoVhqxmQBxRsix2L/fbqR3B
 hnaSHK016a9a0j/76Gjw70TgG5vah/+hgu5w/oAT0RXXbiYv9hSJqdYM0ARsA8+UB2yD
 g1gQ==
X-Gm-Message-State: AO0yUKVIG2kqxaBZ6GhEZM8aWmKv/rsfb+b86BT2NFLT0YxJuPnTl3uL
 0xTxsRIkvuxYXg+XAh1LX4KctX+0eqWej+f5xP3FkWYsh48xvMAJCeImhR8IBovNqzuS8+7j+f4
 qZYJ+hQQaekTmDLemH9ntTv7qUzQa1qJ1zi5BOvhb1DsX+b7naZ2TA6qB7Qc1qgO9AO/S
X-Received: by 2002:a17:907:98a3:b0:88a:1ea9:a5ea with SMTP id
 ju3-20020a17090798a300b0088a1ea9a5eamr16381451ejc.65.1678237969375; 
 Tue, 07 Mar 2023 17:12:49 -0800 (PST)
X-Google-Smtp-Source: AK7set/3g5eov8WEfQWyJVqOA2REqhGYL8Yi00FAtuBP5D8wCndj/zwEEWBlUcxw9o7RLnUHPqOpLQ==
X-Received: by 2002:a17:907:98a3:b0:88a:1ea9:a5ea with SMTP id
 ju3-20020a17090798a300b0088a1ea9a5eamr16381441ejc.65.1678237969087; 
 Tue, 07 Mar 2023 17:12:49 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 bi23-20020a170906a25700b008d356cafaedsm6739807ejb.40.2023.03.07.17.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:48 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 39/73] tests: acpi: whitelist DSDT blobs before isolating PCI
 _DSM func 0 prolog
Message-ID: <bd95cd5323293091d2edb168a8571f06aae40a4a.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-14-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 35 +++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..7e7745db39 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,36 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.nohpet",
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.roothp",
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.acpierst",
+"tests/data/acpi/q35/DSDT.acpihmat",
+"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
+"tests/data/acpi/q35/DSDT.applesmc",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.core-count2",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.cxl",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.ipmismbus",
+"tests/data/acpi/q35/DSDT.ivrs",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.multi-bridge",
+"tests/data/acpi/q35/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.pvpanic-isa",
+"tests/data/acpi/q35/DSDT.tis.tpm12",
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/DSDT.viot",
+"tests/data/acpi/q35/DSDT.xapic",
-- 
MST


