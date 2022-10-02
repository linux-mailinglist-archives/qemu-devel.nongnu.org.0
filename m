Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92095F2729
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 01:14:54 +0200 (CEST)
Received: from localhost ([::1]:48508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1of8Af-0003xG-IG
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 19:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@simonsafar.com>)
 id 1of89M-0002c4-UG
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 19:13:33 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:51113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@simonsafar.com>)
 id 1of89K-00020v-GV
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 19:13:32 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1DAF75C0058;
 Sun,  2 Oct 2022 19:13:27 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
 by compute4.internal (MEProxy); Sun, 02 Oct 2022 19:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonsafar.com;
 h=cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1664752407; x=
 1664838807; bh=MH0CTP0Eaic+1a+3r9dplazd6HxTYNnXVstwtnrX7JA=; b=l
 ArqP8vWIMIc0BKdaPZ66ngLyI9mnXAPNLGKfcj6uRKe2T0XDvS+ImrjZ6dyI5XiK
 I/a7wnbwlAEhZ9OoGo+L/d4XxQDzQYVbocy964SbhKT/d3NvVO0brXBnc0GntN5U
 BRCuh7ccsOzoxtPJYVgSr9h9n6jliuv/ppnlcUzFSYfAXT/fSNeAha4TIc4JMWGM
 EI2MJL19S1kUBTh2X9GBqHcNzP9M8X8UdGlzhQ6SXATgQQf8SOcohJt3748clCUq
 Fzt0Z1ebls2osJbO5mLEcUsm6eew/SDTA8bFGZ6tkJd/TDECcLjt9ABLHD4rKwIx
 KM/bfq40oVE14VaOrzh4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:feedback-id:feedback-id:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; t=1664752407; x=1664838807; bh=M
 H0CTP0Eaic+1a+3r9dplazd6HxTYNnXVstwtnrX7JA=; b=NldMhzgWU7mZlVev3
 ZCpbVfWv1wzYyz5fLl2kHOcud+w9RoVDcOEjpxVKqLHlxMl3Id8VwtiWzoTTsGXj
 TEUu6i08bIq/lKZ9f5NAWfac1VPwUmnCE4gvDPs/VI4/Njr6jxFeKxMnltvM9kBD
 vTKXZWl8I1CU2CDlIBI5PDjRtQvuu7qwCNxuSGVNdmkweHTZVnfxsxM1kEjaOPyp
 E/rIYEZeA0HRZRvj5msdZUloHQsFvNXrCHt/jhKkpITpbnMPJZ4BcOuKQxYEIp1P
 dbVRefnIV8aRzKtf5A/9gpCDyVJYAEktJEcmmgZsa4FxoRpKLHdXKBaeu00qCvoV
 Rfk4w==
X-ME-Sender: <xms:Fhs6Y85z4e6JoLe-pVpWmRXj8NKMRi5z4qohg91Kw9Lh5LFYIstczw>
 <xme:Fhs6Y95-5_GTwY6FnPzb9i1No5vrvDP3pxGYtaYq2oM8lP7rokIqlwB82w2bff78V
 dCr5uz3hW2KT59uwhk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehkedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedfufhi
 mhhonhcuufgrfhgrrhdfuceoshhimhhonhesshhimhhonhhsrghfrghrrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeffieeifeelheffvdfhffdvgedvgffgvdfhveeihfetffdvtddu
 geeutdfhheegheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehsihhmohhnsehsihhmohhnshgrfhgrrhdrtghomh
X-ME-Proxy: <xmx:Fhs6Y7fQlGvSgypgKFUr5aEHvDmquH5AX4HU-AMMBxPkA0z-jjuNmA>
 <xmx:Fhs6YxK0eOG1ffnIjKAV22zwbOz-3iwGR-ZXEyYctHEv1xl1_f9ayA>
 <xmx:Fhs6YwKcCEunhzHfpl82c7cnZ33Fyxuv2Y-_QlhI8JkF59qYKReGtA>
 <xmx:Fxs6Y3lvfZ7YaAMig2lUaz5gT6VhXEZv6QT0SfBjebnkhuCnLhPzKg>
Feedback-ID: i4ed14706:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D039E1700086; Sun,  2 Oct 2022 19:13:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-968-g04df58079d-fm-20220921.001-g04df5807
Mime-Version: 1.0
Message-Id: <5e956bc4-12f2-43f1-973d-494cd9f5f647@app.fastmail.com>
In-Reply-To: <20220926134609.3301945-2-alex.bennee@linaro.org>
References: <20220926134609.3301945-1-alex.bennee@linaro.org>
 <20220926134609.3301945-2-alex.bennee@linaro.org>
Date: Sun, 02 Oct 2022 16:13:04 -0700
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 1/7] contrib/gitdm: add Simon to individual contributors
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.25; envelope-from=simon@simonsafar.com;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  "Simon Safar" <simon@simonsafar.com>
From:  "Simon Safar" via <qemu-devel@nongnu.org>

Hi Alex,

On Mon, Sep 26, 2022, at 6:46 AM, Alex Benn=C3=A9e wrote:
> Please confirm this is the correct mapping for you.

it's the correct mapping, thanks for adding it! (... & sorry for the mul=
ti-day latency!)

Reviewed-by: Simon Safar <simon@simonsafar.com>

>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Simon Safar <simon@simonsafar.com>
> ---
> contrib/gitdm/group-map-individuals | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group=
-map-individuals
> index f816aa8770..d5b05041bc 100644
> --- a/contrib/gitdm/group-map-individuals
> +++ b/contrib/gitdm/group-map-individuals
> @@ -34,3 +34,4 @@ bmeng.cn@gmail.com
>  liq3ea@gmail.com
>  chetan4windows@gmail.com
>  akihiko.odaki@gmail.com
> +simon@simonsafar.com
> --=20
> 2.34.1
>=20
>=20

