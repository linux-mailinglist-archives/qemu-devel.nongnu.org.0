Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746C141C1A2
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:31:38 +0200 (CEST)
Received: from localhost ([::1]:40602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVVw4-000459-Am
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtS-0001o3-7R
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:50 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:54125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtO-0005gQ-Lh
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:49 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MOz8O-1mAg9g15YK-00PQdT; Wed, 29
 Sep 2021 11:28:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/20] Q800 for 6.2 patches
Date: Wed, 29 Sep 2021 11:28:23 +0200
Message-Id: <20210929092843.2686234-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1m2QWaHYF4vD3r95wsNyu+OBq90imBH0rHLbAmxrv4SoAInyCEy
 uFO2/xBwXa7awPnpEPDZ3XU1Lc41B2lMsP28Yu6ixGL/GMzC//I3EJuYMN3Vbm+BHEiTLcd
 5beXzo0Qw/YU62eNjlHMZ7cArbO+CIiZ3/ZeVPq8wt9sAKkQr5D8PS1UEkmgCN4TwxRhVSX
 iKu48w8guFslXM8AiSlzA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NY8XJ0Ag5Ew=:CpjIDs4DUdMTbw7xiQATah
 svqT2vF4VDIFftLMgGOs433l+ZyMcjRdWIJBVEy0UW7HyxJD1yYl04b3rJtYPWBfgiNXTm1xb
 Cs+yom1lPrMmnDfKM5uHUC4p8zxWfZ+ayjyccihqOUnhRrzInOq9oYDmRwP6Uu+4OJVyyzIbv
 KXIOSULyT7/3tFZ+q9iUKyOhVlWObnl1ifP+McHBGtSMNxIUlK6N74tmIU0ScWDtZjVdNEYqm
 l3/MxfDdjoZN/VdjPOPJu/jbvfB5pxpZGFL0Zi2BnS0aD/Qm4QWGshRB0GrZLQS0L3EgVu0Ln
 QnhPTCO/pCAPS8XlQfcT4HMYqZsYV2Zhw7h1fUjZPwzgOnzCDfVHFqbx1lNzPm0vrFPt+1vey
 EXWw1hYljTYt/ZAGOLQqrAuKKc8sRZCPKyAahYsZV9Af6vgxQpsh0rV6dflsqJ4MekmK7wzNV
 niJrq5YBwGP5HBrG/+PkgZvHTV8xi590/W93OnVGHXNSsvMWYw73MsgKzgruEZLzAcF38B8z2
 6HyqYkjJu6rssDaTPsGwaCw3G7YtEsjIgPPuNycsdART2QQroioDJ6kNbWlrqM//VFWStiyZR
 ao5ft1xjaeF79InvdN+LvhOXxD3oM1Sn3bX1mwPWjrboVjB59ufBMC0e348nGXykBsWykn2gP
 hIFzN9vr5HeGjneGinxTwP3kdyK1k/W+JjcAPy/64VWio2Azi3SwPt11cp30ajtZzPKnyEoOF
 0GTSmPAb3YxCQWrGD0o1ipJQ4moXs+dE7IVnWw==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6b54a31bf7b403672a798b6443b1930ae6c74dea=
:=0D
=0D
  Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-reque=
st' into staging (2021-09-28 13:07:32 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu-m68k.git tags/q800-for-6.2-pull-request=0D
=0D
for you to fetch changes up to 5ef251416b5116bbf7723f31ddf8a6949a2ac271:=0D
=0D
  q800: configure nubus available slots for Quadra 800 (2021-09-29 10:45:19=
 +0200)=0D
=0D
----------------------------------------------------------------=0D
Q800 Pull request 20210929=0D
=0D
NuBus cleanup and improvement=0D
=0D
----------------------------------------------------------------=0D
=0D
Mark Cave-Ayland (20):=0D
  nubus: add comment indicating reference documents=0D
  nubus-device: rename slot_nb variable to slot=0D
  nubus-device: expose separate super slot memory region=0D
  nubus: use bitmap to manage available slots=0D
  nubus: move slot bitmap checks from NubusDevice realize() to BusClass=0D
    check_address()=0D
  nubus: implement BusClass get_dev_path()=0D
  nubus: add trace-events for empty slot accesses=0D
  nubus: generate bus error when attempting to access empty slots=0D
  macfb: don't register declaration ROM=0D
  nubus-device: remove nubus_register_rom() and=0D
    nubus_register_format_block()=0D
  nubus-device: add romfile property for loading declaration ROMs=0D
  nubus: move nubus to its own 32-bit address space=0D
  nubus-bridge: introduce separate NubusBridge structure=0D
  mac-nubus-bridge: rename MacNubusState to MacNubusBridge=0D
  nubus: move NubusBus from mac-nubus-bridge to nubus-bridge=0D
  nubus-bridge: embed the NubusBus object directly within nubus-bridge=0D
  nubus-bridge: make slot_available_mask a qdev property=0D
  nubus: add support for slot IRQs=0D
  q800: wire up nubus IRQs=0D
  q800: configure nubus available slots for Quadra 800=0D
=0D
 meson.build                         |   1 +=0D
 hw/nubus/trace.h                    |   1 +=0D
 include/hw/nubus/mac-nubus-bridge.h |  13 +-=0D
 include/hw/nubus/nubus.h            |  49 +++---=0D
 hw/display/macfb.c                  |   6 -=0D
 hw/m68k/q800.c                      |  26 +++-=0D
 hw/nubus/mac-nubus-bridge.c         |  34 ++++-=0D
 hw/nubus/nubus-bridge.c             |  23 ++-=0D
 hw/nubus/nubus-bus.c                | 120 ++++++++++++---=0D
 hw/nubus/nubus-device.c             | 227 ++++++++--------------------=0D
 hw/nubus/trace-events               |   7 +=0D
 11 files changed, 278 insertions(+), 229 deletions(-)=0D
 create mode 100644 hw/nubus/trace.h=0D
 create mode 100644 hw/nubus/trace-events=0D
=0D
-- =0D
2.31.1=0D
=0D

