Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA7E29E79C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 10:45:31 +0100 (CET)
Received: from localhost ([::1]:33830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY4Us-0005Dl-4a
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 05:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kY4KU-0007Dx-4W
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 05:34:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kY4KS-0006ln-8B
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 05:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603964083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JSY478yiFOxfyipIIVIRTU0bevcPEjwiKUZ7hzso9Eo=;
 b=NNBYfHeUJYyE5Yh5bUFB4D44RqCEXlNAkRKNTxRy4UJuRAHspxQ6PJhDBIZ3tC5pvKM0kS
 twmm2LBkYoUaFdV4TOs8pjUVZ2Bw2dQ0Pxh3mNt/Qx0oEV27tgUoF6IPrATezwDGMGaooi
 9IUo10TzTeNryOLSj8MpUqa7mzAjzsg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-dM_A1GD2O_6eGSKsysjmYw-1; Thu, 29 Oct 2020 05:34:42 -0400
X-MC-Unique: dM_A1GD2O_6eGSKsysjmYw-1
Received: by mail-ed1-f71.google.com with SMTP id y99so633563ede.3
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 02:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JSY478yiFOxfyipIIVIRTU0bevcPEjwiKUZ7hzso9Eo=;
 b=rbTTJAmRIWKVrCaPSr3jWVfB9NEs8oTtIUMO82ShLWrmg/5UlX4ezksNPUcuKnwxsf
 n/S1ZomgSdFy9qGvHK8ELGNEpRqnqR0jc9dXsYSTZvmzXP9aN8L/J0vNWCNK9d0fWmC9
 hlZCuwMK80z4jppi275QgA+gVIdASwHnrnC5DpZaHvUAeOMCFVOSXfqH2+5ZTqCQh+g0
 ciLsaODTzjHwuX0VvMcjRHgzfk92g/P+rCkpApn0Yzyt6ymoz6hESmwjucu+PObzE2K+
 16RuwiJZ7BvyO5KyDqQZ+YqQxNSmjOPbKD6qSORXMkM/kEJy3lBTNtZXXXiFUqAmCl/4
 2p0A==
X-Gm-Message-State: AOAM531MmUGz2FYIuDKiI7su8maPy0m8GoMka4nBMnSLFxryvGu35TnN
 RvJ379MqjckjPim40pD55EIgbpWNpYljPOFghC9g+SdPWZxHaET4UO7Jlq6tHmTUvjfOQfbJMFw
 zFcXz0jBU2dcJBYg=
X-Received: by 2002:a05:6402:392:: with SMTP id
 o18mr3052701edv.283.1603964080701; 
 Thu, 29 Oct 2020 02:34:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeYmxKt1Lq9v3GLSodnup8MdE9OlKJ3EwKtZI4k15vDKyB6ksdiQ9fU22CdMTavYoOecYPXg==
X-Received: by 2002:a05:6402:392:: with SMTP id
 o18mr3052691edv.283.1603964080561; 
 Thu, 29 Oct 2020 02:34:40 -0700 (PDT)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id m19sm1145059eda.72.2020.10.29.02.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 02:34:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 v2 17/25] block/nvme: Set request_alignment at
 initialization
Date: Thu, 29 Oct 2020 10:32:58 +0100
Message-Id: <20201029093306.1063879-18-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029093306.1063879-1-philmd@redhat.com>
References: <20201029093306.1063879-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 00:47:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Eric Auger <eric.auger@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit bdd6a90a9e5 ("block: Add VFIO based NVMe driver")
sets the request_alignment in nvme_refresh_limits().
For consistency, also set it during initialization.

Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/nvme.c b/block/nvme.c
index cd875555caf..bb75448a09f 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -758,6 +758,7 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
     s->page_size = MAX(4096, 1 << NVME_CAP_MPSMIN(cap));
     s->doorbell_scale = (4 << NVME_CAP_DSTRD(cap)) / sizeof(uint32_t);
     bs->bl.opt_mem_alignment = s->page_size;
+    bs->bl.request_alignment = s->page_size;
     timeout_ms = MIN(500 * NVME_CAP_TO(cap), 30000);
 
     /* Reset device to get a clean state. */
-- 
2.26.2


