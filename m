Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABF46257A0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 11:08:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otQwJ-0004n8-GW; Fri, 11 Nov 2022 05:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1otQwH-0004mR-No; Fri, 11 Nov 2022 05:07:09 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1otQwF-0008Fe-Ou; Fri, 11 Nov 2022 05:07:09 -0500
Received: by mail-oi1-x22c.google.com with SMTP id h132so4513334oif.2;
 Fri, 11 Nov 2022 02:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bv+MGsQ1AkP9QhCMpz+ZIevL2OZyKlrEdeDeeJDBCtE=;
 b=AEvrMnhrT8gHEHy3FhkCdJeRVuKqszpK5zCXjSf+0WwpfDindSsanmwd7e+gS6aHkg
 f29uMn48MEVMK7eirkqcwoUZFsGirFp/LwqyPGygTiBMkSPtFJaHj6hPrlXr84MrbeTm
 Yc0kZp59RtAEltGOX/xU59w5ckxfVx3n80AwNLDi39dykUx4n2K5RavmZ6rXtdHeAgAA
 Ozn3UNMGfMRpInuGGSppBlh0Ly7RzdRGzcQVJl2Ya4BVM4brlpvaaJiYZ73JBmxWQ5iM
 uHAhlMqrzefxos1TKrVnuSeyLD63LYWQGqbIbheWbOZ1Ew3JWW1XgZSB6FhOlArd7OiH
 RUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bv+MGsQ1AkP9QhCMpz+ZIevL2OZyKlrEdeDeeJDBCtE=;
 b=rLioIWIf+2YaHYMgCJ38T6/AcyIVSFx+ufHPP7d2ib12EqOZ8ABjbJehuU4CFd6aC4
 mfmBG62oiTwOOwKAzgkI9GAHAij4wS2bTTP6GsqgCQ+Pk7bFKtF9hslgW/cDS/zVKQ04
 BGGKbp4dFPvOetDeZqGsYzqViiD+s0kClcBq+PhvcvGXVrDaKy+4lTKZzsf0IzdCnsxe
 hFguvw12tZaB+I5nRgEoTahfbtPTiu96L6hlMKYnGZqTMAx4asKYBP29ELUSKNK2jB/6
 rf4n1168xSDOjpxVPbzNXOv8DcrsOSX5fQCca44Z98UzDwv/DUrNrnEJ0eLSqASq4wnu
 Np7w==
X-Gm-Message-State: ANoB5pnPcS1kzzYgTMx6ORt3SydWK2S1r0johXyNvJ4AMJEyFCjldl9P
 w+MJgY0eSY3vEKu5f7Ko79L+vDrclwU=
X-Google-Smtp-Source: AA0mqf69puIUfMbt1UmpyXFp8aIsWFR90WjosP1qtEtu04DUKNEgwNsX/xC4MSldhyzUfe0ESC8ZRA==
X-Received: by 2002:a05:6808:212a:b0:35a:6153:f608 with SMTP id
 r42-20020a056808212a00b0035a6153f608mr408906oiw.48.1668161225787; 
 Fri, 11 Nov 2022 02:07:05 -0800 (PST)
Received: from balboa.redhat.com ([187.34.29.120])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a056870898400b0012d130c2fdasm994862oaq.48.2022.11.11.02.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 02:07:05 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 0/1] ppc queue
Date: Fri, 11 Nov 2022 07:05:50 -0300
Message-Id: <20221111100551.1076171-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 2ccad61746ca7de5dd3e25146062264387e43bd4:

  Merge tag 'pull-tcg-20221109' of https://gitlab.com/rth7680/qemu into staging (2022-11-09 13:26:45 -0500)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20221111

for you to fetch changes up to ec5651340d445f009db1c2dc507da8cb4df85ad0:

  hw/pci-host/pnv_phb: Avoid quitting QEMU if hotplug of pnv-phb-root-port fails (2022-11-10 18:22:10 -0300)

----------------------------------------------------------------
ppc patch queue for 2022-11-11:

Short queue with just a single pnv-phb fix from Thomas Huth.

----------------------------------------------------------------
Thomas Huth (1):
      hw/pci-host/pnv_phb: Avoid quitting QEMU if hotplug of pnv-phb-root-port fails

 hw/pci-host/pnv_phb.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

