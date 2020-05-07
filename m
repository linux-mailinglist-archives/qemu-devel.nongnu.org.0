Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id E048B1C94DB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 17:21:06 +0200 (CEST)
Received: from localhost ([::1]:37832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWiKf-0001DT-Sc
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 11:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWiI8-0006pU-1Z
 for qemu-devel@nongnu.org; Thu, 07 May 2020 11:18:29 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWiI5-0002Zf-Ni
 for qemu-devel@nongnu.org; Thu, 07 May 2020 11:18:27 -0400
Received: by mail-wr1-x42b.google.com with SMTP id k1so6869330wrx.4
 for <qemu-devel@nongnu.org>; Thu, 07 May 2020 08:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F4gnPhex3QJB960Uti/t2pBixGTOg24fPQC0ctvalqc=;
 b=vE9RES/bisG4aZV37Iv8G8td8FS5eR5kCPEJlWBMRHtrN6vQ6hpdHQusWC/clr7INL
 1GkHoe2fg1tPQCRmdbZE1TLgSblSWTH3dSNF7EyWGp9VmX/LY4MHLsOHrwjFB9LDBmNN
 GmNkFc8sa2J624JFEcj+9PFwekvkGWTYqzfMi81jJYG3kFlfNrX5Q/ZFv098J2xSNFYy
 ap8hzj4QD3Kcb8cejwUWu/02dim1D2P5cEoXweT6idE81dB7/DARWoMHuKvuT0KyapG9
 MgJ+8X8l6O+VvymiopNETrmzOc8M3e2DEBLCP3uED/MXXkclXVq9QUmotxMUxtEcG2Vd
 5wGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F4gnPhex3QJB960Uti/t2pBixGTOg24fPQC0ctvalqc=;
 b=JtlhUk7vOSo2NcONVNfE6KvGdYtwVPE6hJqBaTuYfPIvaSpjflEX8nh3HZhIOsMAsX
 yCyLNQd4HuaATjOiuCsiWe2mWRxVds34pdGBG13WbzBFRkfvewkcKcUKxGmq/pnKu5oD
 yECLUoynzXgwyCVY1NV+PWWEhEWR6P+uhPO6MMhjvLFmwOYyYsIsnC07Ad88uzR0uQbB
 BP5W/DgescXjnDRqdn+Vzjzjt9i5r4DVu2L53M363P3mIEiwL8gzrpqkSHNy5Y7xlDBD
 Q4mggFuTUeQ5MEkVdkdJtMT1fgBiEq5Fx7a8u5ue7T99nFpm7PououdkKu6JzvXVP+Qf
 DiSA==
X-Gm-Message-State: AGi0PuZ1WF1dM8NgKCnTvyFuf2TM/de0WsA8C6ogoGtcT+LI90ctECT6
 gzJDlhuH5G2AvrYE2t8Jkq9Xfw==
X-Google-Smtp-Source: APiQypIxYBiv2fS2ptmPxCOEMEkkwy94Sxrn4B/xl7YTNUExQkiDqrs6qdA1BYo8xqpQjFrH+f58Xw==
X-Received: by 2002:adf:fec9:: with SMTP id q9mr15482168wrs.181.1588864702656; 
 Thu, 07 May 2020 08:18:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q74sm961246wme.14.2020.05.07.08.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:18:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/5] docs/system: Document some arm board models
Date: Thu,  7 May 2020 16:18:14 +0100
Message-Id: <20200507151819.28444-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds (minimal) documentation of these Arm board models:

vexpress-a15         ARM Versatile Express for Cortex-A15
vexpress-a9          ARM Versatile Express for Cortex-A9
mps2-an385           ARM MPS2 with AN385 FPGA image for Cortex-M35
mps2-an505           ARM MPS2 with AN505 FPGA image for Cortex-M33
mps2-an511           ARM MPS2 with AN511 DesignStart FPGA image for Cortex-M3
mps2-an521           ARM MPS2 with AN521 FPGA image for dual Cortex-M33
musca-a              ARM Musca-A board (dual Cortex-M33)
musca-b1             ARM Musca-B1 board (dual Cortex-M33)

to the system emulator manual.

Patches 1 and 2 are minor tidyup of the board table-of-contents
before we start adding new entries with patches 3-5.

I'm aiming more for "at least note that the boards exist" than
"fully comprehensive" documentation here -- there are still another
37 Arm board models with no documentation at all...

thanks
-- PMM

Peter Maydell (5):
  docs/system: Add 'Arm' to the Integrator/CP document title
  docs/system: Sort Arm board index into alphabetical order
  docs/system: Document Arm Versatile Express boards
  docs/system: Document the various MPS2 models
  docs/system: Document Musca boards

 docs/system/arm/integratorcp.rst |  4 +--
 docs/system/arm/mps2.rst         | 29 +++++++++++++++
 docs/system/arm/musca.rst        | 31 +++++++++++++++++
 docs/system/arm/vexpress.rst     | 60 ++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst       | 15 ++++----
 MAINTAINERS                      |  3 ++
 6 files changed, 134 insertions(+), 8 deletions(-)
 create mode 100644 docs/system/arm/mps2.rst
 create mode 100644 docs/system/arm/musca.rst
 create mode 100644 docs/system/arm/vexpress.rst

-- 
2.20.1


