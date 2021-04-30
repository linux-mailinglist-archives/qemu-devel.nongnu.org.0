Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A35E36F8F1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:07:39 +0200 (CEST)
Received: from localhost ([::1]:50532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQzi-0000AS-EQ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcQVe-00022C-Du
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:36:34 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:48265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcQVb-0002GS-SL
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:36:34 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 81D015C005F;
 Fri, 30 Apr 2021 06:36:30 -0400 (EDT)
Received: from imap36 ([10.202.2.86])
 by compute7.internal (MEProxy); Fri, 30 Apr 2021 06:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=mesmtp; bh=50T7O592/+Lg9OAJEbdhmm8uu
 6+QLRLlqrXjeClj2Bw=; b=jVmjLIyqokU4h9fkUNjGVbLCPJ38uOdYoxq7Onkix
 nGmWRcZ0zE1kQDgvljTYnTcuRXHiJVF6DuoIqLCbRwRq7Jpue3ZGXCBpwBnHDxyO
 +LjU4C8oATMNFKNWhbFNOneAHFX3yMdgu0+HEz0YksM6FUEjDbLS5TrYnMGpq+9S
 mg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=50T7O5
 92/+Lg9OAJEbdhmm8uu6+QLRLlqrXjeClj2Bw=; b=fngLa/eG6ygZVHX1uu6LLJ
 roZTfscBLlHn/JSVE0YVC57UlqaGejhPuacKqOJhZ17ZmlYMsNQP/Of/QJhnD45o
 uMqiSUHOmbUPr4SrKJd1aCzHprpdRBKdooPpXL+0s9vQxRD6CbhHzWnSK0m/h3/y
 dqg6nKDezJbLkHmRX54uCkYlJNqsZoGZtsV4yGc+ipw4tiWjJUAO/gqCnCtiU2Zm
 Pdf3CrAJ64oVm3QEPkXI6ALJpy4XaUT9szt1ufCTxFLAPxcJNHvIm4pyhGGsi6Mu
 ZK6xob7SI3zI54aX+236UbS1NVeIF7toYOfvweAyF6h92tcRt140AWEOXkhpW1WQ
 ==
X-ME-Sender: <xms:rd2LYKy6nGhp5FM7ZV5em5HaJJMLSPBajIGsvAJR8VINvhdkFaF8zg>
 <xme:rd2LYGQf-OC1vdP2y3VCXNZwSR1MWd2iNguECQUDbZzYDymTW5pGOGaJidWe7tI9s
 CBJXviEBjrEyrCr0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdfiuhhs
 thgrvhhoucfpohhrohhnhhgrucfuihhlvhgrfdcuoehguhhsthgrvhhosehnohhrohhnhh
 grrdgvthhirdgsrheqnecuggftrfgrthhtvghrnhepheelueefvddvuddvheevgfeuuedu
 fefhleeihfekvdevhfetgeehuddvffeiudelnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepghhushhtrghvohesnhhorhhonhhhrgdrvghtihdr
 sghr
X-ME-Proxy: <xmx:rd2LYMWNaVXAcVsjxh6dHbAEW5dAMr4zu3cnht2zUDjv-P8jG7py-A>
 <xmx:rd2LYAjHz_8CjC9RYlA3uz_fOrrdUBGqcOE1SbJ2iEogHkGMUOG7mQ>
 <xmx:rd2LYMCy7D8CPEheb_b2K5hWNVhaa9e6ww8hQkZvNxqHbWYcQSJg3Q>
 <xmx:rt2LYPNXExPaRjKUYEEx1vE6WpAKZSLANVimqETTvlKqYYxTk6oXJA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6413610E0089; Fri, 30 Apr 2021 06:36:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <24648d9d-41e0-4538-9d09-63f342cf4d00@www.fastmail.com>
In-Reply-To: <20210430080414.a7ee4ygiamd32ihg@sirius.home.kraxel.org>
References: <20210429234705.83206-1-gustavo@noronha.eti.br>
 <20210429234705.83206-3-gustavo@noronha.eti.br>
 <20210430080414.a7ee4ygiamd32ihg@sirius.home.kraxel.org>
Date: Fri, 30 Apr 2021 07:36:08 -0300
From: "Gustavo Noronha Silva" <gustavo@noronha.eti.br>
To: "'Gerd Hoffmann '" <kraxel@redhat.com>
Subject: =?UTF-8?Q?Re:_[PATCH_2/2]_ui/cocoa:_add_option_to_swap_Option_and_Comman?=
 =?UTF-8?Q?d,_enable_by_default?=
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
 'Markus Armbruster ' <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey again,

On Fri, Apr 30, 2021, at 5:04 AM, 'Gerd Hoffmann ' wrote:
> Wouldn't it be easier to swap the bits in the modifiers variable once
> instead of having lots of isSwapOptionCommandEnabled checks in the code?

Good point, since a local variable is used it's definitely easier. I'll do the change and test, will be in v2.

Cheers,

Gustavo

