Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5F15FE994
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 09:29:20 +0200 (CEST)
Received: from localhost ([::1]:44724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojF8B-0005bn-IK
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 03:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ojF3A-0008Om-3U
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:24:13 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:48123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ojF37-0004rn-FM
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:24:07 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N33AR-1p8Ufg3atZ-013Nbm; Fri, 14
 Oct 2022 09:23:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/2] M68k for 7.2 patches
Date: Fri, 14 Oct 2022 09:23:54 +0200
Message-Id: <20221014072356.2075517-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HpoLkL7sjOjRYZF46USYXmBHHpc4+xKix6+tVAYxTaXl+lz4irE
 DcwRoP2cuWK2S1IpxAGAzxtZWrdY4fyRAxuMYudONIa34701vP6tnK+PkjEGfk1u/QPpK4C
 aWnprGdlYU26tmlq7luRVwImjJ+zuaoRYlDmN1JvfXC7os6OFzLRo15G5b/d/JAS0B237v0
 2ZqhpELLwhxL2sTdqdiuw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uF3htBfQ520=:qPOEZw9W8sroH4+Cr2e98y
 DShWOiLgm+BWV1dKa81BLqZfCaxdMBVyfHfA7D/oAqDLsqXP+C+pii2s9ltmFq6/1dV4OOdS2
 ayOzlPGEWU3+Ep9ywyOmjxF7BnuocoF68Cb6LyN7pYZXXZzplSzQK2m40W9M383ytBgLvdMLl
 TiKFUGM81K0VWQB3BEbPI//Xf4OExi6RQAvaz/ei2wm0O4T4bhJO0O+g7xg8dO+4j4GD3y5HG
 gyDxQ89DbaKWcgufD1+1MEGFljNmdoGSEGYRXRDedFfJuciSTpVKAzq7fWz1zw15VaLkKONHe
 2EgCxfejrFebZwRgfb7Wr9jXe7JCwURITprVbwUr4HED/SPOuBYAz71W9bVwBGtdipiGNv4ha
 6HEHUideDnfTdyptBHueHeivbpA2IhpkiSu0yaY4BZkLzXH40mATy3WqU+/lFs8o08T7/bs6D
 J1oTp5B53kX1fJoTqZBgJoqtIk37yrmeUGrhY48TCqL/HLj4WQuJAlT9aRtU2K7LuNh+AjeTs
 wjvWrXX8q0A4U5PAh61VuFKp+aSllbt4pmEi0p7AC4an0jWdBOkp3+eG1/BHVna+rhE3CHsc1
 lw1T9i3oI+RGL9HWXq+La3pr2Fwj6WumI8tH33jckc917YNk8HhVAlyWdz0w7kHYVWkBJ08m7
 i1DI9HG1qamYEVIchKAvdgQVkSOUyWz9pR3inNWuTCZQWSMtMJU3POjZRollm/gC/fLH7EFg9
 189dE9ovaDER6mu9RidEFrkEqtv85JeW042iGG9FdoKrFUkXL0iCXfm8Q0N5cX38dhRiCn2/n
 DxZPoBU
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f1d33f55c47dfdaf8daacd618588ad3ae4c452d1:

  Merge tag 'pull-testing-gdbstub-plugins-gitdm-061022-3' of https://github.com/stsquad/qemu into staging (2022-10-06 07:11:56 -0400)

are available in the Git repository at:

  https://github.com/vivier/qemu-m68k.git tags/m68k-for-7.2-pull-request

for you to fetch changes up to fa327be58280f76d2565ff0bdb9b0010ac97c3b0:

  m68k: write bootinfo as rom section and re-randomize on reboot (2022-10-11 23:02:46 +0200)

----------------------------------------------------------------
Pull request m68k branch 20221014

Update rng seed boot parameter

----------------------------------------------------------------

Jason A. Donenfeld (2):
  m68k: rework BI_VIRT_RNG_SEED as BI_RNG_SEED
  m68k: write bootinfo as rom section and re-randomize on reboot

 hw/m68k/bootinfo.h                            | 48 ++++++------
 .../standard-headers/asm-m68k/bootinfo-virt.h |  4 +-
 include/standard-headers/asm-m68k/bootinfo.h  |  8 +-
 hw/m68k/q800.c                                | 76 ++++++++++++++-----
 hw/m68k/virt.c                                | 57 +++++++++-----
 5 files changed, 130 insertions(+), 63 deletions(-)

-- 
2.37.3


