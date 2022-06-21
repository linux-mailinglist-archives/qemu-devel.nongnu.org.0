Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6345B5538FA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 19:36:45 +0200 (CEST)
Received: from localhost ([::1]:37966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3hnv-0005cz-St
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 13:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3hm1-0002mo-0X; Tue, 21 Jun 2022 13:34:45 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:44692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3hlz-0002KT-21; Tue, 21 Jun 2022 13:34:44 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-101e1a33fe3so9050887fac.11; 
 Tue, 21 Jun 2022 10:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+nUzV0Wr+WMrykVKO11BZL7tn6rN8v6YPX4AhMY8WYM=;
 b=pH9jYo4+fMoSao5ybT+m6psNYzrVhl2B69iWKpw3+xrXwJID7LjXASkFHFcyAJ1Fg1
 /oS9S/keO/dCModk7tEBD1VBMfo6j4CfbYKSR3TKdPOg8Yfotumw+IbXPDyfWBUO/+ex
 uzLixLTqFs6ZZ1Og3tXJjsg7IBQ54Yl9mpRR2g5sIa0+Mcst8k/RnB0OOLtfHJg/u41c
 p9ei65I+H6FIZ4FHhARpoIGKdcbjJyQ/8DEXRSVGPnsNLPfbzuDVZ0OAujabdKxzPH4S
 U4pAAcuu6fTrRgTB/6h+Ad+aZpO72/9dFHmPJ77nD90ZxIgZ/KkGAyH76m0QA/n04T1/
 0EZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+nUzV0Wr+WMrykVKO11BZL7tn6rN8v6YPX4AhMY8WYM=;
 b=isWkR59GQtVzJoyX8MUc2qatN/LvPS7Iztk2bcDZjvCJ0+lzHrItQbaTOziUsSyg+z
 5ibUbkQuxVhyiKb9sJ+lygmepH1PkSmFNEf1tKFg7kv2+TX0K+JfayNq3O/URlH1nkoM
 vKAM3ntEnEJZhaxwTVfdYsVml+y6grK0CC2zKslzyJMbN3sH1sR/3YrTb0bQAQj5CfeF
 8DCcPgi76sdzoTDvLPIzg5/e4wC1JYEP2eKUCftzgFsUbhrYuuQLFA07z5bBbprstAIz
 nt/j0MlC8GEfidbdXuRfkRG2POoo42+fMqBuZfx46Wm53IUt4LxRv3A9zLni/myTFbeX
 KLkQ==
X-Gm-Message-State: AJIora+ejJsdKCdOKA7gGq1SSRiPZ90A5pkGvwCKwckozCNRtYOBzTDN
 Gu5ycPt+QOPMecyOLfaMXUN3fWZQl3Uk/Q==
X-Google-Smtp-Source: AGRyM1sp5DqMHx+xBpwMbdt1rAzeRKTNVhM/QQElLfoS/iFf+l60ipjLubdI4FC7uV4k1mtL9mnuVQ==
X-Received: by 2002:a05:6870:32d5:b0:101:1935:f1d1 with SMTP id
 r21-20020a05687032d500b001011935f1d1mr16069464oac.111.1655832881342; 
 Tue, 21 Jun 2022 10:34:41 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a056870385600b0010200e2828fsm2886556oal.30.2022.06.21.10.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 10:34:40 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 0/8] pnv-phb related cleanups
Date: Tue, 21 Jun 2022 14:34:28 -0300
Message-Id: <20220621173436.165912-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
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

This version present changes in patch 03. We're now setting chassis and
slot in pnv_phb_attach_root_port(), avoiding all the hassle of having to
access the PHB object via bus->qbus.parent inside root_port_realize().

changes from v2:
- patch 03:
  - set chassis and slot outside of root_port_realize()
- former patch 04 ("use dev instead of pci->qdev in root_port_realize()"):
  - dropped due to changes in patch 03
- v2 link: https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg03177.html

Daniel Henrique Barboza (8):
  ppc/pnv: move root port attach to pnv_phb4_realize()
  ppc/pnv: attach phb3/phb4 root ports in QOM tree
  ppc/pnv: assign pnv-phb-root-port chassis/slot earlier
  ppc/pnv: make pnv_ics_get() use the chip8->phbs[] array
  ppc/pnv: make pnv_ics_resend() use chip8->phbs[]
  ppc/pnv: make pnv_chip_power8_pic_print_info() use chip8->phbs[]
  ppc/pnv: remove 'INTERFACE_PCIE_DEVICE' from phb3 root bus
  ppc/pnv: remove 'INTERFACE_PCIE_DEVICE' from phb4 root bus

 hw/pci-host/pnv_phb3.c     |  22 +-------
 hw/pci-host/pnv_phb4.c     |  24 ++-------
 hw/pci-host/pnv_phb4_pec.c |   3 --
 hw/ppc/pnv.c               | 102 ++++++++++++++++---------------------
 include/hw/ppc/pnv.h       |   3 +-
 5 files changed, 54 insertions(+), 100 deletions(-)

-- 
2.36.1


