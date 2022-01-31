Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F5E4A5190
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 22:38:23 +0100 (CET)
Received: from localhost ([::1]:48022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEeNQ-0007Fa-Sr
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 16:38:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nEeL3-0004RM-5y
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 16:35:53 -0500
Received: from mout.gmx.net ([212.227.15.15]:38963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nEeKm-0000vw-Df
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 16:35:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643664930;
 bh=4ss85snrYbhV7GjXXrszW5cFrKz4TRP3PK2RRe2VsSo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=edw+4nGQ5FTI77Z36+dYOD0+OwDdBD3Mfnjxtd3qXmUn7t6bQV0779dsM0RhHj+tf
 jjeXJP4rq4Kw5LM6JDClb3YYpYg/WaAk/YuWX6qrrDahY4puRGophLs98rLAtVlRoV
 OzYUy4VGx0PGiYEAEOqSWmvToB1TtpxPFc1ptQDI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.183.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXp9i-1mihkE1LPY-00YCNX; Mon, 31
 Jan 2022 22:35:30 +0100
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 0/6] Fixes and updates for hppa target
Date: Mon, 31 Jan 2022 22:35:23 +0100
Message-Id: <20220131213529.17404-1-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mn33Y6ChrYxryMCatfK8ruWnHcFmaA083Ix2+hVxlOYvWX9qH0B
 4BbLhXg2GbuEW7CUFi6r1yJiOX68KYHOOYDLeoiH1RIJUPsC1cjLKuUb3uoj6Vy07g1IK4S
 Cx3zLjasYofPIfYK0kX5YjSOZ/asz6482kaCUVtvYGPmVojMPlTouAVJnpFO+QqE/gxh/sd
 wcDstT0i642gEjyvigNKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MxZqvfvid4k=:C3Hg2OKimVrJUzyhMHr6jy
 KWuH8TO07uNAl9XSAPVueLpe+wP0uo8YcW3/l6VFp8Kttk5aJdbrnI5NO4/TozG918QEYzhwF
 mmffZy8GwrOpSlgC9hESNGMbR59c9Hyliupsagr6Pz273qWgOLYCEQIhOAft75uKJDeaIC6ZK
 qmiq5y6LzFml5zrBLYHEFAQahTqoOk7+9U9FVJb1msdrUFZ7h9QkXw4HQJhRQg7BcWrAh6Agm
 a9f478hLtSYFcxIQAPB3U3buuzCZVw9CBfwqzZ8XtJnFirUllDSfccLLDhlB5yQu2EI5sk2Ts
 xU69TGvOkQjq2LRQsSudPvbrpv9nvCPJ5Q8QZNhKLoW2uDt6Z9yfZM9FEBacG7Rvyquz0EJtX
 I0cDHc+1oh6/U2GXu++oExizY9uYzBkNlKpT7lFsXDNYCXRDrsI/Dgjms2Vv0jZCCemCEFs77
 8kBz4uElzPwi4q6vHjCSTbbYkqs7VSFCNFYp24Xf71+D0TWoSpLVdhpneg0OFv6q3Iw+EFVuU
 yTsqcKPnPVAYyZsceHz30N6V8b2A2xthlysF5lKFmjFnzsYg2B+XKgwvEeAEbGxrN+etvibZk
 9o3+yvzvWPKyjpUqh+lnDIq9Iqg8nFdOAXY4Dsy3tC4wTpLfNAGMVQ5XIAAd9UX3KFv6gWhFY
 sYdXUPgFOkaXg0nKLiYTQTF9HvyjY26WF1oISDQ/WaAf8fYy05KWSSMS1JxFVXm+0fysK1us2
 YnWaZIkXzOB6HqY0AY6KcyM6Llvi7hWIICvRCBRm++8QFKYmbAN3c6jhX7b9nUTbEL2ZiIghF
 /nDcK700MXDf8DIOtVF1r6iGL5JjMInjIDUxCsNFHh3ucimB1XDiwnr2gVeF9QcmEG7PXA0dP
 zbTQ4C1/Br6FSGyM15LXlt2/krIWXus4CJpu9xBTVczneGfDSenWevaQnPOk8kUiOxKldFT2g
 3uyVs5Uy1TLJEqjxmB8eCvKqdxE6JemP9UnSLDQNXBgiIYGruH5S8/SJRbvbIElhCCwGMKYdr
 PZmYHY/NkMXe3ryJ0HULl8HeAeLs1Ar8TYrmZxbZ5rEZTXrgomRV7B1uYCaotHo9JnbmixD/0
 UJYTqunBH2dMtA=
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset fixes some important bugs in the hppa artist graphics driver:=
=0D
- Fix various artist graphics misrenderings on HP-UX and Linux=0D
- Fix draw_line() function on artist graphic=0D
- Fix mouse cursor positioning and focus under HP-UX=0D
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

