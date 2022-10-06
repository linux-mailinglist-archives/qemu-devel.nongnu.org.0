Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9955F6860
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 15:42:01 +0200 (CEST)
Received: from localhost ([::1]:47884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogR8S-0002Vp-Jz
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 09:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ogR4K-0005HM-J9
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:37:45 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:50411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ogR4E-00066P-Vf
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:37:44 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 1F53B5C0144;
 Thu,  6 Oct 2022 09:37:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 06 Oct 2022 09:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665063449; x=
 1665149849; bh=zIBppDbThD8UJ95r9LPUjtKYEulMSvsJZDF90HB72fY=; b=M
 4vDay6zWRCTMv5+y4pQXnDmDqLwFJ6mFGw7bx07c6Kv/AJsrhiP70AQ6UjasIcTN
 e2CM7xGSrJB28tpfFMCQrKt7ZvAcFvOpqCm1QWZmU2zn8sRPj7HEjrAIIogd2AMe
 bofKAmI+5y+QAziWp3x/LJL5sLkvTDmDgnA0RNnV0bfhohqx/Qf07p9+3JfEeUQA
 9W0gfoLPnOvexnlYkFddBjrS1FJP1desQDCqeXtxrrR2e5bcN/1GQWlANAknjQul
 p1RpoPLTRJil73AoqM2lBuSJCYofZrajXc1yb1ngqEkrg0dXkgR9p+2wzjCfgut4
 3kfKfjQzLP+DPWrUjsEgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1665063449; x=
 1665149849; bh=zIBppDbThD8UJ95r9LPUjtKYEulMSvsJZDF90HB72fY=; b=g
 PVyndfq9XjZQYuszB9g/yywl5nFix+q4yHS25dUt5ITbR1TlSGDCbjiQz9W4SfMq
 vAjZe50dyy4hyfjPiKinPF+86KbCyvYK8spxczKbqfgHJ1m62OukbfVbKs8UTQbb
 s9vxR314ZG5RfsefU0OZfl0phebFsUNOFC5wMwGltd+6L3jf5G24e7Fa6do3o5Pk
 Sz5B6DE+JcK7ilYIhgkUcVm7gXy4ozU64SVvVEBIpnvOMojXAjrjylnkzwKFiyjb
 fUeLL/SqA2b+HslqW8ZzvYzb94ieBzRxhC/0aIrJjGGSXhN8dhW2ykVLo5+CzDBz
 wMW7V/OibrhN3dGMh3tig==
X-ME-Sender: <xms:GNo-Yxa9o-B_p_WqDyiGlSJMcJdnCd82nXK8BUo-_7QtQU4krGvaoA>
 <xme:GNo-Y4Zi1237K6W7hLAAuQ6YLCZnIMD0EnyHGiBqhRnTo2mxa-RNPJ-SM7kNVfASD
 FYDNGytigHtUxWCZtM>
X-ME-Received: <xmr:GNo-Yz-vIUbNr3cQMLMJeagsGNeyp8opa1lqh1bzgCiogmH_lDB0eVQmdCgWgErl9RcB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeihedgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
 ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:GNo-Y_qjwZQlJ7fJeGocNX6_NJPahXGyKgjmii7gAAsi9N4k2Br9bA>
 <xmx:GNo-Y8oxgYLKngJTlpvg056rMbjhzuHldbPCtB3gc5ib1NBvlCXgFA>
 <xmx:GNo-Y1RL3DbBBfEGQfH8HQVjf7N-BB7tHnEIs-7SbdV_09Wd76kfLQ>
 <xmx:Gdo-Y5B0R4a_LqI8ZfjMLtuiEEz4YlqDrLj5JHwbEXuTRyc71aEUXw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Oct 2022 09:37:28 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.2\))
Subject: Re: [RFC PATCH 0/3] MIPS decodetree conversion attempt
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <FC5AE5D2-9EC2-45F4-A8CB-326CCE3D548F@flygoat.com>
Date: Thu, 6 Oct 2022 14:37:16 +0100
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <700CEB38-7652-4C76-8E0F-69EF39B415AD@flygoat.com>
References: <20220921124105.3824962-1-jiaxun.yang@flygoat.com>
 <E9443B6B-D245-4F31-B3BF-85011CB6B9FD@flygoat.com>
 <CAAdtpL6dnKwDRtXTzDCw9_-+6H0+vgqGqbEdTb+cAmsxO-oOWg@mail.gmail.com>
 <FC5AE5D2-9EC2-45F4-A8CB-326CCE3D548F@flygoat.com>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
X-Mailer: Apple Mail (2.3731.200.110.1.2)
Received-SPF: pass client-ip=66.111.4.29; envelope-from=jiaxun.yang@flygoat.com;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> 2022=E5=B9=B49=E6=9C=8827=E6=97=A5 11:33=EF=BC=8CJiaxun Yang =
<jiaxun.yang@flygoat.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
>=20
>=20
>> 2022=E5=B9=B49=E6=9C=8826=E6=97=A5 22:35=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <f4bug@amsat.org> =E5=86=99=E9=81=93=EF=BC=9A
>>=20
>> Hi Jiaxun,
>>=20
>> On Mon, Sep 26, 2022 at 4:44 PM Jiaxun Yang <jiaxun.yang@flygoat.com> =
wrote:
>>>> 2022=E5=B9=B49=E6=9C=8821=E6=97=A5 13:41=EF=BC=8CJiaxun Yang =
<jiaxun.yang@flygoat.com> =E5=86=99=E9=81=93=EF=BC=9A
>>>>=20
>>>> Hi,
>>>>=20
>>>> This is my attempt of converting MIPS translation code into =
decodetree.
>>>>=20
>>>> Currently only MIPS I to MIPS Release 5 arithmatic functions are =
converted.
>>>> Old decoding functions are perserved in codebase for now due to =
dependencies
>>>> from microMIPS/nanoMIPS translation code. Will remove them after =
dealing with
>>>> release 6.
>>>>=20
>>>> Both instruction encoding and test cases are generated form MIPS's =
internal
>>>> architecture validation tools so they are gureented to be correct.
>>>=20
>>> A kindly ping :-)
>>>=20
>>> Will send v1 tomorrow if no objection.
>>=20
>> Thanks for this work! On a first pass it looks good, but I'd like to
>> spend more time reviewing in the next few days. What did you change
>> between RFC->v1?
>=20
> Nothing much, just tidy up test cases a little bit.

Any inputs?

Thanks.

>=20
> Thanks.
> ---
> Jiaxun Yang
>=20
>=20

---
Jiaxun Yang


