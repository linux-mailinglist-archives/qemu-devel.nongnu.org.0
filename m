Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2651BC0F4
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 16:15:42 +0200 (CEST)
Received: from localhost ([::1]:59970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTR1R-0003yX-Fh
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 10:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42298)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jTR00-0002Ub-Tp
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 10:14:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jTQzz-0004zn-Ub
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 10:14:12 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:57281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jTQzz-0004yH-8m
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 10:14:11 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MBDrM-1jK2nL1Zi2-00ChrK; Tue, 28 Apr 2020 16:13:57 +0200
To: KONRAD Frederic <frederic.konrad@adacore.com>
References: <1587391275-12748-1-git-send-email-frederic.konrad@adacore.com>
 <41ff1564-36ee-1028-b377-9bf9a82de689@vivier.eu>
 <99b80245-4109-03c4-4c7c-e562477ec76b@adacore.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH v1] target/m68k: fix gdb for m68xxx
Message-ID: <e506659a-6d0b-dc62-2ba4-00a55579b084@vivier.eu>
Date: Tue, 28 Apr 2020 16:13:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <99b80245-4109-03c4-4c7c-e562477ec76b@adacore.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Pnr8K/5BJ7HjeR4eelKIjN+mHQBWu3WEVIJSKXdjFOieXBfEUHr
 baSsLh9cmG/yXW4lyaIiVKB6fYSFfQBVQ5J7nC5GhNPcXr93mbqGpQ/9J5jkN6MLSKZf7as
 fDHO4RgsLJImAOCjqpPXuEd5AAUzdt62Rm6goNwW/BYcZNjFg461YVCyAR4GpUZke1FRfdv
 Fwr12ySZ5dBRLTZO3n9SA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZhzjoJpzZTs=:mFtsRFE9sWo/RE1CaGWzSr
 tODlgmwkM76P0kqxiI8EV5OnCYd6YybJ2U4qKSJaTdXewwnUOtuK2LwhBS6sMsU5NlNx7pWD7
 1rF4pkqBdwOiHIDXmeiibtEQcVe3Run2K4sBDskwAGlPEPNfVKUkyf/3NZbt1772S4t7PoQ7m
 jlyAALiykGBFuPjNqC+ztNCwKq057WAPq95sbvNRvve767qI+WHqSIxxsk7neTbPxpVNDhD1z
 ix50k1G8C9/uosgZDBOyqzr6VN31lQQjif4yhcvNfGKfZDoFSfWAo+MVBPoo87/1qGjew79lE
 ve1r8klqIxWp0v/SMnb/S2h/kr5klPtDVq4MZNNmDj57puJtx+by3dC/mTgTj31Kkg/1pNlTN
 E1ChA5Cb6oPI+NMWv3KEgi6v+RPxHMqsjcBcwkxZucBmkCTSH3rGijJAZREFnXKvTExI/FeI/
 qEn2eWsYbmJKE/XyqS5NDH12ZmWEV+w+R74rfLtSKysKdmWzTjmF5wI/trp3/1CmtAHZF9YxJ
 9yOz/bWgrbzgmft88kV8romJ1ZHvPD2KFppXIuRK9JrXg+2oc7g/6caYUHYSpsHf6x8zu+Vn7
 wsF5ZFSvvHMnCXsxWOni0NxDkCaHVv3FWuXMAUF+H+vrJdZtTVYoOkSQExdacwKHp5jn0XSQZ
 M0xGke2ZIQnaNsoAHZQ7rbeaX8q+qOIy2nwa9768jKEuSpG1QQYhHsEEA+QMXz8GbV4J/v3Ha
 iBE9BCkVj+4XZetNuSezIwnXn8/L628stApfvy8y34DjhjWik6g04uXSsELjh1ozLcayOweDo
 AqPyKmREhmibsVlQPJiVNna7BPoNt1c8ipY5OWiTN8nb+C5UwFiBsn142zAYhgMGLx6BKVa
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 10:14:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
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
Cc: huth@tuxfamily.org, alex.bennee@linaro.org, f4bug@amsat.org,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 pierre@freepascal.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 28/04/2020 à 15:19, KONRAD Frederic a écrit :
> 
> 
> Le 4/27/20 à 9:53 AM, Laurent Vivier a écrit :
>> Le 20/04/2020 à 16:01, frederic.konrad@adacore.com a écrit :
>>> From: KONRAD Frederic <frederic.konrad@adacore.com>
...
>> I would prefer to have two macros with no class parameter, something
>> like DEFINE_M68K_CPU_TYPE_M68K() and DEFINE_M68K_CPU_TYPE_CF().
>>
>>>   #define DEFINE_M68K_CPU_TYPE(cpu_model, initfn) \
>>>       {                                           \
>>>           .name = M68K_CPU_TYPE_NAME(cpu_model),  \
>>> @@ -314,11 +329,16 @@ static const TypeInfo m68k_cpus_type_infos[] = {
>>>           .class_size = sizeof(M68kCPUClass),
>>>           .class_init = m68k_cpu_class_init,
>>>       },
>>> -    DEFINE_M68K_CPU_TYPE("m68000", m68000_cpu_initfn),
>>> -    DEFINE_M68K_CPU_TYPE("m68020", m68020_cpu_initfn),
>>> -    DEFINE_M68K_CPU_TYPE("m68030", m68030_cpu_initfn),
>>> -    DEFINE_M68K_CPU_TYPE("m68040", m68040_cpu_initfn),
>>> -    DEFINE_M68K_CPU_TYPE("m68060", m68060_cpu_initfn),
>>> +    DEFINE_M68K_CPU_TYPE_WITH_CLASS("m68000", m68000_cpu_initfn,
>>> +                                    m68k_cpu_class_init_m68k_core),
>>> +    DEFINE_M68K_CPU_TYPE_WITH_CLASS("m68020", m68020_cpu_initfn,
>>> +                                    m68k_cpu_class_init_m68k_core),
>>> +    DEFINE_M68K_CPU_TYPE_WITH_CLASS("m68030", m68030_cpu_initfn,
>>> +                                    m68k_cpu_class_init_m68k_core),
>>> +    DEFINE_M68K_CPU_TYPE_WITH_CLASS("m68040", m68040_cpu_initfn,
>>> +                                    m68k_cpu_class_init_m68k_core),
>>> +    DEFINE_M68K_CPU_TYPE_WITH_CLASS("m68060", m68060_cpu_initfn,
>>> +                                    m68k_cpu_class_init_m68k_core),
>>>       DEFINE_M68K_CPU_TYPE("m5206", m5206_cpu_initfn),
>>>       DEFINE_M68K_CPU_TYPE("m5208", m5208_cpu_initfn),
>>>       DEFINE_M68K_CPU_TYPE("cfv4e", cfv4e_cpu_initfn),
> 
> But what about the "any" which is out of context here?
> 
>     DEFINE_M68K_CPU_TYPE("any", any_cpu_initfn),
> 
> Should it be TYPE_M68K or TYPE_CF in which case which xml will it take? 
> I guess
> we can take TYPE_CF so it doesn't change from what is done today.
> 

Yes, "any" has been introduced with coldfire CPUs and defines CF_FPU, so
it uses 64bit float registers.

Thanks,
Laurent

