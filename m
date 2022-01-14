Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB30048EFA8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 19:09:57 +0100 (CET)
Received: from localhost ([::1]:35910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8R1R-0007r0-1V
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 13:09:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8Qz6-0005PW-Cl; Fri, 14 Jan 2022 13:07:32 -0500
Received: from [2607:f8b0:4864:20::229] (port=41501
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8Qz4-0000MY-A5; Fri, 14 Jan 2022 13:07:32 -0500
Received: by mail-oi1-x229.google.com with SMTP id q186so13234368oih.8;
 Fri, 14 Jan 2022 10:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WWojEUAAmpykUVK1GzIYTatA6VIQP1qtXZcASjPRTho=;
 b=GP9edyN4PaCx2drNUdHjKlgH16/a0IS95kjlNKcEd96KhWknsCgEgZAkv4nBWZPYkO
 Xp9MB066s3l1mF2PowHWbEQU5+cvWJ+ST09+UQHPi3vmqEw/ub0vIal2x2sIybSk/lCA
 H2yA8tw9gjd+d2Y/88FZZ/oZ7r54wMfW+M+DJSD2LFpRqSX7r9FIPNO3ER+OMme3wt9j
 I3bASyvFc6K/Ia+ziTk0ppY12ycM7mYneBb0UBGJLdMpHboVItzaJ3kvPDPic0uIIpQ4
 moZnXdz9qIKMPW5JAZJ+HnMtmBNtpqm1KW/FOPPnI6tDpkAqtxNRpPJSI4OdRxyodPu2
 7wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WWojEUAAmpykUVK1GzIYTatA6VIQP1qtXZcASjPRTho=;
 b=cKUVB47pA8T/eOPLFDCYpshnFg17/6fNHMyeIf+EIQ+aLWWq0/uaP5YKnm6IqiIB6Z
 i9WyXe0AATsiUHRQ1Q3g19dzSj8kd7BD7KG8bgGFaZ/krfweQR/Bi1NxKbwSrQvOXNG4
 qaa2aThbQWienl7EcS/aUKGpytpdN1xAmQHEWbfti6oADLL4SVOmzRyU8RNanTC2s9Ea
 qNb/dPPdfg1fIJdSeqmNNwbvX/4ibGLQReopqOAkfYOdslChZzFiCbjWs6cjkW7iT12S
 cRfUgQY4+sPQXhuFAdVg7zt53yyTSLmkeCiG6e40h54G2W4qGbX1dNaV4x0GGFJCukJy
 qpPQ==
X-Gm-Message-State: AOAM530ouEUCc+ab88UkAJFYA5Ek1Tioh7bB39jNQ/kpyxZ4Tu+q8jSY
 Hhrq2ghnNzy2j/7HVY8QFY1rZHd7ACYzzyj+
X-Google-Smtp-Source: ABdhPJzAaZcIkIM1Xu4d5OpM/jN5ziK0ri6VqSrmNJMDfTO6jwHCrvtFUzyL709c3M7Q1tQ3kSVl6w==
X-Received: by 2002:aca:aa03:: with SMTP id t3mr3003023oie.167.1642183648714; 
 Fri, 14 Jan 2022 10:07:28 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id e17sm1353584otr.13.2022.01.14.10.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 10:07:28 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] remove PnvPhb4PecStack from Powernv9
Date: Fri, 14 Jan 2022 15:07:11 -0300
Message-Id: <20220114180719.52117-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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

This second version contains improvements suggested by Cedric in the
v1 review.

Patches 1-10 from v1 are already accepted and aren't included in this
v2.


Changes from v1:
- v1 patches 1-10: already accepted, not included in the v2
- 'stack-stack_no' use is eliminated. We're now deriving stack_no from
phb->phb_id
- no longer use phb->phb_number
- no longer use pec->phbs[]
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg03000.html

Daniel Henrique Barboza (8):
  ppc/pnv: introduce PnvPHB4 'pec' property
  ppc/pnv: reduce stack->stack_no usage
  ppc/pnv: remove stack pointer from PnvPHB4
  ppc/pnv: move default_phb_realize() to pec_realize()
  ppc/pnv: remove PnvPhb4PecStack::stack_no
  ppc/pnv: make PECs create and realize PHB4s
  ppc/pnv: remove PnvPhb4PecStack object
  ppc/pnv: rename pnv_pec_stk_update_map()

 hw/pci-host/pnv_phb4.c         |  88 ++++++++++++++----------
 hw/pci-host/pnv_phb4_pec.c     | 118 ++++++++-------------------------
 include/hw/pci-host/pnv_phb4.h |  33 ++-------
 3 files changed, 86 insertions(+), 153 deletions(-)

-- 
2.33.1


