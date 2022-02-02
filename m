Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F28A4A78D5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:43:10 +0100 (CET)
Received: from localhost ([::1]:50776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFLX2-00042X-K8
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:43:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nFK6d-0006r5-3l
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 13:11:47 -0500
Received: from mout.gmx.net ([212.227.17.20]:40911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nFK6b-0007C5-3d
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 13:11:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643825500;
 bh=8q6ZOjVrL25qu89frUiEFxwsLE/PKLpPa3bLNyGbgEk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=B0Z8wB+fu1gZabewFe+TrbguvFnfbedmuUJPMq/RAfGq0hQ23RPHl91rozDdTjTDQ
 Ut/F8B5NAT6nR/yLht42Ydp50SzPxP+NwkYNH62ch543rILuxb0oUrr7Yh+MT8wzZb
 nviNVAOUNCShh6CGSMiPaNyZEl+KkE9h05ls/PBc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.163.171]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5mKJ-1m8gtD0RVD-017AC2; Wed, 02
 Feb 2022 19:11:40 +0100
From: Helge Deller <deller@gmx.de>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 0/6] hppa target updates and fixes
Date: Wed,  2 Feb 2022 19:11:33 +0100
Message-Id: <20220202181139.124485-1-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vFYcewhwGcFC6vFnx2i5CAXLFNfIpO8piH5Zd6Mn9KWgUgYUIoT
 L2vhVqS3CQYhSQ2Ziw4WgQUJvxLdX/euK1WWE67l/L62o68sMjoKsHH4s8TbQNOfHW7Ecf2
 Vi27/pHk/dIEGyvzOwvUc6W/XDIg9TWxaXQfuwuvGxdywWKUXWmbu+UMCz1+j/n+400MFAU
 Aesg/2gi2/JOkdYc4Lrdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TZNrE2zFWE8=:xEXOMDMVvzccZG7/QVdcTc
 WaSvolyUa+++VwjQOjuCHBobjbd+imtmyn2k/BH7gV+xZ59yH0xV1df3SufNzANpLmLXxQx6e
 kQsdsCoHxv75sda3Ko+hD2HvXbDfMrofipij45qoN+8lekJ8ELHJPiW+/iEL1XpWzjqEM/+o3
 MK7own/LD+1Uz1GU5lKV8/PHlPHY5siGVNCwdyaTACuEzNu5qa0bT2k55IUp6CmLFc+ZDXCpq
 uSYccnGD0F/SBzodwb8odVt40phpS9PiNYJTieMA5GTZ7U0h+O0Ml+7MO3HcTSZi3sxRLfZjb
 lSrybKoHH9mh4bbBLv4fdJDU5r7nIT5nXL4A7ZiE6SJE36oRHNyR2iW9GXPM3OImqvUc/tmpq
 eACV44RUWNJDfZCS2skdhqEJF8NlIDJLFJz5U7xRJGu3SSRADpD1V7+a2lpigD+WRRV/W06ex
 ISdUfgJk7lxdj2SW3cXieGYdVPmx/3saYZ3Oo3wrn3Iwe/UpU+qctwyTFYssUeVFivAQUSvU7
 2Wf9w6GS2MP+KmJ5G2KenKnRZ9ylgufc2le9O08ws/lndQgR8W/KhuwayGO0tsgG+1VWlhvUc
 sO8rU1fmJ0WCGBRU4S1Kh0cT+cFkaa/46Mpwg3puqodOeW/rPxy+dhk+tmqnRaz8ldm45AsEa
 I389W9FG/Q7TS2OaeNFqg9uXhQ7+z1v8zpVt2m3ijTez5uCT9s44ojFg6rrx6Pmn3iuNRLcE/
 8EAtdk+2/eh3E5YrhZ502PqzbOxCC+KFsRRGhOvevYXCpUefbIOUZD/GNV19hZjtVIDCYpUMO
 uCVl8td8OilcEvbPBBoVwQvYRt4zwOIKckNurACI3M20HyK0gIPac+17GNca5mc7eOc8+GCnc
 crpMb+iQKryqu80T0wzToW3Ev//jbjugp4EMhihedHYKAp6mt6lxqOmblQR1Q9Gbff7P0N/WI
 6fwtykW0g8baIW0slw82Uag6A+xsO8CgBC+tJHJqbp6sWPZTd924UXrxbCuSZiPZppkcNf/X3
 I40qbZRpa05yiaLbsgp9hyoAKNmHfLlUNU4EC/py1gtLcDjwgdzyHj2FLfUK9qB6eT8HhUBIx
 S+fi24QfXpSnwI=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 91f5f7a5df1fda8c34677a7c49ee8a4bb5b56a36=
:=0D
=0D
  Merge remote-tracking branch 'remotes/lvivier-gitlab/tags/linux-user-for-=
7.0-pull-request' into staging (2022-01-12 11:51:47 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/hdeller/qemu-hppa.git tags/hppa-updates-pull-request=0D
=0D
for you to fetch changes up to d449eee3af37937f788c02ad88f2caa8bbfb19aa:=0D
=0D
  hw/display/artist: Fix draw_line() artefacts (2022-02-02 18:46:45 +0100)=
=0D
=0D
----------------------------------------------------------------=0D
Fixes and updates for hppa target=0D
=0D
This patchset fixes some important bugs in the hppa artist graphics driver:=
=0D
- Fix artist graphics for HP-UX and Linux=0D
- Mouse cursor fixes for HP-UX=0D
- Fix draw_line() function on artist graphic=0D
=0D
and it adds new qemu features for hppa:=0D
- Allow up to 16 emulated CPUs (instead of 8)=0D
- Add support for an emulated TOC/NMI button=0D
=0D
A new Seabios-hppa firmware is included as well:=0D
- Update SeaBIOS-hppa to VERSION 3=0D
- New opt/hostid fw_cfg option to change hostid=0D
- Add opt/console fw_cfg option to select default console=0D
- Added 16x32 font to STI firmware=0D
=0D
Signed-off-by: Helge Deller <deller@gmx.de>=0D
=0D
----------------------------------------------------------------=0D
=0D
Helge Deller (4):=0D
  seabios-hppa: Update SeaBIOS-hppa to VERSION 3=0D
  hw/hppa: Allow up to 16 emulated CPUs=0D
  hppa: Add support for an emulated TOC/NMI button.=0D
  hw/display/artist: Mouse cursor fixes for HP-UX=0D
=0D
Sven Schnelle (2):=0D
  hw/display/artist: rewrite vram access mode handling=0D
  hw/display/artist: Fix draw_line() artefacts=0D
=0D
 hw/display/artist.c       | 463 ++++++++++++++++----------------------=0D
 hw/display/trace-events   |   8 +-=0D
 hw/hppa/hppa_hardware.h   |   5 +-=0D
 hw/hppa/machine.c         |  35 ++-=0D
 pc-bios/hppa-firmware.img | Bin 757144 -> 701964 bytes=0D
 roms/seabios-hppa         |   2 +-=0D
 target/hppa/cpu.c         |   2 +-=0D
 target/hppa/cpu.h         |   5 +=0D
 target/hppa/helper.h      |   1 +=0D
 target/hppa/insns.decode  |   1 +=0D
 target/hppa/int_helper.c  |  19 +-=0D
 target/hppa/op_helper.c   |   7 +-=0D
 target/hppa/translate.c   |  10 +=0D
 13 files changed, 283 insertions(+), 275 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D

