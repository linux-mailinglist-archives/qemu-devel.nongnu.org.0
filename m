Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC6B49D348
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 21:16:14 +0100 (CET)
Received: from localhost ([::1]:41636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCoiD-0008FK-32
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 15:16:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nCoc8-0004gZ-7N; Wed, 26 Jan 2022 15:09:57 -0500
Received: from [2607:f8b0:4864:20::333] (port=37610
 helo=mail-ot1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nCoc6-0004ze-HO; Wed, 26 Jan 2022 15:09:55 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 g15-20020a9d6b0f000000b005a062b0dc12so418518otp.4; 
 Wed, 26 Jan 2022 12:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OJ3P9foEQhQyl7RWH5Cjovn5Ohlov0UqOoNZXGH8ieU=;
 b=DRfm4AzuA1fqtx/n/Ok9i/Yq62BnTLOfwZ9VLX9hUkhPXlt3ukNAQ+7KrL6h3EdUFj
 1ft5IOU/khAC+WgnwW7JUYmzydAUQIQXbPmC3gXJngCd6836M52qWg9AUwyAi2SAn4HT
 dJ6iCrzy0Z3/F1Ka/xwFEtKI+VUknE8Cou4Def1gRw9bT3QAXpgd/Ckv8LFKgx0EdROG
 dOwr62TXoN1H5Mp+vlut1K7TXEc1yV56s1NGtJF7NhjTfc5+kCi4emTjoTwoCEWNIrbR
 oOTfFs8qcyvKIhb6FjhUcPMVZ/05eOWhKeXlMzy0J0Ju9m0OoMpYRAqyVg4N1My/wHb/
 l40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OJ3P9foEQhQyl7RWH5Cjovn5Ohlov0UqOoNZXGH8ieU=;
 b=Tlur2lYH2CpwddLFwQqWMIzv/JcoPIdFRUuKLDF00XJYbKmNXeROSY8S9/PjPt0Wat
 +K764tmMBGfJLjY/Uc/HiA9J3Ytszi13Wyf6YR8PIrYIjv2BHTPfyZ4kMIAt2rkqi9X6
 F18vb9tIS9thPDu8fwI81EMK2d6EEqbtND1cL0kxhk/KHFTbw2Nlz65g5HIA/+VR6FcB
 Dtn/tlWGYfgQnOWk4tXXMQLhFVfT39ZbpJgcds5ECrSXSO9kpOwaUiCrQ5vUkjXXkINZ
 tq7CKdLJSGewf+GWfUwGgH706Nu9lm1zi6HfrKl9kIYV7KwioklXmz2evAyqclAJ/Yhu
 OiTg==
X-Gm-Message-State: AOAM531roqOWH/3EkTnztdrnGBWcqDjlpoR7ZamlFhV4NkS8ULgj7Hrf
 0h3v4x2cv+54zuFhnBYsDgRT2yyauBA=
X-Google-Smtp-Source: ABdhPJz1mBw+yTh9R/qQW919vlIJwXU1FeI8nsHXDuQ19tvmR5JgakNgZZTZxWgcnhki1A9bsuNhPw==
X-Received: by 2002:a9d:7c97:: with SMTP id q23mr265803otn.165.1643227792465; 
 Wed, 26 Jan 2022 12:09:52 -0800 (PST)
Received: from [192.168.10.222] (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id m7sm532251ots.32.2022.01.26.12.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 12:09:52 -0800 (PST)
Message-ID: <7a5857b0-f0dc-5dce-d7d5-80ca5fade3d0@gmail.com>
Date: Wed, 26 Jan 2022 17:09:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] ppc/pnv: initialize 'taddr' in
 pnv_phb3_translate_tve()
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
References: <20220126134137.791968-1-danielhb413@gmail.com>
 <20220126134137.791968-2-danielhb413@gmail.com>
 <582d8d5f-d46f-daba-5911-96b0a8f78bf4@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <582d8d5f-d46f-daba-5911-96b0a8f78bf4@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::333
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/26/22 14:28, Matheus K. Ferst wrote:
> On 26/01/2022 10:41, Daniel Henrique Barboza wrote:
>> The 'taddr' variable is left unintialized, being set only inside the
>> "while ((lev--) >= 0)" loop where we get the TCE address. The 'lev' var
>> is an int32_t that is being initiliazed by the GETFIELD() macro, which
>> returns an uint64_t.
>>
>> For a human reader this means that 'lev' will always be positive or zero.
>> But some compilers may beg to differ. 'lev' being an int32_t can in theory
>> be set as negative, and the "while ((lev--) >= 0)" loop might never be
>> reached, and 'taddr' will be left unitialized.
> 
> If we expect this code to execute at least once, wouldn't it be better to use a do-while? E.g.:
> 
> do {
>      lev--;
> 
>      /* Grab the TCE address */
>      taddr = base | (((addr >> sh) & ((1ul << tbl_shift) - 1)) << 3);
>      if (dma_memory_read(&address_space_memory, taddr, &tce,
>      /* ... */
>      }
>      sh -= tbl_shift;
>      base = tce & ~0xfffull;
> } while (lev >= 0);
> 
> Otherwise, I think we'll need to initialize tce too.

Initializing tce isn't necessary, at least as far as compiler warning goes,
because tce will be defaulted to zero and its current use (tce & 3, tce & 2,
tce & 1 operations) isn't offending the compiler. For now at least.

That said, I think using a do/while() loop is an idea that fixes the issue while
keeping the code flow, without having to add extra initializations, so I ended
up changing it as you suggested.


Thanks,


Daniel

> 
> Thanks,
> Matheus K. Ferst
> Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
> Analista de Software
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

