Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276EA48804E
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:07:54 +0100 (CET)
Received: from localhost ([::1]:46232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60D3-0005su-6T
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:07:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6093-0002ni-U0
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:03:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6091-0002Ft-7V
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:03:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vpoC0+6a4IT38j+kX8wAPq8AuzqmXiw7PFqYGYauyfQ=;
 b=gY9zkX88/xGfvIpYvUZDmlqYMYmHPcR1+oN+3TPUb/OLSh4pJBBchZYqPNPQzbXkFUz6Y1
 L2Tyoca9Nz3ZMzYFnIQwLwHq2b5RFauL748sM6LimlfijzmY3Yit771QnPvD8X9i4xiHcg
 QlPYEAOLikW81a4clrWXRKSTi2GTzIU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-3X0GjsplOo-xH6Rw0H4bbA-1; Fri, 07 Jan 2022 20:03:41 -0500
X-MC-Unique: 3X0GjsplOo-xH6Rw0H4bbA-1
Received: by mail-wr1-f72.google.com with SMTP id
 w25-20020adf8bd9000000b001a255212b7cso2320039wra.18
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:03:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vpoC0+6a4IT38j+kX8wAPq8AuzqmXiw7PFqYGYauyfQ=;
 b=8EuE53yTVf54FZ/PQBaSj18cMyy8BctmyHBHR1Q2ThUQelhgt4oL/tox2WPhmJWaN+
 c88ryv/+dI4Lnlw5C/Xx0NFGGPKb+WaWfiB7evgvKZy3HVk/sosK+HZ20lQQWXdOOuNL
 D6K9h4IU4wrQ6BBBH9A9aLFkXvI65CwmTKXURuRJACP4JE4Z+PwYjjeU6LpMNKvhcgOp
 N6Up1XC2g+oYJaY4JRN8K36P7k5wSWvU05j+m1fo0ZMvfOc2gTFRna2DQk4N0n11MMpR
 HPtCEna3r9tghkw2+EZEk7byy7h2sb8rzW38rILk0pP4um20rzAqZ/rv9Lhj3gdkjBbS
 q7kw==
X-Gm-Message-State: AOAM5320Bk/SEqCLMo7bYsb5GFe0/X/TSDd7qXiCfLS4jQq9SKqQC1MI
 xK7nhTCp1zxdRgCBI425dQEsZUf55zDMi6S6IRg77JxWFEP06qyHQngkab/C3YgIb9JovhB4Ovq
 K6szflk+C2GYibH6vMGIeKt8UNTpZAoqPBz/yYAD+2YhFKnwHUn57fuAoJPQz
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr1724701wrr.232.1641603819630; 
 Fri, 07 Jan 2022 17:03:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZZKdsEywqlQnUakIeErVlcq8UyNFSh7eM1/PCvD1+XMqVwBuwS7C1/RvXa7QjAC6AYZi4cg==
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr1724685wrr.232.1641603819380; 
 Fri, 07 Jan 2022 17:03:39 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id bd21sm246568wmb.8.2022.01.07.17.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:03:38 -0800 (PST)
Date: Fri, 7 Jan 2022 20:03:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 02/55] acpi: validate hotplug selector on access
Message-ID: <20220108003423.15830-3-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When bus is looked up on a pci write, we didn't
validate that the lookup succeeded.
Fuzzers thus can trigger QEMU crash by dereferencing the NULL
bus pointer.

Fixes: b32bd763a1 ("pci: introduce acpi-index property for PCI device")
Fixes: CVE-2021-4158
Cc: "Igor Mammedov" <imammedo@redhat.com>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/770
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/pcihp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 30405b5113..a5e182dd3a 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -491,6 +491,9 @@ static void pci_write(void *opaque, hwaddr addr, uint64_t data,
         }
 
         bus = acpi_pcihp_find_hotplug_bus(s, s->hotplug_select);
+        if (!bus) {
+            break;
+        }
         QTAILQ_FOREACH_SAFE(kid, &bus->qbus.children, sibling, next) {
             Object *o = OBJECT(kid->child);
             PCIDevice *dev = PCI_DEVICE(o);
-- 
MST


