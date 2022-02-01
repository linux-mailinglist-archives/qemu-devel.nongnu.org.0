Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5EB4A5966
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 10:43:14 +0100 (CET)
Received: from localhost ([::1]:55860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEpgv-0001Tz-FG
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 04:43:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nEpba-0004Rq-3N
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:37:50 -0500
Received: from mout.gmx.net ([212.227.17.20]:57499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nEpbR-0005uU-D7
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643708222;
 bh=Tugx6kEklUIbyqOE3S8i4OxkjzUfBd6amuJbQtcPaQ8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=OjMgh6z2qyY78rd642XacvdObGEfpxXQgexbmWiNuA7vBs5lb+mtXqEB7n/2ieID1
 /gsm7FyLiGgrgEwMC0rosHX41K5NqfAECFbYmiLXfaJoJ1YdvC0DWTkPtGaKmHKQ7c
 8DPZYXCKTeHicr+XevRzHneeqc5zrUGHF7258f+A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.146.124]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUGiJ-1mp9Sf2rEx-00RFvN; Tue, 01
 Feb 2022 10:37:02 +0100
Message-ID: <31459e62-32f7-13fb-ad93-a96bd0095f76@gmx.de>
Date: Tue, 1 Feb 2022 10:37:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/6] hw/hppa: Allow up to 16 emulated CPUs
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220131213529.17404-1-deller@gmx.de>
 <20220131213529.17404-3-deller@gmx.de>
 <11f84353-dccb-60d8-77f0-2b0f7cb030a6@linaro.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <11f84353-dccb-60d8-77f0-2b0f7cb030a6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EwmFiVhJ75DyaGHTmvE2lSpyVKEGXZgjRwN1QAWgnrkW/iKxQJA
 14xmgyRwGjTAhWgPrh8s8YenjKWdGozxeZMIiBpJp5918Btcba4JQ/mTnIuCfSsjRe/x54F
 BzqVteAsdHyrh6MCivBkNDi1WfiQmxIJPwUgygUHNIPllUbBcKoGpcjMuicjCafeQiYUaGO
 G2DczQOZmSRq4rnRKk7FA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xKZvChggQ1o=:/s5T1X4138RCdZBnS6dfiD
 +9DwAMrChSthQG1PcoiW0DYKZ6YN/KvQxxLA498Usz6EFKR++qAN8J5DsvCVbckcTAZQJngLu
 U2stguZ4XdYZVukb5Xl5Jw9aq9sD+lBviVEhU8N7+bAttNei3o0+4qxFiHao8Do9SkvT3melM
 xAgsJ7AtcqbR64msSML29UnlJUIjRUEMQz4morYXdbvQzNgvzg/fnEXz1uv1Ju/P5LJOpxiNz
 qdRpcj1s6DARMo44JbdryvyS3ZDbE73w5zYLnlAN/k65YAt006vjtP8B7N/yeMkX/T4D5rIKp
 gJvDIZw7Ok35h6VMQQResQa0F/GAsqLliRf0dnRRWuUaGE98YbQg/4JwtPEWo7VFzhuDWwNBy
 QzUkTQA5wthzERPxGcNhhgJVEW96Z/n6qYeGLaA2eg08dyMoeZfLJ1M63jnHcEtJOBKQIBfYB
 uvanKcU+xtQJqYaKUkO31VY7agtlJIuRlfr6sdVREHJidbiigJYJf0KkWf+F0qZg1rXXqsmYN
 kXSdnjkHjgdt5/g9mY41QqjbH0qlKz1v80wRwQ75kmDTeC5cBue8WUmA533clBrk8Zw2Dxzkp
 Rj4CTupIgZ+qo9FLKfg2MxsfmsfcU5afsvGTiJ03HLx6vTFpbHQ2tv7IfFIH9qV8XXmTy2f65
 8L/H7rGpHROYNSndEPOurwNjL3M9vjWzzZkSKhuO4p7E1jefyXJX54MpE1e1yKWERUDBnLXHO
 tg51OEhwR7N8bXbpT2OcZa+re8IrUF9BORhnx3KXPC8p6JWj5C9hrTXufIZl0AgqAy947/bAO
 pweNcFPOkx3RQAdwhZARNHtEZJSmMKWqfowPz1tHwZQ33sJYWwuxdQC/B2wfL5mF1/SUNa3gy
 RFvEdZjhCydG/jYLcqBi2ZHgGUqxHvpXqGL9qGreawoXS3ajr/MGYutBnWi96KlmBMARCjM8N
 oUDqgBmUxXp8a+t/3uGK7v0UuMnWjPkE6K6gUk4VhiZ/vXANVIjp7iVTpxtLxNq6TUtQQekn6
 OS6BGeXAv2C3uHc019pOgwWN9ZMRKS7dfH7WMKfTYp6cCEzRNPacOn6UtBLSKVIUuSJ66t3nz
 KkiN0Dn8CnTS74=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/22 23:05, Richard Henderson wrote:
> On 2/1/22 08:35, Helge Deller wrote:
>> This brings the hppa_hardware.h file in sync with the copy in the
>> SeaBIOS-hppa sources.
>>
>> In order to support up to 16 CPUs, it's required to move the HPA for
>> MEMORY_HPA out of the address space of the 16th CPU.
>>
>> Signed-off-by: Helge Deller<deller@gmx.de>
>> ---
>> =C2=A0 hw/hppa/hppa_hardware.h | 5 +++--
>> =C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/hppa/hppa_hardware.h b/hw/hppa/hppa_hardware.h
>> index bc258895c9..5edf577563 100644
>> --- a/hw/hppa/hppa_hardware.h
>> +++ b/hw/hppa/hppa_hardware.h
>> @@ -25,7 +25,7 @@
>> =C2=A0 #define LASI_GFX_HPA=C2=A0=C2=A0=C2=A0 0xf8000000
>> =C2=A0 #define ARTIST_FB_ADDR=C2=A0 0xf9000000
>> =C2=A0 #define CPU_HPA=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0xfffb0000
>> -#define MEMORY_HPA=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xfffbf000
>> +#define MEMORY_HPA=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xfffff000
>
> You could mention that you're moving it *well* out of the way,
> perhaps.  I was first confused about why the gap between the two
> numbers was so large.

Yes, I will add that info to the commit message.


>> +#define PIM_STORAGE_SIZE 600=C2=A0=C2=A0=C2=A0 /* storage size of pdc_=
pim_toc_struct (64bit) */
>
> Belongs to the next patch?=C2=A0 Completely unused?

No, it's used internally in various places inside the SeaBIOS sources (and
is relevant for the TOC/NMI feature).
It's part of this patch, because this patch syncs the SeaBIOS and qemu fil=
es
(as stated in the first sentence of this commit message).

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

Helge

