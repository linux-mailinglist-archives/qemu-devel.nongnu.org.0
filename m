Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C9642FDA2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 23:48:41 +0200 (CEST)
Received: from localhost ([::1]:45654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbV4C-0000Bj-HH
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 17:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mbV37-0007nZ-M3
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:47:33 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:49625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mbV32-0001gu-Fw
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:47:33 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 716A332019DA;
 Fri, 15 Oct 2021 17:47:25 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
 by compute2.internal (MEProxy); Fri, 15 Oct 2021 17:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=JFIGp
 TA8zQfDnnp3AY/RBhSyBbhGhP+V1cHMvrbj1sw=; b=loJcH4PePgTm4+BMhGx46
 1M/wR6QLsEo5ThdOrZZaKfMcLA9OXEEh1FtveIuyqYDqPqT+DUKoqJZ/iD+TJUVt
 sPyMK4ylx1O7pcqo8m3DeWRYPgHwFlpnsz8qmXErJZ1LWhxCnP7MLB5TA5Gx9Kob
 n7EScuEDadUYTJcxWObZokGl/sLLR4XX4zRpsv/B+xbjtxtPFYGI9RX3xcq5tQsh
 YxpD39erqxEaEeRbYeiNrE1rtncwo6HTkD3K1NZCCbgyV0zwr5F6asjyJ8/OWR7x
 VbtL2wAm14UxCD8FMgjD2165KjisGxB/CihKy2pJt3Pzn7Hb3x7vofgqL/bQZbHm
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=JFIGpTA8zQfDnnp3AY/RBhSyBbhGhP+V1cHMvrbj1
 sw=; b=eWnH5+P10O62I3Ge6mvMR6SrwsB8I1lEQLkhapRx/04ZRSHnCjcNlmqBF
 Jd5vAdaMGOpSc2RnT1KEm+BQvEjKsXG4xmkhBPeij2FxnbQSWtE2HtFItkaFqQeo
 dcdCPcmqHPFVKT5blw2Op0aGejH3njjD8+fYSedfYsE6bMscdIx2tD6VZOCA5pUd
 qegqMCjpMQ/9DbkYBT5ycsOjl1Ln3QNgwsstwEon4pM93RLimpUNZrLMBCNfl/tQ
 dIq+douW/TgX/Cp2dwpTeqiXHHATkEnwKs0+SVde28ON0dVyeSYJGxmfWhFvXaNZ
 gfMfiNVIUqt0M0Hjl41DiqjqgkTmA==
X-ME-Sender: <xms:7PZpYTuRqyVjTr3MwN8Elvv9iR5b34nveL7vhBH2dVDHy4twT59d_w>
 <xme:7PZpYUf04YKyivRYSfW_kwpgqlbztZJkx05pZyJPt3ZbtoIuvUqX2Vuxg34Dg-IwX
 oP3bb_YCwQxoZR5lyc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdduhedgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
 rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
 eqnecuggftrfgrthhtvghrnhepgedvuefggeeluedtkeevteeghfdtteevueejieelkeei
 jedtvefgfeetudduudefnecuffhomhgrihhnpehvmhhsphhlihgtvgdrnhgvthenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdr
 higrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:7PZpYWwkgXYvREr5fTZ9AJMly1WJvxmucp4pb7aCcOKkESUmrl_fMg>
 <xmx:7PZpYSP2KPw2Bw0-OHcmVs7luGCWt7gAp6ImcC_Z8bp6NGiEmOJe9w>
 <xmx:7PZpYT8DHKlWGHSLjI_HupVZMcY6Ch1tcoHvbRWxGCHRCkoWzbuSJw>
 <xmx:7fZpYdmCjV3eHU8GCSACB7rRA5Ma5amBMMkolvStmxe8xtzyS4GeXw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A2867FA0AA5; Fri, 15 Oct 2021 17:47:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1345-g8441cd7852-fm-20211006.001-g8441cd78
Mime-Version: 1.0
Message-Id: <799b81fe-17b9-416d-b320-dd9f9e8c610f@www.fastmail.com>
In-Reply-To: <f840d219-5562-f4af-8eeb-7c7df87f4741@amsat.org>
References: <20211002184539.169-1-jiaxun.yang@flygoat.com>
 <b039e68a-e591-a5d3-9e95-cde45c7d0bd8@flygoat.com>
 <f840d219-5562-f4af-8eeb-7c7df87f4741@amsat.org>
Date: Fri, 15 Oct 2021 22:46:57 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "BALATON Zoltan via" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 0/3] hw/mips/boston: ELF kernel support
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.25;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "paulburton@kernel.org" <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



=E5=9C=A82021=E5=B9=B410=E6=9C=8815=E6=97=A5=E5=8D=81=E6=9C=88 =E4=B8=8A=
=E5=8D=889:49=EF=BC=8CPhilippe Mathieu-Daud=C3=A9=E5=86=99=E9=81=93=EF=BC=9A
> On 10/11/21 15:58, Jiaxun Yang wrote:
>> ping?
>>=20
>> =E5=9C=A8 2021/10/2 19:45, Jiaxun Yang =E5=86=99=E9=81=93:
>>> Jiaxun Yang (3):
>>> =C2=A0=C2=A0 hw/mips/boston: Massage memory map information
>>> =C2=A0=C2=A0 hw/mips/boston: Allow loading elf kernel and dtb
>>> =C2=A0=C2=A0 hw/mips/boston: Add FDT generator
>
> Next time please run checkpatch.pl before submitting,
> see
> https://blog.vmsplice.net/2011/03/how-to-automatically-run-checkpatchp=
l.html
>

Thanks!

I have ran checkpatch.pl before sending but was taught to ignore over le=
ngth warning by kernel community :-(=20
Apparently QEMU is not the case.

--=20
- Jiaxun

