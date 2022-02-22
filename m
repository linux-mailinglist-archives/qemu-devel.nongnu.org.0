Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E94C003C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:37:52 +0100 (CET)
Received: from localhost ([::1]:42746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZ6l-0000vn-Fn
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:37:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josh.a.seaton@gmail.com>)
 id 1nMZ4o-0007LG-Vm; Tue, 22 Feb 2022 12:35:51 -0500
Received: from [2a00:1450:4864:20::634] (port=38513
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josh.a.seaton@gmail.com>)
 id 1nMZ4k-00021s-Hw; Tue, 22 Feb 2022 12:35:50 -0500
Received: by mail-ej1-x634.google.com with SMTP id r13so22097346ejd.5;
 Tue, 22 Feb 2022 09:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j8t+4q8YxwuhQRgVVqsUokHtGIlX/Uz4ryzQ1HlRcnU=;
 b=Xa6+FxtPQ2FxNRNF+3Y0MXr7ncUc16i8feo3QK5eDcJDjU9lsb15+o/t8pNW+fmsRM
 4wyTimemQ+7GnlLvbfYjEjbc105zJhNnZNx/r1EWAN2XPfNydCwc6zVcDnORTdejHS/3
 PCHbPkaU6B/OttHrqy5Gp4QvB7T5hqs48UplXMHn9Kkr1t5tYF1hu07DImoNjixsxOVV
 3w/jJV5XC1QsCnI9AtH3gJPK0qPRtsaNhm+e3OfoPFmRfjfbUHqTBR5xRg0O/fVHTBvo
 R4uCtSLJpFDIGePmAo0XCkUrsQAnCzJwVYdOaJyZ2SwcPDoMQNnEHx3ax50zxjx7M4f7
 V8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j8t+4q8YxwuhQRgVVqsUokHtGIlX/Uz4ryzQ1HlRcnU=;
 b=E6kNDGsfKBsI0qBaJXtJSMXCFqElt2q7+tEPuEV1rFt3s4irRcD+MjIT0K66OHGxYh
 S2GRjFqSf42BCZ+Y4XyApBKnuu61Wh2l/BG5Srly5xU2yKWzetJtegp51Uur4c3YPLMs
 +SbIX0VFnenS4BEwetV/ndXLX6EWtIS/QUPr/ZpTnKmj1GAWDYfG2dm7jSwiH/sNQoSx
 1rn9lH+hS9zgHRC5xmoSawI4t5pu2m35bjE0J6r4+BaROsgLhjjD6xRNlpQFsbRt0Lcb
 DoofYfnV+lT6MegBPIhGhmW+2NWIokuUktRQtJya7CWYtzUaeMv/wPQgDudPEBzzBJse
 /w5Q==
X-Gm-Message-State: AOAM530lNC282yNYO6USQntNhdUjiNVpjXCo2LCEt4Kyzq8LbUByRq+l
 JZz/hgDeVP8j6owm+4PL9CcDZLCG6SKavwlrkzj128KUHX+P4A==
X-Google-Smtp-Source: ABdhPJzVRXK562X9XZsQVrSMOiY5M2XNEsLT/0YKP4OqE5AWiVFPY1J5ONyLWJhfywAtrLrHmK5ZfJGAtJX8KBlY7+s=
X-Received: by 2002:a17:906:4d8d:b0:6ce:8c3d:6e81 with SMTP id
 s13-20020a1709064d8d00b006ce8c3d6e81mr19459589eju.205.1645551335521; Tue, 22
 Feb 2022 09:35:35 -0800 (PST)
MIME-Version: 1.0
References: <CAPbYy+_14jeLBzihGjY-v0L1inZ1CGc+8TFu7NuPiaZie8skyg@mail.gmail.com>
 <eb099ea1-f88e-8b4f-22ab-863952c04f32@redhat.com>
In-Reply-To: <eb099ea1-f88e-8b4f-22ab-863952c04f32@redhat.com>
From: Joshua Seaton <josh.a.seaton@gmail.com>
Date: Tue, 22 Feb 2022 09:35:24 -0800
Message-ID: <CAPbYy+8MLLjZbeDarG9o5Dc=zLg7F17jwojEg8w41DkaruxCjg@mail.gmail.com>
Subject: Re: [PATCH] configure: Support empty prefixes
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=josh.a.seaton@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

