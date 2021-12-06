Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86864694D3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 12:14:22 +0100 (CET)
Received: from localhost ([::1]:46178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBwr-0006WR-Fg
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 06:14:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muBqb-0006lz-MU
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 06:07:53 -0500
Received: from [2a00:1450:4864:20::432] (port=37806
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muBqX-0003LB-Oe
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 06:07:51 -0500
Received: by mail-wr1-x432.google.com with SMTP id d9so21602227wrw.4
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 03:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zyw7UGzMfAR5sZsU09v3TYHXgnUedWm3KDBndWbbbeQ=;
 b=jDQXhNG2LlmqR/Dl5tvGzytSl56oPBqH3oevIFfgY+Yf2tKtw7YADUCRzNu3WHNzoj
 uL3Uu5aS5EncfxjObGoshUw/LPixLxMtkiLP4fVuNlUD/B4XCjCA5hK6Wd9DXX5wFhnv
 my8qntk3k7RSPMhOcDhdVG56MWGsu5sapV4fFJt/2UtQGdPtCBCMd8lkYNYhLnZwcV7q
 N7Kme1GYBWBRy35CoGS5nmGCOc3GGXRt/DErUohwqV/6JOCHdRRMc6ctYbEGJNZiXqUk
 XXvL6oGdBQ1Px4iuAaoujiCZW3/1AbkVVE8GBTHq0R+c2Km+vZGyovqBYzWia5XMch5X
 dYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Zyw7UGzMfAR5sZsU09v3TYHXgnUedWm3KDBndWbbbeQ=;
 b=5zPQISaHxr9Yvg65iVnp2up5cni3keNWk+Z+UrVyQs+ZMYpuFRPrAvO1kKSfEUyCDv
 KWpZgbeWrAm8m60Bs7p61TPCa1vj44b/FgKggl9/7UjIykdvYowJBTYMLYxxRBcjj4rP
 MFhqNzSd55GgaftE3EsEeMu/neN0IYmaFrGccMdq9ZCIoELKsPwqRohH97iZ1Qug7enV
 EvLsVMnwz365rQxgVmHllxYR0X/VL81uKZW1rvmhjfuc26XVQml8ohEKd/OBAf33BPvp
 X+xBTZczpk/Mk97d2itAB7LNYLgD0VvrOX74KcPDpMSUKpRgP4STjGn6HxKW2YGtOP1I
 IWjg==
X-Gm-Message-State: AOAM532Ldeu2MprnyMVZo1cemfZXcylCUTbhT2e6nsx3hYEXD9iRR9SG
 siD7+X9PmNP67A1Mz/datTLusYRKO6c=
X-Google-Smtp-Source: ABdhPJxN9Nv1KvBNSSON1kuMu6ix/ayebrEbq/2AiRVGON6UWkJnze53HQZwHUhdiB+t7HrSDfCOkg==
X-Received: by 2002:a5d:4b45:: with SMTP id w5mr42678549wrs.272.1638788868379; 
 Mon, 06 Dec 2021 03:07:48 -0800 (PST)
Received: from x1w.. (82.red-83-50-95.dynamicip.rima-tde.net. [83.50.95.82])
 by smtp.gmail.com with ESMTPSA id m36sm11320578wms.25.2021.12.06.03.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 03:07:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] MIPS patches for 2021-12-06
Date: Mon,  6 Dec 2021 12:07:43 +0100
Message-Id: <20211206110746.360608-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2 patches fix new code, 1 fix a regression, all introduced during 6.2.=0D
=0D
The following changes since commit 99fc08366b06282614daeda989d2fde6ab8a707f=
:=0D
=0D
  Merge tag 'seabios-20211203-pull-request' of git://git.kraxel.org/qemu in=
to staging (2021-12-03 05:26:40 -0800)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/mips-20211206=0D
=0D
for you to fetch changes up to ac5837e330ec33e2df2d83338713a5c4272c8cc8:=0D
=0D
  Revert "vga: don't abort when adding a duplicate isa-vga device" (2021-12=
-06 11:57:36 +0100)=0D
=0D
----------------------------------------------------------------=0D
MIPS fixes=0D
=0D
- Do not emit SD instruction on 32-bit CPU (Jiaxun Yang)=0D
- Correctly catch load_elf() errors on Boston board (Jiaxun Yang)=0D
- Revert bogus CLI fix for ISA VGA devices (Alex Benn=C3=A9e)=0D
=0D
----------------------------------------------------------------=0D
=0D
Alex Benn=C3=A9e (1):=0D
  Revert "vga: don't abort when adding a duplicate isa-vga device"=0D
=0D
Jiaxun Yang (2):=0D
  hw/mips/bootloader: Fix write_ulong()=0D
  hw/mips/boston: Fix load_elf() error detection=0D
=0D
 hw/display/vga-isa.c | 10 ----------=0D
 hw/mips/bootloader.c |  6 +++++-=0D
 hw/mips/boston.c     |  5 +++--=0D
 3 files changed, 8 insertions(+), 13 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D

