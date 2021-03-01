Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5857232863E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 18:07:44 +0100 (CET)
Received: from localhost ([::1]:44292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGm1H-0001ts-Ct
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 12:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danny.milo@datacom.wien>)
 id 1lGlvW-0005KH-Tk
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:01:46 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:41760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danny.milo@datacom.wien>)
 id 1lGlvT-0002aJ-Js
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:01:46 -0500
Received: by mail-lf1-x12f.google.com with SMTP id q25so6409574lfc.8
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 09:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=datacom-wien.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PbnRqXcRw3GFMjovQ8HTIBPol3CuTcv9WBzMt3bl3vg=;
 b=KhGKVHsKMkr+hCIvPR6xc+J4xyvN99HPh3kJPTt2bLYFvuZyVlt05Lw8xQDrpE0jWb
 3dC7EWPpIepmkHo6UB2yWB7EEOX3I5B2dfFNPCf45er4rmmo4CsBZ+8sfVDagVCwhY+E
 10AnXfzzxFVfeoYmM+ao2ITU3IM2Ht4zpmkAXfhhGx8TziiKLJmYooN6Xj0/ndY6bJko
 GRWfSS0SEG1k6nYFe7Gg3HfQm1o+UOGaAwKp6bfBqJTFPpyLntuzOB/bcdhDIyjL2PsF
 noIqQ152PyE24ms5cDOPHG/UgPQzoOtMA2yyyvk238/gi1pLbfTvs9kjYnOMHp5m5eZl
 KsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PbnRqXcRw3GFMjovQ8HTIBPol3CuTcv9WBzMt3bl3vg=;
 b=MItGTlNpeXRnupjIQohTq28ekWThXlgXJKJ5Wf2M/YdwvKtBykxS3JnSa2bl+HxOTh
 4zNawCkm5GHFbXNCN15C/ytM1Hw+H0rHVkhqDMv+ZkKUWCTdqEHgHP/75tBXMssuIfQZ
 pzLOK7JAT1P2bKny17BaQLL9CPtCJcIrFbxUzW7sCrAV0BW+gzozWdN8KOS9OYWLnbuC
 FlPGmJTfEuJrX2b7w9VcBk975fJPmDD02Yd8UQhsCXNgVMNG8j17vspg9e268OPzZJIl
 uXsmT/EhSanMv/Z33LAmsWjf+smzvi650d/rnG1rl7Tj+HiVkXUaM7OlMURdYJOm1qf+
 8Nog==
X-Gm-Message-State: AOAM530fncZs2z/HEIzTCaQ/piGwa2ReVrLgf8QeWtRvuS3ny3CtnncD
 HjgjLMLd/3EEod4v0/REwMwkFAJkpEe5Lg==
X-Google-Smtp-Source: ABdhPJyziGtjD2EtdCbBOW60pI5mhwoQ0PzE0h+BMjLO9wEXTZhcTG7rmOXLt+vp1NADXR3qqgL4oQ==
X-Received: by 2002:ac2:5d4d:: with SMTP id w13mr7124903lfd.63.1614618098656; 
 Mon, 01 Mar 2021 09:01:38 -0800 (PST)
Received: from dayas.lan
 (2a02-8388-0281-94f0-b958-b6e3-fc53-344d.cable.dynamic.v6.surfer.at.
 [2a02:8388:281:94f0:b958:b6e3:fc53:344d])
 by smtp.gmail.com with ESMTPSA id c12sm1409914ljk.11.2021.03.01.09.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 09:01:37 -0800 (PST)
From: Danny Milosavljevic <danny.milo@datacom.wien>
To: qemu-devel@nongnu.org,
	rminnich@google.com
Subject: [PATCH 0/1] Add support for AMD new-style boot mechanism.
Date: Mon,  1 Mar 2021 17:14:31 +0100
Message-Id: <20210301161432.22554-1-danny.milo@datacom.wien>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=danny.milo@datacom.wien; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 01 Mar 2021 12:03:09 -0500
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
Cc: Danny Milosavljevic <danny.milo@datacom.wien>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A lot of AMD CPUs boot the bootstrap processor using a new mechanism.

According to https://doc.coreboot.org/soc/amd/family17h.html [1] that means
that the flash header specifies a destination and size in RAM (!), and the
bootstrap processor will start using a CS segment descriptor set up in such
a way that from the CPU's point of view, 0xf000:0xffff is the last byte of
the loaded blob (i.e. of the BIOS).

See <https://doc.coreboot.org/soc/amd/family17h.html>, which says:

>Picasso Reset Vector and First Instructions
[example]
>Flash BIOS Directory Table
>destination = 0x9b00000
>size  = 0x300000

>... then the BIOS image is placed at the topmost position the region
>0x9b00000-0x9dfffff and

>reset_vector = 0x9dffff0
>CS_shdw_base = 0x9df0000
>CS:IP  = 0xf000:0xfff0

The patch below allows the user to set up CS_shdw_base.

In order to test, try

qemu-system-x86_64 \
   -m 1G \
   -device loader,file=BIOS.fd,csbaseaddr=0x9df0000,addr=$0x9b00000,cpu-num=0,force-raw=on \
   -device loader,addr=0xfff0,cpu-num=0 \
   -bios BIOS.fd

The "-bios BIOS.fd" at the end is optional--but customary.

This has been used successfully for more than a year in BIOS development.

Danny Milosavljevic (1):
  i386: Add support for AMD new-style boot mechanism.

 hw/core/generic-loader.c         |  5 ++++-
 include/hw/core/cpu.h            |  1 +
 include/hw/core/generic-loader.h |  1 +
 target/i386/cpu.c                | 11 +++++++++++
 4 files changed, 17 insertions(+), 1 deletion(-)

[1] http://web.archive.org/web/20201125131718/https://doc.coreboot.org/soc/amd/family17h.html
-- 
2.29.2


