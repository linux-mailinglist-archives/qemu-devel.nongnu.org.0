Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABED528629
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 15:58:42 +0200 (CEST)
Received: from localhost ([::1]:45212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqbFB-0007st-Ru
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 09:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqbCL-0003ul-9r
 for qemu-devel@nongnu.org; Mon, 16 May 2022 09:55:45 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:46222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqbCJ-000897-Oz
 for qemu-devel@nongnu.org; Mon, 16 May 2022 09:55:44 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2fb9a85a124so150559007b3.13
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 06:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Cfak1sCmnJrnV1Yo+NxsxHZCqNDIlqraMOFrcarHYaY=;
 b=fHAX9WzopvS1YRo5O+t/JwrnH2SkHDcM7Ez++PQ80K4+KJniaAZo0OwN6mu0wOfgWP
 IJkMO9GsUpNijA97pcx0AMVbLtQCIEhRj8AFlDHYoTpN3onNoGh4o0KLjcSnpODV34NM
 TEqaJs3WzzMiQiizgFIBQ1we4TdNNlSvTNeDzkUJbESfkRr1pTP0gNr2V97d5nBm9ZKp
 7epeYI9pRbANX7DPF2uMXh3P3uH1wJpd+nxgEhXmJJHpkmwgopN5cF3+IaAnsHerkCo4
 dR60LezUFuPhtKH8iLeYnS6Tihbs1LZQlRNwpj2EM7oShds52KFETK6czOURYP3fVaPr
 etEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Cfak1sCmnJrnV1Yo+NxsxHZCqNDIlqraMOFrcarHYaY=;
 b=OuwyGLU7iVJndj4fnZL8vFKgpSgO7FJF7Fv4cXBmh+kztMcSew4syAcZ3rz2giNcIf
 gJgZE5Kk76Q98nP4baLmuxRrK1Bu00DlWA7M1O7ukk4kLX0qMwrdxmiZ+pNdP9GxUafF
 S+SV3oUVSvb5fY1JxJnuYoh9/8gmmNuitWebEJ+up+2+20MhqEWzPvUkB1l+2mrWhR1X
 6eSE4Az7BzaKrIrVm4TrseIjiWSw1JhuLj4cP8zPKXur+5S4oTFoUDU4wMzzEdYCJaEV
 remab6pUoK74o/19rhHmXQbZcFtdViFEdauHDNDsfQOwNIXWYtcX4tyycxiApQfBq143
 sysQ==
X-Gm-Message-State: AOAM531dpT82NbaZQiEQPhUailzcH7KWGnLqnHMjgh1tlBl/TgsRhgs/
 bZwK7WV9G+RehPdWinZU5Z4Qhx9DGhxS6krGdYJ1rQ==
X-Google-Smtp-Source: ABdhPJwMf9vJicoSMjUBZD1g3mNrjeIuQjrxjwj0rrEYkruAGLAwAppiBccuCLUI+0TB8EZ4srJHQtf0Cf2JoJOcCho=
X-Received: by 2002:a81:1dcf:0:b0:2fa:d094:14ff with SMTP id
 d198-20020a811dcf000000b002fad09414ffmr20033137ywd.10.1652709342628; Mon, 16
 May 2022 06:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_SSJ9BBryV0iuXi1G30e6HoMeuNbSpKDh4_+y2oxTLJw@mail.gmail.com>
 <b89bb57d-bf00-806c-52e6-9e55c24257a8@kaod.org>
In-Reply-To: <b89bb57d-bf00-806c-52e6-9e55c24257a8@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 14:55:31 +0100
Message-ID: <CAFEAcA-nA4sKyPyRwc-MZbUt14y_4OJrhT3=momO2Cqi8r_9tA@mail.gmail.com>
Subject: Re: Getting rid of the last bits of QEMU's 'ad-hoc CI' for merges
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Mon, 16 May 2022 at 14:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 5/16/22 14:43, Peter Maydell wrote:
> > I think we can get away with just dropping ppc64be -- we have
> > coverage for it as a cross-compile setup, and hopefully the
> > s390x CI runner will catch the various "fails tests on big-endian host"
> > issues. (Alternatively if anybody has a ppc64be machine they'd like
> > to let us run a gitlab CI runner on, we could do that :-))
>
> No recent HW (P8 and above) would run a PPC64 BE distro if LE is
> supported by HW.

FWIW, the machine I use for ad-hoc CI is one in the gcc compile
farm, which is supposedly a "IBM POWER8 8284-22A", running Debian sid.

If BE PPC is fading away then that's another argument for
living with the loss of CI coverage, I guess.

thanks
-- PMM

