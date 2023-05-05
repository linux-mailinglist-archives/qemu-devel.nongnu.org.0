Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF046F84AB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 16:16:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puwDl-0005pO-Lv; Fri, 05 May 2023 10:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1puwDO-0005m2-1X; Fri, 05 May 2023 10:15:18 -0400
Received: from mail-out-4.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1puwDI-0001KR-1i; Fri, 05 May 2023 10:15:17 -0400
X-IPAS-Result: =?us-ascii?q?A2DwBACqDlVk/5sagoZaHQEBAQEJARIBBQUBQIFPggaBH?=
 =?us-ascii?q?YFaGwGENZE4n1wPAQEBAQEBAQEBCAE5CwQBAYUGAoVGJjgTAQIEAQEBAQMCA?=
 =?us-ascii?q?wEBAQEBAQMBAQYBAQEBAQEGBIEdhS8MCCUNhgUBAQEDIw8BBUEQCxQEAgImA?=
 =?us-ascii?q?gJXBgEMAQUCAQGCegGCXBOtFoEygQGgHoEEHQYJAYEKLYkziCKCT4E8gkw4P?=
 =?us-ascii?q?oJiAoFOg22CZwSOWoEoiF6BMHSBJ4EugQQCCQIRQyiBEAhpgXRAAg1kCwttg?=
 =?us-ascii?q?UCDDQQCETQODBUFVQKBBggUARMDBwcCAYEaEDoHBEAoDAcJHw4lBA4DGSsdQ?=
 =?us-ascii?q?AIBCzs6PTUJCx9LK4FZBC9aewYBJSSYJYQUIg2CDsQeB4IrgVaLdYhIjDgGQ?=
 =?us-ascii?q?pcZBpIpmAAgjTaaKQIEAgQFAhaBeoF+cYM2UhcCD4wugxgBCIJDj3tzPQIHA?=
 =?us-ascii?q?QoBAQMJgjmEDYNrAYETAQE?=
IronPort-Data: A9a23:AQe7AK2k7docR87eM/bD5ctwkn2cJEfYwER7XKvMYLTBsI5bpzQEz
 2seUGvXM/vcNDagfYt+PI20pE8D78LTzNJgSwRk3Hw8FHgiRegppDi6BhqqY3nCfpWroGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9xGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYHR7zil5
 JWj8qUzBHf/g2Qvaj9MtvrZwP9SlK2aVA0w7wRWic9j4Qe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36YWBivkFrt52K2XCukARviPphZKpEAatgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEFL0OevHJSxjSCc5x34WWW8yudfNkARAZc22/hdLEAS8
 NVNfVjhbjjb7w636IiEdslBtoEYdozBepkApnElxD2fAftOrZLrGv6Wo4YDhHFq2IYXQKu2i
 8kxMFKDaDzcZBdOM0xREpUznOKlglHlbCFY7Vucrqo65S7fwWSd1ZC0b4uPJ4HUFJU9ckCwo
 jjHoXXGUhUmP//A82Gs8Emcq8jBpHauMG4VPPjinhJwu3Wa12UVCwATXHOypPX/gUm7M/pHJ
 lAZ4GwrpLk++UivZt38WRSipziDpBF0c8NdFvB/5AyTx6785QGfCW4ZCDlbZ7QOrcIzWHkjz
 FqhmdTvCjpy9rqPRhq17auZozq0Pm4OMWYIaCsATA0Ey9DmrMc4iRenczp4OLSqkt34CXTrm
 XWA6jIhm7VWhMJN26jTEU37vg9Ab6PhFmYdjjg7lEr8hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:xAlX6KOGNM23ksBcTvWjsMiBIKoaSvp037BL7TEIdfUxSL3/qy
 nAppsmPGDP+VQssR0b8+xoEpPwIk80jKQV3WBJB9eftWrdyRKVxf9Zg7cKqgeIcxEWkNQw6U
 4KScND4bPLYGSTqK7BkWyF+pkbsb26GQuT9IDj80s=
X-Talos-CUID: 9a23:+IJwTW+xe+AQpehL9wCVvx4qMN51e2/s9nb3H1WWKHhDZZzJTHbFrQ==
X-Talos-MUID: 9a23:9GTdYQXzm1Qy+lvq/Du2hW9zC5ds36+NV3pWuJc9i+SjOxUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.99,252,1677538800"; d="scan'208";a="179255698"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-4.itc.rwth-aachen.de with ESMTP; 05 May 2023 16:15:02 +0200
Received: from [137.226.252.162] (137.226.252.162) by RWTHEX-S2-B.rwth-ad.de
 (2a00:8a60:1:e500::26:155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 5 May
 2023 16:15:01 +0200
Message-ID: <28bfa9ad-f8dd-d195-ec66-fbd2d78d170c@rwth-aachen.de>
Date: Fri, 5 May 2023 16:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: Cortex-R52 support in Qemu
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, "Stabellini, Stefano"
 <stefano.stabellini@amd.com>
References: <a1c45644-90d9-0fd2-c87b-f43f16b7e407@amd.com>
From: =?UTF-8?Q?Tobias_R=c3=b6hmel?= <tobias.roehmel@rwth-aachen.de>
In-Reply-To: <a1c45644-90d9-0fd2-c87b-f43f16b7e407@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [137.226.252.162]
X-ClientProxiedBy: rwthex-w1-b.rwth-ad.de (2a00:8a60:1:e500::26:157) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:49;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-4.itc.rwth-aachen.de
X-Spam_score_int: -84
X-Spam_score: -8.5
X-Spam_bar: --------
X-Spam_report: (-8.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Hi Ayan,

as far as I know, there is no board/SoC that uses the Cortex-R52 in Qemu 
right now. If you want, I can try to find the one that I used
during development. I was able to run Zephyr in Qemu with that code.

Best regards,
Tobias

On 05.05.23 14:21, Ayan Kumar Halder wrote:
> Hi Tobias/Peter,
>
> Greetings.
>
> In the following commit, I see you have added R52 support in Qemu.
>
> commit 5f536d01d1141a56f5057b62c82fa94826d367f0
> Author: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
> Date:   Tue Dec 6 11:25:04 2022 +0100
>
>     target/arm: Add ARM Cortex-R52 CPU
>
>
> 1. Do you have quick instructions on how to build and test it ? I have 
> ported Xen for Cortex-R52 (using Arm FVP) and would like to see if it 
> works with Qemu as well.
>
> 2. Have you (or planning in near future) to add support for qemu-r52 
> in Zephyr ? I can see an old ticket
> https://github.com/zephyrproject-rtos/zephyr/issues/47330 , but don't 
> know if you have integrated qemu in Zephyr.
>
>
> Kind regards,
>
> Ayan
>

