Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C8B4B6E09
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 14:50:38 +0100 (CET)
Received: from localhost ([::1]:47552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJyE1-0007HM-2p
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 08:50:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJy8q-0004WY-9p
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:45:17 -0500
Received: from [2a00:1450:4864:20::434] (port=40906
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJy8n-0000ER-Sp
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:45:15 -0500
Received: by mail-wr1-x434.google.com with SMTP id j26so21365342wrb.7
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 05:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nPq/M02plWYOpzb7wq1gUGlKy/4+bPjBTZHeWmlU4wI=;
 b=KhI4DSimOMQKZsEeKX0/OuojISAdqeybY9l9yE+VI0xWIXecqUoJeA75p9gtySboYK
 5ldoi2enSjhW4GSFANJLaO+QWoRstiO/WcB742/C+o5Fix88PJ212QwztJd+O5q6Akod
 siAVFISNlBAK+31hyA6FgxiQ4fdFhuwacGHN0qCTecDV7SDHZ0m8VVYHbD8aEPUd/GVh
 5ElrKJyPSBTalDBqrTIXnsOPLcV94c/iPb/2ZFa1Mz9mHfNghmKuQ7PlIb+y9xa6Aet1
 0lFpBE+rx9K8brOenIjIvClJ0TIjZRwjmGPSo6aEBs1EjciO26RRvdIzGPU3lkXbQcmM
 b5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nPq/M02plWYOpzb7wq1gUGlKy/4+bPjBTZHeWmlU4wI=;
 b=1pm7RoIFle+Vk+jw0OmU9HmaeaXbzdOgyHoiykTZg7AW1Aw0zI7fbcEo4/siu+5KlW
 P2rvsVlYR/a16cPvkuRw1nUKxFhGU3WH/kc6oowHIQvo5pUkA4iXl7UZb5QJ1+exnEXd
 BcxuibigiHoDDhXm/7bIIcYtfb6SsHt6FtRzYOAyG7dbVFN9weeQoe5CTt17XJe/Hk62
 4vDjPGhUovUq77iv50NwSC8f2FWZGExHujiHUnH9sIWh5UkJKYYNPwnGrZd70ZrZbU3d
 ubn29MqzyUiX2+1enEIJFp8FJ9GttFTrFXRbnMn4fi+YxADeeRESVeHX64i9XLaN5IRp
 1tMA==
X-Gm-Message-State: AOAM532Cmrswv2jn081pnBMh73K6XU2sIFsYNnVTIKKVxtdBoOjNxnL2
 NhAiGCVxJVIBmVtt638ils9GhOyWPt7Fyg106vZLZA==
X-Google-Smtp-Source: ABdhPJzxmwUjWFDb2ONe1wJnpoXS4zeDBv/NELcSTLHfhNcXtAxpzicn461IP/+DbGSJjuZrvud2i21hweycdYKLevo=
X-Received: by 2002:a5d:62c4:: with SMTP id o4mr3296376wrv.319.1644932711457; 
 Tue, 15 Feb 2022 05:45:11 -0800 (PST)
MIME-Version: 1.0
References: <20220215120625.64711-1-f4bug@amsat.org>
 <20220215120625.64711-5-f4bug@amsat.org>
 <5430167.XuPm0vUgvV@silver>
In-Reply-To: <5430167.XuPm0vUgvV@silver>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 13:45:00 +0000
Message-ID: <CAFEAcA_58__sVrAdN410PvketwTLyyYb=OZ4y2oWDjMYGW+J0g@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] ui/cocoa: Ignore 'initializer overrides' warnings
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Feb 2022 at 13:18, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Dienstag, 15. Februar 2022 13:06:25 CET Philippe Mathieu-Daud=C3=A9 vi=
a wrote:
> > We globally ignore the 'initializer overrides' warnings in C code
> > since commit c1556a812a ("configure: Disable (clang)
> > initializer-overrides warnings"). Unfortunately the ${gcc_flags}
> > variable is not propagated to Objective-C flags ($OBJCFLAGS).
> > Instead of reworking the configure script to test all supported
> > C flags in Objective-C and sanitize them, ignore the warning
> > locally with the GCC diagnostic #pragma (Clang ignores it).
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
>
> What about this instead:
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index ac18e14ce0..df9b9be999 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -652,9 +652,7 @@ QemuCocoaView *cocoaView;
>
>      /* translates Macintosh keycodes to QEMU's keysym */
>
> -    int without_control_translation[] =3D {
> -        [0 ... 0xff] =3D 0,   // invalid key
> -
> +    int without_control_translation[256] =3D {

I think this won't zero-initialize, because this is a function
level variable, not a global or static, but maybe ObjectiveC
rules differ from C here? (Besides, it really should be
a static const array.) That said...

> That warning should only be raised on overlapping designated initializati=
ons
> which strictly is undefined behaviour. Because which order defines the
> precedence of overlapping initializers, is it the order of the designated
> intializer list, or rather the memory order?

This is defined: textually last initializer wins.
https://gcc.gnu.org/onlinedocs/gcc/Designated-Inits.html

> See also:
> https://stackoverflow.com/questions/40920714/is-full-followed-by-partial-=
initialization-of-a-subobject-undefined-behavior

That's about struct initializers; we're dealing with array initializers her=
e.

> So I have my doubts whether this warning suppression should be used in QE=
MU at
> all.

The warning is useful in the pure-standard-C world where there
is no such thing as the "range initialization" syntax. In that
case trying to initialize the same array member twice is very
likely a bug. However, if you use range initialization then
the pattern "initialize a range first, then override some specific
members within it" is very common and the warning is incorrect here.
We use and like the range-initialization syntax, and so we disable
the -Winitializer-overrides warnings. The bug here is just that
we are incorrectly failing to apply the warning flags we use
for C code when we compile ObjC files.

thanks
-- PMM

