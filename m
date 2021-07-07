Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34813BE096
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 03:32:37 +0200 (CEST)
Received: from localhost ([::1]:46518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0wQW-0002H8-Pp
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 21:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m0wOs-0000Uj-HT
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:30:54 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:46617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m0wOo-00064C-R7
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:30:54 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 799E5320096C;
 Tue,  6 Jul 2021 21:30:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 06 Jul 2021 21:30:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Ib9OUr
 DDWYJi1XMrNP55rjq6CDAmps3v/KSx6KlXi0Q=; b=OF1WfJTvrqHfV/S5e/Ss98
 upBd5NGC3G5npK+5q4yUjlTsgX3yCKx3IYnOiG+aXGx9cEuaKlNPkOxNbgiO3AJh
 D7AGZzQkJfPZlKYVzP6VTsxqSrsUlvFPjtTbeavmcZEbLhaESilm+q5nCWXtGCwW
 Wle7OkT9R6EfUMX5K03s+7/DQbCBAYFIua064w1YJtcmpqhUjWAwjY2dOtnm1TDW
 sayNgKeU3f86yUWMdmZT2wCT+p2Q68y2bc/seHzjiaRSCGjLGnHUEKQyfIjlBr6/
 pO5PwT9qefyfiYWnk1w3nRmnG//KtykWmMTkFAGJbwCQUAQnibbk5XK2rTjwbQQQ
 ==
X-ME-Sender: <xms:xgPlYFdSQzH5EoRs7DiXxil61QDHwDEzQLjWKJPu6yIodqda5F5Bow>
 <xme:xgPlYDNVzhdi1ux0IVkTBSDLajfIHAXhmSZZZvUQGGn_M3HkBoG29fINBSoMLVFDy
 4mE3NzpCDENXHMPSv4>
X-ME-Received: <xmr:xgPlYOhwyj-HkRNIxHQPKgANQK5A2-LqZdKzcBoIh7Opt3UlVx3u_A-8y9M78Zvzw2B5EJczMQcUoOKyhGOu2LL59hveTTXZWAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddugdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpefhjefgieellefhhfetkeektddtfefhgfegfeehleevuedvteekffefhfethfdv
 geenucffohhmrghinhepjhgrihhsthdrrggtrdhjphdplhgrnhgulhgvhidrnhgvthenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghi
 nheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:xgPlYO_uZZXPa_CO9q0GUf0aScmeI6ACpypaYi0QyX92ZdxnGwiUvA>
 <xmx:xgPlYBs6qfNF9BuTtfRdmt_AmikxFmmBpYYgr7_aCa-FU-HnHIUi4A>
 <xmx:xgPlYNGbDEVpFe8CTtbfT8DLLrtuRDFwXk1vE-lIbPegZ1R2VN0Www>
 <xmx:xwPlYK5PmWsebTMUj3pQmgISYYJTs_zLiooDTXsJq8WwRqUtSjn4jg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 21:30:43 -0400 (EDT)
Date: Wed, 7 Jul 2021 11:30:38 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [RFC PATCH 6/6] dp8393x: Rewrite dp8393x_get() / dp8393x_put()
In-Reply-To: <d44ae2a3-112a-a84e-5900-bdfa7594cd1c@ilande.co.uk>
Message-ID: <50e27af7-894f-8eb-426-1b3483fa3345@linux-m68k.org>
References: <20210703141947.352295-1-f4bug@amsat.org>
 <20210703141947.352295-7-f4bug@amsat.org>
 <d95b2ae6-c849-1b79-36f0-25c5133cca7a@ilande.co.uk>
 <b2cbdfbf-398-3530-b37b-5416aa612af9@linux-m68k.org>
 <d44ae2a3-112a-a84e-5900-bdfa7594cd1c@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=64.147.123.24; envelope-from=fthain@linux-m68k.org;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Jul 2021, Mark Cave-Ayland wrote:

> On 05/07/2021 02:36, Finn Thain wrote:
> 
> > > Unfortunately I don't have a test mips64el image available to see if 
> > > this combination works for Linux. Phil, do you have a suitable test 
> > > kernel and rootfs image available to allow this to be tested?
> > > 
> > 
> > You can build and boot a mipsel vmlinux by following the steps I 
> > described previously. In the kernel messages you'll see the jazzsonic 
> > driver attempt to probe the device. When it succeeds, you'll see the 
> > MAC address reported. You can also observe the regression I reported 
> > with regards to patch 2/6, "dp8393x: don't force 32-bit register 
> > access".
> 
> Those instructions are useful, but since I am not a MIPS developer I 
> don't have an existing toolchain/kernel tree and rootfs available to 
> test this.
> 

You don't need a rootfs to see the jazzsonic driver messages. But if you 
still want one, you could try the mipsel builds from these distros (not 
the 64-bit ones):

https://ftp.jaist.ac.jp/pub/Linux/Gentoo/experimental/mips/stages/
https://landley.net/aboriginal/downloads/binaries/

> If you can provide me with a link to your vmlinux and rootfs with 
> busybox or similar in it, I can take a look to see what is happening 
> here. Otherwise it's almost impossible for me to understand and debug 
> the problem you are seeing on your setup.
> 

Uploading kernels is a hassle (for me) as it brings a trust question and 
requires a file hosting service. I really should use PGP and organise a 
web of trust but that's very difficult given my rural location.

