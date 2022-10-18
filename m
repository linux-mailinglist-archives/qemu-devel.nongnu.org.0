Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD1F602D88
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:57:27 +0200 (CEST)
Received: from localhost ([::1]:47806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn5x-00020H-BY
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmge-0002K6-NS
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgV-0004z2-DB
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SoCij7i/9X4juBWaniX6jsRov2N8yHMFa3Jfri+4JLA=;
 b=Y59DM32PnwEp+D8JIoFK+Task/ECAFXDsJOS8DmcotZzB9zTorW3dZhQGWYcnP8vDhntRi
 m+o+bDPOK5g7Zpq9HdN7DANu2LFcz9Flc7qQNXBOMXpUbY84tzWtoZlbAID8pz2yyf5cAL
 DiKq1i0/NYbGFv+72l5dPez7huG2i6k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-498-ff6AnEJHN6SbRmjXwgU5Vw-1; Tue, 18 Oct 2022 09:31:04 -0400
X-MC-Unique: ff6AnEJHN6SbRmjXwgU5Vw-1
Received: by mail-ed1-f71.google.com with SMTP id
 z20-20020a05640240d400b0045cec07c3dcso11493953edb.3
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SoCij7i/9X4juBWaniX6jsRov2N8yHMFa3Jfri+4JLA=;
 b=VgKRNTcw+Z7MJM7kMRyQwb7eW1npgtO4rJWhFTLi9yN+qMDy9amu/ZmE5iUcNqOje7
 DEeF3vQSXuLn8kmOsD7V3rNdW9Dl/vNuzyBd1SU09dEQPTdpLOuNSTLTh4JirfZta85v
 4e55mmW//wqFn+zdtnLTaF0cDRUePIEQAYiTn/dxhlSb7sJEgpgPoy1Ux5fB3culjyum
 v44AeoelpnkmWM2vA2aV6zqMuS9titC0z7nX6tCVv2MjNk1fw5eJkXNMCQp5DaR/QNO9
 zF/rJvIy5tU5HOz0dXUTGuKoJopvJC0c53wE7nkNEQYb3UPm60PEs8Iy2mZrCXHLlAnp
 qpzQ==
X-Gm-Message-State: ACrzQf0fzYQSbj94TMecSeF8vaF1HJVjQjpWf4S14etzdUvAtz5zyQan
 kYlQ6D2y/FNbtm1uEZDKvB/KjTJAJsBHkopeLtBjOwAicOUyvun5KAafBGWVtNHFhlc1FpQB5cg
 pZaYcvJe+DI/QvaiAb6mJ0aSbDX7Bzwyg13zUbrjvbfo6mnIODeLj8jZIc2x9UnMBFfk=
X-Received: by 2002:a17:906:8b81:b0:78e:1cb:e411 with SMTP id
 nr1-20020a1709068b8100b0078e01cbe411mr2346758ejc.681.1666099861844; 
 Tue, 18 Oct 2022 06:31:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6UzxtNMTMfvudUtnhQCCKxriOcn73mCmKvh1fQGSsMVsTWIETTDEg+pKzFaX2w1hjhz71kRQ==
X-Received: by 2002:a17:906:8b81:b0:78e:1cb:e411 with SMTP id
 nr1-20020a1709068b8100b0078e01cbe411mr2346735ejc.681.1666099861519; 
 Tue, 18 Oct 2022 06:31:01 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090627cd00b0077826b92d99sm7587315ejc.12.2022.10.18.06.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:31:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/53] hw/scsi/vmw_pvscsi.c: Use device_cold_reset() to reset
 SCSI devices
Date: Tue, 18 Oct 2022 15:29:53 +0200
Message-Id: <20221018133042.856368-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Currently the vwm_pvscsi controller resets individual SCSI devices
with the device_legacy_reset() function.  The only difference between
this and device_cold_reset() is that device_legacy_reset() resets the
device but not any child qbuses it might have.

In this case, no SCSI device has a child qbus, so the functions have
the same behaviour.  Switch to device_cold_reset() to move away from
using the deprecated function, and bring this SCSI controller in to
line with what all the others do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20221013160623.1296109-3-peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/vmw_pvscsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 3ea2c8c9f2..fa76696855 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -880,7 +880,7 @@ pvscsi_on_cmd_reset_device(PVSCSIState *s)
 
     if (sdev != NULL) {
         s->resetting++;
-        device_legacy_reset(&sdev->qdev);
+        device_cold_reset(&sdev->qdev);
         s->resetting--;
         return PVSCSI_COMMAND_PROCESSING_SUCCEEDED;
     }
-- 
2.37.3


