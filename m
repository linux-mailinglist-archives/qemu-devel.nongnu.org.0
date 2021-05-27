Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DE9393183
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:54:21 +0200 (CEST)
Received: from localhost ([::1]:52864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmHOu-00015J-6l
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmHMW-0005JZ-RT
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:51:52 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmHMR-0003pI-UI
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:51:49 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n4so187874wrw.3
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 07:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3Ber4LEMDvF0fJsnwmKCi/cHaS35D9fM5y/DunQTl3s=;
 b=AMSaz805q4XLxejsdpKJhtbZ7CPMQTU/D7LcrNPmGtT/JNhDR+u86XuxSpE72RVk/J
 AaSqHUz/8gTfmGDDdfAs8eZs8e/BW/dsUdhk1oBT2dzq34+SddB0avUA7ZZeTjMGHDua
 sdiCG281zk4OSuCwj3L2MOsZ3dLNBhgXEauZtTU3pCKQFxZqxTm0NUPmxcXO5FYXKTAu
 ndK/MAXMtwTZ86rDwHFNRjHOBD4VU6Bu6NE4Kgma1Zsf1Xv+BnuhrAunDZnXErqmvipj
 r5mCznDu8oQbYuv/W9OqxVuTxmOp1zrFkJSVE0+M3Rpk4k1XBgJm6EPKzzIoRLYpUcRM
 wgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3Ber4LEMDvF0fJsnwmKCi/cHaS35D9fM5y/DunQTl3s=;
 b=CRGYL0QOaFxrE61BFye8VH/s/z3JvCuArTmvZ5UoVR+ydnr010BA2s2lOh9gALsVne
 lSjAo0tt3SXcF072R+aSRkULNawNVFX4u5pVQ8wdNAn45qNhcuAWfODFSc1Aalxy49ax
 p1brSBIHC5R+0nd7ylRrKW2ZtgrN/+cD7iphXe7VWSAgPeCA8acJG7ymsr9J5WMUhKyn
 8pe3l5ysFa/U1Kha/qxOG563TMUVpX8Jo1HyYD+gqlsDjCjXlyusRqd//KSCMrgs6Sgv
 7e69s8cKNQkWqXzl0drK+R/+bbTIKBe7ksklhbiYJ5sDvTJ8a3SNWKIchg/dOd7FTHOk
 FENQ==
X-Gm-Message-State: AOAM533osIMV4rtlsUPY+Hivhw4LR4MXt7TpV3/ODH0Z6LK1eYMdWfH9
 w3qeQvMlLCc8Kj/k86RCe98=
X-Google-Smtp-Source: ABdhPJxlH2HEaBfERMJT6wO1bnOALpAk7gRAMwyHCaUYJtUWUV4RxyAE9iBaJPhN5VJ2SX7XjjUy2A==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr4093376wrr.62.1622127106415;
 Thu, 27 May 2021 07:51:46 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id c64sm11315711wma.15.2021.05.27.07.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 07:51:45 -0700 (PDT)
Subject: Re: [PULL 00/19] gitlab-ci patches for 2021-05-26
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
 <CAFEAcA-goVUqVxMd9QmvFsUUky0d1MmJ4N7A_oK4en-16VbUeA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7209208b-8191-fb8e-5f0a-1cbca7bf5dc9@amsat.org>
Date: Thu, 27 May 2021 16:51:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-goVUqVxMd9QmvFsUUky0d1MmJ4N7A_oK4en-16VbUeA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 3:56 PM, Peter Maydell wrote:
> On Wed, 26 May 2021 at 22:27, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> The following changes since commit 2ab2dad01f6dc3667c0d53d2b1ba46b511031207:
>>
>>   Merge remote-tracking branch 'remotes/kraxel/tags/input-20210526-pull-request' into staging (2021-05-26 15:27:20 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/philmd/qemu.git tags/gitlab-ci-20210526
>>
>> for you to fetch changes up to 740890e8935fff09023bb34c52e74ab1d539b775:
>>
>>   gitlab: Split gprof-gcov job (2021-05-26 23:01:47 +0200)
>>
>> ----------------------------------------------------------------
>> GitLab CI patches queue
>>
>> - Explode .gitlab-ci.yml in reusable templates
>> - Add job to cross build/test TCI on i386 host
>> - Remove CentOS 7 linux-user build job
>> - Split gprof-gcov job
>> - Temporarily set Avocado-based jobs in manual mode
>> - Increase time to hold Avocado reports to 1 week
>>
> 
> Conflict in .gitlab-ci.yml -- can you fix up and resend, please?

Paolo won the race by few minutes and commited 7cf333a3726
("gitlab-ci: use --meson=git for CFI jobs").

Sent v2 fixed.

Regards,

Phil.

