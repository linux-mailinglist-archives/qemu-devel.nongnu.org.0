Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C38215001
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 00:08:56 +0200 (CEST)
Received: from localhost ([::1]:59198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsCoh-0003I4-0n
	for lists+qemu-devel@lfdr.de; Sun, 05 Jul 2020 18:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsCnR-00022e-Gl; Sun, 05 Jul 2020 18:07:37 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsCnP-0005g8-Vq; Sun, 05 Jul 2020 18:07:37 -0400
Received: by mail-wr1-x441.google.com with SMTP id b6so38863481wrs.11;
 Sun, 05 Jul 2020 15:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ri6FwfZukk5ogPANqGxCn8AivnInXet/7pIZaS8Cato=;
 b=q6GYmGGK3yTbl6DEiTp8IFXo+oYBkPGKmIxIFBv5hpsrc1VO7I1IBd2AM7yvMgVebb
 Nugy7c1/uYPHyrj62vQOrMECyRD5CSR3NhlN8LkeV+tl27c9BCRdJekIg66hr0yFcbA9
 JQ8SeqObu00IZMpJbFuFWvXsdOavYAOb97gfC3wuPojopQE4sITAfX4u+st+rGahVre5
 f5xarHUH19ovyD5LTXpSwDdxyb65Ql4LAQgImjIGoHrcOza3HCO5b5OH6a91HlTKswyD
 YqPrG3vEmsDJL9Hhz+SgnRVTxupEpPTSUNSwWUGoZES2jK5IhRSm0H+IwvPwd3xA71Bb
 il/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ri6FwfZukk5ogPANqGxCn8AivnInXet/7pIZaS8Cato=;
 b=IjKxq5X4HLLBBsrSmbEu3MlPVJMtb5khFkd+iExlnaInDiRDUyg/W7vVNwfx+/k9fv
 nMXgWn+Yss2Uwsy79wD0XYikUcmsn0MdgP16R/5tB+JeSDRLflkEXI5CP6Fawi1CPQNU
 XS6ibYQsdnMjUaxUglDoCU4Otd9t7pCTS9VXvLRC0i1tYU975pru8O7WYIRuoNitmM7c
 AgklN948clFCNBt2eNqyhs7U0K59zGUmyaIreG+ZUNaI3AshqfqPrhovQvo7rDb5N6xu
 OmZc8SYjGMY61WaOMqZzmuE0MhzM5FrkLFahws/bBTpNKDSurEUwt+FfRzDtPXQClmtx
 WG1g==
X-Gm-Message-State: AOAM533P88Qjpl3eiV/2+fcTV8rZm95tn/FPRHMCoYaHKBHp1hgswPHT
 wHa+oDLtsNcP5++2EHsH7UgKncO1OuI=
X-Google-Smtp-Source: ABdhPJxpxjSfmo1Kep0iGV1vYcklb7RuehWfiDbgnHV3VZAKJVd8XGA91nqoPgwODK8A/3B0T1UrpQ==
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr17044222wrj.14.1593986853793; 
 Sun, 05 Jul 2020 15:07:33 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id j16sm21538214wrt.7.2020.07.05.15.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 15:07:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/2] hw/sd: Deprecate the SPI mode and the SPI to SD
 adapter
Date: Mon,  6 Jul 2020 00:07:29 +0200
Message-Id: <20200705220731.28101-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <huth@tuxfamily.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 libvir-list@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I tried to maintain the SPI mode because it is useful in
tiny embedded devices, and thought it would be helpful for
the AVR MCUs.
As AVR was blocked, I thought it was wise to deprecate the
SPI mode as users are interested in the faster MMC mode.
Today Thomas surprised me by posting an update of it!
https://www.mail-archive.com/qemu-devel@nongnu.org/msg720089.html

I'm still posting this as RFC to discuss, but I'm reconsiderating
keeping this mode a bit more.

Philippe Mathieu-Daudé (2):
  hw/sd/ssi-sd: Deprecate the SPI to SD card 'adapter'
  hw/sd/sdcard: Deprecate the SPI mode

 docs/system/deprecated.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.21.3


