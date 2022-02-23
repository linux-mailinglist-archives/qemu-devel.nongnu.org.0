Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856F44C10E6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 12:02:29 +0100 (CET)
Received: from localhost ([::1]:56432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMpPg-0003Sw-31
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 06:02:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMpMJ-0001Xh-6x; Wed, 23 Feb 2022 05:58:59 -0500
Received: from [2607:f8b0:4864:20::42a] (port=43791
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMpMG-0004e4-8p; Wed, 23 Feb 2022 05:58:57 -0500
Received: by mail-pf1-x42a.google.com with SMTP id d187so14953049pfa.10;
 Wed, 23 Feb 2022 02:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RF9tMSi8dUbOvYs7dCX+h+xm+nS0CrCpDv3JUV2tefA=;
 b=ZrZg0Rh86TycEXXEplog83YFmjr/NNf/6386xU5qgP/7xCOnRHuHdYeThFJnc+XeE0
 OFxpKeb7taJUksViH1OCrUAKgSPRoIqyy525Qi6QM0LpuMbteMm8Wu+JEFSL53QEasde
 SLyqAkJCGvSUg/lQjvpfsQR7I6nuGnz6AQ/ZDmfDPhOh/SzaFiKx189jpUX8wMS3T+OC
 0JoSR9jfOE3iOWDkhLqiYar1OQMc0KMXKuLhRMrchhVStSK35s0zSoMKkirsiuKwmbDc
 lZbGjrCI5UoYDXsrEJMh8GCiPKMZezqK3waiZFaKrUi5HwwAKQaS38oPsRAKgBTq/1KP
 1NTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RF9tMSi8dUbOvYs7dCX+h+xm+nS0CrCpDv3JUV2tefA=;
 b=srlPCj69fvrx4j5BUI9pKp0HlpusfZIQ+uiv1ZE8bhcJhMb/aV5ujZuZ8GxUfVbaGk
 pYKGI7i5brgsj0kZ7xyBQAeX8EKwuflqBBSP8d9wIctf48CcoZc47ss7bWi9v+mhNx2u
 pDTBMZnERqxHXmKQ+Q0k1ZGjIhnAIbgFd1mAYEjszZPp/kzVdj0xnXWOb91foIFgGVGA
 4uxFCvoydkvO/ryYpZT4rhG2P5S1dIsXynI+KhbjoF3ACxNhVg0pKQGCA8ZYc5fWM9Yv
 zhehISgohUnEl2HSRWa5dy0z7tLHWDnyfzkYGEWu0c2saddsK6O3Lzqm/BhNSHEPERDo
 MDXg==
X-Gm-Message-State: AOAM533xxJg/2Taxnab4I53P5z1iwEmIEWRKMNGEAhUnNo0lix2lMAK4
 +bXrEwGS8JqdwvLq1EnDMAU=
X-Google-Smtp-Source: ABdhPJzlzKEMECvZ0NAIqiM5dWiJufBFH5suGqloUnvkafiU19mz0d5SFojYxhcVHmT4VEbT+m2bLg==
X-Received: by 2002:a05:6a00:1312:b0:4e1:58c4:ddfd with SMTP id
 j18-20020a056a00131200b004e158c4ddfdmr29158330pfu.65.1645613934569; 
 Wed, 23 Feb 2022 02:58:54 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id d8sm20275183pfl.163.2022.02.23.02.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 02:58:54 -0800 (PST)
Message-ID: <82382df1-4ff9-be5d-09a1-52874986545e@gmail.com>
Date: Wed, 23 Feb 2022 11:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <CAFEAcA8ggE0HHXwLAu4vCA=kLwo4moN1CvTJbjph=OTmnfOONg@mail.gmail.com>
 <d26a877d-f3ad-6186-6a22-1e09f93a3fae@gmail.com>
 <20220223084836.yapqj35tiocjios4@sirius.home.kraxel.org>
 <87zgmhlwjw.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <87zgmhlwjw.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Idan Horowitz <idan.horowitz@gmail.com>, Oleg Vasilev <me@svin.in>,
 Cleber Rosa <cleber@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Emilio Cota <cota@braap.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/2/22 11:10, Alex Bennée wrote:
> 
> Gerd Hoffmann <kraxel@redhat.com> writes:
> 
>>    Hi,
>>
>>>>> If you want to boot a guest using EDK2, you should use the images
>>>>> build by your distribution (/usr/share/qemu/edk2-aarch64-code.fd),
>>>>> not these images.
>>
>>> Then we should add edk2-aarch64 and edk2-ovmf to lcitool, to have
>>> the distrib images in our generated Docker images.
>>>
>>> Cleber, you added this test in commit 6fd52d671d ("Acceptance test:
>>> add "boot_linux" tests"), can you have a look?
>>
>> Well, it's not *that* simple.  Names are not consistent across
>> distributions.  I think if we want go that route we have to inspect
>> the *.json files in /usr/share/qemu/firmware to find the correct
>> distro firmware images.
>>
>> Also note that at least fedora ships both verbose and non-verbose
>> images ...
>>
>>      kraxel@sirius ~# rpm -ql edk2-aarch64
>>      [ ... ]
>>      /usr/share/edk2/aarch64/QEMU_EFI-pflash.raw
>>      /usr/share/edk2/aarch64/QEMU_EFI-silent-pflash.raw
>>      /usr/share/edk2/aarch64/QEMU_EFI.fd
>>      /usr/share/edk2/aarch64/QEMU_EFI.silent.fd
>>      /usr/share/edk2/aarch64/QEMU_VARS.fd
>>      [ ... ]
>>      /usr/share/qemu/firmware/60-edk2-aarch64.json
>>      /usr/share/qemu/firmware/70-edk2-aarch64-verbose.json
>>
>> ... so maybe it is an option to use the distro images for the bios
>> tables test cases too.
> 
> Debian isn't quite so free with it's use of disk space although:
> 
>    10:09:19 [root@zen:~] # dpkg -L qemu-efi-aarch64
>    /.
>    /usr
>    /usr/share
>    /usr/share/AAVMF
>    /usr/share/AAVMF/AAVMF_CODE.fd
>    /usr/share/AAVMF/AAVMF_VARS.fd
>    /usr/share/doc
>    /usr/share/doc/qemu-efi-aarch64
>    /usr/share/doc/qemu-efi-aarch64/changelog.Debian.gz
>    /usr/share/doc/qemu-efi-aarch64/copyright
>    /usr/share/qemu
>    /usr/share/qemu/firmware
>    /usr/share/qemu/firmware/60-edk2-aarch64.json
>    /usr/share/qemu-efi-aarch64
>    /usr/share/qemu-efi-aarch64/QEMU_EFI.fd
>    10:09:25 [root@zen:~] # md5sum /usr/share/AAVMF/AAVMF_CODE.fd /usr/share/qemu-efi-aarch64/QEMU_EFI.fd
>    573b65b6e04981abb5b10afc8f30feea  /usr/share/AAVMF/AAVMF_CODE.fd
>    99812e842b6b40add0d8f7766e0aac9e  /usr/share/qemu-efi-aarch64/QEMU_EFI.fd
>    10:09:37 [root@zen:~] # ls -lh /usr/share/AAVMF/AAVMF_CODE.fd /usr/share/qemu-efi-aarch64/QEMU_EFI.fd
>    -rw-r--r-- 1 root root  64M Aug 18  2021 /usr/share/AAVMF/AAVMF_CODE.fd
>    -rw-r--r-- 1 root root 2.0M Aug 18  2021 /usr/share/qemu-efi-aarch64/QEMU_EFI.fd
> 
> I think the QEMU_EFI.fd is the firmware and AAVF_CODE is the same
> firmware but packaged in the "right" size of flash file.
> 
> However if we are to use the distro version (or at least favour it) do
> we need to start encoding searches through common paths?
> 
> I'm also sympathetic to Peter's point that distros might just end up packaging
> what we give them in pc-bios and we'll be back to square one. I'd favour
> pc-bios having both a edk2-aarch64-code.fd and a edk2-aarch64-code-debug.fd.

Distro have security teams with crypto knowledge who track CVE vulns
and integrate fixes, often embedding their own certificates in the
UEFI image. They certainly don't use that old/unsecure version
QEMU provides (edk2-stable202008, current is edk2-stable202111).

