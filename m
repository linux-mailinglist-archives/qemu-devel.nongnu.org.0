Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF397595AA8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 13:51:18 +0200 (CEST)
Received: from localhost ([::1]:60110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNv6L-0005Kp-Dn
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 07:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oNv25-0002Cd-AY
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 07:46:54 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:34909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oNv23-00049u-Az
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 07:46:52 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 0DA4F5C02D4;
 Tue, 16 Aug 2022 07:46:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 16 Aug 2022 07:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1660650409; x=
 1660736809; bh=lc23NTEwDklnsseSjdWQuzZESt++WQ0qCaV24peKn/4=; b=z
 BVNa4WyiL/tV1vXwCPet6nJXRQ6S74eYtPFIjUpmcO5JiPn0LjoImSDEzHtGX2pR
 A47iQPvcJ4oXKeguMPJWj54UqBu8wmPGcRgdS/ZEW1+mVcVgoG54rVfZsy11jEny
 y8M6SYfO4jBZKf1jjO5cjEHRDM5FSzc6y8kh4lWPtIGjCCnmzpNpdpgSwmkMfN6F
 G1eKCV4CPdgAm0AGRchGeiC93AHu+0dk9Yp35vPrN7lmGq2Xr0lz7Q/TcM2KVK+6
 pSTWXf7jO24cQ/EVMhSe/YpHNAaBw6Mw0rWFwQbqXMW13yRSENMULRW6oiDCK8lC
 jNnD0jCqgMWXWyq6TfDtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660650409; x=
 1660736809; bh=lc23NTEwDklnsseSjdWQuzZESt++WQ0qCaV24peKn/4=; b=s
 J3YJbOzXcfJ39hjIz6HZmAgaP03VUSFMtkP1/1miNx9uQG3qS5DUiC1BFudxzpRQ
 FAu8mW2VA1eESRKUnD2c+DebtzoVxO162l6KotAh1Pn+4j4qUZmw4Y11YuCMEIgA
 Gl6JEtqdzhQoeh+vFci6yATTo13NWZ9eCJ56MlJnRsh+pSPwksXFzzWJyJEDHWIy
 JzSV2RyQi9K3eKSNCXH7970VvAVjrUyHCkeOLS7f8HCCbbcl1uj/DPq82QJxwO1m
 lCYOOgcQNmC49BvIkK19G5yBDiaTPUnxBiXdtCEvCOE+AUo8RWrcMv2d/i1OKKX3
 G4fvBbmpOzo1uJkeJT5Xg==
X-ME-Sender: <xms:qIP7YgKwOJch9Yk_i0iQ58mJoVw7d3BEhbgRhMST1BsyXuq9Jt7rSg>
 <xme:qIP7YgLZEpfKxNZNSb-9thw2FlqCm2C8XK04XxFdgoYbbUzvaOrjlOLf3IArHpa5Q
 ocdJfeMAPTCKqQrGtI>
X-ME-Received: <xmr:qIP7YguKNgObR8VEJGBKYXUFJTXQUNSYlc-X0yvZ_-RRaj1a2Fe-FEvfgbawfEK89NR73GnlIW0-xmeO5bLMXDfpTON8xZrH-x5utRKm_rgKfoecag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
 ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:qIP7YtYURm-XtlSQ6aVsaHFVUCauvT_nJLTSw5KRRMHt3UJO807C9Q>
 <xmx:qIP7YnbnGl3ZaQm2ataHbkU0FtD1z2LXSOY83bDoJFAaWb2c1jAiRg>
 <xmx:qIP7YpAtFwbH5mCwH2wIrqRs14CK6NEdQS91TLC6kh8Dnu-1vosinA>
 <xmx:qYP7YmktEzEhdN2R-2XBovqx7iSbRm-POd6jB5J5a7nUGT0XNMQYQg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:46:47 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 2/2] hw/mips/boston: Pack fdt in fdt filter
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <277f1180-02f4-9372-2493-1954a250e35f@amsat.org>
Date: Tue, 16 Aug 2022 12:46:46 +0100
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair@alistair23.me>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BEA08D52-2865-4F4F-8E65-512FF86F1F56@flygoat.com>
References: <20220813162720.60008-1-jiaxun.yang@flygoat.com>
 <20220813162720.60008-3-jiaxun.yang@flygoat.com>
 <277f1180-02f4-9372-2493-1954a250e35f@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
Received-SPF: pass client-ip=66.111.4.27; envelope-from=jiaxun.yang@flygoat.com;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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



> 2022=E5=B9=B48=E6=9C=8816=E6=97=A5 01:44=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <f4bug@amsat.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On 13/8/22 18:27, Jiaxun Yang wrote:
>> FDT can be awfully fat after series of modifications in fdt
>> filter. Just pack it up before add to ram.
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  hw/mips/boston.c | 1 +
>>  1 file changed, 1 insertion(+)
>> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
>> index 5145179951..a40f193f78 100644
>> --- a/hw/mips/boston.c
>> +++ b/hw/mips/boston.c
>> @@ -400,6 +400,7 @@ static const void *boston_fdt_filter(void =
*opaque, const void *fdt_orig,
>>                          1, boston_memmap[BOSTON_HIGHDDR].base + =
ram_low_sz,
>>                          1, ram_high_sz);
>>  +    fdt_pack(fdt);
>>      fdt =3D g_realloc(fdt, fdt_totalsize(fdt));
>>      qemu_fdt_dumpdtb(fdt, fdt_sz);
>> =20
>=20
> Why not pack by default in qemu_fdt_dumpdtb()?

qemu_fdt_dumpdtb() is explicitly a function for debugging purpose.
Donno if it=E2=80=99s wise to hijack it.

Thanks.
---
Jiaxun Yang


