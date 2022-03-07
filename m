Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3DA4D0B7A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:51:47 +0100 (CET)
Received: from localhost ([::1]:37514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMCg-0001nc-3q
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:51:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM5v-0004vs-QU
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:44:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM5u-00058u-6d
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:44:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TYa/f3CO+AQEfD01xoN40acPIyF1N0ddSlAR4JbVXkw=;
 b=J8hjvivNveUzTs3QPCADKFoqMEjpWHj/oU9/i5tKk1LAWnxitx6Nh8JECukXYj0+FQdbfv
 j7oHY+fpqS+nbRYhJAKtfQuq1GMwHkyrltC4J5VLJGb2DuzCFWJKPRIBAOmOroZIq9URWm
 wfLbIOZrjZaR8ulj1MP7Rct9QMw+UWk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-AWZChO2kPeqJceL1uwifKw-1; Mon, 07 Mar 2022 17:44:44 -0500
X-MC-Unique: AWZChO2kPeqJceL1uwifKw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m34-20020a05600c3b2200b0038115c73361so5687647wms.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:44:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TYa/f3CO+AQEfD01xoN40acPIyF1N0ddSlAR4JbVXkw=;
 b=08Mf/X/A8ZT+WtPR8dm03HXLJNOcGLdRHHlrbwvK/Vu5RhxCH0vJ8AZ+b09sFsTlC5
 N1+RWZcLRit+43PbnkjfNpIbGRGjCXFkeEKzH7qiv5nSgElu/LfwW0vLOLhFA92I40+L
 Ps5itVTeuvHToAoIfazYFn0pJH0tAykKobqnOy/b9qA02Cl+rBbqLfiVL1WAHaIsHov0
 ZukRc2OXa05GXL0dPHL0+lqtTXl8QaIM+oS9TKWwPX6mtMrst+Q3SWE+gHpbbId5v//0
 gw/lxzj6In5Fm7yz3LJG7/8o52QEp1n2flRhN39sHYXEXi6wbb8D8qYdT9HtkELgNR3N
 4icA==
X-Gm-Message-State: AOAM533UgXKbsEhB3edJjrXmUuNcO3U3Z9mNbg8J7JYJpzetdUtosXrE
 0jj5CqU7tOWrogk+MXt+EFMqMf1HFe3aBI6z5js3C1uGW/oLq+pB/8rjy/imyBDU31B1j16N6ej
 OrxK72e+SMEu7qmGclndeTThXMjQCyRMl0U6yViRi9PN3UFSYcpHYInmMCq5k
X-Received: by 2002:a05:6000:154b:b0:1f0:4c09:ae5e with SMTP id
 11-20020a056000154b00b001f04c09ae5emr10208106wry.610.1646693082698; 
 Mon, 07 Mar 2022 14:44:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbr7OnJct8Kg8JYebCmODfwt8gVfiBKAvvsY1mRh4S/BZqaeD0P2opyDE+8hzBThwzyvqusg==
X-Received: by 2002:a05:6000:154b:b0:1f0:4c09:ae5e with SMTP id
 11-20020a056000154b00b001f04c09ae5emr10208089wry.610.1646693082435; 
 Mon, 07 Mar 2022 14:44:42 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 p26-20020a1c741a000000b00389ab9a53c8sm503871wmc.36.2022.03.07.14.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:44:42 -0800 (PST)
Date: Mon, 7 Mar 2022 17:44:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 03/47] MAINTAINERS: no need to add my name explicitly as a
 reviewer for VIOT tables
Message-ID: <20220307224357.682101-4-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
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


