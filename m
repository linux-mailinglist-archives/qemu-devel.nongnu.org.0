Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AB76CB52B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:54:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph0ON-0003AX-4g; Mon, 27 Mar 2023 23:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuzongyong@linux.alibaba.com>)
 id 1ph0OJ-0003AA-T7
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:52:59 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuzongyong@linux.alibaba.com>)
 id 1ph0OH-0002SJ-Pe
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:52:59 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=wuzongyong@linux.alibaba.com; NM=1; PH=DS; RN=1; SR=0;
 TI=SMTPD_---0VerY9ML_1679975565; 
Received: from localhost(mailfrom:wuzongyong@linux.alibaba.com
 fp:SMTPD_---0VerY9ML_1679975565) by smtp.aliyun-inc.com;
 Tue, 28 Mar 2023 11:52:45 +0800
Date: Tue, 28 Mar 2023 11:52:45 +0800
From: Wu Zongyong <wuzongyong@linux.alibaba.com>
To: qemu-devel@nongnu.org
Subject: Question: why no VMEXIT occur when I read/write emulated pci
 devices's bar by mmap inside guest userspace?
Message-ID: <20230328035245.GA4486@L-PF27918B-1352.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=115.124.30.130;
 envelope-from=wuzongyong@linux.alibaba.com;
 helo=out30-130.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Reply-To: Wu Zongyong <wuzongyong@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

I create a VM with a virtual pci device "-net nic,model=e1000", and I
attemped to read/write the bar0 of the virtual nic inside the guest
userspace by mmap the "/sys/bus/pci/devices/xxxx:xx:xx.x/resource0" to 
the userspace.
What I expected is a VMEXIT should occur when I read/write the bar but I
didn't see any VMEXIT event.
So I'm confused with this and any detailed analysis about mmio handle
routine would be appreciated.

Thanks


