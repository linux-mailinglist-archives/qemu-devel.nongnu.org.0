Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA5F122532
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 08:11:58 +0100 (CET)
Received: from localhost ([::1]:37076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih71R-0006xx-6C
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 02:11:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59909)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <emacsray@gmail.com>) id 1ih70d-0006XK-JI
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 02:11:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <emacsray@gmail.com>) id 1ih70c-0008Fm-2K
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 02:11:07 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41316)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <emacsray@gmail.com>) id 1ih70b-0008Ex-SP
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 02:11:06 -0500
Received: by mail-pf1-f193.google.com with SMTP id w62so27905pfw.8
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 23:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ddWHYPJB10Bw6IdstRP8DK21hSg6Maleq/jUgFOYr28=;
 b=oHTqrAmCzRwk9SRwq/8i6zoaXvKyKowbqNUqjFHi2vHijZLfpqT4WQbMiraejcCdKj
 iumDX2oo42sd1IiFPI3Iu71npTobgvq6tKj4KkKbyzZwPiqHAEyC1YJcL4I8MxVhY+34
 qbK2UGbRbedgIknmCpWY3AGO95VbVC6S4yOvEtmYqXltVd7FMcmvCNbGa6g4EVtVR88i
 WG2KoxI9vp7N0h9jJmEfnLWidc5EP2peyoC1z8Sd6ZB5hqjl+ntGEXMVQ3sitPipSRRK
 /0TlBwAiCO0au4klRJ5Ca6MQrkcmfN6RTpT/X74+3xzUCLZGHlmO4QXQ+mV/xV7ZjF5K
 a4ug==
X-Gm-Message-State: APjAAAXSt0enOdBk5RUPlmU6bMxHRHSBR1/HfA8Chp9w/2eLWcAt7NJJ
 UZ5HmgAhstV5loquwojIKBY=
X-Google-Smtp-Source: APXvYqwRDIT+NTtb9AfybNcUoNL40F4fbcpV2jtxdacTPqND4pTYRSOGdwmBc2zRb/gSNIgIl+Mtzg==
X-Received: by 2002:a63:5219:: with SMTP id g25mr22984638pgb.321.1576566664712; 
 Mon, 16 Dec 2019 23:11:04 -0800 (PST)
Received: from localhost (c-71-204-169-238.hsd1.ca.comcast.net.
 [71.204.169.238])
 by smtp.gmail.com with ESMTPSA id e25sm24205696pge.64.2019.12.16.23.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 23:11:03 -0800 (PST)
Date: Mon, 16 Dec 2019 23:11:02 -0800
From: Fangrui Song <i@maskray.me>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] configure: Use lld --image-base for --disable-pie user
 mode binaries
