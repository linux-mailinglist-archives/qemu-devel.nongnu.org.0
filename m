Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF4A2D4909
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:31:57 +0100 (CET)
Received: from localhost ([::1]:38736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4Fo-0005Qp-RJ
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:31:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3sn-00025f-FJ
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3si-0007yW-Bi
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dOwz9KFzM4aITjt0PTvszOOZ0AmKV1RsHpDeoXXjql0=;
 b=OQ4nqGO17zGhRtDoSVXFUjAwo63GtrJ4MX7MbBymfKI9PGE6/nHDpQLKjeHd9N1mzJuPN/
 JlJGmNaWgcIxKYQsGPqxJQi3u2yTUGB0dq2gy4Q+5lxmtdw6b2g1WPx+SQzf7hdYs86J3R
 8W22PtV2khrewjR0pAkw1buZr9YBlr0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-OXE1hNBwMdeZyV-t4t-KqQ-1; Wed, 09 Dec 2020 13:07:59 -0500
X-MC-Unique: OXE1hNBwMdeZyV-t4t-KqQ-1
Received: by mail-wm1-f71.google.com with SMTP id k128so866286wme.7
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:07:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dOwz9KFzM4aITjt0PTvszOOZ0AmKV1RsHpDeoXXjql0=;
 b=grVuvCjuSobA3BykJvg8VCz+8dkCtL5OE6yPDPoxM85mGEtTIsxX+SuE1/dNImXVqR
 vpCM2heBgyBbJiSzLpZWqeR/eqcjziv3N4sW1FuH9eeSzebUMStAGEe+/yPQDiAwROqA
 VVCgzL3uwxz6281UD405mwgZKD+Yb46DQYGgz2LPxAbs/5X7wqbe9VoEUZ9X1B5DG7Zu
 4mZVT7ziYO405ahfkG/Jhg8Bw77zFj9RIVTzRHW2PiZpaKx5dGlJMAfKE54cdsxlgxjY
 5hipvTJCsYayVExvKExNtC4gSbkUGiGFiHn7q8XDU6nffFb7CrkvbctX5O82ZmgvKKXM
 L0Iw==
X-Gm-Message-State: AOAM531rngLu2QpZGlDTTDrqTRi3AvkTIqH/jWKQhCJChqx7XhQwTisk
 FtlYXfCIcAxVGh2IiOFv9FGvTtD2LOIsE3hJ0OEFJPa5hU7n32btb3yqKrjnQdWkcT8gaYbK5QB
 Ryqq/3qS8tJqiFDCOY1gHqmO8K0MSBfZ2KFbxTKYu2Jq1z3mCzbONcLIpXtcv
X-Received: by 2002:adf:ba91:: with SMTP id p17mr4038563wrg.328.1607537277597; 
 Wed, 09 Dec 2020 10:07:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcLOTrqr1bmLw06b2uJrHEhDDL6+wLnOt5fBMh+QxLAV6MhqUMocLbZtDZXvBm34TFFJLuhQ==
X-Received: by 2002:adf:ba91:: with SMTP id p17mr4038543wrg.328.1607537277418; 
 Wed, 09 Dec 2020 10:07:57 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id d191sm4959865wmd.24.2020.12.09.10.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:07:56 -0800 (PST)
Date: Wed, 9 Dec 2020 13:07:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 16/65] unit-test: Add the binary file and clear diff.h
Message-ID: <20201209180546.721296-17-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Yubo Miao <miaoyubo@huawei.com>,
 Jiahui Cen <cenjiahui@huawei.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yubo Miao <miaoyubo@huawei.com>

Add the binary file DSDT.pxb and clear bios-tables-test-allowed-diff.h

Signed-off-by: Yubo Miao <miaoyubo@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Message-Id: <20201119014841.7298-10-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/virt/DSDT.pxb               | Bin 0 -> 7802 bytes
 2 files changed, 1 deletion(-)
 create mode 100644 tests/data/acpi/virt/DSDT.pxb

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 90c53925fc..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/DSDT.pxb",
diff --git a/tests/data/acpi/virt/DSDT.pxb b/tests/data/acpi/virt/DSDT.pxb
new file mode 100644
index 0000000000000000000000000000000000000000..d5f0533a02d62bc2ae2db9b9de9484e5c06652fe
GIT binary patch
literal 7802
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
ATL1t6

literal 0
HcmV?d00001

-- 
MST


