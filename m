Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 093563633D7
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 07:34:03 +0200 (CEST)
Received: from localhost ([::1]:50016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lY04H-0004f9-HD
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 01:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lY01I-0003F3-9E
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 01:30:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lY01D-0003Mo-Fd
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 01:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618723845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=43bazn4MAQDKKJ2IP24UDcQthLAr4B7gvcld2Qsh8oE=;
 b=RJe05ojqzq/txxY9c1nAgJgJFmbEQ8Vnm016XqTpWsqqCF9b1nvzK/7Xsyd3Ac44GoPFqf
 23RwCmjzWdrnpuhkstigF8PNia8vdJ41dWhQ9m9Qf2CIN7eKCfBCWXHcaQB87Wp33oqqz7
 G84ofBahuDIC9gFnssnvrx98K8oLjMg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-agkK1G84Oq-X4ZIFBTfH7g-1; Sun, 18 Apr 2021 01:30:43 -0400
X-MC-Unique: agkK1G84Oq-X4ZIFBTfH7g-1
Received: by mail-wr1-f69.google.com with SMTP id
 32-20020adf84230000b029010705438fbfso1864435wrf.21
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 22:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=43bazn4MAQDKKJ2IP24UDcQthLAr4B7gvcld2Qsh8oE=;
 b=mqsNaziZS8FaNmDdVjnISSJe/WjmgwRNR1kYZujBfewc8on4gm9qXX4s20vz2b0+Vv
 LaXEKmwShI3Rk1dVT7T1Y2SzbFnp8a0qNSaCvCNrQu9JOQvwwwRuhSGsehUof9t9QBUr
 of+MMaASjg6GSXc27JBxBBGmmxys64SaKNyL815BLZjIYkDkGGCW4zTaA0GkxAe2V1Mc
 h8U/UNdXRQmkyPYaVPawFJ3hHfUXdZJeL+JcKM74H1E85Of9ePuZcs/4g3pPBm2Ogx3L
 l6tgAPhX3towqcPcWCwmoLW6INJHqgA3NmeQHqAAttLxmViMfSPadAbqUG1kXCVw2Y+e
 uv6w==
X-Gm-Message-State: AOAM53294xVp6SvDa7o10jbVdA+h0dn9G3MTbWQ4WGzgr/ebpFDt8/lM
 IV+R9+cipsQyTa1W6sG/mbh/9fscdNloFZhiRNbZW1v63QnvB1p7EMB67lSg7P42jNjPgrHN+/d
 dEYfDEVabnI85ax9FnVhcB7Fg2vx3/goy4WFpyISFC0WpXvJJh8/gZINQYI0FQWMn
X-Received: by 2002:a7b:ce09:: with SMTP id m9mr15610766wmc.150.1618723842196; 
 Sat, 17 Apr 2021 22:30:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3dWLILIDucIvLB9IFgT9ot/UJHVgPIDLsW+6+BY5Lj5VRrK95dAfRcNF6GqdyPL1n6gvr/Q==
X-Received: by 2002:a7b:ce09:: with SMTP id m9mr15610742wmc.150.1618723841981; 
 Sat, 17 Apr 2021 22:30:41 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f1sm13142249wru.60.2021.04.17.22.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 22:30:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0? v2] mptsas: Remove unused MPTSASState 'pending' field
 (CVE-2021-3392)
Date: Sun, 18 Apr 2021 07:30:39 +0200
Message-Id: <20210418053039.811996-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Don Slutz <Don@CloudSwitch.com>, Li Qiang <liq3ea@gmail.com>,
 qemu-stable@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cheolwoo Myung <cwmyung@snu.ac.kr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Tokarev <mjt@tls.msk.ru>

While processing SCSI i/o requests in mptsas_process_scsi_io_request(),
the Megaraid emulator appends new MPTSASRequest object 'req' to
the 's->pending' queue. In case of an error, this same object gets
dequeued in mptsas_free_request() only if SCSIRequest object
'req->sreq' is initialised. This may lead to a use-after-free issue.

Since s->pending is actually not used, simply remove it from
MPTSASState.

Cc: qemu-stable@nongnu.org
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>
Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
BugLink: https://bugs.launchpad.net/qemu/+bug/1914236 (CVE-2021-3392)
Fixes: e351b826112 ("hw: Add support for LSI SAS1068 (mptsas) device")
[PMD: Reworded description, added more tags]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Supersedes: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>

MJT patch:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg799236.html

Since rc4 is soon, I'm directly respining his patch with my comments
addressed.

This is not a new regression (present since QEMU v2.6.0) but is a
CVE...

PJP first patch:
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg02660.html
---
 hw/scsi/mptsas.h | 1 -
 hw/scsi/mptsas.c | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/hw/scsi/mptsas.h b/hw/scsi/mptsas.h
index b85ac1a5fcc..c046497db71 100644
--- a/hw/scsi/mptsas.h
+++ b/hw/scsi/mptsas.h
@@ -79,7 +79,6 @@ struct MPTSASState {
     uint16_t reply_frame_size;
 
     SCSIBus bus;
-    QTAILQ_HEAD(, MPTSASRequest) pending;
 };
 
 void mptsas_fix_scsi_io_endianness(MPIMsgSCSIIORequest *req);
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index 7416e787061..5abbc742aaf 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -257,7 +257,6 @@ static void mptsas_free_request(MPTSASRequest *req)
         req->sreq->hba_private = NULL;
         scsi_req_unref(req->sreq);
         req->sreq = NULL;
-        QTAILQ_REMOVE(&s->pending, req, next);
     }
     qemu_sglist_destroy(&req->qsg);
     g_free(req);
@@ -303,7 +302,6 @@ static int mptsas_process_scsi_io_request(MPTSASState *s,
     }
 
     req = g_new0(MPTSASRequest, 1);
-    QTAILQ_INSERT_TAIL(&s->pending, req, next);
     req->scsi_io = *scsi_io;
     req->dev = s;
 
@@ -1319,8 +1317,6 @@ static void mptsas_scsi_realize(PCIDevice *dev, Error **errp)
 
     s->request_bh = qemu_bh_new(mptsas_fetch_requests, s);
 
-    QTAILQ_INIT(&s->pending);
-
     scsi_bus_new(&s->bus, sizeof(s->bus), &dev->qdev, &mptsas_scsi_info, NULL);
 }
 
-- 
2.26.3


