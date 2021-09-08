Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43648403D8E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 18:24:18 +0200 (CEST)
Received: from localhost ([::1]:33022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO0Mz-0003Qp-Bp
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 12:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iwj@xenproject.org>)
 id 1mO0Lv-00024v-Q6
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:23:11 -0400
Received: from mail.xenproject.org ([104.130.215.37]:37820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iwj@xenproject.org>)
 id 1mO0Lt-0006KZ-Jq
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:23:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
 :Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
 bh=npaXkN8vLUv13AYkRZnYxK3QKG5OF3h6pafZR41hQno=; b=z/pbJPjwp0Wv5aTPHf82dYItBa
 +1EP5VwpDiGMLkNceHkQ1A4uf9o1kcJF10K1L4Ywr+WtDuZdHAteg03whuq5rICtYzIxg9fcWw5Z8
 xXLUOEXGY/8V6o9yNl/QfiIUN709nHK+86FTB8CYMrs/ubTXxuNOLO9XaoyiODqpGfnY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mO0Lr-0000xq-PT
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 16:23:07 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mO0Lr-0003FV-OX
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 16:23:07 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mO0Lj-0003oJ-W9; Wed, 08 Sep 2021 17:23:00 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24888.58211.755481.699508@mariner.uk.xensource.com>
Date: Wed, 8 Sep 2021 17:22:59 +0100
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [RFC v3 13/32] rust: use vendored-sources
In-Reply-To: <CAJ+F1CJ4bhzXd0ASrtcGzn63i04HMWHDbgoAoWqizKnhRqiWjw@mail.gmail.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-14-marcandre.lureau@redhat.com>
 <24888.55565.53378.616422@mariner.uk.xensource.com>
 <CAJ+F1CJF-0j0+kP=_Zwox9LsspFN+6kUG54uhdKx9KaHLx=H9A@mail.gmail.com>
 <24888.56575.675507.669862@mariner.uk.xensource.com>
 <CAJ+F1CJ4bhzXd0ASrtcGzn63i04HMWHDbgoAoWqizKnhRqiWjw@mail.gmail.com>
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Ian Jackson <iwj@xenproject.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-André Lureau writes ("Re: [RFC v3 13/32] rust: use vendored-sources"):
> On Wed, Sep 8, 2021 at 7:55 PM Ian Jackson <iwj@xenproject.org> wrote:
>  >   git submodules are just awful IMO.
> 
> Yes, but it's often (always?) the user fault.

I must disagree in the strongest possible terms.  I don't think I can
express my feelings on this in a way that would be appropriate in this
context.

Anyway...

My trickery as described above (run configure, edit the "replace-with"
out of .cargo/config.toml, run make) did produce a build.

But to review the internal API I want the rustdoc output.

How can I run rustdoc in a way that will work ?  I tried "cargo doc"
and it complained about a lack of "MESON_BUILD_ROOT".  I guessed and
ran
  MESON_BUILD_ROOT=$PWD cargo doc
which seemed to produce some output and complete but I can't find the
results anywhere.

Can you please give me the set of runes to type view the rustdoc-built
API documentation for the qemu-internal Rust APIs ?

Thanks,
Ian.

