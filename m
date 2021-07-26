Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EF53D547A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 09:41:53 +0200 (CEST)
Received: from localhost ([::1]:46186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7vFI-0004o8-Ch
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 03:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1m7vDR-0003jV-03
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 03:39:57 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:33326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1m7vDO-0004YD-Lf
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 03:39:56 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 61-20020a9d0d430000b02903eabfc221a9so9269064oti.0
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 00:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=5hkghwkvys+4a9QwIwM4q5g8CwsMCnuSKtY93R2nTlI=;
 b=DTNW8hAHvGsk3gHMY+X7zZ2sPohYwurcJLgcHXwkGM+fAtBRhkG/hRPdWj51AFVkYv
 znrvFhhlFjv4w9prEf7ZgjNA9rMqVBhUlLj4b6BdiAxhyRaw60uqTaJYbNP33hZHT/2u
 x+CklYrirKCc9NLPQ3OuysSAgmal9Uh9+DM1bVSiXZ414ferpBUa/YKAXUEkMjyWNpiz
 HIztrgDu0YwajxhfyOR7cD3E6txSObrPBbfELbb8Z9/VPpD00v6L+OnPKQfmNPqo97kR
 +XWBk/BS2O1RJOzpBtb2YTNQeccwmNLBqil4/2vAxMFFxtFxTrex4NU27ApyeYN0EzPV
 tWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=5hkghwkvys+4a9QwIwM4q5g8CwsMCnuSKtY93R2nTlI=;
 b=iwwXYfZ9Ud6tLYbJ3Y+szijLSsX/C9/uDXLG6YeZwlKIECW6UwsrV5VbVCeEKbhCwY
 E53hqD+9t/flje3DTSFiPhCfYe6dVziI7hSMLBFXa4mFM+kx3CvVQyj/nhdJtTmf1Man
 ut70Y7BoDSQgMZy4j+KO1rQujq+0UGeSlwJDp7Y6tTdlineEU0f4ocVE4a/lUmguiiFV
 0rF5+2iyTYP4rJ4Y9hMtTIu9NyNLAwcOsNwU3zM65pTXNP0PCm2BTeqq7dS1pnXytPYD
 yOlvfXytr7ZZ1hM2bqtwYTW0XJn68XUKyW9JCRToKCaDT/rlls89sxTlz18MqcWZ8THd
 /53A==
X-Gm-Message-State: AOAM533fSoJfOMmtaCAsg33Ln2zew+k4TH8W6+xoJrV5vwla4EknllKU
 ds9taPOzfuRilty9Ovapr5ZD3A==
X-Google-Smtp-Source: ABdhPJxxPUD8G7V0vdG/9HEnNZWse+lzcsEEJU6s0cxbzuInS8XSEGbQB3e2584WLIocYimtea5gPg==
X-Received: by 2002:a05:6830:2241:: with SMTP id
 t1mr10689969otd.180.1627285192627; 
 Mon, 26 Jul 2021 00:39:52 -0700 (PDT)
Received: from [192.168.11.11] ([172.58.97.112])
 by smtp.gmail.com with ESMTPSA id q15sm3180016otf.70.2021.07.26.00.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 00:39:51 -0700 (PDT)
Subject: Re: [PATCH 01/20] Hexagon HVX (target/hexagon) README
To: Sid Manning <sidneym@quicinc.com>, Brian Cain <bcain@quicinc.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-2-git-send-email-tsimpson@quicinc.com>
 <1b632e88-43d4-3034-cf7b-d42be056d842@landley.net>
 <SN6PR02MB42054B50C60ABA378256492DB8159@SN6PR02MB4205.namprd02.prod.outlook.com>
 <553c32e8-188c-5b2c-2f4a-a8cfd7b903a9@landley.net>
 <BN7PR02MB4194007550E66EBE877625A6B8E19@BN7PR02MB4194.namprd02.prod.outlook.com>
 <BYAPR02MB55091DE5B976956075B46FADBEE19@BYAPR02MB5509.namprd02.prod.outlook.com>
From: Rob Landley <rob@landley.net>
Message-ID: <8845de00-ddc7-86a3-600f-6ede81e168c2@landley.net>
Date: Mon, 26 Jul 2021 02:57:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB55091DE5B976956075B46FADBEE19@BYAPR02MB5509.namprd02.prod.outlook.com>
Content-Type: multipart/mixed; boundary="------------89AC309B8CECE92A09A316A7"
Content-Language: en-US
Received-SPF: none client-ip=2607:f8b0:4864:20::329;
 envelope-from=rob@landley.net; helo=mail-ot1-x329.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.091, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------89AC309B8CECE92A09A316A7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 7/19/21 11:19 AM, Sid Manning wrote:>> -----Original Message-----
>> From: Brian Cain <bcain@quicinc.com>
>> Sent: Monday, July 19, 2021 8:40 AM
>> To: Rob Landley <rob@landley.net>; Taylor Simpson
>> <tsimpson@quicinc.com>; qemu-devel@nongnu.org; Sid Manning
>> <sidneym@quicinc.com>
>> Cc: ale@rev.ng; peter.maydell@linaro.org; richard.henderson@linaro.org;
>> philmd@redhat.com
>> Subject: RE: [EXT] Re: [PATCH 01/20] Hexagon HVX (target/hexagon)
>> README
>> 
>> > -----Original Message-----
>> > From: Rob Landley <rob@landley.net>
>> ...
>> > On 7/12/21 8:42 AM, Brian Cain wrote:
>> ...
>> > > and there's also a binary hexagon-linux cross toolchain that we
>> > > shared for use by kernel developers.  The hexagon linux toolchain is
>> > > built on Ubuntu 16.04.
>> >
>> > Where's that one?
>> 
>> https://codelinaro.jfrog.io/artifactory/codelinaro-qemu/2021-05-
>> 12/clang+llvm-12.0.0-cross-hexagon-unknown-linux-musl.tar.xz -
>> 	- Built on Ubuntu 16.04, similar dynamic dependencies as
>> releases.llvm.org binaries

Indeed, in a "that also does not run on devuan, which is 99% stock debian" way. :(

Luckily, I built a working hexagon toolchain with the attached script, as in
"qemu-hexagon ran a statically linked toybox", and it even built a kernel.

I'm still trimming the build script down, that clang-rt section is WAY too big,
and I need to static link the binaires it produces so I can tar 'em up and use
them under a different distro, and I haven't even _started_ making a native
toolchain yet.[1]

Next question: is there a qemu-system-hexagon anywhere?

I mentioned I built a comet_defconfig kernel, ala:

LLVM_IAS=1
CROSS_COMPILE=~/toybox/hexagon/ccc/cross_bin/hexagon-unknown-linux-musl- make
ARCH=hexagon CC=~/toybox/hexagon/ccc/cross_bin/hexagon-unknown-linux-musl-cc

Which is kinda silly because:

1) Other packages figure out that ${CROSS}cc works but Linux insists on
${CROSS}gcc, and you can't even do "CC=cc make" because then it won't add the
cross compiler prefix. (And if I say LLVM=1 on the kernel command line, which I
shouldn't have to do, it uses _unprefixed_ clang as the $CC name, despite cross
compiling.)

2) If you don't set LLVM_IAS it tries to call the UNPREFIXED assembler, again
while cross compiling.

