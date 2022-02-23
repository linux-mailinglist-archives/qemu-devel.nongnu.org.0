Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EC04C1452
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 14:39:08 +0100 (CET)
Received: from localhost ([::1]:36402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMrrH-0003yz-3U
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 08:39:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMrmr-0001Vx-B4; Wed, 23 Feb 2022 08:34:36 -0500
Received: from [2607:f8b0:4864:20::533] (port=40923
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMrmp-0001a4-FH; Wed, 23 Feb 2022 08:34:33 -0500
Received: by mail-pg1-x533.google.com with SMTP id w37so13554779pga.7;
 Wed, 23 Feb 2022 05:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VCh4vuuX/P112tsW9ayY6uH9gaq3mhObhMfWnbW5l8w=;
 b=g7pjR9JlYrhGzhIa0SerGNXPZdANzlA7BE2vCJgY0lZbxr5ZpE1zEF4iDDjFnrJyp5
 gH+9zN+JoAAEdRehLlh2DPgWp1raJIZZPUZqNcw2dWCjdgKo0tVlXkLu7oDOeYyatcgQ
 SrBFRL2gaUMVYIA29YCWCZzWA2EzWCkvHJeNukqut5e7rHnz+2pMG/7FUbRd+DKXf+bX
 YVcN4fM32BnLUPBQac+VZ75nLoBJaeb1W03q7LhnxRY5mWD19mtbx3Jce7B3BVHBSYWL
 913mroboYdwmF2KNMLsdDoDK7mWMJX/fXDxU7iorzDT4GzmRJpKMOB/bCaVheZ5aretN
 kQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VCh4vuuX/P112tsW9ayY6uH9gaq3mhObhMfWnbW5l8w=;
 b=oMssbvuOTf24SXoCSpeA40ecNOlZEaesMDAQ4IDx2HJKfyzgW8gnOAlxciymJEVTdC
 8oMUF+DUa6SO7JsPuWiG4hQzrWm8wQ5AL/UfiFJr2c1f+zeYQaGUMBxWFir3OLqOt91r
 4m7VIhm8PM/pvAxrW+k2jtxgEBPX7XzZQAxx9QDxFVUzwSzFPNJtsh0Qgvkcr+NNZKK8
 sWZLM3ifeSgWZO5HeP9EU/MD0ju2NUAwa9oA9D2lsmH8bPJ9UwiNyO/UK7+u3qsJpVud
 3cHshwHiL1ltVAPWvS5Udmi39TQAAM33df/84Hcr8kVKQr+H9FZaAF5UeCpg4KYjd3i5
 HR6Q==
X-Gm-Message-State: AOAM530FpGQLpzFR7ZJtGvZM1Dw74wwx5pqXbPtEkql8Zd2+vOxN5SzA
 IorwEUwN66pS6T7/vnUk6OU=
X-Google-Smtp-Source: ABdhPJx2tnTh5YTLqmhumTeKL6wRqtrXXGxVCFrFM9//rJsBJYnT24j9FwRy71fC8a4pPm5HoGHVVw==
X-Received: by 2002:a63:f60a:0:b0:373:4c34:1aaf with SMTP id
 m10-20020a63f60a000000b003734c341aafmr23776819pgh.268.1645623269918; 
 Wed, 23 Feb 2022 05:34:29 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id kk13sm2569269pjb.44.2022.02.23.05.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 05:34:29 -0800 (PST)
Message-ID: <e9f70381-03f2-9582-8ad6-e9252d3195ab@gmail.com>
Date: Wed, 23 Feb 2022 14:34:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <YhYVVnVSL8K1S4MC@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <YhYVVnVSL8K1S4MC@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x533.google.com
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
 Cleber Rosa <cleber@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Oleg Vasilev <me@svin.in>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Idan Horowitz <idan.horowitz@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Emilio Cota <cota@braap.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/2/22 12:07, Daniel P. Berrangé wrote:
> On Tue, Feb 22, 2022 at 06:33:41PM +0100, Philippe Mathieu-Daudé wrote:
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
>>>
>>> NB, Laszlo is no longer  maintaining EDK2 in QEMU, it was handed
>>> over to Philippe.  I'm CC'ing Gerd too since he's a reviewer and
>>> an EDK2 contributor taking over from Lazslo in EDK2 community
>>
>> We need the DEBUG profile to ensure the bios-tables-tests work.
> 
> Can you elaborate on what bios-tables-tests needs this for, and
> what coverage we would loose by disabling DEBUG.

Maybe it was only required when the tests were developed...
I'll defer that question to Igor.

> It may well be a better tradeoff to sacrifice part of bios-tables-tests
> in favour of shipping more broadly usable images without DEBUG.

Why not, if users are aware/happy to use a unsafe image with various
unfixed CVEs.

Removing the debug profile is as simple as this one-line patch:

-- >8 --
diff --git a/roms/edk2-build.sh b/roms/edk2-build.sh
index d5391c7637..ea79dc27a2 100755
--- a/roms/edk2-build.sh
+++ b/roms/edk2-build.sh
@@ -50,6 +50,6 @@ qemu_edk2_set_cross_env "$emulation_target"
  build \
    --cmd-len=65536 \
    -n "$edk2_thread_count" \
-  --buildtarget=DEBUG \
+  --buildtarget=RELEASE \
    --tagname="$edk2_toolchain" \
    "${args[@]}"
---