Thanks for the quick response (and apologies about my delayed one).

My project has automated scripts to build a number of other tools. The
way we conventionally go about it is
```
path/to/configure '--prefix=' ...
make
make install DEST_DIR=$destdir
```

We currently build an earlier v5 version of QEMU this way. I am trying
to update things to start building v6 and hit the empty-prefix issue
in doing so.
You are of course right though that this is easily worked around:
```
path/to/configure "--prefix=$destdir" ...
make
make install
```
works fine and I've happily updated things on my side to reflect that.

My particular use-case aside, my understanding is that accepting empty
`--prefix` values is a widespread convention for configure scripts,
one which was previously supported by this project too (at least
unofficially). Is that accurate?
If the patch/feature is unwanted, that's completely okay by me;
although I'd be curious to hear why it might be regarded as
undesirable.


Joshua.





On Thu, Feb 17, 2022 at 3:50 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 2/17/22 19:42, Joshua Seaton wrote:
> > At least as of v5 (before the meson build), empty `--prefix` values were
> > supported; this seems to have fallen out along the way. This change
> > reintroduces support.
>
> What is the usecase exactly?  QEMU supports relocatable installation so
> if you want you can use --prefix=/nonexistent and then move the
> resulting tree wherever you want.
>
> Paolo
>
> > Tested locally with empty and non-empty values of `--prefix`.
> >
> > Signed-off-by: Joshua Seaton <josh.a.seaton@gmail.com>
> > ---
> >   configure | 33 ++++++++++++++++++++++++---------
> >   1 file changed, 24 insertions(+), 9 deletions(-)
> >
> > diff --git a/configure b/configure
> > index 3a29eff5cc..87a32e52e4 100755
> > --- a/configure
> > +++ b/configure
> > @@ -1229,20 +1229,30 @@ case $git_submodules_action in
> >       ;;
> >   esac
> >
> > -libdir="${libdir:-$prefix/lib}"
> > -libexecdir="${libexecdir:-$prefix/libexec}"
> > -includedir="${includedir:-$prefix/include}"
> > +# Emits a relative path in the case of an empty prefix.
> > +prefix_subdir() {
> > +    dir="$1"
> > +    if test -z "$prefix" ; then
> > +        echo "$dir"
> > +    else
> > +        echo "$prefix/$dir"
> > +    fi
> > +}
> > +
> > +libdir="${libdir:-$(prefix_subdir lib)}"
> > +libexecdir="${libexecdir:-$(prefix_subdir libexec)}"
> > +includedir="${includedir:-$(prefix_subdir include)}"
> >
> >   if test "$mingw32" = "yes" ; then
> >       bindir="${bindir:-$prefix}"
> >   else
> > -    bindir="${bindir:-$prefix/bin}"
> > +    bindir="${bindir:-$(prefix_subdir bin)}"
> >   fi
> > -mandir="${mandir:-$prefix/share/man}"
> > -datadir="${datadir:-$prefix/share}"
> > -docdir="${docdir:-$prefix/share/doc}"
> > -sysconfdir="${sysconfdir:-$prefix/etc}"
> > -local_statedir="${local_statedir:-$prefix/var}"
> > +mandir="${mandir:-$(prefix_subdir share/man)}"
> > +datadir="${datadir:-$(prefix_subdir share)}"
> > +docdir="${docdir:-$(prefix_subdir share/doc)}"
> > +sysconfdir="${sysconfdir:-$(prefix_subdir etc)}"
> > +local_statedir="${local_statedir:-$(prefix_subdir var)}"
> >   firmwarepath="${firmwarepath:-$datadir/qemu-firmware}"
> >   localedir="${localedir:-$datadir/locale}"
> >
> > @@ -3763,6 +3773,11 @@ if test "$skip_meson" = no; then
> >     mv $cross config-meson.cross
> >
> >     rm -rf meson-private meson-info meson-logs
> > +
> > +  # Workaround for a meson bug preventing empty prefixes:
> > +  # see https://github.com/mesonbuild/meson/issues/6946.
> > +  prefix="${prefix:-/}"
> > +
> >     run_meson() {
> >       NINJA=$ninja $meson setup \
> >           --prefix "$prefix" \
> > --
> > 2.35.1.265.g69c8d7142f-goog
> >
>

