Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0424D2D8E3F
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 16:24:33 +0100 (CET)
Received: from localhost ([::1]:60000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koTEd-0001Oc-Hv
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 10:24:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koTDc-0000oY-P2
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 10:23:28 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:36772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koTDb-0002iX-5o
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 10:23:28 -0500
Received: by mail-wr1-x442.google.com with SMTP id t16so13900816wra.3
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 07:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1EsCf/Ty7TrS7cjSr/Vs96SO+DJTTckQGT9JaYXcwAU=;
 b=EPotKffgF+xAk5zALXmz6htmnMOTVgOaKsFeFzdjOTWBbdflL/P/06goCiIRt0KMj1
 lLfpc7s7DAJhjSxw1x7639moU8Hn9jpDn3ZvtENsPrBJFT04X41MlaOdpHSL+VOtfiq2
 x1kjGR64wKhT4WAMCgRe0VSlevtmhTAXFmD7in8RheotyV4PsPJ+E8LuLnPH+ntGLPuc
 HlSfqbjOhB+E5ULKPo9Vj3z6XE/rnYmLur/Hdbf8xctExmmjHfmomFkfEDbUZFoODugL
 Ccukdy5oJ2ppr3dae3hyY4spWqLIisRXpa8xKBUAQjvsHVGobi0Rdo3yr3D+5N0QQzQr
 KDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1EsCf/Ty7TrS7cjSr/Vs96SO+DJTTckQGT9JaYXcwAU=;
 b=l6vA/9ow/FmyGWgKMVY4/rJTSKVSNSWPxDdpQ5qsmTDmuapuNAPlJWFS0zbEcWZW2w
 ov8AnSP+DAr2K4Ig31QultVx9mHZLFoBg9MX39Fqd+3R/fTpHRYRJ01OUHPB1FwU0PAL
 3PBlZR0vBVfcGy9nSHtc0a40AMvzeaVFYGfTjL2q82PkpEpNUYFyl+c9lHRyNwdUGJrE
 V7P47qTWjCuWcr+ylBS2H8j0yF+SC5ipVcfRdzmnxy1FhutgNJV6C9OmvUcgBdoAcqew
 wDv8hZRWzyWf3BtzuKh0S4zoxoUj9tY0C/7OxpdON8PZOqdTytKAfWaZPfgYV+8DeJlW
 Oarg==
X-Gm-Message-State: AOAM533/3cxzv8ovqy4VApf573qEiTah1D3X14LqTk3sNSguT208cxuz
 TVmDjg2kgQiAqJA2/rgV5hg=
X-Google-Smtp-Source: ABdhPJy6Js98OzpUuiQMN14vYXcRynZbBYBsrJTwO9ALPB8UT4yCKUMwTkOKPknC9QHtcQFcvXLbgQ==
X-Received: by 2002:adf:fb49:: with SMTP id c9mr13172665wrs.72.1607873005401; 
 Sun, 13 Dec 2020 07:23:25 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id d9sm28447057wrc.87.2020.12.13.07.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 07:23:24 -0800 (PST)
Subject: Re: [PATCH 26/26] MAINTAINERS: Add entry for MIPS Toshiba TCG
To: Fredrik Noring <noring@nocrew.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-27-f4bug@amsat.org> <X9Tp8VFjqaayVkSy@sx9>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <192865b5-3c62-3e04-c927-088b38e21d76@amsat.org>
Date: Sun, 13 Dec 2020 16:23:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <X9Tp8VFjqaayVkSy@sx9>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 "Maciej W. Rozycki" <macro@linux-mips.org>, Huacai Chen <chenhc@lemote.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Fredrik,

On 12/12/20 5:04 PM, Fredrik Noring wrote:
> On Fri, Nov 20, 2020 at 10:08:44PM +0100, Philippe Mathieu-Daudé wrote:
>> Add an entry for the TCG core related to Toshiba TXx9.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Adding Fredrik Noring in case he wants to be notified of changes,
>> patch conditional to his approval.
> 
> I may be able to help on the TX79 that is an R5900, but unless commit
> 823f2897bdd7 ("target/mips: Disable R5900 support") is reverted, it
> remains shut off in QEMU. To obtain n32, in addition to o32, one may
> want to apply something similar to this:

I added o32 because these are the only binaries I could find to test
the CPU you added. Are there n32 binaries easily available?

I noticed GCC merged your patch, and Gentoo too. It should be enough
to respin the Docker image to cross-compile and test the TCG tests
you already added:

8e2e5e7daca tests/tcg: mips: Test R5900 three-operand MADDU
84dc0712361 tests/tcg: mips: Test R5900 three-operand MADD1
50f299da629 tests/tcg: mips: Test R5900 three-operand MADD
35eb9be6bb6 tests/tcg/mips: Add tests for R5900 DIVU1
990aa328be4 tests/tcg/mips: Add tests for R5900 DIV1
4d261a6a595 tests/tcg/mips: Add tests for R5900 MTLO1 and MTHI1
3303f017adb tests/tcg/mips: Add tests for R5900 MFLO1 and MFHI1
bec4d66b248 tests/tcg/mips: Add tests for R5900 three-operand MULTU1
cb56125eea7 tests/tcg/mips: Add tests for R5900 three-operand MULT1
667eded2702 tests/tcg/mips: Add tests for R5900 three-operand MULTU

> 
> diff --git a/linux-user/mips64/target_elf.h b/linux-user/mips64/target_elf.h
> index ec55d8542a..5f2f2df29f 100644
> --- a/linux-user/mips64/target_elf.h
> +++ b/linux-user/mips64/target_elf.h
> @@ -12,6 +12,9 @@ static inline const char *cpu_get_model(uint32_t eflags)
>      if ((eflags & EF_MIPS_ARCH) == EF_MIPS_ARCH_64R6) {
>          return "I6400";
>      }
> +    if ((eflags & EF_MIPS_MACH) == EF_MIPS_MACH_5900) {
> +        return "R5900";
> +    }
>      return "5KEf";
>  }
>  #endif
> 
>> ---
>>  MAINTAINERS | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index b6d98b95c47..d97f0f1d66e 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -253,6 +253,12 @@ R: Craig Janeczek <jancraig@amazon.com>
>>  S: Odd Fixes
>>  F: target/mips/vendor-xburst*
>>  
>> +MIPS TCG CPUs (Toshiba TX)
>> +M: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> +R: Fredrik Noring <noring@nocrew.org>
>> +S: Odd Fixes
>> +F: target/mips/vendor-tx*

BTW I should also include here:

    F: tests/tcg/mips/user/isa/r5900/

Regards,

Phil.

