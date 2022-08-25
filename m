Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7825A1CE5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 01:00:58 +0200 (CEST)
Received: from localhost ([::1]:50322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLqM-0002yR-0t
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 19:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oRLV8-0002zU-Mi; Thu, 25 Aug 2022 18:39:03 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:60491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oRLV6-00065i-Pw; Thu, 25 Aug 2022 18:39:02 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 877CA32009DF;
 Thu, 25 Aug 2022 18:38:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 25 Aug 2022 18:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to; s=fm2; t=
 1661467136; x=1661553536; bh=3YKa6D43m7ChNqM3M8VdySwzz3X/67PrlLE
 g7d9AIlQ=; b=nTVRJ6+aCVvRv1XBOd+KhQR0kTf1xHzP77mqxdodig3ke2DGB5X
 q8AJ3IE7eJY4Uul2OqtKqI0g+gukrF85ucDTmu7vYBGQ6d25aDqGo1LVkPw716yO
 qQ7EVEgBQ1v9jkdQav6doG+HYrplRQonmMb1XYh8o4v+v9DowUuQh3uHFHVUTquB
 gIy/ycuwp7F+zTsadBGJYydfj7mS74z9Jcs/gut0KIMft4qzx48vqNienjbfGX5k
 6l7p58lUMgm4wJDazBK5oVnDzG9zWk/JWvZhB33GqELgFXU7sA3RJvsnNX1PP/4/
 uT1lKQdbjhGtoPU7DcsbkJ7NU0vZ0CNWj2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661467136; x=
 1661553536; bh=3YKa6D43m7ChNqM3M8VdySwzz3X/67PrlLEg7d9AIlQ=; b=y
 LQ6jCZnfnadnzb39dVpZK94NsfP8KPBMMwckR1EfwAgvGkez3oLlMTz6ZPTWF88X
 o5Jz/fzpUg+rTX84xqZUzjbM2GhqBfRRmdWcbonn4vmj9n/ISIOPIFPeTITwaeou
 OFIceNB7mG3qQWyS4PAsK2iFu2VAq5J2a3r99l0ULo9PlmgJLPgOexZDd9d1SzAX
 VYrCjEh3bTtqWprs7EZv0bKrRSWQcaVQS5O73DANDiZ17+TYUYvTC3NHVtr+sAMd
 l0PEkX+Uly+CFl+cfv4ydMJ07FoEDmANoBq6agn/2zKaXGlI4uyDkVC/tYuoqgao
 M0jAJITV81j9cz8/iHhGA==
X-ME-Sender: <xms:__kHY_336hY9dzqFpl0Cg5KEpk0Ej5jiitws9RxkBmhpjrmb304EDA>
 <xme:__kHY-EACygxAxOPNbOBgm2OolmO2IMdqsH2Ta9hb0d00JQGDKGTvRFql_kKE0JHy
 TfUZEi9qhknP8BUN2Q>
X-ME-Received: <xmr:__kHY_7dRdQkY_f8sIqDIPlgzIuEGlFjGI4EcJc6qwkUmsnUUSur19s9t6Z-2vra-Cpvt9aw5Eb4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhepfffhvefukfggtggusehttdertddttddvnecuhfhrohhmpefrvghtvghr
 ucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpeduvdfggeegtdffjeffteekjeduhfeugfejvdduieehiedvfffhjeeifefhffeg
 heenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvg
 htvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:__kHY00lPVYYBoeIIAb3x_alchxXk9VthBOR3pSoi6iPRR42ZAN5qQ>
 <xmx:__kHYyHUywzvRjOAViS7zCCkfhytbGXmyz42q91KExZ_K1-KXs0zIQ>
 <xmx:__kHY1-UsUAzuJiOFdUDq0_jkKDi6jP7h_x_nHQA3MjdoG9y4CaysQ>
 <xmx:APoHY_MkcioRcIPPGFT0QOOlT1kWq-T8RiCTnBN-zc0uwH5-6JEA9A>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 18:38:54 -0400 (EDT)
Date: Thu, 25 Aug 2022 15:38:53 -0700
From: Peter Delevoryas <peter@pjd.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org,
 samuel.thibault@ens-lyon.org, garnermic@fb.com, patrick@stwcx.xyz,
 zhdaniel@fb.com
Subject: slirp: Can I get IPv6-only DHCP working?
Message-ID: <Ywf5/cIDTV8OQ/0d@pdel-fedora-MJ0HJWH9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=64.147.123.25; envelope-from=peter@pjd.dev;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MISSING_HEADERS=1.021,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

I'm having a hard time figuring this out from looking at the code and the
user-level help options.

It seems like there's support for an IPv6 dns proxy, and there's literally a
file called "dhcpv6.c" in slirp, but it has a comment saying it only supports
whatever is necessary for TFTP network boot I guess. Maybe there's no support
then? I'm interested in adding it, if that's the case.

Thanks,
Peter

