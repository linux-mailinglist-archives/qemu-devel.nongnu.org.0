Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557A050E1F5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 15:36:16 +0200 (CEST)
Received: from localhost ([::1]:46788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niysx-00015r-FK
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 09:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@simonsafar.com>)
 id 1nirCm-000110-Cq
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 01:24:12 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:51717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@simonsafar.com>)
 id 1nirCk-0006hJ-8M
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 01:24:12 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A7A423200E60;
 Mon, 25 Apr 2022 01:24:05 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
 by compute4.internal (MEProxy); Mon, 25 Apr 2022 01:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonsafar.com;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1650864245; x=1650950645; bh=cm
 Z+y3oNxVHn+zp1AiUyJljQAam+ebsc9SbMeE1JEF0=; b=LISnvOBMuq2FVlF59B
 z7WLCeCvocrdl93/CVvVTWN36k0fot6mWqBog9Yj4cGTv2GvWT0UiYKpLxQHkdrW
 kPqPKAcJxox5y5E5Q6vfsrCqdQv2PyC0O77KqXWuB8T9iVr6kMf0cDJTjG49ceQE
 2a7kbNH/2sN30+ksWUwV68d1qlfr9HvjL7MvWIr/NeTnK8iRRG1bqRuwqLN9EliX
 huP+Q7WGeMCKofEfNr5aLMGIgViMkhE+fBRqqAEkapWnYgTw754eNvvK12mUtJXe
 ThjAcOz7vAFP3iikBhQ+TlB7w9RNNnrBBLFm5k7w/kk3M+uOYF/7RBXRh9ERUpFe
 IalQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650864245; x=
 1650950645; bh=cmZ+y3oNxVHn+zp1AiUyJljQAam+ebsc9SbMeE1JEF0=; b=J
 EPci2Afs486indQYNyI8XMGa/2PAzZ5KXBXBEpzSe7BNBrs+O7nWbIt3RilkBcQF
 jtKuxm32RmtyUh89HWjex4bmVfdD0hb2/SwIpvLUwUVRpN0UzpTD2IZm3e5J3r9b
 VPylNn1xJBjcecCOOYieeJfo5BmVRNfbe+jwNxdllFi/kTMa13KFLhUajmXGTqh0
 Io2Novgt3hz8/+9YIpsqpapv6Rf92t33zslGYMe28qjY+ttwJ/p5cCS+EuCoNLxL
 lKLMS/69tg/S4Y4prX4jegEB8PG+WKM3jMXvu+EQyYlCS9qNjcOCDu3BZcaPh09M
 t/6LXZ2L6BIiwHHs45uWA==
X-ME-Sender: <xms:dDBmYjNTA_DFSunhDWkgwml0EUnYI-HjqPPIvJy8Z8OcdsGYczVTqA>
 <xme:dDBmYt9aJGMp8aXvkUkPIzxwRcYC2808OGesafMmJem7hsjT7WYepH6AeAaZNZuTT
 q6eZeaLNAb-096JN9U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvfevufgtsehttd
 ertderredtnecuhfhrohhmpedfufhimhhonhcuufgrfhgrrhdfuceoshhimhhonhesshhi
 mhhonhhsrghfrghrrdgtohhmqeenucggtffrrghtthgvrhhnpeeufeevheeffedutdduue
 duvdetlefhheetheffffeuiedvjeduffevieevheffffenucffohhmrghinhepghhithhh
 uhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshhimhhonhesshhimhhonhhsrghfrghrrdgtohhm
X-ME-Proxy: <xmx:dTBmYiRjE_9zVg9luHdNa8Q_eXJgFxQg5qEB7fXXWIkrfSUOeEQALA>
 <xmx:dTBmYnv6Zuhu2Xak3IAGp1oOnQn2sJ3auC_jWv06RhLmnKWhble-UQ>
 <xmx:dTBmYrfsikhlcaXfQ-ShNaAYyktTy4B1bjOx_9QvXTfY2_6JW-PVFQ>
 <xmx:dTBmYppqH285UGpMr9_A45OGAPNYy2DVkCJ0J_K33JFb0SHfAZr56A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EB92F1920089; Mon, 25 Apr 2022 01:24:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-569-g7622ad95cc-fm-20220421.002-g7622ad95
Mime-Version: 1.0
Message-Id: <6c1d04ae-bbe5-4847-a2e1-5c1786c916fd@www.fastmail.com>
In-Reply-To: <CAMo8BfL__NZDQGkTRUXSbaNRoQJ7QhGmvVFy5NDGhDH5eJbguw@mail.gmail.com>
References: <20220423040835.29254-1-simon@simonsafar.com>
 <CAMo8BfL__NZDQGkTRUXSbaNRoQJ7QhGmvVFy5NDGhDH5eJbguw@mail.gmail.com>
Date: Sun, 24 Apr 2022 22:23:31 -0700
To: "Max Filippov" <jcmvbkbc@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2] target/xtensa: import core lx106
Content-Type: text/plain
Received-SPF: pass client-ip=64.147.123.25; envelope-from=simon@simonsafar.com;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 25 Apr 2022 09:31:24 -0400
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

On Sat, Apr 23, 2022, at 2:41 PM, Max Filippov wrote:
> I've noticed that this file is not from the original overlay (which I happen
> to have here:
> https://github.com/jcmvbkbc/xtensa-toolchain-build/blob/master/overlays/original/lx106.tar.gz),
> but has been changed (by adding '& ~1' to the 7th column), probably
> to make some older gdb version work.
> This change is not needed for the modern gdb versions.
> I've reverted this change and checked that the mainline gdb-11.1
> built with the original overlay for the xtensa-elf target correctly
> interacts with the QEMU. Can you please confirm that?

for simplicity, I just tried re-importing everything with your overlay (vs. the one from xtensa); both actual code execution & gdb seems to be working nicely. Yours is also nicer since there is about zero mismatch between what import-core.sh expects & what it has access to (... while I had to tweak it a bit, e.g. to skip core-matmap.inc, for it to be satisfied with the xtensa version).

Should I send a v3 with the results from importing your variant of the overlay? (although at this point my "contribution" is really just reordering cores.list after running the script :))

Simon

