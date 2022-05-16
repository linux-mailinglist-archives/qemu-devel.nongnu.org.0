Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B305284F6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 15:08:29 +0200 (CEST)
Received: from localhost ([::1]:51824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqaSZ-00050T-Ng
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 09:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1nqZuq-000636-GA; Mon, 16 May 2022 08:33:41 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:38155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1nqZuo-0008Ak-5O; Mon, 16 May 2022 08:33:36 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A54CF5C01BD;
 Mon, 16 May 2022 08:33:31 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Mon, 16 May 2022 08:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1652704411; x=
 1652790811; bh=z3jH7bU6ja+05lC6SX96mbpSl12BhebXNE1kWGUErYI=; b=c
 ACBC8vDqKhpLh+CZ6I+RhEdZkG7nx3bxBPeCH2Xfnke76Mi2kUP/5WSk8Romejn1
 Z9Zy6LGl5/VN0Y3glUIEPqz4KYQfqhw3cSARxgbg9cYvJ61S1zrq37Y1t8yhKDA0
 ZAgd3uxpH+zqksQOa9FKKFxzALKAD2QvkTmoSDZAvu8P5qT+0t6NHtLAH7RvP2xc
 AqCwdGvn8Ncz/crm8dxm7E8zo3vu1Vvxv3iNPKOknk/48HYu3kzNwu4NN6IpbXkg
 sVpGF5qKAyE8vQp7nKFEfY8VMhaiHJeF0HmSe8rGjXAjqTwO/TZNUtwfveFi+05p
 +Cilz/e9/15paXFGaQGdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1652704411; x=1652790811; bh=z3jH7bU6ja+05
 lC6SX96mbpSl12BhebXNE1kWGUErYI=; b=fRwrVJW6xuSB8Au6E+x7CcM3MNZ2X
 mcMfcW+1zf0tnDATU6LFGBumF37u9mHdiZaX9AQgpI0eF3C3ePJWT2OgzZuH0DDb
 iath4UU5BSOY5tP4osAfvVrqvE/HkRIqwgXiosZSY5221kNp1FFsJBmM0tz2wMw2
 +2MtrAoMGynWZeonZCDvR3qFD1zNkK3VHMd9cnGOuc/9ko2dy85IxVOLKsVnMvNs
 14Qi3cD52MfOSoGbFX1QWW/74AS+IOtkNLOa/6x+GFdRvxl8bEOuCRT68lFT4AaY
 55cyWKXAxk8N61SUSv+QxYknqjM+Vl2go/Njx+kNLk3F1fxHpgneyRbhw==
X-ME-Sender: <xms:mkSCYgmJ312dC099spiLbLZ3_-sW2z13a4ZiHzukJOyqfHnGG69K7w>
 <xme:mkSCYv2KjTc-2wRTe1FB7hriAS-ylAJabLeB7MK7PU4N2AUnL1lg_5MtoJrBzLIam
 WOy5dMzvc3CtwGA3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpeelkeetiedvgfekueehteekueefgfeuffdvieduieehgfefleeihfeg
 hfelvdeffeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrgh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgu
 rhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:mkSCYurTv1AMTXQXtnu2OIi1cJ4kz9b4XaRSE6UA3h0Q_cPiZfcYUA>
 <xmx:mkSCYsnirEZFtIC2VCt21K0rfGSBTROkK0TLnE2F8YynMGhuvzjUiA>
 <xmx:mkSCYu3p7AYbXeCz5HtE3zmauzMiLGT5cdb87UcbNzQfCMLZ2MNLLw>
 <xmx:m0SCYnnOEwNmzcZl_CI27sZQKkjPN1QjylDU084mMIzIvS0dD0vj3w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8F14B15A0080; Mon, 16 May 2022 08:33:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-591-gfe6c3a2700-fm-20220427.001-gfe6c3a27
Mime-Version: 1.0
Message-Id: <361f8b4a-9b98-4f20-a54e-0ccecf302cd4@www.fastmail.com>
In-Reply-To: <b978e205-66f7-e585-4cf0-6f3946fd1050@kaod.org>
References: <20220516062328.298336-1-pdel@fb.com>
 <b978e205-66f7-e585-4cf0-6f3946fd1050@kaod.org>
Date: Mon, 16 May 2022 22:03:10 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Peter Delevoryas" <pdel@fb.com>
Cc: irischenlj@fb.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9_via?= <qemu-arm@nongnu.org>,
 "Cameron Esfahani via" <qemu-devel@nongnu.org>,
 "Zev Weiss" <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org,
 "Peter Maydell" <peter.maydell@linaro.org>, "Joel Stanley" <joel@jms.id.au>,
 "Jamin Lin" <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH v2 0/5] hw: aspeed: Init all UART's with serial devices
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.25; envelope-from=andrew@aj.id.au;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 16 May 2022, at 16:48, C=C3=A9dric Le Goater wrote:
> On 5/16/22 08:23, Peter Delevoryas wrote:
>> v2:
>> - Rebased on Cedric's irq proposal. [1]
>> - Added "Introduce common UART init function" patch
>> - Added "Add uarts_num SoC attribute" patch
>> - Rewrote last commit's message for clarity
>
> Looks good to me.
>
>> I tried testing this by running acceptance tests, particularly the
>> boot_linux_console.py file, but I had to disable the raspi2_initrd ca=
se.
>> It's not related to my changes (A/B tested and it fails on upstream/m=
aster
>> too), but thought I would mention that.>
>> I also manually tested several machines:
>>=20
>> AST2400: https://github.com/facebook/openbmc/releases/download/v2021.=
49.0/wedge100.mtd
>> AST2500: https://github.com/facebook/openbmc/releases/download/v2021.=
49.0/fby3.mtd
>> AST2600: https://github.com/facebook/openbmc/releases/download/v2021.=
49.0/fuji.mtd
>> AST1030: https://github.com/peterdelevoryas/OpenBIC/releases/download=
/oby35-cl-2022.13.01/Y35BCL.elf
>>=20
>> [1] https://lore.kernel.org/qemu-devel/20220516055620.2380197-1-clg@k=
aod.org/
> I have quite a few images which I run manually. OpenBMC is providing
> images, Aspeed also. Joel did a small tool for the IBM rainier :
>
>    https://github.com/shenki/qemu-boot-test
>
> Having an automated framework for Aspeed machines pulling images
> from different places would be nice but we cannot put all under
> QEMU.

For what it's worth I run this as a smoke test before pushing updates to=
 openbmc/qemu:

https://github.com/openbmc/openbmc-build-scripts/blob/master/scripts/tes=
t-qemu

Andrew

