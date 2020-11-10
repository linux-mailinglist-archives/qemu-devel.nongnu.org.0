Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7AC2AD1FE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 10:04:15 +0100 (CET)
Received: from localhost ([::1]:46138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcPZW-0000yM-Re
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 04:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kcPXn-0000MU-Jj
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:02:27 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kcPXl-00011E-JN
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:02:27 -0500
Received: by mail-wr1-x441.google.com with SMTP id s8so4690081wrw.10
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 01:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kTcH+k09Dblg/oH1qI69x4/FbPDxP6yovhpkI5W3TnA=;
 b=M+fRzSsfTkjtIEIJBZK0mXCI1CDJNMOIfnzxbPpsD4oZja4QQVr+qYXT7VRDsdZEYX
 o0I5P3gBqctcxJyUgbRKYN8WQ+RkEomIueFECMTcFZRiTzH4Xq4n5ilQMipxklD5tHsv
 dnsnJyIm80NyNPCqzpl5tsjrPyaD5dj6PEgSpPnVckOH8ieVIyifYZdpidSIxPk0z1I1
 sZhOva6MGfqvHVRmYnTgNo+2F9XYPrsgnaw9kRIeIVgsGBiWNsyK5VRhpL7KAlGWGS++
 2AXLEYTwDgqLXb/zvZHbCgyCzBDtKBUK7gn/Pg6sYRJZ0tN1xAiSUBe4wMJ8DLapHedg
 /kQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kTcH+k09Dblg/oH1qI69x4/FbPDxP6yovhpkI5W3TnA=;
 b=sgGEvn7tzHa/DC56EdY5MoAKRwwRQHGPLCkSKcEbRrotHhQ3ueJBqYrc2DfaBTQepy
 41t38ziUzHqy/Jggw1ltrJzBNJvBJAszrngiofLFiMzLCIcBQSjB+RnPSYJpnAB0LKVi
 +s+4krrhZ7VlMiNUjQg0ZqZoQOVW4xtnRPha0Q/1pVmLfyoxEoYNKr4O2wl5Mb/FKdld
 j7tuyYGefkjq6A6biOiOine7ifqe5hDrFnSs2qTnGTE2ZxrgFtuWjES1WOHgdR4yS9vH
 HZdGM5jc7YYaDxxxySLBmwDcyDyjQXYeCAkaKeukYdL4Y4CHhzFpHlG+brCXOoyRNu7q
 5sVw==
X-Gm-Message-State: AOAM533d8/hm6HGqP22IXVROKlrrcK/JuLZov8Fv4236C2PQn+lOqAn8
 qmekmZrtswkQFCp1+tqkqnI=
X-Google-Smtp-Source: ABdhPJy7EmNCZ9C0G78izScVrKajaH5Z3lhzekwEczur/cq5sMy2JsO7GIpfXUZQkq04oQYHuH04og==
X-Received: by 2002:adf:cd81:: with SMTP id q1mr23798539wrj.410.1604998943720; 
 Tue, 10 Nov 2020 01:02:23 -0800 (PST)
Received: from [192.168.1.103] ([151.33.227.77])
 by smtp.gmail.com with ESMTPSA id t13sm16883108wru.67.2020.11.10.01.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 01:02:22 -0800 (PST)
Subject: Re: [PATCH for-5.2 1/3] linux-user/sparc: Fix errors in
 target_ucontext structures
To: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201105212314.9628-1-peter.maydell@linaro.org>
 <20201105212314.9628-2-peter.maydell@linaro.org>
 <d93ed16f-9f9d-1009-7236-1eb72b512015@vivier.eu>
From: LemonBoy <thatlemon@gmail.com>
Message-ID: <383a44ab-23e6-c8c7-9cdc-9c65acac5caf@gmail.com>
Date: Tue, 10 Nov 2020 10:02:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d93ed16f-9f9d-1009-7236-1eb72b512015@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=thatlemon@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Laurent,
you probably want to also apply my patch for stack_t definitions [1] that
was mentioned in Peter Maydell's cover letter for the patch series.

[1] https://patchew.org/QEMU/e9d47692-ee92-009f-6007-0abc3f502b97@gmail.com/

On 10/11/20 07:53, Laurent Vivier wrote:
> Le 05/11/2020 à 22:23, Peter Maydell a écrit :
>> The various structs that make up the SPARC target_ucontext had some
>> errors:
>>  * target structures must not include fields which are host pointers,
>>    which might be the wrong size.  These should be abi_ulong instead
>>  * because we don't have the 'long double' part of the mcfpu_fregs
>>    union in our version of the target_mc_fpu struct, we need to
>>    manually force it to be 16-aligned
>>
>> In particular, the lack of 16-alignment caused sparc64_get_context()
>> and sparc64_set_context() to read and write all the registers at the
>> wrong offset, which triggered a guest glibc stack check in
>> siglongjmp:
>>   *** longjmp causes uninitialized stack frame ***: terminated
>> when trying to run bash.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  linux-user/sparc/signal.c | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
>> index d796f50f665..57ea1593bfc 100644
>> --- a/linux-user/sparc/signal.c
>> +++ b/linux-user/sparc/signal.c
>> @@ -349,10 +349,15 @@ typedef abi_ulong target_mc_greg_t;
>>  typedef target_mc_greg_t target_mc_gregset_t[SPARC_MC_NGREG];
>>  
>>  struct target_mc_fq {
>> -    abi_ulong *mcfq_addr;
>> +    abi_ulong mcfq_addr;
>>      uint32_t mcfq_insn;
>>  };
>>  
>> +/*
>> + * Note the manual 16-alignment; the kernel gets this because it
>> + * includes a "long double qregs[16]" in the mcpu_fregs union,
>> + * which we can't do.
>> + */
>>  struct target_mc_fpu {
>>      union {
>>          uint32_t sregs[32];
>> @@ -362,11 +367,11 @@ struct target_mc_fpu {
>>      abi_ulong mcfpu_fsr;
>>      abi_ulong mcfpu_fprs;
>>      abi_ulong mcfpu_gsr;
>> -    struct target_mc_fq *mcfpu_fq;
>> +    abi_ulong mcfpu_fq;
>>      unsigned char mcfpu_qcnt;
>>      unsigned char mcfpu_qentsz;
>>      unsigned char mcfpu_enab;
>> -};
>> +} __attribute__((aligned(16)));
>>  typedef struct target_mc_fpu target_mc_fpu_t;
>>  
>>  typedef struct {
>> @@ -377,7 +382,7 @@ typedef struct {
>>  } target_mcontext_t;
>>  
>>  struct target_ucontext {
>> -    struct target_ucontext *tuc_link;
>> +    abi_ulong tuc_link;
>>      abi_ulong tuc_flags;
>>      target_sigset_t tuc_sigmask;
>>      target_mcontext_t tuc_mcontext;
>>
> 
> Applied to my linux-user-for-5.2 branch.
> 
> Thanks,
> Laurent
> 

