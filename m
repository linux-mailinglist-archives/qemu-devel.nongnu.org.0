Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5B9303B56
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:18:26 +0100 (CET)
Received: from localhost ([::1]:42190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4MMb-0002rH-96
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4ML3-0001Qr-76
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:16:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MKz-0008Bw-NT
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:16:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611659804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=u2GlUCnBuQ5/iz2nQQ3cSIqbKreRpmOUdUsz2SLnpjk=;
 b=WMaZb+F9aWHFFmyb2ruEM0JLHZaYxfdReGNmOKkxP5RJCvVVGcijnIGL2iv/96A5/NMmDP
 OeJszcvTY3RM29jd0oH/gcYIVY3p2EMm1e4MHrMBNop++O/Xx3OsvSEqUkojjsgipSzYRg
 X2DvspiXZVg7nsqY/Mk+4+OEYAeQlZI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-d_plkwoQMs6ih4zLe7VDpg-1; Tue, 26 Jan 2021 06:16:43 -0500
X-MC-Unique: d_plkwoQMs6ih4zLe7VDpg-1
Received: by mail-ed1-f72.google.com with SMTP id ck25so9165344edb.16
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 03:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QnLkvt3WRa4v88CgIQCSGjaiw6LXakr6llgHRAfyUcE=;
 b=jmI90QTxrsKED2JbJnIT8YE0xsGKWv5tgPpprohFxHClQK6Na8a9G3hKjRlpKhFW9L
 dQKAo4IUx5WJhQwPWW46EFStOj/+0nNgeFVqk1JYro2orDDhym1yxM5MSV7mksLW1vvP
 MN4wnc8wOE5/3C0AxiYeZcxG/vLpQVNPC0oVKpwhv0Fc792jTZ42GpvOnjHG7Coy4+5e
 oK/MVAtGwW3Y4W6nK/qJZ4J9xHuGBPwrJcm9I8WYDy2eRDhbA3rsBX5oAdT64DebQ5pq
 XtwplAbtShno3e4FesNhFXMqllbC/bwmC8AA8i5TPz/XOH3nG+VJ/w4Wi7Vxn3aLaFy5
 xLtQ==
X-Gm-Message-State: AOAM530NxfV281rAGuTqeoRr3puOOEq1xUw8accL7nFrFYDT0nylWf2o
 HgxiEuau97mWbiV3uLidKViXQEZLVuulxKwfHu0fvzabqkRMDxd6GijwVNBclmZgpNlavRn/kDP
 /1nefLv0RzdZoH6oLl4uypaHAIgla3aXAPEUNV/3Sh2XwgZ4mqZ6Y1KKmlWOJudBb
X-Received: by 2002:a50:852a:: with SMTP id 39mr4251273edr.114.1611659802042; 
 Tue, 26 Jan 2021 03:16:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyvo1B9u8qr0RBICyjxlaltXYFc5kvplakqcIyrYEVMgJpKBgmYpq4RnCmIp1VFJvYCj5Gxg==
X-Received: by 2002:a50:852a:: with SMTP id 39mr4251251edr.114.1611659801782; 
 Tue, 26 Jan 2021 03:16:41 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b17sm9628321ejj.83.2021.01.26.03.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 03:16:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] tests/qtest: Only run fuzz-tests when tested devices
 are available
Date: Tue, 26 Jan 2021 12:16:36 +0100
Message-Id: <20210126111638.3141780-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some tests/qtest/fuzz-test fail when the device tested is=0D
not available in the build. Fix this by only running the=0D
test when devices are available.=0D
=0D
FWIW Alexander Bulekov suggested an improvement, putting each=0D
test in a directory named by the device tested. This series=0D
does not cover that.=0D
=0D
Supersedes: <20210115150936.3333282-1-philmd@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  tests/qtest: Only run fuzz-megasas-test if megasas device is available=0D
  tests/qtest: Only run fuzz-virtio-scsi when virtio-scsi is available=0D
=0D
 tests/qtest/fuzz-megasas-test.c     | 49 +++++++++++++++++++=0D
 tests/qtest/fuzz-test.c             | 76 -----------------------------=0D
 tests/qtest/fuzz-virtio-scsi-test.c | 75 ++++++++++++++++++++++++++++=0D
 MAINTAINERS                         |  2 +=0D
 tests/qtest/meson.build             |  5 +-=0D
 5 files changed, 130 insertions(+), 77 deletions(-)=0D
 create mode 100644 tests/qtest/fuzz-megasas-test.c=0D
 create mode 100644 tests/qtest/fuzz-virtio-scsi-test.c=0D
=0D
--=20=0D
2.26.2=0D
=0D


