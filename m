Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892023AB60E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 16:36:08 +0200 (CEST)
Received: from localhost ([::1]:43626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltt7n-0006m1-Jt
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 10:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1ltt5O-0004Aa-Mv
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:33:38 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:41937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1ltt5M-0001LF-Ub
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:33:38 -0400
Received: by mail-lf1-x130.google.com with SMTP id h4so10891562lfu.8
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 07:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vB6cbYHpHDJDXqEuxknjkCdqmuDTwqAjkBVJMrYRAfs=;
 b=iIlxpHZQlPs0vR2HscHnRi90RAy+v6mzyDJPSqEWNb9NulRaBbTB8AKbKfuEj1fZRf
 BGpFIJp02gS9gGfjSPyuI0brHY3rd2Pp3NIPwP9xia3aAmhHqclILdCNujSyXIudiONt
 QWrHhaooMVeM/04anGQnaPQGyZ5BjhsaQwiies1cyOhqvurwtAUkORst2LUKc4hvy6DQ
 ux4v1WJbHacZygjsY3tVnzZUob7WMpRXTieaLz6deh/dip9Snv5qyv/07EMpwq/N86VZ
 1P2GMfvojl+Gm4GJO58zFdBKJA4Kzw1zm4GI8fQtssNB/Ygpc5VtMc0uq+vd6LolOMHc
 qOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vB6cbYHpHDJDXqEuxknjkCdqmuDTwqAjkBVJMrYRAfs=;
 b=FfQ2Jpac+OnRxaIYTtkgbVpJpZLxB3xmiBfJql61VI4DMcFsSe/i/nIdAsVuTujUPD
 PXRpTLt1LdjOqnKwyK1yiZRRLrOhEB5slP0k2iSa2rKFvKGlWdapgtBBvtUE/gHSiY9F
 jiVFqTjdtNXLytpuNMm8RuUanbAHdGV3B79meOMowpVHiM5WnFDXvtJ6xRQmHEBoIq3J
 Im8LSaQRajEEz6lK4vqTav/p5dWPcBgF6m6vzWTt24wvKZsoT/9biUb7Vlkyt+H0dOfn
 z8f5nJ3Iem6PBBTjBC5oloQa/MWJJLik3pl4fDfxn2J8QF0yvz3988N8u0GusMNIYK1b
 FLPg==
X-Gm-Message-State: AOAM532a7cQ0zXjvUvUzlXU05IvIILy0LwsTb5VcbOr91O2UfS/c4U0I
 wS3a6W8WH/xUaF2fGEhazBbkuxUqLPRP/Jnj
X-Google-Smtp-Source: ABdhPJxU3FfCRc9aD/k0i1DCOkiCxp3JaIUN3kaQk2b2o/g8GjX5wNhs9DxG5j/ve0Wn9eoXQn2xAQ==
X-Received: by 2002:a05:6512:3e02:: with SMTP id
 i2mr4312498lfv.283.1623940413582; 
 Thu, 17 Jun 2021 07:33:33 -0700 (PDT)
Received: from localhost.localdomain ([5.18.249.207])
 by smtp.gmail.com with ESMTPSA id d9sm597406lfv.47.2021.06.17.07.33.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Jun 2021 07:33:33 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] Add vmnet.framework based network backend 
Date: Thu, 17 Jun 2021 17:32:39 +0300
Message-Id: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: jasowang@redhat.com, r.bolshakov@yadro.com,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

macOS provides networking API for VMs called vmnet.framework.
I tried to add it as a network backend. All three modes are supported:

-shared:
  allows the guest to comminicate with other guests in shared mode and
  also with external network (Internet) via NAT

-host:
  allows the guest to communicate with other guests in host mode

-bridged:
  bridges the guest with a physical network interface

Separate netdev for each vmnet mode was created because they use quite
different settings, especially since macOS 11.0 when vmnet.framework
gets a lot of updates.

Not sure that I use qemu_mutex_lock_iothread() and
qemu_mutex_unlock_iothread() in correct way while sending packet
from vmnet interface to QEMU. I'll be happy to receive
recomendations how to make this thing better if I done sth wrong.

Also vmnet.framework requires com.apple.vm.networking entitlement to
run without root priveledges. Ad-hoc signing does not fit there,
so I didn't touch anything related to signing. As a result we should
run qemu-system by a priviledged user:
`$ sudo qemu-system-x86_64 -nic vmnet-shared`
otherwise vmnet fails with 'general failure'.

But in any way it seems working now,
I tested it within qemu-system-x86-64 on macOS 10.15.7 host, with nic
models:
- e1000-82545em
- virtio-net-pci

and having such guests:
- macOS 10.15.7
- Ubuntu Bionic (server cloudimg) 

Vladislav Yaroshchuk (7):
  net/vmnet: dependencies setup, initial preparations
  net/vmnet: add new netdevs to qapi/net
  net/vmnet: create common netdev state structure
  net/vmnet: implement shared mode (vmnet-shared)
  net/vmnet: implement host mode (vmnet-host)
  net/vmnet: implement bridged mode (vmnet-bridged)
  net/vmnet: update qemu-options.hx

 configure           |  31 +++++
 meson.build         |   5 +
 net/clients.h       |  11 ++
 net/meson.build     |   7 ++
 net/net.c           |  10 ++
 net/vmnet-bridged.m | 123 ++++++++++++++++++
 net/vmnet-common.m  | 294 ++++++++++++++++++++++++++++++++++++++++++++
 net/vmnet-host.c    |  93 ++++++++++++++
 net/vmnet-shared.c  |  94 ++++++++++++++
 net/vmnet_int.h     |  48 ++++++++
 qapi/net.json       |  99 ++++++++++++++-
 qemu-options.hx     |  17 +++
 12 files changed, 830 insertions(+), 2 deletions(-)
 create mode 100644 net/vmnet-bridged.m
 create mode 100644 net/vmnet-common.m
 create mode 100644 net/vmnet-host.c
 create mode 100644 net/vmnet-shared.c
 create mode 100644 net/vmnet_int.h

-- 
2.23.0


