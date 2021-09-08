Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688F5403DF6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 18:52:58 +0200 (CEST)
Received: from localhost ([::1]:43052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO0oi-0004XM-Vl
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 12:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iwj@xenproject.org>)
 id 1mO0mz-0003qE-91
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:51:09 -0400
Received: from mail.xenproject.org ([104.130.215.37]:37888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iwj@xenproject.org>)
 id 1mO0mx-0001fq-41
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
 :Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
 bh=p37dfBTAcVhiILFHJqKiJhySpuHQhXsAwEqNhniGVKc=; b=zT903LfnbZIogvNbqwZrKUgZEY
 z9tQ/5u2gTkElRzeOt7Ecvah0vCnax/gGmjUIu2v+idFbgi4iY0yYumtAVR51EakLMTjmwue6GOBD
 e4sXXKlc3u2gFbYNyZ/2DdugI5mdgUt+Y7omQxEiPfhrEd+7FkdkUxXb8nipxy5D5d8c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mO0mv-0001Ro-Iz
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 16:51:05 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mO0mv-0006cv-I1
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 16:51:05 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mO0mp-0003uK-9I; Wed, 08 Sep 2021 17:50:59 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24888.59891.24033.552735@mariner.uk.xensource.com>
Date: Wed, 8 Sep 2021 17:50:59 +0100
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [RFC v3 13/32] rust: use vendored-sources
In-Reply-To: <CAJ+F1CJFdrU38BwK=V-89fYYu3ySywREAF-WuBNJLftsMP52rg@mail.gmail.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-14-marcandre.lureau@redhat.com>
 <24888.55565.53378.616422@mariner.uk.xensource.com>
 <CAJ+F1CJR9hAd+2MJZ1X9s2vBW=fG++mgk75M+Ww166orq3KdNg@mail.gmail.com>
 <24888.58624.549030.64132@mariner.uk.xensource.com>
 <CAJ+F1CJFdrU38BwK=V-89fYYu3ySywREAF-WuBNJLftsMP52rg@mail.gmail.com>
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
> Yes, this is the shim to provide a C ABI QMP handler from Rust. This is where
> all the FFI<->Rust conversion takes place.
> 
> The "safe" code is qga/qmp/vcpus.rs. However, there is no
> documentation there, since it's not meant to be the public
> interface. It's documented with the QAPI schema.

Right, thanks.  That does look like a PoC of a Rust API.  I wanted the
rustdoc output because I find it provides a very uniform and readable
presentation even of an API with no doc comments.

I think maybe a thing I am missing is how you expect this to be used.
Which parts of the system are going to be in Rust.  etc.
And that would help explain what "public" means.

I think the answer is probably in this example:

https://patchew.org/QEMU/20210907121943.3498701-1-marcandre.lureau@redhat.com/20210907121943.3498701-30-marcandre.lureau@redhat.com/

but although my C and Rust are both fine, I don't understand qemu well
enough to make sense of it.

... wait, qga is "qemu guest agent" ?

I think I am sort of seeing this use case now.  But presuambly there
are other use cases for this QMP/QAPI type bridge stuff.

Sorry to be asking such stupid questions.

Thanks,
Ian.

