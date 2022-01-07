Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B004876E0
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:54:08 +0100 (CET)
Received: from localhost ([::1]:59828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5not-0000ho-Pc
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:54:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n4B-0001p8-EK
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n49-0002b3-VY
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=whKn0pctPclugSGgiuj/6VncPkuXJJFQ5IPPduaKEoY=;
 b=X/LHfR4r+G4P1SnL2VtloigR1gBcYuaMkG03rQcMhtduAFZc/l11nUdn09H2ymgeSI+VA6
 xk1Yq1lnHn8xv7iCtjaZJr0kunorC8FHluHsNPK3P7jHOvlKtuzK4ytzmyA7EgoaWUSjTG
 iK8jWmOBpplfVpdh7G8ZAmjNISQhsD4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-c-8q1UyFNYeS4xYI_-seEw-1; Fri, 07 Jan 2022 06:05:47 -0500
X-MC-Unique: c-8q1UyFNYeS4xYI_-seEw-1
Received: by mail-wm1-f69.google.com with SMTP id
 m9-20020a05600c4f4900b0034644da3525so1353261wmq.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:05:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=whKn0pctPclugSGgiuj/6VncPkuXJJFQ5IPPduaKEoY=;
 b=fNpn84BtA8SsqaMcKzNyvaf46kjqPEZgVM/AiLahke6krnKcUXO3zCd2mAg+SPFcDP
 CG4MBLOT/n2YRkJCO7TUnRyrv4DExOeDEK2FlqjFT1wc3p2PjXm3Pm98Mdre3H2+EKq3
 uBDACegIccMhK/XdnGXwkiklHWrlEuhlNJOEqCb9/y+ZjgQOL2RoUOrIbUxolNZevLH8
 xzQagALoEKWBuJgBoLtzajH6fhvAYbpCGZNwO71Czc8fxWiaeaGKslrzgelTLcFzo9iM
 B9DwthFZVUOZ3AcytfyplQ8K1FuPhi/svKNaHiHLUsw+dlC4/1PxKN1+rCwvQb3QNooF
 pjYA==
X-Gm-Message-State: AOAM531V6b5wJsj9sZcVFN6dfglAlusOWvq94gJPmj413FsLi6zTmRjB
 X5ch+orRz336SAkkp5qdQFbaWVlM+J8HKpWWKlzOJdZlq0xndCtUryJF1kXdo41kKlFY4H5BBW4
 3ae5ufo23TbPWufR5X+neZR7NenXOQcATOwmhgqnwAotISJGF+heoRJ9S0iph
X-Received: by 2002:a05:6000:1ac9:: with SMTP id
 i9mr52688559wry.531.1641553546059; 
 Fri, 07 Jan 2022 03:05:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkv4X58l2gxFiHbgi+DUAIVSsaB6Mq8NapEC3gtq6C2nnZtvQ9e3YFQZ2L8La6q3T4UaPSpw==
X-Received: by 2002:a05:6000:1ac9:: with SMTP id
 i9mr52688535wry.531.1641553545682; 
 Fri, 07 Jan 2022 03:05:45 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id u11sm8579138wmq.41.2022.01.07.03.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:05:45 -0800 (PST)
Date: Fri, 7 Jan 2022 06:05:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 53/55] tests: acpi: prepare for updated TPM related tables
Message-ID: <20220107102526.39238-54-mst@redhat.com>
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Berger <stefanb@linux.ibm.com>

Replace existing TPM related tables, that are about to change, with
empty files.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
Message-id: 20211223022310.575496-2-stefanb@linux.ibm.com
Message-Id: <20220104175806.872996-2-stefanb@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..5d80e408d4 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.tis.tpm12",
+"tests/data/acpi/q35/DSDT.tis.tpm2",
-- 
MST


