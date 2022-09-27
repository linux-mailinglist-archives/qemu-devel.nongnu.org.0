Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619A25EC02A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:55:10 +0200 (CEST)
Received: from localhost ([::1]:55834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8F3-0008LD-Eq
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1od7uG-0003bu-BI
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:33:40 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:58201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1od7uE-0006WZ-LV
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:33:40 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B45135C0069;
 Tue, 27 Sep 2022 06:33:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 27 Sep 2022 06:33:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1664274816; x=
 1664361216; bh=7Uqz4/ektz7gu5yEnBW9ERNyn2cJxrTUaC/uvanuSiQ=; b=r
 q4f/RdnJ9WupUjk8XxdMrbxnnpkE2FqLBPrI5uOGSAEh25ChxV/RtxujRBzIA9WQ
 ugwJ7t366LJ/m865oW5VUKQ7+iYRDtAnb5MsVZ10SaioZXreu4iRKwHAfm+ctZpr
 cEWuRC2ZCg041cXq8kbWuw3VoqTxWCp2rldlwwX6grkzbAhHKrGg1FDmnV+U34I1
 pxrMKBu7JMvhvpf2aqs4W6sTwMciOzcEJMq2mVaCBHIAq2fhb9X89MgczeNsgZlZ
 oBaZ66rM6/9PW9TYl1abteQKmR47ydQlt02uoYgAb08ZTVTWG3HZiag+zE5rtuUc
 /S1GdpcT8hDp27E6tb02g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664274816; x=
 1664361216; bh=7Uqz4/ektz7gu5yEnBW9ERNyn2cJxrTUaC/uvanuSiQ=; b=Z
 luMQrz38HLkoEdRDAkDYLRiGSxe58cD6a66irneruOevI05Sk3CNdbHgN01njFwq
 sCbtMNMTMbCioKdH+LaD3cgNfh8CcYYXrV+KAr9AtNoMGhU/pPoU2jNnVo3dl2wN
 SQAgaqFyrKdBD0uyHCM6t8XlMkDhnKIp0twdQE1TDr56EzBl5jlx3w4b0po9tIJg
 HbGGxMwOi8q6OeuYwrSRVuCojj8WFBhb0pvVIifwXlDdKhiwIkYeYppYDmFoSZo/
 H2ORjCo9iqPB5dzwBOFUu6/CyVN6OhuWqNEONgCw1LfNu6GzEiZCjvqUiANSOq/X
 SGP3q/uV4hK7vdqe3UVfg==
X-ME-Sender: <xms:gNEyY7fa2dS4DRCkZyxvejpsW8b_byT1isbwEv0sHHkDk87vEYLYeA>
 <xme:gNEyYxOm7PVv3a0yUqCP1Eo7lOpDXVBqvDT5TG8qhU4ebRU7Ntpe71LY2PcuLt0y3
 rhZGmYdqt9tmIUTN0Q>
X-ME-Received: <xmr:gNEyY0gg3N1iJBO2Cffe4nNqQ3P0bve8-GeurW4Q7UpikN6OiHlmpHNmgLC-P7BNtkw3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegiedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
 ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:gNEyY8_a_bLu5zwJUZ5MbQ4Cl7sZC3Iww6ARmp8KZrI_l-yLmoN2bw>
 <xmx:gNEyY3vow7045nWKAEWcoiknMSuG8UmLKA5cEpcaNYgxAkrz9glxwA>
 <xmx:gNEyY7Eak0vLgEQAkdCIwbQnuWDzat6TD38O2WQC0WzsLjhU2Ixfzw>
 <xmx:gNEyYwXR4QleVotku0ipFIkWZuYVEm_0OO90od3RVj-fmAMkGy2-vA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Sep 2022 06:33:36 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.74\))
Subject: Re: [RFC PATCH 0/3] MIPS decodetree conversion attempt
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <CAAdtpL6dnKwDRtXTzDCw9_-+6H0+vgqGqbEdTb+cAmsxO-oOWg@mail.gmail.com>
Date: Tue, 27 Sep 2022 11:33:25 +0100
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FC5AE5D2-9EC2-45F4-A8CB-326CCE3D548F@flygoat.com>
References: <20220921124105.3824962-1-jiaxun.yang@flygoat.com>
 <E9443B6B-D245-4F31-B3BF-85011CB6B9FD@flygoat.com>
 <CAAdtpL6dnKwDRtXTzDCw9_-+6H0+vgqGqbEdTb+cAmsxO-oOWg@mail.gmail.com>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
X-Mailer: Apple Mail (2.3731.200.74)
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



> 2022=E5=B9=B49=E6=9C=8826=E6=97=A5 22:35=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <f4bug@amsat.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Jiaxun,
>=20
> On Mon, Sep 26, 2022 at 4:44 PM Jiaxun Yang <jiaxun.yang@flygoat.com> =
wrote:
>>> 2022=E5=B9=B49=E6=9C=8821=E6=97=A5 13:41=EF=BC=8CJiaxun Yang =
<jiaxun.yang@flygoat.com> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> Hi,
>>>=20
>>> This is my attempt of converting MIPS translation code into =
decodetree.
>>>=20
>>> Currently only MIPS I to MIPS Release 5 arithmatic functions are =
converted.
>>> Old decoding functions are perserved in codebase for now due to =
dependencies
>>> from microMIPS/nanoMIPS translation code. Will remove them after =
dealing with
>>> release 6.
>>>=20
>>> Both instruction encoding and test cases are generated form MIPS's =
internal
>>> architecture validation tools so they are gureented to be correct.
>>=20
>> A kindly ping :-)
>>=20
>> Will send v1 tomorrow if no objection.
>=20
> Thanks for this work! On a first pass it looks good, but I'd like to
> spend more time reviewing in the next few days. What did you change
> between RFC->v1?

Nothing much, just tidy up test cases a little bit.

Thanks.
---
Jiaxun Yang


