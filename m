Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20158331C0F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 02:09:24 +0100 (CET)
Received: from localhost ([::1]:40746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJQsF-0002fP-3D
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 20:09:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lJQqq-00026V-9h; Mon, 08 Mar 2021 20:07:56 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lJQqm-0007sn-FS; Mon, 08 Mar 2021 20:07:56 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6F0205C013B;
 Mon,  8 Mar 2021 20:07:51 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 08 Mar 2021 20:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=EvDoO
 ghknHUf6lHKt3IAKh/A2LF8LjobaXS0RQ2fIEg=; b=Jsqs/Tz1fPPHKCg0mcDRA
 CUg8JgH1c8u3NJb/k5p3iUgxvOI64uNnOY52uBwEoaFM2cPcBX+MCR623uH/Wd6d
 Y2knjqkHLsTHryYa30/9Y+Q+JGs4w8JtOJesQdt3/mDpRnzF/KSNwRyXGfI6kAho
 66ITrG9Lf+HVEenr0r098c2rY9+l7Z0QX2/qUP4Ojqe/geJJ1vK8VibM6cd8pGk8
 KdU4jCRquPw+1G2+xdyJHmiS9JKi3Qop6A+Z1gxwnQzw3gw3X/zGSMjbnDHOz/Qp
 fxgCpsdJ1fQzgisOVA0bVT03b7Llp766nOaoam1Q7tFuL+dUhsu0spO7jUoucpLW
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=EvDoOghknHUf6lHKt3IAKh/A2LF8LjobaXS0RQ2fI
 Eg=; b=CCeJsywaA3mBaZ7G7X197krihi2H5VIqhauySvNDQ5Vt6JJSEygElglRd
 PawWiuxIQnNHYaowRmqSzVxVhZdBwyZZP7oju4NxwDZPOtIFfMTUVgTdZwWjDzWw
 kWN/KpFnk+QFQG4d5t1ZZCRVFskNiGeHiUkhWakl/men68LjRYTrucZ9OMUDKHwp
 XA4H6wLsSJEXcE+Qr5bV2LPXTqUKvz2AyzemZplqjwmUAMxdpo8guXrOWhs2o5CD
 +FL+62fxGpD7st2ysDyAdFdNS151oXOg14S+X+/HlhOLN7UeWbFPZWq3PFQbOcO+
 azzF5g9VdtHlN/ZPQNpH8Z2MeCa7w==
X-ME-Sender: <xms:ZcpGYO8M01nNKmbq0FyWhFO3kNKOcB8XQiyWXfvOAnPf0hwnaR0Vaw>
 <xme:ZcpGYOtXxVJujxyd6DmyZsgZcGLwuhm4xymbBWb1vPrxLOJPJGBZgY3dC88T92RhH
 VjpzY71wGUnSbmkwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduhedgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedvgeekheegfedvhfethefhudetteegueeggfeiieegueehkedugedt
 kefglefgheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ZcpGYEDpB1mXhYhy5RB1uw1oFz5Lm0AI6vVUwVTZJWcB0NX9EWsM6A>
 <xmx:ZcpGYGc80c_WOLQMzuxbif7RvhI3DwIXnpxoaLgqPNnOB63XnpPAvQ>
 <xmx:ZcpGYDMGk7Ua5E9825nnvCW5ysFOGOj1joKzQXXWL17F9QLUafwoxg>
 <xmx:Z8pGYMaG9weac60HDG6ZBtaQxYcHcpaUwJOwbe2Ji2yPPJdO14OFMA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E09AAA00064; Mon,  8 Mar 2021 20:07:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <0bf5feb8-75bc-4205-ba60-66cfac701b19@www.fastmail.com>
In-Reply-To: <20210303070331.70744-3-joel@jms.id.au>
References: <20210303070331.70744-1-joel@jms.id.au>
 <20210303070331.70744-3-joel@jms.id.au>
Date: Tue, 09 Mar 2021 11:37:28 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH 2/2] aspeed: Integrate HACE
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.28; envelope-from=andrew@aj.id.au;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Cameron Esfahani via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 3 Mar 2021, at 17:33, Joel Stanley wrote:
> Add the hash and crypto engine model to the aspeed socs.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> [ clg: documentation update ]
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

