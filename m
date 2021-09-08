Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24F4403CA4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:39:50 +0200 (CEST)
Received: from localhost ([::1]:34336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzfx-0003UU-NC
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzbr-0003fV-1N
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:35 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:44007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzbo-0003lY-H9
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:34 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MMGZS-1mhB9Y1lAc-00JIIL; Wed, 08
 Sep 2021 17:35:30 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/12] Q800 patches
Date: Wed,  8 Sep 2021 17:35:17 +0200
Message-Id: <20210908153529.453843-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sJTZNb1IyYgqawup0oi/JT340e1Zbft4YuIhPf8qoBs17EFmqEz
 xAOXESnk4MCIE9I6ecnNYX8qbKnCflzj2ACKUnsM384D9aQt3X2LzFnH1tBsiCLYiirzJJU
 362ntepo62dpVufCni6d2Uz9+kLJ9MxMki6GRsX/+HeUcvRocmBrJIdTSauO5OPvS2EX6z8
 XjilqKpZIPBQ8K+NjCxGQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hCTCW4xge+U=:3BsOcYDlhnHWzDYmbErTyd
 aLDOZk2ncmn+js9hBbsnzkknJD3P2PgtCsFqa+0YCB9W80Px94oHja8AoelnUViuTafmep9yJ
 xmKgUuP1tAo3pQcUj1RMvRPBbQpt+g3JT2qCpg3r62aT6iWQb7r2rmBs6XNdbTJ5W9a14uutV
 vrI8SFrHLJ5M8QFc8CWRM3i0KgJe40nmwFysE6PeTXQjyLe5dkxUFxsLAv7citVv2BS9ZAUBt
 jqgBe69S+rKa40z6mOoF6BvMHf31LjvcXgOM+L5Spj0JUGKkK7QVL0020cX9doRjIZZrDHO/D
 jexP+sshRzHpoRjJ+iD8m02TvAWeqASEK5R5on32BIO/Bzhg1Zyqq0ozBBcn/j98izn1Yo/HE
 5N54LO19rG6hUHqr21PSVtRmCJc/7gnaJL6H1ye0ryPvTmpQ4CNiOlPOt/AFQqIJTCNTY1qLp
 MYzozAb0Z7XLYOBOaQQMC8nF91uRndUtDO9KVtbMt0mtgDeOgKmW0K726EAn1INSZHsk/T5mQ
 2DGiRQXtYoYIU4C9afcjTZuRw48D2Z4R9K0y5cd/6J7TMXdL2PRZCvltPbwsntF1dfWxo3X1E
 0ZSLBwaX/7mgMK9JQGEZsZG8AHGyA8tOVK24hDbwAgEDDFe1FIeHtdIgP84t7+6SRctP9Gbb9
 V8oH5+kASfw0PxeL3sz9+DS6sbbvrjdsSbQUZ6qQP5QbABKMzP8bUymavR+/PKFZFe+2XBz6g
 wszJRhnG7SB7z06iIUQ2XKFaHUXbvEOCq+eseA==
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

The following changes since commit abf7aee72ea66944a62962603e4c2381f5e473e7=
:=0D
=0D
  Merge remote-tracking branch 'remotes/thuth-gitlab/tags/s390x-pull-reques=
t-2021-09-07' into staging (2021-09-07 17:46:13 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu-m68k.git tags/q800-pull-request=0D
=0D
for you to fetch changes up to dde602ae539910c3579952834b713e2f360ec34a:=0D
=0D
  mac_via: add qdev gpios for nubus slot interrupts to VIA2 (2021-09-08 15:=
37:41 +0200)=0D
=0D
----------------------------------------------------------------=0D
q800 pull request 20210908=0D
=0D
mac_via: remove MAC_VIA device and prepare for Nubus IRQs=0D
=0D
----------------------------------------------------------------=0D
=0D
Mark Cave-Ayland (12):=0D
  mac_via: introduce new VMStateDescription for q800 VIA1 and VIA2=0D
  mac_via: move last_b variable into q800 VIA1 VMStateDescription=0D
  mac_via: move PRAM contents and block backend to MOS6522Q800VIA1State=0D
  mac_via: move PRAM/RTC variables to MOS6522Q800VIA1State=0D
  mac_via: move ADB variables to MOS6522Q800VIA1State=0D
  mac_via: move q800 VIA1 timer variables to q800 VIA1=0D
    VMStateDescription=0D
  mac_via: move VIA1 reset logic from mac_via_reset() to=0D
    mos6522_q800_via1_reset()=0D
  mac_via: move VIA1 realize logic from mac_via_realize() to=0D
    mos6522_q800_via1_realize()=0D
  mac_via: remove mac_via device=0D
  mac_via: remove explicit viaN prefix from VIA IRQ gpios=0D
  mac_via: rename VIA2_IRQ_SLOT_BIT to VIA2_IRQ_NUBUS_BIT=0D
  mac_via: add qdev gpios for nubus slot interrupts to VIA2=0D
=0D
 include/hw/misc/mac_via.h | 101 ++++---=0D
 hw/m68k/q800.c            |  38 +--=0D
 hw/misc/mac_via.c         | 547 ++++++++++++++++++--------------------=0D
 3 files changed, 328 insertions(+), 358 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

