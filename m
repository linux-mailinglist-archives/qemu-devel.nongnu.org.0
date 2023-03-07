Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137636AF775
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:23:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZel0-0001w9-V3; Tue, 07 Mar 2023 16:22:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pZeky-0001tu-5A
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:22:00 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pZekw-00085V-9M
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:59 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C86EC5C007E;
 Tue,  7 Mar 2023 16:21:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 07 Mar 2023 16:21:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1678224115; x=1678310515; bh=I1wRiSasCY+WcUnvFdTK9PkNOAQg0HtAs7T
 s9sgcnAA=; b=BVcV4YsgvLYWN28ojh5494A4Q6uEwm+fzE5wZ/LbS3EtxSJuMfH
 ZhjCR1eAj4OPXZZQcpJbP2GExextBtBFny4YHOh1WUmZGOuV+7IAgyM5Vx1GWzB9
 wfgU2F9uQm8zKXtgTRo7xX5HzvAME6s6NeRVjf3lcDY0TGH2CD8AxgQZ/R7jUebS
 9QTzUjJ1IBYNGroa8opuO0JbUHuyd/zmz4suvbHaYQvyRtEaUUwgetcrT3codXa1
 qkJd8HbOV23Li+r2GwfitH71F8xOfja7hva8LSAM3Q2ykCpLTRGnTY0XHc9DZtXS
 s4m7RXnMmXb/5QRDToPd2jlHVfsj+VYBKSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1678224115; x=1678310515; bh=I1wRiSasCY+WcUnvFdTK9PkNOAQg0HtAs7T
 s9sgcnAA=; b=VbX+4JzqN9JJsESdgvbVx9gwwjmCT56em16+wqvKWUok9cYY/i/
 yD0NSeyhQXqEs5j6acORMFi4pNObTdeQnvGp0OgRfOO7pKGiEVkcX72tnYTOs+XQ
 Yelej8ZjjC1Vq969qPx8d+bIrQiKyuNH/L4/z3sQVB9S7V7ti6YFHrXCPA9PIe6G
 S1w9Q2+6ZPI76ZQ2ZGqpQp8VijphpAakXGmr4nhQakhJTBO+JEA+/BSj8NzpFKJK
 AfsjpUc0R947VogHftxeWSGATnXz0LCSfMoNxRqGM2fRj+7/kppBTLNEsiwWqkKA
 ta15Q+e2bGVeUKHDoVawCP68lQ61QcLR/Ig==
X-ME-Sender: <xms:8qoHZE66Nsc8mDT2Uj7Of0aT8iokV6UgZJxbnB7P-1dy84Yg_dofsw>
 <xme:8qoHZF6DjakMzVFGKjlP76hr8mnmSOvibCCETuco50PIEASGr5IY1CuXkTyZQUzco
 ChJt1Y1dTmYOffLt2o>
X-ME-Received: <xmr:8qoHZDe7T-vcG2_ihkruP5n9YNPJPQUdxZWjHZlnfDVKTftoa7VoxrUIP5ClbUDqbL1n>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddutddgudegvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
 rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
 enucggtffrrghtthgvrhhnpedtleefhfeuudelkeehieetuddtieegkeeuhfetvdeivdef
 jeduhefhkeefkeejvdenucffohhmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghn
 ghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:8qoHZJKMvWDh7Ve58mb2pA8-kATjvUdDhDuEvEUUbBKSs3IMqR8e9Q>
 <xmx:8qoHZILK2-tnnJIcK0k4NjT3nQRos8COeykg4h73CckrzdDaMwpPJg>
 <xmx:8qoHZKyhRNGyYGKrKKxQy7qyIVm8yrSAL5lrejTy8bRa3u55bD_iNw>
 <xmx:86oHZCjYLk0K3nZAQrvxX_LsKOvYCk7IghW0rrpp1fOCPaFKr4oYGg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Mar 2023 16:21:53 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v2 0/2] MIPS Virt machine
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <db670377-a390-4ff6-14d1-30ab531141bd@linaro.org>
Date: Tue, 7 Mar 2023 21:21:42 +0000
Cc: QEMU devel <qemu-devel@nongnu.org>,
 Thomas Huth <thuth@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <817CBBB7-83EB-4A9F-9D61-0A75CAEE7FAC@flygoat.com>
References: <20230304223803.55764-1-jiaxun.yang@flygoat.com>
 <67f67c63-3706-cb3f-94a8-beea99f62c05@linaro.org>
 <F2FD4D49-9513-4147-B8A2-07048C055A75@flygoat.com>
 <d300dc97-557c-a0ca-0206-02068655135c@linaro.org>
 <db670377-a390-4ff6-14d1-30ab531141bd@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
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



> 2023=E5=B9=B43=E6=9C=887=E6=97=A5 21:07=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <philmd@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On 7/3/23 21:14, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 7/3/23 21:07, Jiaxun Yang wrote:
>>>=20
>>>=20
>>>> 2023=E5=B9=B43=E6=9C=887=E6=97=A5 15:01=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <philmd@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>>=20
>>>> On 4/3/23 23:38, Jiaxun Yang wrote:
>>>>> Hi there,
>>>>> This patchset is to add a new machine type for MIPS architecture, =
which
>>>>> is purely a VirtIO machine.
>>>>=20
>>>>> Jiaxun Yang (2):
>>>>>   hw/misc: Add MIPS Trickbox device
>>>>>   hw/mips: Add MIPS virt board
>>>> Thanks, applied with following changes:
>>>=20
>>> Thanks for those clean-ups!
>=20
> Unfortunately I have to drop this due to the libfdt
> dependency, which fails the --disable-fdt job:
> https://gitlab.com/philmd/qemu/-/jobs/3890587748

Perhaps we should just select TARGET_NEED_FDT for all MIPS variants?

Thanks
- Jiaxun=

