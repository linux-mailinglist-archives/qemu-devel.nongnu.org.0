Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B68734D1E3
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 15:55:00 +0200 (CEST)
Received: from localhost ([::1]:35282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQsM7-0001U8-2A
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 09:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQsL4-0000ug-8G
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 09:53:54 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:34618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQsL2-0002dR-JR
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 09:53:53 -0400
Received: by mail-ed1-x52b.google.com with SMTP id y6so14356020eds.1
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 06:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LMGhwJqEas41PuQULA0CLMMfmANzBhm0jhI+FgmhLGM=;
 b=Bk6z/fkBSVwC+oqH7plL1fJiC6aBBwzmm5aTy9Fy6nH4wYO7Ch99GFlxT/kKOXOTD0
 E7wc8vSDhT5kIby+WZETdDLYj2eqq79CoFDGwcT/q+iakUMjXGRNFksSPX0Nebe3/14t
 MXVXZtwianX8c40HF7yGl4XjAD8HZuhm61dI002wCBW8wt5vihOThsRfSMp9MAmNrygb
 E/j+yvGmX1OwotlL5dKD9rPcwhUUHtZYOeO78MfWJj5HHam2P9TUQIffiGnIF43rBkIu
 023RgOkJsg+g1JLHZ6ApbZ/Qb1xzExTOU4wamfjcsW3bi6HEawgTtzPl4T0T5ezzmmMF
 kJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LMGhwJqEas41PuQULA0CLMMfmANzBhm0jhI+FgmhLGM=;
 b=brDmB+YqMKQwfPcA3zQkrGI6xCq4iXMSDIANej2FODrnJt9aFQEYM0zTt1OxPbT20f
 qq3xqMlp+zYircc3YO1sVUHsDQGwUU1pK8ZHm4xPNYfSYfr2SQO+GS6Qh/rpRZv6v97p
 WXPo4GLMe39kw2RsdyacDMNk4HTAuqy30nFVwB6iFgGbj0T9zVbuzWbpsHblR5wtxUg+
 bFtvQfEo+5ByK02nUrYhqjtG8d9tl+/hfWQFKEpS02YD+O6swbpco27YZdkOj3TqHlzR
 jdaSClBn7JpkQLFueEtQqHRckboniJOITb17OVyQWWCrbCNeuh90o5MDmrZ2Lj8uafOv
 nS/A==
X-Gm-Message-State: AOAM531NcEVGFr54wc85AMY0C5r4nbR5/9CnSxcAdt/GOWOZRxyGOVFC
 oNNUAvz44wfUnnpdYV8TMXtYnbQyLh6xp7lyZLWSlg==
X-Google-Smtp-Source: ABdhPJybvhTu5ZiixrICoNeKCYYzFVuy7o18j4cEtCOZwnsJOgzuiWioOY4bKGB3WVok4mSllnSPeUWpWiGlN3O3Mgg=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr28624128edb.204.1617026031131; 
 Mon, 29 Mar 2021 06:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210328184533.752840-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210328184533.752840-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Mar 2021 13:53:20 +0000
Message-ID: <CAFEAcA9FiNLr=CsxRLpUbMgROMBmO-8WoPtEkfL4b4+ZHrAhdA@mail.gmail.com>
Subject: Re: [PULL 00/10] For 6.0 patches
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Sun, 28 Mar 2021 at 19:45, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 7b9a3c9f94bcac23c534bc9f42a9e914b433b2=
99:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/fixes-20210326-pull-r=
equest' into staging (2021-03-26 12:58:58 +0000)
>
> are available in the Git repository at:
>
>   git@gitlab.com:marcandre.lureau/qemu.git tags/for-6.0-pull-request
>
> for you to fetch changes up to f57d44b452e11d8b7c9743476c30a8d0f80926de:
>
>   tests: Add tests for yank with the chardev-change case (2021-03-27 13:5=
7:40 +0400)
>
> ----------------------------------------------------------------
> For 6.0 misc patches under my radar.
>
> Peter, let me know if you would rather split that PR.
>
> ----------------------------------------------------------------

This produces a backtrace from sphinx-build which nonetheless doesn't
cause a build failure:


Program sphinx-build found: YES
../docs/meson.build:30: WARNING: /usr/bin/sphinx-build:
Configuration error:
There is a programable error in your configuration file:

Traceback (most recent call last):
  File "conf.py", line 154, in <module>
    import sphinx_rtd_theme
ModuleNotFoundError: No module named 'sphinx_rtd_theme'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/lib/python3/dist-packages/sphinx/config.py", line 157, in __in=
it__
    execfile_(filename, config)
  File "/usr/lib/python3/dist-packages/sphinx/util/pycompat.py", line
150, in execfile_
    exec_(code, _globals)
  File "conf.py", line 157, in <module>
    'The Sphinx \'sphinx_rtd_theme\' HTML theme was not found.\n'
sphinx.errors.ConfigError: The Sphinx 'sphinx_rtd_theme' HTML theme
was not found.



Program python3 found: YES (/usr/bin/python3)


In particular I see that on all the BSD VMs. If we're going to
require rtd that means we need to ensure it's present on all
the VM configs, docker configs, everything the CI uses, etc.
You should also flag up new build-deps in the pullreq cover
letter.

I dunno if we can get the error message neater (I know sphinx-build,
especially older versions, is a bit unhelpful about what it lets us
report.)

The test-yank stuff also failed on OSX:

Unexpected error in inet_connect_addr() at ../../util/qemu-sockets.c:380:
Failed to connect to '127.0.0.1:63820': Operation timed out
ERROR test-yank - too few tests run (expected 6, got 1)


thanks
-- PMM

