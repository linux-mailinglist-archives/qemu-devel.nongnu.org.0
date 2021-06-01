Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171A539758B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 16:35:32 +0200 (CEST)
Received: from localhost ([::1]:34360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo5UQ-0005Rb-US
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 10:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5Sx-0004B6-7G
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:33:59 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:46867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5Sv-0001Pa-AR
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:33:58 -0400
Received: by mail-pf1-x434.google.com with SMTP id y15so11510317pfn.13
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 07:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=dmIvJAdm8QAcw0sYyKFIxZFvyd5VqCyYO7UZ3rwmUG4=;
 b=OTg1T9FUqoW+xk+R+p2kdBeyn1CFlaB5z0x7h1Igs9JoUKDOcedgJhMmo6GAs+S6jQ
 7LCucMgtFc4m7g17CKQI2lOVWMImu/rppPrMAQI80aA1uy+Tpg7MvdB+xLoQkPhJPCxy
 boZkeXd9TMAgvjWwl+2cXPJyI4UzrXOaAmZcCiS5xkxI9Lkfk2ZSEYpuzg3T/imOEjWa
 DT7b+GjxjjCdNBH7k8JBz0HmETwAuERfyd8jWPr0x1aeoDAFBvS5B5FVixiC4YTaD6T8
 yfRNd+6Ixnlh/qySgLGBk08hyB6GFRvWKrybNxkBAqtMZF4UcPu1Dq9LoNZMQ1sHhBab
 wS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dmIvJAdm8QAcw0sYyKFIxZFvyd5VqCyYO7UZ3rwmUG4=;
 b=BOz0ZfnnL8B3c9yYRx0lEyv47c3oSQcb3nZEf5hE+dYRwMpcQPkRYK/+RnAV1HXxhu
 9m6BoH7/EvCVM7hhluPwmv+mXpj2In6IpYx9Sr/z61eTsBiEITAZpp98jmdTUEB7FxEF
 7Kh8A7bLFiJ+ouHokzguVW/GOKz2eFqKBS0MfoS03LHKEScnvp7omslsmeygU2iKfDDs
 G1XypNAZtbL8NtotkdcqeyNxMZVqHMcm0V8Dz5sOMchZzPakcd073nIUeY/JFETqWF6x
 JVXiRDJl4/GD1cSfVcfRExMG8KoCBmWVM9f+m7a30m2sghh3iNIXQkFZtZrXh3b6X0OW
 ZkYQ==
X-Gm-Message-State: AOAM532zIAsUhAHS3cW3mkFyAkBLlshm+mzP086io0pyl2Fa2D/dU9Eq
 BsZaMqztPKytgz6rbDpmvxh8pT3+LCgTaA==
X-Google-Smtp-Source: ABdhPJwQmXw48Tzc7FIkLCgOIcSkSFQHRsqRWlFwTZe4YJPcXtov2o5nWeAwgSZFGQhGX2WGNXHiJg==
X-Received: by 2002:a65:52c8:: with SMTP id z8mr28524311pgp.50.1622558035421; 
 Tue, 01 Jun 2021 07:33:55 -0700 (PDT)
Received: from ?IPv6:2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f?
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id w2sm2246291pfc.126.2021.06.01.07.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 07:33:55 -0700 (PDT)
Subject: Re: [PATCH v6 08/26] tcg: Build ffi data structures for helpers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-9-richard.henderson@linaro.org>
 <4ee807ed-5e36-ad86-57eb-aaeaa9b1a04f@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e862dbbc-e50c-4ea3-1f57-09e3e7931e91@linaro.org>
Date: Tue, 1 Jun 2021 07:33:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4ee807ed-5e36-ad86-57eb-aaeaa9b1a04f@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/31/21 11:55 AM, Philippe Mathieu-Daudé wrote:
> Hi Richard,
> 
> On 5/3/21 1:57 AM, Richard Henderson wrote:
>> Add libffi as a build requirement for TCI.
>> Add libffi to the dockerfiles to satisfy that requirement.
>>
>> Construct an ffi_cif structure for each unique typemask.
>> Record the result in a separate hash table for later lookup;
>> this allows helper_table to stay const.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   meson.build                                   |  9 ++-
>>   tcg/tcg.c                                     | 58 +++++++++++++++++++
>>   tests/docker/dockerfiles/alpine.docker        |  1 +
>>   tests/docker/dockerfiles/centos7.docker       |  1 +
>>   tests/docker/dockerfiles/centos8.docker       |  1 +
>>   tests/docker/dockerfiles/debian10.docker      |  1 +
>>   .../dockerfiles/fedora-i386-cross.docker      |  1 +
>>   .../dockerfiles/fedora-win32-cross.docker     |  1 +
>>   .../dockerfiles/fedora-win64-cross.docker     |  1 +
>>   tests/docker/dockerfiles/fedora.docker        |  1 +
>>   tests/docker/dockerfiles/ubuntu.docker        |  1 +
>>   tests/docker/dockerfiles/ubuntu1804.docker    |  1 +
>>   tests/docker/dockerfiles/ubuntu2004.docker    |  1 +
>>   13 files changed, 77 insertions(+), 1 deletion(-)
> 
>> @@ -1135,6 +1152,47 @@ void tcg_context_init(TCGContext *s)
>>                               (gpointer)&all_helpers[i]);
>>       }
>>   
>> +#ifdef CONFIG_TCG_INTERPRETER
>> +    /* g_direct_hash/equal for direct comparisons on uint32_t.  */
> 
> Why not use g_int_hash() then?

g_int_hash takes a pointer to an int; this stores the int directly as the hash key.


r~

> 
> Otherwise,
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
>> +    ffi_table = g_hash_table_new(NULL, NULL);
>> +    for (i = 0; i < ARRAY_SIZE(all_helpers); ++i) {
>> +        struct {
>> +            ffi_cif cif;
>> +            ffi_type *args[];
>> +        } *ca;
>> +        uint32_t typemask = all_helpers[i].typemask;
>> +        gpointer hash = (gpointer)(uintptr_t)typemask;
>> +        ffi_status status;
>> +        int nargs;
>> +
>> +        if (g_hash_table_lookup(ffi_table, hash)) {
>> +            continue;
>> +        }
>> +
>> +        /* Ignoring the return type, find the last non-zero field. */
>> +        nargs = 32 - clz32(typemask >> 3);
>> +        nargs = DIV_ROUND_UP(nargs, 3);
>> +
>> +        ca = g_malloc0(sizeof(*ca) + nargs * sizeof(ffi_type *));
>> +        ca->cif.rtype = typecode_to_ffi[typemask & 7];
>> +        ca->cif.nargs = nargs;
>> +
>> +        if (nargs != 0) {
>> +            ca->cif.arg_types = ca->args;
>> +            for (i = 0; i < nargs; ++i) {
>> +                int typecode = extract32(typemask, (i + 1) * 3, 3);
>> +                ca->args[i] = typecode_to_ffi[typecode];
>> +            }
>> +        }
>> +
>> +        status = ffi_prep_cif(&ca->cif, FFI_DEFAULT_ABI, nargs,
>> +                              ca->cif.rtype, ca->cif.arg_types);
>> +        assert(status == FFI_OK);
>> +
>> +        g_hash_table_insert(ffi_table, hash, (gpointer)&ca->cif);
>> +    }
>> +#endif
>> +
>>       tcg_target_init(s);
>>       process_op_defs(s);


