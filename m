Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDECE69DDF2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:34:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPxd-0004N3-94; Tue, 21 Feb 2023 05:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUPxb-0004Mk-32
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:33:23 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUPxZ-0006Qx-4X
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:33:22 -0500
Received: by mail-wr1-x435.google.com with SMTP id p8so3992623wrt.12
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 02:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ThiswCUUu6LVMqhF2bPFX+Q+Uy4v09AKQRGfeiM+qjc=;
 b=Ur9PeMyssM3kDDRQmssd++esmZciXhR45zCp2A4MsLz95Mf+yKtlQK0HBqjr7ESpHZ
 fmXHNXYkAYT8rBpNi1/dzAEtBY9EREAXJzjRTWZyy8FzeRFX67HKMIzWNR/o0Ju+YaP8
 k9GaaZ/t/dxf/UKNx5W15wsv3eCnsdgpePDrn6Iw/W1lesjTTZmiJnF6BIQ5+NTL25iG
 9IEQgns0Rju2r38XwmFhIn9JUT32ZrIL/+XD1MNlN69lehf2IFW99MeQMn9sl9HjCbIA
 zv3WhSwfU2pKRuBFL1WkWwN2MUF6IjYE4MmHvKMajFuMTkQ0hgG/O3M7Zg8UcVPFeayO
 eJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ThiswCUUu6LVMqhF2bPFX+Q+Uy4v09AKQRGfeiM+qjc=;
 b=jKmhyju4fVwEBcLyoCUXJkxiKTS8Q9ZCDKdtJT5lADDRJn7ypGg+MPPgMnD2XtGZQA
 ig/evX3FUtGR2FuPphRDCsrGGRlVdr1JFDBk4cGyxvSspKv1JJj97JkDBgG2i8nQqOpE
 ncEajlMR1CEVFL5HejerVeuaYNXhSeuPPkTir/m26tg1pDwfj5uIXtgFG+paAzkigjGy
 dTr53z4AiO2ZSJPCcmfxQBbTdMdxz2LCeXUlu8+s3HfXnHOPmBtcoP3FZPPbuzij3D14
 jolmXK20aijL5hGMmvoujSBeF1xkWvIBqO5rx9GHOk1upc1W4At7p49NsNMksWJgMZgL
 rBQg==
X-Gm-Message-State: AO0yUKUDhPIymXVSnnagrD2+VfLcKpTuIHPGL2grXYgC2ku5MsSHM1tc
 Q8cXzQjFPUlu4fKNFDl3TYV8Dw==
X-Google-Smtp-Source: AK7set/bi0iGkEqa5IlVdujkftpyeKze/evAsWD2LO484HakKEHibzpMo3t3qhOqQ+rDPzqCwpKxQQ==
X-Received: by 2002:a5d:6548:0:b0:2bf:9527:ce62 with SMTP id
 z8-20020a5d6548000000b002bf9527ce62mr4362410wrv.60.1676975599173; 
 Tue, 21 Feb 2023 02:33:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z14-20020a5d654e000000b002c5801aa9b0sm4586507wrv.40.2023.02.21.02.33.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:33:18 -0800 (PST)
Message-ID: <c09dcebd-9a23-9641-da7e-91fca4589607@linaro.org>
Date: Tue, 21 Feb 2023 11:33:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/4] sysemu/os-win32: fix setjmp/longjmp on
 windows-arm64
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
 <20230220111215.27471-3-pierrick.bouvier@linaro.org>
 <6de4e5b4-aeb1-3888-0979-01e4778eba93@linaro.org>
 <eb3116cf-dd6d-6a50-19cd-53614105e5de@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <eb3116cf-dd6d-6a50-19cd-53614105e5de@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/2/23 10:47, Pierrick Bouvier wrote:
> @Philippe Mathieu-Daudé, is that version satisfying for you, regarding 
> your initial comments about setjmp/longjmp detection in meson?

Yes, the meson check is what I had in mind.

