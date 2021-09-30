Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130A741D7CF
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 12:33:49 +0200 (CEST)
Received: from localhost ([::1]:34708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVtNr-0003Z6-QY
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 06:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVtLS-00022v-7N
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 06:31:20 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVtLQ-0006Os-7f
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 06:31:17 -0400
Received: by mail-wm1-x329.google.com with SMTP id j27so4271419wms.0
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 03:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QBo+IZsXSRhiwjMOOzA7qQ+0eOyjjqbUWhkH7BfEobs=;
 b=NwitT34Hu6MPODXbMwbPK1fmeICO0NibLWkOT8Ny5En2lFsDCTJhxAEKWCb8Z2DlkB
 fViKCC++B4t14osZCddoRyPaxklZRy1vCjKSDn+FNN1NrmeLEqFt8rQyNRE2cC3RxaIm
 OZQQxfen9JZJtXH3OWtY+h+74gryAGUEaUPoSW/7cIsceae/lLOL6BpsS3uPbxDfidoa
 GyCJ7G47MHYrGuBd5NxqEPwCi7i7a/gsTyoHV7eiwNvcda8hqZvo4L9ftfk3J2WuQmc5
 0qNw1zGCRpU6hV+6wdmLYuCfcmtYPWOuiJabuW2xo4Gq3Y5b1PknSYT9VxQ0rz8RFMkz
 oxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QBo+IZsXSRhiwjMOOzA7qQ+0eOyjjqbUWhkH7BfEobs=;
 b=xmWJqecwWPEnxdnBxwOcnKgSqOADfs3JEWPZwuLl18H+CcSVjwLLe/Tx/CW2+Y10rl
 vbAkZOyndOM95B9XKbIhPsvgRXwycvoQjzF4zLpKeo+//kv/mxtflJS/CkLjZa7R3mxP
 jEXrmObL3cpAIBFNg20xlSlyPLr5ZTWj9ugBCZTNSEjDBgbdep+DmC0m2ebESF+wyKw7
 U+fGnhLjpYQvwhGk/Ket9DR11K/T4RrXKKThEZHpF36BKvAeZLh70Set6xPTOEDQ5bpg
 QoUsnezg3mfOxIkvd5XB0pGx1W6pNcj4Nx0oiPkluZSQj2o6293uMYk/0pqDOdN/+SXS
 +4jA==
X-Gm-Message-State: AOAM530R3Nx0Wudy1HMEqlEx4GbGeCpKDRFjzycWGIrc52Z2zEk61Azm
 od+0ZSKVWiY4wNOYnDFjgNGedahfzLiul5JRaNZbrA==
X-Google-Smtp-Source: ABdhPJwK8MbRzUjpjQQtG2bC/oQXpv+1wlgE7AuqcuD0jIrpYskErTCGvzLWUw9ps5hjobTPhZrgtWoyrHWom0dp8Ok=
X-Received: by 2002:a1c:e906:: with SMTP id q6mr15710088wmc.126.1632997873945; 
 Thu, 30 Sep 2021 03:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <YVUaDrf5BXPkZu5r@yekko>
In-Reply-To: <YVUaDrf5BXPkZu5r@yekko>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Sep 2021 11:30:20 +0100
Message-ID: <CAFEAcA_ibRiKmXvo3CDOvLundowVWr3uPKWbkegh95U+d-zfMQ@mail.gmail.com>
Subject: Re: Rust in Qemu BoF followup 2: Rust toolchain availability
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Ed Maste <emaste@freebsd.org>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Brad <brad@comstyle.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 Sept 2021 at 03:21, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> Hi again all,
>
> I've now done.. or at least started... the second part of my followup
> from the KVM Forum BoF on Rust in Qemu.
>
> I've extended the page at https://wiki.qemu.org/RustInQemu with
> information on Rust toolchain availability.  However, I found I had a
> lot more open questions on this one, so there are quite a lot of gaps.

Thanks for doing this work.

I note that we have a new host architecture loongarch64 currently
circling to land. It looks like this is in the "Rust does not have
support for this target" category at the moment.

> In particular:
>  * I haven't so far figured out how to definitively check package
>    information for RHEL & SLES (they're not covered by repology, and
>    RHEL module structure confuses me, even as a RedHatter)
>  * I'm not at all sure what criteria to use to consider something as
>    having "good enough" rustup support, so that information is all
>    blank so far

I guess the answer here is probably "if it has at least the
glibc and kernel minimum versions that are documented as
required for the target-triple in the lists at
https://doc.rust-lang.org/rustc/platform-support.html then
that's 'good enough'".

>  * I've taken a bit of a stab in the dark about what Rust version is
>    recent enough for our purposes (1.31.0).  I strongly suspect we're
>    going to want to move that to something more recent, but I don't
>    know what, which will mean revising a bunch of stuff

Hmm. The more we feel we need features that are from a new
version of Rust the more nervous I get about whether this is
really something we want to jump to just yet. 1.31 is less than
3 years old, which is pretty recent in the context of QEMU's
own distro support policy.

>  * I'm not really convinced that the way I've formatted it is
>     particularly good, but I haven't though of a better alternative.

I guess we might also care about the CPU architecture per distro,
in that even if old version X of the distro supports architecture Y
and rust today supports architecture Y, that doesn't mean that
distro version X's shipped rust supported architecture Y.
But we can probably reasonably say "use rustup" if there are
corner cases like that.

-- PMM

