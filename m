Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD124DA277
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 19:36:53 +0100 (CET)
Received: from localhost ([::1]:56320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUC2N-0008Ht-S1
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 14:36:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBzQ-0006u7-OJ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:33:50 -0400
Received: from [2607:f8b0:4864:20::1133] (port=42123
 helo=mail-yw1-x1133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBzO-0003zc-Bh
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:33:47 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2dbd97f9bfcso212764607b3.9
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 11:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5YrZKtaVhu/z9oEovL/8SGpLfOETd1P5prIuocI7qiw=;
 b=fMYWKE/+7CCEJY5oHTia8ebA2AvBggQFLITKaX4hdZDh295AZTBpFzRjpsiiLZvpPk
 BGc+Dx8eVRPw3h/f6hvXAY35Ju7XHPhfu2rwdIYNn8IIi1KyJ8i7h8BW4pmKCV7QgmOv
 Va0G5OG6Hp65Qz/zG6Mj7lCpRbEG60+E9lOdpbyAJoy4VsYX4ALWwRxldgrizbud0QKY
 ySlHAx7+0fVNjZEX0SueTRfNzSC3HrgfnLe1SJAz9yULLl0hHIZyCPQnp6lpG3UeRuDr
 tliy1m1IqTkqZZ5aX3f7bzCRTmshTghhZQgLmIZBBLaPU10OAD4GLupUdZ2SxHk5ueW1
 rHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5YrZKtaVhu/z9oEovL/8SGpLfOETd1P5prIuocI7qiw=;
 b=ysCcynJajSyQhUwIiumvaF1bK/1imj5b7dB8oqLJ29xyoNJwZxHT/RYsxzjCs77ZBC
 pbQBda3nkKCKJtSv5TBJAw+bl7OynTQxX1kpbh+qCGDG0SpguTx35dqZLtB+0AyZT2DG
 Xkbo6qD8SeCz7Wo7vAeMipZKhR+6CrJzpfVO9eUaWTyBM/yNTYgt1pDMpEvxoxuBzJh+
 WsfqTHvvmxDAfgm1SGEHRO5PG7cQ07oDyivyBie46C1SzWs0DYoH73knpoQiLvnNH//i
 qEj+ztRRgR4XiWy+Udik3VgbWvumNIgYwQZBVvjuAkyVt/o8kapgiMSA8DSrkILIvJBZ
 7+Hw==
X-Gm-Message-State: AOAM5334c/Tosgm0G2wFdPv3ZO8LnV9GjWCwW0VxmiDGeajpFKAS7j7Z
 GfTTMOCd+4mA0rRV9vp6UcKp6TtBl0bJqEFvulMVFg==
X-Google-Smtp-Source: ABdhPJw46rd/6XYGpOPm0gHjlILLypT+ELL4R0JHcMFryD4YYI2KKvWz+r57im+Y3xXh53t85/ERj0rigRl7Bfv3V5U=
X-Received: by 2002:a81:a4e:0:b0:2e5:9946:525a with SMTP id
 75-20020a810a4e000000b002e59946525amr2370730ywk.455.1647369225320; Tue, 15
 Mar 2022 11:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220315022025.18908-1-adeason@sinenomine.net>
 <20220315022025.18908-2-adeason@sinenomine.net>
In-Reply-To: <20220315022025.18908-2-adeason@sinenomine.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 18:33:33 +0000
Message-ID: <CAFEAcA-FzgoTS=WAhU35v5jW7QbUzrTHSX4r_4nYRdmoGZrpTA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] util/osdep: Avoid madvise proto on modern Solaris
To: Andrew Deason <adeason@sinenomine.net>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 02:20, Andrew Deason <adeason@sinenomine.net> wrote:
>
> On older Solaris releases, we didn't get a protype for madvise, and so
> util/osdep.c provides its own prototype. Some time between the public
> Solaris 11.4 release and Solaris 11.4.42 CBE, we started getting an
> madvise prototype that looks like this:
>
>     extern int madvise(void *, size_t, int);
>
> which conflicts with the prototype in util/osdeps.c. Instead of always
> declaring this prototype, check if we're missing the madvise()
> prototype, and only declare it ourselves if the prototype is missing.
>
> The 'missing_madvise_proto' meson check contains an obviously wrong
> prototype for madvise. So if that code compiles and links, we must be
> missing the actual prototype for madvise.
>
> Signed-off-by: Andrew Deason <adeason@sinenomine.net>
> ---
> To be clear, I'm okay with removing the prototype workaround
> unconditionally; I'm just not sure if there's enough consensus on doing
> that.
>
> The "missing prototype" check is based on getting a compiler error on a
> conflicting prototype, since this just seems more precise and certain
> than getting an error from a missing prototype (needs
> -Werror=missing-prototypes or -Werror). But I can do it the other way
> around if needed.

Seems a reasonable approach to me.

> Changes since v1:
> - madvise prototype check changed to not be platforms-specific, and turned into
>   CONFIG_MADVISE_MISSING_PROTOTYPE.
>
>  meson.build  | 17 +++++++++++++++--
>  util/osdep.c |  3 +++
>  2 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 2d6601467f..ff5fce693e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1705,25 +1705,38 @@ config_host_data.set('CONFIG_EVENTFD', cc.links('''
>    int main(void) { return eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC); }'''))
>  config_host_data.set('CONFIG_FDATASYNC', cc.links(gnu_source_prefix + '''
>    #include <unistd.h>
>    int main(void) {
>    #if defined(_POSIX_SYNCHRONIZED_IO) && _POSIX_SYNCHRONIZED_IO > 0
>    return fdatasync(0);
>    #else
>    #error Not supported
>    #endif
>    }'''))
> -config_host_data.set('CONFIG_MADVISE', cc.links(gnu_source_prefix + '''
> +
> +has_madvise = cc.links(gnu_source_prefix + '''
>    #include <sys/types.h>
>    #include <sys/mman.h>
>    #include <stddef.h>
> -  int main(void) { return madvise(NULL, 0, MADV_DONTNEED); }'''))
> +  int main(void) { return madvise(NULL, 0, MADV_DONTNEED); }''')

Since this is a little bit tricky, I think a comment here will help
future readers:

# Older Solaris/Illumos provide madvise() but forget to prototype it.
# In this case has_madvise will be true (the test program links despite
# a compile warning). To detect the missing-prototype case, we try
# again with a definitely-bogus prototype. This will only compile
# if the system headers don't provide the prototype; otherwise the
# conflicting prototypes will cause a compiler error.

> +missing_madvise_proto = false
> +if has_madvise
> +  missing_madvise_proto = cc.links(gnu_source_prefix + '''
> +    #include <sys/types.h>
> +    #include <sys/mman.h>
> +    #include <stddef.h>
> +    extern int madvise(int);
> +    int main(void) { return madvise(0); }''')
> +endif
> +config_host_data.set('CONFIG_MADVISE', has_madvise)
> +config_host_data.set('CONFIG_MADVISE_MISSING_PROTOTYPE', missing_madvise_proto)

> +#ifdef HAVE_MADVISE_MISSING_PROTOTYPE
>  /* See MySQL bug #7156 (http://bugs.mysql.com/bug.php?id=7156) for
>     discussion about Solaris header problems */
>  extern int madvise(char *, size_t, int);
>  #endif

As you note, this doesn't match the name we picked in meson.build.
I don't feel very strongly about the name (we certainly don't manage
consistency across the project about CONFIG_ vs HAVE_ !), but my suggestion
is HAVE_MADVISE_WITHOUT_PROTOTYPE.

Can you put the prototype in include/qemu/osdep.h, please?
(Exact location not very important as long as it's inside
the extern-C block, but I suggest just under the bit where we
define SIGIO for __HAIKU__.)

This means moving the comment, which will then want fixing up to
our coding style, which these days is
 /*
  * line 1
  * line 2
  */

for multi-line comments.

thanks
-- PMM

