Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785B757BB65
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 18:27:25 +0200 (CEST)
Received: from localhost ([::1]:47288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oECXk-0005n0-6x
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 12:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oECVf-0003F3-7z
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 12:25:15 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:40629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oECVd-0007Gv-0b
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 12:25:14 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-31d85f82f0bso179259677b3.7
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 09:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Wnh2GuB9c1lnwkArzhsE+QHSTpgmQhhw4dswlzpSIuI=;
 b=tjuyfbuEwZ3fPG+hz0/OfLMsMMmSrRo0tt0fKnqZHyFWADokPeynmoR2tkCA+0jdbV
 MhHHa4WCBxAHAHaKXKlXMx3JNOFgilftSKkKduP1gGkGkaqKOlFpiQ8hEZskbcy3o0WV
 YvYFEhH2k8D4OHStUVeRVyxq2PIjw/df8z86OeFgz2uj2n6VXUjhn5nVB+TW1aeJuLsL
 N9Wcpzf9NAnncFu/lrFrDmF8wMWvP7Q0Hk79/ArZKJeMFUnMMTBIYffDoGAYeEdzhGiT
 pi3cxQCVSqd+9X1B8osEzHgifJF2Nw4wdf96SGCDt7XOrEO8biWwqnE6E1oD8+djOv7V
 +Hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Wnh2GuB9c1lnwkArzhsE+QHSTpgmQhhw4dswlzpSIuI=;
 b=58P+5yf4qi6FeH0Myq33HO2aBoLfmCpc0NBUS2YV6J8w1ot6sLCT3MtyyMKFcRd4jX
 JjzWH1DQRSwPu6x6GWJACYZGfiYxU5WzcVdQeSBcduQ3dkyXr+hizYDigtt/4fezjbzQ
 l0e3M4je+l80xI1BzGtDVkA95DWXkdw9heOL5iYSms6MvjpJ+5zuFjwPyPpvh2Wmfcde
 Zc4UqhNeBUUxj8JjQe2e47wgUbq89RoYdzvWESWnzrelvIA52dUleVms71ZkG56jMc3a
 OHBfqVI7z6S0PPlaZfQ8HXyr1Z/mlwjozNrjwJql88cXTduXcuzFfBw+582p0jGizVJo
 sqOw==
X-Gm-Message-State: AJIora8QMNuEkUexSwtQoJtQ+cdvxFvUImZIfTRr/LWOURgoxbn34Lz8
 ZmHs7W6gMaz788Fazss5Oh8T+4FPGvOLTe5n915Zkw==
X-Google-Smtp-Source: AGRyM1sVIdr3uoY3wb4+DEClI7gL+KkCc1X3cQjiVQRe26ctW2r3MjuWa8gMKK8ozR/V1LtWJ1jtfC7iOqioGjcOPDU=
X-Received: by 2002:a0d:d2c3:0:b0:31e:62ea:3303 with SMTP id
 u186-20020a0dd2c3000000b0031e62ea3303mr7542058ywd.64.1658334311890; Wed, 20
 Jul 2022 09:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220707163720.1421716-1-berrange@redhat.com>
 <20220707163720.1421716-2-berrange@redhat.com>
In-Reply-To: <20220707163720.1421716-2-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jul 2022 17:25:00 +0100
Message-ID: <CAFEAcA-gANYJSK4LPXQoP0jTO5ex-zf3XZA2WH91ByXCEZMysQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] tests: introduce tree-wide code style checking
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Thu, 7 Jul 2022 at 17:37, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> Historically QEMU has used the 'scripts/checkpatch.pl' script to
> validate various style rules but there are a number of issues:
>
>  - Contributors / maintainers are reluctant to add new
>    tests to it, nor fix existint rules, because the Perl
>    code is much too hard to understand for most people.
>
>  - It requires the contributor to remember to run it as it
>    is not wired into 'make check'
>
>  - While it can be told to check whole files, in practice
>    it is usually only used to check patch diffs, because the
>    former would flag up pages of pre-existing violations that
>    have never been fixed
>
>  - It is said to be OK to ignore some things reported by the
>    script, but don't record these exceptional cases anywere.
>    Thus contributors looking at existing violations in tree
>    are never sure whether they are intentional or historical
>    unfixed technical debt.
>
>  - There is no distinct reporting for each type of check
>    performed and as a consequence there is also no way to
>    mark particular files to be skipped for particular checks
>
> This commit aims to give us a better approach to checking many
> types of code style problems by introducing a flexible and simple
> way to define whole tree style checks.

Hi; thanks for doing this rewrite into Python. I think it
is definitely easier to understand.

> The logic provide is inspired by the GNULIB 'top/maint.mk' file,
> but has been re-implemented in a simple Python script, using a
> YAML config file, in an attempt to make it easier to understand
> than the make rules.
>
> This commit does the bare minimum introducing the basic infra:
>
>  - tests/style.py - the script for evaluating coding style rules
>  - tests/style.yml - the config defining the coding style rules
>
> The concept behind the style checking is to perform simple regular
> expression matches across the source file content.

> As such this style matching framework is not proposed as a solution for
> all possible coding style rules. It is general enough that it can
> accomplish many useful checks, and is intended to be complimentary to
> any style checkers with semantic knowledge of the code like libclang,
> or pylint/flake8.

