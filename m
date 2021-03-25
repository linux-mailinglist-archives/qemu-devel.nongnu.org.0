Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB0C3497F4
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 18:26:32 +0100 (CET)
Received: from localhost ([::1]:41932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPTkd-0002cV-7u
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 13:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lPTdj-0007rv-Uu
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:19:23 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:42703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lPTdh-000528-0q
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:19:23 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so2654835ota.9
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 10:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Dj8qEgQfsztTF+D+IHM7gaLujBEJBQc0E7tXR/dlzTU=;
 b=LG1Nwh1kSGHD7+EB8bpRBKB1g0JJR/ryMpocCOxX3lXFzNOFFw6bFfbp8sdAT6f9C4
 mW8EOVT8yZDciPAeNjm2U7bm3504sphdyEuvMnKaSHAzgQTB7S4UJ8K5dK/9WzD8wkGa
 6zL3c0h6xA4vD5Jxme5oatkNpSaZvuV8dYeMDgdXflJvGNVgNNls0SUEVLXM/EKaz4qf
 lgMG32ttqQ+SZ7n4zIcx7LELgNMnsd6cUzOjmq1eBmzyOv1xZBHsvwq6q1nWf3i68zU8
 8ix78OLTH2njYuneE+7VQFxVdU2sx6Fzf3aIfuNynp8+4iEng/FgiOrX4JEmU4eMhnML
 20Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Dj8qEgQfsztTF+D+IHM7gaLujBEJBQc0E7tXR/dlzTU=;
 b=E1FydrR3J2wpJfkUMxwJS+t2UBx999dIROoexusextXrird2lZs+DWt4hvhKXs/2Zl
 4oUIXwgv9W9nZvifFrnwcW2IBhQOqogkmzI1MZzdTy4vkLP+ggpaQBQVy8FRCrjKB0Wj
 VgBAgPy9FI/quKRNsqtWO5hJlzxF+we9H3y34NIi2vBjNXxk6q3nwElzKaLqsATj8ryK
 +cmn76uKKxG7X7YSDiLLRWr00+5zvLDhfDWj/7DGD+BAsG3VOscRea2PD5sssNZuFCMw
 k19oINsMHqLbooIQoW2iKSwecoe19TbA9YLxK8qX8Qka5uzONayLQO5A+pizkkjz3fbU
 lrHw==
X-Gm-Message-State: AOAM532hrsfeoyNW62+KqYE3hLg4C5ln5EtnY8cev3jm3lBLc0c78ywh
 zLmIpjv9PsSY/+iXsP8Vrz6VfCVw9wILgQf1PXJ77D1h
X-Google-Smtp-Source: ABdhPJzDTrVwG/6qoLeCNJMzOPJKXAJDsnAEjA7K6eZA3qz1fcPo0SEUWkBTs7ny6+K0QdxuZZA9fU0QIPe/ZCghdLQ=
X-Received: by 2002:a05:6830:15d2:: with SMTP id
 j18mr8668402otr.75.1616692758825; 
 Thu, 25 Mar 2021 10:19:18 -0700 (PDT)
MIME-Version: 1.0
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Thu, 25 Mar 2021 18:19:07 +0100
Message-ID: <CABLmASGq42X5pEuTkWZTp_djr5qmo98BD_9wi4zFnG1DYNnJ9A@mail.gmail.com>
Subject: Bug with Windows tap network when running qemu-system-ppc with Mac OS
 9 guest
To: qemu-devel qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ot1-x336.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

When running qemu-system-ppc with Mac OS guest, the guest crashes when
using a tap network connection. Openvpn 2.4.9-I601-win10 is installed
with TAP-Windows 9.24.2. A tap connection called TapQemu is bridged
with the default ethernet connection. It gets activated when I start
qemu.

To reproduce, compile qemu-system-ppc from current source and run:

qemu-system-ppc.exe ^
-L pc-bios ^
-M mac99 ^
-m 128 ^
-sdl -serial stdio ^
-boot c ^
-drive file=3DC:\Mac-disks\9.2.img,format=3Draw,media=3Ddisk ^
-device sungem,netdev=3Dnetwork01 -netdev tap,ifname=3DTapQemu,id=3Dnetwork=
01

I bisected to the commit below. Thanks for looking into this.

Best,
Howard

969e50b61a285b0cc8dea6d4d2ade3f758d5ecc7 is the first bad commit
commit 969e50b61a285b0cc8dea6d4d2ade3f758d5ecc7
Author: Bin Meng <bmeng.cn@gmail.com>
Date:   Wed Mar 17 14:26:29 2021 +0800

    net: Pad short frames to minimum size before sending from SLiRP/TAP

    The minimum Ethernet frame length is 60 bytes. For short frames with
    smaller length like ARP packets (only 42 bytes), on a real world NIC
    it can choose either padding its length to the minimum required 60
    bytes, or sending it out directly to the wire. Such behavior can be
    hardcoded or controled by a register bit. Similarly on the receive
    path, NICs can choose either dropping such short frames directly or
    handing them over to software to handle.

    On the other hand, for the network backends like SLiRP/TAP, they
    don't expose a way to control the short frame behavior. As of today
    they just send/receive data from/to the other end connected to them,
    which means any sized packet is acceptable. So they can send and
    receive short frames without any problem. It is observed that ARP
    packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
    these ARP packets to the other end which might be a NIC model that
    does not allow short frames to pass through.

    To provide better compatibility, for packets sent from QEMU network
    backends like SLiRP/TAP, we change to pad short frames before sending
    it out to the other end, if the other end does not forbid it via the
    nc->do_not_pad flag. This ensures a backend as an Ethernet sender
    does not violate the spec. But with this change, the behavior of
    dropping short frames from SLiRP/TAP interfaces in the NIC model
    cannot be emulated because it always receives a packet that is spec
    complaint. The capability of sending short frames from NIC models is
    still supported and short frames can still pass through SLiRP/TAP.

    This commit should be able to fix the issue as reported with some
    NIC models before, that ARP requests get dropped, preventing the
    guest from becoming visible on the network. It was workarounded in
    these NIC models on the receive path, that when a short frame is
    received, it is padded up to 60 bytes.

    The following 2 commits seem to be the one to workaround this issue
    in e1000 and vmxenet3 before, and should probably be reverted.

      commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 byt=
es)")
      commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size
(60 bytes)")

    Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
    Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
    Signed-off-by: Jason Wang <jasowang@redhat.com>

 net/slirp.c     | 10 ++++++++++
 net/tap-win32.c | 10 ++++++++++
 net/tap.c       | 10 ++++++++++
 3 files changed, 30 insertions(+)

