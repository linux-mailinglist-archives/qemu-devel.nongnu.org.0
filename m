Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6E55BCD96
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 15:48:39 +0200 (CEST)
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaH8Y-00035e-Q1
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 09:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaH1k-00066x-CG
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:41:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaH1h-0001kU-D3
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:41:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663594892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Pj4YI1EbEjLq11Ta/hqOEQN7kn7r7RkoCyk4aYS+xIw=;
 b=ZxwffiumcFEa7rm+t80ED5paQG9lIAasqKVsQ3bKGTF85S27fFUB98PfnWF6GDdYANg8wZ
 MYh0BEo4NscTL1tnhCahDl90C87EJMrwz+jhPsF/FulvLfrnXv2Jgz8EZ8ui4UI5iAVMHt
 oS7KCDLugmgFtVz50bJzUVbnHnlAvSA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-513-dBE-o_ELOFeMqOg0wlWJvw-1; Mon, 19 Sep 2022 09:41:30 -0400
X-MC-Unique: dBE-o_ELOFeMqOg0wlWJvw-1
Received: by mail-wr1-f69.google.com with SMTP id
 m2-20020adfc582000000b0021e28acded7so6632231wrg.13
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 06:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Pj4YI1EbEjLq11Ta/hqOEQN7kn7r7RkoCyk4aYS+xIw=;
 b=Gjw4dJVJE/mOpjFPmAFL6Fb7/4ITcljiDv6Gf6yP7vlblIIAwkV0ZnaHLZeSGbUi9c
 4+UUglUf3PI9T0i4Bsf4VuuSc7A4+i9S5jqIrBebf+hySg3pe0PiYSCRkVSb7j7Owdm1
 5Cc2fsSkHyzfY2xnXhocY4+q9sHLRhgkrZB2j7lKz3XeMfIQAgMdmS4yNZw6lvm4YXlk
 dyzKqJBVTl6a9j6ZRQJeFRkfHzrrbZMeqmZib7dhtxYGU34NJfzK+YbF0LJadtH1ytyo
 lL6WQE/jJVv+7GcD5JM6NUnMtffxeqKKcplb/MGNcQr3jlIajmkPLNRJntNZgImW2SSz
 O+cw==
X-Gm-Message-State: ACrzQf2RUubKhRB45hJvv6dgKu7MLERT/ptSaQXC1ckrTSdOPquje+tG
 VneaONHWXcdoHm81vdj99fy3lBBODavW+fMsfMCWr0ir+UxIjJ8MR8gwx9/e2K/zaeLgsKvTb6k
 ID8gQSTEOqmBwq3vtLSWU2dYb33sn3cE2SQDAbJJeE1+l2Oqt7y1/pKRGHBGbXZT8fgM=
X-Received: by 2002:a05:600c:1c03:b0:3b4:618b:5d14 with SMTP id
 j3-20020a05600c1c0300b003b4618b5d14mr11783351wms.59.1663594888039; 
 Mon, 19 Sep 2022 06:41:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6gDhb7d648cDQMuQFFZ0Ja5pmGWj5YifYIhDsvwlpCVPo21uh1Io2u9bb7fga/BYo+4Z3Pgw==
X-Received: by 2002:a05:600c:1c03:b0:3b4:618b:5d14 with SMTP id
 j3-20020a05600c1c0300b003b4618b5d14mr11783335wms.59.1663594887689; 
 Mon, 19 Sep 2022 06:41:27 -0700 (PDT)
Received: from goa-sendmail ([93.56.164.28]) by smtp.gmail.com with ESMTPSA id
 k24-20020a05600c0b5800b003a502c23f2asm13635522wmr.16.2022.09.19.06.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 06:41:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] qboot: update to latest submodule
Date: Mon, 19 Sep 2022 15:41:26 +0200
Message-Id: <20220919134126.75656-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Include patch "Place setup_data at location specified by host"
from Jason A. Donenfeld.

Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 roms/qboot | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/roms/qboot b/roms/qboot
index a5300c4949..8ca302e86d 160000
--- a/roms/qboot
+++ b/roms/qboot
@@ -1 +1 @@
-Subproject commit a5300c4949b8d4de2d34bedfaed66793f48ec948
+Subproject commit 8ca302e86d685fa05b16e2b208888243da319941
-- 
2.37.2


