Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC726601B88
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 23:51:53 +0200 (CEST)
Received: from localhost ([::1]:44214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okY1Y-0003SH-8l
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 17:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1okXye-0007QX-F6; Mon, 17 Oct 2022 17:48:52 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1okXyc-0008JL-TL; Mon, 17 Oct 2022 17:48:52 -0400
Received: by mail-ej1-x62b.google.com with SMTP id y14so27951127ejd.9;
 Mon, 17 Oct 2022 14:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lj2hjfi+qEWthqi90w1/8TzVCIrOK/VPgaAEWIVRqxE=;
 b=QOoNh2YEc48XbC+oeO7B2MhwXqTU+Q6cdABra2WGfx9yDq7DFnOgH72cGYs34DCpRJ
 dDO8+O6gSSbEU4y5+jhALFxCbBULTuGPy8r1PH0Als7co8efQcHgTcvXkzNLBgEEiwcZ
 FAOMZJ2nYpVTXbtwbYuSYSt9/F3ypXa/bP7fQ8ATSmT4Dl2M62eGd7DPaT3cbeG9g8HT
 2P7nSRnO8SPFs4kEwIuz+J00rznFCTarCLAFCYbSjwLv9pslhU/BHrh1U9pdrzJGPhWO
 andDY9oaL8LMxdoHrtfO5Xh5L2OI8VVv4UhktSSvw4/zCoL/2ShNMV/vRLbPd4re/FCZ
 gG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lj2hjfi+qEWthqi90w1/8TzVCIrOK/VPgaAEWIVRqxE=;
 b=BeF2bPEpXttrzBVOSJOqWd7vkFhXBx4E2WnW3CdKzk8+3ZLMzAzQzSr8bvXDII9nFp
 OSXxzIBCpLRY5okdTpputi/0HxtOJHc3IdIPRnZToQPB+DvixUVxL9QsINEEhH5uc2H6
 o2oqXhl4A9MvjjVddm+u3Q7eN+l4ldLNxb6UyrJ7heerrdQd+nf93oXqUhFnvHHSMjsU
 ZW2hAX+weBCeX9someLVSW6Us7ZAEEzkvKUwezcSzC/QOp4U/KvsD4QQLBfHsNer1Bvx
 06qTpKLUoyX6un0sqGzKIUOlaPOCq4syS1j3Ze0LiHvrf3/mCBAF6NOHPyK7yJ573iql
 QXZQ==
X-Gm-Message-State: ACrzQf1t+YB0z+1iXluH4v5w+1AgWsuF93m5jMXgZjyo3kmibMgx5Fo1
 w9YwR+hj2Jz9QrxQtPFhpOk=
X-Google-Smtp-Source: AMsMyM7rSUifyEAdOudCuHFu+pX5VGp03hQAlPDmzUkF9cYZ4Y5+lUhXnGxU9Se3pUVVJRGnJDi8Jw==
X-Received: by 2002:a17:907:16a7:b0:78d:f586:e446 with SMTP id
 hc39-20020a17090716a700b0078df586e446mr10327902ejc.252.1666043327833; 
 Mon, 17 Oct 2022 14:48:47 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-012-049-224.89.12.pool.telefonica.de.
 [89.12.49.224]) by smtp.gmail.com with ESMTPSA id
 kv25-20020a17090778d900b0078cf8a743d6sm6636940ejc.100.2022.10.17.14.48.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 14:48:47 -0700 (PDT)
Date: Mon, 17 Oct 2022 21:48:41 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Jan Kiszka <jan.kiszka@web.de>,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 2/9] hw/{arm,ppc}: Resolve unreachable code
In-Reply-To: <ac4a6fd0-9e60-df0f-533e-a9e102350deb@linaro.org>
References: <20221016122737.93755-1-shentey@gmail.com>
 <20221016122737.93755-3-shentey@gmail.com>
 <ac4a6fd0-9e60-df0f-533e-a9e102350deb@linaro.org>
Message-ID: <C15A4702-06BB-4B51-BABB-15D22056CEFE@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Am 17=2E Oktober 2022 20:57:06 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>On 16/10/22 14:27, Bernhard Beschow wrote:
>> pflash_cfi01_register() always returns with a non-NULL pointer (otherwi=
se
>> it would crash internally)=2E Therefore, the bodies of the if-statement=
s
>> are unreachable=2E
>
>This is true, pflash_cfi0X_register() use an hardcoded &error_fatal=2E
>
>Shouldn't it be better to pass an Error* argument?

You mean that the callers would pass &error_fatal instead, including the o=
nes in this patch?

>
>From the pflash API perspective I don't see much value in
>returning a PFlashCFI0X type instead of a simple DeviceState
>(but this is another story=2E=2E=2E)=2E

It comes in handy in the following patches when retrieving the memory regi=
on for memory_region_add_subregion() using pflash_cfi0X_get_memory()=2E Wha=
t do you think about these next patches?

Furthermore, returning PFlashCFI0X can be downcasted which seems safer tha=
n upcasting from DeviceState=2E

Best regards,
Bernhard

>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/arm/gumstix=2Ec     | 18 ++++++------------
>>   hw/arm/mainstone=2Ec   | 13 +++++--------
>>   hw/arm/omap_sx1=2Ec    | 22 ++++++++--------------
>>   hw/arm/versatilepb=2Ec |  6 ++----
>>   hw/arm/z2=2Ec          |  9 +++------
>>   hw/ppc/sam460ex=2Ec    | 12 ++++--------
>>   6 files changed, 28 insertions(+), 52 deletions(-)


