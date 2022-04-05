Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E2F4F3DBC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 22:35:54 +0200 (CEST)
Received: from localhost ([::1]:51974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbpu5-00033D-AS
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 16:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nbpsn-000208-Ty; Tue, 05 Apr 2022 16:34:34 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:42675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nbpsm-0006qC-Fp; Tue, 05 Apr 2022 16:34:33 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-de3ca1efbaso659541fac.9; 
 Tue, 05 Apr 2022 13:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2jMKnPBPugQHjysmPi7lP3JyjjJfKRQXtU4J6yVPL+M=;
 b=PMhupQ6w0KVozTsS8qVqtdpjeB5V1xTmCo1a+qi/ta4UOePRr5PCGw7Zh4Ok93qOgX
 q64qSzDlI47l9xRefRkcw/Ob369P8DdDxYtXXXavxes3TwwS3PpiIfwhMJN2gGtfi3Ot
 YyE2JOvF6tnpw5/j+msgRowHk7BhCfu05MHtKkgd31USpuRPduIQKlko5312Z6ljRoG6
 PxaONbXfhKgGPaTxmgjy47y8bSKaU73o8WtT+h2FQ1VCl02mSa3rfKWxaN13+fl22Ivd
 e60clVZF9sL87b/VGqNRsyAWxBTEandHSKHZTXlb40AhL5S39hlFr7uS/zvet9H3oTaG
 acpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2jMKnPBPugQHjysmPi7lP3JyjjJfKRQXtU4J6yVPL+M=;
 b=IAZNSCEXGpDBfdvDptUAjBysnda7bIvp1eeUXKTK+ee6FHHrmDfq296nxYnNTzJ/kV
 SkzxUwbFx3M/ObOF3J1EEXsz25TovB7Ds6tVy41kOCAhtXwL4FHf6HiQYuxZC4ed3p92
 xhjtk76f88OX3VTkqiKFajQn9fwc6YFV3XqZtrCg2txlxhT4JRAgD+HIndiyv4DjTWXv
 H+K6w+W6g3YrnGAsNlwIjLYC/FJG6C4ielaQhd3ne4IKDy2exv16z1N/hGc0vtIEiYXx
 r+Ogd4wy8N0ySN3F2WkXqdeMJtS290JQzKA129UNg4/ZnitAgmyP0wF1Wlz91gcg79V2
 Cg5g==
X-Gm-Message-State: AOAM533Xj2zzGxYhjRMvPQOPkngPrbUTgPEZeTrmZ40YXnwMCnpTS9hn
 6Ky+tlYq2c4XZzWWzdpubQ+BrPJRg4k=
X-Google-Smtp-Source: ABdhPJwXoVbZSaQWtYgl7gk8ozdhVKncyPWwNiWdL97od/iX3F0M2u+vaxQwLZZZPpiGOWrGMd7fQA==
X-Received: by 2002:a05:6871:78b:b0:d4:2636:b26 with SMTP id
 o11-20020a056871078b00b000d426360b26mr2399323oap.14.1649190870668; 
 Tue, 05 Apr 2022 13:34:30 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:7ee3:afd9:f010:3a9:fd23])
 by smtp.gmail.com with ESMTPSA id
 v33-20020a056870b52100b000e1efaa5fecsm3319553oap.19.2022.04.05.13.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 13:34:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 0/1] Coverity fixes in hw/ppc/spapr_nvdimm.c
Date: Tue,  5 Apr 2022 17:34:15 -0300
Message-Id: <20220405203416.75952-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is a simple patch to fix 2 Coverity issues in
hw/ppc/spapr_nvdimm.c. Aiming it to 7.1 because it's not critical enough
for 7.0.

Daniel Henrique Barboza (1):
  hw/ppc: check if spapr_drc_index() returns NULL in spapr_nvdimm.c

 hw/ppc/spapr_nvdimm.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

-- 
2.35.1


