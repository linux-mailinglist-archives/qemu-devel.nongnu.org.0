Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ACB3F5AE4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:20:10 +0200 (CEST)
Received: from localhost ([::1]:57478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISbJ-0000tc-8G
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mISaP-0007wF-Vj
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 05:19:14 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:34382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mISaO-0008Bk-Id
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 05:19:13 -0400
Received: by mail-ed1-x536.google.com with SMTP id i6so30581656edu.1
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 02:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p9oW1ECen1ZnNvjDlvaerMujlcM6XWL8DtBaGBmGaFw=;
 b=LvDbtizcVgECCqYe5vYhxT+T2fG1JgibW6tNVhWOxa3odjaVHQleIbDgz17RGMgipH
 UDeQB9ZOM/OvBSw7huV3PA8zxW6Yinh1/WQ7/60e2LQef9hRxGb11hSfF9b7yfzABQzr
 uS8EVrf14w7lOGxWorKIcdBU5KPJ7VRMQdNH69c/chPS7z0r3yaYcvLW9HpZY/ZI86Zq
 v3RZXa/o+h/CUf31WhdsI9eu7eDKc2xWmcCvIyt17OiyiN1VHRkCJ4cw42YLNJWes4XW
 mT/ab1DjrntvxoKPtp0jIhBitivwnsSRCqpU/WNUVuFjw5moxkGDjOas/RvjD6Q0N6BX
 4Lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p9oW1ECen1ZnNvjDlvaerMujlcM6XWL8DtBaGBmGaFw=;
 b=B97Aw6dxl2sA5paf93NlJV91FmisrVlL5UwrzMWpTWHgGajRNSArI3eqKN9czghqMp
 e0ouVHwNDRmj2xOyXRtg6Sacg7zhHa3TJTz0FBjpUdJrMmyUHjVbaQklng6yblsCy7vD
 5gHRIs3GQ57EYjJhui6PWM4bnhxi1fbqENMeAouPEvUqKPOyFeY3+bDFqOoauZqtYdFO
 rjMoUItPvxm0YupoosUXXDOCkV02pXHJUjjb3qHcKjyp+J62uCd9WETYRyqLGjyNu8gv
 yjugTvN+92RTbHdq8YRwmytCZlvidrUFhH+zZcUODkSHTnAs3RLOnY0212UNhW75UXzd
 sz/A==
X-Gm-Message-State: AOAM530vAyLDjUqU6FEVRZ4nJm5nzCydevul9TCDQvY8ypNU2tHl2ezf
 aozOEAvZjLfsdIPTdR7v/m+DjIRpoJQwjxUN1fWDdQ==
X-Google-Smtp-Source: ABdhPJy7BBinurBeFlYPyUvHOLbZSp3ZXfTZwkHoY1axLeM1hYtYdAyBV08yhrYo4ykHDS6NtifxI11H33328q0ps4k=
X-Received: by 2002:a05:6402:3099:: with SMTP id
 de25mr41673516edb.36.1629796750968; 
 Tue, 24 Aug 2021 02:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAM2a4uwQ0M=TmFdWaaO-E_2J06fpH1ghXhYJJKBP6s5j90ASLg@mail.gmail.com>
 <CAFEAcA9SeTTcU_p+-KwGJPyYG7pKzSJGGb287tXYOvN13E6-iQ@mail.gmail.com>
 <CAM2a4uxO=DaspSeT0LPHTvKuH6crzzQC4_syAf=J+FOE_C_sbw@mail.gmail.com>
 <9984de93-0b83-ef88-8301-a8b74f3f6247@amsat.org>
In-Reply-To: <9984de93-0b83-ef88-8301-a8b74f3f6247@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 10:18:24 +0100
Message-ID: <CAFEAcA8c6T124Yg+tCWsXr_bmFyCpUy8kjpaLsP=0A1G4GEzNw@mail.gmail.com>
Subject: Re: Testing a microcontroller emulation by loading the binary on
 incomplete Flash emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Gautam Bhat <mindentropy@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Aug 2021 at 09:22, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 8/23/21 9:46 PM, Gautam Bhat wrote:
> > On Sun, Aug 22, 2021 at 10:18 PM Peter Maydell <peter.maydell@linaro.or=
g> wrote:
> >> On Sun, 22 Aug 2021 at 15:37, Gautam Bhat <mindentropy@gmail.com> wrot=
e:
> >>>
> >>> Hi,
> >>>
> >>> I am to implement a very simple microcontroller for my understanding
> >>> of Qemu development. This microcontroller runs its code from
> >>> programmable flash which is bit-, byte- and word addressable. To do
> >>> some initial tests of my nascent microcontroller implementation I
>
> Aren't Nascent uC based on 8051? Because AFAIK QEMU doesn't emulate
> this architecture.

I assumed Gautam was using 'nascent' in the usual English sense
of the word (ie as an adjective meaning "just coming into existence").

-- PMM

