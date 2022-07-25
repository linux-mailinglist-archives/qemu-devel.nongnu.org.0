Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CD35801DF
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 17:28:35 +0200 (CEST)
Received: from localhost ([::1]:50250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG00Y-0003Oy-EE
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 11:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oFzyd-0001ot-7z
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 11:26:35 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:40914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oFzya-0005FX-Uz
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 11:26:34 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-31d85f82f0bso113634467b3.7
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 08:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ondw/cl/bNKIE9vg+l4mJKreUoqxLdVwpgSsqLs4cKU=;
 b=vdxE2enSlTZngwdG88UmEd0yABlZd8OKlOmLEPBNitLoUJft/I4LTsipACD7iBQOHs
 Ml6PGMkqhCqrpi+XTr0BmzXrH7QWRRlBcBWgMeWCr+dcgKu5UegVVc/rHEKgFnj70MRb
 aqYYHraLrcJ2J5AlUZAwDaiPUE5/Bk2yecuxplt5RziGEX1+n6SV46W6DXCoqcA7SP1u
 mI1dWxf0jQiKge9r7JOwEpiS2WUyzGdnj287rodzyYrAQo8aDSMonGXALatpEnCiPY6C
 Yikt94VP/9XPf7N69fXZhOtbhvJHvzYnaP+MReyYAYbHy4pTtxUJVJWVlOrCotrBSiQ6
 6T2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ondw/cl/bNKIE9vg+l4mJKreUoqxLdVwpgSsqLs4cKU=;
 b=uUjI/gmttro2cKNwAxuGzwdVXAQAmKAUSfq9BFkJ4In+gXQrOlhQuv12kct+IBkXOh
 JUkzYnXiahE1JWZXX3V7WAN6DlYsCpzafG6ViO98rSZiModTnyNOe3UyWh3sjnj8/lC1
 JUT/nOxexGStrsVutQwSFw0Ykn/uGCcBROHj9JyWDVImsXaDAhoP6GUFXaljux9qFcTv
 kFt17HBSzbRADs3n65cloSE1Goxixu7VhU9kELKI5JicF7N5gGuzX1xzM8fJdP+rVNxR
 VLOs7EUQUqsOQwLWI+lJU0NEnHP1Da6vWhmBRwzoylC6aoeS7wMyYipMGUr4mxNljtBy
 svmw==
X-Gm-Message-State: AJIora9NviYEzbkpbksXTj8LW5p3ZrlWGQm2MKRqlsAmn0WCLbQvfLDQ
 l7A3M7AoB2CvttqfaQUEEXsAUSKwQMgoHA4mCmzGKA==
X-Google-Smtp-Source: AGRyM1vNPzI0ul4/gGB1R3KYkvCLdhOxmVbMpkbjUicDc5e+TPPR1oDj+Gpz+Kj0fGzyMWcc+InXhRfcJJbq6bBm5jg=
X-Received: by 2002:a81:1116:0:b0:31e:7a03:5ea with SMTP id
 22-20020a811116000000b0031e7a0305eamr10742219ywr.455.1658762791841; Mon, 25
 Jul 2022 08:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220707163720.1421716-1-berrange@redhat.com>
 <20220707163720.1421716-2-berrange@redhat.com>
 <CAFEAcA-gANYJSK4LPXQoP0jTO5ex-zf3XZA2WH91ByXCEZMysQ@mail.gmail.com>
 <Ytgt+I+XFg2sFbNi@redhat.com>
In-Reply-To: <Ytgt+I+XFg2sFbNi@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2022 16:25:51 +0100
Message-ID: <CAFEAcA_tuox_exYgvFJ8ZOLk=bZbepKr5ToS7DR5VAsyOhhgfQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] tests: introduce tree-wide code style checking
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jul 2022 at 17:32, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> I would certainly like to see us eventually remove
> checkpatch.pl because of the various downsides it has.
>
> The caveat is that I've not actually looked in any detail
> at what things checkpatch.pl actually checks for. Without
> looking my guess-timate is that we could probably replace
> 90% of it without much trouble. Perhaps we'll just decide
> some of the checkjs in checkpatch aren't worth the burden
> of maintaining its usage.

I went through checkpatch, and here are the warnings I think
are worth making sure we still have. I've included all the
ones that look like we've added them specifically for QEMU
on the basis that if we cared enough to edit checkpatch to
add them then we ought to care enough to retain them.

* "Do not add expected files together with tests,
   follow instructions in tests/qtest/bios-tables-test.c"
* "do not set execute permissions for source files"
* "please use python3 interpreter"
* "Author email address is mangled by the mailing list"
* syntax checks on Signed-off-by lines
* "does MAINTAINERS need updating?"
* "Invalid UTF-8"
* "trailing whitespace"
* "DOS line endings" (maybe)
* "Don't use '#' flag of printf format ('%#') in trace-events"
* "Hex numbers must be prefixed with '0x' [in trace-events]"
* line-length checks (though for a "whole codebase must pass"
  test we would want to set the length longer than the current
  "author should consider whether to wrap" value
* hard coded tabs
* the various dodgy-indentation checks
* the various space-required checks eg around operators
* misformatted block comments
* "do not use C99 // comments"
* "do not initialise globals/statics to 0 or NULL"
* "do not use assignment in if condition"
* "braces {} are necessary for all arms of this statement"
* "braces {} are necessary even for single statement blocks"
* "Use of volatile is usually wrong, please add a comment"
* "g_free(NULL) is safe this check is probably not required"
* "memory barrier without comment"
* "unnecessary cast may hide bugs, use g_new/g_renew instead"
* "consider using g_path_get_$1() in preference to g_strdup($1())"
* "use g_memdup2() instead of unsafe g_memdup()"
* "consider using qemu_$1 in preference to $1" (strto* etc)
* "use sigaction to establish signal handlers; signal is not portable"
* "please use block_init(), type_init() etc. instead of module_init()"
* "initializer for struct $1 should normally be const"
* "Error messages should not contain newlines"
* "use ctz32() instead of ffs()"
* ditto, ffsl, ffsll, bzero, getpagesize, _SC_PAGESIZE
* "Use g_assert or g_assert_not_reached" [instead of non-exiting glib asser=
ts]

These seem to me to fall into three categories:

(1) many are easy enough to do with grep
(2) there are some checks we really do want to do on the patch,
not on the codebase (most obviously things like Signed-off-by:
format checks)
(3) there are coding style checks that do need to have at least some
idea of C syntax, to check brace placement, whitespace, etc

thanks
-- PMM

