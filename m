Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC675873FD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 00:34:56 +0200 (CEST)
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIdzs-0006xv-E1
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 18:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oIdxE-0004Ss-O2; Mon, 01 Aug 2022 18:32:04 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:59837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oIdwx-0006wq-W4; Mon, 01 Aug 2022 18:32:03 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8C081580433;
 Mon,  1 Aug 2022 18:31:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 01 Aug 2022 18:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659393104; x=
 1659396704; bh=YqFbCRlmg4g6CkkaVgMDNvfhvXtt5yzZKEzS6Ev4QqQ=; b=n
 QHLEhO4cX7ERV+XbmYdxcqYJTi3RhwPVio0kUckT6KWnHGdJLZ+p9c0SINztbrhL
 3TnIhsOK3PeTRm47COGEsuj9hUmjR7gKpI4PIns4CwNpnjJKRvmub/MxO+ghGHXy
 Za3ANTkDW4aPhmNkZsaAcgZJuIZDaJEppbqFWdTvRrwrFssvDzv8V6GPo/2mXpb2
 7VNpupDyEyJQ/RzVvJpqBCJjBflEmKajpUpbvuMNBn/glASkSmxiZ+YhZWtd8EQ8
 72GCchTlS/QljmLex9gcy4aMn/UuuVhQhg/XZtwpyCc7dKdNjitHnydILxnBx+o/
 wSRX8cxAmsY55t4rHrMYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659393104; x=
 1659396704; bh=YqFbCRlmg4g6CkkaVgMDNvfhvXtt5yzZKEzS6Ev4QqQ=; b=y
 +WEuZ5g/YWHmg2/OhO5a1sy2mYUZNVeNCkzp8pHFueZmbyHgcNZiRQ31nFOgMc+K
 H81IChkxv8hvWmAYt0bSH84nbS2qQAanwXfgnW6lgOcocZMWMgMFDyVRlSznuWJx
 b8bf+5mlZGcvtn/F8gaLTzJuxXx89HcHc404FpAHsGBfCMM3byqStXhkkkJ8CZSp
 /1yhnls+cfgo2Ju42pPBQtoKOv4ZixArJ1covJMQG9hcW1sp+Pn1/cBXFnC9+285
 lDOtPUuZArVgqgUu6+GqHsErUJQ2iIgwTD37otLuEiIOEIwOgKEBpdooqMxgP4cZ
 phh0bh2CWvv3BE4NcFlJw==
X-ME-Sender: <xms:UFToYiY8xzZ0wbEgXx16BaTbkEMmV35VH32xXc7tdVe43_rgCBn4mw>
 <xme:UFToYlbc3AF87WVoysYofqBAX4YbU55VjkObPa72dBNGFvMid-gagEQ1v3E5XvEk3
 5UWE9-S3UFB1YoTIAc>
X-ME-Received: <xmr:UFToYs9sp-OqiXzKkqpcwiVhtFWMu9d7B5tAH3qkp6_Tebm5VRVVbONO2yf6RFRYgWy61Dgp2rRS5OlxMQNKeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvgedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefhgeffvedufeevteegkeetieejhffhudeujedvgedvheffheejveethffh
 ffefueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:UFToYkq6wm8I4S_DpCDJrKiYD1xssLQhKg8XNUF8vaKfwi1uKfnJ2w>
 <xmx:UFToYtqRw63z04OEdeAZxARZvufL2PxdFPvpMRUWdv9cJtvOaYg9NQ>
 <xmx:UFToYiSSLbPDz8iBIKcz6HhgIc8L4Q01JEw4YevZt3rpLESmMbZ9zA>
 <xmx:UFToYlZkTm00D-UfRRWOD_7lWgJsxBWoQfDQOaIc1GjRirBovCQ5VA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Aug 2022 18:31:41 -0400 (EDT)
Date: Mon, 1 Aug 2022 15:31:39 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Iris Chen <irischenlj@fb.com>, Peter Delevoryas <pdel@fb.com>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= via <qemu-arm@nongnu.org>,
 Patrick Williams <patrick@stwcx.xyz>,
 Alistair Francis <alistair@alistair23.me>,
 Kevin Wolf <kwolf@redhat.com>, hreitz@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 dz4list@gmail.com
Subject: Re: [RFC 0/3] Add Generic SPI GPIO model
Message-ID: <YuhUSxjqj8y5VbYQ@pdel-mbp.dhcp.thefacebook.com>
References: <20220728232322.2921703-1-irischenlj@fb.com>
 <435b3e89-f9fd-c257-b03d-a12d4b59ac6b@kaod.org>
 <YuQZP4xkkU2R9VmO@pdel-mbp.dhcp.thefacebook.com>
 <6d4a3912-a386-a784-8db4-7743bb1f1063@kaod.org>
 <55427f60-0e51-4219-a753-d30d617fc35d@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55427f60-0e51-4219-a753-d30d617fc35d@www.fastmail.com>
Received-SPF: pass client-ip=66.111.4.221; envelope-from=peter@pjd.dev;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Mon, Aug 01, 2022 at 11:49:09AM +0930, Andrew Jeffery wrote:
> 
> 
> On Sun, 31 Jul 2022, at 06:48, Cédric Le Goater wrote:
> > On 7/29/22 19:30, Peter Delevoryas wrote:
> >> Certainly we'd like to use IRQ's instead, but she ran into correctness
> >> problems. Maybe we can investigate that further and fix it.
> 
> Yes, let's not work around problems that we have the ability to fix.

+1

> 
> >
> > So much is happening in that mode.
> 
> Yes, though while there's no-doubt accidental complexity in terms of 
> its implementation, the underlying hardware is also quite haphazard and 
> we need an approach that scales to the large number of GPIOs it 
> provides. So I'd argue there's a bunch of essential complexity involved 
> as well.

+1

> 
> Do we start with a fresh implementation that allows us to get the 
> expected behaviour and then build that out to replace the current 
> implementation?
> 
> Or, can we add more tests for the existing model to pin down where the 
> bugs are?

Mmmm good question, I think we might end up doing both. Tests would make
it much easier to develop either way though.

> 
> > We need more trace events in the Aspeed
> > GPIO model at least an extra in aspeed_gpio_update()
> 
> We can always fall back to this but my hope is we can get better test 
> coverage to iron out the bugs. Maybe that gets us a more refined and 
> maintainable model implementation along the way.

+1

> 
> Cheers,
> 
> Andrew
> 

