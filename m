Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054E56AF66A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 21:08:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZdap-0005Vv-5Z; Tue, 07 Mar 2023 15:07:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pZdam-0005VC-2W
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:07:24 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pZdak-0006sR-Av
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:07:23 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B0DB93200AA4;
 Tue,  7 Mar 2023 15:07:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 07 Mar 2023 15:07:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1678219638; x=1678306038; bh=zlUwmYWb8l8mLhKneVr12s0w+LZ9RS7m/Qi
 QNA1A4Us=; b=g7SSwJ5+iWDrG4Cr4Wmb5obPmHnxyR1d5v5HxkbYz4ScD3dpgV7
 xgBVbWlNIlepv2907F/ThtCeHllYjwoTPigSWazevuRpUCYvYGTQACMlz/7sgT1O
 0JYMV/33G8hh/vHPD5eeps4wFau2Gmt0yxzzA5b0ZjodVubEssvzOp/YiDIivwPA
 1o3geDpHCAqu0RmwapUzvXcBadGQgv0ggiACl80AgP64k2Bo9BfdhKRlDOY/IOuS
 EQMWoOh/G+7e42KyV9MVpu3SDo4dcFdybv/OT/E7AtW4QVROgp0GjktuS03opBKj
 8zLF9jSY4z6tQtmYv4XAosj060BJvUMn6xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1678219638; x=1678306038; bh=zlUwmYWb8l8mLhKneVr12s0w+LZ9RS7m/Qi
 QNA1A4Us=; b=EDxlHpLVIKKoqEfF0b2hGKzoBN1YRpztO1mGDK8xsmN672GVINr
 Z1/qNDczWbZ1kabRPt8SR8DhepdL5mxBxITfZBtP+VcZzkTNcyOyyJVxd9K+fbCQ
 0IwpBddWL66FGWj4jNEzBgu8erlK6nfSnCxKYlLMddCRaJ6/PPc+nQwCIk6TYvvy
 AM6SAPEh70Xzhc1yRtGzL17Y39EAgw3lJAckA6LPlRaXt9xELIDJEL0qtdFKbLHk
 mXgYQYXjd0IHHVpUQPUFdyGR2Ivy9zQamZ1Og4TgWhyRrSTQ17tHYNNUZq8W5PtT
 5T+AlOD3nG++7WBb8UyE7ozord202bPY7yg==
X-ME-Sender: <xms:dpkHZPMi88uV7r8MbQ2aF3HI44QdHdqqnDnr3lq9z7qa7zd09KxEeA>
 <xme:dpkHZJ9P5oHpvSVF2302vTVwP-7arCP49MxDhBLqDSeZPXpvVCLKgbQngG3rSJJum
 yMF33On5Weq93pWM2w>
X-ME-Received: <xmr:dpkHZOQYjXojPIfH_xUYdGtjFV1bdnS6Q_ZTiTud1ddYG65q7WcyG8jyNMpcuiANuYYi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddutddguddvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
 rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
 enucggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefh
 ffelvdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:dpkHZDvdg-GXbYaCL99RrSP6rOb5bA4FQuMx-Ws3Yhx3_U28K1aNfA>
 <xmx:dpkHZHf4j9bnd4PikZKz-c1T8fcjsTraSMZLvFvxfv99X0gyfcIT8A>
 <xmx:dpkHZP1QInWIRJeHVII56zYFcpgFT-dEFwRaNXObiOHho4XBBa3PIQ>
 <xmx:dpkHZHnu5svAkzobyTYX736gh6r90I3x6bJwL6wGZG8Jd301dFBJ4Q>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Mar 2023 15:07:17 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v2 0/2] MIPS Virt machine
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <67f67c63-3706-cb3f-94a8-beea99f62c05@linaro.org>
Date: Tue, 7 Mar 2023 20:07:12 +0000
Cc: QEMU devel <qemu-devel@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F2FD4D49-9513-4147-B8A2-07048C055A75@flygoat.com>
References: <20230304223803.55764-1-jiaxun.yang@flygoat.com>
 <67f67c63-3706-cb3f-94a8-beea99f62c05@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
Received-SPF: pass client-ip=64.147.123.20;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout4-smtp.messagingengine.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> 2023=E5=B9=B43=E6=9C=887=E6=97=A5 15:01=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <philmd@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On 4/3/23 23:38, Jiaxun Yang wrote:
>> Hi there,
>> This patchset is to add a new machine type for MIPS architecture, =
which
>> is purely a VirtIO machine.
>=20
>> Jiaxun Yang (2):
>>  hw/misc: Add MIPS Trickbox device
>>  hw/mips: Add MIPS virt board
> Thanks, applied with following changes:

Thanks for those clean-ups!

>=20
> - remove pointless mask in mips_trickbox_write(),
> - declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE(),
> - declare machine type using DEFINE_TYPES(),
> - do not select PCI in Kconfig,

Hmm, PCI is sort of mandatory for this machine, any reason not to select =
it?

> - compile virt.o using fdt flags in meson.build,
> - use HWADDR_PRIx,
> - name MachineState variable 'ms',
> - fix conflict in docs/system/target-mips.rst,
> - fix style

Thanks.
- Jiaxun=

