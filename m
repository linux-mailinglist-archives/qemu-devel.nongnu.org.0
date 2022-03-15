Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243F54D9EEB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 16:42:45 +0100 (CET)
Received: from localhost ([::1]:50528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU9Js-0002A5-0r
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 11:42:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nU9AD-0002I0-4K
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:32:45 -0400
Received: from [2a00:1450:4864:20::32f] (port=53832
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nU9AB-0001Sk-E7
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:32:44 -0400
Received: by mail-wm1-x32f.google.com with SMTP id 19so11483951wmy.3
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 08:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gQ+SPI8DlX8R5OXn6tZX8wNcLhtVnAJlGDpOU9dhe1E=;
 b=A82ZnAkwPyxxdzwwCSOR3cRlCOWX15pdGFVnQP4LeN9bnKpImw9B+qKlZ5rHDD7dt1
 r+CqB7MqsIW92Cp9IDzyrugyyhmxYeBVHtzxOyOc7rcDPgGO7/LdLebUyGY2+0BJ+og7
 oDleBu+maw4DOV0AZRgSeAlXlSXK5q+n4sW7xY5m4/27hII+w9BWvx8xUn4aW3qq3aCe
 woFotCKVxEmW+cV8UcDfeUQdw0/96wqqQfr8hFVYLRCnj1vOaqyg/ju2SdO1RTmXtRZd
 5g9ML9AU3cY/hm5CQkrsMC84lw/Gw13jeGHPelmfbpUdQzGMGm/7bDoGAUCIq8kEQheh
 ku+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gQ+SPI8DlX8R5OXn6tZX8wNcLhtVnAJlGDpOU9dhe1E=;
 b=UWjfiZuO8HP04lKV5MwL9j+V/tfFfnyRj9l2R5dTw/mfClgLCXSvtSMunL04kIaEj3
 vcF7Y5MPwfx//4MOvWS62k4xpB7zFPqlbbGZ6j4SWvczXJ7f2JuxlePvK3CPTg6/27/U
 5stFz9jndKFXGIHOrH771tu2Xrqh2eBrUQ9viPf6p6HWGNBdocSzU9ddBupP4ugWOVxa
 QgyWyzlIYxhDAsl7AnY1lXk3nzDnWGmbsPKuxb4eE8PM/33fbuvuspk9n6f4laX5Jy0V
 rLLS9gbTug9DC/hyGrd0hqc6ai34Ey7sgJ0C8G4f6RNjitzG53iVDdXnJBpzvhdto4oh
 ju9A==
X-Gm-Message-State: AOAM532l/Cq37w5/PL5S3t+v+EowPTIZ521Bqf2nJXnDI2KkDI7rsENI
 HOBZbxidouc+sPGtJxkJ+h24b1r9JV8=
X-Google-Smtp-Source: ABdhPJw6kzLGwk+ldC/ReT6GXVBfoX8UnkTXkFYaFJ0Lb+I5z4Ehi4vfQG0u59aBZDkXT9QX5bqQJA==
X-Received: by 2002:a1c:6a15:0:b0:38b:57e8:dd5c with SMTP id
 f21-20020a1c6a15000000b0038b57e8dd5cmr3272579wmc.160.1647358360612; 
 Tue, 15 Mar 2022 08:32:40 -0700 (PDT)
Received: from localhost.localdomain
 ([2a0d:6fc2:4af1:7d00:5e41:a6ea:ffaa:548c])
 by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b0038995cb915fsm4468021wms.9.2022.03.15.08.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 08:32:39 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] HyperV: Synthetic Debugging device
Date: Tue, 15 Mar 2022 17:32:16 +0200
Message-Id: <20220315153220.953556-1-arilou@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=arilou@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, vkuznets@redhat.com, Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds support for the synthetic debugging device.

HyperV supports a special transport layer for the kernel debugger when
running in HyperV.

This patchset add supports for this device so you could have a setup
fast windows kernel debugging.

At this point of time, DHCP is not implmeneted so to set this up few
things need to be noted.

The scenario I used to test is having 2 VMs in the same virtual network
i.e a Debugger VM with the NIC:
-nic tap,model=virtio,mac=02:ca:01:01:01:01,script=/etc/qemu-ifup
And it's IP is going to be static 192.168.53.12
And the VM we want to debug, to which we need to have the englightments
and vmbus configured:
 -cpu host,hv-relaxed,hv_spinlocks=0x1fff,hv_time,+vmx,invtsc,hv-vapic,hv-vpindex,hv-synic,hv-syndbg \
 -device vmbus-bridge \
 -device hv-syndbg,host_ip=192.168.53.12,host_port=50000,use_hcalls=false \
 -nic tap,model=virtio,mac=02:ca:01:01:01:02,script=/etc/qemu-ifup \

Then in the debuggee VM we would setup the kernel debugging in the
following way:

If the VM is older than Win8:
* Copy the proper platform kdvm.dll (make sure it's called kdvm.dll even if platform is 32bit)
bcdedit /set {GUID} dbgtransport kdvm.dll
bcdedit /set {GUID} loadoptions host_ip="1.2.3.4",host_port="50000",nodhcp
bcdedit /set {GUID} debug on
bcdedit /set {GUID} halbreakpoint on

Win8 and late:
bcdedit /dbgsettings net hostip:7.7.7.7 port:50000 nodhcp

This is all the setup that is required to get the synthetic debugger
configured correctly.

v3:
Fixed review from Paolo changes from QLIST*RCU to non RCU

Jon Doron (4):
  hyperv: SControl is optional to enable SynIc
  hyperv: Add definitions for syndbg
  hyperv: Add support to process syndbg commands
  hw: hyperv: Initial commit for Synthetic Debugging device

 docs/hyperv.txt                  |  15 ++
 hw/hyperv/Kconfig                |   5 +
 hw/hyperv/hyperv.c               | 352 ++++++++++++++++++++++++---
 hw/hyperv/meson.build            |   1 +
 hw/hyperv/syndbg.c               | 402 +++++++++++++++++++++++++++++++
 include/hw/hyperv/hyperv-proto.h |  52 ++++
 include/hw/hyperv/hyperv.h       |  58 +++++
 target/i386/cpu.c                |   2 +
 target/i386/cpu.h                |   7 +
 target/i386/kvm/hyperv-proto.h   |  37 +++
 target/i386/kvm/hyperv-stub.c    |   6 +
 target/i386/kvm/hyperv.c         |  52 +++-
 target/i386/kvm/kvm.c            |  76 +++++-
 13 files changed, 1024 insertions(+), 41 deletions(-)
 create mode 100644 hw/hyperv/syndbg.c

-- 
2.35.1


