Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29203A1562
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 15:21:22 +0200 (CEST)
Received: from localhost ([::1]:48432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqy93-00011B-Pd
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 09:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqy7r-0000CZ-3h
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:20:07 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqy7o-0006j9-8R
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:20:06 -0400
Received: by mail-ed1-x532.google.com with SMTP id f5so23615220eds.0
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LaV/UHa5TQgv7JxhhRjOMOiWp/SiVoWJt2egg+7HuVE=;
 b=pHRLXmlr8J8s/DigcNHM5yaoRZa4h286vhk6IzNhJIVfTkGI4hWGzvn2WO4JI5HSRn
 1pcX2YQJNsrjiCHcxffu5hapG6Jl/uhV2167zvwUSZEWVWRtRWA7LEdkASd6QDBYFwrM
 yvDC5/YmXKYzb91Avx4+OQ91LiDz+XvEBkbNBJb1dZumW1sYFIOnsa2rj96dfa4xOsqC
 jkpPlM+pmqT5Qb7DKXvWN2mErd5KlzJexuqoOtUW02+DEUKGrk691rsvr/mBuqdEWdrj
 q4loz4ddLwyQ2JdCsyEQ4fE0Xo0FqoZZx6kFofKUhzhNtM18EdMqMtJFUHhA589HIhc6
 ydIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LaV/UHa5TQgv7JxhhRjOMOiWp/SiVoWJt2egg+7HuVE=;
 b=VNL3sThJjCtWptDy/u+mjq79EkVJadcRnCL5XAHcebZ+G6594K2yGPWYQDMzqWj8j3
 jOfusagxZpub+Wkeliy7r+cUV5k9cREzXdlFaaVPpY9XE1Ind9bxbPijVhp2TUvEg24+
 kCtqr94BMEWRoBUre9lAt4cTnPA7ClqDFbECkc8L2vOxqWwGAgc3SMHZUbjsNr1lLeaW
 EuG1IjiJTe454+zshJeUzF/0JmzkseUWB665Ye1xhFAjqiC/kgq11SoseIaV9XglBV4r
 6ZUHtisPqWA0zFAKLPxETcV0GRWWyYikKZ+nMcXiFzdcCpI5Uk8ftHq7vcE7rRlrDrd7
 pq/A==
X-Gm-Message-State: AOAM533DteF3tWU7NJ9Qz5l/8wE9TiGN+VGJMqCLqmsUnPw5eGC7G4DK
 sprSeKT+oWqZAKwINiLy+QK7K8tNLOu2x+xCMEliJQ==
X-Google-Smtp-Source: ABdhPJzQ1z1Dnv2uJpOyhPYKPduWraQSWPdv//+/KstWguejgu/FqBJg9FdWdhC7qvL1cf9zsA8PVfTLhtrD0dMRjRw=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr13872096edt.100.1623244802658; 
 Wed, 09 Jun 2021 06:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210608170607.21902-1-peter.maydell@linaro.org>
 <CAMxuvay_bMs_hRzMjc-bVfFJaqk_Zui8anU-dNam4tUztxcvWQ@mail.gmail.com>
 <CAFEAcA9wHEcHO7GpiWZif2w-CUBmLPJYUgr11su7S2hAPhiuwA@mail.gmail.com>
 <87bl8fnrk8.fsf@dusky.pond.sub.org>
In-Reply-To: <87bl8fnrk8.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Jun 2021 14:19:28 +0100
Message-ID: <CAFEAcA8DMwg5mAVDq8GJggCu79eNw6ZLKnbs0wFDPv=-VhhpSQ@mail.gmail.com>
Subject: Re: [PATCH] tests/unit/test-char.c: Fix error handling issues
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Jun 2021 at 13:36, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 8 Jun 2021 at 20:51, Marc-Andr=C3=A9 Lureau
> > <marcandre.lureau@redhat.com> wrote:
> >>
> >> Hi
> >>
> >> On Tue, Jun 8, 2021 at 9:06 PM Peter Maydell <peter.maydell@linaro.org=
> wrote:
> >>> I think that improving the quality of the failure reporting
> >>> in 'make check' is useful, and that we should probably turn
> >>> on g_test_set_nonfatal_assertions() everywhere. (The worst that
> >>> can happen is that instead of crashing on the assert we proceed
> >>> and crash a bit later, I think.) Awkwardly we don't have a single
> >>> place where we could put that call, so I guess it's a coccinelle
> >>> script to add it to every test's main() function.
> >>>
> >>
> >> I don't have any strong opinion on this. But I don't see much sense in
> >> having extra code for things that should never happen.
> >
> > The point is that I want to make them happen, though...
>
> I'd prefer not to.
>
> Writing tests is tedious enough as it is.  Replacing
>
>     assert COND in one of the many ways GLib provides
>
> by
>
>     assert COND in one of the many ways GLib provides
>     if (!COND) {
>         bail out
>     }
>
> makes it worse.
>
> Readability suffers, too.

I agree. But glib doesn't provide a "check this test thing I'm
trying to test, and make it cleanly abandon and fail the test
if the check passes" function. I suppose we could rig one up
with setjmp/longjmp and some macros...

> >> I would teach coverity instead that those asserts are always fatal.
> >
> > If you want an assert that's always fatal, that's g_assert().
> > These ones are documented as not always fatal.
>
> You'd sacrifice the additional output from g_assert_cmpint() & friends,
> which can sometimes save a trip through the debugger.  I don't care all
> that much myself, but I know others do.

> Plain assert()'s behavior is configurable at compile time: assertion
> checking on / off.  This sets a trap for the unwary: side effects in the
> argument.  We avoid the trap by gluing the compile-time switch to "on".
>
> GLib's optionally non-fatal assertions add new traps, with much less
> excuse.  Without recovery code, non-fatal assertions make little sense.
> But when you have to add recovery code anyway, you could easily switch
> to a new set of check functions, too.  Overloading the existing
> assertion functions was in bad taste.

I agree that I wouldn't have named them _assert myself...

-- PMM

