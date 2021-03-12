Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9FA3396D3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:44:13 +0100 (CET)
Received: from localhost ([::1]:52336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmlg-0006DM-LY
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKlrm-00036J-3f
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:46:31 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKlrj-0001XT-Ie
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:46:25 -0500
Received: by mail-wr1-x434.google.com with SMTP id l12so5274247wry.2
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O07H1tkVzE9ZRC9p8iDjqXN+hzU/NccJCQXD1a88EII=;
 b=nMJfJWwWaZ4CbH+3lKunmbrnl3hETuR0bCt7kyJMEpFPssGCtOn0oUtsV+yiR82a4b
 ZujYxwLfJ+h6NGnNaRrcddzek/Ff6lzzq8xy3O5Mxx7tJ/IRN8/q4a8fquugoEM7yx83
 JONgOwFyhwFwvQt2ODDIqzv0BQsD7RSzz2uHIgcdp7R+gPo+EtodaDIu8NsKILBTPY+f
 iXfaWKlo311x4dBfRZZcH6BZ4vi/ww+h2D7dMJBrPbVQ6y2vhDOkAmBCtGYSb3wmhu4y
 tHeESYMe4OUSpqvTtcIWeHy0IMQL9YtUHqAvyLn9Ej9plmrcR8xIAeTwJllVeImpSuZh
 xsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O07H1tkVzE9ZRC9p8iDjqXN+hzU/NccJCQXD1a88EII=;
 b=qvwP09bDmIYmDN5ryCwBA51a64+/jZVKa9XEWUV/WnC0tWtupuug8HZNiQ60YAFFwv
 XmAAT+tR4nf6oBA9t44yKLvv/75ddmlIEd1lU5VpnZGvcdfUSLYhKYSxAzIf0P98aRI4
 q0m7Qfn8eBLImHZe0YNybqTR7t1aIc1JeYWClooLtwgHIsnSjRrIUrIekinZgwM+xCWr
 oppLci01z4dYhBhC6TSdJMyUw1JfTYMWvFPwclUh93wBR/9R3ZuJTr5X8w+m1vEUE6Qv
 SiznztAYz7Z5woY1qj9OHPutfjHqbbkiX6u6rgl8Aj80+ajHPt4mqUoC4DIseA1Ssur3
 39vA==
X-Gm-Message-State: AOAM530oncGO3xCacCpdvE4Rwx9vPTGdgvlcKE4kNrzmKFT9RvYNvcg9
 51aykK4zwN/DUrCxT/EsrVY=
X-Google-Smtp-Source: ABdhPJxLXswKujGREmrrTHeSp1ePSuDbrlq5ulugF/bcJ2peugfLW1II0sGqcMEZx3/8pyrF3HhAdQ==
X-Received: by 2002:adf:80e7:: with SMTP id 94mr15224350wrl.5.1615571181789;
 Fri, 12 Mar 2021 09:46:21 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id i4sm2847456wmq.12.2021.03.12.09.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 09:46:21 -0800 (PST)
Subject: Re: [RFC PATCH 32/42] docker: Add gentoo-mipsr5900el-cross image
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-33-f4bug@amsat.org>
 <20210215115957.GG1542881@redhat.com> <YCp7Ce6ELbLFvRXZ@sx9>
 <ebbdecd9-e599-1a4b-60e8-3464afa4a20e@amsat.org>
 <21217ef4-91d8-6877-5d78-bb78e00773d8@amsat.org>
 <alpine.DEB.2.21.2103121741460.33195@angie.orcam.me.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d0401476-0b3c-d7ce-8d0f-aa9b348da4fe@amsat.org>
Date: Fri, 12 Mar 2021 18:46:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2103121741460.33195@angie.orcam.me.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Fam Zheng <fam@euphon.net>, Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Maciej,

On 3/12/21 6:05 PM, Maciej W. Rozycki wrote:
> On Fri, 12 Mar 2021, Philippe Mathieu-Daudé wrote:
> 
>>>>> Is there any way we can do this with a distro that isn't Gentoo
>>>>> so that we can get a container build that is fast enough to be
>>>>> useful for CI ?
>>
>> Using the Debian cross image I get:
>>
>> /home/phil/source/qemu/tests/docker/docker.py --engine auto cc --cc
>> mips64el-linux-gnuabi64-gcc -i qemu/debian-mips64el-cross -s
>> /home/phil/source/qemu --   -Wall -Werror -O0 -g -fno-strict-aliasing
>> -mabi=n32 -march=r5900
>> /home/phil/source/qemu/tests/tcg/mips/test-r5900-dmult.c -o
>> test-r5900-dmult  -static
>> cc1: error: unsupported combination: -march=r5900 -mhard-float
>> -mdouble-float
>>
>> No clue what is setting '-mhard-float -mdouble-float' yet.
> 
>  The R5900 has an FPU that only supports the single floating-point format.  
> It's also not an IEEE 754 format.  The Linux kernel ABI does support the 
> double and also the single floating-point format, both compliant with IEEE 
> 754.
> 
>  In the absence of a suitable FPU emulation code included with the kernel 
> will handle the missing instructions (you can use the `nofpu' kernel 
> parameter to force that in the presence of an FPU too).  Beware however 
> that a recent change to the Linux kernel made FPU emulation code optional 
> to suit some deeply embedded applications known never to use FPU machine 
> instructions.
> 
>  NB the presence of emulation is always required for MIPS ISA compliance 
> if FPU machine instructions are ever to be used in a given application, 
> because operations are allowed to trap regardless and rely on emulation.
> 
>  I don't know what you are trying to achieve,

The previous maintainer let the QEMU MIPS codebase with the R5900 code
unreachable. I'm trying to see if I can get a closure on Fredrik work
before removing it, because there is no point in maintaining unreachable
code.

QEMU uses Docker images of distributions to cross-compile its tests.

Currently all Linux cross-tests are built using Debian based images.
Daniel asked me to see if I can use our current Debian based image
to build the r5900 tests, instead of adding yet another one (based
on Gentoo).

> but your two options to 
> choose from are:
> 
> 1. Build for the soft-float ABI (`-msoft-float') where any FP calculations 
>    are compiled such as to be made by the CPU using integer arithmetic.

With the Debian toolchain I get:

/usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No
such file or directory
 #include <bits/libc-header-start.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~~~

> 2. Build for a generic MIPS ISA, for the R5900/n32 that would be MIPS III
>    (`-march=mips3'), and rely on the kernel FPU emulation.

Shouldn't -march=r5900 imply -march=mips3?

>  Note that some 
>    integer MIPS III operations are missing too from the R5900 and have to 
>    be emulated by the kernel for MIPS/Linux n32 psABI compliance (an 
>    implementation can be pinched from an old libgcc version that was still 
>    under GNU GPLv2 or another algorithm reused, e.g. my `__div64_32' piece
>    easily adapted).

Regards,

Phil.

