Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBFF416541
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 20:34:44 +0200 (CEST)
Received: from localhost ([::1]:47540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTTYR-0005z4-Fs
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 14:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTTW3-0004KH-9U
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:32:15 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTTW0-0007zM-M7
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:32:14 -0400
Received: by mail-wr1-x435.google.com with SMTP id g16so19882982wrb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 11:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PpHQXq5BUfjFyKIXpwOZOXi8Uco837zmSfeEicZ18Jc=;
 b=iCuvsp1tFNbld4oSppBnTRMero0Yy4c7q19OHXmPY+LyX9YRc6qJ8KqZYrfxZ3vcsH
 B86nXDi0D8rkx3zVO5jyvwq7GmUKUz0kmoAxo+X1JeRCezvcyNvPzTycC+3KLoVowm9o
 Pt0nFvVDfa256oHNSImzxao4yHG1KPVQtypCBzkTkLYKsQzLurrTwNWMRe5L2YeNBL3S
 XoT0a+E5kPtv6+uPODjwZCcIcXtD2A5zM6vyRCwXSVGn8B5PU7GPwPpCIWJsGE+dLW1r
 ERQetIehDJ3oTGeSS29cY8o5TL44Cmf2R563ECFnoIwNZZSpqzVaJ+VoEJwmqqXwXvXG
 xSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PpHQXq5BUfjFyKIXpwOZOXi8Uco837zmSfeEicZ18Jc=;
 b=Z9pG8qGyTK4csWtTcark4REUe2KLRMPEG69DAZ42vRE5hhcZsJ47v/o2VJ8ODkWzm9
 rZ9o9Ha4Etkoz4WmKL7rqwDPCPya6wGPIHM0fYWnK4DkZvkp+F2wmBHHCYtRvMCNY3BN
 151ciyHverSlFHGq33o3+LXxuu1ady5yCAes8kpIQcP30a8qwcSSS/jpEAbaZhEnqoAT
 HOsnYRqROTNH8gUVFuqY3GoxOwzjaVPTRRE2S4YHCKU1H+MT8ix9n2YBqFXavJi/X26P
 fbhCuE+tq0BmFmDeBAolmyjesd3HVJ2yJebjR0hrv+paLnGrOgAFgA3SVi6LG81d+Ais
 iPLA==
X-Gm-Message-State: AOAM531Gb9xrm7i4GmY5jYRqjS0H8T6kYXUUZrThI0DcewTtlEwZLjeo
 TtrmxW1o6fbZK9UJcL8Rrcu3YtkWfPrWdpNeXx72sg==
X-Google-Smtp-Source: ABdhPJziPOZQKWAcuFxcogHnlKofH50sLGqD0m3FgTOXuxDv2hrQ+GMWaUWoQrIM5HQZ+/5/smPSZuCbU5krxpxyBxQ=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr6088817wmm.133.1632421929497; 
 Thu, 23 Sep 2021 11:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210923182204.4187601-1-jsnow@redhat.com>
 <20210923182204.4187601-2-jsnow@redhat.com>
In-Reply-To: <20210923182204.4187601-2-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Sep 2021 19:31:16 +0100
Message-ID: <CAFEAcA-54Ag+QyLknW5Fmt+LA8kcQbzJdZrZvkjWvz69xsEc5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: remove non-reference uses of single backticks
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Sept 2021 at 19:22, John Snow <jsnow@redhat.com> wrote:
>
> The single backtick markup in ReST is the "default role". Currently,
> Sphinx's default role is called "content". Sphinx suggests you can use
> the "Any" role instead to turn any single-backtick enclosed item into a
> cross-reference.
>
> This is useful for things like autodoc for Python docstrings, where it's
> often nicer to reference other types with `foo` instead of the more
> laborious :py:meth:`foo`. It's also useful in multi-domain cases to
> easily reference definitions from other Sphinx domains, such as
> referencing C code definitions from outside of kerneldoc comments.
>
> Before we do that, though, we'll need to turn all existing usages of the
> "content" role to inline verbatim markup wherever it does not correctly
> resolve into a cross-refernece by using double backticks instead.
>
> Signed-off-by: John Snow <jsnow@redhat.com>

> diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
> index 2749bb9bed3..d5fe9314c65 100644
> --- a/docs/devel/fuzzing.rst
> +++ b/docs/devel/fuzzing.rst
> @@ -182,10 +182,11 @@ The output should contain a complete list of matched MemoryRegions.
>
>  OSS-Fuzz
>  --------
> -QEMU is continuously fuzzed on `OSS-Fuzz` __(https://github.com/google/oss-fuzz).
> -By default, the OSS-Fuzz build will try to fuzz every fuzz-target. Since the
> -generic-fuzz target requires additional information provided in environment
> -variables, we pre-define some generic-fuzz configs in
> +QEMU is continuously fuzzed on ``OSS-Fuzz``
> +__(https://github.com/google/oss-fuzz).  By default, the OSS-Fuzz build

This is supposed to be a link and I don't think it's intended to be
fixed-width font formatting, so I don't think this is the correct syntax fix.

> +will try to fuzz every fuzz-target. Since the generic-fuzz target
> +requires additional information provided in environment variables, we
> +pre-define some generic-fuzz configs in
>  ``tests/qtest/fuzz/generic_fuzz_configs.h``. Each config must specify:
>
>  - ``.name``: To identify the fuzzer config
> diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
> index 24012534827..6b1230f2d7f 100644
> --- a/docs/devel/migration.rst
> +++ b/docs/devel/migration.rst
> @@ -403,8 +403,8 @@ version_id.  And the function ``load_state_old()`` (if present) is able to
>  load state from minimum_version_id_old to minimum_version_id.  This
>  function is deprecated and will be removed when no more users are left.
>
> -There are *_V* forms of many ``VMSTATE_`` macros to load fields for version dependent fields,
> -e.g.
> +There are *_V* forms of many ``VMSTATE_`` macros to load fields for
> +version dependent fields, e.g.

This doesn't seem to be changing a `...` ?

>  .. code:: c
>
> @@ -819,9 +819,9 @@ Postcopy now works with hugetlbfs backed memory:
>  Postcopy with shared memory
>  ---------------------------
>
> -Postcopy migration with shared memory needs explicit support from the other
> -processes that share memory and from QEMU. There are restrictions on the type of
> -memory that userfault can support shared.
> +Postcopy migration with shared memory needs explicit support from the
> +other processes that share memory and from QEMU. There are restrictions
> +on the type of memory that userfault can support shared.
>

This part doesn't seem to be changing any `...` use ?

The rest looks OK.

thanks
-- PMM

