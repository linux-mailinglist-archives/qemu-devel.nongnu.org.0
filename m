Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916371484EC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 13:06:58 +0100 (CET)
Received: from localhost ([::1]:41187 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuxjl-0001Vx-Kh
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 07:06:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40128)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iuxir-00012g-Az
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 07:06:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iuxip-0006Z2-OT
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 07:06:01 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35880)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iuxip-0006Y7-Hn
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 07:05:59 -0500
Received: by mail-ot1-x343.google.com with SMTP id g15so1379119otp.3
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2020 04:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4KNmT7UZKbBcyM8gkqPX5ZtXniX6lXpblhfeeoAi7fA=;
 b=dcnZntpqy02lYfKlMdpTQsZ+X5/zhsuIVn8Fmv1dLzDpcmFZytIcaiHuMfM1pNDdge
 TmR8CRvtSjhWWG7H/7yTGZZjmK391LCcnK6Ol9wq38ipYTsE4i6g/BXi/8BUYGfrdVrB
 FANnCC7LrbMaJvGNWr/CKhVC5kM9ykd5Jvu4OK0SWVSp0LWFnuw9w3JzDOoro4lBxqNu
 lQMMA2x36vZ5dBwEPZ/1mgxHs3tetyejx/tLWMudOStCjpYPj9fuFrBW8OAG/j1KXfwh
 B3+zrIFF7cK/LMRiejGvoZCPl99vvj5yWne9BE98dsDUkbac4jVS7JhXLmEk0WuIAN92
 bXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4KNmT7UZKbBcyM8gkqPX5ZtXniX6lXpblhfeeoAi7fA=;
 b=tPZUEsuVokE8Ag+dMOsTQ5ICmZA7qNTUjrqIfA58d03MPNC+HEZa3mfvGImwiyoI7o
 54GABIceNi8+VlUZhfGW3/Pfb9JBP3B5B2CvYQ/X7sm8tJX2/C82tKc1OcM9QYj9tmXg
 IENbwz29mknC+Qf2WB03dYhQcTq3KV7LldBFjd75f0nXrX06RqwTSsJXN2VfAT8i4Uql
 HqA3Z9U+Ka+vsDnNnPgBt69nZs5mJ4Nvcct8xpZlMYwRPv5A5/TBsXBvT20n4jyseyY6
 fK8kxm7tCjYBOe4nNYCVB1sxTeAg9EGs+0KGoGDmydWgVmHYyBWRwyR4RSrNU0M2Qds9
 ehhQ==
X-Gm-Message-State: APjAAAX/4HXcSuGEUDTFei5cJXELYl3luqWr+0LjXnqPoSiooFKRL+sw
 yAOoBarBY/yQ/EbN2JL5+BryTzI2R4FNlVRNMO961w==
X-Google-Smtp-Source: APXvYqwFU+fccZrCDOVXqZOADDmiPiPQP7jQPUaK+K99m6hHAlCJRNW+sIMIPIQe/dhQ20EFX9ogtfD2+QLwkuyFK94=
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr2432003otq.135.1579867558486; 
 Fri, 24 Jan 2020 04:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20200123221035.20383-1-richard.henderson@linaro.org>
In-Reply-To: <20200123221035.20383-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jan 2020 12:05:47 +0000
Message-ID: <CAFEAcA9aM5Pn1qVV=Cr-B4jG7_4hkPhEoWUEHhhY3a-q3=44gw@mail.gmail.com>
Subject: Re: [PULL v2 00/11] target/hppa patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Jan 2020 at 22:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Change since v1:
>   * Incorporate Phil's -vga none fix for boot-serial-test (patch 7).
>
>
> r~
>
>
> The following changes since commit 6918ab2570bcf942651e69f7ad975e137679738b:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200123-4' into staging (2020-01-23 16:36:55 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/rth7680/qemu.git tags/pull-pa-20200123
>
> for you to fetch changes up to b670f6d717a6a1795358c07823b4e968c0b61a86:
>
>   target/hppa: Allow, but diagnose, LDCW aligned only mod 4 (2020-01-23 10:55:20 -1000)
>
> ----------------------------------------------------------------
> Improve LASI emulation
> Add Artist graphics
> Fix main memory allocation
> Improve LDCW emulation wrt real hw
>

Hi; I'm afraid this has format-string errors for 32-bit and clang:

OSX:

/Users/pm215/src/qemu-for-merges/hw/display/artist.c:1035:41: error:
format specifies type 'unsigned long' but the argument has type
'hwaddr' (aka 'unsigned long long') [-Werror,-Wformat]
                " size=%d\n", __func__, addr, val, size);
                                        ^~~~
/Users/pm215/src/qemu-for-merges/include/qemu/log.h:118:30: note:
expanded from macro 'qemu_log_mask'
            qemu_log(FMT, ## __VA_ARGS__);              \
                             ^~~~~~~~~~~
/Users/pm215/src/qemu-for-merges/hw/display/artist.c:1035:47: error:
format specifies type 'unsigned long' but the argument has type
'uint64_t' (aka 'unsigned long long') [-Werror,-Wformat]
                " size=%d\n", __func__, addr, val, size);
                                              ^~~
/Users/pm215/src/qemu-for-merges/include/qemu/log.h:118:30: note:
expanded from macro 'qemu_log_mask'
            qemu_log(FMT, ## __VA_ARGS__);              \
                             ^~~~~~~~~~~
/Users/pm215/src/qemu-for-merges/hw/display/artist.c:1121:69: error:
format specifies type 'unsigned long' but the argument has type
'hwaddr' (aka 'unsigned long long') [-Werror,-Wformat]
        qemu_log("%s: unknown register: %08lx size %d\n", __func__, addr, size);
                                        ~~~~~                       ^~~~
                                        %08llx
3 errors generated.


aarch32 has those 3 and also:

/home/peter.maydell/qemu/hw/net/i82596.c: In function 'i82596_receive':
/home/peter.maydell/qemu/hw/net/i82596.c:531:45: error: format '%lu'
expects argument of type 'long unsigned int', but argument 2 has type
'size_t {aka unsigned int}' [-Werror=format=]
         printf("Received frame too small, %lu vs. %u bytes\n",
                                           ~~^
                                           %u


OpenBSD has another 2:

/home/qemu/qemu-test.HtS7yu/src/hw/input/lasips2.c:178:62: warning:
format specifies type 'unsigned long' but the argument has type
'hwaddr' (aka 'unsigned long long') [-Wformat]
        qemu_log("%s: unknown register 0x%02lx\n", __func__, addr);
                                         ~~~~~               ^~~~
                                         %02llx
/home/qemu/qemu-test.HtS7yu/src/hw/input/lasips2.c:239:62: warning:
format specifies type 'unsigned long' but the argument has type
'hwaddr' (aka 'unsigned long long') [-Wformat]
        qemu_log("%s: unknown register 0x%02lx\n", __func__, addr);
                                         ~~~~~               ^~~~
                                         %02llx

thanks
-- PMM