Message-ID: <20191217071102.vlhy4hnr3yqfe3ma@gmail.com>
References: <20191116052815.nop3xkmd4umqsdsb@google.com>
 <20191120210200.hvwlfuzo2vy5d5n4@gmail.com>
 <20191127183631.n3kfz7k5szri27b3@gmail.com>
 <e5bf2584-bae2-8dda-a2b2-8930ee17ea86@linaro.org>
 <20191202040103.p5ywvxixglmt6oqx@google.com>
 <20191210071030.c5igsbxf3v7pzrwn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191210071030.c5igsbxf3v7pzrwn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.193
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2019-12-09, Fangrui Song wrote:
>On 2019-12-01, Fangrui Song wrote:
>>
>>Thanks for reviewing this patch!
>>
>>On 2019-12-01, Richard Henderson wrote:
>>>On 11/27/19 6:36 PM, Fangrui Song wrote:
>>>>On 2019-11-20, Fangrui Song wrote:
>>>>>On 2019-11-15, Fangrui Song wrote:
>>>>>>For lld, --image-base is the preferred way to set the base address.
>>>>>>lld does not actually implement -Ttext-segment, but treats it as an alias for
>>>>>>-Ttext. -Ttext-segment=0x60000000 combined with --no-rosegment can
>>>>>>create a 1.6GB executable.
>>>>>>
>>>>>>Fix the problem by using --image-base for lld. GNU ld and gold will
>>>>>>still get -Ttext-segment. Also delete the ld --verbose fallback introduced
>>>>>>in 2013, which is no longer relevant or correct (the default linker
>>>>>>script has changed).
>>>>>>
>>>>>>Signed-off-by: Fangrui Song <i@maskray.me>
>>>>>>---
>>>>>>configure | 33 ++++++++++++---------------------
>>>>>>1 file changed, 12 insertions(+), 21 deletions(-)
>>>>>>
>>>>>>diff --git a/configure b/configure
>>>>>>index 6099be1d84..2d45af0d09 100755
>>>>>>--- a/configure
>>>>>>+++ b/configure
>>>>>>@@ -6336,43 +6336,34 @@ fi
>>>>>>
>>>>>># Probe for the need for relocating the user-only binary.
>>>>>>if ( [ "$linux_user" = yes ] || [ "$bsd_user" = yes ] ) && [ "$pie" = no ];
>>>>>>then
>>>>>>-� textseg_addr=
>>>>>>+� image_base=
>>>>>>� case "$cpu" in
>>>>>>��� arm | i386 | ppc* | s390* | sparc* | x86_64 | x32)
>>>>>>-����� # ??? Rationale for choosing this address
>>>>>>-����� textseg_addr=0x60000000
>>>>>>+����� # An arbitrary address that makes it unlikely to collide with user
>>>>>>+����� # programs.
>>>
>>>Please don't replace this ??? with an arbitrary rationale, which clearly
>>>doesn't apply to all of these hosts.
>>
>>In
>>https://lists.nongnu.org/archive/html/qemu-devel/2019-11/msg04646.html
>>it was suggested to move the comment around a bit.
>>I am not puzzled where and what I should say in the comment.
>>Can you (or other maintainers) kindly edit the comment for me?
>>I do not know enough about qemu to provide a good rationale here.
>>
>>>>>>+����� image_base=0x60000000
>>>>>>����� ;;
>>>>>>��� mips)
>>>>>>����� # A 256M aligned address, high in the address space, with enough
>>>>>>����� # room for the code_gen_buffer above it before the stack.
>>>
>>>This is the only one with a proper rationale.
>>>
>>>That said, I'm not sure that the proper way to handle this issue with lld is to
>>>drop this code entirely.
>>
>>The patch changes a feature that lld does not support: -Ttext-segment,
>>to use --image-base instead.
>>
>>Due to the prevalence of -z separate-code in GNU ld, -Ttext-segment is
>>no longer appropriate. I suggested that GNU linkers implement the
>>feature https://sourceware.org/bugzilla/show_bug.cgi?id=25207 .
>>
>>What gets deleted is the sed script. As I explained in the commit
>>message, it is no longer relevant. It probably applies to an old GNU ld
>>that FreeBSD used. FreeBSD has switched to lld now.
>>
>>>The best way to handle the underlying issue -- address conflict between
>>>interpreter and guest binary -- is PIE, for which this code is skipped.
>>>
>>>After that, we go to some pain to choose a guest_base address that allows the
>>>guest binary to load around the interpreter's reserved addresses.
>>>
>>>So what's left that this messing about with link addresses buys us?
>>
>>I agree that --enable-pie will be a better solution, but dropping the
>>support now will break at least FreeBSD. Its kernel supports running an
>>ET_DYN executable but it does not perform address randomization.
>>--disable-pie also appears to be used by ChromeOS developers who
>>reported https://bugs.llvm.org/show_bug.cgi?id=43997 . I can communicate
>>to them that migrating to --enable-pie is the way going forward.
>
>Ping? There is another very good reason that we need to keep
>--disable-pie for a while. Many users build statically linked qemu user
>mode binaries. -static-pie requires newer toolchain:
>
>* GCC 8 or clang 9
>* binutils>=2.29
>* glibc>=2.27 or musl
>
>Dropping support for GCC<8 does not sound a good idea in the year of 2019. (It may be in a few years.)

Ping...

