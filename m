Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025983DF6A4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 22:54:42 +0200 (CEST)
Received: from localhost ([::1]:59152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB1Qv-00030I-1a
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 16:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mB1Oh-0000f0-Sx
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 16:52:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mB1Of-00085y-Od
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 16:52:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628023941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T2ArH9QYDpGKNNFTj8WgsUxFaYVT9AXJO9SHdTMENdg=;
 b=b2ERXist/0pirEqEIi+nBEZPqOdWXdpdWd9bohAowFqeMo90uc6L3pfVxXP/Jt9AjYIur+
 jajivuS51e8MqkNJv/NkNejYVaRv4dyzD4+mE5+7NABfNuIltQitcLlVaO7KVPrBpGhd+t
 N2MQ8XRfk7qPHy6s72waDPBj+kX8QeY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-0e9yT9HNO5KtPz_DJRaFKg-1; Tue, 03 Aug 2021 16:52:20 -0400
X-MC-Unique: 0e9yT9HNO5KtPz_DJRaFKg-1
Received: by mail-ej1-f70.google.com with SMTP id
 n9-20020a1709063789b02905854bda39fcso121933ejc.1
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 13:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T2ArH9QYDpGKNNFTj8WgsUxFaYVT9AXJO9SHdTMENdg=;
 b=IUeh2Qcd7Ey4Xf6r7aMFX/WanTkdYTX+cO5WA2ppYcGYK3KK8rF3Gw4oaLZjKE3IU7
 /Hq7pYoFGLiw3oplTDWD8NwL2R5tx1tfpCG+tSgaFraXm4MrJR3T2l8JC+21L0t4m57m
 LQ4yi1S2jKi8YnylzTNw5wfSzPvN1tHw5p+GxYn9lRymJHqSod9ewpYqlQAYLoApOr+/
 4mVgrk6oQEqiZctfHnUGGyVa8w1W+J5fCgFoqLxcKwqHCKs44iUQp/jN4D93BZs2wTuQ
 gQF9jJJ4grU5GJbJpu7bp182swVH1RZg60GnBfuMK0guJVAaL/KDOnqaiAoLGGGuYmHH
 aJbA==
X-Gm-Message-State: AOAM532uMnFxibZ1PZ1bvVMCbx4P1QysQorbhutLY8aZyyVSWy2TQ+Gn
 MRxOSlIBmS4SBudsujw/Oam9Vc2eS5yF3xr5u0hRl4RyMWvHbGbKJaYIYqM+t9TyYCiXE5lT5qi
 4DbbktLJkjOwvUSrWP+kJ6sQJrSYgkQ4kptxSw9W6jjQhruiQ7kw5ck/RHS3c
X-Received: by 2002:a05:6402:b99:: with SMTP id
 cf25mr27973109edb.130.1628023938532; 
 Tue, 03 Aug 2021 13:52:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw47g4aoQM8p5qs9YtfCeakXjmPid5HnqJWr9ZDkTW7uzyg3laa7E5KWKU2GlzyNrDX1ZK8Ow==
X-Received: by 2002:a05:6402:b99:: with SMTP id
 cf25mr27973094edb.130.1628023938349; 
 Tue, 03 Aug 2021 13:52:18 -0700 (PDT)
Received: from redhat.com ([2.55.141.248])
 by smtp.gmail.com with ESMTPSA id w6sm19660edq.58.2021.08.03.13.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 13:52:17 -0700 (PDT)
Date: Tue, 3 Aug 2021 16:52:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] Revert "acpi/gpex: Inform os to keep firmware resource map"
Message-ID: <20210803205043.165034-5-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jiahui Cen <cenjiahui@huawei.com>,
 Yubo Miao <miaoyubo@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 0cf8882fd06ba0aeb1e90fa6f23fce85504d7e14.

Which this commit, with aarch64 when using efi PCI devices with IO ports
do not work.  The reason is that EFI creates I/O port mappings below
0x1000 (in fact, at 0). However Linux, for legacy reasons, does not
support I/O ports <= 0x1000 on PCI, so the I/O assignment created by EFI
is rejected.

EFI creates the mappings primarily for itself, and up until DSM #5
started to be enforced, all PCI resource allocations that existed at
boot were ignored by Linux and recreated from scratch.

Also, the commit in question looks dubious - it seems unlikely that
Linux would fail to create a resource tree. What does
happen is that BARs get moved around, which may cause trouble in some
cases: for instance, Linux had to add special code to the EFI framebuffer
driver to copy with framebuffer BARs being relocated.

DSM #5 has a long history of debate and misinterpretation.

Link: https://lore.kernel.org/r/20210724185234.GA2265457@roeck-us.net/
Fixes: 0cf8882fd06 ("acpi/gpex: Inform os to keep firmware resource map")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-host/gpex-acpi.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 0f01f13a6e..e7e162a00a 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -112,26 +112,10 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
     UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
     ifctx = aml_if(aml_equal(aml_arg(0), UUID));
     ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(0)));
-    uint8_t byte_list[] = {
-                0x1 << 0 /* support for functions other than function 0 */ |
-                0x1 << 5 /* support for function 5 */
-                };
-    buf = aml_buffer(ARRAY_SIZE(byte_list), byte_list);
+    uint8_t byte_list[1] = {1};
+    buf = aml_buffer(1, byte_list);
     aml_append(ifctx1, aml_return(buf));
     aml_append(ifctx, ifctx1);
-
-    /*
-     * PCI Firmware Specification 3.1
-     * 4.6.5. _DSM for Ignoring PCI Boot Configurations
-     */
-    /* Arg2: Function Index: 5 */
-    ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(5)));
-    /*
-     * 0 - The operating system must not ignore the PCI configuration that
-     *     firmware has done at boot time.
-     */
-    aml_append(ifctx1, aml_return(aml_int(0)));
-    aml_append(ifctx, ifctx1);
     aml_append(method, ifctx);
 
     byte_list[0] = 0;
-- 
MST


