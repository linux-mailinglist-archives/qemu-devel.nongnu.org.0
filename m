Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BD336FBA5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:42:28 +0200 (CEST)
Received: from localhost ([::1]:41366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTPX-0003EO-Vg
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcRtM-00054O-Ne
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 08:05:08 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcRtJ-0000Ay-Aq
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 08:05:08 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D10E35C0156;
 Fri, 30 Apr 2021 08:05:03 -0400 (EDT)
Received: from imap36 ([10.202.2.86])
 by compute7.internal (MEProxy); Fri, 30 Apr 2021 08:05:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=mesmtp; bh=y+Ip+6m51bXg9o5XC6ABsUzcT
 j1g0o7ZHEl1TphNuWI=; b=nqWER3iJ15rzCLbqM1dXASiIf5yFkXHIv1Tn2Rfx/
 qVkSXTDV4f+HWW81bhJWtfkuigZ3VGj8FvhaeqmIXcRh6I7XcK1pIOjSWunGRjDe
 5jzvlqItGCSPCsNqkgGsaC35FrCbWSzkYG4/GOJhI+AIQD02YKxuzx0k/dGdYYBs
 0Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=y+Ip+6
 m51bXg9o5XC6ABsUzcTj1g0o7ZHEl1TphNuWI=; b=RG9wi/S45oRXwpxYVs2g/8
 iPOuk2bWjzTKxJhuXmHmZpOQhRmWB8h7qsclgLwewRr2tStl18TEvQtLMiz93Bpy
 yRadhbGq3th/4MkXPA7BMH6pdG+NxyvcK/c3P3ZKE89lp0pJcNG0rNQfnm6wHxQ2
 PDrwOnsq8KSv1mbTy4DGhupfPXJ/wdjDPYTF3vUkrH9d2o0DdiDY6D6GknezCr8s
 kAEiqTC6OPTYOwjqzO2dZgcw1cS0S+Gma3OzmRyKQotc+UUE+iWhb1UyOyOW2Sa5
 iafOrrOkt00QZC83xejUKlSIGRHN80EA9AVBH9EcyN7e/4/Na6ul9Fv/jU0TgaiQ
 ==
X-ME-Sender: <xms:b_KLYLDxjYqs4mjs6F3laKBaKBURdTllC2xHTaodyV3H6Iffq_vA1w>
 <xme:b_KLYBgkyjurrocnWusROkeJTv6vPJHXksvEbOo0Qag6YFVPGlDYZ6DXh-ICWS6q8
 Akq2NolEwdPZbBlog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdfiuhhs
 thgrvhhoucfpohhrohhnhhgrucfuihhlvhgrfdcuoehguhhsthgrvhhosehnohhrohhnhh
 grrdgvthhirdgsrheqnecuggftrfgrthhtvghrnhepuddvgfeuffdtheefvdeukeefheeu
 hfetheeuvdehvdeileelhedtleehheelieelnecuffhomhgrihhnpegrphhplhgvrdgtoh
 hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhu
 shhtrghvohesnhhorhhonhhhrgdrvghtihdrsghr
X-ME-Proxy: <xmx:b_KLYGlG_x5Za22UAKdlkAW66W6xKgzeSydXPGOBKgJ2xvIZdU0isA>
 <xmx:b_KLYNy8oscT-T5jtpCb2DDFvLpdTktoklIj_hmXJo3p6D1DpS6zWw>
 <xmx:b_KLYATWC1U0Mud9nB-o7ZCWlg7T1WjM7MyoEzdbO7_6VyK-rFP7yg>
 <xmx:b_KLYLIHatqBzLI0c9mFoGNvBowHv4DHd6vDf_XvJaQwwja9pe3vtA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2AC2010E0089; Fri, 30 Apr 2021 08:05:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <7debaf60-9f07-41c3-948e-1fe19196d4bc@www.fastmail.com>
In-Reply-To: <87r1isxcm2.fsf@dusky.pond.sub.org>
References: <20210429234705.83206-1-gustavo@noronha.eti.br>
 <20210429234705.83206-2-gustavo@noronha.eti.br>
 <87wnsk5jd3.fsf@dusky.pond.sub.org>
 <9e59000c-eb07-45b2-8b39-3a705561c440@www.fastmail.com>
 <52473af1-017d-41e9-95d1-4a33948bfd9d@www.fastmail.com>
 <87r1isxcm2.fsf@dusky.pond.sub.org>
Date: Fri, 30 Apr 2021 09:02:23 -0300
From: "Gustavo Noronha Silva" <gustavo@noronha.eti.br>
To: "'Markus Armbruster '" <armbru@redhat.com>
Subject: =?UTF-8?Q?Re:_[PATCH_1/2]_ui/cocoa:_capture_all_keys_and_combos_when_mou?=
 =?UTF-8?Q?se_is_grabbed?=
Content-Type: text/plain
Received-SPF: pass client-ip=66.111.4.28; envelope-from=gustavo@noronha.eti.br;
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 'Gerd Hoffmann ' <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey,

On Fri, Apr 30, 2021, at 7:58 AM, Markus Armbruster wrote:
> > I did not add a Since: here because I wasn't sure how that is handled. Should I add something or is that taken care of at the time of release somehow?
> 
> You should add (since 6.1) at the end, like this
> 
> # @full-grab: Capture all key presses, including system combos. This
> #             requires accessibility permissions, since it performs
> #             a global grab on key events. (default: off)
> #             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
> #             (Since 6.1)
> 
> Same for @swap-option-command in the next patch.
> 
> Glad you asked, I'm quite prone to not noticing missing these in
> review...

One last question, please bear with me =). Looking at the other options I see that some have a single Since tag for the whole thing, I assume because they were all added in one go. For instance, @DisplayGLMode has a single Since: 3.0 at the bottom and not one for each of the options. Should I do that as well considering I'm adding @DisplayCocoa, or is the per-option Since still preferred?

Thanks again,

Gustavo

