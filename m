Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB14D699C69
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:38:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSj89-0001S1-S8; Thu, 16 Feb 2023 13:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pSj87-0001RB-3S; Thu, 16 Feb 2023 13:37:15 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pSj84-0004sU-SF; Thu, 16 Feb 2023 13:37:14 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id A34FE3200956;
 Thu, 16 Feb 2023 13:37:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 16 Feb 2023 13:37:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defmacro.it; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1676572629; x=
 1676659029; bh=aggoNskOmrJJoaJya3eYtpM0CMBn3YBAKzXPBDaRZcw=; b=Q
 oKUy78uK34dB7IYaHCJP8VahR777P+19JJOe86bo5qQo4OoxixooD+1Sq3jdn5j9
 Xyc+CpI9gIBBFEG0LrezasfOkNApwJGN4P6Sz3KD3tbIXk213ZGMjx5WfTYy3Nz9
 DkjxL8i50lR8e52j4NJEERG7uNVCv3pzCr8xF5ZgPrIv5lUSDah0Kq8D4tOWQydw
 tSa7RmwMBiqZ42L3J7W/HPOw5YjTplXrBfEKbWNFXwrVh0aqWqkkUu7z4VRITPO7
 LV281IgFojLEFDs0Mv8e2oY8CxD9fP6MzpCHgEse5pgT+oA0TjjjR4RbqvL6mYKG
 RVTVbHjuqhBW8zgC6ypbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1676572629; x=
 1676659029; bh=aggoNskOmrJJoaJya3eYtpM0CMBn3YBAKzXPBDaRZcw=; b=h
 rLCHJrHu1hWEygfqpOTtOszrBLmFj8HHHjeE+UU72E05ihW8SNheD7pzKhW+KpmN
 dcgTCn1AaL1ZcYh09SUMYqu1AI/fr8yZYHk6smYCX+1x3Y8bxVoDichPq37QwrCk
 nTmafZLOV9NF4t2pqhLwxS7SPpBhYV8xvseqTSiEaYnoSPDiMeLBGezfMUPkNOCl
 kLAnDjSn+CNMXxhF5BwX8PZLifHy4i1zn+X/VnaYUNAu2UOFyWLRBDsbujqgelmD
 7CtnDUM3hzLNa8ZrBClarTn9sTm+omd2yyfwKlMUwnEE5ViSKJOgctcBllS5YHaG
 FDoI9ozcS6M4ycE00XaQw==
X-ME-Sender: <xms:03fuYyXr3oSewdDONhvmWkomtwo2I6YITR74CccH18HV1tO-v0jriQ>
 <xme:03fuY-l4P_58UUHeZrFYpHW0IhWkcLPQTx2DYBhME1n6hjQ_rlWT7GQ4BA-6rA4Aq
 wovmYiLaaITzoSHXpk>
X-ME-Received: <xmr:03fuY2Yp1MNBxMRDkj2qKHXT-SBjyRQpozOhYIePa59eNxF3eho_mLmMQ2A-UFElr3Lc-8JXru-k5leTSlvh7n30YbCbT88>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeijedguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpegtgffhggfufffkfhevjgfvofesthhqmhdthhdtjeenucfhrhhomheplfgv
 shhpvghrucffvghvrghnthhivghruceojhifugesuggvfhhmrggtrhhordhitheqnecugg
 ftrfgrthhtvghrnhepudeuledvvdeiffffleejgfeutefhheevgefgteffffevffevfeeh
 geefueeigfffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepjhifugesuggvfhhmrggtrhhordhith
X-ME-Proxy: <xmx:03fuY5WwcuHhSlszhD18s3dZy3wpFV0PxOUcb_uqw2EyMotMmre9JQ>
 <xmx:03fuY8nRGkS_Rgf6OQDAi5RYhg92gLo_E5bfkds1bzZmfZ6jZ9M1fA>
 <xmx:03fuY-eEGEzU8nH_4_-5MoM_NBwgrUoQELbNnCz6ZIKUqyWIXQv87A>
 <xmx:1XfuY5ggGSSKSC6s4IkSpB45erC9KeQxSS99rRGb-uxNVZ-oFHMfYA>
Feedback-ID: i0f41475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Feb 2023 13:37:07 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Jesper Devantier <jwd@defmacro.it>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 5/5] hw/nvme: flexible data placement emulation
Date: Thu, 16 Feb 2023 19:36:55 +0100
Message-Id: <04A002D2-3924-4FEB-BE4E-DBFE661E56E0@defmacro.it>
References: <Y+51P1zL47f2poWr@kbusch-mbp>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jesper Devantier <j.devantier@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
In-Reply-To: <Y+51P1zL47f2poWr@kbusch-mbp>
To: Keith Busch <kbusch@kernel.org>
X-Mailer: iPhone Mail (20B101)
Received-SPF: pass client-ip=64.147.123.24; envelope-from=jwd@defmacro.it;
 helo=wout1-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Correct. We deliberately allow enabling fdp as a startup parameter to side-s=
tep the need for NS mgmt.

You are also correct on the second point - the NS placement handle list can a=
t most hold 128 elements.

> On 16 Feb 2023, at 19.26, Keith Busch <kbusch@kernel.org> wrote:
>=20
> =EF=BB=BFThis mostly looks fine. I need to clarify some spec decisions, th=
ough.
>=20
> By default, FDP feature is disabled: "The default value of this Feature sh=
all
> be 0h." You can't change the value as long as namespaces exist within the
> group, so FDP requires NS Mgmt be supported if you're going to enable it. T=
he
> spec, however, doesn't seem to explicitly say that, and NS Mgmt isn't curr=
ently
> supported in this controller.
>=20
> We can look past that for this implementation to allow static settings eve=
n if
> that doesn't perfectly align with this feature (NS Mgmt is kind of difficu=
lt
> here). In order to match what the spec says is possible though, we can't h=
ave a
> namespace with more than 128 placement handles since that's the most you c=
an
> provide when you create the namespace.
>=20
> Does that make sense, or am I totally misunderstanding the details?


