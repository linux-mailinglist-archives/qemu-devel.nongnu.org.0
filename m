Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92729446E73
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 15:59:12 +0100 (CET)
Received: from localhost ([::1]:39444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjN9z-0006yG-GP
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 10:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjN90-0006Ii-Gx
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 10:58:10 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:46988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjN8y-000583-Hc
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 10:58:10 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so8435305wmb.5
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=hnoMIF3ZPJNb+QKeMBreU1TqdFu8MBQJvb0SXqoCwBQ=;
 b=iQTBvlI5952lffosMNAmxNy+/Ks8zXeemB3rjlOtuMDGE8kTeFEBqZ9RyORRMHU4Nt
 FBYE+qJ68XndRwHpHXeQkrPd3Q5APvjk0/b3zMcIygmL0AemvgpF9DvVuJZf5XLLfit4
 0MXDF9kCwEbcB7qrU5opcGQ0NSLjASYQWvXbmw7e+xqwRVxlnlXIn94aJuMgY7cZrDYQ
 aEAdFiNaURBHgawBOiqe6PT8gscBJuszs6+IE8dNVyV4WJCnWrng6a0vbo3KdqK7iDy4
 rLXLu1l91oOaea2wdHBRqjTavCr5IPV7zATRpBohAZ8FSYc5+/rti43/Bk4iPPbm62zg
 2WwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=hnoMIF3ZPJNb+QKeMBreU1TqdFu8MBQJvb0SXqoCwBQ=;
 b=7c2jgBuRRUZF8HVi2e86WaNJD6Ba8oGW6ipqpSDFkV2DdTVaDUkIDPwXtfoumxiURP
 /VVXmn4ixlgoBgBU7vF9/58qljUhoTreYqdZaOHjFrSLp5oK6h4XU1X6s1YemEWpLnFQ
 ZYp5WPvv+kCWj2vE7DnD7085ez+UsfOKx9NFMEZ4BR9znOZpFsaUegcrTf3tDv5OvvE6
 HVa3bNPEe946IV1iApavcEMy255O10pXBATt2aLFAf5oa3XaSSvGUVj+UPq/vsGd4Fnc
 zScwtdDdTm1mrL3q9ZCO+ZQ+0GOSC0RkVRv785IqD+9Do2S5WRnu7DPhoA9stv93hClQ
 i1Ww==
X-Gm-Message-State: AOAM5329LSPAPY3OZZZzFg0JOoaeg3MjYmR6vbD8vxq15xczr5m8tKvE
 vqulT8DiOrEejIUVuFpgrEwSr3nMaLc=
X-Google-Smtp-Source: ABdhPJyjYn5xZzzBfeTdPk8PIi+bRMC7gv//CA1IcPhl2M5pZgXyyqGMxu4+tAulvCqiREWOF7NcCg==
X-Received: by 2002:a1c:2541:: with SMTP id l62mr39428460wml.11.1636210686565; 
 Sat, 06 Nov 2021 07:58:06 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m125sm13998004wmm.39.2021.11.06.07.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Nov 2021 07:58:05 -0700 (PDT)
Message-ID: <6043b073-cbf8-e44f-5cd7-8805c1077758@amsat.org>
Date: Sat, 6 Nov 2021 15:58:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 00/11] exec: Restrict various system emulation specific
 headers (to sysemu)
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
References: <20210517111111.1068153-1-f4bug@amsat.org>
 <5574cf42-8b21-b3aa-4d91-45643129c200@amsat.org>
In-Reply-To: <5574cf42-8b21-b3aa-4d91-45643129c200@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.407,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

6 months passed, heavy rebased required, dropping for now.

On 5/25/21 16:13, Philippe Mathieu-Daudé wrote:
> Ping for review? :)
> 
> On 5/17/21 1:11 PM, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> This series restricts various system emulation specific headers
>> by moving them under sysemu/ and adding #error if included from
>> user emulation.
>> We could avoid the sysemu/ rename if too much churn, but enforcing
>> error of headers that must not be included in user emulation allows
>> further cleanups (to be sent later).
>>
>> I had to split the ioport.c file to cpu-io (generic to any target
>> having access to I/O bus, but I haven't checked the TCG implementation
>> details for user emulation) VS ioport (system specific, access to
>> hardware).
>>
>> Many files are changed, but this is mostly one-line mechanical
>> updates of old path to new path using sed.
>>
>> Regards,
>>
>> Phil.
>>
>> Philippe Mathieu-Daudé (11):
>>   NOTFORMERGE target/arm: Restrict KVM files to softmmu
>>   exec: Restrict hwaddr.h to sysemu/
>>   exec: Restrict cputlb.h to sysemu/
>>   exec: Restrict memory.h to sysemu/
>>   exec: Restrict memory-internal.h to sysemu/
>>   exec: Restrict address-spaces.h to sysemu/
>>   exec: Extract CPU I/O instructions to "cpu-io.h"
>>   exec: Restrict ioport.h to sysemu/
>>   exec: Restrict ram_addr.h to sysemu/
>>   exec: Restrict ramblock.h to sysemu/
>>   exec: Restrict confidential-guest-support.h to sysemu/
> 
>>  275 files changed, 491 insertions(+), 409 deletions(-)
>>  create mode 100644 include/exec/cpu-io.h
>>  rename include/exec/{ => sysemu}/address-spaces.h (80%)
>>  rename include/exec/{ => sysemu}/cputlb.h (86%)
>>  rename include/exec/{ => sysemu}/hwaddr.h (81%)
>>  rename include/exec/{ => sysemu}/memory-internal.h (94%)
>>  rename include/exec/{ => sysemu}/memory.h (99%)
>>  rename include/{exec => sysemu}/confidential-guest-support.h (95%)
>>  rename include/{exec => sysemu}/ioport.h (86%)
>>  rename include/{exec => sysemu}/ram_addr.h (99%)
>>  rename include/{exec => sysemu}/ramblock.h (92%)
>>  create mode 100644 softmmu/cpu-io.c
>>
> 

