Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBC35462F4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:59:14 +0200 (CEST)
Received: from localhost ([::1]:42990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzbQ9-0001Uq-HA
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZY4-0001zA-O2
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXr-0006Nz-Nv
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H48oDSI/24QHAU16OnoWcXqIkpcM2BnmYIyIVEcKBYY=;
 b=CdjpRioO9W5GYh2OO57PGJPXpXde30lRtcNRgK7IFsNTCb3Dc9OzoLWlCRx8s1pUwgkVzO
 5udll2Nod7nqFAoi869N1eiNXEXG/bzAjlu3U5SzPYEtIFHAVtZsn1l4NkEpuLo9sAJ2XD
 9XlWXxer6sYZuFMxo3ChPH7o5x4nZOM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-OPmaI4kNO72DAgE-by3Lgg-1; Fri, 10 Jun 2022 03:58:49 -0400
X-MC-Unique: OPmaI4kNO72DAgE-by3Lgg-1
Received: by mail-wm1-f70.google.com with SMTP id
 o3-20020a05600c510300b0039743540ac7so9322256wms.5
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H48oDSI/24QHAU16OnoWcXqIkpcM2BnmYIyIVEcKBYY=;
 b=ik5UplMwoZXaxE106mKbYw2T4FbChbSoetgtcSND33DDZP8LylHoqNYgSPZETvBu2r
 HOWKYhMEmKbuh45Vh7tVUCh8gsK8NLP7fKmPsT5Q42g8/yG7xUJhcvMNz0bWeNGgTDtV
 2zKqiEfnboM2bBT7RUEtBm/BPd/QezOzI4rvMHi7aa9o8Nybq6pSsUd2O8oUSRG/uzCP
 0Mh2r01h1torBsDYjABulAcbB538AnZduzlaEC/BqBDKmzWnlAzBfDoI6tJPbXFEdP9M
 ULmKKda7fKW7dBFhmH/etDjpaeIHevrEGZpNsZL/wVT1x4e2ft5tPoyALfiVanMGowuz
 jxLA==
X-Gm-Message-State: AOAM531pOJ3zkS1sMsvq+EIHrxLS2bsNcIaSWwcd47DZmaeUqnUgON5L
 4KkbIQoHoV2hB85yWKkVeeSm65iklUodyLPOrw75IVy3HsJfdPFcjH0cbUySLqCjMPW1mdqckWf
 RMIKRSOxA2EfiR4G1B6ThRRKaCvKZD5iGg1GisUv2ZFQY6uWMw2aXf4Qca/dR
X-Received: by 2002:a05:600c:a01:b0:398:d2f6:b5c6 with SMTP id
 z1-20020a05600c0a0100b00398d2f6b5c6mr7457659wmp.140.1654847927838; 
 Fri, 10 Jun 2022 00:58:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZygNH8ZPgFkjN50hgBBO5iucanCt8a9gm0BVc2hrd1jYWeENI++q01v+goY9V8WrCU7UYqw==
X-Received: by 2002:a05:600c:a01:b0:398:d2f6:b5c6 with SMTP id
 z1-20020a05600c0a0100b00398d2f6b5c6mr7457641wmp.140.1654847927619; 
 Fri, 10 Jun 2022 00:58:47 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 o17-20020a5d6711000000b00218453adaefsm12573270wru.101.2022.06.10.00.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:58:47 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:58:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 35/54] x86: acpi-build: do not include hw/isa/isa.h directly
Message-ID: <20220610075631.367501-36-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

the last remaining dependency on ISA in acpi-build.c
is iapc_boot_arch_8042() which pulls in in isa.h
in its own header hw/input/i8042.h. Clean up
not longer needed direct inclusion of isa.h in
acpi-build.c

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220608135340.3304695-36-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 0b65fc99cd..f41e14a469 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -37,7 +37,6 @@
 #include "hw/acpi/cpu.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/acpi/bios-linker-loader.h"
-#include "hw/isa/isa.h"
 #include "hw/acpi/acpi_aml_interface.h"
 #include "hw/input/i8042.h"
 #include "hw/acpi/memory_hotplug.h"
-- 
MST


