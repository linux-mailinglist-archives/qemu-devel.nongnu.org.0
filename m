Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AEE418E69
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 06:39:38 +0200 (CEST)
Received: from localhost ([::1]:41382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUiQT-0000tK-O3
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 00:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUiP0-0007vs-Ib
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 00:38:07 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUiOz-0000A2-15
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 00:38:06 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d21so48318881wra.12
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 21:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jEae1eAajKs+5oeEH1RXfJofuvmGdVG/0973md1VjKs=;
 b=MXHyHnVg3QDU8Kil/wizh9S+JJdqlckRZARGpXGwtfqyZwG03pWJCKzEzaRrJ20wR6
 SuKdu8g7hrDlZIN6/xU1VQvcKvotCS3U+783oO/Ac+QCtW9Ohkfd0HXkhlgRcSuU+t9R
 u6OU4z3utsRQe+o2wIYIoXHNFV8Vjj0EQ3b1YkqK6ndnENWPRnFB6xiC36PvX/5LkbP3
 PcdA3nwo/xp7fA/MQ7pFeBSIGx1FOGJeVQDqrR7XMsPclpssLDF3PhFl+pnkcYtMjj7K
 eXHV0ENhdfGc9DO7dSBX31w+JQdImp+SYHgFe+gHNMjNSoiizKIO7kLX2Co1GBPDJLek
 Reag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jEae1eAajKs+5oeEH1RXfJofuvmGdVG/0973md1VjKs=;
 b=lg6L6QSYXR9mjPn2hDUHVwjZRpi3VLACdITffFh5lWK1vS2kyfswwOtlah11maD9Kp
 xUjwVcEb7tWgsKt1S+d68I3SfM+f6Q62ChANf+c9VI+7L7y84qmAKVGkDU05sc19evwM
 BP3zbig8LFyCb9fyo5/dIz5W5TAaKFEaKvR1nUqMq05LDVn4SfjX2HNjUdgym5iIyHJx
 AeVdwsIwQwxJT9i/Td0vnbTL1Bqnjenv5W7yHbMC6zWyWYaFYD60z3ejYwMUzAc8dYUq
 eAvAVFWo781ed4mzK8DfcM5DhGvrOR17x0OIt9Avj7cNKrO//3EP5SqNYZWay+Jz5XcX
 ugtQ==
X-Gm-Message-State: AOAM533/PM9uqBn4dPUpAHVNCjX0Oa9r6sJ8Py96c2XWnJoVHbfP3HqT
 5vjAC3HGSTPPYEQngTu0IaY=
X-Google-Smtp-Source: ABdhPJzvpQMnTSAEhVhr64sosFDljghu+zB5k2Mct7pnjD6jqJkERV6tw3JfHmZrlFDsxtiyHPNPBg==
X-Received: by 2002:a05:600c:4fd2:: with SMTP id
 o18mr14012796wmq.126.1632717483517; 
 Sun, 26 Sep 2021 21:38:03 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d70sm15370555wmd.3.2021.09.26.21.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 21:38:03 -0700 (PDT)
Message-ID: <f81166c3-0680-2d59-0886-700dc39a0449@amsat.org>
Date: Mon, 27 Sep 2021 06:38:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v8 13/40] accel/tcg: Implement AccelOpsClass::has_work()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210926222716.1732932-1-f4bug@amsat.org>
 <20210926222716.1732932-14-f4bug@amsat.org>
 <86834955-b2c7-5a94-eec0-47686eb40690@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <86834955-b2c7-5a94-eec0-47686eb40690@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.478,
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

On 9/27/21 02:12, Richard Henderson wrote:
> On 9/26/21 6:26 PM, Philippe Mathieu-Daudé wrote:
>> All accelerators but TCG implement their AccelOpsClass::has_work()
>> handler, meaning all the remaining CPUClass::has_work() ones are
>> only reachable from TCG accelerator; and these has_work() handlers
>> belong to TCGCPUOps.
>>
>> We will gradually move each target CPUClass::has_work() to
>> TCGCPUOps in the following commits.
>> For now, move the CPUClass::has_work() call to tcg_cpu_has_work(),
>> the TCG AccelOpsClass::has_work() implementation.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
>>   include/hw/core/cpu.h     |  2 +-
>>   accel/tcg/tcg-accel-ops.c | 11 +++++++++++
>>   softmmu/cpus.c            |  5 -----
>>   3 files changed, 12 insertions(+), 6 deletions(-)
> 
> Are we really really really sure this works?

As sure as a green CI, so I wonder if KVM is really tested there...

> Device emulation raises e.g. CPU_INTERRUPT_HARD.  We certainly test that
> bit in target/i386/kvm/kvm.c.  But we don't check that bit in your
> kvm_cpu_has_work.  We're currently checking that via cc->has_work(), in
> x86_cpu_pending_interrupt, but after this change we won't test it at all
> for kvm.

Indeed. I guess I misunderstood your v6 comment. I'll revisit. Sorry.

