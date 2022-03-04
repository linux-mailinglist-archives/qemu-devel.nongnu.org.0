Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A884CD5E4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:06:47 +0100 (CET)
Received: from localhost ([::1]:59012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8Zy-0002Fc-Jp
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:06:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ87p-0007P9-GY
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:37:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ87o-0000KQ-09
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:37:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TYa/f3CO+AQEfD01xoN40acPIyF1N0ddSlAR4JbVXkw=;
 b=gv8vBqT5oYFoxNFSKThyvSpH73M/yvC80mV9Fk3V+vAN4hIGIGVnl+I9HPg0ACuvBgWO6O
 WVS/UT4y6yd8sPwf/7GHWMyo3h8Xk1DE/eBUujFRuNLsFp9aY9GhivJwaJdWpqQYNSnMOE
 O4PM1pX/pjlfwmwo+U7rshnzKbZ5B9Q=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-YmVI26ILPHWsNcu3fYbksA-1; Fri, 04 Mar 2022 08:37:38 -0500
X-MC-Unique: YmVI26ILPHWsNcu3fYbksA-1
Received: by mail-ej1-f72.google.com with SMTP id
 y5-20020a1709060a8500b006da9258a34cso2637464ejf.21
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:37:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TYa/f3CO+AQEfD01xoN40acPIyF1N0ddSlAR4JbVXkw=;
 b=5agsewB+a0Ae9UY851L/t9IMCGPjG5M03BLITxeHT1ElyFFuRVycbXWKn74iUcm5rU
 MzfJHUJh4WCVmsWP8ZPTpLuIqWfLdm9zdlJ6UuRlB66p+4sgJ2MZRLp3VrmGSrEq2uas
 rAl7bYntgT0l0LnoH7c7UrleufcBlsQxs5t5xLam3OfFK/fNl30Jn2J4iEuzBIlkTqUN
 nZR47IcnVyurdM8hbWhOPaaAKOzC/Hod9Yfg9vazABI0JC+6L62RiKXnIVkubTEvcI6S
 gQO4nKtcLFt9mQj1NnNl+qSp3eWZTKQFVtmp2DBPH5lJGbeT7RkIJJoLf/2OcJ6Is4iq
 Q0Tw==
X-Gm-Message-State: AOAM533QfGJTZd7vUs/hcevNDBnpVI0IJQhiTAgyPZgFjIkc89IcsuLF
 +CY48BemU2E9sR8hXSjoa1R59fa+oIld8bJU9K0yfFpJQpzs2f2FVVc5T8tRwRTXvkOPjt06g/L
 vNKCnz2EXaUUZYqiyVqlzfrYDwHyWv3+VdloEJS4nubQGLjTivBYgXuUTASo8
X-Received: by 2002:a17:907:da6:b0:6da:8f3f:d563 with SMTP id
 go38-20020a1709070da600b006da8f3fd563mr6425561ejc.112.1646401056938; 
 Fri, 04 Mar 2022 05:37:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3pLx360nz+51i5kcc0K8FU1MGAax8BxOaPDGETpL1qIdx1JZ9FSRDHMOotabNe+AgFtXBkg==
X-Received: by 2002:a17:907:da6:b0:6da:8f3f:d563 with SMTP id
 go38-20020a1709070da600b006da8f3fd563mr6425542ejc.112.1646401056634; 
 Fri, 04 Mar 2022 05:37:36 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 y20-20020a17090668d400b006da951cbb74sm1528169ejr.211.2022.03.04.05.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:37:32 -0800 (PST)
Date: Fri, 4 Mar 2022 08:37:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/45] MAINTAINERS: no need to add my name explicitly as a
 reviewer for VIOT tables
Message-ID: <20220304133556.233983-4-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


