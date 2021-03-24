Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E2D34778F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 12:41:24 +0100 (CET)
Received: from localhost ([::1]:34382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP1t5-0000t7-97
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 07:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lP1qS-0000QY-SK
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:38:42 -0400
Received: from 2.mo52.mail-out.ovh.net ([178.33.105.233]:53608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lP1qL-0006vO-29
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:38:40 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id DF0B025605C;
 Wed, 24 Mar 2021 12:38:29 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 24 Mar
 2021 12:38:29 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001580fb4b7-fae9-46cc-a349-786eef2ce6d6,
 90EFDD1C85C6F754CEE6F6149A82CEA72524D6DA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: qdev: Regarding lazy ISA bridge creation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <f56a86b6-784e-15dc-fd8b-68c91102378c@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <35bb8a1c-6651-b517-79cf-4bf1653fc1e1@kaod.org>
Date: Wed, 24 Mar 2021 12:38:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f56a86b6-784e-15dc-fd8b-68c91102378c@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c9ec8efa-60a5-4684-940e-304bdf27eeef
X-Ovh-Tracer-Id: 2645020359891979232
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudegkedgfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheptefhgfelgeeufedvudetudevveevkefhteetjeejudfgveetffevteffteeltefgnecuffhomhgrihhnpehrvggrughthhgvughotghsrdhiohdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 12:13 PM, Philippe Mathieu-Daudé wrote:
> Hi Cédric,
> 
> I'm trying to understand the comment you added in commit
> 3495b6b6101 ("ppc/pnv: add a ISA bus"):
> 
>  /* let isa_bus_new() create its own bridge on SysBus otherwise
>   * devices specified on the command line won't find the bus and
>   * will fail to create.
>   */
>  isa_bus = isa_bus_new(NULL, &lpc->isa_mem, &lpc->isa_io, &local_err);
> 
> Do you have an example so I can reproduce?

I think this is related the IPMI BT device when using an external BMC :  

  https://qemu.readthedocs.io/en/latest/system/ppc/powernv.html

You could use an Aspeed machine for the remote end. But you need the 
aspeed-6.0 branch for that because I did not send upstream the iBT model :

  https://github.com/legoater/qemu/commit/4d2d9fe1211a25738ba5429d07a58c981845af92

C.

