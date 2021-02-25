Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAA2325006
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 13:57:35 +0100 (CET)
Received: from localhost ([::1]:51502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFGD0-0000Hw-BS
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 07:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lFGBZ-0007d9-7k
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 07:56:05 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lFGBW-0002ej-Bp
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 07:56:04 -0500
Received: by mail-ed1-x533.google.com with SMTP id p2so6667556edm.12
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 04:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7l/A8l21/zSUDSVfPOt56+u/G3pIkdxrVYGfZHxAmnc=;
 b=F7PpiA+36U1z5O4RPTRDKwdrDnrIigaj40psJvtC0SDP9t9H/Gp+93uoPjiWOqi+Yh
 Nu7ZPXkXY0CDeDOegQkalYIrVSSmNJJSF3wq346eWltEWZhPbrJZp4JR+KNUis4H6UcK
 xymIPsZuIUAPGPWDogoCO6BDDGZqhU9FWNS3vT2K5DqeAx2bzqrDAxvgOs0yEFOUZpoy
 7Z7tu2PwWchJ0RGf6pPmB+3mDvkMMX1nL+ivV3giZhL5LQHJKKAglSQBtZgftChZ9eiH
 Rq++Bny4AWUGzordpDP3BUhec+nZKqYMeULbrJuXUU/nyoFgDQsVi8WwLKmrw1cz7EqW
 5xfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7l/A8l21/zSUDSVfPOt56+u/G3pIkdxrVYGfZHxAmnc=;
 b=ewFbVfcX9qC/ztoTRqydJ/KuxLV/A62m4fBdcRb/fRK5sKsTtg8z4w3ESv74vm65ib
 q9sWWns0BLG96g8Fc1n8/5k1X8coex9y1kfNzqTNjKMGcGfJiOjKjhR13fJ7cElacqfI
 CYpjUYuRXHA8EaTB9XwAb0Hc+aLArGeq4hHJTE/KCvW5nWue8i9nspEjkeVpzilqKApG
 XbVACOFc4YKGRnS0b0vNRk5sfRtvQG6IPFz8UAEKplFQJ/4u0NNV8EXHYyWZdHfXj6Wd
 Vopbvszw+9hibK6P15YifRQw/va21GzT2qo8GSFfE9XJvLteU3rxIROW6MOWSlxegPD2
 wiqg==
X-Gm-Message-State: AOAM532x9aUOS+V8zXSR/5gjMxiDahIGLf2fru+84KWBBDDkLdknXUmT
 S9tMokn3NHZYSa37Z5Ezh7KB4oH1Lw7k826evp5IOw==
X-Google-Smtp-Source: ABdhPJxsnyRYj6jMYSKyCYfQSU6MCoIDixGOMVJ7PAJ0JGOXqKM+bE7HtbPQN624AKhVcHWuRugAK/6jIHNfWMb8r08=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr2695933edd.100.1614257760556; 
 Thu, 25 Feb 2021 04:56:00 -0800 (PST)
MIME-Version: 1.0
References: <87ft1kqqsp.fsf@dusky.pond.sub.org>
In-Reply-To: <87ft1kqqsp.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2021 12:55:49 +0000
Message-ID: <CAFEAcA-NyQT_m37UfeH5KAQ9+dkNBHcQivYyrS4C9F3EUqJ+Nw@mail.gmail.com>
Subject: Re: Bogus "is either too old or uses too old a Python version" from
 docs/meson.build
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Feb 2021 at 12:23, Markus Armbruster <armbru@redhat.com> wrote:
>
> I just chanced on this one:
>
>     Program sphinx-build-3 found: YES
>     ../docs/meson.build:30: WARNING: /usr/bin/sphinx-build-3 is either too old or uses too old a Python version
>
>     ../docs/meson.build:33:6: ERROR: Problem encountered: Install a Python 3 version of python-sphinx
>
>     A full log can be found at /work/armbru/qemu/bld-x86/meson-logs/meson-log.txt
>
>     ERROR: meson setup failed
>
> My sphinx-build-3 is just fine, the problem is caused by me changing my
> tree so that
>
> 1. qapi-gen.py fails (because I messed up), and
>
> 2. make re-runs configure.
>
> Perhaps the test for a working sphinx-build-3 could be made a bit more
> robust.

I'm not sure what could reasonably be done. The Sphinx test is just
"try building a trivial document with our config (which is what
enforces the version requirement)". So yes, if you modify the QEMU sources
in a way that breaks the config file or one of the Sphinx plugins then
it'll trip the configure check. If you give the configure-check run
its own config file, then you end up with the version checks in two places
and they could get out of sync. One could try to have the conf.py have a
lot of conditionals to cut out things that the test-document doesn't use,
but then you run the risk that we no longer catch something for end-users
that we didn't anticipate that means we can't build the docs.

It seems more reasonable to me to assume that developers who are
actively modifying the QEMU code which is used in docs building
are able to read the log file that the error message points them
at, and can figure out what really happened from the log.

thanks
-- PMM

