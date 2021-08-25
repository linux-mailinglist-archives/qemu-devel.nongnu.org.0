Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDC13F7C14
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 20:13:50 +0200 (CEST)
Received: from localhost ([::1]:40058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIxPJ-0008Qq-7j
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 14:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIxOX-0007he-Ku
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 14:13:01 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIxOV-0007Hv-N1
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 14:13:01 -0400
Received: by mail-ej1-x62b.google.com with SMTP id a25so314594ejv.6
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 11:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bOx61zj7PS7kCGQlOGuwsj2OeGbhDJW3Ytk2D2Qsgrc=;
 b=ohe6J+GbbT8HZrc3qk+BM+EY0C/GRfIQqKPCTJj52qM0B1+i1DyxViTvvNSuhNLp9V
 9KbZqN/vNzcfQP8e4owrR+eM2YeHxYCHgUv7fSgYsEZL++/IpLLANxOd1NAbL+XavT4r
 J6lJZZR9jKaB4ApbMt1WNCDMLJl6VA5wOJDWxswvXIwOu6bkBt4T5ik1/RI5aSzhcDoq
 tQsupDDOfjkBt5aYWPbOD+5ypPxXX1jqhlVD0j56zukdO7p6LU699ziVfILXZBqomgH1
 ah2qgF8wyKvvJsqiMjx4DDqNS7NHCVWwERDHOxN1K8O6pClPERcAZgqxSDutEMiD+jsA
 tLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bOx61zj7PS7kCGQlOGuwsj2OeGbhDJW3Ytk2D2Qsgrc=;
 b=ZF+OxIL2Et1YaOD+fZkyusacfaUN62HtvxC5fEx0ZTmmm797+A7IXXRf/tr7QwgeRO
 ZzbsgUE5mCa8d0Cm0ptQ4PPul1rAvsJuBpKsSyyrExGbzfjZbuQN2DnDjnHUlE71GgPd
 /O65mmKHgtBnuixyeNZhUJL7WUQ7ZhgXm60ljr+C/uOytLfHP+pO0Ihd/hqJyTji5EZv
 XAcE6beUhQrziUdsU/0mV3C4RXNYzq0CbQ5/JoTGQF4IQnIqC/3V9M1tQMqdZZkkfhPY
 d21yrCVeX4RygtyC+fCtV3G/uED0S6y5hwpJfkCGDrRZudmpm8MjyIJ8Je9gwvX41Gt2
 eWGw==
X-Gm-Message-State: AOAM531IpMvtYJfTWUqgs0texEhz3pEHx+KkJBbqd8Fmd9ky0TFkw0Yb
 CLFh8nHwVxIa+3YUfUckfCnSqUs1AJOGSaBD5ZwOIg==
X-Google-Smtp-Source: ABdhPJwQxUY63hNGuS0m0FS19AxYI+mGDc5/Kh74e1S7lL8+7hw0GhmxJrXgyAyQrvGa47MamgSNmrM5b/YwpOuWR8A=
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr46414749ejb.382.1629915177338; 
 Wed, 25 Aug 2021 11:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210825124309.223622-1-marcandre.lureau@redhat.com>
 <c79fb3c7-e6cc-adea-b694-ffe1f25c0d59@amsat.org>
In-Reply-To: <c79fb3c7-e6cc-adea-b694-ffe1f25c0d59@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Aug 2021 19:12:10 +0100
Message-ID: <CAFEAcA8YNwe-PCt2VuY4Fhjbyqnm2G7BpZDs6wyXNFh3pmee2Q@mail.gmail.com>
Subject: Re: [PATCH] RFC: build-sys: drop dtc submodule
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Aug 2021 at 14:28, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 8/25/21 2:43 PM, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > DTC is widely available, we could consider to stop bundling it.
> >
> > curl -s 'https://repology.org/api/v1/project/dtc' |  \
> >    jq -r 'group_by(.repo) | .[] | "\(.[0].repo): \(map(.version))"' | \
> >    egrep -i 'ubuntu_18|debian_old|rhel|centos|bsd|suse_leap_15_2|sles|h=
omebrew|pkgsrc'
> >
> > centos_8: ["1.6.0","1.6.0"]
> > debian_oldstable: ["1.4.7"]
> > freebsd: ["1.6.0"]
> > homebrew: ["1.6.1"]
> > openbsd: ["1.6.0"]
> > opensuse_leap_15_2: ["1.5.1","1.5.1"]
> > pkgsrc_current: ["1.4.7"]
> > ubuntu_18_04: ["1.4.5"]
> >
> > MinGW package on Fedora pending review.
> > (https://bugzilla.redhat.com/show_bug.cgi?id=3D1997511)
> >
> > Debian is lacking the MinGW package.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  configure         | 22 +-------------------
> >  meson.build       | 53 ++++++++---------------------------------------
> >  .gitmodules       |  3 ---
> >  dtc               |  1 -
> >  meson_options.txt |  3 ---
> >  5 files changed, 10 insertions(+), 72 deletions(-)
> >  delete mode 160000 dtc
>
> Does this fix https://gitlab.com/qemu-project/qemu/-/issues/255 ?
> "Build on sparc64 fails with "undefined reference to `fdt_check_full'"

That bug sounds like it indicates that we can't use this patch:
a comment in the bug says that fdt_check_full() (which we use)
was only added in libfdt 1.5.1. So the libfdt version we need
is still not available in several of the distros we care about.

I suspect the bug you link to may have been fixed -- certainly
meson.build appears to be specifically looking for fdt_check_full()
so we should never try to compile with a libfdt that doesn't have it.

-- PMM

