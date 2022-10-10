Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9102E5FA3D9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:59:23 +0200 (CEST)
Received: from localhost ([::1]:41782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxzm-0006e4-FB
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdz-0005Jt-0i
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdu-0007g6-8D
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PdDcqo/vteTiMjRxJUlBBydYcyovYfp9We8szNh6y9w=;
 b=X8nuKlP5y0RbCqqBB9rFcuUUBf/nY7O4srlirKQSeXTff7vH9yEToDOWmt2L/dXZfXNcVl
 fpTXpEe3QXgJ2W8deihgpwkZYELIA7dSKzH0TYEa7j7BA3EocGgLXT2ykvyl1iCFhRkaI/
 o3qwi3IrRhn6zx8XyFlCNMd4j1ffyMs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-449-iknCpxTJMvSbn14tGHYykQ-1; Mon, 10 Oct 2022 13:32:40 -0400
X-MC-Unique: iknCpxTJMvSbn14tGHYykQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r132-20020a1c448a000000b003c3a87d8abdso4388441wma.2
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PdDcqo/vteTiMjRxJUlBBydYcyovYfp9We8szNh6y9w=;
 b=IQ5Q+8oCCbwpbSA80tLqC7W0vsGXCV0tZVmahgZDKeIKX3X6KrM03d+QiBT/0igZG8
 YMJ9L/bEeLDzBMhvBmiRUJSYHLnW4AsHQmx2EBT+b2WLQQcPQLjj7R/QUunFgTCHijbr
 Ug+fhuTm6DXm8WV/Imsfl1J/A1/oJ53NA/JOxO2GqR4Rh28XW3KsZAppus8KA+bKJ2v7
 z2aNCaJcyXojHT9bjPCSjfCKOv72oEw2pb/PnTOh0ymo1K+arieMGVE+DuNuhxt7Pztq
 3ZkhEZs6Ieok4CZnUhKIh5r74aqsrkPhv6HG2p3rdzx5Z6I7eBu+CNJawaDDw3CQLYl9
 LEMw==
X-Gm-Message-State: ACrzQf35ZqvlMYNB6gY9O4qiAj+jZk9clJ2FQIDUm3dWblQNUWahn0F3
 5O0wNMa+jx0Uq2nCWBcKkebVFVcVQXVZTFSx8ZrjuMNd6hPXEPbhX+/AM6dOfEBRBLUCyLGKV3y
 2geKSm4Mjcodl+PxDEVzEAzyqEr5+unkQmO782jQH9/Y9pU4cW//w+7IB4Y7p
X-Received: by 2002:a05:600c:1906:b0:3b4:c979:e686 with SMTP id
 j6-20020a05600c190600b003b4c979e686mr13867628wmq.107.1665423159228; 
 Mon, 10 Oct 2022 10:32:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5rxTJDAWzhsqpiq6rNAeeO+5QGde/0/xBmACJ+AOlqazmEJXXJ8/TcZ/DRdNpj81zZUn6iWA==
X-Received: by 2002:a05:600c:1906:b0:3b4:c979:e686 with SMTP id
 j6-20020a05600c190600b003b4c979e686mr13867597wmq.107.1665423158867; 
 Mon, 10 Oct 2022 10:32:38 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 c18-20020adfed92000000b0022e2c38f8basm9516064wro.14.2022.10.10.10.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:32:38 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:32:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 53/55] x86: pci: acpi: reorder Device's _DSM method
Message-ID: <20221010172813.204597-54-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

align _DSM method in empty slot descriptor with
a populated slot position.
Expected change:
  +            Device (SE8)
  +            {
  +                Name (_ADR, 0x001D0000)  // _ADR: Address
  +                Name (ASUN, 0x1D)
                   Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                   {
                       Local0 = Package (0x02)
                           {
                               BSEL,
                               ASUN
                           }
                       Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
                   }
  -            }

  -            Device (SE8)
  -            {
  -                Name (_ADR, 0x001D0000)  // _ADR: Address
  -                Name (ASUN, 0x1D)
                   Name (_SUN, 0x1D)  // _SUN: Slot User Number
                   Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                   {
                       PCEJ (BSEL, _SUN)
                   }
  +            }

i.e. put _DSM right after ASUN, with _SUN/_EJ0 following it.

that will eliminate contextual changes (causing test failures)
when follow up patches merge code generating populated and empty
slots descriptors.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220701133515.137890-16-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 6342467af4..fc23cb08c3 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -444,15 +444,13 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
                 dev = aml_device("S%.02X", devfn);
                 aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
                 aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
+                aml_append(dev, aml_pci_device_dsm());
                 aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
                 method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
                 aml_append(method,
                     aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
                 );
                 aml_append(dev, method);
-
-                aml_append(dev, aml_pci_device_dsm());
-
                 aml_append(parent_scope, dev);
 
                 build_append_pcihp_notify_entry(notify_method, slot);
-- 
MST


