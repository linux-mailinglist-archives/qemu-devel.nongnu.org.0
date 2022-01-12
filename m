Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B1348CD7C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 22:13:22 +0100 (CET)
Received: from localhost ([::1]:59598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7kvp-0006pp-32
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 16:13:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1n7kqM-0003bH-JH
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 16:07:42 -0500
Received: from mout.gmx.net ([212.227.17.22]:35585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1n7kqH-0000eY-GQ
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 16:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642021650;
 bh=RSbjYt1sSKudaTnR3U3AiIFZ7kOMKdRG6jWlSLvkV8o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=i64KlwBn3iXJhcaMyiQd/eFf+Eo+WONoGg2qzEJ2P0JRwrH3fvQPVHZ9habIwTMeX
 h5wrRlLSG66ZUCONhCSOhP3lxaCLIZVc2RhMG4XyOi4A2o8N7f7nki0ubYkvUDLqrN
 u7Mw29VMhpRuBqb5wKD7Ek1IPiEuQYkc9nAp3kzU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.184.198]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQMuX-1mlQd12iqP-00MIEK; Wed, 12
 Jan 2022 22:07:30 +0100
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 0/5] Fixes and updates for hppa target
Date: Wed, 12 Jan 2022 22:07:25 +0100
Message-Id: <20220112210730.292775-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G7KgLQV3TMc5/2iBQLogSqA87roA1tMM4Pbu2Rz8im97yaiYlyD
 ZXecISnxXX7u1z+wXUaT2fFAmwYhsFvCN1vRdIMqvB+dJtssQK1S56fOF9E2rldLH3kd/e6
 h7OzVxSiKobfkQZuUju1a91S3ddn7N7FlkwbGXV0RB2PzylL299WfVEyHdkDkssHUPj7/UE
 qKwbnMd9ix5o0tlkVv4fw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wzhzvcfNB2k=:NiB6FhPzv1Zyna/T0z4g/Y
 2RB8E+saaJcga7k0qqZd8PsfKo4KG77KXwXptwZocWR8msukz9qV/I0IglidzAFAxsbyvkDdm
 sImQA2IcWF1Wq2I6NWCkdYXAM3pMKJsVWykYrU6iETw5COqrHy6fxfAP02GmVvGArFHzk53w8
 7eIXMyxZT95rr0iVVs9DPSEXtjBPR20/P6dqobWyS2nr/ikxnXvbZL8p5e3HW/EaZ00+ZmN1K
 cC2HM2q0aKKr4sVqv5Xwa+PCuvHokUNCIyYXFwvfCZe49kzlHYuLgexkgfcFM+oroboZuYODX
 /NXsQFbZZX6fxYS+P4e4zTO4KwXkZ+uXx8L5b5393tyDeHDQqCCt4avkuJOL5xqE052Red/E1
 20yXMnpJT7CHBhxVww9VTi3fRe5voMMoWM2RMHnBIaXUDBmiHAGLx/EBTkz4W3TWkguE8kCmL
 nS80MfPZFQD3DLn3uLr/+hRxq8VdGt6whszL1EbmGCQMgM6gzp4cyoMS8U2T0lsHDH1e4IwcR
 0t1QO9aB4KhYqEqevYqioYdpnpXVFzQ2IG7T8XqJ1ON3HQ1U1wPRVtlqxXiZsgrOIEmKbyZLt
 lJL3s2pAQjWz8PdqM1vBx27CIsrQ7k6h1Q+uilqpjrUsj6HaAjAQK9ONTDAidTDBtMxhCKMJ6
 zfNY+EJAJRjlDTIBlP7j8momaSgazhRkjDimiYVTJaALL/bsKtlr+h8qguHYvOCuISUVWjkD8
 tENtgLjWLTY7wS/Qy/2IkbGsV1XP8lPoqEkMC3tpsp+iNeeM3UH3I5QjOzxwUarr/WCPBBB+C
 xH6j/Q8AdIB2ayB+mlaCrUm16BShFKWdZAF9LyQVYFUCjSyuXErzKyJZsNsZXoH/tUX/HmTDc
 75Cgmajcni6EhfXwt1vmbH3SoVUzsqmf2vMQLaBueaRbcz88OJgrNzy4KJk3Kgg1+IGHGMOGy
 UQ5zU7HoZTNzQqP++5RFi0QBIGpbSk53OUSc7hBftkC3dT21n9GNmDhX96wj0zwD7O6EeMwxT
 pg8nKbwISjDDYk+duTQ8WtyUh1Rz22kEREMZodJ10ijeypJU+DnApPm4eYVrnU58yA==
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset fixes some important bugs in the hppa artist graphics driver:=
=0D
- Fix framebuffer access for Linux=0D
- Mouse cursor fixes for HP-UX=0D
=0D
New qemu features for hppa:=0D
- Allow up to 16 emulated CPUs (instead of 8)=0D
- Add support for an emulated TOC/NMI button=0D
=0D
A new Seabios-hppa firmware:=0D
- Update SeaBIOS-hppa to VERSION 3=0D
- New opt/hostid fw_cfg option to change hostid=0D
- Add opt/console fw_cfg option to select default console=0D
- Added 16x32 font to STI firmware=0D
=0D
Signed-off-by: Helge Deller <deller@gmx.de>=0D
=0D
Helge Deller (5):=0D
  seabios-hppa: Update SeaBIOS-hppa to VERSION 3=0D
  hw/hppa: Allow up to 16 emulated CPUs=0D
  hppa: Add support for an emulated TOC/NMI button.=0D
  hw/display/artist: Mouse cursor fixes for HP-UX=0D
  hw/display/artist: Fix framebuffer access for Linux=0D
=0D
 hw/display/artist.c       |  58 +++++++++++++++++++++++++++-----------=0D
 hw/hppa/hppa_hardware.h   |   5 ++--=0D
 hw/hppa/machine.c         |  35 ++++++++++++++++++++++-=0D
 pc-bios/hppa-firmware.img | Bin 757144 -> 701964 bytes=0D
 roms/seabios-hppa         |   2 +-=0D
 target/hppa/cpu.c         |   2 +-=0D
 target/hppa/cpu.h         |   5 ++++=0D
 target/hppa/helper.h      |   1 +=0D
 target/hppa/insns.decode  |   1 +=0D
 target/hppa/int_helper.c  |  19 ++++++++++++-=0D
 target/hppa/op_helper.c   |   7 ++++-=0D
 target/hppa/translate.c   |  10 +++++++=0D
 12 files changed, 122 insertions(+), 23 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

