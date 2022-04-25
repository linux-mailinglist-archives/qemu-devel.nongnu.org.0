Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE8F50E1F4
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 15:35:42 +0200 (CEST)
Received: from localhost ([::1]:44598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niysP-0007tM-1Q
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 09:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@simonsafar.com>)
 id 1nirSx-0003vE-0a
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 01:40:56 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:43629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon@simonsafar.com>)
 id 1nirSv-00018T-4D
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 01:40:54 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6D85B320100E;
 Mon, 25 Apr 2022 01:40:51 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
 by compute4.internal (MEProxy); Mon, 25 Apr 2022 01:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonsafar.com;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1650865250; x=1650951650; bh=am
 BqIJHB91Prh2Cad6wOkshGz7dE/wW6KeB8O5FhQsw=; b=ipU+x25m7ka3XkTQvL
 nRxwkA0kS8GgklTM4pLND7QB0c1eggsZh+wF4YuGhmFcBzpBlm4tXrM+vnFXpU0l
 18kJJcO9c+6mzpuxkD2QYB9mZaN8jj2fjHvzyt2xjvRSBysxtS5Lyjw7pyvc+U6T
 HYFUH5fvfzcL31jH/YKfHayQRSPiUto8gFijhAvUr13scFNGAvyWKzi6ms+ELmGJ
 w8Si7UTb1Xzjlm/podMarEVNuAp2/1jo7exQGz0Ii7VNUfRL+/B+dO6MP9qO5IPy
 ACrvi1MTL9qU4XBdJ4Sq5ravTSL2jMl1oz/qs04OYe+nFAdL+1SRunj+emyIXGMk
 y5cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650865250; x=
 1650951650; bh=amBqIJHB91Prh2Cad6wOkshGz7dE/wW6KeB8O5FhQsw=; b=C
 37oN4iv3JvJfbcW7Pxo3XCDtiqEinYaksdBPW/glohzOEKLpkvpLIgo79ZkqVlc6
 gamu3WJIWxwt8fN0J8Nv089JZFBW/1ji0xtfW4prMnZAvPR9xI/Kac0HoJDP8DW6
 ayTTJBLt6YGYtzb5VnReveqPN/GZxMBxbTS/uDA4AxwgsZ1c6A0A9vqSyYmEYM1F
 DeeQYbI3Tf2Vy0WmOZ6UfEP185S2q3IKaKUiuRkxskipw+7s41fPPQiCWehwCLec
 jJm5zNJu1pQDxjOViHhlPEZMHRrJ1UDic9ez0QAncmFgPWA6CUtpZjvAIc2cN2dh
 WvOrk+LIDmOZQqh2hyfIA==
X-ME-Sender: <xms:YjRmYho8ibswNq2ForJF7kHmXPqDkPv-1A46t06KKEzQcm1JqqzqNw>
 <xme:YjRmYjoPXGHG1KbEjdvXHW3xQ5JvNqc2iF1XtQqvZLFcjGLMx7fJKArkDD4u4r-R1
 7bfxTV-Jd6visZ5WiI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvfevufgtsegrtd
 erreerredtnecuhfhrohhmpedfufhimhhonhcuufgrfhgrrhdfuceoshhimhhonhesshhi
 mhhonhhsrghfrghrrdgtohhmqeenucggtffrrghtthgvrhhnpefhtedvheffgfffhfduie
 eivddvkeduueeuhfetgfeggeegfffhtdejgeeggfdvgeenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihhmohhnsehsihhmohhnshgrfhgrrh
 drtghomh
X-ME-Proxy: <xmx:YjRmYuPvuHbQezZDKLwvMs3nvhM0nGfUxDgp_nMF97tTgrNtWDOpRA>
 <xmx:YjRmYs6Ba_j6TAfDrS9gd3wOB0zq1luSSAgYMxbwv9zMf47-rkm6yQ>
 <xmx:YjRmYg4dkebZqPHY9gO0dn0Zg8Vi6iDLH3fLcW5AOopXJ4e3O9oGDw>
 <xmx:YjRmYlUveWOfkNvPBYnYd5fee61Zi03Ly-eyKg7HgYlKtkNagEvDyQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9DB1E1920089; Mon, 25 Apr 2022 01:40:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-569-g7622ad95cc-fm-20220421.002-g7622ad95
