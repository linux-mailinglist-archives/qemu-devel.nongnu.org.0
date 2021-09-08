Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE31A403CB4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:42:26 +0200 (CEST)
Received: from localhost ([::1]:42940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNziT-0000pF-To
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iwj@xenproject.org>)
 id 1mNzfC-0003M3-DE
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:39:03 -0400
Received: from mail.xenproject.org ([104.130.215.37]:37586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iwj@xenproject.org>)
 id 1mNzf9-0006TI-Hr
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:39:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
 :Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
 bh=6w6SzIR0Xp/DTFEzDNehSxlyQh6iY9KNv2YQTIeVlik=; b=TY6EIW2Agvnoe4GUWo26QRw0Mf
 uIJfqZ8t3U+D27or9nXrhhAfkE/8nOIJ9+q5bDw3jz9KR48odNVFoinnQbOwaNvpr2YNJ5t3nqQzJ
 mrNmIz3C8BPRHA3WwmQYEsa+Szo+oB5lmkytQ8MzthxwoxAPHj+NoAPOyOB4kPZ+mknM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mNzf6-000816-Pf
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 15:38:56 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mNzf6-0007lr-OZ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 15:38:56 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mNzf3-0003gY-Au; Wed, 08 Sep 2021 16:38:53 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24888.55565.53378.616422@mariner.uk.xensource.com>
Date: Wed, 8 Sep 2021 16:38:53 +0100
To: marcandre.lureau@redhat.com
Subject: Re: [RFC v3 13/32] rust: use vendored-sources
In-Reply-To: <20210907121943.3498701-14-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-14-marcandre.lureau@redhat.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Received-SPF: pass client-ip=104.130.215.37; envelope-from=iwj@xenproject.org;
 helo=mail.xenproject.org
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.922,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes ("[RFC v3 13/32] rust: use vendored-sources"):
> Most likely, QEMU will want tighter control over the sources, rather
> than relying on crates.io downloading, use a git submodule with all the
> dependencies. However, cargo --offline was added in 1.36.

Hi.

pm215 pointed me at this, as I have some background in Rust.
I definitely approve of having Rust in Qemu.  I don't have an opinion
about whether the sources should be vendored this way.

But, I tried to build this, and

    error: failed to select a version for the requirement `cc = "=1.0.70"`
    candidate versions found which didn't match: 1.0.69
    location searched: directory source `/volatile/rustcargo/Rustup/Qemu/qemu.pwt/rust/vendored` (which is replacing registry `crates-io`)
    required by package `nix v0.20.1`
        ... which is depended on by `qga v0.1.0 (/volatile/rustcargo/Rustup/Qemu/qemu.pwt/qga)`
    perhaps a crate was updated and forgotten to be re-vendored?
    As a reminder, you're using offline mode (--offline) which can sometimes cause surprising resolution failures, if this error is too confusing you may wish to retry without the offline flag.

I think the most important part here is to get the general APIs,
presented to general Rust code in Qemu, right.  So I wanted to review
those via the output from rustdoc.

I tried commenting out the `replace-with` in .cargo/config.toml
but evidently the systme isn't intended to be used that way.

Ian.

