Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4A63F619B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 17:29:03 +0200 (CEST)
Received: from localhost ([::1]:58400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIYMJ-00047j-2T
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 11:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIYKo-0001wR-3I
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:27:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIYKl-0006g1-NT
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:27:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629818846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=52/dwilpsB+kW1ac7Nh0FXeU5FkHbntdlPny76rN52k=;
 b=K3zjXHq8AVU3HH21IHsFB+8ojEGgMpXmEfg1uhhplk10Sz/ZtlGxqHR2FI9ShFcRzOIqvN
 NumX7G769MAwxYuUsQP+XvhcapOEiaUuo+zxlMC33fPBcbZGcFGHNyaywC2/JllXfF9R/N
 346r83UTgkPxQkXl2YZ85CI4eZJxQrc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-5WN36JwPMnmiuBpwlycERA-1; Tue, 24 Aug 2021 11:27:25 -0400
X-MC-Unique: 5WN36JwPMnmiuBpwlycERA-1
Received: by mail-qt1-f199.google.com with SMTP id
 q19-20020ac87353000000b0029a09eca2afso10739456qtp.21
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 08:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=52/dwilpsB+kW1ac7Nh0FXeU5FkHbntdlPny76rN52k=;
 b=QSQdu1LcbfjmWWTydRTIDwGaOfZtxjv4FGiQ8hZAU8HhWAm8P+WlbQXcsFx9kea3jo
 oHSgXXg+24sBIoubaxO+ci7s/+wfB4RRiF0Gu1+ptH2V3pp/Up10i7+6zg1WCY2S9gid
 DPlcIHqdrvZGQCxm6gTwIRWvQT07P2qmi2DAAzkzwIFtfuwWPQiH99yplfvURttynnH+
 c4XacKrhbJlnz81uz0dOuzMuCS6+UW6qkzANQo3Kr4+IGkhZQRwcSPm2Ei/3NrcCCBxH
 5rPeVyrPHQuiZV9WZkTz820PCC5CDapMgKAOjp3FhglR3hgfDKfQrvyulbAStvK+OqZH
 zewQ==
X-Gm-Message-State: AOAM533BrItQU9KMOi9FGqlAuW2UbeWEXpGPXtC78bR1NlKl4jrdryVu
 ohZDWs32n4ICFM9Y2BYj4KAYNJApjVl6/vz8LUCQVDbFxb8Ww8zkFSLHYgygVI/8CqeYQxny57j
 YIyct9JZA8z48Bi3VHB34F+aFWsBHn8g2gaPuxkhBx1gE1t9o4/Bt1bTrlPvH7r7O
X-Received: by 2002:a0c:e2d1:: with SMTP id t17mr1332782qvl.56.1629818844416; 
 Tue, 24 Aug 2021 08:27:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNDA3iKF/f03e8z80s85WTctkiBRmGrOFtZ6H5btJpYpvLhvZhwk2JfBSuwKKJIlenIQCBAg==
X-Received: by 2002:a0c:e2d1:: with SMTP id t17mr1332746qvl.56.1629818844101; 
 Tue, 24 Aug 2021 08:27:24 -0700 (PDT)
Received: from t490s.phub.net.cable.rogers.com ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id j127sm10939754qkf.20.2021.08.24.08.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 08:27:23 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] dump-guest-memory: Add blocker for migration
Date: Tue, 24 Aug 2021 11:27:19 -0400
Message-Id: <20210824152721.79747-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both dump-guest-memory and live migration have vm state cached internally.
Allowing them to happen together means the vm state can be messed up.  Simply
block live migration for dump-guest-memory.

One trivial thing to mention is we should still allow dump-guest-memory even if
-only-migratable is specified, because that flag should majorly be used to
guarantee not adding devices that will block migration by accident.  Dump guest
memory is not like that - it'll only block for the seconds when it's dumping.

Thanks,

Peter Xu (2):
  migration: Add migrate_add_blocker_internal()
  dump-guest-memory: Block live migration

 dump/dump.c                 | 20 +++++++++++++++-----
 include/migration/blocker.h | 16 ++++++++++++++++
 include/sysemu/dump.h       |  1 +
 migration/migration.c       | 21 +++++++++++++--------
 4 files changed, 45 insertions(+), 13 deletions(-)

-- 
2.31.1


