Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D6C64F19F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 20:17:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6G6x-0006na-M1; Fri, 16 Dec 2022 14:11:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p6G6v-0006mn-F0; Fri, 16 Dec 2022 14:11:09 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p6G6p-00079m-9T; Fri, 16 Dec 2022 14:11:08 -0500
Received: by mail-oi1-x232.google.com with SMTP id e205so2730517oif.11;
 Fri, 16 Dec 2022 11:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DGgasZbe+nbeaQD47kDP2TvPiT7vquSS0cydi/6k3dk=;
 b=CEb0mzUH/2bQ8Y75q6FOcnNWAJM9OhO+aFe4CDXgznV8ExxJcY7sUjCsMecR6ZdJuF
 5RYSBT2PsB3h4ul6FqzTvTHW4sI5QEmZr8NXNlWHK/mBEtSrufIUpCxx1q6q2S6M3tOF
 +r76qEywHHcX0AmUqmZyvAQgIRf/b1TBqfgpPW9Irv88Vjz3MlYtzGU8nf/KGseLM+e9
 2w59C18LnBBggrbgutmtW+EMkXNMAI51Hrb4x1gGHc5KQpWyWJnaMAwb1QapKmOFmhMM
 wexefdZ0ZBwe9xRYXfMg+YyAgbJrzVU+JooBp8+j5QGL0LSVZcLkh3KwT2cu87sYJl1x
 u+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DGgasZbe+nbeaQD47kDP2TvPiT7vquSS0cydi/6k3dk=;
 b=AzJ51GpUJy2vTUMLm5jSB9MZqRqROdHKrRlYaYag1oUJ47PuHkr0bmDCx5cR29+TIw
 Z8PjrorVhAGndIYLBeDx66HfglnoWOVPjbNZg9elqLkXdW/qlz9TkpRj/Ny5KGAoaSuK
 V9/du3lraqfE9Md7y3QfXcw7NqtVLzNphWZ1/dUWl41y5XH2g/ZEQne2j+qhFkMCASun
 zMdRmX8f9ASWAjN6m1wZgIcOA77Af+nJ6PSXlL7NV7eNwecvq4xTIDKwSRnt5hzlCZPZ
 XmxIUCBTPA9t7mi7WU1qaWyyKpqlOZ/ufoaL3ZOHKM2kKn7lw+kCgcjTpYNtYAF9btVN
 iTPg==
X-Gm-Message-State: AFqh2ko2U/ZdTJh7XRjYecr2h+64+ugtt3lWVWcC1acAiMxQ8ZWPJhQl
 76JHUCZTVft2Xdo11IAk+xE=
X-Google-Smtp-Source: AMrXdXsEMDjqfAfjZXlVP+e5mRFpXAvMtObai32rVXzPpfiJj4DCPZkPAa2UEOMonwr3B7x7BG2B7w==
X-Received: by 2002:a05:6808:308d:b0:35e:da33:21b with SMTP id
 bl13-20020a056808308d00b0035eda33021bmr4029469oib.45.1671217861253; 
 Fri, 16 Dec 2022 11:11:01 -0800 (PST)
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 l24-20020a9d6a98000000b006705e35c4e2sm1187063otq.35.2022.12.16.11.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 11:11:00 -0800 (PST)
Message-ID: <e8c3fdcb-81f1-7067-217c-c49e8748b84a@gmail.com>
Date: Fri, 16 Dec 2022 16:10:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by
 cpu_to_be64(HPTE)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang
 <jasowang@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-3-philmd@linaro.org>
 <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 12/13/22 10:51, Peter Maydell wrote:
> On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> The tswap64() calls introduced in commit 4be21d561d ("pseries:
>> savevm support for pseries machine") are used to store the HTAB
>> in the migration stream (see savevm_htab_handlers) and are in
>> big-endian format.
> 
> I think they're reading the run-time spapr->htab data structure
> (some of which is stuck onto the wire as a stream-of-bytes buffer
> and some of which is not). But either way, it's a target-endian
> data structure, because the code in hw/ppc/spapr_softmmu.c which
> reads and writes entries in it is using ldq_p() and stq_p(),
> and the current in-tree version of these macros is doing a
> "read host 64-bit and convert to/from target endianness wih tswap64".
> 
>>   #define HPTE(_table, _i)   (void *)(((uint64_t *)(_table)) + ((_i) * 2))
>> -#define HPTE_VALID(_hpte)  (tswap64(*((uint64_t *)(_hpte))) & HPTE64_V_VALID)
>> -#define HPTE_DIRTY(_hpte)  (tswap64(*((uint64_t *)(_hpte))) & HPTE64_V_HPTE_DIRTY)
>> -#define CLEAN_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) &= tswap64(~HPTE64_V_HPTE_DIRTY))
>> -#define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |= tswap64(HPTE64_V_HPTE_DIRTY))
>> +#define HPTE_VALID(_hpte)  (be64_to_cpu(*((uint64_t *)(_hpte))) & HPTE64_V_VALID)
>> +#define HPTE_DIRTY(_hpte)  (be64_to_cpu(*((uint64_t *)(_hpte))) & HPTE64_V_HPTE_DIRTY)
>> +#define CLEAN_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) &= cpu_to_be64(~HPTE64_V_HPTE_DIRTY))
>> +#define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |= cpu_to_be64(HPTE64_V_HPTE_DIRTY))
> 
> This means we now have one file that's accessing this data structure
> as "this is target-endian", and one file that's accessing it as
> "this is big-endian". It happens that that ends up meaning the same
> thing because PPC is always TARGET_BIG_ENDIAN, but it seems a bit
> inconsistent.
> 
> We should decide whether we're thinking of the data structure
> as target-endian or big-endian and change all the accessors
> appropriately (or none of them -- currently we're completely
> consistent about treating it as "target endian", I think).

Yes, most if not all accesses are being handled as "target endian", even
though the target is always big endian.

IIUC the idea behind Phil's cleanups is exactly to replace uses of
"target-something" if the endianess of the host is irrelevant, which
is the case for ppc64. We would then change the semantics of the code
gradually to make it consistent again.

However, I don't feel comfortable acking this patch alone since 4be21d561d
is from David and I don't know if there's a great design behind the use of
tswap64() to manipulate the hpte. David, would you care to comment?



Daniel

  

> 
> I also think that "cast a pointer into a byte-array to uint64_t*
> and then dereference it" is less preferable than using ldq_p()
> and stq_p(), but that's arguably a separate thing.
> 
> thanks
> -- PMM

