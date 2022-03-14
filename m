Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF7F4D8BEC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 19:49:30 +0100 (CET)
Received: from localhost ([::1]:41982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTpl3-00048I-9P
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 14:49:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTpih-0002ah-Ap
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:47:04 -0400
Received: from [2607:f8b0:4864:20::112c] (port=42924
 helo=mail-yw1-x112c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTpif-0002NJ-8P
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:47:02 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2dbd97f9bfcso174986147b3.9
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 11:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3S61LlyfUIE02gidO/QCin7HCsbvvsQjDWGyXEKzb+0=;
 b=RkVx9ILycIE320yidWcO7ytoACZL84A7Vfy2A2Q0iVe50jYBeq9Jhb85IM/oBNTa1j
 oPGL3Jo50V5ijytgiWztn0MTYfE2KHeyYvrw+49iD+a8Iq8WEwn/9dsLltDJL2taHl6h
 MV/fZLxYsnUQ0TedOKWuFTuap/j15SwQV+Qsv4lBfm4hmooQC6QQTfZ1x/o8rzm84QSk
 w4YVmRTY+Xxuf7H2f8V2kcL5mMoPq9ts/pfTNlX7g4uuPj7YVSfMgu+UnDr0oF7k0Jdq
 BlIcu4+wadPMIs+N/hZhPSH4tHN8Yh475HwtQxlGl2ZiKLCOJoLRDC4w8wonK0OVyZd1
 z70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3S61LlyfUIE02gidO/QCin7HCsbvvsQjDWGyXEKzb+0=;
 b=02QOegt58ekGD+xnnfvn/u/o/YrmqP5azNLknLPH/VrSACTyDdWMx5fnTUFat9NT+v
 NujvI4rPowOQo279CMExcWEGRL0M59OyFOiwUs6HTk0DZNaoAYINA7sgbKMjWbwoWz1N
 BnxU88K3ccps3kdAD4mlWQlTtkqqs8SOByeMVwYh35Um11kDucHY1rphCjOJGEPMaYL4
 FSCcFbCE9Jg0YtSqAfYI6NeF4FOLZsuY+gcsfS+yRJ/D6OcyQv4pb/evwcMOG3jjPm5r
 YlN8wLLarzSLsiatI7DnP7VKpEgG57gVwdgqbCa3a47NbVbiKPPAl9b4GX92iDnDC7Xp
 qOMw==
X-Gm-Message-State: AOAM531DLmvCbIfTWJGeqFCjlbbsKGTZ98DN5zplefhYOZBIA590SQFR
 99QKNgNaaT2+ojUi7znGeIUGaG3EbA1ZRQcja6pBBg==
X-Google-Smtp-Source: ABdhPJzIiHtI+hkY2WpVuXoIU5U98RyzYy5EjoXskSrEx2s8GI6kpPWdiNKHn0MRsdOVY13OfNLbcM+HmdiEkT1NWc8=
X-Received: by 2002:a81:12c3:0:b0:2dc:5f5a:38ec with SMTP id
 186-20020a8112c3000000b002dc5f5a38ecmr20414374yws.347.1647283620049; Mon, 14
 Mar 2022 11:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220314154557.306-1-adeason@sinenomine.net>
 <20220314154557.306-2-adeason@sinenomine.net>
 <CAFEAcA8DZby3k7rZ3F4m037b_qjANzEk-ekVQYxAm5tN1_v84w@mail.gmail.com>
 <20220314131800.89dbb505371e68c7ad382795@sinenomine.net>
In-Reply-To: <20220314131800.89dbb505371e68c7ad382795@sinenomine.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 18:46:48 +0000
Message-ID: <CAFEAcA_3XjOz6T3q0QA=+LyZsruPTdT-vs0TbOM0fN=86+WKFg@mail.gmail.com>
Subject: Re: [PATCH 1/2] util/osdep: Avoid madvise proto on modern Solaris
To: Andrew Deason <adeason@sinenomine.net>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 at 18:18, Andrew Deason <adeason@sinenomine.net> wrote:
>
> On Mon, 14 Mar 2022 16:36:00 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Mon, 14 Mar 2022 at 16:12, Andrew Deason <adeason@sinenomine.net> wrote:
> > >  #ifdef CONFIG_SOLARIS
> > >  #include <sys/statvfs.h>
> > > +#ifndef HAVE_MADVISE_PROTO
> > >  /* See MySQL bug #7156 (http://bugs.mysql.com/bug.php?id=7156) for
> > >     discussion about Solaris header problems */
> > >  extern int madvise(char *, size_t, int);
> > >  #endif
> > > +#endif
> >
> > Rather than keeping this inside a CONFIG_SOLARIS and only doing
> > the meson.build test if targetos == sunos, I would prefer it if we
> > unconditionally determined two things in meson.build:
> >  (1) do we have madvise in the usual way? (this is what we would
> >      want CONFIG_MADVISE to be, and might even be what it actually is)
> >  (2) do we have madvise but only if we provide a prototype for it
> >      ourselves? (maybe CONFIG_MADVISE_NO_PROTO)
>
> CONFIG_MADVISE is set if we can cc.links() something that calls
> madvise(). If we're missing the prototype, that will fail with -Werror,
> but I expect succeeds otherwise. If cc.links() just uses the cflags for
> the build, then it seems like it might succeed or fail depending on
> --enable-werror.

Mmm. I think that we wrote it that way because it was a straight
translation to meson of the previous configure-script madvise
detection code. I think it is equivalent to
config_host_data.set('CONFIG_MEMALIGN', cc.has_function('memalign'))
which also effectively does a pure "does this link?" test.
So maybe we want to keep CONFIG_MEMALIGN the way it is and add
a CONFIG_MISSING_MEMALIGN_PROTOTYPE or something. I think that
this is rapidly getting out of my depth as far as meson is concerned,
though.

> I see some other tests give -Werror as an explicit
> extra argument (HAVE_BROKEN_SIZE_MAX, and something for fuzzing); should
> this be doing the same to make sure it fails for a missing prototype?
>
> Also just to mention, if we don't care about older Solaris, the
> prototype can just be unconditionally removed. It's pretty annoying to
> even try to build qemu from git on Solaris 11.4 and earlier, because
> many of the build requirements need to be installed/compiled manually
> (notably python 3.6+, but iirc also ninja, meson, etc). So I haven't
> really tried; there may be many other build issues there.

Hard to say whether we do or don't care. We have had some
mailing list threads in the past. I think we might also care
a bit about Illumos, which might still have some issues that
Solaris proper has since fixed. Sometimes it's easier to hang on
to the portability workaround than to try to find out :-)

> > Side note: do you know why CONFIG_SOLARIS includes sys/statvfs.h ?
> > Is that unrelated to madvise() ?
>
> I think so, it was added in commit 605686cd7ac, which predates madvise()
> in that file. It does look like it could be removed from a quick glance.

Yeah, I think in commit 4a1418e07bdcfaa31 in 2009 we removed kqemu
support, which was the only thing using statvfs() in that file,
but forgot to remove the #include. Since that's an entirely separate
thing from madvise, feel free to either ignore it or send a separate patch.

-- PMM

