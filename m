Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFD8422EF1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:17:20 +0200 (CEST)
Received: from localhost ([::1]:39282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXo47-0003wT-22
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvI-000253-Ic
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvF-00072Z-NQ
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5qdBB3e2aqHCZf1beIc5KB9cT1s1yThVZMmqsQpwWFQ=;
 b=BKKOLb0fbSx74lGsnO9YddAo99XClhyCe5VpE0RMcV2zfNP0e1OyOuFbZKqW9e7IE+UERV
 HTtNf/u3rr+HmBxMak6NzE0+mAp/xzg4dt/DUH/Z1Bw/dajdn7/wGMLpfR6r/zBLjyJ9hu
 HzdM2+fWxSi8glxGDyYV/8ZzGukxO6U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-bR8vsMfKM1mNSy4Cn0L8-g-1; Tue, 05 Oct 2021 12:04:03 -0400
X-MC-Unique: bR8vsMfKM1mNSy4Cn0L8-g-1
Received: by mail-wm1-f69.google.com with SMTP id
 n5-20020a05600c3b8500b0030d78b00850so930566wms.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5qdBB3e2aqHCZf1beIc5KB9cT1s1yThVZMmqsQpwWFQ=;
 b=0xmO5MZQD7iB5MXWSU16zcDBD3giiKULOYJNUChWhJBgD7jLgx3Fk7lueVQKgEmOfx
 OC0IHUxQOWwiDGmyCC/X87DJ4X8dgKpp4PHn2Sho/kQuSZ521QLTLxihohb6ohY5SnWo
 TPXeAqdvJkw1mZV9rHbwyD0RCfVazsxLqPRxWvJgfnty/KoE4S//34kMEpNyY9tMuhkz
 jWv0x/wYgq4CMp/dptwVwCi3xGTCZb1wKLJ0l5T5RoUMMcet2Xz9MmWN+0fTJk4EsfaS
 /sN0oNAw8Nvw5NNQXQ0oECcTwQ4TZzDSfoT/JI8TG+GLCC+xCjAd2rbOYEYrV7yJpve8
 soHA==
X-Gm-Message-State: AOAM531J5hU7tH1Xxh4ycUpRBketBzsMY63Xr0pQCIZn5m8wERD6+htW
 WaFh2uf+Q3Dr/hfW5TQLWGR5jp3FK0yJbBdIMdRUN/nPgpI8TfipfTwWmNH1nBxv607RMDmm/gM
 Kwxu35LXoTh0FHg5FaUCyn5sSsOu8AJ24uKC97SbG4w+QbBxuP4zYnsjnAiRJ
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr23441112wrc.25.1633449841871; 
 Tue, 05 Oct 2021 09:04:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw92VFnOWKWtcUtjUlKeGTG14hWDNZNck+otddZIWTOnp3MA9Shltq9UgsvAIQA8UTNxILymA==
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr23441075wrc.25.1633449841644; 
 Tue, 05 Oct 2021 09:04:01 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id x17sm18155197wrc.51.2021.10.05.09.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:04:01 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:03:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 44/57] acpi: arm/virt: build_spcr: fix invalid cast
Message-ID: <20211005155946.513818-45-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

implicit cast to structure uint8_t member didn't raise error when
assigning value from incorrect enum, but when using build_append_gas()
(next patch) it will error out with (clang):
  implicit conversion from enumeration type 'AmlRegionSpace'
  to different enumeration type 'AmlAddressSpace'
fix cast error by using correct AML_AS_SYSTEM_MEMORY enum

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-31-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 8c382915a9..7b8706b305 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -465,7 +465,7 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     spcr->interface_type = 0x3;    /* ARM PL011 UART */
 
-    spcr->base_address.space_id = AML_SYSTEM_MEMORY;
+    spcr->base_address.space_id = AML_AS_SYSTEM_MEMORY;
     spcr->base_address.bit_width = 8;
     spcr->base_address.bit_offset = 0;
     spcr->base_address.access_width = 1;
-- 
MST


