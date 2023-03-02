Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC1A6A7CB7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:32:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHU-0005sI-UY; Thu, 02 Mar 2023 03:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHE-0005gq-1v
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeH3-0002bb-2t
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nnTR3xgEleaKgQugx6zt8EnPv3TKHsZvrDjaL0Vvsrk=;
 b=VAQYK/tjEI+7PCu5oW6xkrR65GAcfLAZRlB8NgofbldjCumDExgo6zkEo465UhaCziGGHd
 QCgOIXu8NVEUxlwfvgq028oQSgq3dnx1H22z81F8AQ8rFFNhfIChewJP0+er1f4yx68Sq8
 CYNiYw0iErmVlC8U/yJGKIZrULWQ6PE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-329-0yjyyI8cNsGgVopSMVL41w-1; Thu, 02 Mar 2023 03:26:45 -0500
X-MC-Unique: 0yjyyI8cNsGgVopSMVL41w-1
Received: by mail-wm1-f69.google.com with SMTP id
 l16-20020a05600c1d1000b003e77552705cso743030wms.7
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745603;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nnTR3xgEleaKgQugx6zt8EnPv3TKHsZvrDjaL0Vvsrk=;
 b=gZJ07YhpjAcPeV6M7DuYp3fqUUAqVvcS/aYW3eU46HsUCKeGnAGzK6b0wyg7FFCqiZ
 GPB+zFK2dOFvsR8ZAAF8xUZPp/5gAy7xkE/Ihc4nN3X/w3p7RN7qxLJaTVNzebl/dwOa
 SGJ7m0Y3XSbnSg9AbDKApB35+sH0NioIH13CG4vEz0JcwklyJqgC6t1ScsqJt77Aq1dj
 oWvE0+UY2A6KepcLpl9UQGlSv4QEjJixyotyrHNQozUNbDr9AIcGhJ6MQ/F5NgdXIny/
 hWSGgHrlPqhbQYGb/WQTRPKyhkRoR8D9gmCJPQZCqHOL5pDVZCdGZ44ye2cQNC+jUQzy
 AP0g==
X-Gm-Message-State: AO0yUKVUSkfWCQghAfjjUmtyI1cBDnRrlbBhluzRhy+3u1k9DDC3K6H5
 Rs7wtwzC5VoI12Lqv/C/IwmncmsQXlypsP7W9mtj2rdiWbO4jNC/RAVJvKUUFnyA7vg8uiGDn4N
 t5ypHZdd5Qf2ia91rCyQWKeQp3uAk8sFMrmLKZjpdA6ydUTXxX83vy+N94UGneLYVOg==
X-Received: by 2002:a05:600c:8518:b0:3eb:3cc9:9f85 with SMTP id
 gw24-20020a05600c851800b003eb3cc99f85mr8021200wmb.26.1677745603509; 
 Thu, 02 Mar 2023 00:26:43 -0800 (PST)
X-Google-Smtp-Source: AK7set/2pyEy5IouLjMztmLJAPfYvTgGV3rQf/FDDjjqlh6nWgdSrl2ynnKOF829DNCU1xrcPpU9iw==
X-Received: by 2002:a05:600c:8518:b0:3eb:3cc9:9f85 with SMTP id
 gw24-20020a05600c851800b003eb3cc99f85mr8021180wmb.26.1677745603255; 
 Thu, 02 Mar 2023 00:26:43 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 e16-20020a7bc2f0000000b003eb5a531232sm2147188wmk.38.2023.03.02.00.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:42 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Fan Ni <fan.ni@samsung.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 42/53] MAINTAINERS: Add Fan Ni as Compute eXpress Link QEMU
 reviewer
Message-ID: <20230302082343.560446-43-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Fan Ni has offered to help out with QEMU CXL emulation reviewing.
Add him as a designated reviewer.

Thanks to Fan for stepping up after I requested help following Ben
stepping down as co-maintainer. Fan base been active in testing
and review recently so great to have Fan on board.

Based on patch [PATCH] MAINTAINERS: Remove CXL maintainer Ben Widawsky

Message-id: <20230220212437.1462314-1-armbru@redhat.com>
Message-Id: <20230228113926.11485-1-Jonathan.Cameron@huawei.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e96e9dbfe6..a4647dd1c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2637,6 +2637,7 @@ T: git https://gitlab.com/vsementsov/qemu.git block
 Compute Express Link
 M: Ben Widawsky <ben.widawsky@intel.com>
 M: Jonathan Cameron <jonathan.cameron@huawei.com>
+R: Fan Ni <fan.ni@samsung.com>
 S: Supported
 F: hw/cxl/
 F: hw/mem/cxl_type3.c
-- 
MST