So would the intention be that we try to obsolete checkpatch,
or will we still have checkpatch because it can find some
style issues that this framework cannot handle?

I think that on balance I'm in favour of this patchseries if
it is part of a path where we say "we are going to drop
checkpatch and replace it with X, Y and Z" (and we actually
implement that path and don't just end up with another
half-completed transition :-)). I'm much less in favour if
it's just "we added yet another thing to the pile"...

> If a file is known to intentionally violate a style check rule
> this can be recorded in the style.yml and will result in it being
> ignored.  The '--ignored' flag can be used to see ignored failures.

Is it possible to have an individual "suppress this style check
in this one place" mechanism? Dropping an entire file from the
style check is certainly going to be useful for some situations,
but very often I would expect there might be one place in a
multi-thousand line C file where we want to violate a style
rule and it would be nice not to lose the coverage on all the
rest of the file as a result. Plus a whole-file suppression that
lives somewhere other than the source file is going to tend to
hang around for ages after we refactor/delete whatever bit of
source code it was that meant we needed the suppression, whereas
if the suppression is in the source file itself then you see it
when you're working on that bit of code.

(All comments below here are just nits.)

>  meson.build            |   2 +
>  tests/Makefile.include |   3 +-
>  tests/meson.build      |  17 ++++
>  tests/style.py         | 218 +++++++++++++++++++++++++++++++++++++++++
>  tests/style.yml        |  88 +++++++++++++++++

I think this should live in scripts/, same as checkpatch.

>  5 files changed, 327 insertions(+), 1 deletion(-)
>  create mode 100755 tests/style.py
>  create mode 100644 tests/style.yml
>
> diff --git a/meson.build b/meson.build
> index 65a885ea69..d8ef24bacb 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -18,6 +18,8 @@ config_host =3D keyval.load(meson.current_build_dir() /=
 'config-host.mak')
>  enable_modules =3D 'CONFIG_MODULES' in config_host
>  enable_static =3D 'CONFIG_STATIC' in config_host
>
> +in_gitrepo =3D run_command('test', '-d', '.git', check: false).returncod=
e() =3D=3D 0

Should we use Meson's fs.is_dir() rather than running a shell?
(https://mesonbuild.com/Fs-module.html)


I spotted a couple of typos just while scrolling through, but I
have not attempted to actually review the Python.

> +# Expand a regular expression from the config file which
> +# can be in several formats
> +#
> +#  - a plain string - used as-is as a regular expression
> +#  - a list of strings - each element is joined with '|'
> +#  - a dict containing
> +#      - 'terms' - interpreted as a string / list of strings
> +#      - 'prefix' - added to the front of the regular
> +#      - 'prefix' - added to the end of the regular
> +#
> +# Returns: a regulare expression string

"regular"

> +# Take a list of source files and filter it returning a subset
> +#
> +# If @match is non-NULL, it is expanded as a regular expression
> +# and the source file name is included if-and-only-if it matches
> +# the regex.
> +#
> +# If @nonmatch is non-NULL, it is expanded as a regular expression
> +# and the source file name is excluded if-and-only-if it matches
> +# the regex.
> +#
> +# Returns: the filtered list of soruces

"sources"

> diff --git a/tests/style.yml b/tests/style.yml
> new file mode 100644
> index 0000000000..b4e7c6111f
> --- /dev/null
> +++ b/tests/style.yml
> @@ -0,0 +1,88 @@
> +# Source code style checking rules
> +#
> +# Each top level key defines a new check, that is
> +# exposed as a test case in the meson 'style' test
> +# suite.
> +#

You should say somewhere here which of the half a dozen
possible regular expression syntaxes is used.

> +# Within each check, the following keys are valid

Missing trailing colon:

> +#
> +#  * files
> +#
> +#    A regular expression matching filenames that
> +#    are to be checked. Typically used to filter
> +#    based on file extension. If omitted all files
> +#    managed by git will be checked.
> +#
> +#  * prohibit
> +#
> +#    A regular expression matching content that is
> +#    not allowed to be present in source files. Matches
> +#    against single lines of text, unless 'multiline'
> +#    option overrides. Either this option or 'require'
> +#    must be present

Missing trailing '.' (here and in various others below)

> +#  * enabled
> +#
> +#    A boolean providing a way to temporarily disable
> +#    a check. Defaults to 'true' if omitted.
> +#
> +# For all the keys above which accept a regular expression,
> +# one of three syntaxes are permitted

trailing colon

> +#
> +#  * string
> +#
> +#    The full regular expression to match
> +#
> +#  * list of strings
> +#
> +#    Each element of the list will be combined with '|'
> +#    to form the final regular expression. This is typically
> +#    useful to keep line length short when specifying matches
> +#    across many filenames
> +#
> +#  * dict
> +#
> +#    Contains the keys:
> +#
> +#      * terms
> +#
> +#        Either a string or list of strings interpreted as above
> +#
> +#      * prefix
> +#
> +#        A match added to the front of the regex. Useful when
> +#        'terms' is a list of strings and a common prefix is
> +#        desired
> +#
> +#      * suffix
> +#
> +#        A match added to the front of the regex. Useful when
> +#        'terms' is a list of strings and a common prefix is
> +#        desired

thanks
-- PMM

