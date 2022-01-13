Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6584648DE2B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:38:36 +0100 (CET)
Received: from localhost ([::1]:38508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n85vf-00052s-HG
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:38:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nS-0006Jw-12; Thu, 13 Jan 2022 14:30:06 -0500
Received: from [2607:f8b0:4864:20::32e] (port=35410
 helo=mail-ot1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n85nQ-0004vF-7n; Thu, 13 Jan 2022 14:30:05 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 60-20020a9d0142000000b0059103eb18d4so7490483otu.2; 
 Thu, 13 Jan 2022 11:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3aMG5WCT8tizkG9DNn8ZO9EIQ1NH6gQ0IP+0U0MKu9Y=;
 b=RSLtiYVpyMV3iNaS9nUgelAbmwjLFvwvQE8MPdP7aj6YbbO7/RXp5JeQDuxNJZQJ3q
 wHXtGagTJipWCS9Df6DRXFHL+42fynfltZTKgtfaA1Rh81Js5dKMCp6JgrK8ln61tOoL
 BFF3tPAb4HZPOXW+3qyDHrfpkHZQ/MlGVFPqc4crhpNnzzkPrqu25gUnDtn00HkfSWfU
 QG4KpaWr8/tt45Oy4M20ocfWeQ8ggoAW9JN0hgKkhVflO0nu+lBWZ/aIDnKrlZZpE/t9
 t0QziML897NU7P2H6PSTJTI8qV6Rqt9xnCmKdeBuBcZK7t1zpx7W5VGXg5OP82CxK/B8
 vZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3aMG5WCT8tizkG9DNn8ZO9EIQ1NH6gQ0IP+0U0MKu9Y=;
 b=8L1kDaFBqiqhgA/sjMPp6OcF139hBeziS8lFVz3J3yPlNv1AhQSYJNEOGYjSn6Zk7b
 HWJETrdFapTl51dS1yLt2PuIFynkhOK5mmlP4TqKnRUrjBV+XLIZujKH+u1ALsGrrE5+
 dP7LRvfnp2WKYW+x2kN6/5oGWa4BEbrcnucnDLU1JUNca0KCD/2S+mLQmlJ9tH7x9tOw
 RC+pyY4DTp/sLzf9e7CmOdpxQ4R+vCqhI1pTPFqUGK37obnKAThPwxZwTVpDcDmTteS6
 di2h8zb0jQoL9GbsMQwO25o5Dfwl1P3UpCyD1iuToy1zdTFEZ3Ksy1CxAqUqNQSejUGD
 ICJw==
X-Gm-Message-State: AOAM531/neQwSmN1Fn+qyZIPHjnihuFglaZJPJ109f1X/Fka5GITpg8n
 WtZFX0awZRcQeH52dAce5+7JXxdcjECiTqrq
X-Google-Smtp-Source: ABdhPJyRDBOtTBgllGT0DedB0tXKZaU60sIdeJY8ZtAnw4YKxP7Q08O2AN4gMfZWBdwFPAOFABcTMg==
X-Received: by 2002:a9d:6a4d:: with SMTP id h13mr4220261otn.95.1642102201923; 
 Thu, 13 Jan 2022 11:30:01 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id 90sm743409otn.59.2022.01.13.11.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 11:30:01 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/17] remove PnvPhb4PecStack from Powernv9
Date: Thu, 13 Jan 2022 16:29:35 -0300
Message-Id: <20220113192952.911188-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

After all the done enabling pnv-phb4 user devices, it became clear that
the stack object is just a container of the PHB and its resources than
something that needs to be maintained by its own. Removing the
PnvPhb4PecStack object promotes a simpler code where we're dealing only
with PECs and PHB4s.

One thing that isn't handled in this series is the nested regs names.
There are 30+ nested per-stack registers with names such as
'PEC_NEST_STK*' or 'PEC_PCI_STK*' that are left as is. Renaming them to
remove the 'STK' reference can be done in a follow up when we're
satisfied with what it is presented here.

No functional change is intended with this series. The series is based
on top of current master (at f8d75e10d3),

Daniel Henrique Barboza (17):
  ppc/pnv: use PHB4 obj in pnv_pec_stk_pci_xscom_ops
  ppc/pnv: move PCI registers to PnvPHB4
  ppc/pnv: move phbbar to PnvPHB4
  ppc/pnv: move intbar to PnvPHB4
  ppc/pnv: change pnv_phb4_update_regions() to use PnvPHB4
  ppc/pnv: move mmbar0/mmbar1 and friends to PnvPHB4
  ppc/pnv: move nest_regs[] to PnvPHB4
  ppc/pnv: change pnv_pec_stk_update_map() to use PnvPHB4
  ppc/pnv: move nest_regs_mr to PnvPHB4
  ppc/pnv: move phb_regs_mr to PnvPHB4
  ppc/pnv: introduce PnvPHB4 'phb_number' property
  ppc/pnv: introduce PnvPHB4 'pec' property
  ppc/pnv: remove stack pointer from PnvPHB4
  ppc/pnv: move default_phb_realize() to pec_realize()
  ppc/pnv: convert pec->stacks[] into pec->phbs[]
  ppc/pnv: remove PnvPhb4PecStack object
  ppc/pnv: rename pnv_pec_stk_update_map()

 hw/pci-host/pnv_phb4.c         | 271 ++++++++++++++++-----------------
 hw/pci-host/pnv_phb4_pec.c     | 122 ++++-----------
 include/hw/pci-host/pnv_phb4.h |  84 +++++-----
 3 files changed, 200 insertions(+), 277 deletions(-)

-- 
2.33.1


