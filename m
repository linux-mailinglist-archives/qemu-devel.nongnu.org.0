Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D993336F855
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:12:27 +0200 (CEST)
Received: from localhost ([::1]:46956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQ8I-0000Mh-W6
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcQ6p-0007vD-2P
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:10:55 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:57179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcQ6m-00043w-3T
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:10:54 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id E05CD5C00E6;
 Fri, 30 Apr 2021 06:10:50 -0400 (EDT)
Received: from imap36 ([10.202.2.86])
 by compute7.internal (MEProxy); Fri, 30 Apr 2021 06:10:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=mesmtp; bh=/xAttBA5Pv5bzSf4J9yDzO8/q
 YCOxLwZ+sSSANb0Sdg=; b=J1J5S9/I/NzmSlAFfhRTALttiTq7aRF6V6UlX6E6Q
 23RMA6/7kmQmZn5ONPj2CHZyMkJyGnFvareKie0Jt8m5COveW4bZc+gUwLt4QNYb
 XgyASPtv0ofdID8OnvcGY1Gb5ap/8pVBgGqq/HFJ3SrIkdsTDwer6jqpExPEN5lo
 IA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/xAttB
 A5Pv5bzSf4J9yDzO8/qYCOxLwZ+sSSANb0Sdg=; b=mohDw6tSROuE4tBgpTMhSN
 DFhbESzDk0tA0KXegPDpnhsrCfAwzwXJ7dzI+7qGRxIndgfoX4sYx4NrTcFCwnSr
 35L4qfvswiONegUJ1dQobdXi5I1swuIvcp0o5xvOnp1VS2AlOwkzOm8EV7WbKj98
 pxCIKDyNcbztOAw3seBC0bKXdkZIGuMvjnd5SPcIeG2YIu4aqtdLGAbNWZ0Q8GEX
 eL6Fsvg0BhXx6PGXdsY2lf3DDdZ4jCoLflP4W/8beDRXdOzTkKF0bH2RwqOLHJOl
 8lNr1DGNdDyHMmPQjwcFdidxzv26tdYquv/R9zFLFBPFda5Ie9fd73p4dSxMbI3g
 ==
X-ME-Sender: <xms:qteLYB82XprEPLCsIIFQoFjwBYhIxduPd1bHpMB80vxnMGhxYkoCMA>
 <xme:qteLYFsBR234aac_mHPy6AU-N9xY47kv_zrp9RG7VTdMd6N3nnT7wqgBVQX9MR-XW
 qme665beGWfLZd8vw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdfiuhhs
 thgrvhhoucfpohhrohhnhhgrucfuihhlvhgrfdcuoehguhhsthgrvhhosehnohhrohhnhh
 grrdgvthhirdgsrheqnecuggftrfgrthhtvghrnhepuddvgfeuffdtheefvdeukeefheeu
 hfetheeuvdehvdeileelhedtleehheelieelnecuffhomhgrihhnpegrphhplhgvrdgtoh
 hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhu
 shhtrghvohesnhhorhhonhhhrgdrvghtihdrsghr
X-ME-Proxy: <xmx:qteLYPCtt3M4LfwrF2IGFUo32bwG2pMHXZLNcODXhsAZGQTVdZQVdw>
 <xmx:qteLYFcbngmJ_CveA6Syo_Y98kTKZCCPUyRsJD8LEl_0UgBiW9IBtA>
 <xmx:qteLYGOSWQcEG_Y6-kzGbSJnqnXCX5BBSSJDHfXlSHRepIA15RUE5w>
 <xmx:qteLYI2aRohsoUe6EO5fAOdmxsnpij1X9PDIKuiVBh0OB8tmq3T2uA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3D37410E0089; Fri, 30 Apr 2021 06:10:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <52473af1-017d-41e9-95d1-4a33948bfd9d@www.fastmail.com>
In-Reply-To: <9e59000c-eb07-45b2-8b39-3a705561c440@www.fastmail.com>
References: <20210429234705.83206-1-gustavo@noronha.eti.br>
 <20210429234705.83206-2-gustavo@noronha.eti.br>
 <87wnsk5jd3.fsf@dusky.pond.sub.org>
 <9e59000c-eb07-45b2-8b39-3a705561c440@www.fastmail.com>
Date: Fri, 30 Apr 2021 07:10:28 -0300
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

Oh by the way,

On Fri, Apr 30, 2021, at 7:02 AM, Gustavo Noronha Silva wrote:
> >    # @full-grab: Capture all key presses, including system combos. This
> >    #             requires accessibility permissions, since it performs
> >    #             a global grab on key events. (default: off)
> >    #             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac

I did not add a Since: here because I wasn't sure how that is handled. Should I add something or is that taken care of at the time of release somehow?

Thanks again,

Gustavo

