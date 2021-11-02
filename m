Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD3244388B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 23:36:57 +0100 (CET)
Received: from localhost ([::1]:60144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2Ol-0006Jf-Td
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 18:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1mi2NS-0005Ro-Fz; Tue, 02 Nov 2021 18:35:34 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:39481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1mi2NQ-0003Fo-Fq; Tue, 02 Nov 2021 18:35:34 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id C85E35C00E8;
 Tue,  2 Nov 2021 18:35:29 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 02 Nov 2021 18:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=tVKcx
 UieixHcpss2NytjUuobSlajEkYAIZQS2oH2Q64=; b=GGxhvNmDY6UCHOIP7whDR
 fvqta9KHQHHSohZuNxHEQGyX3MzeeUnhxhRhYEvS6KcRF/iEkoMk8n7TJHgqATht
 m97e+Fo7gorRgiOU4C4TBwntC+vo7PIx26yQp51JrijZoQXqsMcwNnD6CTbE8n+B
 xhb2w9EtTgaApgqlDvBznf3ILXU+v5h+6wyPAyNk3egN7D6uWREDHUBb9De5jVRi
 nyGaUOUX8gA046L+b0wkKVwK7Fs3Jo1LWAXL86fbwF6HOSABH0UNMNOI+awQRhCi
 YCjvj7Q6xWxUFlcPpxvGzejqIsq9fXiq5jGwmd3Wrv5bylPAEt4X4ja58k8CxxNE
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=tVKcxUieixHcpss2NytjUuobSlajEkYAIZQS2oH2Q
 64=; b=cBKCOTTGaoeMNr9ThOJev4eE/irdQofQ+slA8fIR7enUw8LKdDkEeFITR
 BZkVLp945CXNug4SOwWHLFMmQXRk8vmF70EsY8c9EznyMd+peaECEhOng8Frrg/g
 n+rIkg9nSKYbUyTpOy3QgylnV2qb5zeKuIVpV1vhaXqW83JK3k9fW6bHzCZFglG1
 +Ikni3M75H2Po15YUl9MsmhINayw1w4nRz27yPsHOylVXG3uMgJuRDWBadhtKovV
 Htu2u1JuXw72d7Z1d5Kci03NUCLegepQhLRoQRQnC0G57rMUYXiUIuob9KYp9qV5
 DD/HhEI1oN8SqKfTn2JFO0kyDPd5g==
X-ME-Sender: <xms:Mb2BYdoOFOVIPHb6yjL2XZkpFkABic8dx-hBedaplkygSLxlRsPp1w>
 <xme:Mb2BYfpK0JOJgNUfkV7ZvlgahysE7HmzJGnarvY6mrl9xH1FysHoTCRO7YTFwYrfl
 DeaS4_315_BfTekcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgddufeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedvgeekheegfedvhfethefhudetteegueeggfeiieegueehkedugedt
 kefglefgheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Mb2BYaPg5PTQgo5r66hqF3R_mUX4Kdayu-ToP0h0DXt4kr_2qjgdQQ>
 <xmx:Mb2BYY6DbZwZ8w3ZPk_gMG9r3d28ThCnsY8jN9eCzNCQDylrA1sPgA>
 <xmx:Mb2BYc5b_qUp16883_AFsXcJRcH5ibKwsyRFlEnAKpanXvry22gQhA>
 <xmx:Mb2BYcHUX1TXxCQ7E1yZZ7aMTbvpNAdh8LQs8y6Wrqr9ieiM4KOzkA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 98B71AC0DD1; Tue,  2 Nov 2021 18:35:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <c97b0423-a5bb-4ca0-ab79-14120223f368@www.fastmail.com>
In-Reply-To: <CAFEAcA__8Rmrie2FSf+WOs987wZf4pa8rC5JXuyMA3WBQVe=Bw@mail.gmail.com>
References: <20211101183146.684471-1-clg@kaod.org>
 <CAFEAcA__8Rmrie2FSf+WOs987wZf4pa8rC5JXuyMA3WBQVe=Bw@mail.gmail.com>
Date: Wed, 03 Nov 2021 09:05:08 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Peter Maydell" <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH] MAINTAINERS: Change status to Odd Fixes
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.27; envelope-from=andrew@aj.id.au;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Cameron Esfahani via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 3 Nov 2021, at 02:48, Peter Maydell wrote:
> On Mon, 1 Nov 2021 at 18:31, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>
>> I haven't done any Aspeed development for a couple of years now and
>> maintaining the Aspeed QEMU machines has been a side project since.
>> I don't have time anymore.
>
> Thanks for the work you've done on this over the years.

Second this!

>
> I guess this means I should start picking up aspeed-related
> patches into the target-arm queue again ?

I'd struggle taking it on - my qemu development is pretty sporadic and=20
hackish at best and my patches need the review. Unless Joel wants to=20
take the role I think it would be best if our patches went via=20
target-arm again.

A general thanks for your help here too Peter :)

Andrew

