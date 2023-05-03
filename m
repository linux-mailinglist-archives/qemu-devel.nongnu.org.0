Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C542C6F554E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:51:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu98n-0002Me-7G; Wed, 03 May 2023 05:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pu98k-0002MJ-1p
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:51:14 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pu98i-0007WX-AW
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:51:13 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1928eee97f7so1242202fac.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683107470; x=1685699470;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/7rUM88CyfaHXN31Jc1fbMtF03I0JJGTgpCKHz5CGDQ=;
 b=VayF9L2E4IHkbNALpsguNOsp77vMwFTl6Hvl6ruaAYyLjGetHJcTiHb8mkBr6YiI/y
 UpVaGd0WG5BZu3VOBPGdqYxfm1hZD/zZgTEUMHUbwvdtWnapv+9k/di5pOCwTfmK86oT
 r1mUiaUs3FRgGCa2a9nccgK7wgCHghy6/QKo5XnD7RJuKpZEOix21yPH39rL1cr1sMNE
 ArKRhB7OeBEQ2V1T3SqK7XkzGfZJYCiz5W7bi20bhj00NbtFYAcH7eNsVyZr+2fzAVSF
 HqxWE7SZlahKXyJ23fwPxVd2Llf0H5UzY/ovUwOriXJ92SRgHP624Cw3oEvjAmXk2rxp
 0+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683107470; x=1685699470;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/7rUM88CyfaHXN31Jc1fbMtF03I0JJGTgpCKHz5CGDQ=;
 b=DXABsQ0ha7mBsKBJw36uY4f3fAMpL8uN3jox7bYQRzfa8hmpKfGA59pIPGPGEdhLtp
 XHaPnEQrz6JobKwNtRZ9nroiXFlxVO/kSge8m7VeGTvCqcyBXdstcCfSKyP/coaYvO1H
 5QRQf/Oil8gXjwII5ADS9POS+M64yGExfiEvKj2Fax85lOgE3NPxx6jg+BDyLeZw3Ib9
 ribgjXSYoIOVfgcELSwo1BoK54/0LRTQkCnsMkirdk/RaYZo3WB5L468vnZLPSZwnCN+
 l0X8bNXT59JU90hG2/4hqdorJXAGDj1fggaKjBc3tmf10qK3C34MHSDfa6AaktyglLsU
 RIdw==
X-Gm-Message-State: AC+VfDwtampVd13ytuTaFa19MIJ27xAWQDu959eI3D4hPJWO+yjtqiO4
 BO7WYxUAG+4dg3QRv/4moN013A==
X-Google-Smtp-Source: ACHHUZ6J3eLyFkctbrp04dzOupD9DGcqoi9HtkJuXeQUgnR9ZCDwXKjiImkf3Hl+xAHGVhaXwpQ5QA==
X-Received: by 2002:aca:1e16:0:b0:38c:6654:a61b with SMTP id
 m22-20020aca1e16000000b0038c6654a61bmr8939794oic.0.1683107470579; 
 Wed, 03 May 2023 02:51:10 -0700 (PDT)
Received: from [192.168.68.107] ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a056808060b00b00383ce81c186sm414952oih.32.2023.05.03.02.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:51:10 -0700 (PDT)
Message-ID: <6946d44f-8b24-de00-7efc-e35d48f62705@ventanamicro.com>
Date: Wed, 3 May 2023 06:51:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 0/3] target/riscv: implement query-cpu-definitions
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, richard.henderson@linaro.org
References: <20230411183511.189632-1-dbarboza@ventanamicro.com>
 <CAKmqyKMhA5=f99rzxp63-vqiUCZwEuWmAZK76=ZKUrni-CTauQ@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKMhA5=f99rzxp63-vqiUCZwEuWmAZK76=ZKUrni-CTauQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Alistair,

Patch 2 has a typo right in the commit title:

"target/riscv: add query-cpy-definitions support"

it should be 'query-cpu-definitions'. Can you amend it in the tree? Or should
I re-send?



Thanks,


Daniel



On 4/16/23 23:58, Alistair Francis wrote:
> On Wed, Apr 12, 2023 at 4:36 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> Hi,
>>
>> In this v3 I removed patches 3 and 4 of v2.
>>
>> Patch 3 now implements a new type that the generic CPUs (any, rv32,
>> rv64, x-rv128) were converted to. This type will be used by
>> query-cpu-definitions to determine if a given cpu is static or not based
>> on its type. This approach was suggested by Richard Henderson in the v2
>> review.
>>
>> Patches are based on top of Alistair's riscv-to-apply.next.
>>
>> Changes from v2:
>> - old patches 3 and 4: removed
>> - patch 3:
>>    - add TYPE_RISCV_DYNAMIC_CPU
>>    - use this type to set 'q_static' in riscv_cpu_add_definition()
>> - v2 link: https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg01310.html
>>
>> Daniel Henrique Barboza (3):
>>    target/riscv: add CPU QOM header
>>    target/riscv: add query-cpy-definitions support
>>    target/riscv: add TYPE_RISCV_DYNAMIC_CPU
> 
> Thanks!
> 
> Applied to riscv-to-apply.next
> 
> Alistair
> 
>>
>>   qapi/machine-target.json      |  6 ++-
>>   target/riscv/cpu-qom.h        | 70 +++++++++++++++++++++++++++++++++++
>>   target/riscv/cpu.c            | 20 ++++++++--
>>   target/riscv/cpu.h            | 46 +----------------------
>>   target/riscv/meson.build      |  3 +-
>>   target/riscv/riscv-qmp-cmds.c | 57 ++++++++++++++++++++++++++++
>>   6 files changed, 150 insertions(+), 52 deletions(-)
>>   create mode 100644 target/riscv/cpu-qom.h
>>   create mode 100644 target/riscv/riscv-qmp-cmds.c
>>
>> --
>> 2.39.2
>>
>>

