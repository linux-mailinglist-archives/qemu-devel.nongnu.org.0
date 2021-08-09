Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E26BA3E4175
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 10:17:53 +0200 (CEST)
Received: from localhost ([::1]:46324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD0Tp-0006Sd-09
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 04:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD0Sx-0005bW-3A; Mon, 09 Aug 2021 04:16:59 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:41267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD0St-0004mM-H2; Mon, 09 Aug 2021 04:16:58 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.163])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D407EB8D3225;
 Mon,  9 Aug 2021 10:16:50 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 9 Aug
 2021 10:16:50 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0040c73111d-331c-4c1d-b900-40c612eed35f,
 12D865CA04D90D97A6A977E4DA2B50F9FD60493E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH] hw: arm: aspeed: Enable eth0 interface for
 aspeed-ast2600-evb
To: Joel Stanley <joel@jms.id.au>
References: <20210808200457.889955-1-linux@roeck-us.net>
 <7f49fccc-fb76-cd50-02d2-aa47f410d73e@kaod.org>
 <CACPK8XchtnxGyZ=wFMJU7S0V7SPUF0KoFn5BJiF7vT8bu3Qd3w@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3d5d5b8c-9686-367b-add1-8b7d9d2aa28c@kaod.org>
Date: Mon, 9 Aug 2021 10:16:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XchtnxGyZ=wFMJU7S0V7SPUF0KoFn5BJiF7vT8bu3Qd3w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6f8d0e9f-e5e3-4dd6-8517-5b1d71bf4df1
X-Ovh-Tracer-Id: 16461219591618202406
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrjeejgddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 10:01 AM, Joel Stanley wrote:
> On Mon, 9 Aug 2021 at 07:45, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 8/8/21 10:04 PM, Guenter Roeck wrote:
>>> Commit 7582591ae7 ("aspeed: Support AST2600A1 silicon revision") switched
>>> the silicon revision for AST2600 to revision A1. On revision A1, the first
>>> Ethernet interface is operational. Enable it.
>>
>> Indeed.
>>
>> I see that commit ba56f464f0c ("ARM: dts: aspeed: ast2600evb: Add MAC0")
>> reintroduced it a while ago. But my A0 doesn't support it. I am missing
>> something.
>>
>> Joel, why this patch didn't reach the OpenBMC kernel ?
> 
> Because your a0 doesn't support it, so it would break that. That's the
> only reason.

OK then.

> For this patch,
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

It's queued to aspeed-6.2.

Thanks

C.
 

