Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E6768D632
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 13:11:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMof-0007rW-1q; Tue, 07 Feb 2023 07:11:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pPMoY-0007c9-Fy
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:11:10 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pPMoW-0004Xs-OV
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:11:10 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id CC64F600C9;
 Tue,  7 Feb 2023 15:11:02 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:218::1:e] (unknown [2a02:6b8:b081:218::1:e])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 2BbeeC1QQGk1-fvNdXYQB; Tue, 07 Feb 2023 15:11:02 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675771862; bh=/IuBs05ecVy6ICOB4bvgg5iy580XigprbGH5x73aLts=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=zIOZdX1IEQVGfAotsM8+2aNnzRcKrlmNtuYT5KZO579uSZ26IOHFhz/p7cvPHsp3w
 Z6rl++YO13oMLyeV8WZzRYj0p7s6W712hdwQKHomEGPosHPXn1aAJS1rZYk5cNTeQC
 jZNBJDn3I7tofhzGTGQZ65+mD5KoBXer5+a72Jqk=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <1e45380c-04ef-6291-6879-da89e50340b9@yandex-team.ru>
Date: Tue, 7 Feb 2023 15:11:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/4] pcie: cleanup code and add trace point DROP THIS
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org
References: <20230207120922.325203-1-vsementsov@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230207120922.325203-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Please ignore this accidental resend, I'm sorry for the noise.

On 07.02.23 15:09, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> Here is tiny code cleanup + on trace point to track power indicator
> changes (which may help to analyze
> "Hot-unplug failed: guest is busy (power indicator blinking)" error
> message).
> 
> Vladimir Sementsov-Ogievskiy (4):
>    pcie: pcie_cap_slot_write_config(): use correct macro
>    pcie_regs: drop duplicated indicator value macros
>    pcie: drop unused PCIExpressIndicator
>    pcie: add trace-point for power indicator transitions
> 
>   include/hw/pci/pcie.h      |  8 --------
>   include/hw/pci/pcie_regs.h | 14 --------------
>   hw/pci/pcie.c              | 33 +++++++++++++++++++++++++++------
>   hw/pci/trace-events        |  3 +++
>   4 files changed, 30 insertions(+), 28 deletions(-)
> 

-- 
Best regards,
Vladimir


