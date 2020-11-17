Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF282B5E8F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:45:47 +0100 (CET)
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezQg-00070a-JV
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:45:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kezPZ-0006AE-AH
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:44:37 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:44728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kezPX-0007fP-Fi
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:44:36 -0500
Received: by mail-ej1-x642.google.com with SMTP id y17so23317343ejh.11
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 03:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JF0Li1dFsoX/wsKle6kuB7TDnCNT0rJ4g5z4aXhjmI4=;
 b=K6S/4KkiKSVDWUv9DRyGpaYSQ6VVjl9va6W6A8YJwSrA5Zxtpv+I0XRHfMv64gMhJ/
 Xugxxu2biFcB+mSxRy2PyxYW8HFV0S4z3VBABVNr2X4mZINLnTNp0SK4MkWqbsrj4pKl
 dL9F4hmp+01G1UvNZllN9NXsHHRGp0EdAhmn6IeqVrrYXK4gU9L17MDRGAh+DYbi2hLa
 3ydBzs6PsF8BmubQqYCO5a1Ud0Ej9H1tvgjZus8JgkSd2jBGg/p1qclnO6qAU/IAv42e
 ejmdAU5vSy04e4BgZg4usJEQiqqFjL4eSo71c4OHe+BKe+z7258yPZWnDOENCSMz2ENj
 mFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JF0Li1dFsoX/wsKle6kuB7TDnCNT0rJ4g5z4aXhjmI4=;
 b=BFqUi6l+QVDmEacoIrTWk8nGiMerJqrFsUKlroxq5Hw0vwvxJtpdALABgGkZ9ztZFc
 CBHVlUCTOiWF8NwAWsqSmjYqgmhZ+Cs1xGLW1OVwnJpaZowN/z8lACiNquiLY72XEhnu
 mSdDiDjHy0EmZR0R15OtT5/eTGUlLN0pXUZzotCzBDDfQn6un9X5EEUF4CL3xVQF1kQN
 Kgwy6L8TJmLRjFKmBv3cUg91YVzBgfabeNQlNW7zijucJxTH+W6eyzitu/rc4XcSX/8p
 9XHpNJrcjqbkg+IE0TC3ftmehqaSHo6VueJNQePd8BFRICg9+01LG4wWk/7mQ7R5nEqx
 X4Rw==
X-Gm-Message-State: AOAM5323I8mlTexmfe33AFx4ML2RTBx4AAjuOlMGgZyR/WMD07ax0RfO
 hKWAs7Vq4lp35Cc0k57jI44Tkc3onjwge/P/Gn2OeQ==
X-Google-Smtp-Source: ABdhPJzoSTlU7cTR27i68MCGoCE9xGIVs3Ej8DAZ1MRmZVpcCBt/fO/uoWXVRy/qCcJYQuG63k1iD+aDTIYr3Rib0gY=
X-Received: by 2002:a17:906:5a88:: with SMTP id
 l8mr18326046ejq.407.1605613473727; 
 Tue, 17 Nov 2020 03:44:33 -0800 (PST)
MIME-Version: 1.0
References: <20201116104617.18333-1-peter.maydell@linaro.org>
 <1f4476ba-fe58-e7f8-c165-9cf501511f95@redhat.com>
In-Reply-To: <1f4476ba-fe58-e7f8-c165-9cf501511f95@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2020 11:44:22 +0000
Message-ID: <CAFEAcA9MO6J8-rSVdVG0whgRVk37SVKLP-sro0csXAzw5Cvveg@mail.gmail.com>
Subject: Re: [PATCH for-5.2] configure: Make "does libgio work" test pull in
 some actual functions
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 at 18:25, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 16/11/20 11:46, Peter Maydell wrote:
> > In commit 76346b6264a9b01979 we tried to add a configure check that
> > the libgio pkg-config data was correct, which builds an executable
> > linked against it.  Unfortunately this doesn't catch the problem
> > (missing static library dependency info), because a "do nothing" test
> > source file doesn't have any symbol references that cause the linker
> > to pull in .o files from libgio.a, and so we don't see the "missing
> > symbols from libmount" error that a full QEMU link triggers.
> >
> > (The ineffective test went unnoticed because of a typo that
> > effectively disabled libgio unconditionally, but after commit
> > 3569a5dfc11f2 fixed that, a static link of the system emulator on
> > Ubuntu stopped working again.)
> >
> > Improve the gio test by having the test source fragment reference a
> > g_dbus function (which is what is indirectly causing us to end up
> > wanting functions from libmount).
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > The ideal thing here might perhaps be to force the linker to
> > pull in everything in the library rather than trusting that
> > this particular function is sufficient to trigger the need
> > for libmount functions, but annoyingly gcc and clang
> > have different command line options to do that.
> >
> >   configure | 11 +++++++++--
> >   1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/configure b/configure
> > index 4cef321d9dc..2717cf1db0a 100755
> > --- a/configure
> > +++ b/configure
> > @@ -3512,8 +3512,15 @@ if $pkg_config --atleast-version=$glib_req_ver gio-2.0; then
> >       # Check that the libraries actually work -- Ubuntu 18.04 ships
> >       # with pkg-config --static --libs data for gio-2.0 that is missing
> >       # -lblkid and will give a link error.
> > -    write_c_skeleton
> > -    if compile_prog "" "$gio_libs" ; then
> > +    cat > $TMPC <<EOF
> > +#include <gio/gio.h>
> > +int main(void)
> > +{
> > +    g_dbus_proxy_new_sync(0, 0, 0, 0, 0, 0, 0, 0);
> > +    return 0;
> > +}
> > +EOF
> > +    if compile_prog "$gio_cflags" "$gio_libs" ; then
> >           gio=yes
> >       else
> >           gio=no
> >
>
> Looks good,
>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks; applied to target-arm.next for 5.2.

-- PMM

