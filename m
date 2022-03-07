Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD984CF9A3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:09:19 +0100 (CET)
Received: from localhost ([::1]:36684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAIo-0002Ro-2h
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:09:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABd-0000Bk-9a
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:01:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABb-0002bC-MJ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:01:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5n/FHmC/Dor0xLSEuoyybbuicDeG0aqX5h3Rj+dixSE=;
 b=FQ6nPaJKLEIngn2iXjtOSrS5g8ZEs+Orb8EA/c4VUpmYjV1BnwmsYiSn7J1bgicf2ObjYl
 Lpl6dLQLySxSx/3TaFL67CFO7l0C2kncLcjVu9BnpLL3SZ9vsk0snpFNZCKuo4J4uxhcbl
 jUSw0pAVmfUqeMrb/Gz2oGnJS2v1T7w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-_s0PTW7-PJmxbFLZHVSqrw-1; Mon, 07 Mar 2022 05:01:50 -0500
X-MC-Unique: _s0PTW7-PJmxbFLZHVSqrw-1
Received: by mail-ed1-f72.google.com with SMTP id
 bd4-20020a056402206400b004162b6d8618so2561216edb.19
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:01:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5n/FHmC/Dor0xLSEuoyybbuicDeG0aqX5h3Rj+dixSE=;
 b=SObNq9gkl/n5mdyOw/apDJSxmyrlGR84RyWFJ+p4tfboUa/5OuggWxqQnyjZTzWs9w
 BvlhlFjcV5GEa/pawEx2ddQY9ixpdjvjFa6/GxgHsDh0F6t7e/GLG4XKLuC528FqkYSS
 /uWSXM72iskWRWk2FyD+8FKrgqA7MpOBynfVRJPUHF2tkVeI7G4dSo+cc9uNFbht9Lx/
 wLYQgy/4lENt0390MGTiFMQ9Aqr/NaHveW12tr2nAU0qe5tsIXH5P69FJEUPPR2xRFCO
 +gRJl6plAn9rZTWr3xCNOF7TB4/kIpGOywsD8EmrNCIR32vW8HUuB1LVapXJYYBpr5uF
 A+3g==
X-Gm-Message-State: AOAM531v7EOSqy5PIvWveHHpfzGKbDPmWXWS/55qIJAe7aAdAbHqG5Bf
 MDHsvcDJnvl55RQmsrxGvibV9hikDwOAw7gTPPkZ5B7s1g0U6IN3wM/E2haQiFJCitSaErChqnL
 I87i4IBSxmeAKY8WD0mAFLKjH0gO1Dh/KP0ciIxxs2IWrVkkG0odTn4fOtdQY
X-Received: by 2002:a17:907:9712:b0:6b7:98d6:6139 with SMTP id
 jg18-20020a170907971200b006b798d66139mr8549558ejc.498.1646647308722; 
 Mon, 07 Mar 2022 02:01:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7+44txkDeE4+PSVlgcOq0LMXGnWDA6jRjcc0u+ULqCT/0NzyrmENCGE4dyTx8swFiSVkizQ==
X-Received: by 2002:a17:907:9712:b0:6b7:98d6:6139 with SMTP id
 jg18-20020a170907971200b006b798d66139mr8549540ejc.498.1646647308505; 
 Mon, 07 Mar 2022 02:01:48 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 i26-20020a17090671da00b006d9b2150a22sm4651878ejk.146.2022.03.07.02.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:01:48 -0800 (PST)
Date: Mon, 7 Mar 2022 05:01:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 08/47] hw/smbios: add assertion to ensure handles of tables
 19 and 32 do not collide
Message-ID: <20220307100058.449628-9-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


