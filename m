Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BAB36F846
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:04:47 +0200 (CEST)
Received: from localhost ([::1]:35100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQ0s-0003fH-1S
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcPzL-0002ny-As
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:03:11 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:44481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcPzJ-0007cH-3v
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:03:11 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id C0A255C00EC;
 Fri, 30 Apr 2021 06:03:07 -0400 (EDT)
Received: from imap36 ([10.202.2.86])
 by compute7.internal (MEProxy); Fri, 30 Apr 2021 06:03:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=mesmtp; bh=4P8hZAdn8twAD0Pu2xMfGAEdp
 PR163DPDjK6bM8qSZU=; b=DP4DzCbd3CZ5hT8Bm1dTbxvVplDftzUaCO5yPUGzx
 ihF3IYceZTV0Fyv6LYEPxv8bs9xfX6/A9zMUNhX2uIdkptTUxseBcMcqvugo+SZL
 OFk/Mm0N5OlnRwMFAW5lz3zTBssKJz5J0702YPeBltz32bx3ARaJoSf+UzSN4EIR
 jE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4P8hZA
 dn8twAD0Pu2xMfGAEdpPR163DPDjK6bM8qSZU=; b=aSWRBczpcUG0kAGQ65U8Pu
 JIZSVM7xIekhSn5vu7zjl0huACQTca5jwyQdwMJtcxU9YmKLmVDE9FDJIv4d63SJ
 YC/HoTZMADUf7RicJ1z3En8OWSrlKgwcqv/qL5XHE0+xlV4MVl9WSXIGc9aZOV6Q
 Z94bsSjzAQt5TB0hbw+Tfo2QKM+uc7xk9bRs1yPoHgbCn20qjId4rcFcLT1Lu3yq
 AhAza1UbyaF6+691opgzg5d5mBDuRS7OMAms2HGeHOlamAHsMQ3nK4f/FWfUqfS2
 /bkPSlLejWm5FwBQENUBz4OIy4i9KqfSGZu9+R7+SmiJCkgIkHKsRpMmYVsrH7AA
 ==
X-ME-Sender: <xms:29WLYMSZVhVqMgKOKagYu-MoxJD2tm_ab6VT8nQvTYoDouax6rHSyA>
 <xme:29WLYJysq-ScdcIVKjCn7J0cNeGRI0tK7TF3ve4c02ga_FMAgGWsnqdZlVkV00G_s
 AdyrqQh_I4F-BVE5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdfiuhhs
 thgrvhhoucfpohhrohhnhhgrucfuihhlvhgrfdcuoehguhhsthgrvhhosehnohhrohhnhh
 grrdgvthhirdgsrheqnecuggftrfgrthhtvghrnhepuddvgfeuffdtheefvdeukeefheeu
 hfetheeuvdehvdeileelhedtleehheelieelnecuffhomhgrihhnpegrphhplhgvrdgtoh
 hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhu
 shhtrghvohesnhhorhhonhhhrgdrvghtihdrsghr
X-ME-Proxy: <xmx:29WLYJ3-XPkIcxqykW9AKnwbXSsreSPmRpoOupAuMMj-J_YH-SnTjA>
 <xmx:29WLYADj-NzcEiZ8Tg0ETdKGDm1FUv3lLGpXbFtin2w5lFH9sUeaWw>
 <xmx:29WLYFhrLjIyScRu9pSUU8Ew2v09fcigdES2vh-EsXksSYTn1Ec1Cg>
 <xmx:29WLYFZOaft883f4aEcjhQOc6DUk1d7MztJT7ksN6Rxh-8N30JRtDw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2A80B10E0089; Fri, 30 Apr 2021 06:03:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <9e59000c-eb07-45b2-8b39-3a705561c440@www.fastmail.com>
In-Reply-To: <87wnsk5jd3.fsf@dusky.pond.sub.org>
References: <20210429234705.83206-1-gustavo@noronha.eti.br>
 <20210429234705.83206-2-gustavo@noronha.eti.br>
 <87wnsk5jd3.fsf@dusky.pond.sub.org>
Date: Fri, 30 Apr 2021 07:02:46 -0300
From: "Gustavo Noronha Silva" <gustavo@noronha.eti.br>
To: "'Markus Armbruster '" <armbru@redhat.com>
Subject: =?UTF-8?Q?Re:_[PATCH_1/2]_ui/cocoa:_capture_all_keys_and_combos_when_mou?=
 =?UTF-8?Q?se_is_grabbed?=
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 'Gerd Hoffmann ' <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey Markus,

On Fri, Apr 30, 2021, at 4:20 AM, Markus Armbruster wrote:
> Please indent like this
> 
>    # @full-grab: Capture all key presses, including system combos. This
>    #             requires accessibility permissions, since it performs
>    #             a global grab on key events. (default: off)
>    #             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac

Will do, but just to be sure, the surrounding comments have the second to last lines lined up to the C in Capture there, I assume that is what you mean?
 
> I hope the link is permanent.

So do I. I have found Apple to be fairly consistent in providing at least proper redirection to newer versions of the documentation while learning about Cocoa and the Mac itself (first timer, just interested in the M1 to be quite honest), so I'm fairly confident it will survive.

Thanks for the review! I'll send a v2 later today.

Cheers,

Gustavo

