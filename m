Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EDD581A94
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:56:52 +0200 (CEST)
Received: from localhost ([::1]:53498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQfj-0001Z9-6A
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQ6-0006ET-GW
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQ1-00050c-Nt
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658864434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jpsf229RVYZoh0vdsWuMvhiJ5lsTXWSMWKwUhIx7fNc=;
 b=Hy4AJ7ywGRyOHwGPkteNXsqKlJS6BBJI7ZK5qyugDZyvQsgecoqBBPnlzDs2yWiZSOI4Qm
 iFlggIeN4D8N39Qr2Ua8YC88xPYTQGaJHQLsOb91Nn+MN3iq7DZ62OnmvylYrtXJvA7itn
 6wxKC904HhpPiNp0Cn57y72CsXx901M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-a47amo7jMweKS7zBuBIUGw-1; Tue, 26 Jul 2022 15:40:33 -0400
X-MC-Unique: a47amo7jMweKS7zBuBIUGw-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg6-20020a05600c3c8600b003a03d5d19e4so5694671wmb.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=Jpsf229RVYZoh0vdsWuMvhiJ5lsTXWSMWKwUhIx7fNc=;
 b=r6qMjOuvNTDwFkCEXKIIjPZx0X7zFg3bxCmOsOh2hE5eF3xnipPDWfZ+8GCRXiySXD
 pYfAImnozzxVBznRbZ0P6yyHn268NgpPPgT9Mc/h5Iad2bNCHeoUy+hxrpiGmHUh+fRr
 PzA6kb9Aigh7qqKmi0SUt71Q3ef1zm1Z1fEol9/eXsOPk8HqYFSDjorDQVa2HIriYmw8
 cnBGzQhrubK/B/5NFtY7PvSHPosLu4tLYtJ0cI/YIjrdYZJdD4QPDoObWgcoMDOlPB7T
 k59frS6muX+2p8Og0gj8zRpb5VmsD1hpUus1ZOBJKsj+3Y0Uh79R64QRAs/E8XmdcV/X
 cmNQ==
X-Gm-Message-State: AJIora9u5m5b2CQe1cYXtWun5g5XS1LnB3j+ZdOijGUInRamev8KK3oO
 rONqr6WYcg1vyI40tmqu3xoiKB/4nX3IkCpX+Q2twLH6b7ZquGMSM02pEv7Hw8FBEzhNkG7mmEJ
 AHxcJO+1mmS0gXsiVVXgkuj64aUXu8YdFXT+0SwohpYOGKCfu8avdCW5F/2jz
X-Received: by 2002:a05:6000:81e:b0:21d:8811:777b with SMTP id
 bt30-20020a056000081e00b0021d8811777bmr12217615wrb.647.1658864431770; 
 Tue, 26 Jul 2022 12:40:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tbEfsAfbJWcfFR78ifqhDe6cpviqaseuR17mUGY9aFeTlmMmV5a6wZeieJ7MOcvbFXkefi9Q==
X-Received: by 2002:a05:6000:81e:b0:21d:8811:777b with SMTP id
 bt30-20020a056000081e00b0021d8811777bmr12217599wrb.647.1658864431535; 
 Tue, 26 Jul 2022 12:40:31 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 v11-20020adfe4cb000000b0021e6b62fde2sm11048962wrm.59.2022.07.26.12.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:40:31 -0700 (PDT)
Date: Tue, 26 Jul 2022 15:40:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 02/16] hw/machine: Clear out left over CXL related pointer
 from move of state handling to machines.
Message-ID: <20220726193858.177462-3-mst@redhat.com>
References: <20220726193858.177462-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726193858.177462-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

This got left behind in the move of the CXL setup code from core
files to the machines that support it.

Link: https://gitlab.com/qemu-project/qemu/-/commit/1ebf9001fb2701e3c00b401334c8f3900a46adaa
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220701132300.2264-2-Jonathan.Cameron@huawei.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/boards.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index d94edcef28..7b416c9787 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -360,7 +360,6 @@ struct MachineState {
     CpuTopology smp;
     struct NVDIMMState *nvdimms_state;
     struct NumaState *numa_state;
-    CXLFixedMemoryWindowOptionsList *cfmws_list;
 };
 
 #define DEFINE_MACHINE(namestr, machine_initfn) \
-- 
MST


