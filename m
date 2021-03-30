Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C79234E742
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:15:36 +0200 (CEST)
Received: from localhost ([::1]:54628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDHT-0000YW-1o
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRDEJ-0007d8-5Q
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:12:19 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:46639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRDE5-0004bD-VU
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:12:18 -0400
Received: by mail-ed1-x531.google.com with SMTP id h10so17894164edt.13
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 05:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mJ9M33cDCjhYTUEaHD0TsWrYQjawwdPNd3sWNoPigPg=;
 b=tbQP09jW0SGuBP4vg1qL/mSHKnkM5CvAomE5Yf1HENoRacGwgl0h05F6ErgN3wVs6L
 AgmhbaOL9XJxTnjDRgIgYLf0ec7i0q7x1UX2RXFwkIGFZBNiafrsxnWfjoDfZKbv328Y
 vuOSEsAqeiUDvxk66NMFSPtICeaVQEr/RZwdLnAh/zD310nhZGDDIbe3xrgvtOCUnk/4
 wDN7beUyFNs3WT+92URalvaBxXX/NM1sMSTWZPYnqLTe0plys4QfsjQJ4Att1Uxa/5mm
 2PRWGcePWEH8DofO2yas5x0F81v9FTIWZqGyinjkJk+smQr5JnyZQlaAtFXajd5it0Hl
 5CFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mJ9M33cDCjhYTUEaHD0TsWrYQjawwdPNd3sWNoPigPg=;
 b=CkjYhteCIexhst1ufyJrV+3Yghem8dogtVQcBjjrUUCPXcVPOBgN1VEd6Il1bYV7rz
 pcfysrQfNyOp/KZDNJa7GGDW1k3EUuPj26QRMjfEEP3LKnaWV/MCh1/B6FcKGs/XkeOI
 GQhxIIm+u+ai9U7cZtFfaTuXbvS6LTwb3ZYpY0XTTvIXiCQVB0+CtJOsvXAdguVlixXV
 yiRrj3IMKQF8Ydw6IbcvxydXrMaYoVzkfYECPsnQSiLmbrOYCT2ZFLLjOXMvG7QNzzSm
 tWwcLOMPuMrBmgeysmB8mF4dth9E4ceFMauhzV0/2XJcQg7jr1A4+eK9Zpv8a04t2mMt
 wnwg==
X-Gm-Message-State: AOAM531U5dSxi4oGk/SzaCZjQOIxFQUl0Z8lSNE9HwQtajWRTAPZUi37
 bwOYMn64UU6kfA9JgAk7ZUvEiFvPNUZJIH/htbqxH9xSNQL7YXvR
X-Google-Smtp-Source: ABdhPJwQ4SZqBXnHoVfjHDTT3891VydjC3vznQNmJ5UKjkMjagLquH5lxSqRLWAT3Nj5UWY2kPq8Ia2s1c1mjf76Amk=
X-Received: by 2002:aa7:d686:: with SMTP id d6mr33734784edr.146.1617106322282; 
 Tue, 30 Mar 2021 05:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210328184533.752840-1-marcandre.lureau@redhat.com>
 <CAFEAcA9FiNLr=CsxRLpUbMgROMBmO-8WoPtEkfL4b4+ZHrAhdA@mail.gmail.com>
 <CAJ+F1CJK450rAMA7VU2b7VFL0FK6f3mkR=kwPB+d5M4DozRHFg@mail.gmail.com>
 <CAFEAcA_i-jx4PvDSqcZ12TWtJMzRoEBGO3tUbUJqU1voecksaw@mail.gmail.com>
 <CAJ+F1C+uax+uUhR_dARx4kLAmc4-OgEMCh795+iW4yjm-1RPvw@mail.gmail.com>
 <CAFEAcA_=GCA8FgLfBxiLvjUaOkV0TATUsuO7an2phFxmJkMxtg@mail.gmail.com>
 <CAJ+F1CK2jf5O226zLqpKt_=9mSE4t979huMZ0s9FGZ4TATKguA@mail.gmail.com>
In-Reply-To: <CAJ+F1CK2jf5O226zLqpKt_=9mSE4t979huMZ0s9FGZ4TATKguA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Mar 2021 12:11:30 +0000
Message-ID: <CAFEAcA8dnsC30ZQVXOCLWdwb50nQFcWQjRZB_m5S6Mpv3WC2Ug@mail.gmail.com>
Subject: Re: [PULL 00/10] For 6.0 patches
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Lukas Straub <lukasstraub2@web.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Mar 2021 at 09:29, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Mon, Mar 29, 2021 at 9:54 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
>> aarch64 CI machine, which has python 3.8.5 and sphinx-build 1.8.5.
>> My guess is that it might be the sphinx-build version here. I vaguely
>> recall that Sphinx is kind of picky about exceptions within the conf
>> file but that there was a change in what it allowed at some point.
>> It's possible we just can't do much with the old versions.
>
>
> How do you run the build? Running make from an existing configured or bui=
ld state? If so, I have seen sphinx errors that don't stop the build (and a=
ctually building the docs without sphinx-rtd). I don't know why this happen=
s, "regenerate"/reconfigure errors should stop the build.

On that machine, yes, it's an incremental build.

thanks
-- PMM

