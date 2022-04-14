Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D9E5018AF
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 18:34:35 +0200 (CEST)
Received: from localhost ([::1]:43440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf2QT-0007uv-O4
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 12:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nf2Op-0006nX-1M
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 12:32:51 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nf2On-0006lS-4Z
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 12:32:50 -0400
Received: by mail-pf1-x42d.google.com with SMTP id r10so1463042pfh.13
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MNa2nkCPR+NKMXK6Sdlss2XVT9VoTzN8M6bDiskqpM4=;
 b=bH46gAWXSf633MDHy+/6YuV9e4bY86zSEM1Md+JY925qhn2a1xx5CpFdqjBonBeJUY
 0ciMO3Y+1Pvhxf+W0plaZcTIOGLRSKBs1bww+HYyliZ9EdYRg7CYoJoFX9Yd3OSeeR9T
 V78W3FoIOxGmS+Krt11JN53W/3SAI2KBNwP1kjnpjQuJDnlKJorubmE69llUDL+v5RXp
 MYcX2MlhSiLo4eQHnhRNbEnXexG6lPD78OBdMFqoPW1xWB3IVZhyBYmr2qCwHCSCh/PH
 MyxQ9C+cH8uyam8EtJC9cN7i2L4qCojzPtf5zL62Mqf8ev+lcQWEjQrH2rA+RqPKnul8
 bP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MNa2nkCPR+NKMXK6Sdlss2XVT9VoTzN8M6bDiskqpM4=;
 b=GM3YHmcdv3btq4Imr3GFFxxRlXReDCWgm/6B+KNFuZMBTzEm55W3T4Ejh0xZfRstU7
 6hDFlDvIKwrEUlIKwBwICuP07IFqtj72CBQq0f7eCwoUs8UHFGiUPSk9mN8pYHf9pud0
 Z68uL6Avjzdqh8PC+dJBSaB1gZYKjWzeRRUVZTLSGWLW3iy2OSvwZZ7sJ2czU1zjJXsD
 lRFz2UsKqq7jpyZmC2FYV9wgXDlyzGrK0kGrQqWnDZF3DEJRyMO76r9P/hkRIi/SFnz6
 UVsCb6v71nkeBPDSL+ZSSRSh13r70Y1ucYSkUKiaU4nTk3Pg+KNE5gBFkybvW2pgdcsW
 Qfqw==
X-Gm-Message-State: AOAM533TkqLMxHJ09TZry6GI3CKbetosPVNKl0qYYwNxkJ3p+lq5lcjs
 tq5NpgmT6SM7iiV5iiTT4SvRng==
X-Google-Smtp-Source: ABdhPJyBze21OF+SoNzJxQb0N4M8vcRFG25fWq4Iw+j22R7Mp9av2aDKNemJv0JrTKdzS+884Zq+4Q==
X-Received: by 2002:a05:6a00:2148:b0:4fa:92f2:bae3 with SMTP id
 o8-20020a056a00214800b004fa92f2bae3mr4737900pfk.69.1649953967369; 
 Thu, 14 Apr 2022 09:32:47 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 s190-20020a625ec7000000b005061c17c111sm395910pfb.71.2022.04.14.09.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 09:32:46 -0700 (PDT)
Message-ID: <79252304-a82a-c588-e7e6-15b606369da6@linaro.org>
Date: Thu, 14 Apr 2022 09:32:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 39/39] util/log: Support per-thread log files
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-48-richard.henderson@linaro.org>
 <87y207smjt.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87y207smjt.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/22 08:35, Alex Bennée wrote:
>> +/**
>> + * valid_filename_template:
>> + *
>> + * Validate the filename template.  Require %d if per_thread, allow it
>> + * otherwise; require no other % within the template.
>> + * Return 0 if invalid, 1 if stderr, 2 if strdup, 3 if pid printf.
> 
>  From a neatness point of view having an enum would make it easier to
> read in the switch down bellow...

Fair, and...

>> +        switch (valid_filename_template(filename, per_thread, errp)) {
>> +        case 0:
>> +            return false; /* error */
>> +        case 1:
>> +            break;  /* stderr */
>> +        case 2:
>> +            newname = g_strdup(filename);
>> +            break;
>> +        case 3:
>> +            newname = g_strdup_printf(filename, getpid());
>> +            break;
> 
> default: g_assert_not_reached?

... using an enum with an extra enumerator for testing gives us

../src/util/log.c: In function ‘qemu_set_log_internal’:
../src/util/log.c:213:9: error: enumeration value ‘vft_new_case’ not handled in switch 
[-Werror=switch]
   213 |         switch (valid_filename_template(filename, per_thread, errp)) {
       |         ^~~~~~
cc1: all warnings being treated as errors

though that does require *not* having a default case.


r~

