Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A883FCDB0
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 21:30:56 +0200 (CEST)
Received: from localhost ([::1]:37954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL9TD-0001Hn-75
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 15:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mL9QR-00087Z-Jr
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 15:28:03 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:34812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mL9QQ-0001iW-38
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 15:28:03 -0400
Received: by mail-lf1-x130.google.com with SMTP id z2so1203741lft.1
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 12:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0mw4T3ibckOn9FDTr4J0EhqiJpPK1ayy8eQiDDH1aDI=;
 b=gAAP3fDMGmHPVYoJ67BdlVr6/5fpZnP+bItz4mqnuQ+YenQcKbYGfXKJzrgATzU1C5
 AIHm5pf4l7QmZSKwUVY3y6YK7720BUKB23THdZfzBaJL7hn3YWnOwFvTT99kJ5HF69pt
 DIx3gVMtmJLryHnbjIMFZqSsUOU8udSCYKUGdvk/86hylI/Tan8obrXYlI1R7tUI1QJJ
 GuH3pOAhqK/38y+BC6FNvO0C87XWi6THjml3HWO1AzdxTkvF6qMVdPrT+bZkn1OiI4Rj
 RR2GyNtRrLIVTFgrpaGaeg0Ra5nxot8oSj5CwhMSLpKmqpDWPYmDaImhzsF3f4xD+GrA
 pLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0mw4T3ibckOn9FDTr4J0EhqiJpPK1ayy8eQiDDH1aDI=;
 b=L1ae8JJqtgrd6W6a73kGeqH6RYMOHbs8PCUgPs+ejQrsvv5aeoqD7WfOGHr9cbSNz6
 S+6vzrANl9lJ9ZyAdBvUnWLd1M2+tMJWZKRKuapcUpVBeEGEHygZYP66aLikgRBkCxjE
 UZse0MlEFUjkDIvafOFi45CWdxd1098cUhafYrhmLODO+8Lgj0P3gXhYEyILptSG+aYu
 7rIuyZpizHp8qWH5TOfKNb8BfST3CaeLAcNPpkEYZw/YZrJNtDmOXl9DsIblyKBqbTuh
 uYl6EuRIlt3YCfbb9WJRtX1y2r3lI6lviM3eskgIGs/cluueoeipJ24hdlE6J1ggxNR6
 PsIQ==
X-Gm-Message-State: AOAM531u0coP8qRjZbteclibBXVURukZgJwGATxZdX+fL3ZT8/H+EFaL
 VX7oeqa77nzjGfXH9wIc9uBYiQ2YLqJidw==
X-Google-Smtp-Source: ABdhPJzTpNsSYupdgqwg8f//Sai8cFuW8l3X8ybsdcW/TdAuJ66ezqmo7dX2fgJa69NWs1Uzwv43xQ==
X-Received: by 2002:a05:6512:3407:: with SMTP id
 i7mr11464832lfr.254.1630438079663; 
 Tue, 31 Aug 2021 12:27:59 -0700 (PDT)
Received: from UNIT-808.lan ([217.12.73.131])
 by smtp.gmail.com with ESMTPSA id u13sm1254791lfq.254.2021.08.31.12.27.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Aug 2021 12:27:59 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] Add vmnet.framework based network backend
Date: Tue, 31 Aug 2021 22:27:14 +0300
Message-Id: <20210831192720.33406-1-yaroshchuk2000@gmail.com>
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

v1: 
 Since v1 minor typos were fixed, patches rebased onto latest master, redudant
 changes removed (small commits squashed)

Vladislav Yaroshchuk (6):
  net/vmnet: dependencies setup, initial preparations
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