Mime-Version: 1.0
Message-Id: <b24c44b0-4cc0-4165-b794-44f1c61e3460@www.fastmail.com>
In-Reply-To: <CAMo8Bf+6gg4w1D_V8GBmePhC0Opf08Ctp3G90QpO69Yfk87B8w@mail.gmail.com>
References: <20220421155726.31986-1-simon@simonsafar.com>
 <CAMo8BfKPgZ29ReVE9CYmzfZ0sfem-fXqLf-2TW8qYQpO6fPA3g@mail.gmail.com>
 <331420f7-9bc8-44b6-b9db-e1d82cfdd399@www.fastmail.com>
 <CAMo8Bf+6gg4w1D_V8GBmePhC0Opf08Ctp3G90QpO69Yfk87B8w@mail.gmail.com>
Date: Sun, 24 Apr 2022 22:40:17 -0700
To: "Max Filippov" <jcmvbkbc@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH] target/xtensa: import core lx106
Content-Type: multipart/alternative; boundary=4b2a1a439f664503b60dd14f6b9776ca
Received-SPF: pass client-ip=64.147.123.25; envelope-from=simon@simonsafar.com;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--4b2a1a439f664503b60dd14f6b9776ca
Content-Type: text/plain

On Sat, Apr 23, 2022, at 2:26 PM, Max Filippov wrote:
> > It's for a (future...) Lisp compiler! Somewhat in the style of MicroPython; the idea
> > is to make code editable on the fly, without reflashing (... or restarting, even).
> 
> Interesting. Do you use libisa or do you do instruction encoding on your own?

It's my own; it's generating opcodes from the tree of tables in the Xtensa reference. A large part of the actual code looks a lot like those tables themselves; there are still some missing parts for some (e.g. overriding some defaults on which instruction is taking what kinds of parameters), which I'm just filling in on the go. It's fairly hacky, but it might fit together well with the eventual purpose of maybe running some of this in that 40k RAM onboard & keeping it all Lisp.

(I'll put it up somewhere eventually once it's not a complete mess & starts doing something interesting! assuming this ever happens, of course.)

Simon

--4b2a1a439f664503b60dd14f6b9776ca
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}
p.MsoNormal,p.MsoNoSpacing{margin:0}</style></head><body><div>On Sat, Ap=
r 23, 2022, at 2:26 PM, Max Filippov wrote:<br></div><blockquote type=3D=
"cite" id=3D"qt" style=3D""><div>&gt; It's for a (future...) Lisp compil=
er! Somewhat in the style of MicroPython; the idea<br></div><div>&gt; is=
 to make code editable on the fly, without reflashing (... or restarting=
, even).<br></div><div><br></div><div>Interesting. Do you use libisa or =
do you do instruction encoding on your own?<br></div></blockquote><div><=
br></div><div>It's my own; it's generating opcodes from the tree of tabl=
es in the Xtensa reference. A large part of the actual code looks a lot =
like those tables themselves; there are still some missing parts for som=
e (e.g. overriding some defaults on which instruction is taking what kin=
ds of parameters), which I'm just filling in on the go. It's fairly hack=
y, but it might fit together well with the eventual purpose of maybe run=
ning some of this in that 40k RAM onboard &amp; keeping it all Lisp.<br>=
</div><div><br></div><div>(I'll put it up somewhere eventually once it's=
 not a complete mess &amp; starts doing something interesting! assuming =
this ever happens, of course.)<br></div><div><br></div><div>Simon<br></d=
iv><div><br></div></body></html>
--4b2a1a439f664503b60dd14f6b9776ca--

