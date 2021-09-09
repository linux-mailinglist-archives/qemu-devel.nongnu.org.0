Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7586B405BBC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 19:05:43 +0200 (CEST)
Received: from localhost ([::1]:59366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mONUc-0004lk-5X
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 13:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iwj@xenproject.org>)
 id 1mONRg-00042F-4o
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 13:02:40 -0400
Received: from mail.xenproject.org ([104.130.215.37]:42326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iwj@xenproject.org>)
 id 1mONRe-000533-6L
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 13:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
 :Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
 bh=W+eL+NjEJ/HA6q2sb1NNE1A3+f7cB91NgzelvR9305A=; b=U3B44G+nDi42iOKO5PAfU2x6GK
 yAtJr+bHPR4DupBmqu3dFRM0ntuIN1WQHWeM3Cb3ke6LzNo901RrSRvHiq1YzDUPvtPsdITQTiPn1
 dSo9V0qWvNidg12WrU/pL1ZinyY12rMoSTYvajq3IS1vX6n09hMxjSHMKM+8rqSHDqyo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mONRb-0002f4-Or
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 17:02:35 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mONRb-00070S-Nk
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 17:02:35 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mONRV-0006y3-8t; Thu, 09 Sep 2021 18:02:29 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24890.15908.689806.862379@mariner.uk.xensource.com>
Date: Thu, 9 Sep 2021 18:02:28 +0100
To: Daniel P. =?iso-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Subject: Re: [RFC v3 13/32] rust: use vendored-sources
In-Reply-To: <YTo7C9h6DxZDYdL9@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-14-marcandre.lureau@redhat.com>
 <CAFEAcA-=P+p7etUiLUzDxDzfe8N6TQyLC5=ExTSzgG4iOh0-dQ@mail.gmail.com>
 <YTo7C9h6DxZDYdL9@redhat.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Received-SPF: pass client-ip=104.130.215.37; envelope-from=iwj@xenproject.org;
 helo=mail.xenproject.org
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.975,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrangé writes ("Re: [RFC v3 13/32] rust: use vendored-sources"):
> Yes, distros do have machinery for this, although it is often
> hard to fit in with it when you have a mixed language project.
> Their machinery typically assumes pure single language project,
> so would work nicer if any QEMU rust pieces were separately
> released from the rest of QEMU. Obviously this is easier said
> than done since QEMU tends towards a monolothic repo approach
> historically.

Right.

However, for a project that has Rust dependencies, the distros will
(or will soon need) machinery to divert the
langage-specific-package-manager downloads to their own repo.  For
example, the Debian Rust team provide a .cargo/config.toml to replace
crates.io with the local Debian Rust packages, which the Debian
package management system has provided via the (translated)
build-dependencies.

Debian certainly wouldn't want to use any vendored crates bundled with
Qemu.  Indeed Debian people hate vendoring more than they hate
language specific package managers.  At least with the LSPM you can
usually nobble it in one place - ie many of the problems can be solved
automatically.  Vendoring typically involves playing whack-a-mole with
compatibility problems, actually-modified versions, etc. - much human
work (and quite annoying work too!)  (Of course this is less of an
issue if you don't actually modify the vendored code, but anyone who
knows Rust and sees a vendored Rust crate will think it's been
modified.)

> > (I'm not personally a fan of the "download everything from crates.io"
> > Rust ecosystem, but it is what it is, and wishing the Rust world
> > worked more like a trad Linux-distro-provides-all-your-dependencies
> > isn't, alas, going to make it so :-))
> 
> Yes, I'm inclined to agree here. For better or worse the battle is
> over and "download everything from <repo> on the fly" is the accepted
> approach for pretty much all modern languages. The language specific
> repo essentially is the OS distro from their POV.

To be honest, I am of the same mind as you about cargo and crates.io
(and things like it) But I think the ship has sailed.

At least, committing the Cargo.lock file will ensure that the same
versions of the dependencies are used - at least by people who don't
know anything much about Rust.

Marc-André Lureau writes ("Re: [RFC v3 13/32] rust: use vendored-sources"):
> A nice alternative to vendoring that could work well for QEMU is to
> mirror the Rust crate we use, so we have similar control and
> guarantee over them as submodules, and use `[patch.crates-io]` to
> point at qemu-project locations.

This is a very reasonable suggestion.  In my experience crates.io is
very reliable - but (as a test system onwer myself) I know how much
you want to reduce the number of different sites whose upness your CI
depends on, no matter how good their communities think they are :-).

I think there should be a documented config option to disable this.
People who know enough Rust to run `cargo update` etc. will need it,
and having them hand-hack the config files is not really desirable.

Ian.

