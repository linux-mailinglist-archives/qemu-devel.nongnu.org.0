Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E823DD19E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 10:01:27 +0200 (CEST)
Received: from localhost ([::1]:58548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mASt2-0004dK-Pk
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 04:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.y.sun@linux.intel.com>)
 id 1mASrr-0003ww-6H
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 04:00:11 -0400
Received: from mga17.intel.com ([192.55.52.151]:32602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.y.sun@linux.intel.com>)
 id 1mASrp-0001np-0q
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 04:00:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193690364"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="193690364"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 00:59:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="666478807"
Received: from yisun1-ubuntu.bj.intel.com (HELO yi.y.sun) ([10.238.156.104])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 02 Aug 2021 00:59:41 -0700
Date: Mon, 2 Aug 2021 15:53:49 +0800
From: Yi Sun <yi.y.sun@linux.intel.com>
To: jianjay.zhou@huawei.com
Subject: Question about delaying dirty log stop to next vm_start
Message-ID: <20210802075349.GA2565@yi.y.sun>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=yi.y.sun@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, yi.l.liu@intel.com, sanjay.k.kumar@intel.com,
 qemu-devel@nongnu.org, yi.y.sun@linux.intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Jay,

We are testing some live migration cases recently. We found your below
patch delays the dirty log stop to the next vm_start.

commit 1931076077254a2886daa7c830c7838ebd1f81ef
Author: Jay Zhou <jianjay.zhou@huawei.com>
Date:   Fri Jul 28 18:28:53 2017 +0800

    migration: optimize the downtime

We understand this commit can optimize the downtime. But we observed
that the dirty log stop cannot be executed if user inputs "quit" in qemu
monitor after migration completes. Have you considered such case before?
Any suggestion? Thanks!

BRs,
Yi Sun