Anyway, I've got a compiler now and I (awkwardly) built a kernel and I'm sitting
down to try to figure out how to get qemu to invoke it: does this arch want
vmlinux or arch/hexagon/boot/$RANDOMFORMAT, is serial on console=ttyS0 or
/significant/dev/prefix/ttyasparagus0 or...

See https://github.com/landley/toybox/blob/master/scripts/mkroot.sh#L186 for the
other architectures I've already added to toybox's mkroot, yes I have a ~250
line bash script that builds bootable Linux systems for a bunch of different
architectures and adding a new architecture looks like:

elif [ "$TARGET" == m68k ]; then
QEMU="m68k -M q800" KARCH=m68k KARGS=ttyS0 VMLINUX=vmlinux
KCONF=MMU,M68040,M68KFPU_EMU,MAC,SCSI_MAC_ESP,MACINTOSH_DRIVERS,ADB,ADB_MACII,NET_CORE,MACSONIC,SERIAL_PMACZILOG,SERIAL_PMACZILOG_TTYS,SERIAL_PMACZILOG_CONSOLE

(There's a little documentation at https://landley.net/toybox/faq.html#mkroot if
you're curious.)

Anyway... it doesn't look like qemu-system-hexagon (softmmu) its currently in
vanilla qemu? Is there a public fork that has this somewhere?

Thanks,

Rob

[1] Why does https://llvm.org/docs/GettingStarted.html#cross-compiling-llvm talk
about osx? Dear compiler writers: a compiler is conceptually the same as an html
to pdf converter. It takes input files, it produces output files. Yes some of
the input files are common library stuff like fonts reused by multiple
input/output pairs... again like an html to pdf converter. This is not
unprecedented black magic. Sure it's clever. So was Quake, which has now been
genericized into a broad industry from WoW to Skyrim.

--------------89AC309B8CECE92A09A316A7
Content-Type: application/x-shellscript;
 name="script.sh"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="script.sh"

I2dpdCBjbG9uZSBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QKI2dpdCBj
bG9uZSBodHRwczovL2dpdGh1Yi5jb20vcXVpYy9tdXNsIC1iIGhleGFnb24KI2dpdCBjbG9u
ZSBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgKClRPUD0iJFBXRCIKUFJFRklY
PSIkUFdEIi9jY2MKVFlQRT1oZXhhZ29uLXVua25vd24tbGludXgtbXVzbApDUk9TUz0iJFBS
RUZJWCIvY3Jvc3NfYmluLyRUWVBFLQpVU1I9IiRQUkVGSVgvJFRZUEUvdXNyIgoKIyBCdWls
ZCBjbGFuZy9sbHZtCgpta2RpciAtcCBidWlsZC1sbHZtICYmIGNkIGJ1aWxkLWxsdm0gJiYK
IyB5YW5rZWQgLURMTFZNX0VOQUJMRV9MTEQ9T04KY21ha2UgLUcgTmluamEgLURDTUFLRV9C
VUlMRF9UWVBFPVJlbGVhc2UgLURDTUFLRV9JTlNUQUxMX1BSRUZJWD0kUFJFRklYIFwKICAg
IC1ETExWTV9FTkFCTEVfUFJPSkVDVFM9ImNsYW5nO2xsZCIgIiRUT1AvbGx2bS1wcm9qZWN0
L2xsdm0iIFwKICAgIC1ETExWTV9UQVJHRVRTX1RPX0JVSUxEPSJIZXhhZ29uIiAmJgpuaW5q
YSBhbGwgaW5zdGFsbCAmJgplY2hvICItRzAgLS1zeXNyb290PSckUFJFRklYLyRUWVBFJyIg
PiAiJFBSRUZJWCIvYmluLyRUWVBFLmNmZyAmJgpta2RpciAkUFJFRklYL2Nyb3NzX2JpbiAm
JgpsbiAtc2YgLi4vYmluL2NsYW5nICIkQ1JPU1MiY2MgJiYKbG4gLXNmIC4uL2Jpbi9jbGFu
ZysrICIkQ1JPU1MiYysrICYmCmxuIC1zZiAuLi9iaW4vbGxkICIkQ1JPU1MibGQgJiYKZm9y
IGkgaW4gYXIgbm0gb2JqZHVtcCBvYmpjb3B5IHJlYWRlbGYgcmFubGliCmRvIGxuIC1zZiAu
Li9iaW4vbGx2bS0kaSAiJENST1NTIiRpOyBkb25lICYmCmNkIC4uICYmIHJtIC1yZiBidWls
ZC1sbHZtIHx8IGV4aXQgMQoKIyBBZGQgaXQgdG8gdGhlIHBhdGgsIGNyZWF0ZSBhcmNoIGRp
cmVjdG9yeS4KCmV4cG9ydCBQQVRIPSIkUFJFRklYL2Nyb3NzX2JpbjokUEFUSCIKbWtkaXIg
LXAgIiRVU1IiCgojIEluc3RhbGwga2VybmVsIGFuZCBtdXNsIGhlYWRlcnMKKGNkIGxpbnV4
ICYmIG1ha2UgQVJDSD1oZXhhZ29uIElOU1RBTExfSERSX1BBVEg9IiRVU1IiIFwKICAgZGlz
dGNsZWFuIGNvbWV0X2RlZmNvbmZpZyBoZWFkZXJzX2luc3RhbGwpIHx8IGV4aXQgMQooY2Qg
bXVzbCAmJiBtYWtlIGNsZWFuICYmCiBDUk9TU19DT01QSUxFPSIkQ1JPU1MiIC4vY29uZmln
dXJlIC0tdGFyZ2V0PWhleGFnb24gLS1wcmVmaXg9LyAmJgogbWFrZSBERVNURElSPSIkVVNS
IiBpbnN0YWxsLWhlYWRlcnMpIHx8IGV4aXQgMQoKIyBidWlsZCBjbGFuZy1ydDogZGVwZW5k
cyBvbiB0aGUgdXNlcnNwYWNlIGhlYWRlcnMgZm9yIHNvbWUgcmVhc29uPyE/Pwpta2RpciAt
cCBidWlsZC1ydCAmJiBjZCBidWlsZC1ydCAmJgpjbWFrZSAtRyBOaW5qYSBcCiAgICAtRENN
QUtFX0JVSUxEX1RZUEU9UmVsZWFzZSAtRENNQUtFX1NZU1RFTV9OQU1FPUxpbnV4IFwKICAg
IC1ETExWTV9DT05GSUdfUEFUSD0iJFBSRUZJWC9iaW4vbGx2bS1jb25maWciIFwKICAgIC1E
Q01BS0VfQVNNX0ZMQUdTPSItRzAgLW1sb25nLWNhbGxzIC1mbm8tcGljIC0tdGFyZ2V0PSRU
WVBFICIgXAogICAgLURDTUFLRV9DX0NPTVBJTEVSPSIke0NST1NTfWNjIiAtRENNQUtFX0FT
TV9DT01QSUxFUj0iJHtDUk9TU31jYyIgXAogICAgLURDTUFLRV9JTlNUQUxMX1BSRUZJWD0i
JFVTUiIgLURDTUFLRV9DUk9TU0NPTVBJTElORz1PTiBcCiAgICAtRENNQUtFX0NfQ09NUElM
RVJfRk9SQ0VEPU9OIC1EQ01BS0VfQ1hYX0NPTVBJTEVSX0ZPUkNFRD1PTiBcCiAgICAtRENP
TVBJTEVSX1JUX0JVSUxEX0JVSUxUSU5TPU9OIC1EQ09NUElMRVJfUlRfQlVJTFRJTlNfRU5B
QkxFX1BJQz1PRkYgXAogICAgLURDTUFLRV9TSVpFT0ZfVk9JRF9QPTQgLURDT01QSUxFUl9S
VF9PU19ESVI9IC1EQ0FOX1RBUkdFVF9oZXhhZ29uPTEgXAogICAgLURDQU5fVEFSR0VUX3g4
Nl82ND0wIC1EQ09NUElMRVJfUlRfU1VQUE9SVEVEX0FSQ0g9aGV4YWdvbiBcCiAgICAtRExM
Vk1fRU5BQkxFX1BST0pFQ1RTPSJjb21waWxlci1ydCIgIiRUT1AvbGx2bS1wcm9qZWN0L2Nv
bXBpbGVyLXJ0IiAmJgpuaW5qYSBpbnN0YWxsLWNvbXBpbGVyLXJ0ICYmCmNkIC4uICYmIHJt
IC1yZiBidWlsZC1ydCB8fCBleGl0IDEKCiMgYnVpbGQgbXVzbApjZCBtdXNsICYmIG1ha2Ug
Y2xlYW4gJiYKQ1JPU1NfQ09NUElMRT0iJENST1NTIiBMSUJDQz0iJFVTUiIvbGliL2xpYmNs
YW5nX3J0LmJ1aWx0aW5zLWhleGFnb24uYSBcCiAgLi9jb25maWd1cmUgLS10YXJnZXQ9aGV4
YWdvbiAtLXByZWZpeD0vICYmCm1ha2UgLWogJChucHJvYykgREVTVERJUj0iJFVTUiIgaW5z
dGFsbAo=
--------------89AC309B8CECE92A09A316A7--

