Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CA44A9787
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 11:13:46 +0100 (CET)
Received: from localhost ([::1]:60284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFvb6-0005MU-MA
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 05:13:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nFvVQ-0002UR-FI
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 05:07:52 -0500
Received: from [2a00:1450:4864:20::430] (port=34756
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nFvVO-0000bI-G6
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 05:07:52 -0500
Received: by mail-wr1-x430.google.com with SMTP id f17so10351453wrx.1
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 02:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6rt86v8+O2u0xKuy11Vc2CwDRtUnFNa/CkkNqeq5hR0=;
 b=nfDajDn8gAlO5MWw2E/KRVFet7AIpFSBJP3DNsuxK5wqWRp/EPnjVQ7SuQju6kWPZ0
 j6RZcNeYHLnnKqO95PeBaFGMGYKb+5RtiwcwCj/Yaov1/MhECMMA3hfbZKkqUY8MtPl0
 0ue3NKaLIzeYq5x2PXQeO6DsSDczU6D5ZkZqFhfw/JXq03v0w20U/PFTC2z1Tx2ME0Yx
 OC/Tjgt61ZKCnVN4I0vD+vl3O4GDBIHQ7qmXMs2pD0l+NVMriuzBZVtJS1siePkhGHIE
 pnBaaYXmz54EuzZAbANUvXSTaxvVjQusvyqMkSv5oKtu9YTbd7iSLvU+Dubshoo3wUsK
 Cv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6rt86v8+O2u0xKuy11Vc2CwDRtUnFNa/CkkNqeq5hR0=;
 b=1Lsg0rr35rSdmcHyzlAvu8PZNc87XYsClTNetvs/TEgnBh8XvtEP+GuEN20UjVP7Nz
 s8TTePxl1oW9s+99hsrJ5rDE5GSUQkdizCZK9dtwYHDwOC1ZXYGqkvnLvOkL2ryvmSe+
 D10MEcRmJZC9OwrW6yzRcVXt9kSFRU/SMD1SDGJ4hlXfz9gySiG8Grx8N/RqrbSwE5XO
 kEjZ97fK8sxkIRcw0wySTBjXLTpcErFWOKeVRu/WyqQzv9llQ12yttw1jnwe7ER5D90a
 cPSkTmSf+0pYRMOSeGSvVfWZ9w2+bYXDoJ9scvS5lSYwBNeZ98dvG24qjlc0vyc/hDNw
 RdYA==
X-Gm-Message-State: AOAM530ukzAImJ0taq1ASeiJYqgBtcYw4VTSOSFEOYlpZXv/ysuV9lEg
 qQVR5WeOxdFR4I2obBJlse4nFcj958E=
X-Google-Smtp-Source: ABdhPJzplo/5bZqMu0VZri1Wb4gX18w17jugjZ58UBinBEph9i0uiiWrsucY7R+3IwlG/aG8QMKx3A==
X-Received: by 2002:a05:6000:1688:: with SMTP id
 y8mr1795694wrd.374.1643969268089; 
 Fri, 04 Feb 2022 02:07:48 -0800 (PST)
Received: from localhost.localdomain
 ([2a0d:6fc2:4af1:7d00:5e41:a6ea:ffaa:548c])
 by smtp.gmail.com with ESMTPSA id u18sm657227wrn.110.2022.02.04.02.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 02:07:46 -0800 (PST)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/4] HyperV: Synthetic Debugging device
Date: Fri,  4 Feb 2022 12:07:19 +0200
Message-Id: <20220204100723.406121-1-arilou@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=arilou@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Jon Doron (4):
  hyperv: SControl is optional to enable SynIc
  hyperv: Add definitions for syndbg
  hyperv: Add support to process syndbg commands
  hw: hyperv: Initial commit for Synthetic Debugging device

 docs/hyperv.txt                  |  15 +
 hw/hyperv/Kconfig                |   5 +
 hw/hyperv/hyperv.c               | 475 +++++++++++++++++++++++++------
 hw/hyperv/meson.build            |   1 +
 hw/hyperv/syndbg.c               | 407 ++++++++++++++++++++++++++
 include/hw/hyperv/hyperv-proto.h |  52 ++++
 include/hw/hyperv/hyperv.h       |  60 ++++
 target/i386/cpu.c                |   2 +
 target/i386/cpu.h                |   7 +
 target/i386/kvm/hyperv-proto.h   |  37 +++
 target/i386/kvm/hyperv-stub.c    |   6 +
 target/i386/kvm/hyperv.c         |  52 +++-
 target/i386/kvm/kvm.c            |  76 ++++-
 13 files changed, 1105 insertions(+), 90 deletions(-)
 create mode 100644 hw/hyperv/syndbg.c

-- 
2.34.1


