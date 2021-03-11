Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B3F33693C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:51:06 +0100 (CET)
Received: from localhost ([::1]:35360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9Xd-0000rQ-7s
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1lK9Vh-0007u3-75
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:49:05 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:33215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1lK9Vf-00046V-HJ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:49:05 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id F1724580E76;
 Wed, 10 Mar 2021 19:48:57 -0500 (EST)
Received: from imap1 ([10.202.2.51])
 by compute2.internal (MEProxy); Wed, 10 Mar 2021 19:48:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=WoUgN
 vmu12jCEEoKvmDv98x1aFyjdlskZJ5ObvwMYTk=; b=t925w/LHa/oqskGb0aMy/
 IMCgdFXZsy8lPlxy8kZ+r00vLR2Vo+RoRleKO1d/SzpbOrBHnJpJl0ZOTaaGaooo
 nR2tgu05LcbLEjZkCZQs5e4WK14kSuUjh1El2JJIIroxWdVGOfMVS/ubaROeDeJk
 i/iTCP4m4U+b2NrU0WnHGNOkey+nRv3AW4+53ESdtR8Tzkoi5ur+Z9H8crLYHv++
 Wi1uJQyFSelCACGtCThf2lw5pB9DnJ+Bbv7wHHYKNqasV4dUDLfelI3L5ugxCr4H
 iB7abk8A/StJXIVg+WOOjKEH1LshyvPvu+O3MLG4Z7+2OBfipsexnj4KZlv++XCR
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=WoUgNvmu12jCEEoKvmDv98x1aFyjdlskZJ5ObvwMY
 Tk=; b=r0NQu0rULuVXXmBoPaJ2DSJNFd3wsEWVN2TQ7zMBxJUp1ODXzsh3/32Yi
 wGhl6/fjfko5Ff5vWnm+hvsJ8bNdpHKJTR2/AeeyHW83u5myJUi9w9TQMn7CDSv8
 l6BWoQ3m2L7Jwxh5alIq+bFkf5qf2NjZ4Zk9DO+1pc22xa0LdvZYKq8GNff7xrEA
 RwxidZuk+HlsXop7kN618z+WONnzk8cafE2joh+tv2B5Vyw8HpvICV/G8dzNUKzi
 b912JYAD8ibqvyDqr1aK+kE7tvFRVSMBAMo0bonj++zdy1+Cmt66oDAhyjIKyyDw
 2Cey3n6MBbA/R34BhY4PkWG/k71FQ==
X-ME-Sender: <xms:-GhJYKxMe4xVSPMJUUGGKzVNge2Vm8cwxTg8QCRo1ct2Te-Mt80Ieg>
 <xme:-GhJYGRJ6LWgr-89fuDXuOSdlyxZdyGSWNxKypvgCUrOAzEfC8LNTLz2WR7po52dt
 neMHIjERNqY0PIGljk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
 rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
 eqnecuggftrfgrthhtvghrnhepfffhudevfeeuvedtueegieejvdekudeuffekgeejkeek
 feeggeejkeekkeeijeehnecuffhomhgrihhnpehvihhrthhurghllhihfhhunhdrtghomh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgr
 gihunhgphigrnhhgodhmvghsmhhtphhouhhtghhoihhnghdqjhhirgiguhhnrdihrghngh
 eppehflhihghhorghtrdgtohhmsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:-GhJYMVvZ30K3AM0_pEYzS8JpdeJfGyR_7L_YN_iVWPcKXPnjFCqiA>
 <xmx:-GhJYAgB9XduN4dwPIqYW9Hx8Ok5fdLpehlfJ6_F750wJ4MeX3T1gw>
 <xmx:-GhJYMBk4lHjpPxUngRD2jdw2D7sooEzALQYx58qUpmygBB1BnnI0A>
 <xmx:-WhJYMtz7PPhgaZnqs3z1DMVnBfXIPFb3-4dbFqikvSS-NobD6hasA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 78E31130005E; Wed, 10 Mar 2021 19:48:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <25887538-808a-4839-a9f6-3466c2f1783e@www.fastmail.com>
In-Reply-To: <20210310191255.1229848-1-f4bug@amsat.org>
References: <f776956e-dd3b-98f8-4b99-0cd234d227c0@amsat.org>
 <20210310191255.1229848-1-f4bug@amsat.org>
Date: Thu, 11 Mar 2021 08:48:35 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Peter Xu" <peterx@redhat.com>, "BALATON Zoltan via" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/2] hw/mips/jazz: Use generic I/O bus via get_system_io()
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.221;
 envelope-from=jiaxun.yang@flygoat.com; helo=new1-smtp.messagingengine.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, Mar 11, 2021, at 3:12 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> No need to create a local ISA I/O MemoryRegion, use get_system_io().
>=20
> This partly reverts commit 5c63bcf7501527b844f61624957bdba254d75bfc.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

No luck to boot arcboot with current jazz :-(

https://virtuallyfun.com/wordpress/2011/03/06/windows-nt-4-0-mips-revisi=
ted/

> ---
>  hw/mips/jazz.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
>
--=20
- Jiaxun

