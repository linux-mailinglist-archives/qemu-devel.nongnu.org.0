Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D960C55ABCE
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 19:47:14 +0200 (CEST)
Received: from localhost ([::1]:45852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o59sH-0003Fx-W1
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 13:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@kangae.exyr.org>)
 id 1o58gC-0003ti-4E
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 12:30:51 -0400
Received: from r0-2.smtpout1.paris1.alwaysdata.com
 ([2a00:b6e0:1:40:1:0:10:6]:44403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@kangae.exyr.org>)
 id 1o58gA-00023P-2T
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 12:30:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=alwaysdata.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pug4NUdld9aQfRTVwsu1Dt3V4LuLDZxnNBeT0As6ToI=; b=aaYoEKLRBZfVkJ07xR+jLk+UmU
 fTgelP6set3ste3jWBSlbAPGzfsPJFj1m6VItpf1bsjJHK8jBViU10Fh5G/481WYxklfa/xTGkz2e
 7kNCBdlNfwGbEkowNra6MhNW3/Mu+v1zgW26BuV261yL6cIvfZjJ6U8KEybk7cIuvbAk=;
Received: from [2a01:e34:ecb8:5a0:f192:bd1d:5684:24ee] (helo=kangae.exyr.org)
 by smtpout1.paris1.alwaysdata.com with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <simon@kangae.exyr.org>)
 id 1o58RS-0006mx-P3; Sat, 25 Jun 2022 18:15:26 +0200
Received: from simon by kangae.exyr.org with local (Exim 4.95)
 (envelope-from <simon@kangae.exyr.org>) id 1o58RS-005AmT-DM;
 Sat, 25 Jun 2022 18:15:26 +0200
From: Simon Sapin <simon.sapin@exyr.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Simon Sapin <simon.sapin@exyr.org>
Subject: [PATCH 1/2] Rename docs/specs/fw_cfg.txt to .rst
Date: Sat, 25 Jun 2022 18:14:54 +0200
Message-Id: <20220625161455.1232954-1-simon.sapin@exyr.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-alwaysdata-ID: 127134824
Received-SPF: none client-ip=2a00:b6e0:1:40:1:0:10:6;
 envelope-from=simon@kangae.exyr.org; helo=r0-2.smtpout1.paris1.alwaysdata.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NO_DNS_FOR_FROM=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 25 Jun 2022 13:44:35 -0400
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

This is a separate commit in order to make reviewing the next one easier.

Signed-off-by: Simon Sapin <simon.sapin@exyr.org>
---
 docs/specs/{fw_cfg.txt => fw_cfg.rst} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename docs/specs/{fw_cfg.txt => fw_cfg.rst} (100%)

diff --git docs/specs/fw_cfg.txt docs/specs/fw_cfg.rst
similarity index 100%
rename from docs/specs/fw_cfg.txt
rename to docs/specs/fw_cfg.rst
-- 
2.36.1


