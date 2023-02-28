Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0416A5ABF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 15:20:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX0pt-0001VQ-VU; Tue, 28 Feb 2023 09:20:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuzongyong@linux.alibaba.com>)
 id 1pWwlp-0007Sd-SV
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 04:59:41 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuzongyong@linux.alibaba.com>)
 id 1pWwln-0000dF-0q
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 04:59:41 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R351e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=wuzongyong@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
 TI=SMTPD_---0VcixG.G_1677578061; 
Received: from localhost(mailfrom:wuzongyong@linux.alibaba.com
 fp:SMTPD_---0VcixG.G_1677578061) by smtp.aliyun-inc.com;
 Tue, 28 Feb 2023 17:54:21 +0800
Date: Tue, 28 Feb 2023 17:54:20 +0800
From: Wu Zongyong <wuzongyong@linux.alibaba.com>
To: brijesh.singh@amd.com
Cc: qemu-devel@nongnu.org, wutu.xq2@linux.alibaba.com
Subject: SEV: why cbitpos is needed instead of just get it by cpuid?
Message-ID: <20230228095420.GA15490@L-PF27918B-1352.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=115.124.30.131;
 envelope-from=wuzongyong@linux.alibaba.com;
 helo=out30-131.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 28 Feb 2023 09:19:41 -0500
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

The @option{cbitpos} is defined with sev-guest object in qemu. And I'm
wondering why this option is needed since we can get the C-bit position
by cpuid.
Besides, the only usecase I found in source code is to check if the
value provided by user is consistent with the return value of cpuid in
function sev_guest_init().
Maybe we can delete this option?

Thanks


