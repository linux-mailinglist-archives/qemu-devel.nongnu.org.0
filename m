Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD70250C822
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 09:58:59 +0200 (CEST)
Received: from localhost ([::1]:49064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niAfS-00014x-G9
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 03:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@simonsafar.com>)
 id 1ni6Fl-0003UJ-Uy
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 23:16:09 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:48765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@simonsafar.com>)
 id 1ni6Fi-00025j-Iv
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 23:16:09 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A8EEB5C0210;
 Fri, 22 Apr 2022 23:16:04 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
 by compute4.internal (MEProxy); Fri, 22 Apr 2022 23:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonsafar.com;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1650683764; x=1650770164; bh=y3
 UM23r97VQMOD5bfsRt5BUFmRvZ9GNwvWCjrwOESf8=; b=T0p9beGYWND2eNzJox
 hMS7Zj/4C7QAMUSTE1qSrOBf0dGsYX4T8qwME0/1f2bjYvZQMbkJLPP44ohYsqaG
 empdHuY74YEwCrtchicldzQ8DyTCyAy5M0aoXdIQKle+1Z2X2Rlw9SVT9DLJ4NVT
 yIPIIhlGZT3+snQeR7/bo38mt1vFL2+THah6rV7C14WCTRdpNe5sP1oqjpnvJpk2
 xRH6OUKMq1qC03rGM0pjJcaVgZ2NcN+O8UHaGeqjvuSRJn4Dwk3YFOMRuDjVnjgJ
 6Mmcj3DxF/Ad5WIEzEnpzlpihGqItjc0muQRcWZTGllIIvtrNoYO1vlYSkJFqObP
 TvyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650683764; x=
 1650770164; bh=y3UM23r97VQMOD5bfsRt5BUFmRvZ9GNwvWCjrwOESf8=; b=i
 SuyB8xX0T3wAIX0nmwVFxD7EyGt0dZO6zVTF8NdRZw7ElKOmMPeMAe5r5bfQ9VZa
 biTUT/CMFJ9hiiBzCV3ReT/Mgdq+2kPXtrlO6gaPmR4/2h2Yp6yJFuJqACgr0aoy
 wUbKFoSX2kyTumZqeNzLDeQlkTXRZkxWdkNhxEi1BoSw77miXHIbB/bXNdPId+Yt
 mBXynj+sHfJyPXt2k0QZ52reDn4Ayz6YfHHTPc8UeWxZhknY/X+rnsyj8y4gNVVt
 lzs1Q0if6necH2AZvpIUlpGX6lwqJ725Hf9SL0qP0+af7dIRo49fOWwMR1agAhdv
 uE0BBIOJd3OViO3sJsbtg==
X-ME-Sender: <xms:dG9jYqo-SWRhCnXayiVKV_5l7qzx9kmTJMjLwuiFWf60TKIrV1SQFg>
 <xme:dG9jYoqGKvrq32ZVoQaGDYAV39TRRXBGXEgbStxEdcT3wco4F_brkh0Uf1V13OTGd
 BGanqRwTBkk61uBLC0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdehgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvfevufgtsehttd
 ertderredtnecuhfhrohhmpedfufhimhhonhcuufgrfhgrrhdfuceoshhimhhonhesshhi
 mhhonhhsrghfrghrrdgtohhmqeenucggtffrrghtthgvrhhnpeeiiedtleduhfelffejud
 dvvefhueevledvhfehueegieejkeegieetfedvgeeljeenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihhmohhnsehsihhmohhnshgrfhgrrh
 drtghomh
X-ME-Proxy: <xmx:dG9jYvOck2MMJLQ0nrEpfAOqbscR4SzxRO2ZzExcN32Q4EZIaKTubQ>
 <xmx:dG9jYp6Rw7OVHX4fNzJehSEFxjitUAorlcDoG8B2FKtsydWAKjTC2Q>
 <xmx:dG9jYp64BL35FrWmd77Tb7z8bt0AlILBe1xJiN4skTy9jYwJ3vQp-A>
 <xmx:dG9jYqVAwUBW67GPLjJ9y24eTk6SdkACFV6w2a_z-lQpjn8qeTOuHQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5ADD31920089; Fri, 22 Apr 2022 23:16:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-569-g7622ad95cc-fm-20220421.002-g7622ad95
Mime-Version: 1.0
Message-Id: <331420f7-9bc8-44b6-b9db-e1d82cfdd399@www.fastmail.com>
In-Reply-To: <CAMo8BfKPgZ29ReVE9CYmzfZ0sfem-fXqLf-2TW8qYQpO6fPA3g@mail.gmail.com>
References: <20220421155726.31986-1-simon@simonsafar.com>
 <CAMo8BfKPgZ29ReVE9CYmzfZ0sfem-fXqLf-2TW8qYQpO6fPA3g@mail.gmail.com>
Date: Fri, 22 Apr 2022 20:15:33 -0700
To: "Max Filippov" <jcmvbkbc@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH] target/xtensa: import core lx106
Content-Type: text/plain
Received-SPF: pass client-ip=66.111.4.28; envelope-from=simon@simonsafar.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 23 Apr 2022 03:55:34 -0400
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
Reply-to:  "Simon Safar" <simon@simonsafar.com>
From:  "Simon Safar" via <qemu-devel@nongnu.org>

Hi Max,

On Thu, Apr 21, 2022, at 1:56 PM, Max Filippov wrote:
> 
> An update to target/xtensa/cores.list is needed for this core to be built
> in qemu-6.2+. Please keep that file alphabetically sorted.

sounds great, thank you for the review!!! Will send out v2 soon.

> I'm curious how is it supposed to be used?

It's for a (future...) Lisp compiler! Somewhat in the style of MicroPython; the idea is to make code editable on the fly, without reflashing (... or restarting, even). Given how it's one person's side project (mine), it's a lot closer to a (not-even-self-hosting) lispy-syntax lx106 assembler (... written in Common Lisp) at this point though.

Specifically, qemu is being used for testing code generation; within test cases, we generate an object file, link it up into an ELF image, launch it under qemu & check the output. Current top achievement: a loop that iterates 10 times and quits successfully, by using the emulated syscall interface. Even so, having actual test cases for this (& occasionally attaching gdb to them) is really useful.

(Admittedly, I can't really think of a lot of other use cases; probably everyone else is just using the official C toolchain?)

Simon



