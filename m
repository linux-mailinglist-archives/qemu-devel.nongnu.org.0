Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6653067322B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 08:10:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIOzd-00014D-F7; Thu, 19 Jan 2023 02:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIOzM-0000mv-Dk
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:05:34 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIOzJ-0000jt-2c
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:05:32 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso2465357wmb.0
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 23:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VDNXl4Vy80BJtWqZjof+hdjwidnfN1NLQSiLIXhcVW4=;
 b=zFTsvxWHYI4CutbtrcqNV148RabGyQCSL/kobCZMYCbdwhy5ZgOBV9ns2CWKex92jB
 AFaVUAjrV4ybE486SFzHfCOkunw2nMljMj8+0wSFmMn5khmR9zWd5bmB5wasiY7vVi9P
 xEvAqZAcOqxMW6NaFSEWdzz3sBYBioC2Kg3l1TRM1nzIJ913ZJrmxLgDzLJOTpoBeFh1
 KP/ktAaHjlID+2RuDiMuG7kriEFyDBkHJnHWymwFVX715qMmTzfDVCnNHCTVRurCFdtA
 RHjHUmiDDhFWWVxM8cSnB8KpQOKtFozTV4mKIIVHE7ShDDzPJ+/Me/5v/xebIdJGgK2J
 XQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VDNXl4Vy80BJtWqZjof+hdjwidnfN1NLQSiLIXhcVW4=;
 b=pQ8Fvr+zdhOwJ8gBlYrhbGxIZkREmRz6DBlIpc6L5lWazay2g8o3ZZAkyNUxrIS9/p
 NjAX7VgUgXfRd5a5ri9YI3tJAkaDfkMeg8Xbls71pMDf/uH8gR57K+qTdWW0/xzEPs+e
 ayqXPFULijeLzqblaCZwmDhR63vYcMjZoxfHRFlu1biTIbpyY4cMOiL2vJmcGRkMvIi2
 tx6GWpU3lcb4H0/aPyLbQkHLDbNrB+hGvQh00PteOVNRODbYm8dXglHYGOytoV32+QFL
 rtCO5Ak+AfbYlZuQM+wGWmtwcF+Pm2E2VywPGHWqDKujmJbcdFJyls4d5XjI4hepfa3Z
 czgg==
X-Gm-Message-State: AFqh2kqMsI+/ZYtgPP6xR7p577AkS50q5sL99MLUzehncYjKZyMIbSW9
 Z1dlZD9/gD2LnvElgs86nG0zrg==
X-Google-Smtp-Source: AMrXdXsVVbmlupirAKslTN7K8VYDmE5+0ybFswJZ61vY24Vp2wh5ts2uqboyLjrVqB2uyX48NI9g6w==
X-Received: by 2002:a05:600c:3c86:b0:3da:2a59:8a4f with SMTP id
 bg6-20020a05600c3c8600b003da2a598a4fmr9127296wmb.38.1674111927135; 
 Wed, 18 Jan 2023 23:05:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r18-20020a5d4952000000b002bdda9856b5sm17440123wrs.50.2023.01.18.23.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 23:05:26 -0800 (PST)
Message-ID: <040a9b0e-0e86-311a-a045-00a7c16ab819@linaro.org>
Date: Thu, 19 Jan 2023 08:05:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230118193518.26433-1-farosas@suse.de>
 <9c740b33-240b-b4f0-82a1-cc01ad886edc@linaro.org> <871qnrcz31.fsf@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <871qnrcz31.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/1/23 22:28, Fabiano Rosas wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Hi Fabiano,
>>
>> On 18/1/23 20:34, Fabiano Rosas wrote:
>>> These are the already reviewed patches from the first half of my
>>> previous series:
>>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>>
>>> This unbreaks the --disable-tcg build, but there are issues in runtime
>>> that are still being hashed out in the other series.
>>>
>>> For the build _with_ TCG, this should behave the same as master.
>>>
>>> Based on Richard's "target/arm: Introduce aarch64_set_svcr":
>>> https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@linaro.org
>>
>> $ git am
>> 20230111_richard_henderson_target_arm_introduce_aarch64_set_svcr.mbx
>> Applying: target/arm: Introduce aarch64_set_svcr
>> $ git am ./20230118_farosas_target_arm_config_tcg_n_part_1.mbx
>> Applying: target/arm: rename handle_semihosting to tcg_handle_semihosting
>> Applying: target/arm: wrap psci call with tcg_enabled
>> Applying: target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
>> Applying: target/arm: Move PC alignment check
>> Applying: target/arm: Move cpregs code out of cpu.h
>> Applying: target/arm: Move define_debug_regs() to cpregs.c
>> error: target/arm/cpregs.c: does not exist in index
>> Patch failed at 0006 target/arm: Move define_debug_regs() to cpregs.c
>>
>> I am based on commit 7ec8aeb604 ("Merge tag 'pull-tpm-2023-01-17-1' of
>> https://github.com/stefanberger/qemu-tpm into staging"), what am I missing?
> 
> How did you fetch the series? You are missing patch 06. Maybe it is too
> big for the method you used?

Actually the tool warned about patch 6 missing, but I didn't notice:

$ b4 am 20230118193518.26433-1-farosas@suse.de
Grabbing thread from 
lore.kernel.org/all/20230118193518.26433-1-farosas%40suse.de/t.mbox.gz
Analyzing 20 messages in the thread
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH 1/20] target/arm: rename handle_semihosting to 
tcg_handle_semihosting
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 2/20] target/arm: wrap psci call with tcg_enabled
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 3/20] target/arm: wrap call to aarch64_sve_change_el in 
tcg_enabled()
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 4/20] target/arm: Move PC alignment check
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 5/20] target/arm: Move cpregs code out of cpu.h
     ✓ Signed: DKIM/suse.de
   ERROR: missing [6/20]!
   ✓ [PATCH 7/20] target/arm: Move define_debug_regs() to cpregs.c
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 8/20] target/arm: Wrap breakpoint/watchpoint updates with 
tcg_enabled
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 9/20] target/arm: move translate modules to tcg/
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 10/20] target/arm: move helpers to tcg/
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 11/20] target/arm: Move psci.c into the tcg directory
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 12/20] target/arm: Wrap arm_rebuild_hflags calls with 
tcg_enabled
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 13/20] target/arm: Move hflags code into the tcg directory
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 14/20] target/arm: Move regime_using_lpae_format into internal.h
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 15/20] target/arm: Don't access TCG code when debugging with KVM
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 16/20] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 17/20] target/arm: Move cortex sysregs into cpregs.c
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 18/20] tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 19/20] tests/avocado: Skip tests that require a missing 
accelerator
     ✓ Signed: DKIM/suse.de
   ✓ [PATCH 20/20] tests/avocado: Tag TCG tests with accel:tcg
     ✓ Signed: DKIM/suse.de
---
Total patches: 19
---
WARNING: Thread incomplete!

Indeed patch 6 is missing:
https://lore.kernel.org/qemu-devel/20230118193518.26433-1-farosas@suse.de/


