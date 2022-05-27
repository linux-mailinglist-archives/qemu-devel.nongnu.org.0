Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E1953661B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:44:49 +0200 (CEST)
Received: from localhost ([::1]:35224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nud4y-0006eb-Sx
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1nucgq-0005bi-Pg
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:19:53 -0400
Received: from esa1.hc2706-39.iphmx.com ([68.232.153.39]:31872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1nucgo-0000sY-9w
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:19:51 -0400
X-IronPort-RemoteIP: 209.85.219.69
X-IronPort-MID: 203561255
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:24zeO6/VXw8J9L9CAM5ZDrUDC3yTJUtcMsCJ2f8bNWPcYEJGY0x3z
 msfDDuCb6yMMWCneIwlPY/l/RkPucPWzNFjSAY6pXwxFiIbosf7XuiUfxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXjXFvW0
 T/Pi5a31GGNimYc3l08tvrrRCNH5JwebxtB4zTSzdgS1LPvvyB94KA3fMldHFOhKmVgJdNWc
 s6YpF2PEsI1yD92Yj+tuu6TnkTn2dc+NyDX4pZdc/HKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 ItB7LCTRjkjAqPruMQtSShmKiBDN7ITrdcrIVDn2SCS50jPcn+p2us3SU9obMsX/eF4BWwI/
 vsdQNwPRkrb1qTmnfThE7gq2JVLwMrDZevzvllpySHfAewOS42FTqnXjTNd9G1o3Z0QRKyDO
 qL1bxJeZyj5aEReGW4vVqkapOeLmXngSWZH/Qf9Sa0fpjK7IBZK+KHgNceQdtGUSMF9mEGeq
 WTbuWPjDXkn2Me3zDOE9je1mLaKk32qHo0VE7K8+7hhh1j7KnEvNSD6nGCT+ZGR4nNSkfoCQ
 6DI0kLCdZQPyXE=
IronPort-HdrOrdr: A9a23:BSeReayqQS8yjjmBQTvXKrPwF71zdoMgy1knxilNoH1uA7Wlfq
 WV98jzuiWE7wr5NEtQ+uxoQZPhfZq+z+8S3WByB9qftWDd0QPDEGgF1/qB/9SKIVybygcy79
 YET0FIMrHN5IlB7PoTsWGDferJnrG8n5yVuQ==
Received: from mail-qv1-f69.google.com ([209.85.219.69])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 May 2022 12:19:47 -0400
Received: by mail-qv1-f69.google.com with SMTP id
 i6-20020a0cd846000000b0046262337c65so3839917qvj.20
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AdLGVPcZKgA+l0HAEpQh7s+OnX+vK+PiCgIEHryKUu4=;
 b=KNphNlHoeOkgP2b2eWvhOUikGhImY05w9tKI89l5igEsvxOhlGDkEzNXEkgA5jOgy3
 dHFPyH0n/a0e3+AlAm7E2SJjBEDfb9jL1efcD/KC+LTh+s7ZzCFfeX9Makk2kFUuyn9T
 1lUVXQIph3xtO1a6OerdF4QaCVn1FMIR4o9+IUjWRTHprMEIWdRFM4HXjFox+RSfJ2Ls
 cccaAa5F2ks0x+pFzWq4ugvzm09u5fmc6wdbzr77YVOh1RvXx2SoUusa2u/oZCWJvDNL
 LlTxzozAxTU2wDEaWKEljhO5BMePgb6YDYuBFNx8rwBmOtyXII4L6R0LHW5F8yCZQSwk
 iyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AdLGVPcZKgA+l0HAEpQh7s+OnX+vK+PiCgIEHryKUu4=;
 b=chFEmkYzeWqn7EGEBMftEmDM1DmvgTHoaoQg9g/p1cXz3hxEttbChIGUSt9MIHBgPz
 sKHgGs+usynzTr8oBugIxoMK56YBmtDj4h8snyAUqvuDGum/x7qP8HTajxD2IFnlsWKb
 6T8rw7fUXsST5QLBZN5ES5W353rXpYyrZ6DqLZyyOYi1PgWRLpNwTFhUdbjDhWc8JS6s
 ugytvek2WB5KCPhoOfXpM2vPcNl917h26t/FNj2RzSaK3Ki0uslaYGbeEJoXjDuG9oLr
 tF8YfDNRg7DDN50VkbsbcInM20vcd/S5wGHsQDf3+jfES7R/S7tK3Ajhd8ZGai8steuy
 GOdQ==
X-Gm-Message-State: AOAM533BtdQmnrg8NbeZUfOjpWVORLaIuSdGLwu351lGM9fge3/XQrxD
 V7Fem6NRZnzuOBxsjJn+BibNEvPT7yDCB5XdgkDXRzdhLnVDYUr4Wl2qcwA4l5ETfAv5F26xNZ0
 WrTGj73tlqlOkHijhYOtyezXeMu0OAw==
X-Received: by 2002:a05:622a:1ca:b0:2f3:e805:5c36 with SMTP id
 t10-20020a05622a01ca00b002f3e8055c36mr34077923qtw.394.1653668386924; 
 Fri, 27 May 2022 09:19:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7Uxl/B1RDgXmpc/232D40RyEGOKR0aqhhi9CYk2rGos3PAJWpYjkU69+xr1jgJXyIWdSNmQ==
X-Received: by 2002:a05:622a:1ca:b0:2f3:e805:5c36 with SMTP id
 t10-20020a05622a01ca00b002f3e8055c36mr34077893qtw.394.1653668386647; 
 Fri, 27 May 2022 09:19:46 -0700 (PDT)
Received: from stormtrooper.vrmnet (pool-72-70-35-75.bstnma.fios.verizon.net.
 [72.70.35.75]) by smtp.gmail.com with ESMTPSA id
 x190-20020a3763c7000000b006a33c895d25sm2993777qkb.21.2022.05.27.09.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:19:45 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 1/3] memory: Track whether a Device is engaged in IO
Date: Fri, 27 May 2022 12:19:35 -0400
Message-Id: <20220527161937.328754-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220527161937.328754-1-alxndr@bu.edu>
References: <20220527161937.328754-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.153.39; envelope-from=alxndr@bu.edu;
 helo=esa1.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
This flag should be set/checked prior to calling a device's MemoryRegion
handlers, and set when device code initiates DMA.  The purpose of this
flag is to prevent DMA reentrancy issues. E.g.:
sdhci pio -> dma write -> sdhci mmio
nvme bh -> dma write -> nvme mmio

These issues have led to problems such as stack-exhaustion and
use-after-frees.

Assumptions:
 * Devices do not interact with their own PIO/MMIO memory-regions using
   DMA.

 * There is now way for there to be multiple simultaneous accesses to a
   device's PIO/MMIO memory-regions, or for multiple threads to perform
   DMA accesses simultaneously on behalf of a single device.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 include/hw/qdev-core.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 92c3d65208..6474dc51fa 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -193,6 +193,9 @@ struct DeviceState {
     int instance_id_alias;
     int alias_required_for_version;
     ResettableState reset;
+
+    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
+    int engaged_in_io;
 };
 
 struct DeviceListener {
-- 
2.33.0


