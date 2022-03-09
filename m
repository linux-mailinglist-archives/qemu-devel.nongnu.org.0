Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62F44D3B7C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 21:57:23 +0100 (CET)
Received: from localhost ([::1]:49790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS3N4-0002I8-CV
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 15:57:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jostein@secure.kjonigsen.net>)
 id 1nRzb9-0002Yq-0t
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 11:55:39 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:59953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jostein@secure.kjonigsen.net>)
 id 1nRzb6-0008IM-NT
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 11:55:38 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B5A463201FD3
 for <qemu-devel@nongnu.org>; Wed,  9 Mar 2022 11:55:33 -0500 (EST)
Received: from imap52 ([10.202.2.102])
 by compute2.internal (MEProxy); Wed, 09 Mar 2022 11:55:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 secure.kjonigsen.net; h=cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=sl6cZzxL3iopm9evAKCrUHTlesMylq
 QUwMZCevs/zaI=; b=v0qw01JK/nbg0ISZJtF9fGc8kgVtu5t8Coz40Z48RTekVl
 04wfLEIxogfgTGz8A9rvLh7tR5sNsqWLsGncjjUb9p1LB9bigYWh8+2jayZZDSE+
 NaGSQqX4AxGgiF/tx9MguO0/o2JfuGKHQ/1G7YrRT5SVnmfD5ab1JObrYurDQpgL
 PJ8U4xjh6/zEy5Xp5vGudCE9vmtDwPp4nB0sOI0vQly8KhSxLbmTQmA6hjRXu7e+
 HcM4+OD1uGVyr9LaIMQ5Z3b5Lmu1ThsjTVhko7ItJqBaj8aY1Wqu4nX92qVap3q/
 6JYtZCSxpdeMmC0cC1kExSDbrFji6cqXQHynLolg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=sl6cZzxL3iopm9evAKCrUHTlesMyl
 qQUwMZCevs/zaI=; b=n6rUFhWQdH71MyW7fNWpszFIuEq8mXmVaFHLASKKtIq9e
 1ZOR4eUn31QeApDskjrh878lBs0Lk6ISRS+cqOCq/I210d7AaeJvmZm91jLxGJ+J
 Ws7veO0u+bJQa398Wvy8M8CxJ4MDZpTkowT8lfGexSNZ0Z4rQHj5rcYZdSAFzCzF
 Qqr9DUZs1y6VSzGtGsfB15Yr7weZXl/ClcSP/6d4D7y/SDgP0tw/upSPe8toTIVI
 cwK3cpgp/jTVdmttq/TrcZpcdsYxcSt+nO6Y8D/rB5k82xBnQuTc/JidmNCuN+dP
 UiWUzE9Kms2HOzokQtGfy+/oFa+gljwwSb3GcI+Rw==
X-ME-Sender: <xms:BdwoYhwTTO4ncRz4I7mo7bSL5ngI8CdojnT_uVrYoHx2myjOyUlOPw>
 <xme:BdwoYhRnVf0lFrXSCkYFW76zLYFdjScbjDPd8GnRMRd4zpaVfbxnYqUEbnEp624eD
 uAdkxmZMD7dNK2KRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddukedgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkfffhrhfvufgtsegrtderreerreejnecuhfhrohhmpeflohhsthgv
 ihhnpgfmjhppnhhighhsvghnuceojhhoshhtvghinhesshgvtghurhgvrdhkjhhonhhigh
 hsvghnrdhnvghtqeenucggtffrrghtthgvrhhnpefftefglefffeekueekffffgfejffeg
 veeiiefhtdeghfejjeeulefgveektdeijeenucffohhmrghinhepkhhjnhhighhsvghnrd
 hnohenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehj
 ohhsthgvihhnsehsvggtuhhrvgdrkhhjohhnihhgshgvnhdrnhgvth
X-ME-Proxy: <xmx:BdwoYrUzye0eLc1DyHZLIbiICS1z4V81tyQH3sTP1eWyeJ1km8FjxQ>
 <xmx:BdwoYjgO3-hjH2cGJLJasn_d_mbAnMGPziDSN3HW3i7WoBrryqxN0A>
 <xmx:BdwoYjAio3WV51zkaQ1J2PY7vvW3abLyIkeoUvPLBgSuwBxXBa0l_Q>
 <xmx:BdwoYmNFCas3Mzky9mJRmpt-IDtntWqd1ggzH-6psTLOqJoEo_j95w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0A96A1EA0063; Wed,  9 Mar 2022 11:55:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <0605f78f-fe90-45bd-8e5b-d48fb3b99246@www.fastmail.com>
