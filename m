Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEDA5F479F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 18:32:13 +0200 (CEST)
Received: from localhost ([::1]:45042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofkq5-0006Ka-0F
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 12:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@simonsafar.com>)
 id 1ofkOw-0000Lw-8W
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 12:04:15 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:58109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@simonsafar.com>)
 id 1ofkOt-0003Po-Mg
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 12:04:09 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B307E3200893;
 Tue,  4 Oct 2022 12:04:03 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
 by compute4.internal (MEProxy); Tue, 04 Oct 2022 12:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonsafar.com;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1664899443; x=1664985843; bh=uX
 mYbb2kPXLk96Az4pyoG+UN0a4Ms5LwYyPIoDy0yPE=; b=bffDAGKTqwVD29lr/a
 mck+Xa04PErc8KLK5v6dMLdm1mGvcLZ/XIvlATrmWMrYA6+6h58aGqhqkwC6aolW
 kyrpx2khQCW6TLrxNe2kipHnN613m1FUSz1wzkdzPhh1lrbAFZgVgVcFk4mbXD/k
 zuJl9C2z+Vt5YYt4CODocc8cD2BbXoKZNQoAEvwmpFv/+dV93Yc5AOE30ZQSDQeI
 5jEwQCvvta64OOacy82K2ShYJvTBmycv5U3GBgKMy0sjekEFzOJh8V8fI8cpZJqg
 6jf9nSQAtVbGGEbCP2ZJjcl8Fjf4Z89/q/6R5X3xBRMCTQagLXrJxbHht+DMSThm
 K5FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1664899443; x=1664985843; bh=uXmYbb2kPXLk96Az4pyoG+UN0a4M
 s5LwYyPIoDy0yPE=; b=Y/zVadcc7oFOtp0icVOoKG8BqBvsWU4zxbKL1Yv/hUtm
 DvqIafqxAdCpd8fpfhbfSjNkcDGhmcXQMraC7CUfOJwEoLwm1GafnirHZwi4B63C
 61tDQZtIn9tunieZGkcppAXTtMnUammEslRxMAm9PlfH0+IXBx6hRE99qD5U5R7N
 jKUYMcm6ix/Jvhqm0blKV1vh+ef4crAXgffl7nVV6yydovkawzTpghWbYjyEMPnW
 oD9DOXA9MvoP7DeKsFFiWMbb44qe/feszuYTYBvpevhOxJjms0r1dN0rvU3dr5NC
 J72m6duH0/7g9hmvaKaf9WIFxIkAEAOt1j+M6QddZA==
X-ME-Sender: <xms:clk8Y9fpWWvxBHp5lORTh1fkl2eoWp3eSTZwhiHt1sUteAfUzz_QQQ>
 <xme:clk8Y7PWicloo57ANjbGRjhB2KrfkcfCuS8kFDi1hcS5MS9RR1TEAPVbq-JtFUT7d
 pwcgxKAtZgWdn4OIUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeiuddgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsegrtderreerreejnecuhfhrohhmpedfufhi
 mhhonhcuufgrfhgrrhdfuceoshhimhhonhesshhimhhonhhsrghfrghrrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpedvheejlefhffejtdekjedtvddtgeehjedvieehfefffedvteeh
 tefggeeiveejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehsihhmohhnsehsihhmohhnshgrfhgrrhdrtghomh
X-ME-Proxy: <xmx:clk8Y2iU-cS9KSjx_9PZv62xr223731mnTrtvVT37HKpuIV9aEvriA>
 <xmx:clk8Y28MXV5hRaNDtueMZl8oMnwOG6F9q61u82QZhVd1RfUX79T5Zw>
 <xmx:clk8Y5vJYbtoDQq_POI7S9Cl3_qZWxqT8N3nwRXhvwdwcYWzTOfE9Q>
 <xmx:c1k8Y33WrZqm_JBxIxk2xGj_1HKE82gB9HOUuwGV3128oonMJawKIg>
