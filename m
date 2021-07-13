Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50DB3C71EA
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:14:57 +0200 (CEST)
Received: from localhost ([::1]:51454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JBY-00005c-Nu
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3IjS-0007DH-33
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:45:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3IjP-0008Ko-6U
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626183945;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YnV+Hbhrw4m6KgQXdvz894PktFZ9K+bYciLIGLCyl+A=;
 b=Ph1wvsQS0ci1OcWHDJ4LJ5Metba28TVL2oRHmPEYKjpnmDm0IfmC4cXW0/LETi6sfokq4B
 I+IvqTmSvnHwU5CgSGGJ2/42/M187Rz4+A/4aDyfWUvNYE8Q3mQi74fVrkfIsDa+mKasNL
 l3E1Wo3TfX+eKWuFqH0tYq1TvlCoZA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-jiBJ1sSUOPuquC_fAM5irg-1; Tue, 13 Jul 2021 09:45:40 -0400
X-MC-Unique: jiBJ1sSUOPuquC_fAM5irg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C20D780430C;
 Tue, 13 Jul 2021 13:45:34 +0000 (UTC)
Received: from redhat.com (ovpn-113-1.ams2.redhat.com [10.36.113.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97D926090F;
 Tue, 13 Jul 2021 13:45:31 +0000 (UTC)
Date: Tue, 13 Jul 2021 14:45:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/22] Crypto and more patches
Message-ID: <YO2Y+IUJ0aGHbgDC@redhat.com>
References: <20210712130223.1825930-1-berrange@redhat.com>
 <CAFEAcA8_CaW5aPGt+PD6j5OfY7f=VztL6utk++Wg=OYcoawUqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8_CaW5aPGt+PD6j5OfY7f=VztL6utk++Wg=OYcoawUqg@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Otubo <otubo@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 13, 2021 at 10:25:44AM +0100, Peter Maydell wrote:
> On Mon, 12 Jul 2021 at 14:23, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > The following changes since commit bd38ae26cea0d1d6a97f930248df149204c210a2:
> >
> >   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210710' into staging (2021-07-12 11:02:39 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/berrange/qemu tags/crypto-and-more-pull-request
> >
> > for you to fetch changes up to 1fc9958410c8683950ea22084b133a755561398b:
> >
> >   tests/migration: fix unix socket migration (2021-07-12 14:00:20 +0100)
> >
> > ----------------------------------------------------------------
> > Merge crypto updates and misc fixes
> >
> >  * Introduce a GNUTLS backend for crypto algorithms
> >  * Change crypto library preference gnutls > gcrypt > nettle > built-in
> >  * Remove built-in DES impl
> >  * Remove XTS mode from built-in AES impl
> >  * Fix seccomp rules to allow resource info getters
> >  * Fix migration performance test
> >  * Use GDateTime in io/ and net/rocker/ code
> >
> > ----------------------------------------------------------------
> 
> Hi; this failed 'make check' on ppc64be:

> The failure is reproducible. Here's a backtrace from a debug
> build:
> 
> test-crypto-cipher: cbc.c:53: nettle_cbc_encrypt: Assertion `!(length
> % block_size)' failed.
> 
> Thread 1 "test-crypto-cip" received signal SIGABRT, Aborted.
> 0x00007ffff77b8460 in __libc_signal_restore_set (set=0x7fffffffe468)
> at ../sysdeps/unix/sysv/linux/internal-signals.h:86
> 86      ../sysdeps/unix/sysv/linux/internal-signals.h: No such file or
> directory.
> (gdb) bt
> #0  0x00007ffff77b8460 in __libc_signal_restore_set
> (set=0x7fffffffe468) at
> ../sysdeps/unix/sysv/linux/internal-signals.h:86
> #1  __GI_raise (sig=<optimized out>) at ../sysdeps/unix/sysv/linux/raise.c:48
> #2  0x00007ffff779bd40 in __GI_abort () at abort.c:79
> #3  0x00007ffff77ae490 in __assert_fail_base (fmt=<optimized out>,
>     assertion=assertion@entry=0x7ffff72b6f38 "!(length % block_size)",
> file=file@entry=0x7ffff72b6f30 "cbc.c", line=line@entry=53,
>     function=function@entry=0x7ffff72b6f50 "nettle_cbc_encrypt") at assert.c:92
> #4  0x00007ffff77ae528 in __GI___assert_fail (assertion=0x7ffff72b6f38
> "!(length % block_size)", file=0x7ffff72b6f30 "cbc.c",
>     line=<optimized out>, function=0x7ffff72b6f50
> "nettle_cbc_encrypt") at assert.c:101
> #5  0x00007ffff728c154 in nettle_cbc_encrypt () from
> /usr/lib/powerpc64-linux-gnu/libnettle.so.8
> #6  0x00007ffff7e6b894 in ?? () from
> /usr/lib/powerpc64-linux-gnu/libgnutls.so.30
> #7  0x00007ffff7e6c72c in ?? () from
> /usr/lib/powerpc64-linux-gnu/libgnutls.so.30
> #8  0x00007ffff7d6d794 in gnutls_cipher_encrypt2 () from
> /usr/lib/powerpc64-linux-gnu/libgnutls.so.30
> #9  0x000000010003c330 in qcrypto_gnutls_cipher_encrypt
> (cipher=0x10016e550, in=0x7fffffffeca8, out=0x7fffffffecc8, len=32,
>     errp=0x100122b48 <error_abort>) at ../../crypto/cipher-gnutls.c.inc:103
> #10 0x000000010003cef0 in qcrypto_cipher_encrypt (cipher=0x10016e550,
> in=0x7fffffffeca8, out=0x7fffffffecc8, len=32,
>     errp=0x100122b48 <error_abort>) at ../../crypto/cipher.c:177
> #11 0x000000010002e75c in test_cipher_null_iv () at
> ../../tests/unit/test-crypto-cipher.c:749
> #12 0x00007ffff7bbed38 in ?? () from
> /usr/lib/powerpc64-linux-gnu/libglib-2.0.so.0
> #13 0x00007ffff7bbeabc in ?? () from
> /usr/lib/powerpc64-linux-gnu/libglib-2.0.so.0
> #14 0x00007ffff7bbeabc in ?? () from
> /usr/lib/powerpc64-linux-gnu/libglib-2.0.so.0
> #15 0x00007ffff7bbf364 in g_test_run_suite () from
> /usr/lib/powerpc64-linux-gnu/libglib-2.0.so.0
> #16 0x00007ffff7bbf3bc in g_test_run () from
> /usr/lib/powerpc64-linux-gnu/libglib-2.0.so.0
> #17 0x000000010002eb78 in main (argc=1, argv=0x7ffffffff8e8) at
> ../../tests/unit/test-crypto-cipher.c:821
> 
> In frame 9 len is 32 and ctx_>blocksize is 16, so ¯\_(ツ)_/¯

The len in frame 9 is the plain text len, but I think the assert is
complaining about the initialization vector len, which is likely
zero here. I think I know what to fix, but I'm surprised this would
be architecture specific though.

Can you confirm what version of gnutls and nettle you have installed
and what distro this is


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


