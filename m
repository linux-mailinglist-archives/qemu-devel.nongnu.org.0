Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4097C33AEE6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:34:02 +0100 (CET)
Received: from localhost ([::1]:51168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjbt-0005FC-74
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@knazarov.com>) id 1lLjS2-0001EK-6x
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:23:51 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:60989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@knazarov.com>) id 1lLjRz-0004Bg-FF
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:23:49 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5F8A15C00BD;
 Mon, 15 Mar 2021 05:23:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 15 Mar 2021 05:23:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=knazarov.com; h=
 content-type:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to; s=fm2; bh=T
 xYC+IPlc4XufW4J5g4zClc4PsnK87U/FonoRvavM7g=; b=JbSEDmRhy6PF/iAYS
 /F7qdNOdxRCmf5fVDHL6HJbOPzT17wpXnTQX7OX1Oj1N1Ec4hSxVMb4lOgdhwYf0
 HYs+avM36ABGAdtl5sb0Kx++3xh6xhndlC5QY4awp24/eGt58zFBIheS3m6kcHEI
 HlYiCuCPgBOpaeHm3ZBWaLTOW+10Lyb6mpKRN2TP8mIBxg9ZIruQKWOuEVTJAwmE
 lzKTHAO2EfPFRbT24zkEfXkXWAxSKH7fKexDfF1+p3v0jmY+D2gyAK0OjCaCUDs2
 dWMZi5rAdhcoYFob5R6KHRDL6dhHG7zJc3GGmq0ZHMH8y/WrSLPdOrFADjtchb+2
 GSCFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=TxYC+IPlc4XufW4J5g4zClc4PsnK87U/FonoRvavM
 7g=; b=JN+rxgxHN4MY3Ini65HkDahz5jUw75i8m26JkBcSwWaVg12bPZV6g6jNP
 jtWjaGEr1GZae62rHb37uQw/wWBlKJLM+0mbKz++43C19M/NN6uyTvVedhuHpYDm
 +T9FoI1btAoNcXeYH3setI4J6emAE/+wgNfatli8uk48LVcTc1dx4ZOHNJtY6oh6
 y5mHSMqcqj71S2mGsOoLPlYTU17tOucQd3Q/c6HRwmHepivb2Mg3nRsrY2outAJ9
 yvnUEieMdoWxJ1IVl2zMx8d7pvGdGg1a+a/kMHF1VHeqiA2Unu7dpTKUaNuFPKTK
 9eiViHRBYwNWnHQHaEh4sfl+i+HGg==
X-ME-Sender: <xms:oSdPYF85FIqvxmLHXN63xqmHrLjuZoA-n1D2VleVwikP93K_u0u-WQ>
 <xme:oSdPYJvjsYP98zpnwuNuc-RIWoa6q4IVja1U1kDqkC3IH_g8uzja3HZW-dwSiBDaL
 jup485XtjR-gIuaHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvledgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffgffkfhfvofesthhqmhdthhdtvdenucfhrhhomhepfdhmrghi
 lheskhhnrgiirghrohhvrdgtohhmfdcuoehmrghilheskhhnrgiirghrohhvrdgtohhmqe
 enucggtffrrghtthgvrhhnpeevheeigfduheeuuedthfdtuddvtdegvdeikeeugeejvdeu
 vdekleffvdejleeufeenucfkphepuddtledrvdehvddruddtjedrleenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghilheskhhnrgiirghr
 ohhvrdgtohhm
X-ME-Proxy: <xmx:oSdPYDCDfxkL2ZUgT-me72L55HJgLL_7JaKi29Yk_nm_JrTxSlYTrg>
 <xmx:oSdPYJdnS0AhxYaqxZI7UO3i8GUBRxrww84QoN2i-u0Rjjzq8_Qo0A>
 <xmx:oSdPYKOJpMz8jVZH5sVEw59lhwVzS9q_FWjsUxaFRUsYpnvA6nPvkA>
 <xmx:oSdPYEXWJ2ocjFLlUVRzM_UousKoeGoVYrN8qNv0k2ghVP85gyLGMQ>
Received: from pin.lan (unknown [109.252.107.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 90F2024005D;
 Mon, 15 Mar 2021 05:23:44 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2] edid: add support for DisplayID extension (5k
 resolution)
From: "mail@knazarov.com" <mail@knazarov.com>
In-Reply-To: <20210315074438.ijtuet4vkra7o56d@sirius.home.kraxel.org>
Date: Mon, 15 Mar 2021 12:23:42 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <66F7AD6F-31FF-44B3-A5B4-3F9E646D7031@knazarov.com>
References: <20210314091236.44313-1-mail@knazarov.com>
 <20210315074438.ijtuet4vkra7o56d@sirius.home.kraxel.org>
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Received-SPF: pass client-ip=66.111.4.27; envelope-from=mail@knazarov.com;
 helo=out3-smtp.messagingengine.com
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The change to edid_checksum is needed because the DisplayID section has =
another checksum inside for the actually used part of its 128-byte =
extension block. The checksum in this case uses the same algorithm, but =
for a shorter block. Thus I added a parameter to specify the size of the =
block.

I'll address the rest of your comments in a 3-rd version of this patch.

> On 15 Mar 2021, at 10:44, Gerd Hoffmann <kraxel@redhat.com> wrote:
>=20
>> +typedef struct Timings {
>=20
>> +static void generate_timings(Timings *timings, uint32_t =
refresh_rate,
>> +                             uint32_t xres, uint32_t yres)
>=20
> Adding these should be splitted to a separate patch.
>=20
>> -static void edid_checksum(uint8_t *edid)
>> +static void edid_checksum(uint8_t *edid, size_t len)
>=20
> Why this change?  Also a good candidate for a separate patch.
>=20
>> +    if (size >=3D 384) {
>> +        did =3D edid + 256;
>=20
> "if (size >=3D 384 && large_screen)" ?
> Also setting did should be next to setting dta.
>=20
>=20
>       if (did) {
>> +        dummy_displayid(did);
>=20
> init_displayid() ?
>=20
> Especially if we generate that only in case we actually have a large
> screen so we never have an empty extension section?
>=20
> take care,
>  Gerd
>=20


