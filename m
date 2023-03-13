Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08116B7122
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 09:27:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbdV2-00010T-7z; Mon, 13 Mar 2023 04:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pbdUx-0000zv-Ny
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:25:41 -0400
Received: from esa3.hc2706-39.iphmx.com ([68.232.154.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pbdUu-0000aa-HZ
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:25:38 -0400
X-IronPort-RemoteIP: 209.85.219.72
X-IronPort-MID: 264206816
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:G0jUT6zda8wbFgmfRml6t+eKxCrEfRIJ4+MujC+fZmUNrF6WrkUGy
 2pLDzvSPPuNMWf0fNtzbo7g8RwHsJHdzt8xTVA5rC00HyNBpPSeOdnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9j8kk/nTHNIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzJ8B56r8ks156yp4WhA5DTSWNgQ1LPgvyhNZH4gDfzpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZGBiuFIPM0SRqkEqShgJ70oOHKF0hXG7Ktm+t4sZJ
 N1l7fRcQOqyV0HGsL11vxJwSkmSMUDakVNuzLfWXcG7liX7n3XQL/pGFF4uP7Q7wNhMO1oT0
 vwUdQscche/iLfjqF67YrEEasULKcDqOMYGpCglw26DS/khRp/HTuPB4towMDUY3JgfW6aDI
 ZBAOHwwNnwsYDUWUrsTIJs6jOGknFH1bntVpE/9Sa8fuTaPllQvgOGzWDbTUuaoTMhJwmSIn
 1PbpGvrAC4EEfeWxAPQpxpAgceKx0sXQrk6DbC967tmjUOewkQVDxsZU0b9puO24nNSQPpaI
 k0QvzMw9O08qxbtQd76UBm15nWDu3bwRuZtLgHz0ynVooK83upTLjFsouJpADD+iPILeA==
IronPort-HdrOrdr: A9a23:yRFNhqh7t/ANBPwobq0/WoSU1XBQXgwji2hC6mlwRA09TyVXrb
 HLoB19726JtN91YhsdcL+7Sc+9qB/nhPxICMwqTMyftWrdyRaVxf9ZnPLfKlTbckWUh41gPO
 VbAtJD4bXLbWSS5vyKhzVQfexQpeWvweSDqd2b4U1QbTxHXYld0iYRMHflLqS0fmV77FgCea
 Z0KvAom9PZQwVuUi1zPBZlY9T+
Received: from mail-qv1-f72.google.com ([209.85.219.72])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 04:25:35 -0400
Received: by mail-qv1-f72.google.com with SMTP id
 l13-20020ad44d0d000000b004c74bbb0affso6594881qvl.21
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 01:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1678695935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDNGiHRfaVagTIiKe5GPUmnf7mt4jDwhtxyOq8vyirw=;
 b=nSEM+j9kU0xVpjyux8Irh/EmBLVpSOhTArRx7bG6uzy3cHzlxdmMDheO54F9Oh1KqO
 aqiM3/Luh7fGv49uwjaloJRjdOuOfcV9UTnOhKCalUqCnir6Mv3hm9fQ5PB/vi3/80Gf
 Ug2gkpoSbxDySKvO4JENm1Kiq13bNsfUaBjMiALm58u26e3kf9vNmtBxEZG8lKNuNNR0
 Xu5K0WmtF5Lj+TYGyhBNPfKUS93Ikd0ZnS811FX1UkbVx5g/rXOqXb7Ly8E6D0IuFXoA
 CZHHWRsMRz592WBzsopMPmZJsrBI7SjfqP4IEshThephar70GdnwwVMlanVXjGX/1rvr
 sX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678695935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WDNGiHRfaVagTIiKe5GPUmnf7mt4jDwhtxyOq8vyirw=;
 b=RAT06XJLHhGI6Rxu+ZXtbYUykzTxU265e8aRtkq946MW2w6xEPoWuVoEYqWIAbwECU
 xxShV8OB66/CZ/gK0zjDTXWFm1SxDC4+7F5Xgnt619HGGLTHxoh1GYZ9Xt7p1wODN2bV
 +jaZF8xc/js/JaeVQUUgstQrqkJsxIDxDUHzVoMyLwqVkhMkIYehb+zkHb0ZQW6vn3K6
 ELV/m7Z86u6wd2tpir+bLeS9pdcMAD9xh9npiNDNpa3/I6sM5o0BxKuS23IFNQz03QKP
 2FInmATv109/GPg2P2W6WEKaZ4Buhqq+YqRPSiUWmgsLsOY60hOOZzP4x5Mq06VnvCZR
 1KBw==
X-Gm-Message-State: AO0yUKW5rGZZW3xeNq37gr4+aoEt1X5nTFaUhebRHJbaoJig5B7Gah6z
 Bz+515Luo828QiSG3eA43v25FUDVfCeL1Clc8qL9f3tIwW5xK5tvh2dShspqBWfLf8q2ysvOH0X
 I7jYP9S0XIpJWMeZFnXvEfKR6DoHL+hUZFUxN8G5er2U=
X-Received: by 2002:ac8:570f:0:b0:3bf:b504:d5ec with SMTP id
 15-20020ac8570f000000b003bfb504d5ecmr20369567qtw.42.1678695934812; 
 Mon, 13 Mar 2023 01:25:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set8wF4H9/FhX7lx43ppj33EDcJt/A2IGj5XmzdBVBAYsi1PuZ7mMTtzb+BRJ4uIF5i3S8kx7lA==
X-Received: by 2002:ac8:570f:0:b0:3bf:b504:d5ec with SMTP id
 15-20020ac8570f000000b003bfb504d5ecmr20369550qtw.42.1678695934578; 
 Mon, 13 Mar 2023 01:25:34 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 y26-20020a37f61a000000b007436d0c60ecsm4871692qkj.65.2023.03.13.01.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 01:25:34 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Subject: [PATCH v7 5/6] memory: Allow disabling re-entrancy checking per-MR
Date: Mon, 13 Mar 2023 04:24:16 -0400
Message-Id: <20230313082417.827484-6-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230313082417.827484-1-alxndr@bu.edu>
References: <20230313082417.827484-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.154.118; envelope-from=alxndr@bu.edu;
 helo=esa3.hc2706-39.iphmx.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 include/exec/memory.h | 3 +++
 softmmu/memory.c      | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 6fa0b071f0..5154b123d8 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -791,6 +791,9 @@ struct MemoryRegion {
     unsigned ioeventfd_nb;
     MemoryRegionIoeventfd *ioeventfds;
     RamDiscardManager *rdm; /* Only for RAM */
+
+    /* For devices designed to perform re-entrant IO into their own IO MRs */
+    bool disable_reentrancy_guard;
 };
 
 struct IOMMUMemoryRegion {
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 57bf18a257..3018fa2edb 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -544,7 +544,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
     }
 
     /* Do not allow more than one simultanous access to a device's IO Regions */
-    if (mr->owner &&
+    if (mr->owner && !mr->disable_reentrancy_guard &&
         !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
         dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
         if (dev) {
-- 
2.39.0


