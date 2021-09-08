Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA83F403D9A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 18:32:17 +0200 (CEST)
Received: from localhost ([::1]:46882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO0Uj-0004TS-34
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 12:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iwj@xenproject.org>)
 id 1mO0SZ-0002ly-1k
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:30:03 -0400
Received: from mail.xenproject.org ([104.130.215.37]:37838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iwj@xenproject.org>)
 id 1mO0SX-00032s-Fb
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:30:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
 :Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
 bh=bnpoLkGDTS/FhsvBrMGrc1lyeHCNkVujdWK5JW7Znxo=; b=yzMtt6eSpEKyz7Jx4Xsm8FiI+U
 fphfDz/SlpKXbWNeobJcq+KjzXg2pAPH5TzwPVjsK81rnStY4wdJjmYEFy8pqSWhMSMAQ2L9mjUYT
 nFxm4s8bZV/R++ib8X86LLX77f4RiprnbJCifQWu6WXDepcm5IrVrB7owXTHdREKbIL4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mO0SV-000146-6V
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 16:29:59 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mO0SV-0003fq-5Y
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 16:29:59 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mO0SO-0003qY-QQ; Wed, 08 Sep 2021 17:29:52 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24888.58624.549030.64132@mariner.uk.xensource.com>
Date: Wed, 8 Sep 2021 17:29:52 +0100
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [RFC v3 13/32] rust: use vendored-sources
In-Reply-To: <CAJ+F1CJR9hAd+2MJZ1X9s2vBW=fG++mgk75M+Ww166orq3KdNg@mail.gmail.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-14-marcandre.lureau@redhat.com>
 <24888.55565.53378.616422@mariner.uk.xensource.com>
 <CAJ+F1CJR9hAd+2MJZ1X9s2vBW=fG++mgk75M+Ww166orq3KdNg@mail.gmail.com>
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
> You can start by reading `cargo doc -p common --open`. The generated
> code needs some environment variables set, so `cargo doc -p qga`
> will fail unless you set the environment variable
> 
> MESON_BUILD_ROOT=`pwd` cargo doc -p qga --open --document-private-items

Thanks.  I did this (and your rune from bofere) and I have the docs
open.

I wasn't quite sure where to start.  I didn't see where the
entrypoints were.  I did find

 .../target/doc/qga/qmp/fn.qmp_guest_set_vcpus.html

which err, doesn't look like the kind of safe api I was hoping to
find.

Ian.

