Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3903FF1B0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:40:59 +0200 (CEST)
Received: from localhost ([::1]:36624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLplq-0004Zw-TC
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1mLpVF-0006TF-PP; Thu, 02 Sep 2021 12:23:49 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:47425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1mLpVB-0007yd-QX; Thu, 02 Sep 2021 12:23:49 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 0D41D32008C0;
 Thu,  2 Sep 2021 12:23:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 02 Sep 2021 12:23:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=hGGfyqsdsY0hFmiLf+l4BYmp4B2
 yD+FDTJMaszb8ZWM=; b=N44/e6/1mFcB1xIsCTvJF9G47VwfhKyWV8AqJvnIXuD
 wyZIaPX8mDwP295xYl9jJaes4PJyyoEy4ZVKNlCY9E8XyHWfn6TsCQqcQFstQcFb
 AeHK2JDgpenCacaYOvbk4/2DwWSB5V9xpY0CbROB0oR2d0bqpCtbh87izpv54GY1
 FAJyMzy/xoTDJW95M73Ce76FXJ+/Lch0LG/FcnIcnfe4UyK9M4wVNxyBVsf74kCl
 NGgax4PZSl3b+xfHxgi3AY4IaezRL6URx90/DL1IKgd1BN5wDWVZxbokb281OzoW
 1v8bIRRFBz3xjsb07X99vL0xdZgcahyThR6If9ir2dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hGGfyq
 sdsY0hFmiLf+l4BYmp4B2yD+FDTJMaszb8ZWM=; b=YT8Vxyb+LQHOKqfgS1CQOQ
 6NqMBbf2kPgxeHl4BUlrg+k5yjfhPgiFzwYevRygyoyZHaWz74eurp8+cjepef9A
 E4TtnGTDReWuK2+V9uXffzCU7NPEcpdyqD2RmmkzM6KniSnKSr+MlkJKfaVuhxhA
 m5890H4jEgg1gQ17nWdC87XQ+t/z8AaCZAivDXZ/nc3C++l3UX+7eITYBrwcUpxD
 srtXDZ09sC3XzVqM4tIyYFKVmi73qibuJWY2leaz/asaO2HA6qKm3yVJc4v1JYgh
 TqkPHqpffHF3Kg5YMqGqSuhVnoDIwxPow/JJL10jDDpqYzW+oc0cbnGrP2huq3XQ
 ==
X-ME-Sender: <xms:jfowYdYANO_pL3nHOccu8-WVptZUoj3oPjAfXkSt5G619BLE0XMd8g>
 <xme:jfowYUa7IjNxT7mQl8GbV0KgITx2otXavyrju-ePgj8GqazXiQafX2pjkOHkU06nA
 8KsQACvloxE7CI1HM0>
X-ME-Received: <xmr:jfowYf_48klKLvC7_1KggzD3iy9MMcBZ4nELFcK2gPf3TJa55IfAmZ0t27uktQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvhedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedtfeejteeutdefleefieeiveev
 keegueevtdevfeeivdfhieeuuefghfekledvhfenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:jfowYbqKILpKDJ78V4sEjrOtNZ9FTnr2YSurZPX2CvyYPBQXhu5byQ>
 <xmx:jfowYYrxOehH_z_O7S51EuzmHwryxqnk_rZ8akKIOwHaI29HHbq3uQ>
 <xmx:jfowYRRwzMeVomEEE8v7TbSseU1RQuIzpQSlFyNG8jVfG_URKUU9JA>
 <xmx:jvowYZdHm3B4ySG2p0X2qk4Ml4CAMhKn-Tf1VEJo7uqKRCRhetIJjw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Sep 2021 12:23:40 -0400 (EDT)
Date: Thu, 2 Sep 2021 11:23:36 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Add Fuji machine type
Message-ID: <YTD6iHrHqe5YAjyq@heinlein>
References: <20210901225946.500125-1-pdel@fb.com>
 <60994ebb-d345-cc40-020e-2c14ed438097@kaod.org>
 <0B35613A-4001-4E31-A522-ECF827CF1F8E@fb.com>
 <YTDx5fyuHmylObg8@heinlein>
 <73962d5d-ddf8-77b5-f4e0-7d3fad9abd71@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/j5wdqqQqYKV35Q5"
Content-Disposition: inline
In-Reply-To: <73962d5d-ddf8-77b5-f4e0-7d3fad9abd71@kaod.org>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=patrick@stwcx.xyz;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: 16
X-Spam_score: 1.6
X-Spam_bar: +
X-Spam_report: (1.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FROM_SUSPICIOUS_NTLD=0.499,
 PDS_OTHER_BAD_TLD=2, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Peter Delevoryas <pdel@fb.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/j5wdqqQqYKV35Q5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 02, 2021 at 06:19:53PM +0200, C=E9dric Le Goater wrote:
> On 9/2/21 5:46 PM, Patrick Williams wrote:
> > On Thu, Sep 02, 2021 at 03:12:12PM +0000, Peter Delevoryas wrote:
=20
> The pca954x muxes are supported and these devices :=20

Oh!  Is that support relatively new?  It was probably a year ago that I add=
ed
the Sonora Pass system.

--=20
Patrick Williams

--/j5wdqqQqYKV35Q5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEw+oQACgkQqwNHzC0A
wRne5w/4gEA9smVhSX9iiXcNUtK29ck5kSRr3CVkFdHf3WZ7PirH86qiWVVjvyVl
bJysIhyCPCbfZOcJMVkmkQErnXl/qa28Kwihkwd+cpYQhtt70+L+Jh94X1e9bPik
W/JzDLm7Eon5LVx/KW0nNkWiKSmDeaKmGwCedqnWP8NMcabnrNYVmtAt108unSa4
r8O/tTGcvWEPBNm0jDUI+4X1uM8aUjp0YEUwgqAARIvAiGG67egz+IQj5M3GKM5x
Z+rA6FuVSqAbagAqIL8hQysTnWZPahh8STYHjoopddB2m/Ctx5QQS3QD2BUIQfUs
mGmO96QsjWyFz4jEhkd+f+Q5MSxjFWo5Wz7n/pjbt1nZ306Q3p+Dv/X4W6QDFMAJ
GSdy0dISfgD0ppS6v2neXnCJqEiXITyCxJv7YgV4Zl7VE9C0j7JV9GsjKdPeeoWI
vCql35UtBli2EiE+1V6SXv84I0eJnWmw6s8jAHQidG5L9FvV0+dNNMjNOXw0e6kh
jINlkY0kLF/OTItrZNREkFgbvaOfWe8gg4pFpAdO6AywdWjEx9ZTfbnBg5NYL1vC
EldDyupcTx6PzZLyLPeOQg2Qy/Z1No0BrkdmoI0xI8srUbraypycD/ze/eLBACGH
36rjsuHyfghP+8NqXWR2qJh8932ctcFgrKwcQGBfIZIU3vHurg==
=mBHh
-----END PGP SIGNATURE-----

--/j5wdqqQqYKV35Q5--

