Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EBC43E011
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 13:33:49 +0200 (CEST)
Received: from localhost ([::1]:37534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg3fI-0003Wu-5i
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 07:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mg3d0-0001i6-Gk
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 07:31:26 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:44004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mg3cy-0002sz-98
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 07:31:26 -0400
Received: by mail-il1-x12d.google.com with SMTP id y14so6381952ilv.10
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 04:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mqdA+xWGgZqLgMX9gcjl+Vy/1jzAVC0v1Ci31yZRa08=;
 b=An2eqT1ABSd30QpzQFgls7xxRJ3+MV9A28monUEAvy1MLyWF4Ow4HGS5FFsb21lx45
 FQJfRL8NtGc+SQtw9/zqH6Dw+j3U8Il0S4jeFkoMWFk4FTg3UhBH+RSecW3/y9gih5ea
 hvFURbKa/7jq7DWwcf779/GqjRVm5q4ULnR1S2G/5n9+Yk36zJ8EF9BJ5Powrrc/stHI
 QOsBD2t5yBnTvXpeaU8pFWwTgPbEdoV+RvasorO+kf4dBqLwvfT2GGZo1bSx1F5jj9r1
 2FUgSBTohBGFmt3Tn1lD7cwt88xnvxjtOZ9k5K+uGkv0bNzElO+ZgbcRNJp1Mol2cgM5
 wiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mqdA+xWGgZqLgMX9gcjl+Vy/1jzAVC0v1Ci31yZRa08=;
 b=FWEb/49PA41eKRwQYeOP2IJb3ehnCzgJX8NSQ09/2EvyTL2blnF1v4u8H0+PYTgdSL
 YgSCsWf+M/aQStZencZHMEqrsT8BEznvxu3RcclW0tq+LHG1uLTFIANrFiW5/b0bw0ow
 Ug3fyJqA1cwqe0zfGUTMQfDwJlR2eqjFPZKL9PdRb6WZJt0G5xfyq/BDFIG6PIJU+eIu
 1+VWsKrnFPGgHqKv6ZjT9ehs9kW88ZBGAPY5PPSYccCgTzxzzL2QFHWNNRZ27sb7G+sq
 CeIoYc8huDMsh6U+hfxExQAqdJwvOkoBj+Gd3T8b6pgJmtGq3LkvRYvZlI6BmkhgXC0P
 Cnqg==
X-Gm-Message-State: AOAM532JjpacS55COzb02xHnYW72f8BJrzK77SpgExL4bTgvRWqUaBzU
 gGy2dywVhehezk9a1uGjYo9PBak3bIOjZxuEZfo=
X-Google-Smtp-Source: ABdhPJyYU7N9UxoaD+C7ShCQTzUvxaNQboxT7GmrXePTWYDERK5J1i7MJF8Uh63h42eLQCV0XcKv0Q9oCeEmtPCNmEg=
X-Received: by 2002:a05:6e02:1b81:: with SMTP id
 h1mr2822928ili.290.1635420683066; 
 Thu, 28 Oct 2021 04:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
 <20211028044342.3070385-17-alistair.francis@opensource.wdc.com>
 <CAE_xrPgiy+OrehPrzt0OZq97jkxGgnBSkEQWbKhROU+v65ac2A@mail.gmail.com>
In-Reply-To: <CAE_xrPgiy+OrehPrzt0OZq97jkxGgnBSkEQWbKhROU+v65ac2A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Oct 2021 21:30:57 +1000
Message-ID: <CAKmqyKMHeqia5_1+VXd1+2RPq7-uqFVTfcFgDb7kVetgbXyNXQ@mail.gmail.com>
Subject: Re: [PULL 16/18] target/riscv: change the api for RVF/RVD fmin/fmax
To: Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 28, 2021 at 6:22 PM Frank Chang <frank.chang@sifive.com> wrote:
>
> On Thu, Oct 28, 2021 at 12:45 PM Alistair Francis <alistair.francis@opensource.wdc.com> wrote:
>>
>> From: Chih-Min Chao <chihmin.chao@sifive.com>
>>
>> The sNaN propagation behavior has been changed since
>> cd20cee7 in https://github.com/riscv/riscv-isa-manual.
>>
>> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
>> Signed-off-by: Frank Chang <frank.chang@sifive.com>
>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>> Message-id: 20211016085428.3001501-3-frank.chang@sifive.com
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  target/riscv/fpu_helper.c | 16 ++++++++++++----
>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
>> index 8700516a14..d62f470900 100644
>> --- a/target/riscv/fpu_helper.c
>> +++ b/target/riscv/fpu_helper.c
>> @@ -174,14 +174,18 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>>  {
>>      float32 frs1 = check_nanbox_s(rs1);
>>      float32 frs2 = check_nanbox_s(rs2);
>> -    return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
>> +    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
>> +                    float32_minnum(frs1, frs2, &env->fp_status) :
>> +                    float32_minimum_number(frs1, frs2, &env->fp_status));
>>  }
>>
>>  uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>>  {
>>      float32 frs1 = check_nanbox_s(rs1);
>>      float32 frs2 = check_nanbox_s(rs2);
>> -    return nanbox_s(float32_maxnum(frs1, frs2, &env->fp_status));
>> +    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
>> +                    float32_maxnum(frs1, frs2, &env->fp_status) :
>> +                    float32_maximum_number(frs1, frs2, &env->fp_status));
>>  }
>>
>>  uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
>> @@ -283,12 +287,16 @@ uint64_t helper_fdiv_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>>
>>  uint64_t helper_fmin_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>>  {
>> -    return float64_minnum(frs1, frs2, &env->fp_status);
>> +    return env->priv_ver < PRIV_VERSION_1_11_0 ?
>> +            float64_minnum(frs1, frs2, &env->fp_status) :
>> +            float64_minimum_number(frs1, frs2, &env->fp_status);
>>  }
>>
>>  uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
>>  {
>> -    return float64_maxnum(frs1, frs2, &env->fp_status);
>> +    return env->priv_ver < PRIV_VERSION_1_11_0 ?
>> +            float64_maxnum(frs1, frs2, &env->fp_status) :
>> +            float64_maximum_number(frs1, frs2, &env->fp_status);
>>  }
>>
>>  uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
>> --
>> 2.31.1
>>
>
> Hi Alistair,
>
> Did you pull the latest v5 patchset?
> https://lists.nongnu.org/archive/html/qemu-riscv/2021-10/msg00557.html

Strange, I don't see it on the patches list. All I see is v4

Alistair

>
> I added more texts in the commit message to describe why we tie RVF version with Priv version.
> I think it's still okay to pull this one as I don't think there's any functional changes, IIRC.
>
> Regards,
> Frank Chang

