Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EB36A7CE2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:37:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHf-0006yi-HK; Thu, 02 Mar 2023 03:27:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHQ-0005o4-Bz
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHO-0002di-8k
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0gLD0kkpEIGnbkKgLONjSzYFdAd36ytp0U57Bu2N4uo=;
 b=eUqlQj0QDMi8kdOEjYe5y8OFQZeTEm5ZFaPBnOgEwOBlDPVI0NpTMr0x9QiWFVM8uPlvzn
 JwXpjF986nTvwCppH5by8pGt9EjU5wvQf0ukcJuL/qcAZutvmVAifWWNYKWWogIrkH9MGC
 lMyq7ayx880AM5W1r7Blhs/C7tafwF8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-407-a46Ra1lnMoqnHGrSXPXq8w-1; Thu, 02 Mar 2023 03:27:08 -0500
X-MC-Unique: a46Ra1lnMoqnHGrSXPXq8w-1
Received: by mail-wm1-f71.google.com with SMTP id
 n27-20020a05600c3b9b00b003e9ca0f4677so740651wms.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:27:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745627;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0gLD0kkpEIGnbkKgLONjSzYFdAd36ytp0U57Bu2N4uo=;
 b=jhsdH9wMdHf1JRtKRxBpwl82Dj061kRw7TusJ3KFdwTIKhB4/ZZkwHYjvXHrV2FY7f
 2nVYsjI29CgjVNTDdgp+iF2h72/0VtNlI5t1uHpBdkfMZo2oJdzJItlfbaUy4R/IvHHJ
 RpjtxXDQJwSPg1icX0RA+V0g70x2Ij0eUHy0PNzCwaSyZCK/BQ4JMID9YWtAFzNsA+qU
 Lj5jssq4DnhY+6tm8tU6OZrYK/IV1TmeTjlEKeNnP77ZIQdEKiAgZNFrFp80qKuzwRLj
 qLI66sRLhMghMHK0oALsQLe54qZJDaTCJT91byf6bid9OX3F9YuB3+l+2ESJSTxsudpM
 xIjA==
X-Gm-Message-State: AO0yUKUl3AqCZfp2G5ZeipxMXNfc1nXlcmRru6oaZ3kTCaNl5EnLaBQ3
 JiMuSTg/o4CE0MQbej9gigUP7dKjZh8M3dReLqhmn/pXJgutX4i/Ehrty0moJlIevxowgtz2Y0B
 ddM1oB5w9MTboKgZcO2yCTAQ/u1NV6UgGZdOTBECqsHOYjS4B4LkfPk24OSjYqgXZhw==
X-Received: by 2002:a05:600c:1c0a:b0:3eb:2e32:72c3 with SMTP id
 j10-20020a05600c1c0a00b003eb2e3272c3mr7353224wms.22.1677745627014; 
 Thu, 02 Mar 2023 00:27:07 -0800 (PST)
X-Google-Smtp-Source: AK7set84s/IwTBlVBHssnX7+RonFWlEMlkPvhJ2Q5xCzGYMDScIgDcBFlVXw6SxBh1wKQLfIG4pp5g==
X-Received: by 2002:a05:600c:1c0a:b0:3eb:2e32:72c3 with SMTP id
 j10-20020a05600c1c0a00b003eb2e3272c3mr7353206wms.22.1677745626767; 
 Thu, 02 Mar 2023 00:27:06 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c468e00b003eb369abd92sm2442806wmo.2.2023.03.02.00.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:27:06 -0800 (PST)
Date: Thu, 2 Mar 2023 03:27:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Gregory Price <gregory.price@memverge.com>,
 Fan Ni <fan.ni@samsung.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Subject: [PULL 49/53] tests: acpi: Update q35/DSDT.cxl for removed duplicate
 UID
Message-ID: <20230302082343.560446-50-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Dropping the ID effects this table in trivial fashion.

Reviewed-by: Gregory Price <gregory.price@memverge.com>
Tested-by: Gregory Price <gregory.price@memverge.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20230206172816.8201-8-Jonathan.Cameron@huawei.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/q35/DSDT.cxl                | Bin 9578 -> 9564 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 9ce0f596cc..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.cxl",
diff --git a/tests/data/acpi/q35/DSDT.cxl b/tests/data/acpi/q35/DSDT.cxl
index 3d18b9672d124a0cf11a79e92c396a1b883d0589..4586b9a18b24acd946cd32c7e3e3a70891a246d2 100644
GIT binary patch
delta 65
zcmaFmb;pa#CD<h-MwNkqQEMaDUKwr|m6-Tor}*e5Z{^9CWUMyF%dcjfyiYC^MM6#<
IB*D!F0I~xVRsaA1

delta 79
zcmccP^~#IOCD<h-OO=6vv2P>SUKwt0m6-Tor}*e5CzZ*UWUScYLp@!%?rjc`U&A<g
SyId%Wytq76o(Cw;!v+8Y7Z@l2

-- 
MST


