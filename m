Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2650033CF6F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:14:49 +0100 (CET)
Received: from localhost ([::1]:40330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4qm-0003Zi-73
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pC-0001tb-3c
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:10 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:36086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4p8-0007fJ-RH
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:09 -0400
Received: by mail-ej1-x62d.google.com with SMTP id e19so70700527ejt.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 01:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5hCYoSgv/4N0qrjAw9ty9PrMc8a9qAvFCw7eIlN/wwM=;
 b=Ibq9zq8swACAD+ZzNjHTDS3kzA/uuLjuqsF9lmMTBu0tK244KgOEnJoeA5S2UdL8/A
 FpKsruJCgpl6v0FSY8K/hKp0MY3IipomufVX+pxabENW+fle9jMFZuovXDIxshhteHcK
 +VQyNk8T6uWXrNrKxHBgxW996jgh6EvoA51DSoyX5a0ILipmtCsa16ukJ7uu0z1WwWwk
 kIJ16YIduV2wCBuSAmvSHj/nmJxgB5uFmLELSfASPGCtnc9kPVqrmRQWmyMdZ07UQ3kB
 2QWJEDwn3njdtdH+h+8VGUK2MomTcqcE96i8DGRgiE36jpNZ1EEtOvEeFk3yUwIUnBxp
 cy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5hCYoSgv/4N0qrjAw9ty9PrMc8a9qAvFCw7eIlN/wwM=;
 b=P6JxSx2HmhXiWFNfCMO5KMSWa5Ta+BpMFzPiJ6mF+fNE/ChyTM2UVy8twj0M5uAR3X
 MkNjoKdUlfGl0UNNLFyAedhn4JlrgoO+bQJsR/HyfsSq9cfaZYZA9PO1AqzVvkIs1z8y
 5KIK+YAsOS0Na/IQDBlDRUxy18wVJ01YsNdXUlUzZ9RJxHAu9Gug/39k9qy9K+AspZLq
 F8jcLVsp8xOijSmQSJB4w2Ktk2KcXjUTP4maWMQkkPGBcVYBtDRMBv+3QbyqoCUEikSx
 XYAJnxLvgezfS24ZSzehq7/BMna6hKCh4y90E2SIY/fHNQ5hwR7+e8H72VA8jM+dXQ4G
 xf2A==
X-Gm-Message-State: AOAM530fT4LEPEUXGrQIujZeqbyW+wpbQa4eQqsufz0zF2q0u/hXBq13
 DQ8WqEErsRDtMm5jR4SITMk=
X-Google-Smtp-Source: ABdhPJwqanN3e0+raJa4VvILEWlvycbnuZG/CRWrioGWgEviJHK4VLy073MXEpPMSxTuBwviuVVjRA==
X-Received: by 2002:a17:906:81c9:: with SMTP id
 e9mr27990487ejx.456.1615882384622; 
 Tue, 16 Mar 2021 01:13:04 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a17sm5620333ejf.20.2021.03.16.01.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 01:13:04 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v3 00/13] net: Pad short frames for network backends
Date: Tue, 16 Mar 2021 16:12:41 +0800
Message-Id: <20210316081254.72684-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62d.google.com
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

Changes in v3:
- use 'without' instead of 'sans'
- add a helper to pad short frames
- add a comment to 'do_not_pad'
- use the pad_short_frame() helper for slirp
- use the pad_short_frame() helper for tap

Bin Meng (13):
  net: eth: Add a helper to pad a short ethernet frame
  net: Add a 'do_not_pad" to NetClientState
  net: slirp: Pad short frames to minimum size before send
  net: tap: Pad short frames to minimum size before send
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
 include/net/eth.h   | 25 +++++++++++++++++++++++++
 include/net/net.h   |  1 +
 net/slirp.c         |  9 +++++++++
 net/tap-win32.c     |  9 +++++++++
 net/tap.c           |  9 +++++++++
 14 files changed, 58 insertions(+), 96 deletions(-)

-- 
2.17.1


