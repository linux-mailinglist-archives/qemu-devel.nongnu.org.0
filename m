Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D507C10E4FE
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 05:07:16 +0100 (CET)
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibczT-0005D7-Lo
	for lists+qemu-devel@lfdr.de; Sun, 01 Dec 2019 23:07:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43439)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <emacsray@gmail.com>) id 1ibcyf-0004lt-4G
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 23:06:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <emacsray@gmail.com>) id 1ibcyd-00081U-OJ
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 23:06:25 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39915)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <emacsray@gmail.com>) id 1ibcyd-00080h-Hk
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 23:06:23 -0500
Received: by mail-pl1-f194.google.com with SMTP id o9so15638893plk.6
 for <qemu-devel@nongnu.org>; Sun, 01 Dec 2019 20:06:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=77KoAChz5sNRM11zjyyKeVHT3lMwEXBIK823mXgURlM=;
 b=M33ayqkIUWmg2MUpPYrH+bAMAYBylugxhMaRFb4htfqqPTlcd5cqR2p9Uh84eiYoXT
 s8C8ruiZrHOHf9c2p1GyGyGGGG8+OFT0LgfcdK7yJ4PvWFzffTx/hovpuFjjEQ1stCIB
 2YIkCDZeQ4HX2rjf28EjItJeiTyDvmkPmNw5MAbOf4oMeJ6cxEPFtPX6QDu5c8fYZic+
 Dn4dcHpe4/LQPgPoxgj/zHxyUbZDnRFWsCGoYNDoNzdkCYTCJv9xDqFW+yM68Sbb0QVj
 6jgIQyXePm8bLTnXIlE7E7vZznxGF+2IO0Xkq6nos81HDENMpUZFRNl6fczYVL3Rd029
 nSFQ==
X-Gm-Message-State: APjAAAW1KWmrcfDWBc6EwkqiqWIWyjMOZEmW06Mitt5QjsI2gIcYiRP1
 1xsT2ZetzIeSE/xhQKHJmyg=
X-Google-Smtp-Source: APXvYqzxVEh+HPjooQT0uGQBbIxzONHyl29FNkWLMDunncjgxKOrbFsye743K3BppO91OaVoXCusIQ==
X-Received: by 2002:a17:90a:77c9:: with SMTP id
 e9mr33568416pjs.70.1575259582174; 
 Sun, 01 Dec 2019 20:06:22 -0800 (PST)
Received: from localhost (c-71-204-169-238.hsd1.ca.comcast.net.
 [71.204.169.238])
 by smtp.gmail.com with ESMTPSA id k10sm8840287pjp.12.2019.12.01.20.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2019 20:06:21 -0800 (PST)
Date: Sun, 1 Dec 2019 20:06:20 -0800
From: Fangrui Song <i@maskray.me>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] configure: Use lld --image-base for --disable-pie user
 mode binaries
Message-ID: <20191202040103.p5ywvxixglmt6oqx@google.com>
References: <20191116052815.nop3xkmd4umqsdsb@google.com>
 <20191120210200.hvwlfuzo2vy5d5n4@gmail.com>
 <20191127183631.n3kfz7k5szri27b3@gmail.com>
 <e5bf2584-bae2-8dda-a2b2-8930ee17ea86@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5bf2584-bae2-8dda-a2b2-8930ee17ea86@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.194
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


Thanks for reviewing this patch!

On 2019-12-01, Richard Henderson wrote:
>On 11/27/19 6:36 PM, Fangrui Song wrote:
>> On 2019-11-20, Fangrui Song wrote:
>>> On 2019-11-15, Fangrui Song wrote:
>>>> For lld, --image-base is the preferred way to set the base address.
>>>> lld does not actually implement -Ttext-segment, but treats it as an alias for
>>>> -Ttext. -Ttext-segment=0x60000000 combined with --no-rosegment can
>>>> create a 1.6GB executable.
>>>>
>>>> Fix the problem by using --image-base for lld. GNU ld and gold will
>>>> still get -Ttext-segment. Also delete the ld --verbose fallback introduced
>>>> in 2013, which is no longer relevant or correct (the default linker
>>>> script has changed).
>>>>
>>>> Signed-off-by: Fangrui Song <i@maskray.me>
>>>> ---
>>>> configure | 33 ++++++++++++---------------------
>>>> 1 file changed, 12 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/configure b/configure
>>>> index 6099be1d84..2d45af0d09 100755
>>>> --- a/configure
>>>> +++ b/configure
>>>> @@ -6336,43 +6336,34 @@ fi
>>>>
>>>> # Probe for the need for relocating the user-only binary.
>>>> if ( [ "$linux_user" = yes ] || [ "$bsd_user" = yes ] ) && [ "$pie" = no ];
>>>> then
>>>> -� textseg_addr=
>>>> +� image_base=
>>>> � case "$cpu" in
>>>> ��� arm | i386 | ppc* | s390* | sparc* | x86_64 | x32)
>>>> -����� # ??? Rationale for choosing this address
>>>> -����� textseg_addr=0x60000000
>>>> +����� # An arbitrary address that makes it unlikely to collide with user
>>>> +����� # programs.
>
>Please don't replace this ??? with an arbitrary rationale, which clearly
>doesn't apply to all of these hosts.

In
https://lists.nongnu.org/archive/html/qemu-devel/2019-11/msg04646.html
it was suggested to move the comment around a bit.
I am not puzzled where and what I should say in the comment.
Can you (or other maintainers) kindly edit the comment for me?
I do not know enough about qemu to provide a good rationale here.

>>>> +����� image_base=0x60000000
>>>> ����� ;;
>>>> ��� mips)
>>>> ����� # A 256M aligned address, high in the address space, with enough
>>>> ����� # room for the code_gen_buffer above it before the stack.
>
>This is the only one with a proper rationale.
>
>That said, I'm not sure that the proper way to handle this issue with lld is to
>drop this code entirely.

The patch changes a feature that lld does not support: -Ttext-segment,
to use --image-base instead.

Due to the prevalence of -z separate-code in GNU ld, -Ttext-segment is
no longer appropriate. I suggested that GNU linkers implement the
feature https://sourceware.org/bugzilla/show_bug.cgi?id=25207 .

What gets deleted is the sed script. As I explained in the commit
message, it is no longer relevant. It probably applies to an old GNU ld
that FreeBSD used. FreeBSD has switched to lld now.

>The best way to handle the underlying issue -- address conflict between
>interpreter and guest binary -- is PIE, for which this code is skipped.
>
>After that, we go to some pain to choose a guest_base address that allows the
>guest binary to load around the interpreter's reserved addresses.
>
>So what's left that this messing about with link addresses buys us?

I agree that --enable-pie will be a better solution, but dropping the
support now will break at least FreeBSD. Its kernel supports running an
ET_DYN executable but it does not perform address randomization.
--disable-pie also appears to be used by ChromeOS developers who
reported https://bugs.llvm.org/show_bug.cgi?id=43997 . I can communicate
to them that migrating to --enable-pie is the way going forward.

