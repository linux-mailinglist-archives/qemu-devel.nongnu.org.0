Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AEB4BA8AA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 19:45:59 +0100 (CET)
Received: from localhost ([::1]:41434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKlmw-0007az-BE
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 13:45:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKleN-0005vM-PM
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 13:37:07 -0500
Received: from [2607:f8b0:4864:20::b2c] (port=39824
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKleL-0006Vn-Lp
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 13:37:07 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id p19so14860870ybc.6
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 10:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2JIGM+gTQzSNufmptVn6e4p5PTmhjkQW2VGVbMD2vH4=;
 b=IIcdZB5KhNPVN1aioem0mPO451mKaYW3hhzDewCMPFh8nyNbX1rU7e8PwuzXONdc6G
 1kUWgjD+0OTBZZ1QAQ/41BV4TzYifywtHLvRmx7RVL9ZLe+hAF3YXd5CI/r3dHTmHUNP
 zOYs39GG7WghNuU4Jfpt3IyuAryYAdbtdCzf+q2iROXaGtfh6WwVW58RrJ9iFbrKsCL1
 05VdWGNWbzrOGotJQXWI42AphVY6d2hOIdls1jMncAPwIV5iUkE5CRSdiM1Oq6Lx7PMB
 ya++qhC6ldNBohSWhD+MOVvn4KmtUzsMyEz3vOqL9Rbb+w5Dxf5e2YYBykAo11U+WGtS
 Fs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2JIGM+gTQzSNufmptVn6e4p5PTmhjkQW2VGVbMD2vH4=;
 b=K6Nf2P/EFYK/5bRvqaGAuiVl1pcnRr3gUr/yOXY4wkotNjtza3Ldw2FMHgQFd3dApC
 Q7deRbDYN7kUvM+wtwFK7gb/dtsLfj6f+EFIFmrDSw84UVqB1P4r4fPX9nhrfMGMuaVQ
 f7k47ZDuGef5uct2jTIddaTTxDlY1yOL3s2ncZDgIWW8EdRiiEUEYbjE36Z9Q7NNcHPw
 CDPhBrDteIpahvLAoMrqvtmNHcheseITapzTRHdnBVGI4kCUQ5Mkum94q9qhGehAeTPm
 hzL3GJdQ3dc/OsZg0W12UzNHWmHce+X42mmTB2OJ9TkvXVQ3MHTif/mKhrrNCT2bMrwI
 gm/Q==
X-Gm-Message-State: AOAM533gwT+FaSaddmazkeE70Jx/TdDlhHlRO3WOg5rSdJph2tF9+lGw
 U0G0AzC+Hyv0AZSUbwe5HuJit1QM4B0/14usZoHqoQ==
X-Google-Smtp-Source: ABdhPJw8wmgd81hTDzWV2yIXSotY+tcIR2uVhowT6YGgJt4RZFTXyv0TnWPIORwvIWIx4Ioid2G64F4JpKOBoNe3jDA=
X-Received: by 2002:a25:5011:0:b0:61d:853e:ef96 with SMTP id
 e17-20020a255011000000b0061d853eef96mr3739421ybb.288.1645123024745; Thu, 17
 Feb 2022 10:37:04 -0800 (PST)
MIME-Version: 1.0
References: <20220214185605.28087-1-f4bug@amsat.org>
 <20220214185605.28087-4-f4bug@amsat.org>
In-Reply-To: <20220214185605.28087-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Feb 2022 18:36:53 +0000
Message-ID: <CAFEAcA_TMrR5GqpRxr76Vo6XP2ZHAREUSObGZ60XUBjTe5JxXg@mail.gmail.com>
Subject: Re: [PATCH v5 03/16] tests/fp/berkeley-testfloat-3: Ignore ignored
 #pragma directives
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
Cc: Li Zhang <lizhang@suse.de>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 18:56, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Since we already use -Wno-unknown-pragmas, we can also use
> -Wno-ignored-pragmas. This silences hundred of warnings using
> clang 13 on macOS Monterey:
>
>   [409/771] Compiling C object tests/fp/libtestfloat.a.p/berkeley-testflo=
at-3_source_test_az_f128_rx.c.o
>   ../tests/fp/berkeley-testfloat-3/source/test_az_f128_rx.c:49:14: warnin=
g: '#pragma FENV_ACCESS' is not supported on this target - ignored [-Wignor=
ed-pragmas]
>   #pragma STDC FENV_ACCESS ON
>                ^
>   1 warning generated.
>

GCC doesn't know about -Wignored-pragmas, so this change is relying on
the GCC "ignore a -Wno-something that this gcc doesn't recognize
if we wouldn't otherwise be complaining about something" behaviour.
I forget which GCC version that was introduced in... (This is why
configure has the cc_has_warning_flag() test before it tries to
use a warning/warning-suppression option.)

-- PMM

