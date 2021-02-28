Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0917F327515
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:08:42 +0100 (CET)
Received: from localhost ([::1]:44906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVB2-00010C-Jm
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGV9y-0000SZ-N8; Sun, 28 Feb 2021 18:07:34 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:41033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGV9u-0000nd-A3; Sun, 28 Feb 2021 18:07:32 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 646095C0093;
 Sun, 28 Feb 2021 18:07:25 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 28 Feb 2021 18:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=r8kga
 nQMACnpTwhCNua7t0wdW1Szzoj5H7CTSvz4Fp4=; b=Uv0BSG8XNbytYunRlOG7f
 Sq1mIvLc9o5YbS1QUPZTqOt25zzFKPN/ftvKRslp1pGrNLmqyHzBNgH5o+EJiq3a
 yP60o9NHqijDyjjyxQ1Ouz4hqA0CgwuACYVjKL9p66nOwXlmDdv+PVm0s18fh96/
 D8AG2SE/uvEZIh8Lf325nn6YcQ1CAlfG2DS7iccqCwggK+RpG0mzCRWDcXx+l2uR
 C69u/onMkvwkz1cBsrpVFxRty4bjGK2G+a6kxwaJApHlOZ81JA7J7fKEi1/8C1KS
 UO3Fj1ZgQ77qk4UP2q96mKfFMnIkRI8A/RMfEi0CyaNqmThq0BU4SK361wCkMKtD
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=r8kganQMACnpTwhCNua7t0wdW1Szzoj5H7CTSvz4F
 p4=; b=KcQrn8PvXRIyWWBV6LQr8nl8z4PauGoMO3BfFAOmwCe4fOW2dDOfHN7Ej
 jjaWil8WIvBVEuTEgq1jqgyblA+KRHGS5X6+f9au8AfXZ3X75rp0qt1H5L/7JnGr
 AY5nOvq55QHDatBZwMBneqL3NancCHX3RB5OxgLbfTm9m5MUfD0wYJRnltUd/CZw
 kcgurm4Ylc0NOEFPaKxVgpT4v54KofcuQt/waxjeOlzuT8xbXVwHUV25OIcpQkwr
 wzejB/EjwK0rY0dN6tTgaMce494lRAi7XxVcuJjc1J+hRn7VVBNqm+QgxMnVyYKp
 ajCWQtSmUMIyUpQB10CDDbsq2oVgQ==
X-ME-Sender: <xms:KyI8YBmPNdtnjbhzooGFSeEqusAXBRpBFgoUYSUYwvPFG68bEgCMyg>
 <xme:KyI8YM1_YFVz-R0xI2HsZ-gyH5SzE_ZVEGajBEQlfEIr9ibYWC6Idxq1o2vrJR4Bw
 SNLjPkfcX8pT9VqaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleejgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepvdegkeehgeefvdfhteehhfduteetgeeugefgieeigeeuheekudegtdek
 gfelgfehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:KyI8YHrwRJuyV91b-_wguahDHjyIkzPFITXV1cZY3X26aQT6sArRbA>
 <xmx:KyI8YBlsw81cI_ciF-hKFI7AOe0k5-UaeTIov3ZoPYFwZraWG6lK-A>
 <xmx:KyI8YP1Ao8DvjT6CXOjBpHhBw7FhaLbOUvORkaNCAF0QCCP5Hh2vtw>
 <xmx:LSI8YP9xS0EDPfuM6hQWpTPj9tDRsmccUD4zLUz7CNu_xasHPcHXAw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E856EA00064; Sun, 28 Feb 2021 18:07:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <10a65ca0-0f6a-46be-a292-d37647e03a7f@www.fastmail.com>
In-Reply-To: <1681fdc1-2c9d-db2c-a872-c0ff156e07c4@amsat.org>
References: <20210226065758.547824-1-andrew@aj.id.au>
 <20210226065758.547824-2-andrew@aj.id.au>
 <1681fdc1-2c9d-db2c-a872-c0ff156e07c4@amsat.org>
Date: Mon, 01 Mar 2021 09:37:01 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org
Subject: =?UTF-8?Q?Re:_[PATCH_1/4]_arm:_ast2600:_Force_a_multiple_of_32_of_IRQs_f?=
 =?UTF-8?Q?or_the_GIC?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.26; envelope-from=andrew@aj.id.au;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Corey Minyard <minyard@acm.org>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Fri, 26 Feb 2021, at 19:26, Philippe Mathieu-Daud=C3=A9 wrote:
> On 2/26/21 7:57 AM, Andrew Jeffery wrote:
> > This appears to be a requirement of the GIC model.
>=20
> If so this should be adjusted in the GIC or a15mp_priv_realize(),
> not in each caller, isn't it?
>=20

Maybe, let me look into it. I'll clean it up in v2 if it makes sense.

Cheers,

Andrew

