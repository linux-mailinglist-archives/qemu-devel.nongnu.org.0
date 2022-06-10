Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBFA545F91
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:45:19 +0200 (CEST)
Received: from localhost ([::1]:56586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzaGb-0005MY-Ep
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXz-0001vu-Fl
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXy-0006PC-10
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ORUPsrNOZ6jfimbq8TEFWzi9CHilfKQZLZzyDVuoqOY=;
 b=Z/5pHvOuUIkY5dtglI/G31e6trdPA2XWNmsUVcAIwFl+UbePeTZrB5+a8/hSDqOrjVTzQP
 tIzpKQYYeg8Okr8vjRVQGEGmT0SuRBkcodDizqoMAZFvTT2vIx+I4LDXhGQyxEdrRJjHmD
 inlfNAC4Dlh5mtN8+L9YHtJ1SpsYdok=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-1ughob_SO1GvuqKt72LVdQ-1; Fri, 10 Jun 2022 03:59:07 -0400
X-MC-Unique: 1ughob_SO1GvuqKt72LVdQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 i10-20020a5d55ca000000b002103d76ffcaso5996479wrw.17
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ORUPsrNOZ6jfimbq8TEFWzi9CHilfKQZLZzyDVuoqOY=;
 b=oY74TrBtmDrJg+uZp9ual1KPsN16A1qrc4y4aWEYxW+X8LhUKTl1pjoWgDNidumD9F
 tlJd9YrAD2XNQ3rusCCojlnO6AnicsbxcFc4ylxedfTUQzMpaZeuEkzztjN7pPw1E+/I
 HOy6hl3dSa4CJ6BXpEMJUfgr9/h8V2r9kqcuvVk9kE2HvDzL6B/pPjzzWlS+XuAvZQqq
 inC5j2JwoCnoEnSR5iB0JHHIpfmuyHJBTLsdG3BpJIJWkW8DfOpkOx1EG+GaJ/KgVzIG
 g0U/ZZ4ZZqZhn2r1llEPCu2PARmb65WIZcrLdpkbOHQjyuY1ztkVFH7OCXZ7zSzJfzxp
 gHwQ==
X-Gm-Message-State: AOAM5326Skaku0WzV/nano5T92TxizT6VWyDIa2LyDEajIpXub/1AM3C
 oGGplVLHZ6sEHTwJ+2OfUosjr23jxN5MCsLuTFfsON8hgXe4CsUEq/8bjxmHvO65tFGWqdqR8XP
 yebDlsgh1NG+Cex9nZA9OflegSYH/X1biuy73697KNSRoNM+8rZgdfkR8ry82
X-Received: by 2002:a05:6000:1861:b0:216:4019:9ee6 with SMTP id
 d1-20020a056000186100b0021640199ee6mr32868884wri.172.1654847946209; 
 Fri, 10 Jun 2022 00:59:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXOzqFne2CjEVK/+Ft9Ki46MAJp3wdx5iydg1BffPVqOSEfpIS1k+wvgzBi1pYQz0esT+dKg==
X-Received: by 2002:a05:6000:1861:b0:216:4019:9ee6 with SMTP id
 d1-20020a056000186100b0021640199ee6mr32868864wri.172.1654847945966; 
 Fri, 10 Jun 2022 00:59:05 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 m185-20020a1c26c2000000b003974d0d981dsm1956909wmm.35.2022.06.10.00.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:59:05 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:59:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben@bwidawsk.net>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 41/54] tests/acpi: Update q35/CEDT.cxl for new memory addresses.
Message-ID: <20220610075631.367501-42-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

The CEDT table includes addreses of host bridge registers.
There are allocated in a different order due to the previous
patch, so update to the table is needed.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Ben Widawsky <ben@bwidawsk.net>
Message-Id: <20220608145440.26106-7-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/q35/CEDT.cxl                | Bin 184 -> 184 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index effa58b75b..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/CEDT.cxl",
diff --git a/tests/data/acpi/q35/CEDT.cxl b/tests/data/acpi/q35/CEDT.cxl
index b8fa06b00e65712e91e0a5ea0d9277e0146d1c00..ff8203af070241bd23dd0eb8a51460692bb7d229 100644
GIT binary patch
delta 18
acmdnNxPx(m*~Boui7rAD&G;s!ga80Nd<HWB

delta 18
acmdnNxPx(m*~Boui7rAD&G;s!ga80Nd<HWB

-- 
MST


