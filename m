Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9763C6EAB78
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:26:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqlj-0002B6-54; Fri, 21 Apr 2023 09:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ppqlh-00024e-1p
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:41 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ppqlf-0003RN-Be
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:40 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.173])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A534921E0E;
 Fri, 21 Apr 2023 13:25:36 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 21 Apr
 2023 15:25:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005b771feea-bba6-48a9-86bf-912b165e1fe1,
 7111A4B1C16D83D618E44FD4B545295E183D9861) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4de93f13-82de-2acc-0cc3-79dbf0f724e8@kaod.org>
Date: Fri, 21 Apr 2023 15:25:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] aspeed/hace: Initialize g_autofree pointer
Content-Language: en-US
To: <qemu-arm@nongnu.org>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Thomas
 Huth <thuth@redhat.com>, Andrew Jeffery <andrew@aj.id.au>, Steven Lee
 <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230421131547.2177449-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230421131547.2177449-1-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: f34602dd-2270-4cc9-a4ed-f8fef28a4269
X-Ovh-Tracer-Id: 10290725151783226220
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtgedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtfedpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhthhhuthhhsehrvgguhhgrthdrtghomhdprghnughrvgifsegrjhdrihgurdgruhdpshhtvghvvghnpghlvggvsegrshhpvggvughtvggthhdrtghomhdpjhhovghlsehjmhhsrdhiugdrrghupdgrlhgvgidrsggvnhhnvggvsehlihhnrghrohdrohhrghdpoffvte
 fjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/21/23 15:15, Cédric Le Goater wrote:
> As mentioned in docs/devel/style.rst "Automatic memory deallocation":
> 
> * Variables declared with g_auto* MUST always be initialized,
>    otherwise the cleanup function will use uninitialized stack memory
> 
> This avoids QEMU to coredump when running the "hash test" command
> under Zephyr.
> 
> Cc: Steven Lee <steven_lee@aspeedtech.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Fixes: c5475b3f9a ("hw: Model ASPEED's Hash and Crypto Engine")
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Alex,

FYI, with Thomas's fixes and this oneliner, make check-avocado ran fine
with avocado bumped to version 100.1.

Cheers,

C.

> ---
>   hw/misc/aspeed_hace.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 12a761f1f5..b07506ec04 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -189,7 +189,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>                                 bool acc_mode)
>   {
>       struct iovec iov[ASPEED_HACE_MAX_SG];
> -    g_autofree uint8_t *digest_buf;
> +    g_autofree uint8_t *digest_buf = NULL;
>       size_t digest_len = 0;
>       int niov = 0;
>       int i;


