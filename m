Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90F63A159B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 15:29:02 +0200 (CEST)
Received: from localhost ([::1]:53218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqyGT-0004Sg-VA
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 09:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lqyFX-0003m3-FG
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:28:03 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:54503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lqyFV-0003hy-Kg
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:28:03 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3EB365C0153;
 Wed,  9 Jun 2021 09:27:58 -0400 (EDT)
Received: from imap36 ([10.202.2.86])
 by compute3.internal (MEProxy); Wed, 09 Jun 2021 09:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=mesmtp; bh=E7efHK9LBR2ZiqpgHFeMzJDJI
 KFzN27R80Q2VL950dQ=; b=nQorRobaJ+y9uCJZ0bfAsEYrP+S60jpnfKbwvM0mL
 ++nTDNykQxJcWyaJswBMEyXRYkTUQMtAfiZQPHWDdfrkwL1bpIv/PgE2BSJEwd5a
 qTEQFaX3/kTTq3rLYQTYk9kXpRHyc40DsqzTBtBDMqkJvqWKOmRheXfJT30/7Wt/
 uA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=E7efHK
 9LBR2ZiqpgHFeMzJDJIKFzN27R80Q2VL950dQ=; b=RViLgdNx6ACRe3Fvw5naTm
 QEoKmORjut9Bg8KgeYqwa2GW0xN9Zi1Jw7h6cTsz3j/VqOVX0F8ubyCvNc1YYrNs
 M0gDmk51bPcDLNwMUbCBD3P+5osumewgGaF+79HnRmhme/X9Np/z3RyIJKKS1kv7
 C/150k3tjjcIJYJxFvSzD1yH3KJdK46BYrbwJz+ivEoB8B+qGnnZyg9CVLseqlyA
 sMUT1ni/MkEiHKcYbsDb4UznXpTeJeDXWQvCO6yYL5bkAnOjYyGrmSPo/Rrc2qaC
 JFxrLLMHUt7HAIK+1+HsIxlKsiEuHzp5Ze32ltMjjA4LHVpg+RXKRPqQqCpSvOrw
 ==
X-ME-Sender: <xms:3cHAYAooiCj2T13Cm24JIKCDcN6Zoa6jaXEcy3OvsVGUM79BL1cAog>
 <xme:3cHAYGokIHMedV2Vg0bhwxKB3k82jZh-H5dPwQh_mTCBUUVDQ2FIPzNX-D6XoKJ5R
 8NOjNP6dB9A4oiAmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduuddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdfiuhhs
 thgrvhhoucfpohhrohhnhhgrucfuihhlvhgrfdcuoehguhhsthgrvhhosehnohhrohhnhh
 grrdgvthhirdgsrheqnecuggftrfgrthhtvghrnhepuddvgfeuffdtheefvdeukeefheeu
 hfetheeuvdehvdeileelhedtleehheelieelnecuffhomhgrihhnpegrphhplhgvrdgtoh
 hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhu
 shhtrghvohesnhhorhhonhhhrgdrvghtihdrsghr
X-ME-Proxy: <xmx:3cHAYFMVf1rRL43HGJ2ukSB1ExVQu3H8Qm_p-QpenE7_zYGbmzcI6w>
 <xmx:3cHAYH4SrJyN0D_YJ8ejGliG7oxRhGxX_6ji20S-vbLC1Gjj9zPBbg>
 <xmx:3cHAYP7XTNpOacUFS6owGTq67DnSBLmR-wEDl0ykqDCmyS8-5L9dRg>
 <xmx:3sHAYC300D3jZWi3lYorPbUJralV2U_ytSLUL2J0zbPfJwkr7wXVRA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 28E3910E008E; Wed,  9 Jun 2021 09:27:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <20d65a72-4b00-49ff-b244-81f1f859ad00@www.fastmail.com>
In-Reply-To: <dcdc3b64-4444-4842-956b-ceab8489b812@www.fastmail.com>
References: <20210511185538.29344-1-gustavo@noronha.eti.br>
 <20210511185538.29344-2-gustavo@noronha.eti.br>
 <20210518101437.oivump7vaamayr5i@sirius.home.kraxel.org>
 <dcdc3b64-4444-4842-956b-ceab8489b812@www.fastmail.com>
Date: Wed, 09 Jun 2021 10:27:35 -0300
From: "Gustavo Noronha Silva" <gustavo@noronha.eti.br>
To: "'Gerd Hoffmann '" <kraxel@redhat.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v4_1/2]_ui/cocoa:_capture_all_keys_and_combos_when_?=
 =?UTF-8?Q?mouse_is_grabbed?=
Content-Type: text/plain
Received-SPF: pass client-ip=66.111.4.27; envelope-from=gustavo@noronha.eti.br;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>,
 'Markus Armbruster ' <armbru@redhat.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, 'Eric Blake ' <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping 3? =)

On Wed, May 26, 2021, at 12:13 PM, Gustavo Noronha Silva wrote:
> On Tue, May 18, 2021, at 7:14 AM, 'Gerd Hoffmann ' wrote:
> > On Tue, May 11, 2021 at 03:55:37PM -0300, gustavo@noronha.eti.br wrote:
> > > From: Gustavo Noronha Silva <gustavo@noronha.eti.br>
> > > 
> > > Applications such as Gnome may use Alt-Tab and Super-Tab for different
> > > purposes, some use Ctrl-arrows so we want to allow qemu to handle
> > > everything when it captures the mouse/keyboard.
> > > 
> > > However, Mac OS handles some combos like Command-Tab and Ctrl-arrows
> > > at an earlier part of the event handling chain, not letting qemu see it.
> > > 
> > > We add a global Event Tap that allows qemu to see all events when the
> > > mouse is grabbed. Note that this requires additional permissions.
> > > 
> > > See:
> > > 
> > > https://developer.apple.com/documentation/coregraphics/1454426-cgeventtapcreate?language=objc#discussion
> > > https://support.apple.com/en-in/guide/mac-help/mh32356/mac
> > 
> > Ping.  Reviews from cocoa guys please?
> 
> Ping 2? =)

