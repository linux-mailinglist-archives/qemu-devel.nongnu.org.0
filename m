Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C1C74980
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 11:02:58 +0200 (CEST)
Received: from localhost ([::1]:57344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqZeL-0007M3-DQ
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 05:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58164)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hqZe3-0006xR-Fh
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 05:02:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hqZe2-0003yO-ED
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 05:02:39 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:38517)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hqZe2-0003xX-8L
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 05:02:38 -0400
Received: by mail-ot1-x334.google.com with SMTP id d17so50918335oth.5
 for <qemu-devel@nongnu.org>; Thu, 25 Jul 2019 02:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3uQGYwoUN2J/+G3Vd6orNR4UBoNPl3uhftnJe1gf06A=;
 b=Sxhddl+SV2XRn447D6Ta2XfeSWNf+m/P9bdB0hFnl6wRo3eEkbPjR8YAOlmoGWzaBL
 frgDNEaRo+P3twPnFwlKYlP8hxpykX1j0FsyScJsrU0GirL6oWmXhJCXka+jnNiGg0wV
 0N/RJbG6cnKEsAB940Y7EpYz9ZKOjgoiIKP+x3ZWLsrB08GmeTDz2zXhlKWrZMKXZ767
 4FPBZMp4+etPSdJzNIgXOTaH+FX3ZPWbHPg9P6Qt0Rtuqi9tYrIX1W9eEp7XLasn7c+0
 BT7uvZRPlCHnqGciTKAaN1D7Q2Uz9FA4BnWih9ynqkTRm9wNQdY4ja7Rh86XqpLbHKuK
 RLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3uQGYwoUN2J/+G3Vd6orNR4UBoNPl3uhftnJe1gf06A=;
 b=SecpXIGuCY6HqBIQxbPpoO19M/PgV5L8Ytwd4rvstHnYNzzjBQd3kKpKM0MSthLPb1
 N6OKUPCYccuvqWMrYtlM/EkZr8zad6cD2UHQ0D6SWDAVD6WpkbpIUq5eiWMMEyLCY6/4
 xd6w6bVU4Xf7cienSgLwoMmeKzukutlfPcFgYoY4NZ2U0YBXHHpYtJeBt8AyK7NCkpLT
 YMj28DC1AlMjntflu0qyzfu9XHn78iJO61XpDGoktc9pLiFNLZ7UY/HGyBLpy+6fZYr4
 OO8DD4KltOh454ZHBWg3gmgx8nsCGGvMR1gXIG64LGRNNlB2xNWd1DfCCo1N0g3e+DWP
 FC+A==
X-Gm-Message-State: APjAAAXKzg4bJ5cGki1d7+iUcH9Nj4Am3MlW70MG/V5kdixD7O8Anqjx
 hGaYmkhqdSu8q6FaHclULDTQLGXUZ4yootZ5zTRvyw==
X-Google-Smtp-Source: APXvYqx++A83L333O6PtUU0m9SlagwAkx24KyJluBC1SSKxC6XyArO0MTV0kN3JsB58mQRi+rlaC+SEMxH1dlDEVhuU=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr5909730oti.91.1564045356987; 
 Thu, 25 Jul 2019 02:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <3dd21116-32ae-3eb2-ffcf-2ba77391ccc3@redhat.com>
In-Reply-To: <3dd21116-32ae-3eb2-ffcf-2ba77391ccc3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jul 2019 10:02:26 +0100
Message-ID: <CAFEAcA_fRH9dp15ttRf_6mwmFVampbxszewz-LFv1qv5Sj83eQ@mail.gmail.com>
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::334
Subject: Re: [Qemu-devel] Exploring Sphinx, autodoc, apidoc,
 and coverage tools for python/qemu
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Jul 2019 at 22:06, John Snow <jsnow@redhat.com> wrote:
> And then you can edit e.g. the top-level index.rst TOC in docs/index.rst
> to look like this:
>
> ```
> .. toctree::
>    :maxdepth: 2
>    :caption: Contents:
>
>    interop/index
>    devel/index
>    specs/index
>    modules
> ```

This is obviously just prototyping, but you don't want to put
anything new in this top level index.rst -- it's only used
for by-hand full-tree docs builds. Builds from the makefile
rules will just build our separate manuals (interop, devel,
specs) separately. You want to put your new documentation into
whichever manual is best suited (probably devel/, but possibly
interop/ in some cases?)

(Will read the rest of this email later.)

thanks
-- PMM

