Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538AA4C00F0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 19:07:33 +0100 (CET)
Received: from localhost ([::1]:58328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZZU-0007B3-6h
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 13:07:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMZXq-0006EW-Sl; Tue, 22 Feb 2022 13:05:50 -0500
Received: from [2a00:1450:4864:20::336] (port=34036
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMZXm-00018I-8E; Tue, 22 Feb 2022 13:05:50 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 l2-20020a7bc342000000b0037fa585de26so1276977wmj.1; 
 Tue, 22 Feb 2022 10:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mRAZx+qBLptrMsABYuCHJiK2Ruy1YgoCHlrcO7wjtFo=;
 b=g1Ezq218nbiTSWOkvPTUMFNE9+eYyNPAlzRd+nPtGUnd5Gn/9zQf7w1ITKU0Jl3p6w
 rVwHZvrDXWAwXleZzOBNxqxqj9i04+AS3b33c3VBlq4EwpfWe/djlXnNiZTtquL2h3eN
 ppNcEvqCqLBQEwrV/zvdC0yEgFcz9u9tl8ZBfV6mIrcGhsqrkUUfP97O9owdgRt9iR+e
 PGqjhei1zwxCqJ9cHTAHERnyod5yhXEW/VTgzIU920MYeSjec3SiQb6JJRAniE96X6LN
 aQJrW2GFQ6kqyKQ6f0GGeA7TEXUxKupGf2HyEyW1HCjja3E2+cs9fSkoAEt+ZZyH/4nM
 TILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mRAZx+qBLptrMsABYuCHJiK2Ruy1YgoCHlrcO7wjtFo=;
 b=B8erjmqc43HKXXv+pF4BmOPT0S0sKKmjaSD7i34FZdS4IZ4wwZGzL56LHkFFO32UMO
 n43vyXKXd7e9SYs/bapN0D1Aw6pPzf5IAGm0Y67UAiGORZ2FABex1hSwh4SN1zOr8bx4
 lPcK0l7sl2XvWH+PVOqIKK4Dc4EtFbLjoDsNh7loWqKGdUgbfsakTjsrllW372QsT2zw
 VmSQcxTyHrXsWFpIrVRgdJ1Ahz++9GMc+3r5mUQGROACE5MvKEI4C906npUdV89+zdMh
 IamI6ApzqUbRkY8FwtdXcrcY0t8zMLigNSoiIXUI/NmPflIkvKdU2ksu58tI5epo+RWt
 HjWQ==
X-Gm-Message-State: AOAM5334qogXrcV90rBnfEcKNMLWCUMIfNYxC1SNRk5eTsFFSYud+PsE
 +z8wXpxA7L6Dy4Tb9cWsG7o=
X-Google-Smtp-Source: ABdhPJxPMVmWeKIk1PnivZ4ueeSi4igbIxxqxP5arTICVF7BgnRTnffslpr44ezg4UsOdPEeGjBvkw==
X-Received: by 2002:a1c:7518:0:b0:37c:7eb:f255 with SMTP id
 o24-20020a1c7518000000b0037c07ebf255mr4378114wmc.29.1645553144317; 
 Tue, 22 Feb 2022 10:05:44 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id f7sm47199807wrz.40.2022.02.22.10.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 10:05:43 -0800 (PST)
Message-ID: <d26a877d-f3ad-6186-6a22-1e09f93a3fae@gmail.com>
Date: Tue, 22 Feb 2022 19:05:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa
 <cleber@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <CAFEAcA8ggE0HHXwLAu4vCA=kLwo4moN1CvTJbjph=OTmnfOONg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA8ggE0HHXwLAu4vCA=kLwo4moN1CvTJbjph=OTmnfOONg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Oleg Vasilev <me@svin.in>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Idan Horowitz <idan.horowitz@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Emilio Cota <cota@braap.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Beraldo

On 22/2/22 18:37, Peter Maydell wrote:
> On Tue, 22 Feb 2022 at 17:33, Philippe Mathieu-Daudé
> <philippe.mathieu.daude@gmail.com> wrote:
>>
>> +Igor/MST for UEFI tests.
>>
>> On 22/2/22 17:38, Daniel P. Berrangé wrote:
>>> On Tue, Feb 22, 2022 at 04:17:23PM +0000, Alex Bennée wrote:
>>>>
>>>> Alex Bennée <alex.bennee@linaro.org> writes:
>>>>
>>>>> Hi,
>>>>>
>>>>> TL;DR:
>>>>>
>>>>>     - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug
>>>>
>>>> Laszlo,
>>>>
>>>> Would it be possible to do a less debug enabled version of EDK2 on the
>>>> next update to pc-bios/edk2-*?
> 
>> We need the DEBUG profile to ensure the bios-tables-tests work.
>>
>> If you want to boot a guest using EDK2, you should use the images
>> build by your distribution (/usr/share/qemu/edk2-aarch64-code.fd),
>> not these images.
> 
> But we're booting guests using EDK2 as part of our avocado tests:
> if we say "booting guests with EDK2 should be done with non-debug
> images" we need to also be building and providing those in
> pc-bios for the avocado tests.

Then we should add edk2-aarch64 and edk2-ovmf to lcitool, to have
the distrib images in our generated Docker images.

Cleber, you added this test in commit 6fd52d671d ("Acceptance test:
add "boot_linux" tests"), can you have a look?

Thanks,

Phil.

