Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2281529202
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 22:59:45 +0200 (CEST)
Received: from localhost ([::1]:49802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqhof-0002PS-0M
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 16:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhfg-0004D4-NY
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhfe-0006Bn-Tx
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQDv0kApVPCSffkCQxJdN5N32u+HR3YvehkbkpwI4WI=;
 b=NdbToIZ2r26XhXQTl3ILS0GGFEJ+TXRiJwy9GdbtR6qhx0wOj6vbn/HURM1+fGjk6YDtk6
 MbBUjiRI1fsEnyLJGvJYvTkG+J4gma3xdW3mUBtDaLvvQU5J7Y0e0IOiPk9hJkYDkRB0Bq
 YTCcpAkuNQ8OqOxzjSfLpiikU0izVJ8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-CS0lM3NdPf-gY6EUI_3_Uw-1; Mon, 16 May 2022 16:50:24 -0400
X-MC-Unique: CS0lM3NdPf-gY6EUI_3_Uw-1
Received: by mail-ed1-f69.google.com with SMTP id
 b14-20020a05640202ce00b0042aa312ff51so3986766edx.18
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CQDv0kApVPCSffkCQxJdN5N32u+HR3YvehkbkpwI4WI=;
 b=FHbYq4RFuOBQTD3WW7a6po2B9FiA1F2uyaU+jFbZtDGXnjbCcpnX3cjmRQwn08lsg6
 bBj5NJdX3Z7F63Zi2iUgm+dWODIaFrdFIXRUzfq81m5r+/HRi9B8Fylxf86yzkMboej3
 oZ9ceyb0K17Q33R0BTt8IXZjQP/3j9T3biMXLeJQDYnClu876+ezPiNqPhMsbhAQbalh
 X/H2Sjj1Q6msemMQIcaDGA8sx7aiklemoGOkRp9loMCqCvJQj9jcx1mNq9N2WnAwBsKn
 SJzqgUI2yw6CR+rx2JSqCZLpLhreLJJ5GhmxLEFeKCRtKlUTXyoTCyHGCQYwoNjrIHmr
 9lFg==
X-Gm-Message-State: AOAM5333RYoZ7l2llPv6Rrznbekw8P+2R9fJFwY+i1Ufu6KhaqssZzEy
 dwTKFG3aFKibAO2Vjy+Ajku+ppPn54hwUN9/USnKJ14BUqvEH2SqMN9Zpm0YvR1oGXQXn8ul0eY
 vcepVZj5Y3YDU9VCWJz9XmVgpd4ZLYAEQBan771e6IwMQ4oYNwG8P/N/NQh3Y
X-Received: by 2002:a05:6402:51d3:b0:428:ce4a:69b with SMTP id
 r19-20020a05640251d300b00428ce4a069bmr15590207edd.72.1652734222772; 
 Mon, 16 May 2022 13:50:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlpBkIgvgAHtNIyn3+rP9tIvUlPBm3NJvoaaw29qmDh9sGt39tPkJJpbds6IhTlySOfyWTQw==
X-Received: by 2002:a05:6402:51d3:b0:428:ce4a:69b with SMTP id
 r19-20020a05640251d300b00428ce4a069bmr15590188edd.72.1652734222562; 
 Mon, 16 May 2022 13:50:22 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 ia17-20020a170907a07100b006f3ef214dfesm166044ejc.100.2022.05.16.13.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:50:22 -0700 (PDT)
Date: Mon, 16 May 2022 16:50:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL v2 05/86] MAINTAINERS: Add entry for Compute Express Link
 Emulation
Message-ID: <20220516204913.542894-6-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Jonathan Cameron <jonathan.cameron@huawei.com>

The CXL emulation will be jointly maintained by Ben Widawsky
and Jonathan Cameron.  Broken out as a separate patch
to improve visibility.

Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-4-Jonathan.Cameron@huawei.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fbc0662627..dff0200f70 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2545,6 +2545,13 @@ F: qapi/block*.json
 F: qapi/transaction.json
 T: git https://repo.or.cz/qemu/armbru.git block-next
 
+Compute Express Link
+M: Ben Widawsky <ben.widawsky@intel.com>
+M: Jonathan Cameron <jonathan.cameron@huawei.com>
+S: Supported
+F: hw/cxl/
+F: include/hw/cxl/
+
 Dirty Bitmaps
 M: Eric Blake <eblake@redhat.com>
 M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
-- 
MST


