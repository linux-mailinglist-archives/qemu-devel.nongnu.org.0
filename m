Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5FF445272
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 12:46:17 +0100 (CET)
Received: from localhost ([::1]:38644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mibCB-0007RU-Mf
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 07:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mib7t-000693-Sf
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:41:52 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mib7k-0003iW-57
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:41:49 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t30so8107686wra.10
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 04:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s0Za19WIplfe2FfnCuDz4VMUMwRXES7RpvFIqduFLRk=;
 b=jSE4fhme9nd4BT4R4rl4x3oZ4qHAveKa4OF2e+pzPqtPNF6kHe3JBLc8qx0Moojx+h
 nD7hLojG145u7vByToO6DDQlSl417E+tDwOCIhLaHcQKAOAZ5hHkLdsIdP6UumRA54fF
 QeHWTx7mDPWFvlLi1pzwOhPG88BViP/x41hHVo5eGiUOR7C0odYeuOgYzF3yih9x9ccO
 cwATkD5H7J03I+dsoO084q41Z+nqALKfKTgUeBk2AG8ofwvevxLJzWr1XugTG4c6q5uu
 HBg8jc6JKnZvrzr6yk/8iSkrE08SnP/wyYs6BgOvum8jv5e3kdx38UP1ZdyeIO+KgV7Q
 LJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s0Za19WIplfe2FfnCuDz4VMUMwRXES7RpvFIqduFLRk=;
 b=PBCs07/4MMwX3vu5Z3YoQR9h61NCKQ9+Zhc3mo/LiiB3dmPYvsFfeVApYnjLV3vboX
 rCoX6whAzUdyR4VJM082Wij0uQbOHXB5eS+a/J7oMd5i+CUTc/D30bgeiQs6Z3VHlRt7
 RjqOiOHbg0yLDQgOQbQpcsS/pQ3dyPXtzAq9wqz75TMTxMi/2FDeWuYEcdPjv2dprnMt
 iS5YpQZ+JxhhLjFDUhyXnkYiVtWDReO4Z+DmbeegDeLBXdTvr0+MUT9YwLrjH9j6Gz9Z
 eGptuNEuQklLKrS2om6GRwA/OBX4Qb5WaVtOpfrBMEDK9DEZHkL65UEnOGNinewO7NSS
 +njw==
X-Gm-Message-State: AOAM532apwgdQpGVRqHPZypChmySxwOSWPSs/RcbMX7wsy5YNuIANLc/
 lI72GzuTqmLmc5gOaFaCEypPW2CSMYqV9PySNFRs/g==
X-Google-Smtp-Source: ABdhPJwpvzvCJVK+19v5h5I8spaMLDAoUBXpohk61d/e/lB5AiRcF+YOecDEDVZ6lMpcX7JrYVBLK7Y29TJ/Ph8gs4A=
X-Received: by 2002:adf:c40f:: with SMTP id v15mr54778676wrf.302.1636026098220; 
 Thu, 04 Nov 2021 04:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <20211026002344.405160-7-sjg@chromium.org>
 <CAFEAcA-UukuQXT3ebcboiVOSn0J+88w-kzoH8jE1JVxQnoeuvQ@mail.gmail.com>
 <CAPnjgZ2C8okdUMcgKjuLgV8JdPexYY0=9NtbSOHO81dN7=2RCg@mail.gmail.com>
 <CAHFG_=XWc+Fb=m=SHC6=y4KeF533yqCNk=Ae088oAZyjOULPaw@mail.gmail.com>
 <20211101180707.GJ24579@bill-the-cat>
 <CAPnjgZ0XeFHrXwBuTZ=eoKHCo7cMSuM_gUiTfv-Sqt8o6tPOXw@mail.gmail.com>
 <20211102172833.GS24579@bill-the-cat>
 <CAPnjgZ1zDeXMCtccy6=cQzjjAz92xJZunObm2OYKZ2eyP=Sdsw@mail.gmail.com>
 <CAHFG_=UTbUkZ3EUss4qoJwL6nJcL6tvZQATfPrH1WFQpRgqubQ@mail.gmail.com>
 <20211103144125.GZ24579@bill-the-cat>
 <CAFEAcA955NWTGhaEHYqjWppsDxH4BDEX4NiAew69mkwCVvjnLw@mail.gmail.com>
 <CAHFG_=WhM2-oByH2-WZO5prQx548JJFFGf2+TsUWOg_Sw+-6hA@mail.gmail.com>
In-Reply-To: <CAHFG_=WhM2-oByH2-WZO5prQx548JJFFGf2+TsUWOg_Sw+-6hA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Nov 2021 11:41:26 +0000
Message-ID: <CAFEAcA9WSzk5qYwm9U0BSiM_DUXnERV_59WKbdQU-PwaY18gAQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
To: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Albert Aribaud <albert.u.boot@aribaud.net>, Tom Rini <trini@konsulko.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Nov 2021 at 11:22, Fran=C3=A7ois Ozog <francois.ozog@linaro.org> =
wrote:
> Le jeu. 4 nov. 2021 =C3=A0 12:09, Peter Maydell <peter.maydell@linaro.org=
> a =C3=A9crit :
>>
>> Well, our recommendation really was that the ideal thing would
>> be "you take the dtb that QEMU passes you at runtime, and at
>> runtime combine that with whatever extra information you want".
>
> That looks just reasonable this way.

> So we need a =C2=AB -mergedtb =C2=BB option for Qemu to have the same
> capability. This would merge the QEMU generated one with the
> command line provided.

No, I mean that the guest, ie u-boot, should do the merging,
not QEMU.

-- PMM

