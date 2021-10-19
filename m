Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECDC43349E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:24:51 +0200 (CEST)
Received: from localhost ([::1]:48282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnEg-0005kD-PU
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcn9v-0008Lg-91
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:19:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcn9s-0001kH-Ho
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:19:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8l2qJYP9VLojED18WIThA5ayhCuizkU4T6ELRj0TeQo=;
 b=HIdeWfEPU3afRvSx5O3Ld92l25gTrxhuiLIr6HrSJOaaBY/+mCM19G0k185TkMQ+tyQp9u
 /W2q/MZgRtH1c/WckFyBNZItH865ZSnKphuw5XWWrpF/MYa1XjODtdJ6LaKk2NCle649GD
 O2ivZAtQEfnVnYXd2K+egOQeB9xiVMc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-HELLbFHlNyiub_2oeQKUkQ-1; Tue, 19 Oct 2021 07:19:50 -0400
X-MC-Unique: HELLbFHlNyiub_2oeQKUkQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 x5-20020a50f185000000b003db0f796903so17263885edl.18
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8l2qJYP9VLojED18WIThA5ayhCuizkU4T6ELRj0TeQo=;
 b=kzW1OAJv8jNOV+n4suF7rQX+If3prYfYAburD7OVALmM4dyk51Vmca/lJZafln5Uw1
 4qUjSpJeoax8L6PlrEYVc+fDVqrZnTmjXUqOqrdXYlfpltsZMDLVgcD53bqNJyA6T+to
 ueTaMNDs7CFVdpStHLiWpOE+jtQa85UkGjQov4AC1+dMh7vFNlegIyDlSDDqwk9cj9rs
 Js0gxNSCJXoZX/DT5V+DIvKlRgZ2iS2tkaEZyITYMxHZoWuEWL+7IVJyWozeuWNamw9B
 FaYMC5UWJqEgSAqKkbQg7uu2/KBK8orUquD5e2unE4JC7Q6+/tsjDlzLRBCKMHDMVT+t
 RRig==
X-Gm-Message-State: AOAM533Wrn995b6Wk7NxNseUFjIOracysjU+qu4IA07h0aYCfxaNxfbj
 JS1tmpk4ngB9Kp3F4TqBS5SEDShl2wJa0QCMIMRqkNWuXawTjhmfP3JZ7RzwJ4k20QC7yoAl64z
 YcEErbenevG1ndtxROqEt0Um7K+qDqBUzz62ALl+340ZpJjparxDnzEOejpmv
X-Received: by 2002:a05:6402:95c:: with SMTP id
 h28mr52979797edz.141.1634642389288; 
 Tue, 19 Oct 2021 04:19:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzs0c/TqVk99JNgbFD5yOIrDajGoE4nhIj5gFwFGbQcy5y9D+JzSKYUB5lqf+fS91XOt6X/5A==
X-Received: by 2002:a05:6402:95c:: with SMTP id
 h28mr52979759edz.141.1634642389062; 
 Tue, 19 Oct 2021 04:19:49 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id e30sm10182688ejl.117.2021.10.19.04.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:19:48 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:19:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/29] tests: acpi: whitelist expected tables for
 acpi/q35/xapic testcase
Message-ID: <20211019111923.679826-4-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-4-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 tests/data/acpi/q35/APIC.xapic              | 0
 tests/data/acpi/q35/DSDT.xapic              | 0
 tests/data/acpi/q35/FACP.xapic              | 0
 tests/data/acpi/q35/SRAT.xapic              | 0
 5 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/q35/APIC.xapic
 create mode 100644 tests/data/acpi/q35/DSDT.xapic
 create mode 100644 tests/data/acpi/q35/FACP.xapic
 create mode 100644 tests/data/acpi/q35/SRAT.xapic

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..344eee3acc 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.xapic",
+"tests/data/acpi/q35/SRAT.xapic",
+"tests/data/acpi/q35/FACP.xapic",
+"tests/data/acpi/q35/APIC.xapic",
diff --git a/tests/data/acpi/q35/APIC.xapic b/tests/data/acpi/q35/APIC.xapic
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/DSDT.xapic b/tests/data/acpi/q35/DSDT.xapic
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/FACP.xapic b/tests/data/acpi/q35/FACP.xapic
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/SRAT.xapic b/tests/data/acpi/q35/SRAT.xapic
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


