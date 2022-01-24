Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D3D4977B3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 04:38:59 +0100 (CET)
Received: from localhost ([::1]:35276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBqC1-0003MJ-O8
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 22:38:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <voltagex@voltagex.org>)
 id 1nBqA0-0002W6-AI
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 22:36:52 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:50069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <voltagex@voltagex.org>)
 id 1nBq9y-0005IQ-Af
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 22:36:52 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 985E63200EE0;
 Sun, 23 Jan 2022 22:36:48 -0500 (EST)
Received: from imap44 ([10.202.2.94])
 by compute5.internal (MEProxy); Sun, 23 Jan 2022 22:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=I5M45zu8QXRCQ2sQy
 RdG5CYC8IzTr8GozK+xlas64Do=; b=DAj3+d+Xb91CYtuO+H2UXmcHz5zia2kpY
 D3oaDxOiAfqGPju58sepws05F7v5ChFv+HImqCSOocL2UtODJdtX/7F4wHFoBgK+
 vuiJkpgBK2t8JrBy345u+jmDos8raO4k/IoFrDuuIuK91TmcH0Rr9yxokeFCNeZo
 kv/erm5G/G5LLetBz5ZHE2N7O+VV3WSB1tiSt9uSDQz0GRgVL8lohhKW0O1PNFR8
 vr+aG/UdCAUPIeVMPkiG99weCcPU7hfTWwPOar9v9BqhaeSyKTov6p4t7GmV0J4q
 TLU/X5acJdr2cGzX7JC/hfUKnV84AZZqr63iDVYClytFeQl9xKEbw==
X-ME-Sender: <xms:zx7uYYASOi0Gk5BXIOfWsvRaGhC1XgjdEsmu_YegCyU5T_0f_LEMHQ>
 <xme:zx7uYaj8TsTVp9sW8Rp3kfZdIstD7AIGVKPogVx7Q8P0TOxgtuYd9t2m98tSP6r-k
 ueOnhSaQOIZnpe6tg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdehgdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftegurghm
 uceurgigthgvrhdfuceovhholhhtrghgvgigsehvohhlthgrghgvgidrohhrgheqnecugg
 ftrfgrthhtvghrnhepfeeludfgudelleeufeettdeigfeguedthfevheeuheeugfehheei
 geffgedvveehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtoh
 hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepvhho
 lhhtrghgvgigsehvohhlthgrghgvgidrohhrgh
X-ME-Proxy: <xmx:zx7uYbnb4B560fTx8ZqYXMNO0ExSqOM_xd4vWa5nyn4uz_6ex7H5eA>
 <xmx:zx7uYewvlWyu7i7kKKhHKmXTd9Q6hxfWDsA4y8xohO1f_1xuCB5k9g>
 <xmx:zx7uYdQzZ1a8zypMzBXjg4biSIFajWHmlFCY6-hzLtSpBTvhr4QgGg>
 <xmx:0B7uYYMcJ6nzSkRIDTDsXGZb_VcyPeNXXit0tzIHNnWexRM5j1VAzw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D20B1FA0AA6; Sun, 23 Jan 2022 22:36:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4585-ga9d9773056-fm-20220113.001-ga9d97730
Mime-Version: 1.0
Message-Id: <4918d5c5-6447-44ee-a845-3e47428d013f@www.fastmail.com>
In-Reply-To: <CAFEAcA96b+vVtbq4maMCwLAN0jdeG6EDp3Nz_h_s4HKQHSqfCQ@mail.gmail.com>
References: <d1bd9dcf-514b-44bb-a848-8026b524fad1@www.fastmail.com>
 <CAFEAcA96b+vVtbq4maMCwLAN0jdeG6EDp3Nz_h_s4HKQHSqfCQ@mail.gmail.com>
Date: Mon, 24 Jan 2022 14:36:27 +1100
From: "Adam Baxter" <voltagex@voltagex.org>
To: "Peter Maydell" <peter.maydell@linaro.org>
Subject: Re: Cross compiling 6.2.0 aarch64-softmmu for aarch64 host with musl,
 struct redefiniton errors
Content-Type: text/plain
Received-SPF: pass client-ip=64.147.123.25; envelope-from=voltagex@voltagex.org;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter
I realise this might be a bit offtopic for this mailing list, but might help others searching for the same error message

> I think this must be a musl problem. Quoting the full error
> message:

Turns out this is actually related to the kernel (headers?) version - fixed in 4.20

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=9966a05c7b80f075f2bc7e48dbb108d3f2927234


Where musl-cross-make is still using 4.19 by default, https://github.com/richfelker/musl-cross-make/blob/master/Makefile#L11

Bumping the kernel version allows qemu to build successfully.

Regards,
Adam

