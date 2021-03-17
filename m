Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC7033E9BD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 07:29:08 +0100 (CET)
Received: from localhost ([::1]:58434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMPg3-00056n-1C
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 02:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPe0-0003YC-L1
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:00 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:34005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPdu-0008St-ON
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:00 -0400
Received: by mail-ej1-x631.google.com with SMTP id si25so759229ejb.1
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 23:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A6EMAPRNHxv0HDWqIU6UhE4M7wSOlBGdCjTJGl8tylA=;
 b=ox1/fecAsuiO1FLRSwlw7FfD6fGn1tYpQ5Z7YWuhVlnfzsr37vj6Aqo0ub9jE+a5Be
 So7Flo/mRd+4IyU2BgXUAxOuD9oM4+kzXxY/YrCSdwYwuFBaKxhZ677hL6u9YdzF5wSL
 ftEXqQ1GVV2L16GIWQNj/vsNZisnIWKXuTtrNxBvKyWgDeoXyXY9mNnglsnWpmxjQAJM
 RICu5svDlPKuP0IOzD2TOpmwfTuLyVQCMIq+H0s1jMMiEP9ZMHLjWeAlIRca8KQQCwI1
 58LuS6JNqlIlwkmJMLzd7/yUAQ0lYW+AwwNIh3N6QBxHYkn0muIbTaVQE5O88XOxgybD
 jDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A6EMAPRNHxv0HDWqIU6UhE4M7wSOlBGdCjTJGl8tylA=;
 b=STLhbGZAbkPBU9u9kOWkCs/Uj0Lhvvghe1SI39zblWwZ4KhvFtCaW2pOgwnCm1CHvG
 kN7fwD10DozTz2LllVWJ0GuCHl9xZ9wqn3emEM8+dhGfIcTI5d07NJJNWFxizQbz2rxf
 M+zHJ2tJWjfMLeOiFCecGu8RgpsMtWH17AcIUjK6VL1wEODtuKFW4uYBnz6TGDPCcsgj
 kI2WlloYP/T+FAJKKfpI/fw/swTlU8459kuxA8tVwAdQsuZ0qlds6aCVQx1qLQvgKt/E
 ih4YR8rCLf/lyl8brNhgWJDupCXWrJJaTddKq9Tx7SmUXdvHFxqEDKFJWuztCGDuXnWe
 uc+Q==
X-Gm-Message-State: AOAM532cFLxIllk3hPqpkmMAbJg9MnBtOCVNpFNS7cnteZk1rxezoa7e
 dNdvDkSzTXdaqM+/ajqtDZg=
X-Google-Smtp-Source: ABdhPJyFcNHGHuBXKti0ZOqbc5TxCxFipXC0A+zERU/VyiP1dNh1uLiB/LX+HP5zNc+RNq0to0YaKQ==
X-Received: by 2002:a17:906:1e4f:: with SMTP id
 i15mr33021268ejj.349.1615962411297; 
 Tue, 16 Mar 2021 23:26:51 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id d1sm10751349eje.26.2021.03.16.23.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 23:26:50 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v5 00/12] net: Pad short frames for network backends
Date: Wed, 17 Mar 2021 14:26:26 +0800
Message-Id: <20210317062638.72626-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This series should be able to fix the issue as reported with some
NIC models before, that ARP requests get dropped, preventing the
guest from becoming visible on the network. It was workarounded in
these NIC models on the receive path, that when a short frame is
received, it is padded up to 60 bytes.

Changes in v5:
- minor update on commit message
- update the eth_pad_short_frame() comment

Changes in v4:
- change 'ethernet' to 'Ethernet'
- do not inline the helper
- check the padded buffer size to avoid buffer overflow
- squash slirp/tap commits into one

Changes in v3:
- use 'without' instead of 'sans'
- add a helper to pad short frames
- add a comment to 'do_not_pad'
- use the pad_short_frame() helper

Bin Meng (12):
  net: eth: Add a helper to pad a short Ethernet frame
  net: Add a 'do_not_pad" to NetClientState
  net: Pad short frames to minimum size before sending from SLiRP/TAP
  hw/net: virtio-net: Initialize nc->do_not_pad to true
  hw/net: e1000: Remove the logic of padding short frames in the receive
    path
  hw/net: vmxnet3: Remove the logic of padding short frames in the
    receive path
  hw/net: i82596: Remove the logic of padding short frames in the
    receive path
  hw/net: ne2000: Remove the logic of padding short frames in the
    receive path
  hw/net: pcnet: Remove the logic of padding short frames in the receive
    path
  hw/net: rtl8139: Remove the logic of padding short frames in the
    receive path
  hw/net: sungem: Remove the logic of padding short frames in the
    receive path
  hw/net: sunhme: Remove the logic of padding short frames in the
    receive path

 hw/net/e1000.c      | 11 +----------
 hw/net/i82596.c     | 18 ------------------
 hw/net/ne2000.c     | 12 ------------
 hw/net/pcnet.c      |  9 ---------
 hw/net/rtl8139.c    | 12 ------------
 hw/net/sungem.c     | 14 --------------
 hw/net/sunhme.c     | 11 -----------
 hw/net/virtio-net.c |  4 ++++
 hw/net/vmxnet3.c    | 10 ----------
 include/net/eth.h   | 17 +++++++++++++++++
 include/net/net.h   |  1 +
 net/eth.c           | 17 +++++++++++++++++
 net/slirp.c         | 10 ++++++++++
 net/tap-win32.c     | 10 ++++++++++
 net/tap.c           | 10 ++++++++++
 15 files changed, 70 insertions(+), 96 deletions(-)

-- 
2.17.1


