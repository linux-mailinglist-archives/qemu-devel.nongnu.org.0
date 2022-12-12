Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0232649E61
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 13:03:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4hWf-00017Q-2k; Mon, 12 Dec 2022 07:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p4hWb-00014T-I1
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:03:13 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p4hWZ-00085A-MK
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:03:13 -0500
Received: by mail-pl1-x630.google.com with SMTP id t2so8849506ply.2
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bDgtxlpF0c9NPive2BaGR8BK2taSxIqk+EDgm01t9E4=;
 b=uqfk5WLVVihSFmaZA+mAIMGVXCkWKI49UybvFz7RH8XABQrXKxytuvhO/+6cklWLrO
 49WC/PII5hAhF88xtD4F5GSqEF0nPy+p4mF+YQgHmtbPvtXDtqraToKsumEczad/tR0+
 gD+rbVYZot+7Ye3u0V6x2+ty+47NmWS9CL5E0ULvmXIf6FvOt7bCyTpkXTMXwePQjUwj
 s+jg3oXNeYyXRPokkr6idd9MP3CVD2E9e8tU3m6Gdt+1gRAjlvIAt9OudxkAWL7B0GMU
 qSxAvMzgvw830sCaJv/3WaApSNF8fMdk/r977UqAC9KYEM3+c6J9m80vk/dvjcsN4GQQ
 zAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bDgtxlpF0c9NPive2BaGR8BK2taSxIqk+EDgm01t9E4=;
 b=Eb3kCeuYmY5zO1E8RHVdX+BfFRQ3wVfpcrKBuOvEp7ha4Ah1uTvBKtSqlMe8/hBA3T
 Rvh3kHP88VRkqYYA7baqRTotDNiJyY3te78FDuMjImOhFIhPCbOKGwyo3FzlS3FOAlp7
 /nFTbXa1rrEK0M6gJBzytrfwrHhe34t6aIQuMqwozLgQ91z7wYopZHTbBaRgz5krCooc
 Bh2NsfSft9vf0u1ldrwS8ai+v9V1eIudDWchfFiegHyA2ZscgnsthTKn0kJxRVNVOaAQ
 IFk/HnZF6OIiWtv0YPUfuwdpLHbauekVxazF+b81jbybp0d1Ak+bUGKP3JiSEotpDEmI
 KP1g==
X-Gm-Message-State: ANoB5pk/t40Crc+Zv0GL+HCL6MuJpvjUMkR3VNzwHOi2if3Xf0MTZjQi
 GmlYpWb0aSN3y4GxAN1FijBH4J6+ZFSkLDv76O7U/A==
X-Google-Smtp-Source: AA0mqf4S2NpmZjwUkwQJzWbbKT/hJFC/gtPUjKUH7PH/zcc+BIAJEcwo8OMk02HZD05ubu4xt+6omwTKTzawvETk6Jc=
X-Received: by 2002:a17:90b:33c8:b0:219:94b2:2004 with SMTP id
 lk8-20020a17090b33c800b0021994b22004mr29546569pjb.215.1670846587400; Mon, 12
 Dec 2022 04:03:07 -0800 (PST)
MIME-Version: 1.0
References: <CAG7Es24cbb24S1k7=XyA+N7uXCghQT6mt_QkJW4zcO7_usbmjw@mail.gmail.com>
 <F0A77EF0-ED2D-43E0-91D7-B4D70B9E575F@flygoat.com>
 <CAG7Es25r-pY2y+V2GP6Hba4qPos5uN5oeBKQ81gaWctt-jd4Rg@mail.gmail.com>
 <47336F08-8917-43A6-981A-2D2019AD9E1A@flygoat.com>
In-Reply-To: <47336F08-8917-43A6-981A-2D2019AD9E1A@flygoat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Dec 2022 12:02:56 +0000
Message-ID: <CAFEAcA9JhwjPaX3TEFnEDtos5Q7sfROUGjSFyvc1QfUYpsCtFQ@mail.gmail.com>
Subject: Re: CVMSEG Emulation
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Christopher Wrogg <cwrogg@umich.edu>,
 BALATON Zoltan via <qemu-devel@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 9 Dec 2022 at 21:03, Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>
>
> > 2022=E5=B9=B412=E6=9C=889=E6=97=A5 17:44=EF=BC=8CChristopher Wrogg <cwr=
ogg@umich.edu> =E5=86=99=E9=81=93=EF=BC=9A
> >
> > I tried both.
> >
> > Option 1
> >     What I did:
> >         #undef TARGET_VIRT_ADDR_SPACE_BITS and #define TARGET_VIRT_ADDR=
_SPACE_BITS 64
> >     The Result:
> >         perror reports "Cannot allocate memory"
> > Option 2:
> >     What I did:
> >         TARGET_VIRT_ADDR_SPACE_BITS for me is 30 so I masked by 0x3FFFF=
FFF
> >     The Result:
> >         The segfault persists and gdb reports the memory as inaccessibl=
e.
>
> Hmm this looks wired for me, by no chance TARGET_VIRT_ADDR_SPACE_BITS for=
 MIPS
> can be 30, on N64 ABI build it should be 48 and 32 for N32 or O32 build.
>
> It is defined in target/mips/cpu-param.h .

For 32-bit user-mode we currently set it to 31, on the theory that userspac=
e
only gets access to the bottom half of the address space.

-- PMM

