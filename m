Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 5143938BD9
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 15:42:21 +0200 (CEST)
Received: from localhost ([::1]:51224 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZF8O-0007Mk-J1
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 09:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40409)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hZF6H-0006Jb-W0
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:40:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hZF6F-0004DI-E8
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:40:09 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40195)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hZF6E-0003zB-Hw
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:40:07 -0400
Received: by mail-wm1-f65.google.com with SMTP id v19so1967214wmj.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jun 2019 06:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+iSKmb7pqqsWago+3dh08hXrLUpoknhtzPVO09nEW0M=;
 b=JoE6PkQrq5mpg5cZ/cQCrBty+oxZbNCgMl4oBHBlCiASe0c6PmMAdfYM7NauLwoN7o
 HOw4tNXrZC9m+nSRmB/b5k10JGJedGUO+E1Kj9rwdq+zxe7OTAFFYu18xaYkIhgnLsDU
 J0Y8LCYcoCKOHWD6VPlVV3M6wBlee4TdDCH2sr6jcs98ufJIXxV0b6BpE/Par1PScHDc
 L5NRR729oV7bWFl/r11hxoAQttpgrTz2NvVy7kVWEvl6FrzSSv5x9DrtNvSdP0G3wBwJ
 OBkOAB5ky8djX+HHJAm3RgJsXTNUJhZrrdeyGr2JL1HYviB6f6yIy5BcOjSGdkhmnTdC
 lL9Q==
X-Gm-Message-State: APjAAAX+MKTJnzQRH8F+YKEvGio/H30sBK96/Xz+SfyC2DtQATLPNsO3
 qfXPXSODAvUKF+vzV5gWCGOMAw==
X-Google-Smtp-Source: APXvYqwOB9VmyA8djhP5Zej/bBsuKGMgl47xP4aZIQk3sp6PjJoo8RGgLFrtQzeb+HyxiIK37+OPuQ==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr3518363wmb.110.1559914799406; 
 Fri, 07 Jun 2019 06:39:59 -0700 (PDT)
Received: from [192.168.0.156] ([78.192.181.46])
 by smtp.gmail.com with ESMTPSA id y184sm2506240wmg.14.2019.06.07.06.39.58
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 06:39:58 -0700 (PDT)
To: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org
References: <20190607091116.49044-1-ysato@users.sourceforge.jp>
 <20190607091116.49044-13-ysato@users.sourceforge.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <0c2798d9-c567-4ef7-1376-fc2f783194d9@redhat.com>
Date: Fri, 7 Jun 2019 15:39:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607091116.49044-13-ysato@users.sourceforge.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH v17 12/24] target/rx: Add RX to SysEmuTarget
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/19 11:11 AM, Yoshinori Sato wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Fixes check-qtest-rx: tests/qmp-cmd-test
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Again:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  qapi/common.json | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/qapi/common.json b/qapi/common.json
> index 99d313ef3b..d0fc931159 100644
> --- a/qapi/common.json
> +++ b/qapi/common.json
> @@ -183,6 +183,7 @@
>  #        is true even for "qemu-system-x86_64".
>  #
>  # ppcemb: dropped in 3.1
> +# rx: added in 4.1
>  #
>  # Since: 3.0
>  ##
> @@ -190,6 +191,6 @@
>    'data' : [ 'aarch64', 'alpha', 'arm', 'cris', 'hppa', 'i386', 'lm32',
>               'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
>               'mips64el', 'mipsel', 'moxie', 'nios2', 'or1k', 'ppc',
> -             'ppc64', 'riscv32', 'riscv64', 's390x', 'sh4',
> +             'ppc64', 'riscv32', 'riscv64', 'rx', 's390x', 'sh4',
>               'sh4eb', 'sparc', 'sparc64', 'tricore', 'unicore32',
>               'x86_64', 'xtensa', 'xtensaeb' ] }
> 

