Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0122911E4
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Aug 2019 18:15:21 +0200 (CEST)
Received: from localhost ([::1]:37256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hz1MO-0002re-7E
	for lists+qemu-devel@lfdr.de; Sat, 17 Aug 2019 12:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36619)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1hz1LQ-0002QM-5J
 for qemu-devel@nongnu.org; Sat, 17 Aug 2019 12:14:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1hz1LO-0000od-Kz
 for qemu-devel@nongnu.org; Sat, 17 Aug 2019 12:14:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41220)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1hz1LO-0000mc-DY; Sat, 17 Aug 2019 12:14:18 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9FB07308429D;
 Sat, 17 Aug 2019 16:14:16 +0000 (UTC)
Received: from [10.36.116.55] (ovpn-116-55.ams2.redhat.com [10.36.116.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 431147EBA4;
 Sat, 17 Aug 2019 16:14:15 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <8fb538f3-dfdd-b427-727a-2e7c2120da09@gmail.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <20e800e8-846b-a9c3-f840-826238b0818f@redhat.com>
Date: Sat, 17 Aug 2019 18:14:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8fb538f3-dfdd-b427-727a-2e7c2120da09@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Sat, 17 Aug 2019 16:14:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [qemu-s390x] linux-user: s390x issue on Fedora 30
 (dynamic library loader?)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.08.19 17:59, David Hildenbrand wrote:
> Hi everybody,
> 
> I was just trying to run qemu-s390x (linux-user) with a very simple
> binary (gzip + lib/ld64.so.1, compiled under Fedora 27). This used to
> work just fine a while ago (especially when I was working on vector
> instructions using QEMU v3.1). However, now I can't get past a SEGFAULT
> in the dynamic library loader (I assume it is trying to locate glibc). I
> tried a couple of other binaries that definitely used to work (from
> Fedora 30).
> 
> I checked QEMU v4.1, v4.0 and v3.1. All are broken for me. Which is
> weird - because it used to work :/
> 
> I remember that I was running Fedora 29 the last time I had it running,
> so my gut feeling is that this is related to some other system library
> (but which?). I am running on an up-to-date Fedora 30 x86-64 now.
> 
> Any ideas? Has this been reported already? (not sure if this is a Fedora
> 30 issue)
> 
> LANG=C ~/git/qemu/s390x-linux-user/qemu-s390x -d in_asm -L . gzip --help
> 
> ----------------
> IN: _dl_load_cache_lookup
> 0x00000040008854c2:  larl       %r1,0x4000895030
> 0x00000040008854c8:  lg %r8,264(%r11)
> 0x00000040008854ce:  mvghi      0(%r1),-1
> 0x00000040008854d4:  la %r3,0(%r3,%r8)
> 0x00000040008854d8:  l  %r7,12(%r8)
> 0x00000040008854dc:  llgfr      %r2,%r7
> 0x00000040008854e0:  sllg       %r1,%r2,1
> 0x00000040008854e6:  agr        %r1,%r2
> 0x00000040008854ea:  sllg       %r1,%r1,2
> 0x00000040008854f0:  la %r6,16(%r1,%r8)
> 0x00000040008854f4:  sgr        %r3,%r6
> 0x00000040008854f8:  stg        %r3,256(%r11)
> 0x00000040008854fe:  ahi        %r7,-1
> 0x0000004000885502:  jl 0x40008850f0
> 
> ----------------
> IN: _dl_load_cache_lookup
> 0x0000004000885506:  srak       %r10,%r7,1
> 0x000000400088550c:  lgfr       %r2,%r10
> 0x0000004000885510:  sllg       %r1,%r2,1
> 0x0000004000885516:  agr        %r1,%r2
> 0x000000400088551a:  sllg       %r1,%r1,2
> 0x0000004000885520:  l  %r1,20(%r1,%r8)
> 0x0000004000885524:  clrjhe     %r1,%r3,0x40008850f0
> 
> Segmentation fault (Speicherabzug geschrieben)
> 
> 
> Core was generated by
> `/home/dhildenb/git/qemu/s390x-linux-user/qemu-s390x -d in_asm -L . gzip
> --help'.
> Program terminated with signal SIGSEGV, Segmentation fault.
> #0  0x00007fdc5d7c3232 in sigsuspend () from /lib64/libc.so.6
> [Current thread is 1 (Thread 0x7fdc5d7127c0 (LWP 31072))]
> Missing separate debuginfos, use: dnf debuginfo-install
> glib2-2.60.6-1.fc30.x86_64 glibc-2.29-15.fc30.x86_64
> libgcc-9.1.1-1.fc30.x86_64 libstdc++-9.1.1-1.fc30.x86_64
> pcre-8.43-2.fc30.x86_64 zlib-1.2.11-16.fc30.x86_64
> (gdb) bt
> #0  0x00007fdc5d7c3232 in sigsuspend () from /lib64/libc.so.6
> #1  0x000055f826135a9c in dump_core_and_abort
> (target_sig=target_sig@entry=11)
>     at /home/dhildenb/git/qemu/linux-user/signal.c:613
> #2  0x000055f826135e37 in handle_pending_signal
> (cpu_env=cpu_env@entry=0x55f8292cec48, sig=sig@entry=11,
>     k=k@entry=0x55f8292d7df0) at
> /home/dhildenb/git/qemu/linux-user/signal.c:877
> #3  0x000055f826136edd in process_pending_signals
> (cpu_env=cpu_env@entry=0x55f8292cec48)
>     at /home/dhildenb/git/qemu/linux-user/signal.c:953
> #4  0x000055f82613a13a in cpu_loop (env=0x55f8292cec48) at
> /home/dhildenb/git/qemu/linux-user/s390x/cpu_loop.c:150
> #5  0x000055f8260ce2ba in main (argc=<optimized out>,
> argv=0x7fff587a69d8, envp=<optimized out>)
>     at /home/dhildenb/git/qemu/linux-user/main.c:819
> 
> Thanks!
> 

CCing QEMU-devel + use my proper dev mail address (I need more coffee :))

-- 

Thanks,

David / dhildenb

