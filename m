Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FB553990A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 23:52:14 +0200 (CEST)
Received: from localhost ([::1]:57738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw9me-0002qs-Jz
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 17:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9jy-0008Sx-93; Tue, 31 May 2022 17:49:26 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:45583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9jw-0003Jh-Ik; Tue, 31 May 2022 17:49:25 -0400
Received: by mail-oi1-x22c.google.com with SMTP id k11so150863oia.12;
 Tue, 31 May 2022 14:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/oIX429gUahgpWVgwGiKNbKBetgZ3pxdAdECnuDMZGs=;
 b=AhwIv45wphaIdqRMWAkf2TKYFZEwARwHTf22XQETe5yIN2F1s4WBDSyL1z3c45Bu1s
 PbJEjcYpCQzQMG2IM1O/K8VDyZqLF9koLmJL8ZenOeTqaSXt8fh3eSurc9/N+thP82q1
 RuwRO7zg0Wjc/uiglyfVeDRZUjYsHAyhf2NK2HTlTegfSyBaOgnjMyPRv+VHsHiMu3Py
 f611fEXKL4bB7POGD8LHAilBYyCNMDdHgB8xj0Xanwhv/G0R0l30Bli6mIEAEQdmDHKH
 IGwJMbCf/aT10zK8uKI84aWfDOaW+hCBeY/t/N94UMf1GR2MVYhTjrrU179nJA9DPJUG
 IvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/oIX429gUahgpWVgwGiKNbKBetgZ3pxdAdECnuDMZGs=;
 b=gHVIbnaacDDg3xiDvysd54Ff2GP/Qax/sFVroGOguuYwabXC3a2rKOm/0F8eOQmHZ8
 cOuXbWansi3Jlf/XWFHG5v4IOxjjab1WTOMmAHoUfSzYfuuSphj2Wp9D3Mt8PG8QM6lF
 Zk1J31GP9ogcVaUjCcGIpg9JgeclQt87NiBFwIMnqgyCRWh9J1hbpoEofNMMILDOT26D
 1je5CuJkeuJdG5kP7c7LMVCCMxlDhNgm93/i572uRGdJ2ji7klXjFNTJAcmxcgNFqmxj
 NkSl7PUn9KNr0yXx/7nrhIWcL39655uI9AobC5MwAcUjn36W7A2jome1IhDMlyUFSgR5
 avzw==
X-Gm-Message-State: AOAM530IqAn0g6lvZTZtWUWm5G1P0ulJQQg9nNwbCbR3WPotVbjh9bg/
 LzZisSnUn/xqZIBNSbbk/p/41xs8rRjmLA==
X-Google-Smtp-Source: ABdhPJwRrUrtsfODgZHb4wiAW3k3zpAdpUhOCozP1wUDdzuiOGc+lm3QgFjvq0dTCiNz4kdsJ3+r6w==
X-Received: by 2002:a05:6808:15a3:b0:32b:9c85:3434 with SMTP id
 t35-20020a05680815a300b0032b9c853434mr13981772oiw.118.1654033762594; 
 Tue, 31 May 2022 14:49:22 -0700 (PDT)
Received: from balboa.COMFAST ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 pd19-20020a0568701f1300b000f333ac991fsm3476988oab.27.2022.05.31.14.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:49:22 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 00/16] powernv: introduce pnv-phb base/proxy devices
Date: Tue, 31 May 2022 18:49:01 -0300
Message-Id: <20220531214917.31668-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
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

This v2 is considerable different from the first version due to the
review provided by Mark Cave-Ayland.

We're now preserving all PnvPHB3/4/5 implementations already in place.
The PnvPHB device now acts as a base/proxy of the existing PHBs, which
are turned into backends of the base PnvPHB device.

QOM is being more used this time by passing through properties to the
PHB backends from the base device, and by setting the phb->version
via global machine properties in each machine.

The changes made impact both user creatable and default devices, meaning
that now the powernv machines are using the PnvPHB base device in all
circunstances.

The one thing that I didn't change from v1 is the root port revamp. I
didn't find enough reason to do the same thing we did with the PnvPHBs,
given that all that differs them is the reset() callback of
phb4_root_port. This means that patches 14-17 from v1 are still mostly
the same.


Changes from v1:
- lots of changes in patches 1-6 and 7 due to the change of direction
- patch 10 from v1: removed
- PnvPHB.version is now being removed in patch 16
- several other minor changes due to changes in the initial patches
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg01410.html

Daniel Henrique Barboza (16):
  ppc/pnv: add PHB3 bus init helper
  ppc/pnv: add pnv_get_phb3_child()
  ppc/pnv: add PnvPHB base/proxy device
  ppc/pnv: change PnvPHB3 to be a PnvPHB backend
  ppc/pnv: user created pnv-phb for powernv8
  ppc/pnv: add PHB4 bus init helper
  ppc/pnv: change PnvPHB4 to be a PnvPHB backend
  ppc/pnv: user created pnv-phb for powernv9
  ppc/pnv: change pnv_phb4_get_pec() to also retrieve chip10->pecs
  ppc/pnv: user creatable pnv-phb for powernv10
  ppc/pnv: add pnv-phb-root-port device
  ppc/pnv: remove pnv-phb3-root-port
  ppc/pnv: remove pnv-phb4-root-port
  ppc/pnv: remove 'phb_rootport_typename' in pnv_phb_realize()
  ppc/pnv: remove pecc->rp_model
  ppc/pnv: remove PnvPHB4.version

 hw/pci-host/meson.build        |   3 +-
 hw/pci-host/pnv_phb.c          | 219 ++++++++++++++++++++++++++++++++
 hw/pci-host/pnv_phb.h          |  56 ++++++++
 hw/pci-host/pnv_phb3.c         | 144 ++++++++-------------
 hw/pci-host/pnv_phb4.c         | 226 ++++++++++++++-------------------
 hw/pci-host/pnv_phb4_pec.c     |  14 +-
 hw/ppc/pnv.c                   |  78 ++++++++++--
 include/hw/pci-host/pnv_phb3.h |  12 +-
 include/hw/pci-host/pnv_phb4.h |  18 +--
 include/hw/ppc/pnv.h           |   4 +-
 10 files changed, 512 insertions(+), 262 deletions(-)
 create mode 100644 hw/pci-host/pnv_phb.c
 create mode 100644 hw/pci-host/pnv_phb.h

-- 
2.36.1


