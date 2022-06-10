Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CE55460C1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:03:38 +0200 (CEST)
Received: from localhost ([::1]:45662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzaYJ-0002Oj-OM
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXu-0001tS-F5
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXr-0006O7-TV
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kv4i4hYRpl8dAsvKDB7y+QqINocTUK6WsSIuoyXQ5jg=;
 b=EpWrx9xV/EoubIjJzR3VB9SmY4WblE+RqSL0NAqGTGrWcaXgTz5cveKJgXDD+4UC6T8c4R
 JucTqRsf49kf44+zq/vI34o67miHolaeJ55xTLC1IQ2SVIr6VZTJUndRVYPAmgqlPT7e6o
 SznD6B0dguA/G0FYPa4WLXgYgQxMGjI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-g1im692kNZ-LnslgJn_0WQ-1; Fri, 10 Jun 2022 03:59:02 -0400
X-MC-Unique: g1im692kNZ-LnslgJn_0WQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c125-20020a1c3583000000b003978decffedso942745wma.5
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Kv4i4hYRpl8dAsvKDB7y+QqINocTUK6WsSIuoyXQ5jg=;
 b=q5dT6+wJucGR9UO7F+zARG/SqGAfa3uYU2Z9JNpsY6qLh8AtIwOtMBjXIRTIRnsjEk
 cyC0oDJ2G63KogbVmBOh/sPpEPXVlkOOK93AVmLl+KLboMg1mrJm5Lld/kw0IxBPNy8M
 ygfY16nYmyUdaJZfdyS5yQcsyAckko/DQq46CEov6Qr77Ikw8bpOQyxc/w2chMZjeMNZ
 8MWa43uzrJRjHMH5M0lr90sZ1io2YPkerFeEy3SeZJj3EbY+UYK0F44VFglUXk6bdYjn
 oMmEXyvY5T+4nAkZHdUe4smupFGWHVbSNc/ud6UxyNf8QVOcN94n+9Rp0WZS/XRcMG3K
 fVyQ==
X-Gm-Message-State: AOAM533er9OzHZXI32RSVhz21+WV/oA7FcnL5zh54UTu5GkzA+PbSIij
 VkztvO3LLbkBidThY58UfzdO1uNMx+vSLZWv+CfDCBQ7mEhxgCz/fiHq+nro+LCg6cmsPnAFgBi
 WHfUAd9VRgGu1bYam7jqvpAPaKAql5h0TZ8HWbXIEgGlgq12qTdEnHVE9OhrC
X-Received: by 2002:adf:f892:0:b0:213:3328:7a51 with SMTP id
 u18-20020adff892000000b0021333287a51mr43349767wrp.640.1654847940615; 
 Fri, 10 Jun 2022 00:59:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC6brvei4I0ganZjp4CoytsnTE2/tMBGVQXzUbj/EV2fodOIPlikXjTqRV4r4Ubpp78+xneg==
X-Received: by 2002:adf:f892:0:b0:213:3328:7a51 with SMTP id
 u18-20020adff892000000b0021333287a51mr43349739wrp.640.1654847940319; 
 Fri, 10 Jun 2022 00:59:00 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 j18-20020a05600c191200b003974a00697esm2257304wmq.38.2022.06.10.00.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:58:59 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:58:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben@bwidawsk.net>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 39/54] tests/acpi: Allow modification of q35 CXL CEDT table.
Message-ID: <20220610075631.367501-40-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

Needed to allow memory address changes as a result of next patch.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Ben Widawsky <ben@bwidawsk.net>
Message-Id: <20220608145440.26106-5-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..effa58b75b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/CEDT.cxl",
-- 
MST


