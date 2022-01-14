Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6497148EFDE
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 19:29:09 +0100 (CET)
Received: from localhost ([::1]:42890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8RK0-0006wZ-I0
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 13:29:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8RCm-0006px-NQ
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 13:21:40 -0500
Received: from [2a00:1450:4864:20::32f] (port=36645
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8RCf-0002a9-IS
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 13:21:39 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so8823296wmk.1
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 10:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/eXYbkw7jn2BddRjENdgmSZvPMq7CXT0aZNMKE5uGT8=;
 b=IJ+fRzi3Z3FGshr8FQ6DeLgeMcDTZFnH27XlhTw+1qnp6K+TLRXfx2MrNnAo+O++zV
 P52+K/Aj6CggOzXSB86gm3B0ToVap9vLdbtpuqvTGZWwktYNy+SttSJi1bVgbIy+61hw
 6lx6O3JGmfkNAu02hh7lpi3TERT5WPEyGOeUOOziB8f/eC77D7rZYbX9lsOzLEDc7tz5
 X2o5eJReXPMGL26ZR4RXcyPETMPgdQmMWnpLG5yNfWrL1aLuuHn/YsmZvKZOtbf/5N5F
 qSvRVgT/JcHN5bwyqf0/D8I0KqBUIktUuRqNmEz0fu8cgBoX6GMc62XKH0QCh4ZT/Dgu
 MXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/eXYbkw7jn2BddRjENdgmSZvPMq7CXT0aZNMKE5uGT8=;
 b=PD1tITA2XwVo1YExsqy3fCoXNVVGmU6givpZ3cRtcUA4GCQ2UHEeGPxOImeGfuawS8
 S8cTPpfa0O/LFHql66sIP2+vAHTTE79utObcrwMSUjnsmF5vArIg/s5l31vUeuZLHY/G
 /b1qWAaDMjsmjSnJ3WP85ZwPRiCoWebzIjJJdqcHwh+IhgXI0npExhJyycnDVphJexes
 AMt+2PvIBcvPANScGRnQsbK9thhh8c4KFO3tnhXq+3muyI9WAvToiLkaKhuMdBVl5k4H
 +49YzDboFaaUAEWFI4EY+IjmZHX1H2qJ9IdgmkbImwsyuzA3usSKg4OrHHjuqkfm24me
 Zl7w==
X-Gm-Message-State: AOAM532LpPMxSHJZaAvHxX3Irsxf4Yp+W07d1QLHDQCFBuhsZF4uD+x4
 3wCfMW21q4nJqB65gFX7FYXjltKHqiIsqrBraaBvKw==
X-Google-Smtp-Source: ABdhPJy2MAuXjkTJLCKMO/bZakFohkKucqoPUZlA7ao0QZFHl+yJt6ZX1723IpCkbo9W6KViydD/mEvEvjRlC8EN/T4=
X-Received: by 2002:a05:600c:154c:: with SMTP id
 f12mr12993184wmg.126.1642184489921; 
 Fri, 14 Jan 2022 10:21:29 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-9-imp@bsdimp.com>
 <CAFEAcA-ieL5iT5tq4M_D_wAN=aOe9fzAvpFJ7thq6YvaQwqJRg@mail.gmail.com>
 <CANCZdfpGhj-M21GWgd6QzVmzcTjhY4E93jMObv7uAyHjdxm4dg@mail.gmail.com>
In-Reply-To: <CANCZdfpGhj-M21GWgd6QzVmzcTjhY4E93jMObv7uAyHjdxm4dg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 18:21:18 +0000
Message-ID: <CAFEAcA8YVtWvGvEv=xJPSDPe+zLT+uLPeovfiDZDYPsLejr0Xg@mail.gmail.com>
Subject: Re: [PATCH 08/30] bsd-user/arm/target_arch_cpu.h: Implement data
 faults
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Jan 2022 at 18:14, Warner Losh <imp@bsdimp.com> wrote:
>
>
>
> On Thu, Jan 13, 2022 at 10:40 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Sun, 9 Jan 2022 at 16:29, Warner Losh <imp@bsdimp.com> wrote:
>> >
>> > Update for the richer set of data faults that are now possible. Copied
>> > largely from linux-user/arm/cpu_loop.c
>> >
>> > Signed-off-by: Warner Losh <imp@bsdimp.com>

>> "Permission" (I see we have this typo in linux-user).
>
>
> Fixed. Also, if you can, please cc me if you'd like on 'back ported' fixes into linux-user when you post them
> for review that arise from this. It helps me keep track and not miss them in this rather high volume mailing
> list.

Sure, I can do that. Already posted this afternoon:
https://patchew.org/QEMU/20220114153732.3767229-1-peter.maydell@linaro.org/
https://patchew.org/QEMU/20220114155032.3767771-1-peter.maydell@linaro.org/

and I forgot about the 'permision' typo or I'd have folded it into
that 'nits' series, so I'll post that in a moment...

-- PMM

