Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5338440D78A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:37:48 +0200 (CEST)
Received: from localhost ([::1]:34326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQom3-0007jl-An
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQokj-00057g-79; Thu, 16 Sep 2021 06:36:25 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:33603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQokh-0002mP-N4; Thu, 16 Sep 2021 06:36:24 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MyseA-1mmRmH09mE-00vwii; Thu, 16 Sep 2021 11:55:59 +0200
Subject: Re: [PATCH] intel_iommu: Fix typo in comments
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cai Huoqing <caihuoqing@baidu.com>, mst@redhat.com, peterx@redhat.com,
 jasowang@redhat.com
References: <20210730014942.2311-1-caihuoqing@baidu.com>
 <6305f2ce-5d58-7eac-1568-05b64f45d96f@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <5fc722a9-be3d-d2fb-9664-e498c5eeec9e@vivier.eu>
Date: Thu, 16 Sep 2021 11:55:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6305f2ce-5d58-7eac-1568-05b64f45d96f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BDYPMQNyamKfRW2oseWUIkB0PMr2ZCOJZSFAQKVCbTtdhik+Ylb
 pBctbtGQF7FexGmtRP1hmrb5/CAStbqjphTK+huxecj68EZxY8lXH4LW5cuqN2zxJnlHY1q
 Y+OxqSfmKjMU2g6OZ0LzCIA9kBH/B9Si7tBUwTSjiEfdTYPJICjzXYdHgZRK9RCQC8TWrGe
 a2+QelwJohvjHuTrJi8NQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VAYZ1GgB47U=:bU2vXAEJEJOngFxQAvtKn7
 cGmKSCRJUtZ4UUjxulgaBVpBPio0u332DEUq1MOrSAbah7SBYJxTh5ZSctlKBDME2ijnGwN5v
 aAREEw+mBbR3iY5q0oVmdJu1nuEvrb+zY7GPmga4Q7SXPhhkhdfSYAPFHYoIYkZ0ra4semg9j
 2+59VkqkaBZGW0E/Qzsqu9ypWXCL9FdgxQNPDwYlHHP822MYGKvdxIU6MzzV86STBeG49l5yV
 d2P9ZDRuLgp0I+nmr1kXODH/6C5B3e/2oaJF12E+737FdxZLc/EP6W7qDZl9eZT473nmkecYO
 nM9oN6lbTr5+R32dezRUHPZ14m6vCDOodjpqeyHKWYJYLrMwX0ctbNX3pRfx+lfbIh3GKak3O
 AjsRjhxU0Iu1sTkKxq6gLsJh8rkHP64GRUb632E7IG7cK+VFwG+O2yiMDYnWk80UduKHuqQrX
 /ldh5MpbGnKhacBBpENoDc5rlmWCQehNEcFcfllWjTkshyRdqJ0hOF/0C705hxeRhUf0vahTM
 eV4ojR5IaQ1MxHx5lUT9rwF+XObg2L/DKg0rc4on0YFwD0rRbZ3/RMgE649mq6TiJm+ZcVe3k
 arPRSk17j66Xcfl40TeA0rx13CT9ucNqL/YtzdJ9BmKE4I035jciu5XkxoOk7YNz3+nuOnhDo
 5IEK0//CdlxGR7nwASqK3vpCrCtGbZO41e87SceUr7tswI+HlGoDEP/pgMDcMELv6wBb4LmFk
 MIbDCYp5w+exNcY3zL57Iq4d6v9s5hgY2HmopV8XvrddPyReBuuWOx0d+uW3dq96hrph/7meQ
 8eRl7KX
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.698,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/07/2021 à 15:27, Philippe Mathieu-Daudé a écrit :
> On 7/30/21 3:49 AM, Cai Huoqing wrote:
>> Fix typo:
>> *Unknwon  ==> Unknown
>> *futher  ==> further
>> *configed  ==> configured
>>
>> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
>> ---
>>  hw/i386/intel_iommu.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> 
Applied to my trivial-patches branch.

Thanks,
Laurent

