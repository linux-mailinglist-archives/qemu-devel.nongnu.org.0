Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A5F69BD90
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 23:56:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTW6I-00035L-8v; Sat, 18 Feb 2023 17:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pTW6F-00034y-UL
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 17:54:36 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pTW6E-0000lc-6f
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 17:54:35 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 683225C00AC;
 Sat, 18 Feb 2023 17:54:30 -0500 (EST)
Received: from imap44 ([10.202.2.94])
 by compute2.internal (MEProxy); Sat, 18 Feb 2023 17:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1676760870; x=
 1676847270; bh=xfy4M6yfJjzrch62fe+0v7UyKRTVkUhxdzluL14h3hA=; b=f
 CbLavu1h7kluaoesx9B9zRwdNI4TjWsOz43xcY8B/+Aq4Y/Plpww8mY4ozxTFPHK
 97ZgSGvq048+6zybJYQT4rDCoQq2ASmVChHy4kZAGZVffr5K8xoYX4gFI5KDe9pi
 PmnfDp4G/oYTyxcaqoTrDDc4ydwtdKKynN+BqU+eim9kNJWPsBs78xhrtJpEsycI
 hQ1GF0uUkFRYfPSUMEHd3PzjN7thJkgpirx74R/nDnXKJtlZz3NjWqDGGD0peYyU
 +EO5/FnFHwC/4kzAMDlhXr+YF1w9q9HjgvfCKirhukmwWVhzODFRJmC1l7VPN72T
 cu5S8J/KCg5QJVvWGpHog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1676760870; x=
 1676847270; bh=xfy4M6yfJjzrch62fe+0v7UyKRTVkUhxdzluL14h3hA=; b=E
 Si1e4fKbga+eSKANOe8JNZ9TjEAw00l80JY7l8u/897GxmZM57S83A3K7mi20UHk
 KnmPvXY0HGa69iPq7kPjl2+7p3fND9xrVvUFH7EgAsHLL+gxcqIzoBFNqkyUlRIu
 MG/DiwKiDu7JoyHDnM+s59g5qGLxLTRxgGlPVmHMwFVtrAruLlSpeZIs4lxaZLHv
 KHfdBRJeXhYt8uahcMD+Wuf+gJTOdUcXKP8esCVqDY0kItLXLpeFBlK+Zg/y24pA
 uHkPDy9WE3yx8xwI9YpCMYEssvFe3a0ePKQsfdYKo5div0H1uP+XSpul26WoHZG5
 mv1aw20/SMiKE/S2Mt4Uw==
X-ME-Sender: <xms:JlfxY8lW63PNDPRplg07jxGqSHECdCc2tIB0OAdbULFPiCRNZdLQgg>
 <xme:JlfxY72lbmI7prPQOg3dKTO6Ijo9H9xByGtzAyUNhknFwfLI1NnSQY5bSDkV0hLG9
 rM4iJLm5XlCX_-aAkY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejvddgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
 ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
 hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
 ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:JlfxY6q3oPnB17i4hPTEX2YIxklopLYnW53qBWJzWv958ujlOnSbMA>
 <xmx:JlfxY4lbDLBUsSEEmYAGHc_ICXKgRVoMIfydgz2m-21THwt40IZJbA>
 <xmx:JlfxY63TD3yiFAkPSr2BwJdKucBWzMNTLHJtjqLU9kWiL_z0z9Sgaw>
 <xmx:JlfxYwNEQwpWwjesKV-v8yuNKu_h6TSmUO4R0gfQsI25xQtSK-y4zg>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 02A3B36A0076; Sat, 18 Feb 2023 17:54:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Mime-Version: 1.0
Message-Id: <ab38f963-f6a1-4451-a2ac-282dcac199e9@app.fastmail.com>
In-Reply-To: <113c15a8-689c-de03-7543-5548b7c658e6@redhat.com>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <87a61cbmti.fsf@pond.sub.org> <Y+9bSHshiNnek31J@redhat.com>
 <b55b506e-5a73-329a-24ee-14eafc5a95c1@redhat.com>
 <72bd7694-9d37-1f9b-db4e-6d5818f7c55c@linaro.org>
 <113c15a8-689c-de03-7543-5548b7c658e6@redhat.com>
Date: Sat, 18 Feb 2023 22:54:08 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Huth" <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Paolo Bonzini" <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Markus Armbruster" <armbru@redhat.com>
Cc: "Peter Maydell" <peter.maydell@linaro.org>, libvir-list@redhat.com,
 "Stefan Weil" <sw@weilnetz.de>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "BALATON Zoltan via" <qemu-devel@nongnu.org>,
 "Reinoud Zandijk" <reinoud@netbsd.org>,
 "Stefan Hajnoczi" <stefanha@redhat.com>, "Ryo ONODERA" <ryoon@netbsd.org>,
 "Brad Smith" <brad@comstyle.com>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.27; envelope-from=jiaxun.yang@flygoat.com;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



=E5=9C=A82023=E5=B9=B42=E6=9C=8817=E6=97=A5=E4=BA=8C=E6=9C=88 =E4=B8=8B=E5=
=8D=886:57=EF=BC=8CThomas Huth=E5=86=99=E9=81=93=EF=BC=9A
> On 17/02/2023 18.43, Philippe Mathieu-Daud=C3=A9 wrote:
>> (Cc'ing Huacai & Jiaxun).
>>=20
>> On 17/2/23 17:38, Paolo Bonzini wrote:
>>> On 2/17/23 11:47, Daniel P. Berrang=C3=A9 wrote:
>>>> On Fri, Feb 17, 2023 at 11:36:41AM +0100, Markus Armbruster wrote:
>>>>> I feel the discussion petered out without a conclusion.
>>>>>
>>>>> I don't think letting the status quo win by inertia is a good outc=
ome
>>>>> here.
>>>>>
>>>>> Which 32-bit hosts are still useful, and why?
>>>>
>>>> Which 32-bit hosts does Linux still provide KVM=C2=A0 support for.
>>>
>>> All except ARM: MIPS, x86, PPC and RISC-V.
>>>
>>> I would like to remove x86, but encountered some objections.
>>>
>>> MIPS, nobody is really using it I think.
>>=20
>> 32-bit was added in 2014, commit 222e7d11e7 ("target-mips: Enable KVM
>> support in build system"). I'm not aware of anybody using it (even
>> testing it). I don't have hardware to test it (neither time).
>
> Could you maybe suggest a kernel patch to remove it, to see what happe=
ns?=20
> ... if nobody objects to the removal of the 32-bit MIPS KVM kernel sup=
port=20
> and the patch gets merged, that would help us in the long run, I think.

I=E2=80=99m still occasionally testing 32-bit MIPS KVM support with MIPS=
 P5600.

It works just fine so there is no need for further maintenance work.

I=E2=80=99d be sad to see the support go but I can live with it.

There are commercial users for MIPS 32 KVM but they=E2=80=99re all runni=
ng customized downstream QEMU so I guess it=E2=80=99s fine.

Thanks
- Jiaxun

>
>   Thanks,
>    Thomas

--=20
- Jiaxun

