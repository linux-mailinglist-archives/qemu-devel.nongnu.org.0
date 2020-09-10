Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DE1264863
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 16:52:12 +0200 (CEST)
Received: from localhost ([::1]:44704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGNvn-0001mJ-J4
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 10:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1kGNun-0000tk-Dr; Thu, 10 Sep 2020 10:51:09 -0400
Received: from relay68.bu.edu ([128.197.228.73]:60378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1kGNul-0002Le-Ls; Thu, 10 Sep 2020 10:51:09 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 08AEnrQg004211
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 10 Sep 2020 10:49:57 -0400
Date: Thu, 10 Sep 2020 10:49:53 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 0/3] hw/sd/sdhci: Fix DMA Transfer Block Size field
 width
Message-ID: <20200910144953.daqdwbwf2inglcht@mozz.bu.edu>
References: <20200901140411.112150-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200901140411.112150-1-f4bug@amsat.org>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 10:49:07
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.768, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: bugs-syssec@rub.de, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For this series:

Tested-by: Alexander Bulekov <alxndr@bu.edu>

On 200901 1604, Philippe Mathieu-Daudé wrote:
> Fix the SDHCI issue reported last week by Alexander:
> https://bugs.launchpad.net/qemu/+bug/1892960
> 
> The field is 12-bit (4KiB) but the guest can set
> up to 16-bit (64KiB), leading to OOB access.
> 
> since v1:
> commited unstaged change in patch #3...
> 
> Philippe Mathieu-Daudé (3):
>   hw/sd/sdhci: Fix qemu_log_mask() format string
>   hw/sd/sdhci: Document the datasheet used
>   hw/sd/sdhci: Fix DMA Transfer Block Size field
> 
>  hw/sd/sdhci.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> -- 
> 2.26.2
> 

