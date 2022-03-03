Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FBE4CBFD5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 15:17:44 +0100 (CET)
Received: from localhost ([::1]:36102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPmH1-0008VQ-MY
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 09:17:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <2e2d46a402560f155de322d95789ba107d728885@lizzy.crudebyte.com>)
 id 1nPmEN-0005Ni-7n
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:14:59 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:51625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <2e2d46a402560f155de322d95789ba107d728885@lizzy.crudebyte.com>)
 id 1nPmEL-0005QX-TH
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:14:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=9hPFswNuh4DPwLEoA5ZjD+sZXOfFg5fvAf0WtCD1JF4=; b=HTKhB
 EYbKg1QoAU4VRoheKzkEaBet2OHKy9HQpoanctDqyaf7Ea1CPDWbDCjGosY4hoT2Rp2GEkBndlxj0
 NSj7SnFMiWVqlbP6UmWReKjQ4nwi2AW2jsjixXPU/7dsYMljE/oI6lta+ho7rOXE/ARCIbufFJjo5
 XB3d0lbOfd0GxfZUFtwxq6qX5wfZP7q2cHPBSM5VfBqm6bFuZn8D75N1Wrty0zdR/98UBz5jIoCqY
 p/E9YzfzNaM9SGQJchaJjhdlzp32BxPv4ToKKnbLqW4Y8kkwV0INOlvUeMHiPoEKWf81d+J3tyxO0
 icNx53ZdZansUj5/xWegq6sEYVH5w==;
Message-Id: <cover.1646314856.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 3 Mar 2022 14:40:56 +0100
Subject: [PATCH 0/6] 9pfs: convert Doxygen -> kerneldoc format
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=2e2d46a402560f155de322d95789ba107d728885@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patch set converts occurrences of API doc comments from Doxygen format
into kerneldoc format. No behaviour change whatsoever.

Christian Schoenebeck (6):
  9pfs/9p.h: convert Doxygen -> kerneldoc format
  9pfs/codir.c: convert Doxygen -> kerneldoc format
  9pfs/9p.c: convert Doxygen -> kerneldoc format
  9pfs/9p-util.h: convert Doxygen -> kerneldoc format
  9pfs/coth.h: drop Doxygen format on v9fs_co_run_in_worker()
  fsdev/p9array.h: convert Doxygen -> kerneldoc format

 fsdev/p9array.h   | 38 ++++++++++++++++-------------
 hw/9pfs/9p-util.h | 10 ++++----
 hw/9pfs/9p.c      | 62 ++++++++++++++++++++++++++---------------------
 hw/9pfs/9p.h      | 12 ++++-----
 hw/9pfs/codir.c   | 30 +++++++++++------------
 hw/9pfs/coth.h    |  4 +--
 6 files changed, 84 insertions(+), 72 deletions(-)

-- 
2.30.2


