Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EF6328E1F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 20:26:20 +0100 (CET)
Received: from localhost ([::1]:36806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGoBL-0007Zm-94
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 14:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danny.milo@datacom.wien>)
 id 1lGo9o-0006hV-OC
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 14:24:40 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:38525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danny.milo@datacom.wien>)
 id 1lGo9j-0006HD-Mo
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 14:24:38 -0500
Received: by mail-lj1-x229.google.com with SMTP id 2so16325348ljr.5
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 11:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=datacom-wien.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tlz6CxAmZLLbQwqwL076+yfRWNT1vjynohCWAaB7Xlo=;
 b=0Xs5aoYJrQSEYPdtSVK2PiXFSE+eyvAzjxVqL8PZzfimSaBkcxm6vUbEhZWyRqgMym
 TIz1hW3N5YhTA3ksLKNKWU2c3cPieR/hn4jTATFnUeNJKPxUGx+Y0JrkPXRABevnSZxW
 y6D0NXH3c4rh69BSCWI+0jSuCsWBfwTOJZocql26OSGnHPnfmdAA4WSNI53qnd7KgKmS
 nk3Adta6PN3ECiktOVAIrNGZEVtvVLaLdaf2fMd4dYKlnY86d5lEkUZe0ogO386t09Yj
 3GGIkgJAg9vYcK4DRjFM9liHtQ+mvAysox3J/if2Cb1psRD+Z8WLmmxtlrAzagBDaqdW
 5Ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tlz6CxAmZLLbQwqwL076+yfRWNT1vjynohCWAaB7Xlo=;
 b=b+eSfY0fDcP0bniTuf6KrthMABEAjLTNM3xzDzSL8sRekKpJRF1vlFGToauec5lKp4
 e5n5IgZ2+/BMJtcOKcElYI31Wfe7/eeLzqc5bItDxusYlXbLbLtIGDLcUVQC0W08IhQn
 IMBrXFC2NqByrHOgukVwEp5nA96RaOPi88mbbu2eQyM9F3Uj72GPv1dTp462ibHwBpRx
 GUA83HHLAYkjJb+oaJx+hwUDOkkCnxk3/KiJJr5yW3zA60oXUKkOyrvRYsvlKxJ6CNUw
 ZmYMI/zWbrgbyRmNED+xxH7JfYYXBWg49Xv5tB52wuQl83lhjNw3saMGXpng2bGWmIq3
 D5Ag==
X-Gm-Message-State: AOAM5310tBGr3Ucll2vhhqBUM811UH6lxnxmS49gECQ2g7q9Yj1JMVpj
 jmKXvSysQneL93NTdCuwKscK7hOyTUtYfw==
X-Google-Smtp-Source: ABdhPJwOpYgcY/frtsuTvckbU0TaLcpWXvxdswGSpwmguTkCnBy84wmXLlMeO49JwsxChfLoemrhjQ==
X-Received: by 2002:a2e:544d:: with SMTP id y13mr9691175ljd.95.1614626672423; 
 Mon, 01 Mar 2021 11:24:32 -0800 (PST)
Received: from dayas.lan
 (2a02-8388-0281-94f0-b958-b6e3-fc53-344d.cable.dynamic.v6.surfer.at.
 [2a02:8388:281:94f0:b958:b6e3:fc53:344d])
 by smtp.gmail.com with ESMTPSA id z28sm1181170ljm.44.2021.03.01.11.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 11:24:31 -0800 (PST)
From: Danny Milosavljevic <danny.milo@datacom.wien>
To: qemu-devel@nongnu.org,
	rminnich@google.com
Subject: [PATCH v2 0/1] Add support for AMD new-style boot mechanism.
Date: Mon,  1 Mar 2021 20:24:22 +0100
Message-Id: <20210301192423.32396-1-danny.milo@datacom.wien>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=danny.milo@datacom.wien; helo=mail-lj1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

 hw/core/generic-loader.c         |  6 +++++-
 include/hw/core/cpu.h            |  1 +
 include/hw/core/generic-loader.h |  1 +
 target/i386/cpu.c                | 11 +++++++++++
 4 files changed, 18 insertions(+), 1 deletion(-)

[1] http://web.archive.org/web/20201125131718/https://doc.coreboot.org/soc/amd/family17h.html
-- 
2.29.2


