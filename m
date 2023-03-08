Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8596AFBDC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:13:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiMA-0004B8-C2; Tue, 07 Mar 2023 20:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiM5-0003eU-FZ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiM3-0001fH-QS
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y13c106N8K8vctWFiYbDioLEH1WyId4rKqeKyUjFaYc=;
 b=PnYjGA84xa/ogBFXM/DjntdgicObuymF6teq/YNJBT1cNbPtpvqkMmuLyV/wqGGXboXkkW
 aNO/+m1XOsHqM2GjLQF+Wuy5sQi1PazDxt+SS36Kn89gBPzjSGYyESmuUyu63I0yztHNeK
 YbAWIb8gL7uxAvnkwsFHtzIrJK/xVe8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-7DSWauALNqWtp1X0kG68tw-1; Tue, 07 Mar 2023 20:12:30 -0500
X-MC-Unique: 7DSWauALNqWtp1X0kG68tw-1
Received: by mail-ed1-f70.google.com with SMTP id
 u10-20020a056402064a00b004c689813557so21165616edx.10
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237948;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y13c106N8K8vctWFiYbDioLEH1WyId4rKqeKyUjFaYc=;
 b=KOT37T5yP3UducV3OaRRHN7Z+9zVRw33dIxn6hmXp1WwaHSBDX2nL5igSi1sT/vAyu
 BQmXerVx8EGJbic5bZDbsyfwQ9+voxm5b3QxeL2KAktAAXHMpwWp3T8SM85d7HdEdXMd
 o3eoQAt1OzehtcaUKPdbKfln3BKeUem5vWZnYffYjJt/m2XLcmD8s/ZYwjCPqLIcjlkL
 ZJgQdqXFFM2m0ATyVk+6q/Yn0jvdUCdungTbHwpRYsCduOU1g78MGkKiU/5Bcu09rrIK
 1532drTwCllRYbfvVD3bktkE4prD0XEv9XR+Qo2h+OKZ6qO2hEUtSGgZJIElYIac6kt6
 2Efw==
X-Gm-Message-State: AO0yUKWyzj5aTzu7D8obiyQQr8ziZ88sdXDDUoE38GTAEDgfP/+MM0gR
 Z9M8/05+nmrfe8VN/rvPR6v8gtFIHlKssGSdtuBItjN89dXlm6JqfEm1xED7xtAh0dz+MwKzGnz
 XkGDt//t0WXkcF6wEl53aWrhGRAiV4DcfTWl/i/B8aXbVPynjxittd3gWS5kcKTRjT7xn
X-Received: by 2002:a17:907:c282:b0:884:930:b017 with SMTP id
 tk2-20020a170907c28200b008840930b017mr20310934ejc.60.1678237948440; 
 Tue, 07 Mar 2023 17:12:28 -0800 (PST)
X-Google-Smtp-Source: AK7set9cPXdCrb+JWHoeYUUImJzyCEUXqaTkXLJ4FianhVmzW6vjWuceZsGqdW3dHA70Pbl7HT/wdw==
X-Received: by 2002:a17:907:c282:b0:884:930:b017 with SMTP id
 tk2-20020a170907c28200b008840930b017mr20310915ejc.60.1678237948171; 
 Tue, 07 Mar 2023 17:12:28 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 e16-20020a1709061e9000b008bfe95c46c3sm6783905ejj.220.2023.03.07.17.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:27 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 32/73] tests: acpi: extend multi-bridge case with case
 'root-port,id=HOHP,hotplug=off root-port,bus=NOHP'
Message-ID: <0c3bf7c4314f1512dcc6070994eeba3c6f526f41.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

Following corner case wasn't covered:

  -device pcie-root-port,id=NO_HOTPLUG,hotplug=off
  -device pcie-root-port,bus=NO_HOTPLUG

when intermediate root-port has explicitly disabled hotplug,
all hierarchy below it is not described anymore (used to be
described in 7.2)

So as result we see only NO_HOTPLUG root-port described

  +            Device (S50)
  +            {
  +                Name (_ADR, 0x000A0000)  // _ADR: Address
  +            }

and no children nor notification chain for them are being composed.
Follow up patches will fix missing leaf root-port descriptor
and notification chain that should accompany it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-7-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 7828c6b7e6..295d80740e 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1055,7 +1055,10 @@ static void test_acpi_q35_multif_bridge(void)
         " -device pci-testdev,bus=pcie.0,addr=2.4"
         " -device pci-testdev,bus=pcie.0,addr=5.0"
         " -device pci-testdev,bus=rp0,addr=0.0"
-        " -device pci-testdev,bus=br1", &data);
+        " -device pci-testdev,bus=br1"
+        " -device pcie-root-port,id=rpnohp,chassis=8,addr=0xA.0,hotplug=off"
+        " -device pcie-root-port,id=rp3,chassis=9,bus=rpnohp"
+        , &data);
 
     /* hotplugged bridges section */
     qtest_qmp_device_add(data.qts, "pci-bridge", "hpbr1",
-- 
MST


