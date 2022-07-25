Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5736F580214
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 17:40:47 +0200 (CEST)
Received: from localhost ([::1]:58274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG0CK-00016s-96
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 11:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lists@colorremedies.com>)
 id 1oG09f-0007sL-LO
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 11:37:59 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:49133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lists@colorremedies.com>)
 id 1oG09d-0006w6-Fe
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 11:37:59 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 69131580582
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 11:37:56 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Mon, 25 Jul 2022 11:37:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 colorremedies.com; h=cc:content-transfer-encoding:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1658763476; x=1658767076; bh=1cDAkM536p/YAtiw9Riycbk+2
 8nok2fJKBOqgNx31do=; b=kMuUlJ/ZWL2CEPQ4rLoxn8zrxpaDQ6R6HB657OLDu
 imgkl3Wz3MqNjfUemNIvyEPkzn7VzXbogeO5vpA8QgpK9tvsp6d9f2LIjxATj65U
 bBtE3QnkndPq3SU/PLRycVNXcRWGYDK9azfA1UHUyF+7QtlevN9RPQmgjUkMw9jl
 G9sKgBlX5Ht87jnRCVphZEc7HUGKATGRszmbyEXLodvepvScHlL24n7VGAdPXIRT
 QkVPfdfu4VO9iehnSbuEXKOuSSS5urX7uHDX/oLAVCj/XfTebuKYSvd1xIlW3Jg6
 8ZZ6VmzcDCPxYYKuEvhWzrpPc+IKGzhR4nQsFjnuuD33Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:feedback-id:feedback-id:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=i06494636.fm3; t=1658763476; x=
 1658767076; bh=1cDAkM536p/YAtiw9Riycbk+28nok2fJKBOqgNx31do=; b=U
 AN1Z9Lcchj+nJxNH/llcBinFvvYc3q49cDIeAa0O/UD5WDEdXXljYedSJffTKPVu
 kQZ12igkiQcFz2Td06z1fJ7AZ8RvZVAn2QnjmcMAII5b5qcVL/CC/I/goMjxn3G8
 Bh+uoVy+fmuafbYRDwNmoLJWqmNXLdo6ch9QRY0m8YYNulImATf8QK+obU3TQjm8
 qmtdJW6NSC6EXpr9w9X52CW0fuRzkuH4fs+tUQlBTaXec7AGixQ8QVZqgHzjgD0B
 tX83XVkBykL/5XuBLwSg8y6BhgTIqo4nbJHinA8ZVwG2SyRbUssuRyzb4SQAVSEj
 CYdabLjdTah4eN4N6l+Qw==
X-ME-Sender: <xms:07jeYvbZZpi5DS90xvR5kDESqqtx5c3u_7qbpyIrXlnAKNGPC-JcZg>
 <xme:07jeYubtW9aCsy_w5c0l__7X0LrFmDZB7WUOQRe_17WgosXeTPVYmjFYZqDT2MPG1
 8ZzyeMLnUWHbVQqQjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtkedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
 hqredtreerjeenucfhrhhomhepfdevhhhrihhsucfouhhrphhhhidfuceolhhishhtshes
 tgholhhorhhrvghmvgguihgvshdrtghomheqnecuggftrfgrthhtvghrnhepleegleefff
 ekleffffegudejuedujeegheduteehteejleffieekfedvlefhheefnecuffhomhgrihhn
 pehfvgguohhrrghprhhojhgvtghtrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehlihhsthhssegtohhl
 ohhrrhgvmhgvughivghsrdgtohhm
X-ME-Proxy: <xmx:07jeYh9HSZhMvu7zRFNQ7YgKEnDrvTfKjbdYxYEw9diGkOJPAatBag>
 <xmx:07jeYlqOkGQybUoZIyDDtvzaOxLP1UCQdxTK1iKlvh0DZ_jEwp_6qg>
 <xmx:07jeYqo8rTSZEoLbAZ_wtfQlfsNTzXVTbl2fp7RDIpHEnfd2toGA0w>
 <xmx:07jeYn1NgF3krOsOpgmN4DKqdt3ozIghoDsQ513FcQFMUq3RhVKK0Lea688>
Feedback-ID: i06494636:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A0E401700082; Mon, 25 Jul 2022 11:37:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-757-gc3ad9c75d3-fm-20220722.001-gc3ad9c75
Mime-Version: 1.0
Message-Id: <88c597d3-5519-429c-b211-7722b90d98d2@www.fastmail.com>
In-Reply-To: <Yt6gSz5iQBcXfVO/@redhat.com>
References: <4f9c91b1-719c-443e-a757-042e772d6019@www.fastmail.com>
 <Yt5etOfFUQb12ljA@redhat.com>
 <79ec108b-60bf-4c18-8917-9d7c8fd74b89@www.fastmail.com>
 <Yt6gSz5iQBcXfVO/@redhat.com>
Date: Mon, 25 Jul 2022 11:37:35 -0400
From: "Chris Murphy" <lists@colorremedies.com>
To: qemu-devel@nongnu.org
Subject: Re: driver type raw-xz supports discard=unmap?
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.221;
 envelope-from=lists@colorremedies.com; helo=new1-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, Jul 25, 2022, at 9:53 AM, Daniel P. Berrang=C3=A9 wrote:
> On Mon, Jul 25, 2022 at 08:51:42AM -0400, Chris Murphy wrote:

>> Huh, interesting. I have no idea then. I just happened to notice it i=
n the (libvirt) XML config that's used by oz.
>> https://kojipkgs.fedoraproject.org//packages/Fedora-Workstation/Rawhi=
de/20220721.n.0/images/libvirt-raw-xz-aarch64.xml
>
> I don't see 'raw-xz' mentioned anywhere in the Oz code at
>
>   https://github.com/clalancette/oz
>
> was it a fork that's being used ?

Must be. I'm not seeing it in either oz or imagefactory source either.

>> I've got no idea what happens if an invalid type is specified in
>> the config. The VM's are definitely running despite this. I'll ask
>> oz devs.
>
> This is pretty surprising if they're actually running as it should
> cause a fatal error message
>
> error: unsupported configuration: unknown driver format value 'raw-xz'

Yep, I'm lost. I guess it's down a rabbit hole or yak shaving time.

--=20
Chris Murphy

