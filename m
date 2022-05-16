Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56484528910
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:39:52 +0200 (CEST)
Received: from localhost ([::1]:38728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcp5-0003dj-Ah
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqc9o-0003ch-8z
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:57:12 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:42309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqc9m-0001JN-Nq
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:57:11 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ef5380669cso156086297b3.9
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 07:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N89Sx8/KAkUuHJ7/ED0/EHJX3wQIKDwFFofDvqvUYdA=;
 b=Qb1ylrbJTTk0hEbxeoTx+1+frF7XgddeLFuyHgIhrpSE8amy1lp7xo+1ugDvrw+A5F
 rDopXW/IziDBD9oMjoynND6tCYjWxU7j/yaFeFsxKK8wFQ1dL0x8H17Po2jxP/uoJ40V
 hXaGscsAEkm3Iq8B2evXID9UoP8iP1nqJzwAtxLsUOJvVoYrswNT2AuvTG0oqOUv7JAU
 nRD+aK9U+NmJMsN2fP0pPEnLvfP57Ax/b2nJ7XWrYSQxlrBTXaBPU7KKVviAhsjDoWhh
 okVQMwOVvlCI719OHSaWymZEOysY0vQcPy4OjNe+wnP0U+UaLWT1zsrlGbzuC5KPi38C
 xjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N89Sx8/KAkUuHJ7/ED0/EHJX3wQIKDwFFofDvqvUYdA=;
 b=AadhMhPhjt6b3c6/cD+rIDXfobm8/BpsXt2+1i7sllUy0a81Rz4rZCPCEHg5rmjJtJ
 YexiM84sr1uVkrc+fxOk7/qAbaUuWCBmYgRn2+6jlmeK6WfzG420DIz5mo/vOi1NSn9A
 HnrV1ZGCvGO4HohH9LclO3EOS/SdOlIvsSV71yx7l5l7GLF5plgsl7RPAcXfBxTSDrFK
 bI8Jv1J9LXfPMVOTPH5yEaHUorAq3STkB0Rg+N3IKftlvc4AbEpk9id/DFLlSu6s+BDe
 OtEZ2XR8riaoaTfIo9FGPOdns0jU+4wULuLOrcQ/LERav2K8zCgBt6YHf5OkGH5t9tk1
 35Kw==
X-Gm-Message-State: AOAM530ruAx1GBFZTTS8o0XzEtAqi6AtSD4mB5mOOKG4pR206OFZpdFC
 6J53pBa63fuyg08K+zcKDjgUsRt/P9gs5mI8amBR9w==
X-Google-Smtp-Source: ABdhPJx6UX6fZ1Snft4Vi959h5AJ/FXZgcTqqQBXdY9caOMoWxN2tXK68Dt9WKI1n3zM5BWPcelErmxSccghbBcikYM=
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr7743832ywc.329.1652713029278; Mon, 16
 May 2022 07:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220513040220.3657135-1-pdel@fb.com>
 <20220513040220.3657135-3-pdel@fb.com>
 <443933f2-069f-df96-ec62-76c21fc644b2@kaod.org>
 <05F5C72F-8424-476C-82B7-7D30BA48CDEB@fb.com>
In-Reply-To: <05F5C72F-8424-476C-82B7-7D30BA48CDEB@fb.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 15:56:58 +0100
Message-ID: <CAFEAcA_dadj4cuE55K4ng-twgGO98FOcLX7Y=1_Y9Z929NUZLw@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw: aspeed: Init all UART's with serial devices
To: Peter Delevoryas <pdel@fb.com>
Cc: Iris Chen <irischenlj@fb.com>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 qemu-arm <qemu-arm@nongnu.org>, 
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 "zev@bewilderbeest.net" <zev@bewilderbeest.net>, 
 OpenBMC List <openbmc@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, 13 May 2022 at 22:09, Peter Delevoryas <pdel@fb.com> wrote

> I was actually intentionally skipping that. If serial_hd(i)
> doesn=E2=80=99t exist, the function will return NULL.
>
> Chardev *serial_hd(int i)
> {
>     assert(i >=3D 0);
>     if (i < num_serial_hds) {
>         return serial_hds[i];
>     }
>     return NULL;
> }
>
> So then, the serial device=E2=80=99s CharBackend=E2=80=99s =E2=80=9CChard=
ev *chr=E2=80=9D
> will be initialized as NULL. Looking at all of the
> usage of this attribute in =E2=80=9Chw/char/serial.c=E2=80=9D, I think
> that=E2=80=99s ok, the read/write functions will just be no-ops.
> They all have guards for =E2=80=9Cchr =3D=3D NULL=E2=80=9D.

Yes, this is deliberate. We added these in commit 12051d82f0040
because otherwise lots of board/SoC code would have to create
NullChardev dummy backends (or forget to and then crash depending
on the user's commandline).

thanks
-- PMM

