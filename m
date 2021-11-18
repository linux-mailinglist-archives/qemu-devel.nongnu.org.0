Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD796455B14
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 12:59:12 +0100 (CET)
Received: from localhost ([::1]:54318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mng4N-0003fU-Nv
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 06:59:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mng31-0001b8-Bi
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 06:57:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mng2x-0002Kx-8m
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 06:57:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637236662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lzuKn55Ra2wJ3rJCLCQizOMIU4b9FmjwBEXrIOw78PQ=;
 b=GBXB10CgdpaZz6NIi4QtUo7BLS85j+gojFpbtGoNahhtJzlQbcM9uecEpCsX7zAxrz3NGj
 ujLub6JDZOMzyyzMTrBD5E8IQBudxTFvgYDm5rXjKjfc9MSq8izWk9DZmyDyqFr5UV9CPv
 hy79PWWADmLVKyURNeEEflDpxqIljaA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-czcLtpefM5eUG36xn3n9Ag-1; Thu, 18 Nov 2021 06:57:41 -0500
X-MC-Unique: czcLtpefM5eUG36xn3n9Ag-1
Received: by mail-wm1-f72.google.com with SMTP id
 m18-20020a05600c3b1200b0033283ea5facso2147004wms.1
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 03:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lzuKn55Ra2wJ3rJCLCQizOMIU4b9FmjwBEXrIOw78PQ=;
 b=JHUeFJcoaZBdishnm9mzV/7bmIiLLV5Ut10bBZsDToS0sIrnRRBek9bfXrQiCi3boz
 8WjsrWKLmLXX8Qxjk3alEne4lmcjuCXd4rsDri/T+gdaFICWBA7xD/KFQ5omze/jXSZY
 ZB2+sRBv1/BY+Ck2tEtM5ItgRwfvycbgghcMaUblNVS+6VDsHnB3NYhFXFp1+KcNmDMV
 YUMc7RB9/Dfx32Faz0bOGeM4+33C+x+IbyPg3+jORa3CaIZTv2LBWAXRD36dEi9vuycR
 pxLQXnbigOpW9/s1KSfD0CGZJv3Wr6VOH6l9f/RL25Ljcma7qTi1KFd5KuRTUURUwbAM
 u8uw==
X-Gm-Message-State: AOAM531HrgtFqb/Bqi6l8M6C+lmv5Gs0EK8WSljqhJe1isZt+rqbjrqf
 CY/Ilj0EpSmDdBttIDYjyDArVjoCBAUURVbqRqed/swvwxognB1RPlEA3uSKMfEQCtp2xdOBeA8
 Q1ME9+WfwXCX1Xgx+20tnmBVeW/Y4Mn4d1E06cEFIceSw8vGzciIN8O11bQiBGfNo
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr30807014wrf.302.1637236660156; 
 Thu, 18 Nov 2021 03:57:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdp0aWMtmZRvlrchyr32NULq7lw+F8Vt9m4D8MyUnucb5PwN2Bv9qCPaKbiA8EO5mDAgKOSw==
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr30806954wrf.302.1637236659809; 
 Thu, 18 Nov 2021 03:57:39 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 f7sm11461195wmg.6.2021.11.18.03.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 03:57:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 1/2] hw/block/fdc: Prevent end-of-track overrun
 (CVE-2021-3507)
Date: Thu, 18 Nov 2021 12:57:32 +0100
Message-Id: <20211118115733.4038610-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211118115733.4038610-1-philmd@redhat.com>
References: <20211118115733.4038610-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-stable@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the 82078 datasheet, if the end-of-track (EOT byte in
the FIFO) is more than the number of sectors per side, the
command is terminated unsuccessfully:

* 5.2.5 DATA TRANSFER TERMINATION

  The 82078 supports terminal count explicitly through
  the TC pin and implicitly through the underrun/over-
  run and end-of-track (EOT) functions. For full sector
  transfers, the EOT parameter can define the last
  sector to be transferred in a single or multisector
  transfer. If the last sector to be transferred is a par-
  tial sector, the host can stop transferring the data in
  mid-sector, and the 82078 will continue to complete
  the sector as if a hardware TC was received. The
  only difference between these implicit functions and
  TC is that they return "abnormal termination" result
  status. Such status indications can be ignored if they
  were expected.

* 6.1.3 READ TRACK

  This command terminates when the EOT specified
  number of sectors have been read. If the 82078
  does not find an I D Address Mark on the diskette
  after the second· occurrence of a pulse on the
  INDX# pin, then it sets the IC code in Status Regis-
  ter 0 to "01" (Abnormal termination), sets the MA bit
  in Status Register 1 to "1", and terminates the com-
  mand.

* 6.1.6 VERIFY

  Refer to Table 6-6 and Table 6-7 for information
  concerning the values of MT and EC versus SC and
  EOT value.

* Table 6·6. Result Phase Table

* Table 6-7. Verify Command Result Phase Table

Fix by aborting the transfer when EOT > # Sectors Per Side.

Cc: qemu-stable@nongnu.org
Cc: Hervé Poussineau <hpoussin@reactos.org>
Fixes: baca51faff0 ("floppy driver: disk geometry auto detect")
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/339
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/fdc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index fa933cd3263..d21b717b7d6 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -1512,6 +1512,14 @@ static void fdctrl_start_transfer(FDCtrl *fdctrl, int direction)
         int tmp;
         fdctrl->data_len = 128 << (fdctrl->fifo[5] > 7 ? 7 : fdctrl->fifo[5]);
         tmp = (fdctrl->fifo[6] - ks + 1);
+        if (tmp < 0) {
+            FLOPPY_DPRINTF("invalid EOT: %d\n", tmp);
+            fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, FD_SR1_MA, 0x00);
+            fdctrl->fifo[3] = kt;
+            fdctrl->fifo[4] = kh;
+            fdctrl->fifo[5] = ks;
+            return;
+        }
         if (fdctrl->fifo[0] & 0x80)
             tmp += fdctrl->fifo[6];
         fdctrl->data_len *= tmp;
-- 
2.31.1


