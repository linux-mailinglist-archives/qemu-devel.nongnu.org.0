Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A4634023F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:41:47 +0100 (CET)
Received: from localhost ([::1]:47432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpA2-000472-Ea
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lMp2v-0003SY-B6
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:34:25 -0400
Received: from mga02.intel.com ([134.134.136.20]:64964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lMp2s-0004z7-MW
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:34:25 -0400
IronPort-SDR: dJUZunRE4s0mKjCSUmNn+vJDYKRtrWEjK7G73WKoi1HXrVuP8uvfa1UwIi59+2IkzGEBcAOB6D
 tcnF6JAEFvTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="176771465"
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="176771465"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 02:34:16 -0700
IronPort-SDR: m+lGBPwA/WHcox6GkjG3FYeU1zFUTZef+EVsO1VMJNlDiaT56V5QS18EgnzA97UqOW122xCrBL
 4M4VzmMbbpYQ==
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="406290700"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 18 Mar 2021 02:34:15 -0700
Date: Thu, 18 Mar 2021 17:22:18 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: The windows guest can't bootup
Message-ID: <20210318092218.GA4275@yangzhon-Virtual>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.20; envelope-from=yang.zhong@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, zhukeqian1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I synced today qemu code, and found the qemu can't bootup the windows guest.
This issue was caused by commit id 39205528 and revert this patch, the windows
guest can bootup.

qemu-system-x86_64: ../accel/kvm/kvm-all.c:690: kvm_log_clear_one_slot: Assertion `(((start | size) % (psize)) == 0)' failed.

I also enabled the vga device in the Linux guest, and same issue was found.

Regards,

Yang

