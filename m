Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAEC3ABC27
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 20:50:03 +0200 (CEST)
Received: from localhost ([::1]:57714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltx5V-00051N-Os
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 14:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.jensen@samsung.com>)
 id 1ltx4K-0004CK-RI
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 14:48:48 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:51333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.jensen@samsung.com>)
 id 1ltx4H-0007p3-LT
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 14:48:48 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210617184834euoutp024e9c798b7ab4d1606b007932a4f7c71e~Jcx5LAQ4X3035430354euoutp02K
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 18:48:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210617184834euoutp024e9c798b7ab4d1606b007932a4f7c71e~Jcx5LAQ4X3035430354euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1623955714;
 bh=9z2crXDDPc9g95c6/WYPc1pCU2C1o8fEjAgAn9JEbZM=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=ArIOH/1rDbxKtG9VEsNT9xBjOgwOdpiJiP7iGhLogHFKioAGKAdrACG+pfFIKBi5E
 sKslU1rdK0dl/zvGSU6ia39M8fFgwKEmcsZchDoh81vZe6raf8zGYEUehmHZcQoIpo
 olDzXzT/4d5QA2wBgZfUnn+GqwVjFokqHW4LpzYc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210617184834eucas1p2bd16bd7aa5a00b236b17794333f2b07b~Jcx4vjVdb2953529535eucas1p2B;
 Thu, 17 Jun 2021 18:48:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 25.93.09439.1099BC06; Thu, 17
 Jun 2021 19:48:34 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210617184833eucas1p26b99c9f46a3bbd12dde470a918ec16e5~Jcx36hp8h2953529535eucas1p2A;
 Thu, 17 Jun 2021 18:48:33 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210617184833eusmtrp2b9ea19f72ab6947e0005c2ced545abe1~Jcx354EZb1740917409eusmtrp2u;
 Thu, 17 Jun 2021 18:48:33 +0000 (GMT)
X-AuditID: cbfec7f5-c1bff700000024df-f0-60cb99014265
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 9B.86.08705.1099BC06; Thu, 17
 Jun 2021 19:48:33 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210617184833eusmtip2dcdbc5385b7898850ec6457f1320a6ad~Jcx3wVFh_1597515975eusmtip22;
 Thu, 17 Jun 2021 18:48:33 +0000 (GMT)
