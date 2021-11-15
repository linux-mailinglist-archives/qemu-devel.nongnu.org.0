Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451A34509D6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:40:23 +0100 (CET)
Received: from localhost ([::1]:37936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmf1q-0004nI-CR
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:40:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmezu-0001s8-16
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmezs-0005Dd-6B
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7LKzhPmlwv3YmOh8UQfZKtlFJjRhICzQOr6bT4AaevY=;
 b=Y6Khm4IpK4wYQ/xOs45T9Z4tsFDCgaJYceWV7vkYB+Zxhgdhot4zw4KbVXdRsJ9RWeD6Ku
 1XEPdIfYLfmy+VGVaThPkyLEW2zUYULVHiiLu8HVQSc/zJzT06Cg9Eg7e2Hxu8L02Fqcs6
 15mTVafw38RGGW4dZzOg3dxXF+/vSvQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-da9gyuvcM7SnOE7GfsXuGw-1; Mon, 15 Nov 2021 11:38:18 -0500
X-MC-Unique: da9gyuvcM7SnOE7GfsXuGw-1
Received: by mail-ed1-f71.google.com with SMTP id
 c1-20020aa7c741000000b003e7bf1da4bcso3255469eds.21
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7LKzhPmlwv3YmOh8UQfZKtlFJjRhICzQOr6bT4AaevY=;
 b=ZYC9SlyTreLUx3jiRhQfMfH+IjI8eYQygmHxnrTMPv4L/BttRFhgufKAXBC5SN9J7S
 MN+6+2HN5+1TXyi5D9S7Zn4YmNqjiGaKWJjmrAnDiC7yT9rw+jmEoSy177EGCNZO7UnX
 vfcyUGofdFsx5zOeCFXDhIS1Xwb6/g/j3pklCJpAVMhyXJdysFjxB2ISoRZPPePD/YJK
 azLrydjg1n+sKkkqxq+7K1zLvtn+Kv4Ed6OSkfIZdi39qoB5tjSITqQS++4nt4/X34Oj
 fBGeY8gpXip+yquIE2GlyfgdINmCfvv+Wc5lZQh4mhMGOU3C9OkRgMvLAp8GFAz5m6Xm
 6hXA==
X-Gm-Message-State: AOAM532zAsb767kl3bycP70I17g7f+XVy6gwMEulNpG9jnjsDic/tHdX
 waXoq0UvspjGwtXmP2RtVl0OklLEROBEmf8ntFly0LPrlx1q8hweqnPbGVUn5Y1MtcU9dP+s0VH
 4ObHBBnx7QDEdXnhxRKVlUBpxKVNvdq8HI+aiBJCFstXcrRZ0VSTf816lO3/a
X-Received: by 2002:a05:6402:510b:: with SMTP id
 m11mr57318288edd.215.1636994295228; 
 Mon, 15 Nov 2021 08:38:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyeX++5K+rXXkVRoeBB6GQKwuwzFSgCLZ0SCIvhStyam1LSo2acxLV0Pj7R1F/l76jeW8m4Hg==
X-Received: by 2002:a05:6402:510b:: with SMTP id
 m11mr57318004edd.215.1636994293569; 
 Mon, 15 Nov 2021 08:38:13 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id lk22sm6906329ejb.83.2021.11.15.08.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:38:12 -0800 (PST)
Date: Mon, 15 Nov 2021 11:38:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/20] bios-tables-test: Allow changes in DSDT ACPI tables
Message-ID: <20211115163607.177432-9-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
 Julia Suvorova <jusual@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Julia Suvorova <jusual@redhat.com>

Prepare for changing the _OSC method in q35 DSDT.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20211112110857.3116853-4-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..48e5634d4b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,17 @@
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
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/DSDT.tis.tpm12",
+"tests/data/acpi/q35/DSDT.multi-bridge",
+"tests/data/acpi/q35/DSDT.ivrs",
+"tests/data/acpi/q35/DSDT.xapic",
-- 
MST


