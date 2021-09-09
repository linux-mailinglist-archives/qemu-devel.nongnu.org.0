Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8943405A80
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 18:06:16 +0200 (CEST)
Received: from localhost ([::1]:44426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOMZ4-0006tZ-Mt
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 12:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOMVt-0003Y8-78
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:02:57 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:54024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOMVp-00041N-8J
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:02:56 -0400
Received: by mail-wm1-x330.google.com with SMTP id i3so1721534wmq.3
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 09:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QkjNKNvINq4/buCSUf35IGRkJyrt5zOGbKj5nu+IXMs=;
 b=Ft0X5S1yWbT/xK7VJxSYvCzQT3N1cSlVZUFRU12wf7Bb66jjiidzt073PwiO64iE26
 eYj3UUpP8TxSs3anVkTWuANIsh5xHlva7AuKn3w3LjUNJE4MyQybX6PoR4gzB1+BABIC
 J1EebG99GdXbiJtl8lLHjB3Ral2ETH0TDsMW5DNanRT+GgAUIONiycDfVXXg9FOuQZXz
 K5T84mMcpXT0gAYNZ9s3AIypqF8KHSc4722q+RJyLExajTNcQ1ZTiK5ogcWhTipyyT8e
 OjZbHkrFnjaTh/JGfPN/yZaGEW6yAuNE8Pe3yLluKZHViJjOxEXhydwWVWjdkFpTq+Vn
 A4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QkjNKNvINq4/buCSUf35IGRkJyrt5zOGbKj5nu+IXMs=;
 b=x2FRJ/kp9O5euFwx+sz/KR5Xh9v63CRIiTfkG1SR9ewgWhbWPOwWZSRnsMXGM2RLC2
 PQbOd5E/XBjD2fqqX74zyYRunCd3ipwmHlAZPXAM+WFRLN3u/fOngGtP8Lp26y3OWs3N
 pfjLdODncBaqVolP8WO0VG4Wrmb/JHd6O2gdLHp1vetTRY7AeFGKvF38poei4V/MiuGR
 6GcK1h0zg5ShmC66O55tW6NeMWwTMNUxOK4/1qCoHxEWa5IVON33VBf+rwIPSYt5qQPC
 aRMhvh+ZEm7aiSyWf9Wy+ib94hi3XWtB1qS4hb8S+AliKVXj67tRprrQ9CfAykm+Hxp6
 jzsA==
X-Gm-Message-State: AOAM531CmsNopCHorv3AJMfydek2oM/fpGQIdW960Jemhvre3Nn5qzPw
 Vh4Ccdx7hou6YPWmYsZX9ADAaIrlO7TEQ3FkVASXww==
X-Google-Smtp-Source: ABdhPJzGnYBAEoT3prm+Y0u4JSVtzYfJ0VbdQtAxCyIqHZjc5NRfKUDpEKlSZsSNOq5LC4k9JjLbETV32AWyIGASUMg=
X-Received: by 2002:a05:600c:4f46:: with SMTP id
 m6mr3796027wmq.133.1631203371021; 
 Thu, 09 Sep 2021 09:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-14-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-14-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Sep 2021 17:02:01 +0100
Message-ID: <CAFEAcA-=P+p7etUiLUzDxDzfe8N6TQyLC5=ExTSzgG4iOh0-dQ@mail.gmail.com>
Subject: Re: [RFC v3 13/32] rust: use vendored-sources
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Ian Jackson <iwj@xenproject.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Sept 2021 at 13:32, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Most likely, QEMU will want tighter control over the sources, rather
> than relying on crates.io downloading, use a git submodule with all the
> dependencies. However, cargo --offline was added in 1.36.
>
> "cargo vendor" helps gathering and updating the dependencies.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  configure                 | 8 ++++++++
>  meson.build               | 7 ++++++-
>  .cargo/config.toml.in     | 5 +++++
>  .cargo/meson.build        | 5 +++++
>  .gitmodules               | 4 ++++
>  rust/vendored             | 1 +
>  scripts/archive-source.sh | 2 +-
>  scripts/cargo_wrapper.py  | 1 +
>  8 files changed, 31 insertions(+), 2 deletions(-)
>  create mode 100644 .cargo/config.toml.in
>  create mode 100644 .cargo/meson.build
>  create mode 160000 rust/vendored

So, this is a lot of extra code in a submodule. Historically we've
found that submodules are a colossal pain, and so I think we should
think about whether we really want to have all our rust dependencies
in a submodule forever.

I am definitely only at the beginner stage with Rust, but I think
we should have a discussion about what the different alternative
options are here, and what we want to achieve, so that we know
why we're doing this and what we're gaining from the pain...

For instance, could we instead commit Cargo.lock in git and
use that to nail down specific versions of the dependencies ?

FWIW, the "why submodules" for the C dependencies we ship
like that is basically
 * C doesn't have a package manager, so if we need a dependency that
   distros don't ship then we need to wrap it up and provide it ourselves
 * where we ship binary blobs (guest BIOS etc) we want to also ship
   the source code for those blobs
I think for Rust dependencies those don't really apply.

Overall, I think that to the extent that we can look like a "normal"
user of Rust, that's a good plan. Distros may well want to be able
to do "build against our packaged rust stuff rather than downloading
from crates.io" but I imagine they have machinery for that already;
if we act like most other Rust programs we have better chances of
not breaking that machinery.

We do already effectively do "download code when QEMU is built" --
the makefile invokes scripts/git-submodule-update which pulls
down submodule code. (Thanks to Ian for pointing out this framing
of the question.)

(I'm not personally a fan of the "download everything from crates.io"
Rust ecosystem, but it is what it is, and wishing the Rust world
worked more like a trad Linux-distro-provides-all-your-dependencies
isn't, alas, going to make it so :-))

thanks
-- PMM