Feedback-ID: i4ed14706:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AF3511700083; Tue,  4 Oct 2022 12:04:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1015-gaf7d526680-fm-20220929.001-gaf7d5266
Mime-Version: 1.0
Message-Id: <b8e5aeb0-3181-4645-80d5-365c78f85945@app.fastmail.com>
In-Reply-To: <20221004130138.2299307-53-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
 <20221004130138.2299307-53-alex.bennee@linaro.org>
Date: Tue, 04 Oct 2022 09:06:48 -0700
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Cc: stefanha@redhat.com
Subject: Re: [PULL 52/54] contrib/gitdm: add Simon to individual contributors
Content-Type: multipart/alternative; boundary=e2d7f4d92321499586c0fbd80c06e0ab
Received-SPF: pass client-ip=64.147.123.24; envelope-from=simon@simonsafar.com;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "Simon Safar" <simon@simonsafar.com>
From:  "Simon Safar" via <qemu-devel@nongnu.org>

--e2d7f4d92321499586c0fbd80c06e0ab
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 4, 2022, at 6:01 AM, Alex Benn=C3=A9e wrote:
> Please confirm this is the correct mapping for you.

Looks good to me, thank you!!!

> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Simon Safar <simon@simonsafar.com>
> Message-Id: <20220926134609.3301945-2-alex.bennee@linaro.org>
>=20
> diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group=
-map-individuals
> index e19d79626c..53883cc526 100644
> --- a/contrib/gitdm/group-map-individuals
> +++ b/contrib/gitdm/group-map-individuals
> @@ -36,3 +36,4 @@ chetan4windows@gmail.com
>  akihiko.odaki@gmail.com
>  paul@nowt.org
>  git@xen0n.name
> +simon@simonsafar.com
> --=20
> 2.34.1
>=20
>=20

--e2d7f4d92321499586c0fbd80c06e0ab
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>On Tue, Oct 4, =
2022, at 6:01 AM, Alex Benn=C3=A9e wrote:<br></div><blockquote type=3D"c=
ite" id=3D"qt" style=3D""><div>Please confirm this is the correct mappin=
g for you.<br></div></blockquote><div><br></div><div><div>Looks good to =
me, thank you!!!<br></div><div><br></div></div><blockquote type=3D"cite"=
 id=3D"qt" style=3D""><div>Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D=
"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt;<br></div>=
<div>Reviewed-by: Simon Safar &lt;<a href=3D"mailto:simon@simonsafar.com=
">simon@simonsafar.com</a>&gt;<br></div><div>Message-Id: &lt;<a href=3D"=
mailto:20220926134609.3301945-2-alex.bennee@linaro.org">20220926134609.3=
301945-2-alex.bennee@linaro.org</a>&gt;<br></div><div><br></div><div>dif=
f --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-=
individuals<br></div><div>index e19d79626c..53883cc526 100644<br></div><=
div>--- a/contrib/gitdm/group-map-individuals<br></div><div>+++ b/contri=
b/gitdm/group-map-individuals<br></div><div>@@ -36,3 +36,4 @@&nbsp;<a hr=
ef=3D"mailto:chetan4windows@gmail.com">chetan4windows@gmail.com</a><br><=
/div><div>&nbsp;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki=
@gmail.com</a><br></div><div>&nbsp;<a href=3D"mailto:paul@nowt.org">paul=
@nowt.org</a><br></div><div>&nbsp;<a href=3D"mailto:git@xen0n.name">git@=
xen0n.name</a><br></div><div>+<a href=3D"mailto:simon@simonsafar.com">si=
mon@simonsafar.com</a><br></div><div>--&nbsp;<br></div><div>2.34.1<br></=
div><div><br></div><div><br></div></blockquote><div><br></div></body></h=
tml>
--e2d7f4d92321499586c0fbd80c06e0ab--

