Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD1E4AEFD9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 12:14:43 +0100 (CET)
Received: from localhost ([::1]:37308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHkvq-0003lB-SE
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 06:14:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>) id 1nHkrK-00088C-MR
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:10:03 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:58077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>) id 1nHkrI-0007D3-5R
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:10:02 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id F22305C00D7;
 Wed,  9 Feb 2022 06:09:57 -0500 (EST)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Wed, 09 Feb 2022 06:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=bWykmU5VmuX3v2wq8uHr4mhP9EAoUC3ZxrE+Yf
 c6LRY=; b=gnQF5KfAWvPrfY2K9T4/348CKKKkaa9QtLkgcyN79+AFwZWzZtDv0B
 r7ne+XpcmBHnmbNimIFAxYmVE9xC84aBOBXj953aCXosJt4YnMJu4CYnsKqzn8bS
 FIM2RVpaZh1mA4tmi1Bckep/SXSn3ECOnX+wPymf/gbhvW+rXRqcKRtF9mrbY42x
 nE/kOT/mZnaPBWwSwn3i3CuDNYmbz1A1OznQvnHUUh2Zzy5Kt4OOsGkx5Pa3T4Xp
 gT7Hm537Q3X0+fP/ktYg0Qq9bWbiJ8h8aQK3Y5xcL+8V83dtp++2vsC8oF3pdFE5
 mwnqBFQSRut4dkbdbxObCuGAkb9Na34A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bWykmU5VmuX3v2wq8
 uHr4mhP9EAoUC3ZxrE+Yfc6LRY=; b=ofonA0yN5MzvKXEmLp+WLz4RoxLoAK2SY
 VSctIEZaBjOt2cNLvSzK6COQHYpKnlaZHo6sHznYCy/DmcK90cj9vybjr2vGLCW1
 ehJt0W+K8RxQE+kg5T+PNHz/hd5U4JC609/9ZKcMUdztxdE4JgeIkrS8kol8tBnm
 c+ZGEmKJYfuqQqOkB1HkwCGydDU1WbpInsy+KGPZoW93iIieYdW0t2/m6cfbVuS5
 SRyxT8ACZrvI8LRIquPpZSbDvLl8zDA+ju8ykA3K4OB5qZBx/dr7R3KJ5x2MI+FC
 bk1iu+YQW8MwEkUBQ/L4JYJ/eh1yDvib8/Po0uw6qlrh3WTUsNydw==
X-ME-Sender: <xms:BaEDYmFJhueAYfF2QM1vmhqPMQh4tVIU21R4l8DNM1cV-FWAnMWJkg>
 <xme:BaEDYnWAfEWGF_evAoW2mRPPBhXoZAm3bgd76U3Jjh_IbDoZ-VN3KXfp1j2qkyg-l
 KgthsEiUzgjSO7sCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheelgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:BaEDYgIoqEq2MYrrfRT9qZ7jD03rWQaCaGY9-S8YKKIKI8NaHuakyg>
 <xmx:BaEDYgFBRsALI6rtBF2RGHRgbQCVwGpSWHtwLGH9JEnlhSXxAMFHtw>
 <xmx:BaEDYsVXgANt8v8UQt3rVuLWwqg9_L6rrejjUDIv3g8xo7J-MJ266Q>
 <xmx:BaEDYncL6orGCwQwjXNe-taW_Ob4HQcCCpDEnDzAP7TfA2tx4-TMbg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 866991920084; Wed,  9 Feb 2022 06:09:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4748-g31a5b5f50e-fm-cal2020-20220204.001-g31a5b5f5
Mime-Version: 1.0
Message-Id: <6706daf1-f289-41d4-980a-98a5b59b45fe@www.fastmail.com>
In-Reply-To: <20220207150409.358888-1-andrew@aj.id.au>
References: <20220207150409.358888-1-andrew@aj.id.au>
Date: Wed, 09 Feb 2022 21:39:36 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/3] hw: aspeed_gpio: Model new interface for the AST2600
Content-Type: text/plain
Received-SPF: pass client-ip=66.111.4.25; envelope-from=andrew@aj.id.au;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, openbmc@lists.ozlabs.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tue, 8 Feb 2022, at 01:34, Andrew Jeffery wrote:
> Hello,
>
> This series adds support for a new register interface supported by the
> Aspeed GPIO controller, present in at least the AST2600.
>
> The new interface is a single register implementing an indirect command
> protocol that allows us to manipulate up to (at least) 208 GPIOs. This
> makes it possible to write very simple drivers for e.g. u-boot and
> jettison the need for the tedious data model required to deal with the
> old register layout.
>
> I've lightly tested the device consistency under Linux. The Linux
> driver is implemented in terms of the old interface, so data model
> consistency can be tested one way by poking the driver using the
> libgpiod tools and then the other using devmem to drive the new
> interface.
>
> Please review!

Naturally further testing revealed some quirks that require further 
enhancements to the modelling.

Hold off on doing anything with this series for the moment.

Cheers,

Andrew

