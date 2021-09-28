Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE18041BA83
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 00:42:03 +0200 (CEST)
Received: from localhost ([::1]:49344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVLnW-0004rc-Eg
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 18:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <33JlTYQYKCm8gVghfeTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--titusr.bounces.google.com>)
 id 1mVLm4-0003FI-0a
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 18:40:32 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:53978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <33JlTYQYKCm8gVghfeTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--titusr.bounces.google.com>)
 id 1mVLm2-00074n-AQ
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 18:40:31 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 w4-20020a056902100400b005b6b29d9a27so760277ybt.20
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 15:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=USb2FvCy938gLTrHYcKZ/bU+Z5EfjY2OIMeKtLGHgQI=;
 b=ojAzy73ns44/sTzgZGUUVxRRkfSGrrMzXb6yCehSvEXGbOeMGfZnSHXRyFSWkI7IqN
 eQSAlDa+n4Ood9yZ2gxeGrWPC1/60Y0D7YbhJmdMV5xrXco7b6ty+UwLbjv9usPl+rmZ
 FDfidJEF8lYOjFoi9Uf1oTlHvi/mtLUxLrSAXmQkfyoaXo/1yblVKXU7hNGGFYFY64t/
 YRnBq8SalEla7pOFxJMBcozE+z3JqRu/pjcudhvub8m5EnFWhsNpJ87444NFc25mhsq7
 z2wytHGjKhoTcAOt9fVpMc/RuVWMHqMltNL09/qD3lZ62y1OMvWd6AD7pgqFfLLeAfIP
 Ax4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=USb2FvCy938gLTrHYcKZ/bU+Z5EfjY2OIMeKtLGHgQI=;
 b=Hh0uQBLvNxl9jz9KB6n3Pc2t41L/uCBJE32Vu/zr1YXpAZ/gj1lBg6HLLHGep+eZEC
 QXEr8SbwALiAII3sHZvcCD+0P0ubtDSY4MPBfPY9/KVItkh45/hRFzVIVBzQheJUYM0l
 duqpYCEVZqyIGqhofW4HjaDnOh7zxsCavM1BtC6Oa9w22Ny/x2to6WR+UzqxMTa5ygl6
 /NRd0J7ecELPZ/M5IXZT6B1PxjiaA7YAT6P4F+Et5dA2VQwxRJWEnMyc6cHoADibcdrN
 ZrBFQficR4Cx5zJqLLQx9DWut/NvF4XHkCwkHpvirUDuT1M9UPuXIwofrVAAqTOp8nxv
 Ja3Q==
X-Gm-Message-State: AOAM532MWNlMhxsDWOXr5ez/3K20OaDzspmD6umSbFe4dKcqLmuA9SCk
 2CpfJaN9ynKeNpN8aImn60sutuVUT4k=
X-Google-Smtp-Source: ABdhPJxs9HUIpZxAPf8BSObfFNhdCoKbp9bySHYYvz6754zUcC7h/7pf6RV57O7y2wRvdqVtNM05Jv4xqrY=
X-Received: from localhost ([2620:15c:2c5:13:bb4a:748d:1e5f:4de8])
 (user=titusr job=sendgmr) by 2002:a25:8b8b:: with SMTP id
 j11mr10076305ybl.160.1632868828567; 
 Tue, 28 Sep 2021 15:40:28 -0700 (PDT)
Date: Tue, 28 Sep 2021 15:39:41 -0700
Message-Id: <20210928223942.244860-1-titusr@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [RFC 0/1] hw/ipmi: add an aspeed IPMI iBT device model
From: Titus Rwantare <titusr@google.com>
To: clg@kaod.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 andrew@aj.id.au, wuhaotsh@google.com, minyard@acm.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=33JlTYQYKCm8gVghfeTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

This patch follows the Handing IPMI for emulating BMC patch set by Hao Wu.
Building on top of the work in [PATCH] hw/misc: Add an iBT device model pos=
ted
by C=C3=A9dric Le Goater, this iBT model works as a backend to ipmi-host-ex=
tern.

Needed to run:
- [PATCH 4/8] hw/ipmi: Refactor IPMI interface, Hao Wu
- [PATCH 5/8] hw/ipmi: Take out common from ipmi_bmc_extern.c, Hao Wu
- [PATCH 6/8] hw/ipmi: Move handle_command to IPMICoreClass, Hao Wu
- [PATCH 7/8] hw/ipmi: Add an IPMI external host device, Hao Wu

Host commandline
    -chardev socket,id=3Dipmichr1,host=3Dlocalhost,port=3D9999,reconnect=3D=
10 \
    -device ipmi-bmc-extern,chardev=3Dipmichr1,id=3Dbmc0 \
    -device isa-ipmi-bt,bmc=3Dbmc0,irq=3D10 -nodefaults

BMC commandline
    -chardev socket,id=3Dipmichr1,host=3Dlocalhost,port=3D9999,server=3Don,=
wait=3Doff \
    -device "ipmi-host-extern,chardev=3Dipmichr1,responder=3D/machine/soc/i=
bt"

Currently, IRQs are not functional, but it is able to connect.
The following printout is from the host:

[    6.869742] ipmi_si IPI0001:00: IPMI message handler: Found new BMC (man=
_id:
 0x002b79, prod_id: 0x0000, dev_id: 0x00)
[   12.393281] ipmi_si IPI0001:00: IPMI bt interface initialized

This patch is an RFC because of the missing IRQs and the need for other pat=
ches
to get merged.

Thank you all.

Titus Rwantare (1):
  hw/ipmi: add an aspeed ipmi iBT device model

 hw/ipmi/ipmi_extern.h        |   1 +
 include/hw/arm/aspeed_soc.h  |   2 +
 include/hw/ipmi/aspeed_ibt.h |  77 +++++++++
 hw/arm/aspeed_ast2600.c      |  12 ++
 hw/arm/aspeed_soc.c          |  12 ++
 hw/ipmi/aspeed_ibt.c         | 311 +++++++++++++++++++++++++++++++++++
 hw/ipmi/meson.build          |   1 +
 hw/ipmi/trace-events         |   7 +
 8 files changed, 423 insertions(+)
 create mode 100644 include/hw/ipmi/aspeed_ibt.h
 create mode 100644 hw/ipmi/aspeed_ibt.c

--=20
2.33.0.800.g4c38ced690-goog


