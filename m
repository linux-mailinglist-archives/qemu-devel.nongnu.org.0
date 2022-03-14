Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AA34D87FB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 16:22:52 +0100 (CET)
Received: from localhost ([::1]:35630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTmX5-0003l3-5a
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 11:22:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nTmVh-0001tk-Ld
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 11:21:25 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:45765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nTmVf-0003by-Og
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 11:21:25 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.139])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 6BF2627857;
 Mon, 14 Mar 2022 15:21:21 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 14 Mar
 2022 16:21:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001aedcaba2-2cf1-4504-82a3-3164590b3ac7,
 00B622A560025FB732B9BA5E5C4E2A2293E53F9D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8f999b85-ddc3-ea0e-0794-a320060d9668@kaod.org>
Date: Mon, 14 Mar 2022 16:21:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 0/9] --disable-tcg avocado fixes for ppc-softmmu
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220310183011.110391-1-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220310183011.110391-1-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 74014c1e-927b-4207-9243-568838ae3897
X-Ovh-Tracer-Id: 6733162918820219686
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvkedgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepteevleduueffffelveelheekuedtveehkedutefffffhkedutdehgfdtjefhtdffnecuffhomhgrihhnpehgnhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepmhhurhhilhhooheslhhinhhugidrihgsmhdrtghomh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: farosas@linux.ibm.com, qemu-ppc@nongnu.org, muriloo@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 19:30, Daniel Henrique Barboza wrote:
> Hi,
> 
> These are more test fixes that I missed from my first series [1]. Thanks
> Murilo Opsfelder and Fabiano for letting me know that we still had broken
> tests to deal with.
> 
> All these tests were either a case of 'this needs kvm_pr' or 'this needs
> kvm_hv'. Since avocado doesn't have yet a way of detecting if the host
> is running kvm_hv or kvm_pr, the workaround for now is to skip them if
> TCG isn't available.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg00866.html
> 
> 
> Daniel Henrique Barboza (9):
>    avocado/boot_linux_console.py: check TCG accel in test_ppc_g3beige()
>    avocado/boot_linux_console.py: check TCG accel in test_ppc_mac99()
>    avocado/ppc_405.py: remove test_ppc_taihu()
>    avocado/ppc_405.py: check TCG accel in test_ppc_ref405ep()
>    avocado/ppc_74xx.py: check TCG accel for all tests
>    avocado/ppc_bamboo.py: check TCG accel in test_ppc_bamboo()
>    avocado/ppc_mpc8544ds.py: check TCG accel in test_ppc_mpc8544ds()
>    avocado/ppc_prep_40p.py: check TCG accel in all tests
>    avocado/ppc_virtex_ml507.py: check TCG accel in
>      test_ppc_virtex_ml507()
> 
>   tests/avocado/boot_linux_console.py | 12 ++++++++++++
>   tests/avocado/ppc_405.py            | 10 ++--------
>   tests/avocado/ppc_74xx.py           | 13 +++++++++++++
>   tests/avocado/ppc_bamboo.py         |  2 ++
>   tests/avocado/ppc_mpc8544ds.py      |  2 ++
>   tests/avocado/ppc_prep_40p.py       |  6 ++++++
>   tests/avocado/ppc_virtex_ml507.py   |  2 ++
>   7 files changed, 39 insertions(+), 8 deletions(-)
> 


Queued for 7.0

Thanks,

C.

