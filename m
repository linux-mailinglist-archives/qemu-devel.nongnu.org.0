Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BBA3749F7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:13:46 +0200 (CEST)
Received: from localhost ([::1]:46328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leOq1-0001g5-F0
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOnL-00086y-3V
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:10:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOnG-0003y6-SX
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V1eoWZpIvlvfdoZhmliQ/BG4aKpCe40O/MgPuON3DVs=;
 b=BoQsRO0/jUIWy5DWT8C9uWHpSQWuerhMukaU2naB5Wbl8Cj5y9ANRU6KvHGxr0Z4bzxZUZ
 SdXx/B4jWTOWestByOG/RfObqDZS1f4u93ExNQIGUd4YhkB9zasAhn4vFkBuhUqVCYvvVh
 ZwVRewqJflP01z89xHEPR5Y09P+AE4c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-E3Q9JkI1MzugqPr_xSNl6Q-1; Wed, 05 May 2021 17:10:51 -0400
X-MC-Unique: E3Q9JkI1MzugqPr_xSNl6Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 7-20020a05600c2307b02901432673350dso702962wmo.9
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ll0S7QnsmVnP+/vVrYK4l7xjVxe7b+K//XpBK6D6DU=;
 b=jt5jRt5c4PefcL1QBeChNzeTRiDgNwV/r9/3GVLzADcwXSFWQOXPr8cln7T58A4NXn
 VBvc80mW68t7bZ74PXx6uyAie/hXAX5KYPK8GE7Lw8nO8psRu78s1cmLSlUT6GjCK68D
 YhViR0Y8z+aqgEXTFH+bNrBT0lBZRX0oHNMf7kWlaplbEbvQh3Sk948aCXAhO12U2qsq
 QxVvbSq5Gh+3JVZYYfTeZFbB2fDuWmawelONkFIqSdEgqBmgbejaL7qaYOHpB0o/GZmY
 lbB9llr6BVFl4JXi8F8MAeZoLVzdKIFDotItPtgGLXebGh5SV4hrKUN4BlRhIKqnPGxD
 5rUg==
X-Gm-Message-State: AOAM532liC9F1a7mqhpL/UNQVfPONUcdHPDvUuusWasaj/mgiJCwPrVz
 9MB1lH6N7DHfMKG2LKb1+geW6fyAWHi8nmIyA5pODMY3ed5qkWxoiyp8v9EXngn1RYYFs7IVlYR
 dkiVkFoXSAr/LyGFfNF2Hav6ToJtUAI2l7TxqsVzdZ6oaiWi5eTvrnvkzFXzwh7SL
X-Received: by 2002:a5d:49c2:: with SMTP id t2mr1080598wrs.64.1620249050305;
 Wed, 05 May 2021 14:10:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhPKHe189annECOIBjeRafeArOAeRzdj3lKGhiMAt3AZbiZIRvZoFgPPQZA4bnruZwo8xoWw==
X-Received: by 2002:a5d:49c2:: with SMTP id t2mr1080569wrs.64.1620249049909;
 Wed, 05 May 2021 14:10:49 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id h8sm523503wmq.19.2021.05.05.14.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:10:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/23] misc: Remove variable-length arrays on the stack
Date: Wed,  5 May 2021 23:10:24 +0200
Message-Id: <20210505211047.1496765-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series is inspired by Gerd Hoffmann and CVE-2021-3527.=0D
It removes all uses of variable-length arrays in the repository,=0D
then enable the '-Wvla' warning to avoid new code using vla=0D
to be merged.=0D
=0D
Mostly trivial patches using GLib autofree.=0D
=0D
Please review,=0D
=0D
Phil.=0D
=0D
(based on usb-20210505-pull-request tag)=0D
Based-on: 20210505130716.1128420-1-kraxel@redhat.com=0D
=0D
Philippe Mathieu-Daud=C3=A9 (23):=0D
  block/vpc: Avoid dynamic stack allocation=0D
  chardev/baum: Replace magic values by X_MAX / Y_MAX definitions=0D
  chardev/baum: Use definitions to avoid dynamic stack allocation=0D
  chardev/baum: Avoid dynamic stack allocation=0D
  io/channel-websock: Replace strlen(const_str) by sizeof(const_str) - 1=0D
  hw/block/dataplane/virtio-blk: Avoid dynamic stack allocation=0D
  hw/block/nvme: Use definition to avoid dynamic stack allocation=0D
  hw/block/nvme: Avoid dynamic stack allocation=0D
  hw/net/e1000e_core: Use definition to avoid dynamic stack allocation=0D
  hw/ppc/pnv: Avoid dynamic stack allocation=0D
  hw/intc/xics: Avoid dynamic stack allocation=0D
  hw/i386/multiboot: Avoid dynamic stack allocation=0D
  hw/usb/hcd-xhci: Avoid dynamic stack allocation=0D
  hw/usb/hcd-ohci: Use definition to avoid dynamic stack allocation=0D
  net: Avoid dynamic stack allocation=0D
  ui/curses: Avoid dynamic stack allocation=0D
  ui/spice-display: Avoid dynamic stack allocation=0D
  ui/vnc-enc-hextile: Use definitions to avoid dynamic stack allocation=0D
  ui/vnc-enc-tight: Avoid dynamic stack allocation=0D
  util/iov: Avoid dynamic stack allocation=0D
  target/ppc/kvm: Avoid dynamic stack allocation=0D
  tests/unit/test-vmstate: Avoid dynamic stack allocation=0D
  configure: Prohibit variable-length allocations by using -Wvla CPPFLAG=0D
=0D
 configure                       |  2 +-=0D
 ui/vnc-enc-hextile-template.h   |  3 ++-=0D
 block/vpc.c                     |  4 ++--=0D
 chardev/baum.c                  | 22 +++++++++++++---------=0D
 hw/block/dataplane/virtio-blk.c |  7 ++++---=0D
 hw/block/nvme.c                 | 17 +++++++++--------=0D
 hw/i386/multiboot.c             |  5 ++---=0D
 hw/intc/xics.c                  |  2 +-=0D
 hw/net/e1000e_core.c            |  7 ++++---=0D
 hw/net/fsl_etsec/rings.c        |  9 ++++-----=0D
 hw/net/rocker/rocker_of_dpa.c   |  2 +-=0D
 hw/ppc/pnv.c                    |  4 ++--=0D
 hw/ppc/spapr.c                  |  8 ++++----=0D
 hw/ppc/spapr_pci_nvlink2.c      |  2 +-=0D
 hw/usb/hcd-ohci.c               |  7 ++++---=0D
 hw/usb/hcd-xhci.c               |  2 +-=0D
 io/channel-websock.c            |  2 +-=0D
 net/dump.c                      |  2 +-=0D
 net/tap.c                       |  2 +-=0D
 target/ppc/kvm.c                |  2 +-=0D
 tests/unit/test-vmstate.c       |  7 +++----=0D
 ui/curses.c                     |  2 +-=0D
 ui/spice-display.c              |  2 +-=0D
 ui/vnc-enc-tight.c              | 11 ++++++-----=0D
 util/iov.c                      |  2 +-=0D
 25 files changed, 71 insertions(+), 64 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


