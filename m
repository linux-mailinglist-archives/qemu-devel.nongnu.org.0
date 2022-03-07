Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29B34CFB1C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:29:12 +0100 (CET)
Received: from localhost ([::1]:38642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAc3-0008Jx-Ua
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:29:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACX-000216-Jd
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACW-0002o9-4D
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IjGfq51R1V+EiuJTNpSRpX5c6IUrfGMgpNpMM4jK+NE=;
 b=NNPQEKn+Ne54JmUVMAMVmtgxfZTevy/f7yaduu+5z/LpMo5Z7C+SkG/LHc50xDA580gZ6Y
 wHMOc/akIQeHKkLqMOv/2bK40afWtCjlZmjNq9HfNiVQG8ci/zRZcbLFf46ACy6zKIHOoF
 53Yg9UW/qkXA+SHULyyeiI9Dp9utOXI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-fSwmNMMVN_GjRB3_WgMRew-1; Mon, 07 Mar 2022 05:02:46 -0500
X-MC-Unique: fSwmNMMVN_GjRB3_WgMRew-1
Received: by mail-ed1-f71.google.com with SMTP id
 r9-20020a05640251c900b00412d54ea618so8269150edd.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:02:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IjGfq51R1V+EiuJTNpSRpX5c6IUrfGMgpNpMM4jK+NE=;
 b=IwOv2ERjauGG4jw9v5slsx2Wzz84hIeZ6snqgTtNoFf3+ise62NatSA6Rfyt9Zs+sc
 dhNXXZkibWTsi9jFe7USidD31FRhytYPxZ2MWSR67ArQ3npfEN48bwUrf7r4ZwYb1Uxu
 1WUcuaMzwjPltWGiu1MMX2SGkv/LVHTp3Q2lZvBwdvUjoe3EYLegjVYRjbqjJLh4DaVd
 LMsbw4187zIF/MxvBdJ3upIuxBLtMgj9y/Z5XExYVOxgpqm1GTbEGVjQijnrDzxS6TAc
 jmyWVNEfn32QUTtqjjQYeo1Ddb1pY8OEDodXI7wp/UI6I/c+WGRCieVsELUGcu3Bmjkg
 w8VA==
X-Gm-Message-State: AOAM531etFTzPhJhTbtvanqRanWW1foVruVQWcez8DdTrFbu11AeMQua
 OeVhI/R/3H4B2/WjwMq0GS1axAno+YDNgfRlUhW7bZqFoHLg8y2PV+JAjwPvU0b0YXU6KQCvXCa
 OE49GVpmg+VDOvJtnHRqhR0xTJ+0x6oPGuDpDn31tm0ou43Ckbx3kBf0QyzPx
X-Received: by 2002:a17:906:4793:b0:6db:4bd:95f1 with SMTP id
 cw19-20020a170906479300b006db04bd95f1mr7221598ejc.165.1646647364881; 
 Mon, 07 Mar 2022 02:02:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeZSOGOqpqzI3vOuo9CJW/LepmOOnsZhWbAUyti4eJE/Ydxv6uETjsSHRg4PAxL5/efapmSQ==
X-Received: by 2002:a17:906:4793:b0:6db:4bd:95f1 with SMTP id
 cw19-20020a170906479300b006db04bd95f1mr7221576ejc.165.1646647364600; 
 Mon, 07 Mar 2022 02:02:44 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 n6-20020a170906724600b006d4e2f6857dsm4543604ejk.139.2022.03.07.02.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:02:44 -0800 (PST)
Date: Mon, 7 Mar 2022 05:02:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 27/47] pcie: Add 1.2 version token for the Power Management
 Capability
Message-ID: <20220307100058.449628-28-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
Message-Id: <20220217174504.1051716-5-lukasz.maniak@linux.intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pci_regs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/pci/pci_regs.h b/include/hw/pci/pci_regs.h
index 77ba64b931..a590140962 100644
--- a/include/hw/pci/pci_regs.h
+++ b/include/hw/pci/pci_regs.h
@@ -4,5 +4,6 @@
 #include "standard-headers/linux/pci_regs.h"
 
 #define  PCI_PM_CAP_VER_1_1     0x0002  /* PCI PM spec ver. 1.1 */
+#define  PCI_PM_CAP_VER_1_2     0x0003  /* PCI PM spec ver. 1.2 */
 
 #endif
-- 
MST


