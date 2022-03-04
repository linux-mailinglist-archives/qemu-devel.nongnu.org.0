Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C124CD5F0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:08:56 +0100 (CET)
Received: from localhost ([::1]:35892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8c3-0005sc-P8
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:08:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ88W-0007p8-7G
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:38:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ88U-0000O1-RR
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5n/FHmC/Dor0xLSEuoyybbuicDeG0aqX5h3Rj+dixSE=;
 b=Rs+LARxk2vJQuT28EOMo0w4ZfBt8mT7jvG2VEMEvSlUKHCH91jYAxUaGpRjdyMHa7qpFuB
 X9gQdLf0AMOGWyfPGzUOgELZ2vZlMn4eLda2cwJVotyhTy0UJRmeA0hGo6IKq/wCWFpJUT
 RKFTlO/daqVCHvvDh+kMjz+nqrMZDIQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-jXJi8RiOM5eODbARWh584g-1; Fri, 04 Mar 2022 08:38:20 -0500
X-MC-Unique: jXJi8RiOM5eODbARWh584g-1
Received: by mail-wr1-f69.google.com with SMTP id
 q12-20020adfbb8c000000b001ea938f79e9so3363276wrg.23
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5n/FHmC/Dor0xLSEuoyybbuicDeG0aqX5h3Rj+dixSE=;
 b=09WpYQ0CJvFkU6koh6Z/TdbQGFXmW4FWv42rVQgSApDTDpUbXz+qtgvVeOQ4SZQD+c
 3XzaL7WtIFwcpLbVLAfwSZjCw7019izo/0PVk6LMdLXVEhEgFHZ8CsF70uA5fwxn0wQb
 wiUBS7Op8sTvVVXs4vrLQUGQGV1uNswtCY8B73xEjnctRUyxS4PL2gfVs0kIDWmCpXg+
 hLHQfXojSIDYqtZZ9EzMM/gambLkRMIqcxyDoY4BLKd5lZwcVnfCTOr05LeClcnOHmZ4
 Y8MmG88ChAhUhchqW2rMCbGWCvxSBi635uo/8oblmGzt6EbPetL5VWQoobPfYX2GVcmC
 kiYg==
X-Gm-Message-State: AOAM532M07zrewvWzmdCtNOTdch/4XbcfZRy+G6c6UCDVWJUkaRTnSqH
 jd3aaW3D99t/xDGeIEb9NkrbhWzZ65G2f7YIRpl0q2Az0sw+/jzCfCreUXzM902fFn0W7QBAiue
 0IhJRWQCpbjLacfzNDRaD4Efi7RF8gEAX0//lji6p2w2dqOUihNp8eYhNAKMh
X-Received: by 2002:adf:b64c:0:b0:1e3:16d0:3504 with SMTP id
 i12-20020adfb64c000000b001e316d03504mr30533686wre.333.1646401099413; 
 Fri, 04 Mar 2022 05:38:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNfY9pJzFnPEFQ5rvuMXnyT6GRDcDCzVVICBf898eOezSpYhWPkeTAWNJZiNL7b5Qjii8CuA==
X-Received: by 2002:adf:b64c:0:b0:1e3:16d0:3504 with SMTP id
 i12-20020adfb64c000000b001e316d03504mr30533669wre.333.1646401099159; 
 Fri, 04 Mar 2022 05:38:19 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 g20-20020a05600c4ed400b003811fab7f3esm5806785wmq.30.2022.03.04.05.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:38:15 -0800 (PST)
Date: Fri, 4 Mar 2022 08:38:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/45] hw/smbios: add assertion to ensure handles of tables 19
 and 32 do not collide
Message-ID: <20220304133556.233983-9-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

Since change dcf359832eec02 ("hw/smbios: fix table memory corruption with large memory vms")
we reserve additional space between handle numbers of tables 17 and 19 for
large VMs. This may cause table 19 to collide with table 32 in their handle
numbers for those large VMs. This change adds an assertion to ensure numbers
do not collide. If they do, qemu crashes with useful debug information for
taking additional steps.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220223143322.927136-8-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/smbios/smbios.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 44c53797a4..1f8d5c252f 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -1048,6 +1048,12 @@ void smbios_get_tables(MachineState *ms,
                                        mem_array[i].length);
         }
 
+        /*
+         * make sure 16 bit handle numbers in the headers of tables 19
+         * and 32 do not overlap.
+         */
+        assert((mem_array_size + offset) < (T32_BASE - T19_BASE));
+
         smbios_build_type_32_table();
         smbios_build_type_38_table();
         smbios_build_type_41_table(errp);
-- 
MST


