Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5102449836
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 16:30:17 +0100 (CET)
Received: from localhost ([::1]:33342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk6bA-0006U5-P9
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 10:30:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mk6Y4-0001zf-Tz
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:27:04 -0500
Received: from [2a00:1450:4864:20::135] (port=45756
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mk6Y2-0007yd-NT
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:27:04 -0500
Received: by mail-lf1-x135.google.com with SMTP id f3so36977849lfu.12
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 07:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fy7dmoh7Ek1R2ELlGMXh51OvZKmiCeezriX0IDEljpY=;
 b=Xm+7SNBrlJ56neZNIzOsqD8ZhsAr21amnbStTyASZAJG71Q6SbU2qQZpwqtl4zCvn5
 rPS5fFX7tjd6h0MBngd8Lm2N7E1xfGvWQt2kYYVQYA9oIu74n5fX0mx0UoPinuxFCIuk
 PwMnb0AH3RQv8rQPckFiaQAXYbnwHZDhtAZE2jZUi0RQ/vPiK/nkIETE05eUek7BSVSV
 2Mgh0Oaa24ybGjMhGNGYOBJxTEst3NLJpOdfj7y2rrSiedtnG8fU0PXgspz1aDdd4/Or
 PiWG6ckarlFoSurOrbADHiX0LtVdU3UqkfEnpBoQUZyFaLPvyZ06VdOKPrsrkuUb/JXo
 zwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fy7dmoh7Ek1R2ELlGMXh51OvZKmiCeezriX0IDEljpY=;
 b=6Wl6Ou4ZQh1oMoj/RAsjyEsYTyuk0fgB8Ik6v25mNLc5AEOX9c0YFrg5O/+2IKGFys
 p26Jd557oTHEz0bWNfkO30iSGWwSgIjApH8gTYYdTfAFWV985C/Mt1poiDNdX35Za8lL
 zLOif2pNiXt2plx2Gt/Udf3LarEkW2a8Kbg+DrJfTo8vt5KQmfqNKg+p1iNStFX/HIEe
 uQSvahgxK+rUiQhd7bSFv0KdaQTYCVBqmgyFFaMGaz4VkgZ49OYjwDh+jpVixtAjLUwF
 TSXFgq6ye+8ZvAjX/lrp3WHidlXd5S8y4lESCrVBk+ZYKDNWBpsADr+5lg1kGp6ZqLt9
 IhfQ==
X-Gm-Message-State: AOAM530SbM+lNWlJoO/33/7EPKWqp2U6FKwEWtGAeXVg8gjM++n3M6bF
 KsN27dwrTUDyyM8PbH5pMzYduOr6jqEIBQ==
X-Google-Smtp-Source: ABdhPJy0/oT7ehOJgXnzACWihWF1CdMXWf2aUR5p/F88htVWR6au+UxVtoAlZtjlErKqMjq9cHrVQg==
X-Received: by 2002:a05:6512:1102:: with SMTP id
 l2mr31183lfg.469.1636384732493; 
 Mon, 08 Nov 2021 07:18:52 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id z13sm1312776lfd.139.2021.11.08.07.18.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Nov 2021 07:18:51 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/6] Add vmnet.framework based network backend
Date: Mon,  8 Nov 2021 18:16:58 +0300
Message-Id: <20211108151704.65611-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, r.bolshakov@yadro.com,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

macOS provides networking API for VMs called 'vmnet.framework':
https://developer.apple.com/documentation/vmnet

We can provide its support as the new QEMU network backends which
represent three different vmnet.framework interface usage modes:

  * `vmnet-shared`:
    allows the guest to communicate with other guests in shared mode and
    also with external network (Internet) via NAT. Has (macOS-provided)
    DHCP server; subnet mask and IP range can be configured;

  * `vmnet-host`:
    allows the guest to communicate with other guests in host mode.
    By default has enabled DHCP as `vmnet-shared`, but providing
    network unique id (uuid) can make `vmnet-host` interfaces isolated
    from each other and also disables DHCP.

  * `vmnet-bridged`:
    bridges the guest with a physical network interface.

This backends cannot work on macOS Catalina 10.15 cause we use
vmnet.framework API provided only with macOS 11 and newer. Seems
that it is not a problem, because QEMU guarantees to work on two most
recent versions of macOS which now are Big Sur (11) and Monterey (12).

Also, we have one inconvenient restriction: vmnet.framework interfaces
can create only privileged user:
`$ sudo qemu-system-x86_64 -nic vmnet-shared`

Attempt of `vmnet-*` netdev creation being unprivileged user fails with
vmnet's 'general failure'.

This happens because vmnet.framework requires `com.apple.vm.networking`
entitlement which is: "restricted to developers of virtualization software.
To request this entitlement, contact your Apple representative." as Apple
documentation says:
https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_vm_networking

One more note: we still have quite useful but not supported
'vmnet.framework' features as creating port forwarding rules, IPv6
NAT prefix specifying and so on.

Nevertheless, new backends work fine and tested within `qemu-system-x86-64`
on macOS Bir Sur 11.5.2 host with such nic models:
  * e1000-82545em
  * virtio-net-pci
  * vmxnet3

The guests were:
  * macOS 10.15.7
  * Ubuntu Bionic (server cloudimg)


This series partially reuses patches by Phillip Tennen:
https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
So I included his signed-off line into one of the commit messages and
also here.

v1 -> v2:
 Since v1 minor typos were fixed, patches rebased onto latest master, redundant
 changes removed (small commits squashed)

v2 -> v3:
 - QAPI style fixes
 - Typos fixes in comments
 - `#include`'s updated to be in sync with recent master
v3 -> v4:
 - Support vmnet interfaces isolation feature
 - Support vmnet-host network uuid setting feature
 - Refactored sources a bit

Signed-off-by: Phillip Tennen <phillip@axleos.com>
Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>

Vladislav Yaroshchuk (6):
  net/vmnet: add vmnet dependency and customizable option
  net/vmnet: add vmnet backends to qapi/net
  net/vmnet: implement shared mode (vmnet-shared)
  net/vmnet: implement host mode (vmnet-host)
  net/vmnet: implement bridged mode (vmnet-bridged)
  net/vmnet: update qemu-options.hx

 meson.build                   |   4 +
 meson_options.txt             |   2 +
 net/clients.h                 |  11 ++
 net/meson.build               |   7 +
 net/net.c                     |  10 ++
 net/vmnet-bridged.m           | 111 ++++++++++++
 net/vmnet-common.m            | 325 ++++++++++++++++++++++++++++++++++
 net/vmnet-host.c              | 111 ++++++++++++
 net/vmnet-shared.c            |  86 +++++++++
 net/vmnet_int.h               |  48 +++++
 qapi/net.json                 | 122 ++++++++++++-
 qemu-options.hx               |  23 +++
 scripts/meson-buildoptions.sh |   3 +
 13 files changed, 861 insertions(+), 2 deletions(-)
 create mode 100644 net/vmnet-bridged.m
 create mode 100644 net/vmnet-common.m
 create mode 100644 net/vmnet-host.c
 create mode 100644 net/vmnet-shared.c
 create mode 100644 net/vmnet_int.h

-- 
2.23.0


