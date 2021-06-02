Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B99398F92
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 18:05:36 +0200 (CEST)
Received: from localhost ([::1]:47118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loTN8-00038O-QB
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 12:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loTJr-0006Io-76
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 12:02:11 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:45655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loTJp-0006Mt-FV
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 12:02:10 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 mq2-20020a17090b3802b0290162428291f5so2050655pjb.4
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 09:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2KRFo0QHl/7dZxIp26Or+p55hUv9UppdXrs00swybIs=;
 b=WFxkhi1EM5+xDBbPmA6vAEOXlNrab8Dl0JhleSKHmLs9iy4hV/zs4z5+AsTQsyeJMF
 yk5q266k6yTOWyPq2xxUEHedcaIFMKUOc6n95+sNznYVSzNiJKrRh8NBWyrZ7Mx2MBbD
 /wUCDif39KvsHUzddc32cAj4nRo+ttVEduZ9Ni3T2Op/9lEFnCmrPuwOb5wvTH6zGKSe
 0Xjq4Ky4utkPXMzFF2JtdFJAQVCyOCRcOOGRy004oF9Nj8PwCjKQVFH7fpYl62FIR2lf
 GnlQP/22PgEEQY3SIbCJpRJa+CzoMBFvaI/ZGJKZ4wbvZzHF2QAB5wCcP1b8XDiK1edp
 Ug6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2KRFo0QHl/7dZxIp26Or+p55hUv9UppdXrs00swybIs=;
 b=jlJqmhZyt8to3hnsrnZX5Ah7L2p0UNVNXZLwHH5kDVjHetZcce8nq/W+0y3twT1Zi2
 JI0Opgwk+CMjJtkOuygry1Uao2nQisgl5qSrxPKdfI/T22ZXAJ2mJitS+itbufP2IWKy
 d4IYItdVU2soh872RQCF+ihGWbxOoxGoINs07vhha7zYVSykvy22KtuxXZO3xMQSr7ed
 Udd2ZDoxYLEWtIVgyau9xlBU8pQUzFXx/nf5c8GeV/2TicpQ9tPeeot4ZH+y0QeYAjHG
 2zEBcYPj/PWXksoqh/LHf9mXeN9n7fxMsba2ErjEsvlo3rASfB+jvtnZX0+BmX+VYDX7
 eMNg==
X-Gm-Message-State: AOAM531eLfRfn52ALJzr8DnLbeh/k1jv1yNycOLC/vLH8Ym0gzpy6SKZ
 SEm7Ao59JIdrWqzPbsRHWn+m+A==
X-Google-Smtp-Source: ABdhPJx/u+onEoBoQUhhXzLl6qSwyURHdMiy0lkszWIzOpwf/zD4uQjWEBfa0VOaDK8DbTXeIDI6zg==
X-Received: by 2002:a17:90b:3e89:: with SMTP id
 rj9mr19444683pjb.114.1622649727564; 
 Wed, 02 Jun 2021 09:02:07 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 13sm102087pfz.91.2021.06.02.09.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 09:02:07 -0700 (PDT)
Subject: Re: [PATCH v7 04/27] plugins: Drop tcg_flags from struct
 qemu_plugin_dyn_cb
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
 <20210601150106.12761-5-richard.henderson@linaro.org>
 <87h7igbou1.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7c697a4-f382-272f-18ee-bc2a561a5f5e@linaro.org>
Date: Wed, 2 Jun 2021 09:02:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87h7igbou1.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 2:22 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> As noted by qemu-plugins.h, enum qemu_plugin_cb_flags is
>> currently unused -- plugins can neither read nor write
>> guest registers.
> 
> No objection to this - although we hopefully will introduce the ability
> to read registers at some point. I saw no indication that the ability to
> mark helpers for that is going away, just the mechanism is changing?

The mechanism is going away.  I'll figure out how to replace it when there's 
some call to do so.


>> @@ -411,7 +411,7 @@ static TCGOp *copy_call(TCGOp **begin_op, TCGOp *op, void *empty_func,
>>           tcg_debug_assert(i < MAX_OPC_PARAM_ARGS);
>>       }
>>       op->args[*cb_idx] = (uintptr_t)func;
>> -    op->args[*cb_idx + 1] = tcg_flags;
>> +    op->args[*cb_idx + 1] = (*begin_op)->args[*cb_idx + 1];
> 
> This confuses me. We are dropping tcg_flags because we aren't using them
> but why are we copying the next args from begin_op? Should we have been
> doing that before?

You were overwriting the field before, now we're copying it.


r~

