Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B7032BA2C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 20:19:14 +0100 (CET)
Received: from localhost ([::1]:44058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHX1d-0005nZ-Nn
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 14:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWvS-0000DU-Qw
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:12:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWvP-0006wJ-Cz
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:12:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614798766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CouKFTwLkgo/uu4gqqm3VLXBNVa87X4zwN26JBMF5/w=;
 b=bXVu90Lr4EjjQQFkZAnEuCclZzbwE3jcy+EDJbtcMJxSQCVhYIDIQbURL4BZeDf21N3m6D
 Xg6unmp4QQUiSpSJAQ+xZ8SVzp8QQClliXA+9q+A4qPVgqW3iRl/sp5ra8JxFC3A2Z2Dez
 9gnYdceJQNJd4/PmoH7yTmW8QmaKe4g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-JZk-2UlRM6ihVtK-uGrTDQ-1; Wed, 03 Mar 2021 14:12:45 -0500
X-MC-Unique: JZk-2UlRM6ihVtK-uGrTDQ-1
Received: by mail-wm1-f72.google.com with SMTP id 73so3402360wma.3
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 11:12:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CouKFTwLkgo/uu4gqqm3VLXBNVa87X4zwN26JBMF5/w=;
 b=tYQ+dN2d6gblnrWHqohPI6Ab3W5Db5wAJwO2kaGeHDY0BnrpYHxDpMNd1hMvC4oEcM
 5Ajzwf83swieM48zySkz0dHHBLAqxRiuIZM2csWXsFROc04019nZOa2bBAWMiqHIuaqM
 M0iiaEinVFAVvPsb4mwh+IvjdVcBinlwnlTaeT8uVRm+SIzxlYtggOsCfSCFgDK5cGR+
 TfUa3y5bfgw7AdMzW5m0cpOt5Yxkvyo2sUIjo7e8maklWKTqClp6V/T4luQl5ziPe2dX
 jeg2ST2R8pZSzF5cOWo3pV3gHT+rDqaGRvtiE9xsuRKjj51r7qiNxXKfHhIWCccP0s4L
 LwMg==
X-Gm-Message-State: AOAM532yq0HGT0h+iQSRXkpVyPlDOyqj0GNzIH4wy5y4bvALaME+kceu
 UmuPhr549FcYIYU1/sZreY4cSBL6xZnpvPnjdBX/vjUf6VRTUa0iqhWsdzeg7JrjXjG6dYpArMQ
 ku6dpyIsNlCRhSxriuulFfmPKA27f+dwVz7aqSOMYqi3Lg9z4l2q7e/itCLzJU7lS
X-Received: by 2002:a05:600c:190a:: with SMTP id
 j10mr434498wmq.140.1614798763900; 
 Wed, 03 Mar 2021 11:12:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7KjNPYS7LmJ1FqpfG69PqrQf7LLPtRfa5i5RiOdU8sfsXXZsOLrYJYu5YQg7rrpKBCWEYcQ==
X-Received: by 2002:a05:600c:190a:: with SMTP id
 j10mr434483wmq.140.1614798763615; 
 Wed, 03 Mar 2021 11:12:43 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c184sm5706813wmf.28.2021.03.03.11.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 11:12:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 07/10] hw/net: pcnet: Remove the logic of padding short
 frames in the receive path
Date: Wed,  3 Mar 2021 20:12:02 +0100
Message-Id: <20210303191205.1656980-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303191205.1656980-1-philmd@redhat.com>
References: <20210303191205.1656980-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <1614763306-18026-7-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/pcnet.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
index f3f18d8598c..16330335cd2 100644
--- a/hw/net/pcnet.c
+++ b/hw/net/pcnet.c
@@ -987,7 +987,6 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
 {
     PCNetState *s = qemu_get_nic_opaque(nc);
     int is_padr = 0, is_bcast = 0, is_ladr = 0;
-    uint8_t buf1[60];
     int remaining;
     int crc_err = 0;
     size_t size = size_;
@@ -1000,14 +999,6 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
     printf("pcnet_receive size=%zu\n", size);
 #endif
 
-    /* if too small buffer, then expand it */
-    if (size < MIN_BUF_SIZE) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE - size);
-        buf = buf1;
-        size = MIN_BUF_SIZE;
-    }
-
     if (CSR_PROM(s)
         || (is_padr=padr_match(s, buf, size))
         || (is_bcast=padr_bcast(s, buf, size))
-- 
2.26.2


