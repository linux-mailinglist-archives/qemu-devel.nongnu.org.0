Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7451E3A958E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 11:07:45 +0200 (CEST)
Received: from localhost ([::1]:42388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltRWS-0004gS-I6
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 05:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ltRUQ-0002ur-6b
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:05:38 -0400
Received: from smtpout1.mo3005.mail-out.ovh.net ([79.137.123.220]:51489
 helo=smtpout1.3005.mail-out.ovh.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ltRUI-0007yY-Jk
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:05:37 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.53])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 8DCC014004D;
 Wed, 16 Jun 2021 09:05:25 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Wed, 16 Jun
 2021 11:05:22 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0059fbf1422-bcba-4473-872a-5e395f123ce4,
 06345D7E1B8C8FAD34147FE460F0DA442DB8F7FD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH 2/2] docs/system/arm: Add quanta-gbs-bmc reference
To: Patrick Venture <venture@google.com>, <hskinnemoen@google.com>,
 <kfting@nuvoton.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>
References: <20210615192848.1065297-1-venture@google.com>
 <20210615192848.1065297-3-venture@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c98887ca-33b2-e8b7-6413-535ab9f430a1@kaod.org>
Date: Wed, 16 Jun 2021 11:05:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615192848.1065297-3-venture@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e2e9d053-da1a-469b-8efe-8e9e3699431c
X-Ovh-Tracer-Id: 13750897037679496044
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehvvghnthhurhgvsehgohhoghhlvgdrtghomh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.3005.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.095,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/21 9:28 PM, Patrick Venture wrote:
> Add line item reference to quanta-gbs-bmc machine.
> 
> Signed-off-by: Patrick Venture <venture@google.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  docs/system/arm/nuvoton.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
> index ca011bd479..197d149f66 100644
> --- a/docs/system/arm/nuvoton.rst
> +++ b/docs/system/arm/nuvoton.rst
> @@ -1,4 +1,4 @@
> -Nuvoton iBMC boards (``npcm750-evb``, ``quanta-gsj``)
> +Nuvoton iBMC boards (``*-bmc``, ``npcm750-evb``, ``quanta-gsj``)
>  =====================================================
>  
>  The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
> @@ -18,6 +18,7 @@ segment. The following machines are based on this chip :
>  The NPCM730 SoC has two Cortex-A9 cores and is targeted for Data Center and
>  Hyperscale applications. The following machines are based on this chip :
>  
> +- ``quanta-gbs-bmc``    Quanta GBS server BMC
>  - ``quanta-gsj``        Quanta GSJ server BMC
>  
>  There are also two more SoCs, NPCM710 and NPCM705, which are single-core
> 


