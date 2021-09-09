Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AE94059AD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 16:49:48 +0200 (CEST)
Received: from localhost ([::1]:59216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOLN6-0006ny-0o
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 10:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mOLM4-000673-68
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 10:48:44 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:14168
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1mOLM1-0007Pj-RU
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 10:48:43 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AFyi5m6lZp9LxOBXk231Viu+XpOPpDfIQ3DAb?=
 =?us-ascii?q?v31ZSRFFG/Fw9vre+MjzsCWYtN9/Yh8dcK+7UpVoLUm8yXcX2/h1AV7BZniEhI?=
 =?us-ascii?q?LAFugLgrcKqAeQeREWmNQ86Y5QN4B6CPDVSWNxlNvG5mCDeOoI8Z2q97+JiI7l?=
 =?us-ascii?q?o0tQcQ=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.85,280,1624291200"; d="scan'208";a="114237875"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Sep 2021 22:48:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 94F184D0D9BA;
 Thu,  9 Sep 2021 22:48:29 +0800 (CST)
Received: from G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 9 Sep 2021 22:48:24 +0800
Received: from [192.168.122.212] (10.167.226.45) by
 G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.23 via Frontend Transport; Thu, 9 Sep 2021 22:48:24 +0800
Subject: Re: [PULL 0/7] Migration.next patches
To: Peter Maydell <peter.maydell@linaro.org>, Juan Quintela
 <quintela@redhat.com>
References: <20210909103346.1990-1-quintela@redhat.com>
 <CAFEAcA-LSVj3B-xgPFMTz49D=KoRx1W7_HKjFf1bHEYdBGVgPA@mail.gmail.com>
From: "Li, Zhijian" <lizhijian@cn.fujitsu.com>
Message-ID: <f02237fb-852d-8449-e90d-97a59bcf51e8@cn.fujitsu.com>
Date: Thu, 9 Sep 2021 22:48:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-LSVj3B-xgPFMTz49D=KoRx1W7_HKjFf1bHEYdBGVgPA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-yoursite-MailScanner-ID: 94F184D0D9BA.AFBB0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@fujitsu.com
Received-SPF: neutral client-ip=183.91.158.132;
 envelope-from=lizhijian@fujitsu.com; helo=heian.cn.fujitsu.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.975,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

on 2021/9/9 21:42, Peter Maydell wrote:
> On Thu, 9 Sept 2021 at 11:36, Juan Quintela <quintela@redhat.com> wrote:
> Fails to build, FreeBSD:
>
> ../src/migration/rdma.c:1146:23: error: use of undeclared identifier
> 'IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE'
>      int advice = wr ? IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE :
>                        ^
> ../src/migration/rdma.c:1147:18: error: use of undeclared identifier
> 'IBV_ADVISE_MR_ADVICE_PREFETCH'
>                   IBV_ADVISE_MR_ADVICE_PREFETCH;
>                   ^
> ../src/migration/rdma.c:1150:11: warning: implicit declaration of
> function 'ibv_advise_mr' is invalid in C99
> [-Wimplicit-function-declaration]
>      ret = ibv_advise_mr(pd, advice,
>            ^
> ../src/migration/rdma.c:1151:25: error: use of undeclared identifier
> 'IBV_ADVISE_MR_FLAG_FLUSH'
>                          IBV_ADVISE_MR_FLAG_FLUSH, &sg_list, 1);
>                          ^
>
it's introduced by [PULL 4/7] migration/rdma: advise prefetch write for ODP region
where it calls a ibv_advise_mr(). i have checked the latest FreeBSD, it didn't ship with this API
May i know if just FressBSD reports this failure? if so, i just need filtering out FreeBSD only

Thanks
zhijian


> -- PMM
>



