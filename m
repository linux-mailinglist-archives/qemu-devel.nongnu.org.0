Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900BB61DC67
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:25:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMoN-0007Lw-BV; Sat, 05 Nov 2022 13:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmQ-0006Vf-4e
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmK-0007LS-U7
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cmk3N2TkEM2NEWtSgSN/BkMeJ3tFoPM9dpA0sZODk+E=;
 b=ZkV1c9ASLd/Xt+NKENx4IlwmeBNfr6Z6kHrSlYQs7qffX12t8Bk2uy3F1rTjIouoyS6qpO
 AIVqeuEESXg+fUDhXeGE1Z4micWu/rVgx3cXBoft6IA7G0A3VIlf2sa/54A60grhtj6Qlj
 yj10+3Nk0vbfUhAEKIUcdl0e8sYCELY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-280-bihuCPofNjW1WI_HkeHFXw-1; Sat, 05 Nov 2022 13:16:18 -0400
X-MC-Unique: bihuCPofNjW1WI_HkeHFXw-1
Received: by mail-wm1-f71.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso6005114wmk.3
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cmk3N2TkEM2NEWtSgSN/BkMeJ3tFoPM9dpA0sZODk+E=;
 b=dcKCY1HENqb2PWE+RjcxewV3GzZ8XRaaFUZ7+mwIElXYcTG69M6oIsvyOOVy9fTwem
 ILZ4CGH9k+/l1tWBJIUWIlYbWCEIyDyrwIh2/qzWGiG1Pz9yTnwEYfQ81Ag2L8T63GxF
 Cr2m+8gvk+HAsqhMEmdbcB348YpGraxVF3GE2XvSc+YwsBtnwWtuPHSTuL8P2xhxJmK1
 //Aj6AbTsSJhskSYu0/IwXP3l4FGYF0xhQ0HalJ1eLH2OVLwVWVyPbgBQJZxLUmEubLC
 c4fEUUdYU/fik66ACyKHYALlt2qhZFs+eH6PPKJMMbnwLl+fyjd/Za7bWKQeW5VLRR0E
 bllA==
X-Gm-Message-State: ACrzQf0+6DYJnkylXzh1AVYyiVkoFzHJcGEf8RSHOaxocM0Ub/ZXAurr
 Em2A12RFnXA8yKCXrsj7aVqKhJNaQfOsUv1CRaDAHMsFxNPYC1rfUzRv9HLiukTaUoMO8fXko7s
 FMRW7k5P5HfowVSjqyPVXIYYKr3bmjqxiCtIc1mSkxpmR3ZfucBtw+yToc+d/
X-Received: by 2002:a7b:cc88:0:b0:3cf:61db:2176 with SMTP id
 p8-20020a7bcc88000000b003cf61db2176mr28750961wma.123.1667668576843; 
 Sat, 05 Nov 2022 10:16:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4VVlVD9ym1EjS2Jb+zH4xgWI8YiOMWcUy7hLDOmLxx89q7h4v0ARzmZ2MQRqdpsQ1M7Kwtmg==
X-Received: by 2002:a7b:cc88:0:b0:3cf:61db:2176 with SMTP id
 p8-20020a7bcc88000000b003cf61db2176mr28750937wma.123.1667668576612; 
 Sat, 05 Nov 2022 10:16:16 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 k25-20020a5d5259000000b0022cc3e67fc5sm2624209wrc.65.2022.11.05.10.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:16:16 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:16:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v3 16/81] MAINTAINERS: add myself as the maintainer for acpi
 biosbits avocado tests
Message-ID: <20221105171116.432921-17-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ani Sinha <ani@anisinha.ca>

I wrote the biosbits avocado tests for testing QEMU's ACPI/SMBIOS implementation
and all the related changes including fixes in biosbits software itself. Making
myself as the maintainer for QEMU's biosbits related files and test scripts.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221021095108.104843-8-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4adf8c65db..07df572adf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1862,6 +1862,13 @@ S: Supported
 F: hw/acpi/viot.c
 F: hw/acpi/viot.h
 
+ACPI/AVOCADO/BIOSBITS
+M: Ani Sinha <ani@anisinha.ca>
+S: Supported
+F: tests/avocado/acpi-bits/*
+F: tests/avocado/acpi-bits.py
+F: docs/devel/acpi-bits.rst
+
 ACPI/HEST/GHES
 R: Dongjiu Geng <gengdongjiu1@gmail.com>
 L: qemu-arm@nongnu.org
-- 
MST


