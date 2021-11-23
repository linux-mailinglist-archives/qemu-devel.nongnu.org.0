Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6228E45A13E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 12:19:54 +0100 (CET)
Received: from localhost ([::1]:32814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTq5-0003ng-1L
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 06:19:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpTo7-00016m-Gt
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 06:17:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpTo4-00063d-Pg
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 06:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637666264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CmF7pERoUHdQNjiJjd8DIe6rsND4MdyLbzeeUwaESKE=;
 b=Efzq8BFroFaY5BeqjyTLv4eY2fwgvOZy4IGW36+16iRXzS9L1b1sQJvD1FYF+hQEI/yNU2
 yDG4EUbSUP+4K4uzLYL+rCj0NJ1+laQbP+IlL7j9tTPfLhTcADH2bvHk4j6ftRtWEzhGkW
 fsuugPWLxcyUBSHI05NPEr0AZ0EOy1Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-_EVJzIFgNMyx3LFK4BKaxA-1; Tue, 23 Nov 2021 06:17:41 -0500
X-MC-Unique: _EVJzIFgNMyx3LFK4BKaxA-1
Received: by mail-wm1-f69.google.com with SMTP id
 g81-20020a1c9d54000000b003330e488323so590715wme.0
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 03:17:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CmF7pERoUHdQNjiJjd8DIe6rsND4MdyLbzeeUwaESKE=;
 b=QLYtXgKvm96cn6zhCan4i5cJ3QD9PgkfFhjHQSXRci5KGdOz8KxLhtonKpJvUrs/Kg
 MOezihdiMddwIqbkdR7Ma1J0b0sJaSmMMObbQnVCPqbQy0bY2GKzN82Aii2jyQccdkgX
 ihUF7fi/pXRa9vNDduMvdAJk0u0xO2FQk2pdLMor08e8OuyoAEgyFRLE7MEuCUxRy/Ck
 0CxXCo5+XSGJcpqonbJDJC/NrGkXiyphypPBx57Kwt1wwzeQ/BGSbRD81UzQ+FdsODo3
 pRXAl5wgKFWiAqZuSXuFpUW7ZkFBBvpHaBJW9gNANn4nOeNdRo69galtSCMwt62fC1v6
 HgoA==
X-Gm-Message-State: AOAM531UFIaDHTL3HP5ckvpdy7mIVC96iD6D0dyi95lfn714eCKGWQCd
 EgOnbpk9iBaW2mmmA3CAXBPMtKDDoGnh8JKduYEgTK3s/LzCjV80uK2b9YhCk41l0xZUDHnYO/Y
 3+FwQjAy8PrSdrvTaumkHTnRxAO7LxN348PvObShZdqB931r5YDcvj7OaZ49Z5dEY
X-Received: by 2002:a05:600c:198f:: with SMTP id
 t15mr2126072wmq.94.1637666260181; 
 Tue, 23 Nov 2021 03:17:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUINcvIuFZJWEuvqzv+i574MexMIsYW+lEyAx2n0McCuT4X36eXXjNO0lg7MgjArOTn/Ro6A==
X-Received: by 2002:a05:600c:198f:: with SMTP id
 t15mr2125996wmq.94.1637666259708; 
 Tue, 23 Nov 2021 03:17:39 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 x13sm11697079wrr.47.2021.11.23.03.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 03:17:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 1/2] hw/scsi/lsi53c895a: Do not abort when DMA
 requested and no data queued
Date: Tue, 23 Nov 2021 12:17:31 +0100
Message-Id: <20211123111732.83137-2-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211123111732.83137-1-philmd@redhat.com>
References: <20211123111732.83137-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Cheolwoo Myung <cwmyung@snu.ac.kr>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-stable@nongnu.org, Ruhr-University <bugs-syssec@rub.de>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Poulin?= <jeromepoulin@gmail.com>,
 Vadim Rozenfeld <vrozenfe@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If asked for DMA request and no data is available, simply wait
for data to be queued, do not abort. This fixes:

  $ cat << EOF | \
    qemu-system-i386 -nographic -M q35,accel=qtest -serial none \
      -monitor none -qtest stdio -trace lsi* \
      -drive if=none,id=drive0,file=null-co://,file.read-zeroes=on,format=raw \
      -device lsi53c895a,id=scsi0 -device scsi-hd,drive=drive0,bus=scsi0.0,channel=0,scsi-id=0,lun=0
  lsi_reset Reset
  lsi_reg_write Write reg DSP2 0x2e = 0xff
  lsi_reg_write Write reg DSP3 0x2f = 0xff
  lsi_execute_script SCRIPTS dsp=0xffff0000 opcode 0x184a3900 arg 0x4a8b2d75
  qemu-system-i386: hw/scsi/lsi53c895a.c:624: lsi_do_dma: Assertion `s->current' failed.

  (gdb) bt
  #5  0x00007ffff4e8a3a6 in __GI___assert_fail
      (assertion=0x5555560accbc "s->current", file=0x5555560acc28 "hw/scsi/lsi53c895a.c", line=624, function=0x5555560adb18 "lsi_do_dma") at assert.c:101
  #6  0x0000555555aa33b9 in lsi_do_dma (s=0x555557805ac0, out=1) at hw/scsi/lsi53c895a.c:624
  #7  0x0000555555aa5042 in lsi_execute_script (s=0x555557805ac0) at hw/scsi/lsi53c895a.c:1250
  #8  0x0000555555aa757a in lsi_reg_writeb (s=0x555557805ac0, offset=47, val=255 '\377') at hw/scsi/lsi53c895a.c:1984
  #9  0x0000555555aa875b in lsi_mmio_write (opaque=0x555557805ac0, addr=47, val=255, size=1) at hw/scsi/lsi53c895a.c:2095

Cc: qemu-stable@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vadim Rozenfeld <vrozenfe@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Reported-by: Jérôme Poulin <jeromepoulin@gmail.com>
Reported-by: Ruhr-University <bugs-syssec@rub.de>
Reported-by: Gaoning Pan <pgn@zju.edu.cn>
Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
Fixes: b96a0da06bd ("lsi: move dma_len+dma_buf into lsi_request")
BugLink: https://bugs.launchpad.net/qemu/+bug/697510
BugLink: https://bugs.launchpad.net/qemu/+bug/1905521
BugLink: https://bugs.launchpad.net/qemu/+bug/1908515
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/84
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/305
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/552
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/scsi/lsi53c895a.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 85e907a7854..4c431adb774 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -621,8 +621,7 @@ static void lsi_do_dma(LSIState *s, int out)
     dma_addr_t addr;
     SCSIDevice *dev;
 
-    assert(s->current);
-    if (!s->current->dma_len) {
+    if (!s->current || !s->current->dma_len) {
         /* Wait until data is available.  */
         trace_lsi_do_dma_unavailable();
         return;
-- 
2.33.1


