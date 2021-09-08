Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3299E403D26
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:58:48 +0200 (CEST)
Received: from localhost ([::1]:57082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzyI-0004AD-Se
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iwj@xenproject.org>)
 id 1mNzvZ-0001VS-7j
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:55:57 -0400
Received: from mail.xenproject.org ([104.130.215.37]:37736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iwj@xenproject.org>)
 id 1mNzvX-0003kz-KD
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:55:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
 :Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
 bh=rEJYC+ZO3casumA8S0DlwOmu8HpeYZkmD5G6m+EG9Bc=; b=ItVqk2WOHGUT84GdrDnMjpeUAa
 eRmevJhNC3eMUsPpJ8Lp7RO2/EZXNbK7So2mrIW6ySDA311Si12e10/i7h52LskleY+CZYkkMolqQ
 YqhaPe1BYLkKpczrmCcfN3ejhFO7KYXnrmAbzyzMBbrCpWYSAID2GGDbcOm2Sx9MKBf4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mNzvS-0008NN-81
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 15:55:50 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mNzvS-0000pO-79
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 15:55:50 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mNzvL-0003ju-VV; Wed, 08 Sep 2021 16:55:44 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-ID: <24888.56575.675507.669862@mariner.uk.xensource.com>
Date: Wed, 8 Sep 2021 16:55:43 +0100
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [RFC v3 13/32] rust: use vendored-sources
In-Reply-To: <CAJ+F1CJF-0j0+kP=_Zwox9LsspFN+6kUG54uhdKx9KaHLx=H9A@mail.gmail.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-14-marcandre.lureau@redhat.com>
 <24888.55565.53378.616422@mariner.uk.xensource.com>
 <CAJ+F1CJF-0j0+kP=_Zwox9LsspFN+6kUG54uhdKx9KaHLx=H9A@mail.gmail.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-André Lureau writes ("Re: [RFC v3 13/32] rust: use vendored-sources"):
> Hmm, I do "cargo vendor --versioned-dirs ../rust/vendored" to vendor crates.
> 
> It seems cc was updated, and I didn't update the submodule accordingly. For
> reference, this is the dependency tree that WFM:

git submodules are just awful IMO.

> $ cargo tree -p qga                            
> qga v0.1.0 (/home/elmarco/src/qemu/qga)
> ├── common v0.1.0 (/home/elmarco/src/qemu/rust/common)
> │   ├── libc v0.2.101
> │   └── nix v0.20.1
> │       ├── bitflags v1.2.1
> │       ├── cfg-if v1.0.0
> │       ├── libc v0.2.101
> │       └── memoffset v0.6.4
> │           [build-dependencies]
> │           └── autocfg v1.0.1
> ├── hostname v0.3.1
> │   ├── libc v0.2.101
> │   └── match_cfg v0.1.0
> └── nix v0.20.1 (*)

With the .config/cargo.toml "replace-with" commented out, I see this:

rustcargo@zealot:~/Rustup/Qemu/qemu.pwt/build$ cargo tree -p qga
qga v0.1.0 (/volatile/rustcargo/Rustup/Qemu/qemu.pwt/qga)
├── common v0.1.0 (/volatile/rustcargo/Rustup/Qemu/qemu.pwt/rust/common)
│   ├── libc v0.2.101
│   └── nix v0.20.1
│       ├── bitflags v1.2.1
│       ├── cfg-if v1.0.0
│       ├── libc v0.2.101
│       └── memoffset v0.6.4
│           [build-dependencies]
│           └── autocfg v1.0.1
├── hostname v0.3.1
│   ├── libc v0.2.101
│   └── match_cfg v0.1.0
└── nix v0.20.1 (*)
rustcargo@zealot:~/Rustup/Qemu/qemu.pwt/build$ 

Which is the same as yours.  Although "cargo build" doesn't work
build, guessed from the messagese that perhaps this was the automatic
codegen hadn't run.  I'm now trying "make" and and it seems to be
running.

With the "replace-with" uncommented, cargo tree bombs out.  I'm afraid
I haven't used cargo vendor so I'm not sure if I am going in the right
direction with this workaround.  Hopefully it will finish the build.

Would it be possible to have a configure option to use unvendored
upstream Rust libraries from crates.io ?

Ian.

