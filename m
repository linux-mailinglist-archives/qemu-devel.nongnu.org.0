Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2806D8BCF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 02:25:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkDR6-0004sB-W5; Wed, 05 Apr 2023 20:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UREuZAcKClQ6A87Az42AA270.yA8C08G-z0H079A929G.AD2@flex--komlodi.bounces.google.com>)
 id 1pkDR3-0004ms-6E
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 20:25:05 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UREuZAcKClQ6A87Az42AA270.yA8C08G-z0H079A929G.AD2@flex--komlodi.bounces.google.com>)
 id 1pkDR0-0005CK-Dp
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 20:25:04 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 v135-20020a63618d000000b005139242a138so7006547pgb.7
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 17:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680740689;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=m8tjpnf+cHao99aT7XBTFSlb0niM4wdXOo9nIIJzY/0=;
 b=mUMyDnILMAEzoqBJA2qc00QHg3xmx7ewTp+036PbRUjQi/W/EBLMAiordN95KgF9ZW
 xU+3CVFMR2aF8juJ5mnRQ9mnQa+c934YO8qDbBVKl1cU1dz46Xbk0KqApRAy8rm45DMI
 acn8ew/XtguuzL2CrFE/Wg5MXXvuBhwFv2lLVJp9Pj/YUFWCnjDNuVyI83ajhxHKYaVG
 54tcL18vJCE9zYWWFBQ+RrLnlsskU9a8OIKMfmfTVph8hj5b28nQePF24iHhPfuXnsvd
 048GCJd+j+dBm4YChXhJsDyms/ap3ERy0FfkGOCrEOz+/D/f3yG+9VR+kMyEu8hoxU5R
 u33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740689;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m8tjpnf+cHao99aT7XBTFSlb0niM4wdXOo9nIIJzY/0=;
 b=dGCe0OOPPj/YfukBxLoI/tpMnqPj2aLTJR8B7qVykmAxb7CQftHd2G971N24MY8zkz
 jG3Yi8FBZHVWD1NHU8IVVehCUpHd5yU0q7mqYYYutQWmgkhnwupbGus6x9ljmBaPjGX6
 kzZMisInNJ1Gm9nIWYET/R95aDYrnJICUIIDrMKpNLR3iDzZ4oM5rmq2H1tklnYMTVE2
 o33sgrkJM/0rnGwGlU3Gf6gqE+QnvMecu11ticCZi0SuCEE05Pn0aUiInZa+rrX8bCgh
 LU7kq86q9ImgPPu5dnco0XGfwhACuY2Tvuxw/aXW+xrajRGD23RSmqSwu2MQlVsq1wqG
 TYBA==
X-Gm-Message-State: AAQBX9cUa8RmPVpbXbhl9+vksKRExVxc/8IOrzkwoz7JqkfM7aem/rkk
 qRWnyDMphlCX78pwMIQ1d98vrUh0i5fSj9qY0VTmxxnCylJFvhDZUZi+VgXLfDQmwMCPWUyhgSw
 T5LRmKW+R++4XpdGRTczjyk/bXa+SByh6pNgGUcpVt7OEyHaaIAkQGQIVw6MK54c=
X-Google-Smtp-Source: AKy350YKBj5e9YNGTjxEMpMy361AVb1w32F4gLGinXAftp4I7p7E36vOZd+KioZWXKUOr3RyPqsFtcgqXm3F
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a17:902:a70d:b0:1a1:ffc6:de9b with SMTP id
 w13-20020a170902a70d00b001a1ffc6de9bmr3151017plq.6.1680740689415; Wed, 05 Apr
 2023 17:24:49 -0700 (PDT)
Date: Thu,  6 Apr 2023 00:24:45 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230406002447.4046378-1-komlodi@google.com>
Subject: [PATCH 0/2] hw/arm/npcm7xx_gpio: Add some pin state QOM
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: komlodi@google.com, wuhaotsh@google.com, kfting@nuvoton.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3UREuZAcKClQ6A87Az42AA270.yA8C08G-z0H079A929G.AD2@flex--komlodi.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Hi all,

This series adds a couple QOM properties for retrieving and setting pin
state via qom-get and qom-get.

We ran into a situation in multi-SoC simulation where the BMC would need
to update its input pin state based on behavior from the other SoC. It
made the most sense to expose this over QMP, so this adds properties to
allow people to do so.

Since the NPCM7xx is typically used to help manage other SoCs, hopefully
other people will find this useful as well.

Thanks!
Joe

Joe Komlodi (2):
  hw/gpio/npcm7xx: Add GPIO DIN object property
  hw/gpio/npcm7xx: Support qom-get on GPIO pin level

 hw/gpio/npcm7xx_gpio.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

-- 
2.40.0.348.gf938b09366-goog


