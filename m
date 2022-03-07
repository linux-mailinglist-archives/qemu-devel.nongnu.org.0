Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D70A4CFB1E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:29:47 +0100 (CET)
Received: from localhost ([::1]:41068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAca-0001UI-34
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:29:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRADM-0002zQ-UF
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRADH-0002xq-Mb
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mfut9rC7QohOum5PUWB9hEyCkgjB7g4mFdlV9wDnfyg=;
 b=iWcHjFthOBWeq9QojI00bRLMIIKCGB+szaT9WxPYRUaQqfS9xhIt3cfi6u44Q0z/j3dlxv
 yYbACkbJL+HiFeL9pDHdHKVx0wMDfDO8iyJRuVx48wwJ/7KgX28VEUgtx+gcv23bkwyHdM
 FZZXIKqg+wjPax2HAqxs1w40MZrcWbE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-KSA5j78xOr6vJwPO7VtnKQ-1; Mon, 07 Mar 2022 05:03:34 -0500
X-MC-Unique: KSA5j78xOr6vJwPO7VtnKQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso8293466edt.20
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mfut9rC7QohOum5PUWB9hEyCkgjB7g4mFdlV9wDnfyg=;
 b=avpYeufPy6ACNx10S3JLABzaTJ+EaMFyE8wXT8Lu+WsU2esGKt07PQGx409y9Nj/Cb
 rGrBrx5OWG8Ho7BF5udEUv7fTqXVf58pYmWj9KnqozyV1kwv6N14yid825DhTqobvSrE
 aIe/EG/S/+cx+X5MOPyrYzVtXsmfy4CYIQjJm+043vVE0pNtk7pS2pyNwm3U0ZH0DJgs
 d9kwxZA0mXQSNMuTRVsV/jVZE6smYBSuaw+IRcxb066MPNCMohxehiANutzpLaozHa2C
 hbm0eHPDJIF3JI8A05YaORS4Yh3ENb5Hz1gWhyFthopUnKYZtvntuVjf0CKQ5gmLzNcI
 zS6A==
X-Gm-Message-State: AOAM532T0hNOAXXYaA5wF3624T9HzOckDxwdKAP1rPSYTY+Nk5FQftr/
 gDa+ZZZGXMHK0E90Y4KKjkB3LrYop9e41EwZzmo4pz0z6elTT0Yt1uSIbpz4kvqB96fSthK1pi4
 ZBZxaqUTQ6wC1Mtsz/6ml4WWXEXM5g2eYv9RhG+PVj9IZnZC6Xqz9kMlB2JXH
X-Received: by 2002:a17:907:168a:b0:6da:9177:9fdd with SMTP id
 hc10-20020a170907168a00b006da91779fddmr8464709ejc.757.1646647412628; 
 Mon, 07 Mar 2022 02:03:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXBsVqcLXfllFfltaNNsB3P0ZdvHCkNbiFGQrSpRY7zr9v5/uNxdZnsUlPlZknyMwHzTGyuw==
X-Received: by 2002:a17:907:168a:b0:6da:9177:9fdd with SMTP id
 hc10-20020a170907168a00b006da91779fddmr8464696ejc.757.1646647412325; 
 Mon, 07 Mar 2022 02:03:32 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 m7-20020aa7c487000000b00413a99bf3a3sm6141958edq.56.2022.03.07.02.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:03:31 -0800 (PST)
Date: Mon, 7 Mar 2022 05:03:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 44/47] tests/acpi: i386: allow FACP acpi table changes
Message-ID: <20220307100058.449628-45-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
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


