Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C219E4876C4
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:48:37 +0100 (CET)
Received: from localhost ([::1]:44038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5njY-0006gp-T0
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:48:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n43-0001ZX-OI
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3z-00020i-Nb
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U+s/eLBlC/CuoqRVZrYGYrsH9EkPsepN+hS3IAf50OQ=;
 b=GJo4FeF7vqbGbf5zZOoo77ZR5slTuynP/J0a0OMiCRHXd83tKXrkwP/x62JqOOaA6v75Dh
 /og/eHD8Q1w60h1AlgeHTVoyvZC5OVcpIvp/+uBKVDgjM3xavGuHGzTaRVAH1MXVUdZcnH
 xCkC4aBy8ZClfL2ek+xLnjmS/q6w3qU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-3lcd0yl7M4yrdlY9LUOXMQ-1; Fri, 07 Jan 2022 06:05:03 -0500
X-MC-Unique: 3lcd0yl7M4yrdlY9LUOXMQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d14-20020adfa34e000000b001a631cb3ab5so377471wrb.12
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:05:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U+s/eLBlC/CuoqRVZrYGYrsH9EkPsepN+hS3IAf50OQ=;
 b=BQ8lEo9bMEIMMFN2A/xDmNQyIXLV9incqnrlLqUlwwF0ciEOA0evb5xqurVwn+sOP0
 nJnXNK5/NYDCqnJWE1Ifk22N7s/tEFhdp3UfxLNmvXUJf8QunpRsnrLABnUb12yQx7cy
 VxRHguHrKo2lp4ZptUolq25WjC07DbqZhkWlr8bgIFuAhX3/OXJDVhSMJQWlBWGhY7t1
 uXQsmEU+YOoLfR0bgFg8i7t9dm9oeAeqyXjlD7xp69WdQOWMnTXwwqklJCVFSYf9tM21
 4oIVukNH/XHS+Vm4XKSwDW5/x0fdO1xDMGfLX2noxeqCq+zmM77Xdg3s0s4Q24qdOztt
 jXuA==
X-Gm-Message-State: AOAM5339pd1mgDDP2y5NZ+x8TWly1G/VZsmgACuuse+Gs0tE4xpCiCtJ
 bphMAABxMCVnqwkuigcKzzaKe93AyaYsd7F0q7EROh3saAT86Ylq4CkZxr2OxlqP5SIY9MVRpWE
 6sB63DIM+xoQs+Yhdmmru5YUuV9ijZIU5xcuFuBZpe45yD2+BlPpwWooOug17
X-Received: by 2002:a05:6000:1543:: with SMTP id
 3mr55023108wry.140.1641553501771; 
 Fri, 07 Jan 2022 03:05:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDKZyPDSWMleIOUwctyjnZGPpC4yZMQKatzwnlIvREXKJ3FIKI2KOIQPefMqbul9lBXryvbQ==
X-Received: by 2002:a05:6000:1543:: with SMTP id
 3mr55023082wry.140.1641553501468; 
 Fri, 07 Jan 2022 03:05:01 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id a13sm3551740wrt.87.2022.01.07.03.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:05:01 -0800 (PST)
Date: Fri, 7 Jan 2022 06:04:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 38/55] MAINTAINERS: Add a separate entry for acpi/VIOT tables
Message-ID: <20220107102526.39238-39-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Ani Sinha <ani@anisinha.ca>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

All work related to VIOT tables are being done by Jean. Adding him as the
maintainer for acpi VIOT table code in qemu.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20211213045924.344214-1-ani@anisinha.ca>
Acked-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f871d759fd..6aa0335560 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1777,6 +1777,13 @@ F: docs/specs/acpi_mem_hotplug.rst
 F: docs/specs/acpi_pci_hotplug.rst
 F: docs/specs/acpi_hw_reduced_hotplug.rst
 
+ACPI/VIOT
+M: Jean-Philippe Brucker <jean-philippe@linaro.org>
+R: Ani Sinha <ani@anisinha.ca>
+S: Supported
+F: hw/acpi/viot.c
+F: hw/acpi/viot.h
+
 ACPI/HEST/GHES
 R: Dongjiu Geng <gengdongjiu1@gmail.com>
 L: qemu-arm@nongnu.org
-- 
MST


