Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0920E55316C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 13:54:28 +0200 (CEST)
Received: from localhost ([::1]:59552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3cSh-0007y5-5d
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 07:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3cRR-0007FU-CC
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 07:53:09 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:34618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3cRP-0003Ay-RT
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 07:53:09 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-317803b61e5so102629557b3.1
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 04:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XMLtcYbrtmIYWZyx9k5Mr4wNk+ngKbFjvzDvi5VPYTY=;
 b=So+a1TKzq4Nhk1kRLIz2MDiLXSxqcNKqkzADyJvL7r4bFrDfOuDjFdMGCJzJfZv414
 HpLMOB9HyBzYy1O9zFM8MGlEqWIClOsIRQARzKwQsRbKbpQ00Psl5cHFtu5DrO9UGsPc
 dk5ElOnTq3FNG1ZHtmOqsCeTbCG1Lo8tMgWPIEMreVLU6/exGxgTLIM/LaQzOw//ulnE
 xU3HNRnnUNqTaXPXGn+/A1HJToYUmVpN0OBJEVcReQHZU8eiLKoPQH7CGw68GlXG3LZr
 0UumnYWmPOfX3SRXFQRE9VnEqX+2XmCYT28NVnYyDPKLGHWf90nIBnOeFq/Bh8kRQwSR
 OvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XMLtcYbrtmIYWZyx9k5Mr4wNk+ngKbFjvzDvi5VPYTY=;
 b=WoGEJGgE2rstr5EifgSwN9pJBI8fpWTOKmkzeM8pD/m7ROX4dLCTYa+Dtq3uAcjy//
 nzAOW7e/EVn+OEGD5MK7Fk+n7eBHX89adPpVKZ3IgYwkzYKtt0rCfcP7ifBRPg4QaLAD
 hI7yI4HsB88SQoWAkiaTry+1V587rZMxN0UV/DIFBmygEwrpRI/pZfS9p02VFpaaz5PC
 FM4xqfT3KAezJiSdaQAT2uF2iIsBnS20xyZOzSsl0BcuDhic0Wombr9cLt9PtCv93ani
 IL/D6Oxj3hvzI0T7bfh3QEr9kihJazQ8tY578C8+pzlF6bPJsIjqwEfTQYa7XcE6A0l5
 ylqg==
X-Gm-Message-State: AJIora+ovZbDMtP5PSjMFt+Fd+Y1berk3tkUB7gzK09K1DoDG08s0wO8
 ZO0MJuyFyR/Cbqes6OxpIV0TiKKb5IQNxRxS/1eYfA==
X-Google-Smtp-Source: AGRyM1tmkCkeZq0UPXLe/+wDN0LTOGZEN/rnMf/p+yTZX69+TyyVICE9tz+0xk9o22/zygaBpaEl2sggvXmsIGYkJn4=
X-Received: by 2002:a81:a047:0:b0:317:8761:14f8 with SMTP id
 x68-20020a81a047000000b00317876114f8mr24442535ywg.469.1655812386804; Tue, 21
 Jun 2022 04:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220621083420.66365-1-marcandre.lureau@redhat.com>
 <CAFEAcA9SyfaMYkH2RvELExUJF_V-XbnhCmJa_m7RA0rOTOvEQQ@mail.gmail.com>
 <CAJ+F1C+AYGZmT0RVfc4Vc2o+sw2dcRXOmvCO3vZXUf3Np5zENA@mail.gmail.com>
In-Reply-To: <CAJ+F1C+AYGZmT0RVfc4Vc2o+sw2dcRXOmvCO3vZXUf3Np5zENA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 12:52:55 +0100
Message-ID: <CAFEAcA-VWnD_8+nJN1JJT77uLWjeYk6-bKUcBjAHG-aUiybwsA@mail.gmail.com>
Subject: Re: [PATCH] tests: fix test-cutils leaks
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 21 Jun 2022 at 12:50, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Tue, Jun 21, 2022 at 3:46 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
>>
>> On Tue, 21 Jun 2022 at 09:36, <marcandre.lureau@redhat.com> wrote:
>> >
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > Reported by ASAN.
>> >
>> > Fixes commit cfb34489 ("cutils: add functions for IEC and SI prefixes"=
).
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> g_autofree would be neater, but this works, so:
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>
>
> sadly, not really, since you have to call g_free() before new assignments=
... (yes it makes me sad too :)

You could split it up into multiple variables:

 g_autofree char *s1 =3D freq_to_str(999);
 g_autofree char *s2 =3D freq_to_str(1000);
 g_autofree char *s3 =3D freq_to_str(1010);

 g_assert_cmpstr(s1, =3D=3D, "999 Hz");
 g_assert_cmpstr(s2, =3D=3D, "1 KHz");
 g_assert_cmpstr(s3, =3D=3D, "1.01 KHz");

-- PMM

