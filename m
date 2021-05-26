Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9512D391B69
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 17:14:49 +0200 (CEST)
Received: from localhost ([::1]:36022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llvFA-0005uP-ML
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 11:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1llvDw-0005Dk-F1
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:13:32 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:38603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1llvDu-0001F6-FY
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:13:32 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4EA6E5C0136;
 Wed, 26 May 2021 11:13:27 -0400 (EDT)
Received: from imap36 ([10.202.2.86])
 by compute3.internal (MEProxy); Wed, 26 May 2021 11:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=mesmtp; bh=n260lGCRZNUdT5NWxmHeJ766c
 kAQnuLANprsIA+mIB8=; b=u2Eb5p5Q0TpIKRYWGfgOSedGvbtwn4CaHGh+DTXQu
 dLQ9uoriaQFPhDOHY0utPqmyy3roFmfD7/MG/EVsTGIEU4EvWb1zlBIrpiR1qoCM
 CCZj6o6LekuGw66AueKdv5+wk0L1/4aDiETa3m7hW45lYjOY+5LyDcPVuIM2yfwr
 BI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=n260lG
 CRZNUdT5NWxmHeJ766ckAQnuLANprsIA+mIB8=; b=Swwdq/1iByV0gTQ1HTNSTw
 f5ZZL+ULq5KfpFtGiPTzm5S3Bzb5Pe7yfEjj5j62KJyuo2UiZUi+nEfRXQf9BwL7
 DvBv2BPkA17Q4KB3vXnqt1zDubSlJghu6Rjushd4qZ1Y4g9W754utb3Dnv878dIS
 7zx/nL7wWQbhMsQLqY75NwbGHzzKDKXh41B68fYUqKPz+X7LsePfJ0PL+tT2hcEW
 4RRP2bv89o/pXzCdIkOi+8FycnYyGgC46IpWuhJsyKUF1DH1RY8EjLPnsNDsXNE0
 LmEKVhtAAZjrCcnA4HDEeg2VFnn6dZrk5zVBx9vRfxPRa+MGybPrt11cS6myK0tA
 ==
X-ME-Sender: <xms:lWWuYAUbg1gBa3eP8vx683au0uwD8Lf-C77nAht30iz_KGYS0s_-ug>
 <xme:lWWuYEkbqwAodyDpadojMeqvchQOcvgMrGoIHVez0KqrpyCWWT5pLxj7B1M6Mh6Kp
 z4rP2iEq6ff-ra4dg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekfedgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdfiuhhs
 thgrvhhoucfpohhrohhnhhgrucfuihhlvhgrfdcuoehguhhsthgrvhhosehnohhrohhnhh
 grrdgvthhirdgsrheqnecuggftrfgrthhtvghrnhepuddvgfeuffdtheefvdeukeefheeu
 hfetheeuvdehvdeileelhedtleehheelieelnecuffhomhgrihhnpegrphhplhgvrdgtoh
 hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhu
 shhtrghvohesnhhorhhonhhhrgdrvghtihdrsghr
X-ME-Proxy: <xmx:lWWuYEaMCnBI1y4S7eJhWyV_NtQT9eJFsyUqzsmJRQ4KCdPDa9O6FQ>
 <xmx:lWWuYPUJ8HewWNxhO0AQhWtNRiW3BTUdrxAOL-xNnJuNQWirL7LnRQ>
 <xmx:lWWuYKkfRppidgP39N3XHhKTHZCeTMXZ1LBhyjIerXs7qxUfquTEVw>
 <xmx:l2WuYLAoUNvCL6fTLiH5vXh7PhHbvdUVED8DSHYMo-3RxvZf_y8dfg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C898310E0089; Wed, 26 May 2021 11:13:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <dcdc3b64-4444-4842-956b-ceab8489b812@www.fastmail.com>
In-Reply-To: <20210518101437.oivump7vaamayr5i@sirius.home.kraxel.org>
References: <20210511185538.29344-1-gustavo@noronha.eti.br>
 <20210511185538.29344-2-gustavo@noronha.eti.br>
 <20210518101437.oivump7vaamayr5i@sirius.home.kraxel.org>
Date: Wed, 26 May 2021 12:13:03 -0300
From: "Gustavo Noronha Silva" <gustavo@noronha.eti.br>
To: "'Gerd Hoffmann '" <kraxel@redhat.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v4_1/2]_ui/cocoa:_capture_all_keys_and_combos_when_?=
 =?UTF-8?Q?mouse_is_grabbed?=
Content-Type: text/plain
Received-SPF: pass client-ip=66.111.4.26; envelope-from=gustavo@noronha.eti.br;
 helo=out2-smtp.messagingengine.com
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>,
 'Markus Armbruster ' <armbru@redhat.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 18, 2021, at 7:14 AM, 'Gerd Hoffmann ' wrote:
> On Tue, May 11, 2021 at 03:55:37PM -0300, gustavo@noronha.eti.br wrote:
> > From: Gustavo Noronha Silva <gustavo@noronha.eti.br>
> > 
> > Applications such as Gnome may use Alt-Tab and Super-Tab for different
> > purposes, some use Ctrl-arrows so we want to allow qemu to handle
> > everything when it captures the mouse/keyboard.
> > 
> > However, Mac OS handles some combos like Command-Tab and Ctrl-arrows
> > at an earlier part of the event handling chain, not letting qemu see it.
> > 
> > We add a global Event Tap that allows qemu to see all events when the
> > mouse is grabbed. Note that this requires additional permissions.
> > 
> > See:
> > 
> > https://developer.apple.com/documentation/coregraphics/1454426-cgeventtapcreate?language=objc#discussion
> > https://support.apple.com/en-in/guide/mac-help/mh32356/mac
> 
> Ping.  Reviews from cocoa guys please?

Ping 2? =)