> I can integrate more changes if needed.
> 
> Thanks,
> Pierrick
> 
> On 2/20/23 16:16, Pierrick Bouvier wrote:
>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> On 2/20/23 12:12, Pierrick Bouvier wrote:
>>> Windows implementation of setjmp/longjmp is done in
>>> C:/WINDOWS/system32/ucrtbase.dll. Alas, on arm64, it seems to *always*
>>> perform stack unwinding, which crashes from generated code.
>>>
>>> By using alternative implementation built in mingw, we avoid doing stack
>>> unwinding and this fixes crash when calling longjmp.
>>>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    include/sysemu/os-win32.h | 25 +++++++++++++++++++++++--
>>>    meson.build               | 24 ++++++++++++++++++++++++
>>>    2 files changed, 47 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
>>> index 5b38c7bd04..1f6c141d39 100644
>>> --- a/include/sysemu/os-win32.h
>>> +++ b/include/sysemu/os-win32.h
>>> @@ -51,14 +51,35 @@ typedef struct sockaddr_un {
>>>    extern "C" {
>>>    #endif
>>> -#if defined(_WIN64)
>>> +#if defined(__aarch64__)
>>> +#ifndef CONFIG_MINGW64_HAS_SETJMP_LONGJMP
>>> +#error mingw must provide setjmp/longjmp for windows-arm64

Per the meson error [*], this now seems impossible, thus we can
simply drop the CONFIG_MINGW64_HAS_SETJMP_LONGJMP definition?

>>> +#endif
>>> +/*
>>> + * On windows-arm64, setjmp is available in only one variant, and 
>>> longjmp always
>>> + * does stack unwinding. This crash with generated code.
>>> + * Thus, we use another implementation of setjmp (not windows one), 
>>> coming from
>>> + * mingw, which never performs stack unwinding.
>>> + */
>>> +#undef setjmp
>>> +#undef longjmp
>>> +/*
>>> + * These functions are not declared in setjmp.h because __aarch64__ 
>>> defines
>>> + * setjmp to _setjmpex instead. However, they are still defined in 
>>> libmingwex.a,
>>> + * which gets linked automatically.
>>> + */
>>> +extern int __mingw_setjmp(jmp_buf);
>>> +extern void __attribute__((noreturn)) __mingw_longjmp(jmp_buf, int);
>>> +#define setjmp(env) __mingw_setjmp(env)
>>> +#define longjmp(env, val) __mingw_longjmp(env, val)
>>> +#elif defined(_WIN64)
>>>    /* On w64, setjmp is implemented by _setjmp which needs a second 
>>> parameter.
>>>     * If this parameter is NULL, longjump does no stack unwinding.
>>>     * That is what we need for QEMU. Passing the value of register 
>>> rsp (default)
>>>     * lets longjmp try a stack unwinding which will crash with 
>>> generated code. */
>>>    # undef setjmp
>>>    # define setjmp(env) _setjmp(env, NULL)
>>> -#endif
>>> +#endif /* __aarch64__ */

This comment doesn't seem accurate. Maybe "64-bit"?

>>>    /* QEMU uses sigsetjmp()/siglongjmp() as the portable way to specify
>>>     * "longjmp and don't touch the signal masks". Since we know that the
>>>     * savemask parameter will always be zero we can safely define these
>>> diff --git a/meson.build b/meson.build
>>> index 4ba3bf3431..e968ed9e7a 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -2450,6 +2450,30 @@ if targetos == 'windows'
>>>        }''', name: '_lock_file and _unlock_file'))
>>>    endif
>>> +if targetos == 'windows'
>>> +  mingw_has_setjmp_longjmp = cc.links('''
>>> +    #include <setjmp.h>
>>> +    int main(void) {
>>> +      /*
>>> +       * These functions are not available in setjmp header, but may be
>>> +       * available at link time, from libmingwex.a.
>>> +       */
>>> +      extern int __mingw_setjmp(jmp_buf);
>>> +      extern void __attribute__((noreturn)) __mingw_longjmp(jmp_buf, 
>>> int);
>>> +      jmp_buf env;
>>> +      __mingw_setjmp(env);
>>> +      __mingw_longjmp(env, 0);
>>> +    }
>>> +  ''', name: 'mingw setjmp and longjmp')
>>> +
>>> +  config_host_data.set('CONFIG_MINGW64_HAS_SETJMP_LONGJMP',
>>> +                       mingw_has_setjmp_longjmp)
>>> +
>>> +  if cpu == 'aarch64' and not mingw_has_setjmp_longjmp
>>> +    error('mingw must provide setjmp/longjmp for windows-arm64')

(This is the [*] error I mentioned earlier).

>>> +  endif
>>> +endif
>>> +
>>>    ########################
>>>    # Target configuration #
>>>    ########################