Received: from apples.localdomain (106.210.248.97) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Jun 2021 19:48:32 +0100
Date: Thu, 17 Jun 2021 20:48:30 +0200
From: Klaus Jensen <k.jensen@samsung.com>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH] hw/nvme: fix pin-based interrupt behavior (again)
Message-ID: <YMuY/k0exA4onXCI@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline
In-Reply-To: <20210617145019.GB1133213@dhcp-10-100-145-180.wdc.com>
X-Originating-IP: [106.210.248.97]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmleLIzCtJLcpLzFFi42LZduzneV2mmacTDLY9YLLYf/Abq0XHrfcs
 FpMOXWO0mPWunc3ieO8OFgdWj3M7zrN7bFrVyeYxf/UqFo8n1zYzBbBEcdmkpOZklqUW6dsl
 cGXc3LeXqaCbueLH75dMDYxLmLoYOTkkBEwkFsxZA2RzcQgJrGCUuDd9PjtIQkjgC6PEpz2m
 EInPjBKTp39ihuk4d/8PVMdyRommvwuY4Ko2f5rDCuHsZZR4+m0vG0gLi4CqxIVdu1lAbDYB
 TYntf/6D2SICyhJ3588Ea2AWmMko8WbOf6DlHBzCAm4SpxYrgpi8AoYSc1YlgpTzCghKnJz5
 BKyVWcBKovNDEytICbOAtMTyfxwgYU4BZ4kzF2dAHaoksf02yHQQu1bi1JZbYHdKCNzgkJjS
 9YgdIuEicW/PPShbWOLV8S1QtozE/53zoRq6GSX6PnxlhnBmMEpMX/adDWSzhIC1RN+ZHIgG
 R4nVzQ1MEGE+iRtvBSHu5JOYtG06M0SYV6KjTQiiWk1iR9NWxgmMyrOQfDYLyWezED5bwMi8
 ilE8tbQ4Nz212DgvtVyvODG3uDQvXS85P3cTIzCdnP53/OsOxhWvPuodYmTiYDzEKMHBrCTC
 q1t8IkGINyWxsiq1KD++qDQntfgQozQHi5I4766ta+KFBNITS1KzU1MLUotgskwcnFINTELn
 fp178VlxTvCP5xVcqTkPvlcb/232OBq2K+L9tCebt4VOujgxkPUp/+T1ZwX7o6QWXby686H0
 j0+Ljd7M/dbS4Vua16u+66ib1S8/I2Zrl4uSFwPduVzn3Nn63FX2oPSkHtMDF+PrKqa92LWS
 8+rSLX1hzHFFTW0m+o2H2G7rNYpqzhQLepqa8n7dtw7xgltzbn9WDKv+fd//dmdPqfseC4uf
 s87sO2Wr0eGXtZJjj7Ld5et3XV7HT0syOWxUHCKw4cP8a0a6ul9PzeC3YdBtsPL4I/xRZ1uw
 xIOZe/hvhjEWnmu/cnb3nK3r69ItJE/vVl2wXm76dXPxG1M26885+2DttBK/yyHGkz2uVqxT
 YinOSDTUYi4qTgQAV/tvC5YDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xe7qMM08nGDyawGmx/+A3VouOW+9Z
 LCYdusZoMetdO5vF8d4dLA6sHud2nGf32LSqk81j/upVLB5Prm1mCmCJ0rMpyi8tSVXIyC8u
 sVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mu4uW8vU0E3c8WP3y+ZGhiX
 MHUxcnJICJhInLv/B8jm4hASWMoo0XangQUiISPx6cpHdghbWOLPtS42iKKPjBI9qz4wQjh7
 GSWeTu9nBKliEVCVuLBrN1g3m4CmxPY//8FsEQFlibvzZ7KCNDALzGSUeDPnP9BYDg5hATeJ
 U4sVQUxeAUOJOasSIWYeZpR4/+UcM0gvr4CgxMmZT8DmMAtYSMycf54RpJ5ZQFpi+T8OkDCn
 gLPEmYszmCEOVZLYfhtkFYhdK/H57zPGCYzCs5BMmoVk0iyESQsYmVcxiqSWFuem5xYb6hUn
 5haX5qXrJefnbmIExtW2Yz8372Cc9+qj3iFGJg7GQ4wSHMxKIry6xScShHhTEiurUovy44tK
 c1KLDzGaAkNiIrOUaHI+MLLzSuINzQxMDU3MLA1MLc2MlcR5t85dEy8kkJ5YkpqdmlqQWgTT
 x8TBKdXAJGX9f39igqvxY+dHivf83uq57VA+8nZJzavl1zYKMasyP9fh3Pvs4sw6B3Hu7R/f
 WnLGZvxQc9u/KOVpx/2orEVW15e7+Yd/Z73wbmn0Nm4dXtbzEuwVN76EnZmopTtP4JDhp+Ox
 Loype+TXLHj69w7rxKmmB35yTrc4/Dg5Wkll0j2DfQJfV5a+vppw6M+1J/szFmre2P4r8qx9
 jXSSsIPRn4V3Kz7u7fwX7BhgfS722v5fU7/NWHZu37yHW2UniTqLcTxjT4puWnScx8xp0vGq
 W93Ktcz7rGNvBd7aoJbf/6e0MSrQ1uzOLY/vC1Wb3xSc3PjOovCxUMPivSqKx23FeV2UYrdN
 OTQvTNrgUJYSS3FGoqEWc1FxIgB2UqaCNAMAAA==
X-CMS-MailID: 20210617184833eucas1p26b99c9f46a3bbd12dde470a918ec16e5
X-Msg-Generator: CA
X-RootMTR: 20210617145026eucas1p1094d0357600ca3112e0af2f42cc2b364
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210617145026eucas1p1094d0357600ca3112e0af2f42cc2b364
References: <20210617100820.75510-1-its@irrelevant.dk>
 <CGME20210617145026eucas1p1094d0357600ca3112e0af2f42cc2b364@eucas1p1.samsung.com>
 <20210617145019.GB1133213@dhcp-10-100-145-180.wdc.com>
Received-SPF: pass client-ip=210.118.77.12; envelope-from=k.jensen@samsung.com;
 helo=mailout2.w1.samsung.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Klaus Jensen <its@irrelevant.dk>,
 Jakub =?utf-8?B?SmVybcOhxZk=?= <jakub.jermar@kernkonzept.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jun 17 07:50, Keith Busch wrote:
>On Thu, Jun 17, 2021 at 12:08:20PM +0200, Klaus Jensen wrote:
>>      if (cq->tail != cq->head) {
>> +        if (!pending) {
>> +            n->cq_pending++;
>> +        }
>
>You should check cq->irq_enabled before incrementing cq_pending. You
>don't want to leave the irq asserted when polled queues have outsanding
>CQEs.

Good catch. Thanks!

