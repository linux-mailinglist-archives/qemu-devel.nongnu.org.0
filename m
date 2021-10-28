Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19EA43E4B2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:12:45 +0200 (CEST)
Received: from localhost ([::1]:38540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg75A-0006Am-TH
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg71t-0003GF-MI
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:09:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg71r-0007gl-Gd
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:09:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635433758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FGfZQ/l8lVBJu5aF4VllhmWCdJEyK5HoiSNGEMXogR0=;
 b=RSxGOK7i74Or4OVBmZH2gJUUJYQBSS8hdq1KeFajVytjuCtjAcPyX4dfWU6ANNvmFiiYVd
 3elbuqA0EWy9JRe3PnDTxXO8bZs84ZYgAnseumxdkFwEr+9FR8FHAq7IwBs1Bn7kbSQgbT
 jx7kHOkjmzRWd/2+5G7IFCHj0QtE0l8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-U2eNz_unNeCyJyUDqbKlmA-1; Thu, 28 Oct 2021 11:09:17 -0400
X-MC-Unique: U2eNz_unNeCyJyUDqbKlmA-1
Received: by mail-wr1-f71.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so1110555wrc.22
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VadVBJG+UsmnLFR7gakJAD6piD6wT6wnPT0aDj9xEyI=;
 b=WIXFLqj5y4GEHuRXWRr7ri0qOwBHvL8aMiHl1Gt/52EMWS+8O7cuBZ9He6uZhRsGgF
 yOvKHBKYWEvWQXbTHrljjjbbhv6fpPMkKfeky6kgCOoT6tz5QO1vMSoXqr43VfWM6ZlP
 JtDb08RaO9z+Jne7tqPtGZGuVstIoE7n0D4ddxQdazfsPXD1t2JKicCs6c/W5YRKSTyX
 AEyLmPbpZbYG87C/F0bQB4fWZJzAs/puEQjZ4WEApmhZEF2LDuKFRQeomO1rOerh4djz
 XVzobHCovw1aebillzocs6PK+6ReR+RlNh4bY0X1OT4vDKJzA/aYgTdFVH1efhUQWJJV
 kNOw==
X-Gm-Message-State: AOAM531utaUbyFVonhRbLhPEYsPnQd8duUzqB0CPZn3NJoH2d6b8etNO
 d+EfDqUc2elp7zjP4SwbPEyoJ3W65N93pb1tZBDLC+EyKbyFll/gW/p62vuARbnvDcLOCaeiFbm
 I99WqQiWAMc3uRx3WK6tJhEAs5i0sxKJmyhuTW1Qcch/s402DU+v+7mINSt8Wm2nQ
X-Received: by 2002:a05:600c:3b89:: with SMTP id
 n9mr12966540wms.7.1635433755548; 
 Thu, 28 Oct 2021 08:09:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMsFaX2iWr8KY1UBFueHcl3eZmVQqvCT6y+bV0NkWtpMnVJ/OytJjPoFIWjQH0PVgsSfP2eA==
X-Received: by 2002:a05:600c:3b89:: with SMTP id
 n9mr12966496wms.7.1635433755264; 
 Thu, 28 Oct 2021 08:09:15 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c7sm3218745wrp.51.2021.10.28.08.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:09:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/2] hw/core/machine: Add an unit test for smp_parse
Date: Thu, 28 Oct 2021 17:09:11 +0200
Message-Id: <20211028150913.1975305-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Respin of Yanan Wang v3, based on=0D
"hw/core: Restrict qdev-hotplug to sysemu"=0D
=0D
Based-on: 20211028150521.1973821-1-philmd@redhat.com=0D
https://lore.kernel.org/qemu-devel/20211028150521.1973821-1-philmd@redhat.c=
om=0D
=0D
git-backport-diff:=0D
Key:=0D
[----] : patches are identical=0D
[####] : number of functional differences between upstream/downstream patch=
=0D
[down] : patch is downstream-only=0D
The flags [FC] indicate (F)unctional and (C)ontextual differences, respecti=
vely=0D
=0D
001/2:[0001] [FC] 'hw/core/machine: Split out the smp parsing code'=0D
002/2:[----] [--] 'tests/unit: Add an unit test for smp parsing'=0D
=0D
Yanan Wang (2):=0D
  hw/core/machine: Split out the smp parsing code=0D
  tests/unit: Add an unit test for smp parsing=0D
=0D
 include/hw/boards.h         |   1 +=0D
 hw/core/machine-smp.c       | 181 +++++++++++=0D
 hw/core/machine.c           | 159 ----------=0D
 tests/unit/test-smp-parse.c | 594 ++++++++++++++++++++++++++++++++++++=0D
 MAINTAINERS                 |   2 +=0D
 hw/core/meson.build         |   1 +=0D
 tests/unit/meson.build      |   1 +=0D
 7 files changed, 780 insertions(+), 159 deletions(-)=0D
 create mode 100644 hw/core/machine-smp.c=0D
 create mode 100644 tests/unit/test-smp-parse.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


