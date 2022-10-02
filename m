Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770895F2572
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 23:22:29 +0200 (CEST)
Received: from localhost ([::1]:55998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1of6Pq-0005d3-DG
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 17:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1of6OE-0004Ds-6q
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 17:20:46 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1of6OC-0004ap-4d
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 17:20:45 -0400
Received: by mail-pl1-x630.google.com with SMTP id z20so1618913plb.10
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 14:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date;
 bh=PrwAygBnHP9oKS84foELH69eMjhkyfHiC3xJCCz9iq8=;
 b=ls4yfO0RqzgzBnDDEFyNyWcMiDckbnqmmFAtNNoQWUwtjLSzO8E/OsxvFial4KPZtF
 kc7QMBmFt4lG+8nnSFkK8x2ICZA7kwPv+5dHwyA2bKL5KerS3TMOlyP6oL0RP38G81mB
 WcgGhZtMK5i2SLJzDXdyJAGzsEUuFLfCnOvyyQlrJUjLkQ/ERuHmvf5by5OZGIEt3fHj
 VpUUX6SL18fy5hyVlOmeH59cUxdV8zPGDXYl49K2y5VSeVuMP1orusXb02olqYfcUoTf
 PQHwt+y6cqtU0/t7d8vRWDEVXISrcwGIKaALkeS4US4VneCi57lRqfWtbSXd8YyRPwtg
 BEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
 bh=PrwAygBnHP9oKS84foELH69eMjhkyfHiC3xJCCz9iq8=;
 b=KAV2CbmnSb1DcffYcKqHRTVoXmRbbJS/3prgwgSAKNdxvdOdMaEQ5ndNiwWHFr5BoY
 LTXo28P3F9YTc5z28uL1cBl2ySQ8yXfxiu8j2JXSyU0Ven1Yn1/bnWnlHhn1wXm8t2cC
 qi0HN9Z4heZH9d+/j5NMEo+vLWupVxtb7ew8xSaAOGtlzOXTcq+WyopsWjOGTXg7vxNi
 GK7p9PhWJL1rCkXT/pIEQwJyYftf/UAMOaWTCDr328PD3nZfmfubEO8D19K3PRSgrXfq
 aVJ1DZmkC1SzG2mbRG7qSju1FoyLK36UulTxuMAiyfFD6GytXfPbB1M1S7rgypkmwNJ6
 txYg==
X-Gm-Message-State: ACrzQf1eNp5+2GwZR5oVqtODrDesC8ew9xicGF/HG/F2nt0Xw1IUcoMW
 uoPyYtiXwp43rxgKPDN8TPKmBl+A/bO6ZA==
X-Google-Smtp-Source: AMsMyM5Xv5mZ6Jr5Ho2ZS5nVS8d5bnKJ4K4+LOldR0YruAg6GGgeRKVdiqN4jBq2Y5R8U9bVTHrJqQ==
X-Received: by 2002:a17:90b:4a8a:b0:202:8eec:b87a with SMTP id
 lp10-20020a17090b4a8a00b002028eecb87amr9070001pjb.48.1664745641882; 
 Sun, 02 Oct 2022 14:20:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 r13-20020a63204d000000b00438b79c7049sm5268040pgm.42.2022.10.02.14.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 14:20:41 -0700 (PDT)
Date: Sun, 02 Oct 2022 14:20:41 -0700 (PDT)
X-Google-Original-Date: Sun, 02 Oct 2022 14:20:39 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Add support for Ztso
In-Reply-To: <YzXvIKVeFcHQ3ZQI@work-vm>
CC: qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: dgilbert@redhat.com
Message-ID: <mhng-36837e18-1883-443f-85a7-69010d5d38ef@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Sep 2022 12:16:48 PDT (-0700), dgilbert@redhat.com wrote:
> * Palmer Dabbelt (palmer@rivosinc.com) wrote:
>> Ztso, the RISC-V extension that provides the TSO memory model, was
>> recently frozen.  This provides support for Ztso on targets that are
>> themselves TSO.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> ---
>>
>
>> diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
>> index 00fcbe297d..2a43d54fcd 100644
>> --- a/tcg/i386/tcg-target.h
>> +++ b/tcg/i386/tcg-target.h
>> @@ -236,6 +236,7 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
>>  #include "tcg/tcg-mo.h"
>>
>>  #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
>> +#define TCG_TARGET_SUPPORTS_MCTCG_RVTSO 1
>
> Is x86's brand of memory ordering strong enough for Ztso?
> I thought x86 had an optimisation where it was allowed to store forward
> within the current CPU causing stores not to be quite strictly ordered.

I'm actually not sure: my understanding of the Intel memory model was 
that there's a bunch of subtle bits that don't match the various TSO 
formalizations, but the RISC-V folks are pretty adamant that Intel is 
exactly TSO.  I've gotten yelled at enough times on this one that I kind 
of just stopped caring, but that's not a good reason to have broken code 
so I'm happy to go fix it.

That said, when putting together the v2 (which has TCG barriers in the 
RISC-V front-end) I couldn't even really figure out how the TCG memory 
model works in any formal capacity -- I essentially just added the 
fences necessary for Ztso on RVWMO, but that's not a good proxy for Ztso 
on arm64 (and I guess not on x86, either).  Also happy to go take a 
crack at that one, but I'm not really a formal memory model person so it 
might not be the best result.

>
> Dave
>
>>  #define TCG_TARGET_HAS_MEMORY_BSWAP  have_movbe
>>
>> diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
>> index 23e2063667..f423c124a0 100644
>> --- a/tcg/s390x/tcg-target.h
>> +++ b/tcg/s390x/tcg-target.h
>> @@ -171,6 +171,7 @@ extern uint64_t s390_facilities[3];
>>  #define TCG_TARGET_HAS_MEMORY_BSWAP   1
>>
>>  #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
>> +#define TCG_TARGET_SUPPORTS_MCTCG_RVTSO 1
>>
>>  static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
>>                                              uintptr_t jmp_rw, uintptr_t addr)
>> --
>> 2.34.1
>>
>>

