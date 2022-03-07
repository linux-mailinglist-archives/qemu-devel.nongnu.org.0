Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA43A4CF9AC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:13:08 +0100 (CET)
Received: from localhost ([::1]:48724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAMW-000295-1P
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:13:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABR-0008Gg-EM
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:01:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABP-0002Zj-R7
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:01:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TYa/f3CO+AQEfD01xoN40acPIyF1N0ddSlAR4JbVXkw=;
 b=PZb6YZ4MiDROoucBrslhERIksPUGTmaNtUyPBwQgLrTK8z5DO2/y/LAdHWbX3Gz6JSaL2V
 rnoDuGqrwLtm6blaHPy86eRezO/dFmm70tdc1K1WN8qUrIzu79N8eha8IFJe/cCjs9i6B2
 8nLDFk21795ycgqyWMtrbi1JQWfXuA8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-gL3m1RaHM5umnbldtyA1FA-1; Mon, 07 Mar 2022 05:01:38 -0500
X-MC-Unique: gL3m1RaHM5umnbldtyA1FA-1
Received: by mail-ej1-f70.google.com with SMTP id
 lf15-20020a170906ae4f00b006da86a43346so5605670ejb.14
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:01:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TYa/f3CO+AQEfD01xoN40acPIyF1N0ddSlAR4JbVXkw=;
 b=0ZXe2zNJpNen8tcW7DBLX5PRFE2FxKnCcmMIRovSBDDRGHC9F8bbd+3i/Gw6Ok/5GB
 jN63TPfPJbJKtI9lkNLzQIj7BQZnXLbqwGaU4uMRO0ptbi4s5O/DvhkXSGYYLs0Zbqaj
 8xtNqFYqzPrA24sw0MDlNhH36H55zWzXMaGvHbuBmN+JMoKpIwc5IcD4PeooHoK5JbKg
 KHPmoEi0yq4wcb0leYih2Xd7vPnbWfscAKQqtaPOrVIkSfDh+fQ8ulu/4z8v/SSLXysq
 r6H2nZfuiz70N8vBcbNB+dwjBMNH094nC+afXBYxta5jbKKMtZjTryxVCfkk6StDeK57
 QVkg==
X-Gm-Message-State: AOAM532pu6iGLzpoAQOuUwRy5FNvHgdWl/dxywE7ZWuWfozZVKhfPEJD
 qm7YP2xXC/Nw0dzi28ck2o3zOzF7XEbxeAa61b9HvMXbNtW6MrQQeqqAxgSxE6e3n50ugZiHWY+
 r1d+IM/ELpnmv0XyNepaCI+AasjNkzyaq74zWNXCvUN259VlrXI2Bq5RFbZ11
X-Received: by 2002:a17:906:3a4f:b0:6cf:86e0:586c with SMTP id
 a15-20020a1709063a4f00b006cf86e0586cmr8398630ejf.626.1646647295595; 
 Mon, 07 Mar 2022 02:01:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvkeHOyrMxdS5SJb0d7ccl3sE6c/ZiwNhbjo0NQjBkb9BwoU5rK0qpwPsCcbpKfvcAFs+k4Q==
X-Received: by 2002:a17:906:3a4f:b0:6cf:86e0:586c with SMTP id
 a15-20020a1709063a4f00b006cf86e0586cmr8398606ejf.626.1646647295315; 
 Mon, 07 Mar 2022 02:01:35 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 h12-20020a1709060f4c00b006b4ec988cc3sm4544652ejj.4.2022.03.07.02.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:01:34 -0800 (PST)
Date: Mon, 7 Mar 2022 05:01:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 03/47] MAINTAINERS: no need to add my name explicitly as a
 reviewer for VIOT tables
Message-ID: <20220307100058.449628-4-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Ani Sinha <ani@anisinha.ca>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

I am already listed as a reviewer for ACPI/SMBIOS subsystem. There is no need to
again add me as a reviewer for ACPI/VIOT.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20220223143322.927136-3-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68adaac373..83a9f79c1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1819,7 +1819,6 @@ F: docs/specs/acpi_hw_reduced_hotplug.rst
 
 ACPI/VIOT
 M: Jean-Philippe Brucker <jean-philippe@linaro.org>
-R: Ani Sinha <ani@anisinha.ca>
 S: Supported
 F: hw/acpi/viot.c
 F: hw/acpi/viot.h
-- 
MST


