Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401BB52F3DB
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 21:41:16 +0200 (CEST)
Received: from localhost ([::1]:40300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns8Us-0001b9-Eo
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 15:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anders@apitman.com>)
 id 1ns8Sd-0000mD-5x
 for qemu-devel@nongnu.org; Fri, 20 May 2022 15:38:59 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:36627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anders@apitman.com>)
 id 1ns8Sb-0001T3-6L
 for qemu-devel@nongnu.org; Fri, 20 May 2022 15:38:54 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 42D685C029C
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 15:38:50 -0400 (EDT)
Received: from imap46 ([10.202.2.96])
 by compute4.internal (MEProxy); Fri, 20 May 2022 15:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apitman.com; h=
 cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1653075530; x=1653161930; bh=pd4ukk+POnURbqiOhWiYbfecBzEZUw1oXGG
 UkoqCqPU=; b=fPPKkzCMgjNXW4lfT6jIvb9nvwW5alcEGqp/PkOAxcyNyae1TFg
 G5ywuvTDT36eBIXeae1/709djcRoQDyxYVZU21xDeMDLH9RkM14JaZLHIwmzuqaj
 xwB31lf2TMkjFTxd03EcsUHb3NEeSQmv0dOpiKD7JyVmFTvjVuwL6+R+64SczJw5
 oGIRsvKLD3fnm0+J9hKzOPNGOO+V3cwp3LlbBrBHBvIPFqLdVPHa78VGWjE17bNY
 Pio7zC8S3j/+BtpB5+4aaqDDCEF7PisKdpTiBNYfPdIwvNqm+t5oAsfkuyklIKEk
 3oSUn68Q6MqHJcQRYQekXSU/HUCAXlLzP3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1653075530; x=
 1653161930; bh=pd4ukk+POnURbqiOhWiYbfecBzEZUw1oXGGUkoqCqPU=; b=Z
 PydAsdBeOm9FJXbWum4iks7BIeTKZB1Sorc1I9B99XXYKymE13rA52sOdbApt2cl
 JRQF7T1EOvAIlgM7hBgN1QRTfrJYiSdLZycCm0nm0c/21nFs14LHHhnV7JHMOay5
 EWmORJm7lvhQ82V5VTeK9n523snBtpjqyunPuJfyMCpPCzp23k0oUGD6/3hLrhV7
 s1hSozVUKUijg7bAojEnQ+MjcQYJlC4fezyocDtFk+eXb9njYvNlMAjsiBn5ZQYf
 OjYHSpYVfIzHYiIoBIpjQe53v+Y8Wx6Awizd2w3Y786XJKtFBex0U/XBPZRQoYNL
 SGvqRXxeN0lHCpH4CHXPw==
X-ME-Sender: <xms:Se6HYvR7HkFjUAO0I8scuVNIATblGq3aUNssZEXVe9REQUKxTJMPrw>
 <xme:Se6HYgwbPkLkC7wZH3C2XD8h21ainlcQxY_nFOjjIhcvLOcNcl35IGSVSqdI426vv
 rwJl-EEDs10Dz5aOlU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrieefgddufeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsegrtderre
 erredtnecuhfhrohhmpedftehnuggvrhhsucfrihhtmhgrnhdfuceorghnuggvrhhssegr
 phhithhmrghnrdgtohhmqeenucggtffrrghtthgvrhhnpefgudfhuddufffgudefleelie
 ffjefgvedtkeefhefhheffhfeikefgvddtgfeiffenucffohhmrghinhepqhgvmhhurdho
 rhhgpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegrnhguvghrshesrghpihhtmhgrnhdrtghomh
X-ME-Proxy: <xmx:Se6HYk2kLk_Dm4bTNV5659bKCWY5dSxhjf8T-PkpQxrt-bbQJ1bAlg>
 <xmx:Se6HYvCOWCBMQJu7DHPUM5i2QWZxLz1LYdhhOBSq7Bz9SFoeh_BXQg>
 <xmx:Se6HYohApHcrHNFAM5NR_s7yMwNd5sZOk3MfoyY1o5VoZvSHV7ixaw>
 <xmx:Su6HYjvxflb0n-BS7dcqzC2W3k4qzlag4R-30L-4lHWB4xfWOMUGaw>
Feedback-ID: i90714442:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C3F792A20069; Fri, 20 May 2022 15:38:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-591-gfe6c3a2700-fm-20220427.001-gfe6c3a27
Mime-Version: 1.0
Message-Id: <bd656b69-73b5-4091-9509-dbb76dbbb124@www.fastmail.com>
Date: Fri, 20 May 2022 13:38:29 -0600
From: "Anders Pitman" <anders@apitman.com>
To: qemu-devel@nongnu.org
Subject: Sharing directories from Windows hosts
Content-Type: multipart/alternative; boundary=61141eae99a142028b71763d5daeaf29
Received-SPF: pass client-ip=66.111.4.27; envelope-from=anders@apitman.com;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

--61141eae99a142028b71763d5daeaf29
Content-Type: text/plain

I'm running QEMU on a Windows host with multiple Linux guest VMs. I'm trying to share a host directory with all the guests.

As I understand it, the way to do this with Linux hosts would be to configure a 9p share[0]. However, it appears that 9p support for Windows hosts is currently a work in progress[1].

Is there another common option known to work for Windows? I would guess something like running a users-space NFS server might work, but before I went down that rabbit hole I wanted to see if there's something built into QEMU that would be better.

Bonus question: once 9p support is implemented, would that be expected to have better performance than something like NFS over a QEMU slirp network? I need to use slirp because I don't have admin privileges on the host.

[0]: https://wiki.qemu.org/Documentation/9psetup

[1]: https://lore.kernel.org/qemu-devel/20220425142705.2099270-1-bmeng.cn@gmail.com/
--61141eae99a142028b71763d5daeaf29
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>I'm running QEM=
U on a Windows host with multiple Linux guest VMs. I'm trying to share a=
 host directory with all the guests.<br></div><div><br></div><div>As I u=
nderstand it, the way to do this with Linux hosts would be to configure =
a 9p share[0]. However, it appears that 9p support for Windows hosts is =
currently a work in progress[1].<br></div><div><br></div><div>Is there a=
nother common option known to work for Windows? I would guess something =
like running a users-space NFS server might work, but before I went down=
 that rabbit hole I wanted to see if there's something built into QEMU t=
hat would be better.<br></div><div><br></div><div>Bonus question: once 9=
p support is implemented, would that be expected to have better performa=
nce than something like NFS over a QEMU slirp network? I need to use sli=
rp because I don't have admin privileges on the host.<br></div><div><br>=
</div><div>[0]: <a href=3D"https://wiki.qemu.org/Documentation/9psetup">=
https://wiki.qemu.org/Documentation/9psetup</a><br></div><div><br></div>=
<div>[1]: <a href=3D"https://lore.kernel.org/qemu-devel/20220425142705.2=
099270-1-bmeng.cn@gmail.com/">https://lore.kernel.org/qemu-devel/2022042=
5142705.2099270-1-bmeng.cn@gmail.com/</a></div></body></html>
--61141eae99a142028b71763d5daeaf29--

