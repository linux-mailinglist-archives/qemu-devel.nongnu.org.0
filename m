Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418CC35FC7E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 22:21:08 +0200 (CEST)
Received: from localhost ([::1]:55758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWm0Y-0006IK-Jc
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 16:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jose.carlos.venegas.munoz@intel.com>)
 id 1lWlyt-0005Vh-Is
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:19:23 -0400
Received: from mga17.intel.com ([192.55.52.151]:11164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jose.carlos.venegas.munoz@intel.com>)
 id 1lWlyq-0005Ir-V7
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:19:23 -0400
IronPort-SDR: xYhQFlmP6sjZo45aoEGnvzgIXorpRdNiGXeP9+nFb2QeA0IifF7II360P59+YkvOod2ZP7sDDH
 g75x5hfNO+WA==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="174833152"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="174833152"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 13:19:16 -0700
IronPort-SDR: EiQ8sRM+V5PZ+gXsD2IYPthyghqad3gWpFl59Zsqbrz7fQUidcM9HrxWkI6GbLYs1JVgYZd+Ts
 1nEdMUoxAl7w==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="424890269"
Received: from kata-01.gv.intel.com (HELO jcvenega-mobl.gv.intel.com)
 ([10.219.105.42])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 13:19:14 -0700
From: Carlos Venegas <jose.carlos.venegas.munoz@intel.com>
To: virtio-fs@redhat.com
Subject: [PATCH 0/2] virtiofsd: Enable xattr if xattrmap is used
Date: Wed, 14 Apr 2021 20:12:05 +0000
Message-Id: <20210414201207.3612432-1-jose.carlos.venegas.munoz@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=jose.carlos.venegas.munoz@intel.com; helo=mga17.intel.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) AC_FROM_MANY_DOTS=2.999, BAYES_00=-1.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Using xattrmap for Kata Containers we found that xattr is should be used
or xattrmap wont work.  These patches enable xattr when -o xattrmap is
used. Also, they add help for the xattrmap  option on `virtiofsd --help` output.

Carlos Venegas (2):
  virtiofsd: Allow use "-o xattrmap" without "-o xattr"
  virtiofsd: Add help for -o xattr-mapping

 tools/virtiofsd/helper.c         | 3 +++
 tools/virtiofsd/passthrough_ll.c | 1 +
 2 files changed, 4 insertions(+)

-- 
2.25.1


