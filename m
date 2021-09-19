Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F3D410CF7
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:49:36 +0200 (CEST)
Received: from localhost ([::1]:34500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1se-0001tm-2x
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1pY-000086-MH; Sun, 19 Sep 2021 14:46:27 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1pX-00030m-9Z; Sun, 19 Sep 2021 14:46:24 -0400
Received: by mail-wm1-x333.google.com with SMTP id e26so11390274wmk.2;
 Sun, 19 Sep 2021 11:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rs3p8nPSZzE5voTGBUsiwJybz2sepkGEn+18uz25k74=;
 b=FieyksIqP8c96U3BbdVVPYjwMHhZ6LcRVeU7WdX93GqRfEs5un1kpEL1Ed7Cjdt4Xw
 61u47n4FvRxGIBmJy2a9tPL/17mGejsiXb/t2ay1cDki7uqOFSNuMppbJdx3Rs+GWztp
 MMLcWKqkFegDNgfc81meys+18mse2dSPmXOD5580IQZJkhhodqZg8IiAAg2cTi07qcIV
 S6PHo/N76wn44OyMarV2vE8SAHxm0aXc9Thggx23Op7/cvAcadEZgrlctKNqaoBDcEME
 CAUry6Tx6QS1ShHUjyRLLEotSulXHxa+TeZjHEy/alc48p0aN9YBvCyeO3Zj5oRej3Q1
 0GMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rs3p8nPSZzE5voTGBUsiwJybz2sepkGEn+18uz25k74=;
 b=J9S02nAE5f4c+b4ESyKMPUmXIEePlEO72Mmg/Q1zT316SfydGS9PCYJDW4EHDH0JEP
 Qm7FyC10w63PRqP/1Zb0k3VQhbzBS6ttOSOabSb1ANZHRfQVqEaKfKTL35JR9BIdvRnD
 UE1d6BFFjCnSgJF0irair6ioXns3wdWXnZtu0pUFq4OCoZ6plfAUDWReSme3gO1nfT9b
 qE4QdU8nrzODF6I8Y75AXLvUomV9kVyl7mU/1f38aL7MSQJ6NRAmV0tdgScW8C7aseDE
 KkOpI8jl0Ut4YwtyMzdA6ABnOLt0NflsELm+MnoaY/trT1rgP0hKrP4vnaqwXY+hO1/C
 RThA==
X-Gm-Message-State: AOAM530PI/WOMxBkR/j40bzkC/prRF17vHMdb+myD0VWw47xqjgQ/32Y
 2Hvs4UCxaTDtW6oygiOd7+4=
X-Google-Smtp-Source: ABdhPJwnEUWb4kzwO1Ok3v/1Qvwo4yJp26U58+iK3TVdJxhSatXSveXa1tJQufK8MFQv69m1MzKQfA==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr21509860wmh.140.1632077180442; 
 Sun, 19 Sep 2021 11:46:20 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id v20sm13573379wra.73.2021.09.19.11.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:46:19 -0700 (PDT)
Message-ID: <384c4dd7-312b-9c52-ada5-138840c0217a@amsat.org>
Date: Sun, 19 Sep 2021 20:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: high cpu usage in idle state
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Ali Vatankhah <alivatankhah72@gmail.com>
References: <CABip9V9nwDNAEg-620hG2r5pyhw_rig+2nf9Ja3s=WA-wmH=jQ@mail.gmail.com>
 <e53eecec-8897-767a-149f-51faffd76d67@amsat.org>
 <CABip9V88osKWXBqSLDscAup6wAoh+_W-6WZR_Okwj9GG60nGCw@mail.gmail.com>
 <CAFEAcA8Mj=icVHh7Jw4UjRhm6W=M7=gpZCfrPuQrQMnaCKAC+A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAFEAcA8Mj=icVHh7Jw4UjRhm6W=M7=gpZCfrPuQrQMnaCKAC+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/19/21 20:06, Peter Maydell wrote:
> On Sat, 18 Sept 2021 at 09:12, Ali Vatankhah <alivatankhah72@gmail.com> wrote:
>> then to check what instructions are executing I run this command:
>>
>> qemu-system-ppc64 -nographic -M ppce500 -cpu e5500 -kernel uImage -singlestep -d in_asm -D target_asm.log
>>
>> Obviously this results in a Kernel panic, but the point is that after panic there is no guest
>>  instruction running as there is no more log in the file but still CPU usage is 100.
> 
> The lack of further in_asm logging does not mean that guest instructions
> are not running. in_asm logging happens at *translate* time,
> which is to say the first time QEMU encounters any particular instruction.
> After translation, QEMU can re-execute the translated code for that
> instruction many times, and it will not show up in in_asm logs again.
> In particular, if the guest CPU is doing either of:
>  * a tight loop
>  * an infinite loop of taking exceptions
> it will just be re-running code that has been seen before.
> Probably the code the kernel runs after it panic()s is just a loop.
> 
> If you want to log execution, you need to add 'exec' and/or 'cpu' to
> your -d logging. (Warning: this can generate a lot of logging output
> and massively slow down execution as a result.)

In the "infinite loop exception" case, '-d int' might be sufficient,
before using 'exec/cpu', since you'll see the exception raise over
and over.

>> also run this command to check generated host assembly code:
>>
>> qemu-system-ppc64 -nographic -M ppce500 -cpu e5500 -kernel uImage -singlestep -d out_asm -D host_asm.log
> 
> out_asm also is logged only at translate time, not at execution time.
> 
> -- PMM
> 

