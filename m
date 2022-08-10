Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3136358EA55
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 12:12:23 +0200 (CEST)
Received: from localhost ([::1]:39318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLihJ-0003xQ-Lg
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 06:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLiaz-0006o6-2t; Wed, 10 Aug 2022 06:05:49 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:36745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLiax-0000rY-1b; Wed, 10 Aug 2022 06:05:48 -0400
Received: by mail-vs1-xe36.google.com with SMTP id o123so14606323vsc.3;
 Wed, 10 Aug 2022 03:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=4F8T4hIgCCQOBTZuPBS8XT/2m6umiv4Adep49HApF1Q=;
 b=YDCJrKP1HrAWuHBpBsawBMby5sc+4aJvBfg/zKlYjaxHTu3exAq0f2C+DaeWJxKob/
 kXXc6I1pPipcBT1jhTIwuwfQ4oUuw+sI8bzE8pJq7R5Ri/RjR6G7EQmLjx8YSsU4vWb0
 vzUc5DEKJHIu5w7xATxP8qO5m8GmYnhG5mDNZZWQGdkPxjaFBk52m+gn6rz8o+q+v82T
 lL2ofVjv4QUQsUMSH6580mL0Q7/DP6S9rLQsfGVOUo/h/AcTT5Ah8V/tlTngWK2Q150Z
 eRpEfGagqkmQ7j5znF8lH44pIUPEVa4vsPj9jU+2jEbAmHHJmr3cosFFbMtY1y9l93K7
 /bwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=4F8T4hIgCCQOBTZuPBS8XT/2m6umiv4Adep49HApF1Q=;
 b=jy0O0O7yGG/ErkitvnLMUiP1tqwic9QTAmlUj7aaAZSfyTflOvmRomOUmjd696vvMX
 iMcynCKFZVhRE23X+jgl5Gtng8s2YXpdnfVLEGHqR4SSziXfsaCtq1N29ssRim6F+yXX
 5F2LgsCGEe+JRu4ZxI+AGm4ThDp32jvhk7VqsFrzgjl1yPWbAdenGw7WU3wTpTwKn9G+
 3ju5e4sPJvGnPwjh886LphVgkZi62DHMeudj1Vf7x2AZ2C0o6oRGFyrF9KgS9FVtzRE8
 hhMSMs/wgTJZhIju1pNcRlCHECQpSLx+v+g880RO4IuZVssh+WLK0Q3AoqH36Jh8paFn
 QhqQ==
X-Gm-Message-State: ACgBeo2/Qu4H01dFE7p/MDAFl+F8hR3NQMM0JNIvIt93/L2RwOQtoB5P
 rUxqdxBV6FWudHqX65m9nBXclJaqnbc=
X-Google-Smtp-Source: AA6agR78sjAzo7qqVB0Qb6snEkK9imTsv6ZWJ/6c1bi30NwTVYTuU0ywHBp9dwKSVlkAsDg0FMLUnA==
X-Received: by 2002:a67:d509:0:b0:383:6b4c:3648 with SMTP id
 l9-20020a67d509000000b003836b4c3648mr11441583vsj.15.1660125942160; 
 Wed, 10 Aug 2022 03:05:42 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 2-20020a1f1602000000b0037613541b27sm12277919vkw.39.2022.08.10.03.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 03:05:41 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 00/11] enable pnv-phb user created devices
Date: Wed, 10 Aug 2022 07:05:25 -0300
Message-Id: <20220810100536.473859-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This new version contains a new patch (11) to handle the QOM parenting
of user created root ports. A small change in patch 5 was made as well
based on Frederic's comments.

The series is based on top of the ppc-7.2 branch:

https://gitlab.com/danielhb/qemu/-/tree/ppc-7.2

Changes from v2:
- patch 5: avoid parenting the PHB to NULL
- patch 11 (new):
   - fix QOM parenting of user created root ports
- v2 link: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00505.html

Daniel Henrique Barboza (11):
  ppc/pnv: add phb-id/chip-id PnvPHB3RootBus properties
  ppc/pnv: add phb-id/chip-id PnvPHB4RootBus properties
  ppc/pnv: set root port chassis and slot using Bus properties
  ppc/pnv: add helpers for pnv-phb user devices
  ppc/pnv: turn chip8->phbs[] into a PnvPHB* array
  ppc/pnv: enable user created pnv-phb for powernv8
  ppc/pnv: add PHB4 helpers for user created pnv-phb
  ppc/pnv: enable user created pnv-phb powernv9
  ppc/pnv: change pnv_phb4_get_pec() to also retrieve chip10->pecs
  ppc/pnv: user creatable pnv-phb for powernv10
  ppc/pnv: fix QOM parenting of user creatable root ports

 hw/pci-host/pnv_phb.c          | 178 +++++++++++++++++++++++++++++----
 hw/pci-host/pnv_phb3.c         |  50 +++++++++
 hw/pci-host/pnv_phb4.c         |  51 ++++++++++
 hw/pci-host/pnv_phb4_pec.c     |   6 +-
 hw/ppc/pnv.c                   |  30 +++++-
 include/hw/pci-host/pnv_phb3.h |   9 +-
 include/hw/pci-host/pnv_phb4.h |  10 ++
 include/hw/ppc/pnv.h           |   6 +-
 8 files changed, 312 insertions(+), 28 deletions(-)

-- 
2.36.1


