Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375476EF5EE
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 16:01:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prfgb-0003Tf-DF; Wed, 26 Apr 2023 09:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tmaillart@freebox.fr>)
 id 1prfLS-0005kS-6R
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 09:38:06 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tmaillart@freebox.fr>)
 id 1prfLP-0006CB-NW
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 09:38:05 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso46383065e9.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 06:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1682516280; x=1685108280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FW4TEW5eQ5iiO5uXVdklILR+nOdCuQS5hIi2nFpGYkQ=;
 b=wkBTjw7f2aUU0I/UuJ/lP4Cincb6IcqO/+CwH+b5riMGjGrtNHeHzf3EvJ1gBfwjFd
 phObZPf+2HDr68u4ykkOmdGfvpU9jHCcjtCZXE5iTTjOf8NVCbt7823SkiJDmHZ/FXze
 HQ1bk0cSdsXcmeTc2YHEU2Apa40diyKkYBUcRqsSQlh150XJuiuP9slKU9UD5ziGNfb7
 qNOY2ZGmgM4oUcIXkgBjKriVSbKK22wOZbMnCqgZWEFWJ3PX33ijttX6na8xdDxmyitG
 HaWnlyBbKrQypO7wtRb8n3140Vp1p5JEK/51xZuXW/pe80OwHfOuhOxbww5c++YC4M1F
 21bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682516280; x=1685108280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FW4TEW5eQ5iiO5uXVdklILR+nOdCuQS5hIi2nFpGYkQ=;
 b=cEaeZsfxrTDeyR671z2mWOjez/4/DwSfmL+nHcibyHY4yNFqiUN6KbHEveB0l/Evzp
 UBIN4xJztQI7Nhl/f1k76j0jYRBcyPvyCg1vYRlKnCFo9yy9zrpFvrFn7KcoOqj0DUQM
 LwswQUSdU26g7fRiiEv9Gn7oU725bc0eerxJru9YCt5JlQyhLzGAgKxBPA7OV99P6Ou6
 oIPlxY6ntmFdntq+hO8GSqG1KXglQb0rt+NFGyQKh/6pSC5Zv96K2MYUnAyAOmUmBP3q
 a9ZERGbHvXhhL9GvoGpWAhdbrR8O2Uumrh4MWkgpPTeDAPAhJzdVxBhOVrnsNEDDGvvx
 l06w==
X-Gm-Message-State: AAQBX9fzCrjNbjQ44d2jpzU2SVxkBXz3Ci58nR3fBitGi+wKE4NXYBII
 OjmNTKE1FmouFlIu637snlTODA==
X-Google-Smtp-Source: AKy350aF/aNSqhTSKXC5RIir9Xw8dMtESu6Ptt0a167MXvYiT7LdTlccJRPgTd7MlFv+bS1dkQDewA==
X-Received: by 2002:a7b:c447:0:b0:3f1:7006:e782 with SMTP id
 l7-20020a7bc447000000b003f17006e782mr12194294wmi.25.1682516280510; 
 Wed, 26 Apr 2023 06:38:00 -0700 (PDT)
Received: from localhost.localdomain (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a7bcb03000000b003f16f3cc9fcsm18132148wmj.9.2023.04.26.06.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 06:38:00 -0700 (PDT)
From: =?UTF-8?q?Th=C3=A9o=20Maillart?= <tmaillart@freebox.fr>
To: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?q?Th=C3=A9o=20Maillart?= <tmaillart@freebox.fr>
Subject: [PATCH] scsi: check inquiry buffer length to prevent crash
Date: Wed, 26 Apr 2023 15:37:47 +0200
Message-Id: <20230426133747.403945-1-tmaillart@freebox.fr>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=tmaillart@freebox.fr; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 26 Apr 2023 09:59:36 -0400
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

Using linux 6.x guest, at boot time, an inquiry makes qemu crash.
Here is a trace of the scsi inquiry in question:

scsi_req_parsed target 1 lun 0 tag 0x2cffb48 command 18 dir 1 length 4
scsi_req_parsed_lba target 1 lun 0 tag 0x2cffb48 command 18 lba 110592
scsi_req_alloc target 1 lun 0 tag 0x2cffb48
scsi_inquiry target 1 lun 0 tag 0x2cffb48 page 0x01/0xb0
scsi_generic_send_command Command: data= 0x12 0x01 0xb0 0x00 0x04 0x00
scsi_req_continue target 1 lun 0 tag 0x2cffb48
scsi_generic_read_data scsi_read_data tag=0x2cffb48
scsi_generic_aio_sgio_command generic aio sgio: tag=0x2cffb48 cmd=0x12 timeout=30000
scsi_generic_read_complete Data ready tag=0x2cffb48 len=4
scsi_req_data target 1 lun 0 tag 0x2cffb48 len 4
scsi_req_continue target 1 lun 0 tag 0x2cffb48
scsi_generic_read_data scsi_read_data tag=0x2cffb48
scsi_generic_command_complete_noio Command complete 0x7fb0870b80 tag=0x2cffb48 status=0
scsi_req_dequeue target 1 lun 0 tag 0x2cffb48

And here is a backtrace from the crash:

 #0  0x0000007face68580 in a_crash () at ./src/internal/atomic.h:250
 #1  get_nominal_size (end=0x7f6758f92c "", p=0x7f6758f920 "") at src/malloc/mallocng/meta.h:168
 #2  __libc_free (p=0x7f6758f920) at src/malloc/mallocng/free.c:110
 #3  0x0000005592f93ed8 in scsi_free_request (req=0x7fac2c6b50) at ../hw/scsi/scsi-generic.c:70
 #4  0x0000005592f869b8 in scsi_req_unref (req=0x7fac2c6b50) at ../hw/scsi/scsi-bus.c:1382
 #5  0x0000005592f94b7c in scsi_read_complete (opaque=0x7fac2c6b50, ret=0) at ../hw/scsi/scsi-generic.c:354
 #6  0x0000005593659b90 in blk_aio_complete (acb=0x7f66c206a0) at ../block/block-backend.c:1527
 #7  0x000000559365a3c8 in blk_aio_ioctl_entry (opaque=0x7f66c206a0) at ../block/block-backend.c:1735
 #8  0x00000055937dee64 in coroutine_bootstrap (self=0x7f672f77e0, co=0x7f672f77e0) at ../util/coroutine-sigaltstack.c:104
 #9  0x00000055937deed8 in coroutine_trampoline (signal=12) at ../util/coroutine-sigaltstack.c:145
 #10 <signal handler called>
 #11 __cp_end () at src/thread/aarch64/syscall_cp.s:30
 #12 0x0000007facea8214 in __syscall_cp_c (nr=133, u=<optimized out>, v=<optimized out>, w=<optimized out>, x=<optimized out>,
     y=<optimized out>, z=<optimized out>) at src/thread/pthread_cancel.c:33
 #13 0x0000007facefa020 in ?? ()

Signed-off-by: Théo Maillart <tmaillart@freebox.fr>
---
 hw/scsi/scsi-generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index ac9fa662b4..25246589b7 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -191,7 +191,7 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s, int len)
     if ((s->type == TYPE_DISK || s->type == TYPE_ZBC) &&
         (r->req.cmd.buf[1] & 0x01)) {
         page = r->req.cmd.buf[2];
-        if (page == 0xb0) {
+        if (page == 0xb0 && r->buflen >= 12) {
             uint64_t max_transfer = calculate_max_transfer(s);
             stl_be_p(&r->buf[8], max_transfer);
             /* Also take care of the opt xfer len. */
-- 
2.40.0


