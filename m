Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC940416FC0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:57:22 +0200 (CEST)
Received: from localhost ([::1]:39794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThxJ-0001Hd-6r
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThhH-0005i6-1a; Fri, 24 Sep 2021 05:40:47 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThhE-0007Sd-Cp; Fri, 24 Sep 2021 05:40:46 -0400
Received: by mail-wr1-x435.google.com with SMTP id g16so25535146wrb.3;
 Fri, 24 Sep 2021 02:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hyZE3nDTgOENPleOcICsAXRzDia9rRVIxphyjqCmuCc=;
 b=SkyJIPwUtLvJ+DsNSPO+QmjrSRIZhzenbp6gElMXAfbF7hEyk8Y6HrASKZkeliSY8m
 2kcaqL7hXvjf29bB0W51Tu0ApZopoFg7ESg7qcMZzP+TsuPX9wFOQGMpTRZeaIHRWfhE
 FdC3n++tVGerb3wx52kd3apEuTE7+g2K4aEF2pdVbMjpUqDOsKMc4SmFcM2iPSR17e6z
 4/iFVXknqJ3F2T4OfXGCngPLL/dATfQeh5cB/kmtBhDhTSenbTE+64j3/QIzNLw9eusf
 RMX8BesNHXJiFjyifAsUQDLqQUJ8oQdxLb3XJWTUVKODrhHlGdht/x4pIIt8twYfjvJv
 VkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hyZE3nDTgOENPleOcICsAXRzDia9rRVIxphyjqCmuCc=;
 b=hviIcXcFVZB6VPsj9/qah7DVK9eZ8X3ReuRY0v2Dy6tiJ2KSXbkUhtLmGHFuHYx4pA
 N7nCktUwooyMxc80GEFjNWm/x5AYa8dH6Zg5zDv5QxpVc5AX6JwASuC6AovVxOkLmqHj
 yjdQSwrxgZYTb5IDfH9SpH3mY8fcKWR99en6O7uEHrrEjJ8WYksCuMGbYgkDGuOvSTR1
 NHM2/0756ypSg9uvt8zhaK93FvdWh/qzk3GO9NcZIIedqwSkNMbwtKfOoqkn0YbcbFip
 w2YfjLGpwk+TcQ18V90tLzQnRbOfAFDxpceTR32WwHKnRiemEpr9sN6BFPZH3/dBtxaC
 hZTg==
X-Gm-Message-State: AOAM531Id8nV/sLzCOUwgkmutbx90IS8okGI1vLMI5BU7NOAkRr2rLN1
 nK/+ieZL1cxRQRgMhYzFByQ=
X-Google-Smtp-Source: ABdhPJwb2TjkH0t/fyeHCaSEl7F3o6cJR7Z//F3sX1Zoybrg/nnFqfOF+gfeWB6U0UpDxXV+rU5hiw==
X-Received: by 2002:a05:600c:22d4:: with SMTP id
 20mr999876wmg.177.1632476442554; 
 Fri, 24 Sep 2021 02:40:42 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id f1sm7966000wrc.66.2021.09.24.02.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 02:40:41 -0700 (PDT)
Message-ID: <012da8f3-1399-8eb9-d588-65e02e90183e@amsat.org>
Date: Fri, 24 Sep 2021 11:40:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH-for-6.2 0/2] disas/nios2: Simplify endianess conversion
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>
References: <20210807110939.95853-1-f4bug@amsat.org>
 <a99e29c5-0aed-2a7c-cbdd-ebaecc99a448@amsat.org>
 <aa70868b-78b0-838a-55cd-3a7399fc041f@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <aa70868b-78b0-838a-55cd-3a7399fc041f@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cris and Marek, could you help me get this series merged?

On 9/23/21 17:14, Laurent Vivier wrote:
> Le 18/09/2021 à 11:19, Philippe Mathieu-Daudé a écrit :
>> Cc'ing qemu-trivial@ (series fully reviewed).
>>
> 
> An Acked-by from one of NiosII maintainers would be welcome.
> 
> Thanks,
> Laurent
> 
>> On 8/7/21 13:09, Philippe Mathieu-Daudé wrote:
>>> After chatting with Richard Henderson and Paolo Bonzini, we
>>> concluded the load/store API is mature enough to have target
>>> code endianess-agnostic.
>>> Thus we could remove the TARGET_WORDS_BIGENDIAN definition from
>>> target-specific code (restricting it to the binary format loaders).
>>>
>>> While experimenting, I noticed the Nios2 disassembler is an easy
>>> win. MIPS will follow shortly.
>>>
>>> Philippe Mathieu-Daudé (2):
>>>    disas/nios2: Fix style in print_insn_nios2()
>>>    disas/nios2: Simplify endianess conversion
>>>
>>>   include/disas/dis-asm.h |  3 +-
>>>   disas/nios2.c           | 71 ++++++++++++++++-------------------------
>>>   target/nios2/cpu.c      |  6 +---
>>>   3 files changed, 29 insertions(+), 51 deletions(-)
>>>
>>
> 
> 

