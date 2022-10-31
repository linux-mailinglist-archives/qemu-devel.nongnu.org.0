Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB35613755
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:04:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUHO-0003z9-TQ; Mon, 31 Oct 2022 08:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUGr-0002U4-Cm
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUGh-0002Wl-Lu
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sA0aUnKWUG2lHJea+7N06ahIGd9aPeHX6W/XDF7Ebic=;
 b=Mfc0RlJGR4X6NOYy/hXjnjyP2wYVAZRNxKLcs3Eu+/ARkd65jc2W0J79tdp9NYctni7Rbn
 xvfWEBsXWIO2SgxWU+jrcAcurGge9ZZAkUXvj0BfSLqoGzBxNLfE14v5atxdZ4HlRN9SBy
 ihYu06cw+p1ipuO/H4TwH5rDUPngeOc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-308-XT6TS6C5NACgLBni5Bx86w-1; Mon, 31 Oct 2022 08:51:53 -0400
X-MC-Unique: XT6TS6C5NACgLBni5Bx86w-1
Received: by mail-wm1-f72.google.com with SMTP id
 az11-20020a05600c600b00b003c6e3d4d5b1so5256786wmb.7
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sA0aUnKWUG2lHJea+7N06ahIGd9aPeHX6W/XDF7Ebic=;
 b=n+iZL9eIlMQ/5kpxMLhX7i5C0cavSjP9ZLfTgqOwA7g+/GmGl66d3aTpYt6o/YIc/R
 PlyLb5QYZ95CnIXVMcogPw7RGjOxUK7Ydfp4Q02XabfW3JnvRegh73RqfzfS96evSpQ0
 kOBjuLtF8iyPJ+Eb1n0RycoBrLb82UODLc6j6Jk41FOZcqcOUuGua9RTFnK32fGAp48l
 mZIeHI9eZjq9QwbMoIH3wapLqxQeIEg3m2T6nOX4553QZRa6itevDW5nhnA07cYTLowo
 GNpwxVsbDqHd138vMsnKWawA1kghQNJdPgy7fm2901W3inEjlRLn6YUHnHw6ZcHWRmqF
 yucg==
X-Gm-Message-State: ACrzQf2iIpFPsrDHBKYAK+Bveb/4vslBPeiO29dswulWU2LPTso5Tuci
 RwvWWnTwPuaPhlbtBhJJjF5ESd5G+U08YKzSx4nCxAH/9d7Taj4PW+TCv7lkPLrpTVnp9ADF883
 LKBI+Hjbc4o6xvZ3FG5CITzG7dYdp16fejQOg5dvkWJmbDKkWdjR69A3XI0Tm
X-Received: by 2002:adf:e810:0:b0:236:5152:b95 with SMTP id
 o16-20020adfe810000000b0023651520b95mr7651825wrm.529.1667220712248; 
 Mon, 31 Oct 2022 05:51:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6f1JLKEH4aFKRG2LI7vuRrEFgrq6FHLpWX539GJrcCU4/tG35dSOgCw8LiG9tZtjhKV/izTQ==
X-Received: by 2002:adf:e810:0:b0:236:5152:b95 with SMTP id
 o16-20020adfe810000000b0023651520b95mr7651806wrm.529.1667220711974; 
 Mon, 31 Oct 2022 05:51:51 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bs14-20020a056000070e00b0023647841c5bsm7101823wrb.60.2022.10.31.05.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:51:51 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:51:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 23/86] tests/acpi: virt: allow acpi MADT and FADT changes
Message-ID: <20221031124928.128475-24-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Miguel Luis <miguel.luis@oracle.com>

Step 3 from bios-tables-test.c documented procedure.

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Message-Id: <20221011181730.10885-2-miguel.luis@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..8dc50f7a8a 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,7 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/FACP",
+"tests/data/acpi/virt/FACP.numamem",
+"tests/data/acpi/virt/FACP.memhp",
+"tests/data/acpi/virt/APIC",
+"tests/data/acpi/virt/APIC.memhp",
+"tests/data/acpi/virt/APIC.numamem",
-- 
MST


