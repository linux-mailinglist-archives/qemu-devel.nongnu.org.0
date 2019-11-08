Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4473F4501
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 11:52:24 +0100 (CET)
Received: from localhost ([::1]:52242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT1sN-0007Zj-Im
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 05:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54967)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iT1ra-00077j-SB
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 05:51:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iT1rZ-00056Q-Ed
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 05:51:34 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43210)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iT1rZ-00053z-8l
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 05:51:33 -0500
Received: by mail-oi1-x244.google.com with SMTP id l20so4832443oie.10
 for <qemu-devel@nongnu.org>; Fri, 08 Nov 2019 02:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pjuYfqw6SkaNQ/MxEZ4DRENNXcZa5hYLnenTBBdT3e4=;
 b=DdmCreCnq8FPcTL+TaedLtYp1ACBollYaLTDGC2IgXCBS/Azq2tOUrSTxVCFPhFge6
 x+wmWGdmye/xZeyx1Ig3F+t2SsFo3zZRk6z3IwYf/NOmksZ2a3D4eGgp3FVzK0XtMPtR
 Ix1rAdwDzO1S6T25K3jUAGjmQg4X3dfIZrAwDwScnJnA3m88zV9br0KQAsE5S52tQ2yQ
 1ge5KUuzEk9yqVTPLtqzZeAiPRZl3oMwtpPTGhNHTjmirig4sTdP4gpTTHMNaGQgBsca
 pfZuiyThIRJkAygBxC72MBcri2qpqRrardjQJm7lzbc8Zd6d58gLLz/GfwulA2o1dYrt
 IEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pjuYfqw6SkaNQ/MxEZ4DRENNXcZa5hYLnenTBBdT3e4=;
 b=Kq3vvTBC6gQ0Ki5nONmzguIj6Xd0nfgys+WAKa43tWC0MsGn0WKD6E7EibGxumlEki
 rV+jpgoe7Af9T6vu29YmY/bWPifY8cNg8kazYvuMajh4wNRAjQjWpWgatec//0mwmyDO
 xyvm0KMnDTuBCmYqO1bpNBIvdlGNqzHF8B/CRKKHbA7kWTphr84388U+2rUwCjP3GMnQ
 XQstKwD2GUsWthvR49c3E/eQTW8j+qhLaNDS1T17ob4RYn833K/SoT7AhP5ZGbogHl9R
 Ff/atH3CLAe/6mqGPyOQBekbsWW7Asvqe7gtb6g5yk8ylsljqH+TNzXveDrsFaOeHxw/
 +eSA==
X-Gm-Message-State: APjAAAUAiJuetdzFVpiC5nVOohiVAnv3dH80DV3nMWTR8e1xqAU5qeRi
 LrbRD6XOar/PXOZyDVxqcjBTv847tlMhsMrjI+kMWw==
X-Google-Smtp-Source: APXvYqwm8pQIfQxpelwXypBZCq7CydXT6ijoF+iTa2lKXLW/YFrjnytlgYaJPNnsc3juU4+lHS6HE0j3ccYO3YVOZwk=
X-Received: by 2002:a05:6808:7d1:: with SMTP id
 f17mr9173919oij.163.1573210291978; 
 Fri, 08 Nov 2019 02:51:31 -0800 (PST)
MIME-Version: 1.0
References: <20191108095942.401225-1-stefanha@redhat.com>
 <20191108095942.401225-3-stefanha@redhat.com>
In-Reply-To: <20191108095942.401225-3-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Nov 2019 10:51:20 +0000
Message-ID: <CAFEAcA8b_POWyCWERMaT2mKZxrYA+RDoaLCHtO=pS28f-SCZ3w@mail.gmail.com>
Subject: Re: [PATCH 2/3] docs: build a global index page
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Daniel Berrange <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Nov 2019 at 09:59, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Build docs/ in a single sphinx invocation instead of treating
> docs/{devel,interop,specs} separately.  This allows us to build a global
> index page that links to documentation across the different manuals.
>
> Some documentation is built outside of sphinx and is not formatted as
> reStructuredText.  Link directly to the .html files for the time being.
> If they are converted to .rst files in the future they can be included
> more elegantly.
>
> Sphinx wants to build all .rst files and complains if they are not
> listed in the table of contents.  We have not yet reviewed and
> categorized some of our .rst files.  Hide these files so they are always
> built (and syntax-checked from now on!) but not visible in the table of
> contents.

So the reason I went for the odd "run sphinx multiple times"
approach was because we don't want to ship 'devel' to users,
and as far as I could tell there was no way to have a
single-invocation build of the docs not include it in
eg the index/search (which would then be broken when
we don't install devel/ as part of 'make install').
Does this patchset result in a set of installed docs
that don't have dangling references ?

thanks
-- PMM

