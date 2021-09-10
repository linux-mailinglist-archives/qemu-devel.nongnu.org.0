Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEA5406C86
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 14:55:00 +0200 (CEST)
Received: from localhost ([::1]:57716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOg3X-0006Us-5h
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 08:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOg1D-0004JZ-QH
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:52:35 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:47066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOg1C-00029j-2a
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:52:35 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x6so2458392wrv.13
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 05:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pyMVKsJC9IMJEyyt7zYMqg206lc2D05nTbtq5mVe8C0=;
 b=LkjJ5ePaPlkh8F0i6P95wy0zt6ifIHL2XT6eN1uOSI/Bwrh/bACI57d/GWubCZ7m5m
 oH14d44kG6nLh/oj9xKK1pdeMPff3dmP6xGAP6VKXUKjMVz/YBlA8aGTNvtidJxtWZLx
 oKF3TjZGYDA7w90E1sk/InTTRqLfj/IPsHDWU8rlcRq34sbraYKR1PnYcbKAA+OrnZ/d
 ngKZIP9BnmDJk03yaOuTz3s1i/yMFkIDkNHoL8/Emzw9S+eGJaQU7jb3bAyoTx9OfnyP
 G8VOAsSAaRnjkv8KNiEtVUNSxvFPRnjvEerStgZZggRybM33Fh11w9RdHofCgdrtDSY2
 ldLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pyMVKsJC9IMJEyyt7zYMqg206lc2D05nTbtq5mVe8C0=;
 b=HVCEzrL8k4GH1A9P/TNiBXGBRZK7gGI6a6GO9A7H2bKCKmMTRkHAJPvX1va0+R8oai
 d9BjuyXmjO7Y5QJ6HKnVR6HpUPPVevgshNk7e8pJzH3TSU3trtkjqXgVpo99lpVBYLcL
 qrSbWgQeVAQKzpx6kiwQ/avRWO2eKj+Ly1VCVad6KZXYsLd8IWqan3shtjy3lKHhN7BH
 e9p8Oh9ERYaij+GkBxRvJ1jc4u705heIhQShztueZNe9UvRNM08xrDZEbsmC3WMZPaVi
 ttgBfSiT30YrfX+5L0m+JF2KBh5paqgXxY3l9TXMW7fFaYzg3y1O/QiQU8ELZ7IGCq1Y
 Yp3w==
X-Gm-Message-State: AOAM5305oqRE2jhiHr42QeBfuuYJFZr5Q1sXNGhe328tz+ljv6m0q+Dp
 3uHgCNxS0TSKSz8ag+z1bRJmLQ==
X-Google-Smtp-Source: ABdhPJwQ3TjGzS716ix4gnD5CtchvPOHTv32o54CNaURyQMLlj+CEfAZbMjCIOB5+uNkeTDMvCUj5g==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr9241814wrr.376.1631278352191; 
 Fri, 10 Sep 2021 05:52:32 -0700 (PDT)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id u16sm4614973wmc.41.2021.09.10.05.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 05:52:31 -0700 (PDT)
Subject: Re: [PATCH v4 17/21] LoongArch Linux User Emulation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org, chenhuacai@gmail.com
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-18-git-send-email-gaosong@loongson.cn>
 <4e47e1a7-d946-f8ec-a9a1-aadc6eeb7941@linaro.org>
 <3e7fd708-fe13-8163-2926-d1baa75e3b10@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6349ca9-2483-2f83-f5cb-f9e1f740a404@linaro.org>
Date: Fri, 10 Sep 2021 14:52:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3e7fd708-fe13-8163-2926-d1baa75e3b10@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.349,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, philmd@redhat.com,
 atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com, groug@kaod.org,
 maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 11:50 AM, Song Gao wrote:
> 
> Hi Richard,
> 
> On 09/05/2021 06:04 PM, Richard Henderson wrote:
>>> +struct sigframe {
>>> +    uint32_t sf_ass[4];             /* argument save space for o32 */
>>
>> Surely there is no "o32" for loongarch?
>>
> 
> Yes, qemu only support 64bit. but the kernel has 'o32'.  Should we have to be consistent with the kernel?

Yes, you need to be consistent with the kernel.  However... the kernel is not yet 
upstream, and therefore the ABI is (officially) still malleable.

Anyway, this padding was copied from mips o32, and should not have been.  Looking at the 
loongarch gcc sources, REG_PARM_STACK_SPACE is always 0, and thus the 4 words reserved 
here are never used.

I see that gcc/libgcc/config/loongarch/linux-unwind.h builds in knowledge of these unused 
words.  I also see that linux/arch/loongarch/vdso/sigreturn.S does not provide correct 
unwind info.  Certainly the kernel vdso should be fixed, so that code within gcc should 
not be needed.  At which point the ABI for the signal frame is entirely private to the kernel.


r~

