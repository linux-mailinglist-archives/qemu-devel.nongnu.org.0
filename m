Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4524058C8E1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:59:29 +0200 (CEST)
Received: from localhost ([::1]:35028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL2Lw-000525-BV
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oL2Jo-0007kK-H8
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:57:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oL2Jl-0001fB-Hm
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659963432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zjIkCOrgZJsNDwC0p4zt66uvkq6oMqFfMYuPDOdWkN8=;
 b=TTce/J3+aSz3orY6rWWA8BaDce752jFqRqsetWgaxaJPYDk+rXEPzBXUOtCwF6s2TqZFHj
 SYPL7BIKTe/x48X1cZqHF9ckxJ0IfItkI6/UvNg+e+QiCy+mNMEVK/+jATlBFy6bz/iisg
 BdeC6mpeV70XISiWVeJD/1UP9hjT7xM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-mTA3HluPOsuKDCRSpYgHXg-1; Mon, 08 Aug 2022 08:57:11 -0400
X-MC-Unique: mTA3HluPOsuKDCRSpYgHXg-1
Received: by mail-ed1-f71.google.com with SMTP id
 l19-20020a056402255300b0043df64f9a0fso5629503edb.16
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 05:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=zjIkCOrgZJsNDwC0p4zt66uvkq6oMqFfMYuPDOdWkN8=;
 b=wJ0hw64B70A7vsHd9DXPoQ45sOhh0WVuUyUJQBdlG2Pd8Ut49sLSFZXNxRyg4hXlcB
 WbpXIkgag/4pe65g90+GQi4Ldx5Yzi3uSA2UrgbyvxWkcqDK0BozVfWTp7lEVmgIWlBz
 udURmyCI5Z7r0rIrAaeWDAismzASXxLXrS1Fl4zrwVVHEi4jTyFv4NjHB8b7Y4xy9nNF
 wzRbakeWbIP2k+UDsOwj8D0EzPwEgSLxhWa6cfaQ6xSxM4pJIqUkJXkJ1CDKXxQxmO1L
 uucp/WHHkbps16PDArTiPrsk29ABth3R+lDqrsyzTO870A2Kq76czcukR3IDSEb4IULp
 s13Q==
X-Gm-Message-State: ACgBeo10IVK2NmluDCUF8Nsz9IOs6LHlg8W0eXbxHZMjkatLpUPdIF3b
 zXcrnBuo5QkLvn9D8ws0A384jnQ88XjBPoCpDx7fjqYp0ygLqixgJJ5NnH6t6tjdJpaJ4hLsyhp
 GYjoSpdeqlE9TI4uQkwlJt9flF2juIJSijqtFmDRwQK9va9BWcIRhXXadY4zq3G8ia1E=
X-Received: by 2002:a05:6402:241e:b0:440:2c03:cdc8 with SMTP id
 t30-20020a056402241e00b004402c03cdc8mr12858379eda.237.1659963430128; 
 Mon, 08 Aug 2022 05:57:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4B5xYqF+41di3pxL99/8vW53gx6GaXfhxURrKcXs7rqNO3EXNTr9qWtzQn4qsMxkeyWRmEDg==
X-Received: by 2002:a05:6402:241e:b0:440:2c03:cdc8 with SMTP id
 t30-20020a056402241e00b004402c03cdc8mr12858360eda.237.1659963429757; 
 Mon, 08 Aug 2022 05:57:09 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 iy20-20020a170907819400b00730cc173c6asm4924378ejc.43.2022.08.08.05.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 05:57:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 1/5] scsi-disk: fix overflow when block size is not a multiple
 of BDRV_SECTOR_SIZE
Date: Mon,  8 Aug 2022 14:57:02 +0200
Message-Id: <20220808125706.60511-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808125706.60511-1-pbonzini@redhat.com>
References: <20220808125706.60511-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

In scsi_disk_emulate_write_same() the number of host sectors to transfer is
calculated as (s->qdev.blocksize / BDRV_SECTOR_SIZE) which is then used to
copy data in block size chunks to the iov buffer.

Since the loop copying the data to the iov buffer uses a fixed increment of
s->qdev.blocksize then using a block size that isn't a multiple of
BDRV_SECTOR_SIZE introduces a rounding error in the iov buffer size calculation
such that the iov buffer copy overflows the space allocated.

Update the iov buffer copy for() loop so that it will use the smallest of either
the current block size or the remaining transfer count to prevent the overflow.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220730122656.253448-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index f5cdb9ad4b..3027ac3b1e 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1849,7 +1849,7 @@ static void scsi_disk_emulate_write_same(SCSIDiskReq *r, uint8_t *inbuf)
     uint32_t nb_sectors = scsi_data_cdb_xfer(r->req.cmd.buf);
     WriteSameCBData *data;
     uint8_t *buf;
-    int i;
+    int i, l;
 
     /* Fail if PBDATA=1 or LBDATA=1 or ANCHOR=1.  */
     if (nb_sectors == 0 || (req->cmd.buf[1] & 0x16)) {
@@ -1891,8 +1891,9 @@ static void scsi_disk_emulate_write_same(SCSIDiskReq *r, uint8_t *inbuf)
                                               data->iov.iov_len);
     qemu_iovec_init_external(&data->qiov, &data->iov, 1);
 
-    for (i = 0; i < data->iov.iov_len; i += s->qdev.blocksize) {
-        memcpy(&buf[i], inbuf, s->qdev.blocksize);
+    for (i = 0; i < data->iov.iov_len; i += l) {
+        l = MIN(s->qdev.blocksize, data->iov.iov_len - i);
+        memcpy(&buf[i], inbuf, l);
     }
 
     scsi_req_ref(&r->req);
-- 
2.37.1



