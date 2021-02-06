Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA551311F90
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 20:15:58 +0100 (CET)
Received: from localhost ([::1]:50586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8T3m-0002u8-0y
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 14:15:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8T2F-0002Od-MB
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 14:14:23 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8T2A-0005ON-8L
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 14:14:23 -0500
Received: by mail-wr1-x42f.google.com with SMTP id b3so11895910wrj.5
 for <qemu-devel@nongnu.org>; Sat, 06 Feb 2021 11:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g2TJO8UwXZ1v0GzRCtBhxskBjeaVOxNUIswvlXIz3JM=;
 b=ac5TPZ5b9LFOojj+qA0U5L9AC63Yw+RNaaxScX5ORwALx5socxL5OwBSmT3jd26+7G
 Ej/mlw61HYDuDrMaxzPMoJ8T5d6q2T/Se02vfm+zzmnEIsB7zPlbE+qhj7byFyVNFSbI
 wadXrdMTIyTwZm8R1rgdw8HpkUTWWc62I4hY+F/K7HeOT+oqPzQl8c9QPC3LGO1WRCaM
 M61IWpLxorSaph+xNxiEr4sRerEcolhNAMpY9BUZ6BNC71hM0JZDRYYcgKd4kjVvNaNh
 /rFACiPNWMWHKhgL9/nn+lnll9uvmtvmlVwytaa5jIzbKDxl+XTEaCZTo1kmko/2oQL9
 ovig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g2TJO8UwXZ1v0GzRCtBhxskBjeaVOxNUIswvlXIz3JM=;
 b=KAFrVC151xNz+FUtVkS2DZ1rEW8PPhK+tprWpnmYsPtOv8G1PqB8JDptQ+QivlOOfo
 o44CQKwTBzFOEcy8fubbypAmU1z20ZuXeVZZsq+u9LQIjXGrk0w3xXfQ8ajJ76nkHgNh
 hTgOSoX7nKNzaPZZqLkqa8y0/AdhQftOPybVnEEHtcRR8eNVlT0BXDeLbIr6qjbGZJJM
 zcs9viqdMuViNVIajKDIhfavTh2Nn0D4Hd72kyEluCGaGoBKs+zA6RD1zvpbH5VZF7tv
 NrdUGkFKP339YSIP3/8r1hQ10Cd9bGEdp0RrihVvCfaa8BWmm09HPhK1f/cEuiFLOsfY
 OxJA==
X-Gm-Message-State: AOAM532z8MGqvxBUMOuiutgZ5en+xyJZB1o2RNqm02tk8M/9BBdTBQAL
 t3/xM5nR4aj+MTlto0sJjDE=
X-Google-Smtp-Source: ABdhPJybVPjddosnANxgRW+YEKwDBQ2BDvC3NfKRXzrSRZM/pVpr8nZf04up0jMePl53Kyut3sgHNg==
X-Received: by 2002:adf:d852:: with SMTP id k18mr11702606wrl.262.1612638856546; 
 Sat, 06 Feb 2021 11:14:16 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o124sm12800280wmb.5.2021.02.06.11.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Feb 2021 11:14:15 -0800 (PST)
Subject: Re: [PULL 00/46] tcg patch queue
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
 <CAFEAcA-+Y+NcPdct_APTPnEA-rngyFwHbVEvwKvT-hWTHBqSJg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cf9b629a-a6e3-9648-350f-b9d53a671c79@amsat.org>
Date: Sat, 6 Feb 2021 20:14:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-+Y+NcPdct_APTPnEA-rngyFwHbVEvwKvT-hWTHBqSJg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.105,
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
Cc: Helge Deller <deller@gmx.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/6/21 3:28 PM, Peter Maydell wrote:
> On Fri, 5 Feb 2021 at 22:56, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The following changes since commit d0dddab40e472ba62b5f43f11cc7dba085dabe71:
>>
>>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-02-05 15:27:02 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210205
>>
>> for you to fetch changes up to fb6916dd6ca8bb4b42d44baba9c67ecaf2279577:
>>
>>   accel: introduce AccelCPUClass extending CPUClass (2021-02-05 10:24:15 -1000)
>>
>> ----------------------------------------------------------------
>> TCGCPUOps cleanups (claudio)
>> tcg/s390 compare fix (phil)
>> tcg/aarch64 rotli_vec fix
>> tcg/tci cleanups and fixes
>>
>> ----------------------------------------------------------------
> 
> 
> Applied, thanks.
> 
> Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
> for any user-visible changes.

FYI I couldn't do incremental build on my TCI configured directory,
but it works again after blowing away the whole directories. Not a
big deal as there are mostly 3 TCI users and 1.5 testers.

[I had scheduled to test this series during the week-end, no time
during the week. Eventually I'd have reported that issue earlier]