Date: Wed, 09 Mar 2022 17:55:12 +0100
From: =?UTF-8?Q?Jostein_Kj=C3=B8nigsen?= <jostein@secure.kjonigsen.net>
To: "QEMU Developers" <qemu-devel@nongnu.org>
Subject: QEMU, UEFI and Windows with Bitlocker encryption
Content-Type: multipart/alternative; boundary=3c6f4e9a35ce4e19b8d009cf44339b1a
Received-SPF: pass client-ip=64.147.123.21;
 envelope-from=jostein@secure.kjonigsen.net;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 09 Mar 2022 15:56:14 -0500
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
Reply-To: jostein@kjonigsen.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--3c6f4e9a35ce4e19b8d009cf44339b1a
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dear QEMU developers.=20

I=E2=80=99m having some issues with one of my QEMU VMs. I=E2=80=99m not =
sure if the mailing list is the best place to get help, and if it=E2=80=99=
s a complete miss, feel free to direct me towards more appropriate venue=
s.=20

My case in short: I have a Windows 11 VM with BitLocker encryption which=
 is imported from a physical volume. I run it through virt-manager, boot=
ing with UEFI through OVMF, tpm pass-through and it boots just fine.=20

What is annoying is that I have to manually enter the 48-digit BitLocker=
 recovery key on every boot.=20

I would assume these keys should get stored in EFI vars or TPM somewhere=
? If so, shouldn=E2=80=99t they be persisted when the VM is rebooted or =
powered off?

Any advice on how I can resolve this situation would be greatly apprecia=
ted.=20

--
Kind regards
Jostein Kj=C3=B8nigsen

jostein@kjonigsen.net =F0=9F=8D=B5 jostein@gmail.com
https://jostein.kj=C3=B8nigsen.no <https://jostein.xn--kjnigsen-64a.no/>

--3c6f4e9a35ce4e19b8d009cf44339b1a
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>Dear QEMU devel=
opers.&nbsp;<br></div><div><br></div><div>I=E2=80=99m having some issues=
 with one of my QEMU VMs. I=E2=80=99m not sure if the mailing list is th=
e best place to get help, and if it=E2=80=99s a complete miss, feel free=
 to direct me towards more appropriate venues.&nbsp;<br></div><div><br><=
/div><div>My case in short: I have a Windows 11 VM with BitLocker encryp=
tion which is imported from a physical volume. I run it through virt-man=
ager, booting with UEFI through OVMF, tpm pass-through and it boots just=
 fine.&nbsp;<br></div><div><br></div><div>What is annoying is that I hav=
e to manually enter the 48-digit BitLocker recovery key on every boot.&n=
bsp;<br></div><div><br></div><div>I would assume these keys should get s=
tored in EFI vars or TPM somewhere? If so, shouldn=E2=80=99t they be per=
sisted when the VM is rebooted or powered off?<br></div><div><br></div><=
div>Any advice on how I can resolve this situation would be greatly appr=
eciated.&nbsp;<br></div><div><br></div><div id=3D"sig19302177"><div clas=
s=3D"signature">--<br></div><div id=3D"sig19302177" class=3D"signature">=
<div class=3D"signature">Kind regards</div></div><div class=3D"signature=
">Jostein Kj=C3=B8nigsen<br></div><div class=3D"signature"><br></div><di=
v class=3D"signature"><a href=3D"mailto:jostein@kjonigsen.net">jostein@k=
jonigsen.net</a> =F0=9F=8D=B5 <a href=3D"mailto:jostein@gmail.com">joste=
in@gmail.com</a><br></div><div class=3D"signature"><a href=3D"https://jo=
stein.kj=C3=B8nigsen.no">https://jostein.kj=C3=B8nigsen.no</a><br></div>=
</div><div><br></div></body></html>
--3c6f4e9a35ce4e19b8d009cf44339b1a--

