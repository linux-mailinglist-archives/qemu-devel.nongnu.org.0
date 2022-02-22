Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921AD4C003D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:39:34 +0100 (CET)
Received: from localhost ([::1]:46354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZ8P-0003KL-Hm
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:39:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMZ6C-0001Jq-25
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:37:16 -0500
Received: from [2607:f8b0:4864:20::b34] (port=44885
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMZ6A-0002SK-DL
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:37:15 -0500
Received: by mail-yb1-xb34.google.com with SMTP id d21so20434200yba.11
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qtf3YU+TcowGaCHniWgPODEI9mzHGWZEUHJkd8vFmQ4=;
 b=hX8AVPmLdnmgAm9Mp7TDpgorj+E8XR10pURakQlp8AnPWlgvg0kMqngO857J/DuEUo
 L4tjCl0QH0rR7jZl6bMJI2M0BcLhFauK7PaX+Hej5Ci39C87+8oJtlfylAqFYw6IrlRJ
 KlW+gHmzOHyk++gYPYv5XW1GjbqAHuy2a+fQoB4VxO+A/kDyT6rd+cdhtwQ07l4Yk6y6
 gEGGuyeBLZuQjMM/Z66XLR8XcODERIw9HohE8RomHh2Z3chKQ58u9GJbYAPgZV8F7Y+w
 /lxyDp+KZSEs/W7N6RPcLQm6E8Ly1SIxlZWFhURChfASzcfuqzFRPcCmoL+uyqkmXR6M
 7s7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qtf3YU+TcowGaCHniWgPODEI9mzHGWZEUHJkd8vFmQ4=;
 b=p99DupFOxI0mJw9mimGRl3RVe+erIajRCrKUqJrLxyMt6jgWWx/i5rFSCmx6xZWz8z
 27pJAQjEiMmIhzEWHAEyPgRfZ3xy9gLd5OZvCoymt85LrYMZYMDCVRtLzgHecJTyCt0z
 guLuCN7QUwyBsc+tbxu/l9W8ClJqKZaPUc1ojpJf/5DSiUvt6E3cYMA3cNNzx/T0wh1R
 YwOaoyNWIULKRUOYDQCrq6odiGU4GHbyBW+rYmeA5osiGc7fGeyNdAVU8QRkIxaqLSBE
 0G+gPdOSZ5Q1VNsr8dUJ0N1V+deUiXJuVwLopUMvZ0edoP6mRlKxaRMRA2U/6GC+gQ1c
 r+TA==
X-Gm-Message-State: AOAM533gwnFePFSLOmmZHByRMVYeJQVAfNlKN37Y5StrCAAlrCV3lXtg
 Nk6CY2Tk9KeGRXyEh/rMJ5Rj6jb8C9j4xOI0c/KJYA==
X-Google-Smtp-Source: ABdhPJzEPYI+NqxJzpRTH/JfEovOWiHMhUgQu+/oSynLrXk24DbGAjD/q+O+1Si+UMlSEn68PxmeXkgjE5F/MFDfFms=
X-Received: by 2002:a25:5011:0:b0:61d:853e:ef96 with SMTP id
 e17-20020a255011000000b0061d853eef96mr24511965ybb.288.1645551432548; Tue, 22
 Feb 2022 09:37:12 -0800 (PST)
MIME-Version: 1.0
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com> <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
In-Reply-To: <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Feb 2022 17:37:01 +0000
Message-ID: <CAFEAcA8ggE0HHXwLAu4vCA=kLwo4moN1CvTJbjph=OTmnfOONg@mail.gmail.com>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Oleg Vasilev <me@svin.in>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <cleber@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Idan Horowitz <idan.horowitz@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Emilio Cota <cota@braap.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Feb 2022 at 17:33, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> +Igor/MST for UEFI tests.
>
> On 22/2/22 17:38, Daniel P. Berrang=C3=A9 wrote:
> > On Tue, Feb 22, 2022 at 04:17:23PM +0000, Alex Benn=C3=A9e wrote:
> >>
> >> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
> >>
> >>> Hi,
> >>>
> >>> TL;DR:
> >>>
> >>>    - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug
> >>
> >> Laszlo,
> >>
> >> Would it be possible to do a less debug enabled version of EDK2 on the
> >> next update to pc-bios/edk2-*?

> We need the DEBUG profile to ensure the bios-tables-tests work.
>
> If you want to boot a guest using EDK2, you should use the images
> build by your distribution (/usr/share/qemu/edk2-aarch64-code.fd),
> not these images.

But we're booting guests using EDK2 as part of our avocado tests:
if we say "booting guests with EDK2 should be done with non-debug
images" we need to also be building and providing those in
pc-bios for the avocado tests.

-- PMM

