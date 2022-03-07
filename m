Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52544D0BD6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:15:24 +0100 (CET)
Received: from localhost ([::1]:51346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMZX-0007Ni-UE
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:15:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM88-0001bw-3e
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:47:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM86-0005oC-IG
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mfut9rC7QohOum5PUWB9hEyCkgjB7g4mFdlV9wDnfyg=;
 b=M2KJBqn+WG5mCAeS7EGFV7Mu+m+9Z8jfif2EATpJnw2MT1FG8ADuDr0AlzfuhfPk7sd24v
 Qe1qjuPc6c+D8lRSekEA56SXTWPjhSwXhpd7HPBQPKhxjUVk+RxblwqmLNsGyK89unroSb
 jWRmcknM/ZaCp/PWlkPBUjZM05l3szU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-V8-mcjo4PRm5n7v9e2A_Dw-1; Mon, 07 Mar 2022 17:47:00 -0500
X-MC-Unique: V8-mcjo4PRm5n7v9e2A_Dw-1
Received: by mail-ej1-f69.google.com with SMTP id
 og24-20020a1709071dd800b006dab87bec4fso4216837ejc.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:47:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mfut9rC7QohOum5PUWB9hEyCkgjB7g4mFdlV9wDnfyg=;
 b=sxd5OyL6R+6WvrIvzffDq8tTFheWlGd9K1x3+/ZZCBfjKzd7U+hfQaXblz4nMeoBa5
 i53vpCbGgPKvXNfIWVz7WGCMo5QcGkPI22TGd7UII+vPJ0pTBKF7nepC5oancZ94nPOR
 vOt5kWyTptY55h4wAcJsQkmEhaTfbQkjMpPVTqML/vZsEtU/5IhrJIFVgul6x23gSDSd
 /AJ/22eqNwheoLuzuEOJMuQeRRpBlm3knmw8kXiaLRmE2V7gCjI2MDvmKAm4kMFNRzoz
 +AlQQTx6aEqJEflXyHAZ8W6VnFpALIh/f+DswCuZBi9A3rcCdOCkUgEKuThvVrJctIyf
 ZErQ==
X-Gm-Message-State: AOAM533aYh+x5Jf9T/5ARTjSGhJZxcZDpV136w/jFfe5b8il1rfUmbqq
 E3BSeKyG/nrdkOBk9yuvmN5+aCgfsewTgbsJHPi1C1mrnfOkP7Z5lX1OTcBbftg3sgodYETLq2C
 CPzuAnzugml8a5Zne5UEEP2uIKKJu7Y8MnUSCPMK5bBteNuMH3JI7YxizugFe
X-Received: by 2002:a17:906:7746:b0:6ce:a12e:489f with SMTP id
 o6-20020a170906774600b006cea12e489fmr10264101ejn.551.1646693219495; 
 Mon, 07 Mar 2022 14:46:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziAvFEBrAv/aaDf9k4utOe0cURY0cZOv+mauS1FdeSa6eljxf4hkmbkYwOya5l1hClyNPPHA==
X-Received: by 2002:a17:906:7746:b0:6ce:a12e:489f with SMTP id
 o6-20020a170906774600b006cea12e489fmr10264079ejn.551.1646693219186; 
 Mon, 07 Mar 2022 14:46:59 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 k20-20020a170906681400b006da86bef01fsm5204087ejr.79.2022.03.07.14.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:46:56 -0800 (PST)
Date: Mon, 7 Mar 2022 17:46:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 44/47] tests/acpi: i386: allow FACP acpi table changes
Message-ID: <20220307224357.682101-45-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Liav Albani <liavalb@gmail.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liav Albani <liavalb@gmail.com>

The FACP table is going to be changed for x86/q35 machines. To be sure
the following changes are not breaking any QEMU test this change follows
step 2 from the bios-tables-test.c guide on changes that affect ACPI
tables.

Signed-off-by: Liav Albani <liavalb@gmail.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20220304154032.2071585-2-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..7570e39369 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/FACP",
+"tests/data/acpi/q35/FACP.nosmm",
+"tests/data/acpi/q35/FACP.slic",
+"tests/data/acpi/q35/FACP.xapic",
-- 
MST


