Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDCF1E1C48
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 09:28:01 +0200 (CEST)
Received: from localhost ([::1]:48834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdU0G-0007Fo-GC
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 03:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1jdTzT-0006pR-SV
 for qemu-devel@nongnu.org; Tue, 26 May 2020 03:27:11 -0400
Received: from mga14.intel.com ([192.55.52.115]:27042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1jdTzR-0005zm-Vf
 for qemu-devel@nongnu.org; Tue, 26 May 2020 03:27:11 -0400
IronPort-SDR: OkKLYHjvPdJMkf45TlrQ0ZtpiI8IaRD1rw1CD5dgto9eEyg+XIbr1/d3PhgpaolSxiPjlMvWt3
 WFF0LB9w68iw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 00:27:00 -0700
IronPort-SDR: ev2oP/8eDsx2DkAl/Ag7p1K5niRfIIpcu3uTdXAtfMm0XjhWMZuHkrKhT810QNXlD/YvdcND+4
 ubkyTz/ALrKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,436,1583222400"; d="scan'208";a="284340403"
Received: from yangzhon-virtual.bj.intel.com (HELO localhost)
 ([10.238.144.101])
 by orsmga002.jf.intel.com with ESMTP; 26 May 2020 00:26:58 -0700
Date: Tue, 26 May 2020 15:18:26 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: About the PVH in Seabios
Message-ID: <20200526071826.GA28145@yangzhon-Virtual>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 03:27:00
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello all,

The current PVH has been implemented in Qemu and Qboot/uefi, i am not
familiar with the PVH implementation history, and found there is no
PVH support in Seabios, my question is do we have plan to support
PVH in Seabios? thanks.

Regards,

Yang

