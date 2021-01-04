Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AA42E9666
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 14:54:17 +0100 (CET)
Received: from localhost ([::1]:40252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwQJM-00013k-E6
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 08:54:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwQIF-0000aM-MS
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 08:53:07 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:50800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwQIE-0004aa-1t
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 08:53:07 -0500
Received: by mail-wm1-x336.google.com with SMTP id 190so18512763wmz.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 05:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iui01j9Nhzl7HyBFnLxTnv7ShZm4bRY6ajm7tG8eYtY=;
 b=o3Yi2kxQfNiBdkSsS9tW7QnCAAOks3zTWwt8nSZT4ahBd+MPtyAiTjkpGOXTrHkRf3
 EosFxxsJHwZNj7nZkZnMDjsfgCCc4iq00jKM+lMG/M/7BitLP368BJ6dvYhX+We83gcM
 HzZ2KmpiDIm9iK5ATmD30r2dlTIevw318dDwNOVfhT0H8xnh5q97ApxS6g0yCwsWJyjJ
 BgqUmRnySjU9Kx4fZkFluIIoepD5rvBZygaOo8pZlDCONXszCHuwSHegI9+gayCcAMko
 GkYfFfS7kb8tXcLeijT/pEyObLhhesmBSFyD/KD+GOlLQsgCzYr2vVK01UUJl2kKath1
 XC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iui01j9Nhzl7HyBFnLxTnv7ShZm4bRY6ajm7tG8eYtY=;
 b=mIUP0WhDRyAgP/s7fEst2hH8vwpMlYWRoszgG7dxYKYJMl13wvtz5gjgUZsSg9/5Dj
 8xMh90WvIgcv7NVDRg4GATOpnD6ArPrG3D1YqjalZUfcjiv6ZGjej7E8O6kx2fPAyV8w
 xGurHhi/FVFPQ52sNtwY12wiwbYo41HBCGWEHWhjlrUJ+OyiZ+1WqFz5fGX469aZKYPl
 T7jHLSUiA7SPpuI0KpKVbz0DA/q8EkSzj5xVuukD8opbJLUm0fA41kBEEPRWLVKaXGo+
 ocFePeCS271YSqL44jTWXA/wwkfyxsfPXNdE065pYbjC3Pc3PA6hxrcdmKcvTnKcRhGf
 CSIQ==
X-Gm-Message-State: AOAM5310otBZKn19fmhPaUPWXtS8ejwgxCMVNuRjQlYGrIggUmoXPWFP
 gz/sAvhMxfn2Ps5/X4c7DMk=
X-Google-Smtp-Source: ABdhPJwJYQV6klmcz69GVMYxwdnE2Cm15vo02Jbo5lK7VOx2vs20cJOPV/RkcT3QV7/5e58liFKz4g==
X-Received: by 2002:a1c:5447:: with SMTP id p7mr27002349wmi.116.1609768384296; 
 Mon, 04 Jan 2021 05:53:04 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id m81sm31765689wmf.29.2021.01.04.05.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 05:53:03 -0800 (PST)
Subject: Re: [PULL 00/35] MIPS patches for 2021-01-03
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <CAFEAcA--dkcqBJr=b1LcNpLtctYJewuT8Yvx9Uo47YC6JGgR-Q@mail.gmail.com>
 <CAFEAcA-HXHrXwGywi0MkxFhCCW3fk91Xr4yHA1--tiSqN2_HWQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <790b031a-2be6-82d0-565d-f7595e95c077@amsat.org>
Date: Mon, 4 Jan 2021 14:53:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-HXHrXwGywi0MkxFhCCW3fk91Xr4yHA1--tiSqN2_HWQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 1/4/21 12:50 PM, Peter Maydell wrote:
> On Mon, 4 Jan 2021 at 11:41, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Sun, 3 Jan 2021 at 20:53, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> The following changes since commit 83734919c408ba02adb6ea616d68cd1a72837fbe:
>>>
>>>   Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20201222' into staging (2021-01-01 18:19:44 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://gitlab.com/philmd/qemu.git tags/mips-20210103
>>>
>>> for you to fetch changes up to 9c592996981fcb37fef011d7e9603cb31f8ef29f:
>>>
>>>   tests/acceptance: Test boot_linux_console for fuloong2e (2021-01-03 21:41:03 +0100)
>>>
>>> ----------------------------------------------------------------
>>> MIPS patches queue
>>>
>>> - Use PCI macros (Philippe Mathieu-Daudé)
>>> - Clean up VT82C686B south bridge (BALATON Zoltan)
>>> - Introduce clock_ticks_to_ns() (Peter Maydell)
>>> - Add Loongson-3 machine (Huacai Chen)
>>> - Make addresses used by bootloader unsigned (Jiaxun Yang)
>>> - Clean fuloong2e PROM environment (Jiaxun Yang)
>>> - Add integration test of fuloong2e booting Linux (Jiaxun Yang)
>>
>>
>> This fails 'make check' (consistently) on the aarch32-chroot-on-aarch64
>> host:
>>
>> PASS 51 qtest-mips64el/qmp-cmd-test /mips64el/qmp/query-command-line-options
>> PASS 52 qtest-mips64el/qmp-cmd-test /mips64el/qmp/query-acpi-ospm-status
>> PASS 53 qtest-mips64el/qmp-cmd-test /mips64el/qmp/object-add-failure-modes
>> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
>> QTEST_QEMU_IMG=./qemu-img
>> G_TEST_DBUS_DAEMON=/home/peter.maydell/qemu/tests/dbus-vmstate-daemon.sh
>> QTEST_QEMU_BINARY=./qemu-system-mips64el tests/qtest/qom-test --tap -k
>> double free or corruption (out)
>> ../../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from
>> signal 6 (Aborted)
>> ERROR qtest-mips64el/qom-test - too few tests run (expected 8, got 0)
>> Makefile.mtest:2249: recipe for target 'run-test-279' failed
>> make: *** [run-test-279] Error 1
> 
> Also on OSX, likely the same bug:
> 
> Broken pipe
> ../../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from
> signal 11 (Segmentation fault: 11)
> ERROR qtest-mips64el/qom-test - too few tests run (expected 8, got 1)

Thanks. I am using the ubuntu-i386-guestcan not reproduce with the
> 
> thanks
> -- PMM
> 

