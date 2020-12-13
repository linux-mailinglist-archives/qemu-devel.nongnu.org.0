Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F772D8E35
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 16:16:47 +0100 (CET)
Received: from localhost ([::1]:54972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koT77-0007Dt-Ca
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 10:16:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koT5U-0006eu-5M
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 10:15:07 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koT5S-0008CT-Kz
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 10:15:03 -0500
Received: by mail-wm1-x342.google.com with SMTP id x22so11523672wmc.5
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 07:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QvOnvetAkofiz4o2O1NSK1gfY9p/VBeMnrWAMgwr5xM=;
 b=izSGqmvZpiylUl21oWwmEeFWslXpckr4RMih+abVK1Q1xoUElZgVghMph1RL+aCz5d
 d1T0zuFgrw6BQKYZJOCI3kgakxjE3/fYwDgNef2RV7Gdd3II9EzTonthCfqodyfZqIrc
 RD2JUZHbO/o+EB/Psb0aKeCPg8dqKW4JM4Xr9zIaL6tKmUigSlynqp+7fZS3Kl8owifu
 /Fw4b5arMr9HZLHAic3uX614+XaRbFaOtL8qBV/GBIcLfAXIUu2lQFMVDo697ds0Ovnr
 6P6+RlvA+bxUNVMtq4LIoxOmooHkktxqk2jBbMCJbxi+kLbUSiRvsqLfY3+fQloC80QV
 Ny9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QvOnvetAkofiz4o2O1NSK1gfY9p/VBeMnrWAMgwr5xM=;
 b=cKhj52uuRgB/VHpUVkAw/NeE3BVFIffdQCrTS1HnaIObJj1VrUKPTt/dXlmQTyfoX0
 Ro6P2r9T4ZhbMm30s6l6GRC1v9MPBT1LHVdaXZE8BNKpjbT+kMLcBXy9shD+dN9qTheE
 Hj42fZk3nT+zRHhkSN90Gm5rcQdjLsL1e6PIKe7uwzbydaxvSqrsWqBWisZfw2pGafyB
 zoA3S43ZYF0fQXHuso+hyCGuSrGb9JU2bE9sLkAxGllqzDQN/1SLKY7mrVpr9ht0mY0P
 oGjaVKpLU86prhoa4plFb6TrEnNNBjEpLoCGYVXBRXEQ0IKJz7/r+8unIAFAP4T05iPD
 0a3Q==
X-Gm-Message-State: AOAM530Vsv9WAD2A0o8carwPygiQc8yY22bB5BRuAWkImGvA/4MSuz6q
 nBuqn3euinmbSmMh6S0+/Ks=
X-Google-Smtp-Source: ABdhPJzoTy6LwiHAB4EYYBOlk1vNeqd1veZgEh/a88nQ4H54hoHAaRXv5hxcWLWlJTW8hwCxZO4RCQ==
X-Received: by 2002:a7b:cf0d:: with SMTP id l13mr23828614wmg.168.1607872501004; 
 Sun, 13 Dec 2020 07:15:01 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n17sm24552316wmc.33.2020.12.13.07.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 07:14:59 -0800 (PST)
Subject: Re: [PATCH 0/4] linux-user: Support o32 ABI with 64-bit MIPS CPUs
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
References: <20201119161710.1985083-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1800efb3-fd88-8bfe-7347-85c2fc8d656e@amsat.org>
Date: Sun, 13 Dec 2020 16:14:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201119161710.1985083-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

On 11/19/20 5:17 PM, Philippe Mathieu-Daudé wrote:
> This series allow building linux-user emulator to run ELF
> binaries built for the MIPS o32 ABI on 64-bit CPUs (binaries
> produced by Sony Linux Toolkit for Playstation 2 for the
> R5900 CPU).
> 
> The new QEMU binary is named 'qemu-mips64o32'.
> 
> The binfmt config isn't correct, as it matches mipsel/mipsn32el.
> I missed to understand how mipsel (o32) and mipsn32el (n32) are
> differentiated.
> 

> Philippe Mathieu-Daudé (4):
>   linux-user/mips64: Restore setup_frame() for o32 ABI
>   linux-user/mips64: Support o32 ABI syscalls

Until we figure out the issue raised by Maciej in patch 3,
can you review/queue patches 1 and 2 which are independent
of the outcome?

Thanks,

Phil.

