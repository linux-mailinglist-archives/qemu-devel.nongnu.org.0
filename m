Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F09D62D3692
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:58:35 +0100 (CET)
Received: from localhost ([::1]:57554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlwI-0000Vo-Rk
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:58:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlV6-0005UJ-HL
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:30:29 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:39200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlV2-0003Ro-6l
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:30:28 -0500
Received: by mail-oi1-x244.google.com with SMTP id v85so276366oia.6
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 14:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2yI4VHuGJabs7ooQuq5prMjs6mJCDCBvKCDGtTApf90=;
 b=GIKd+Xz5dUZW4BACDCrTg8k9AoR3hGyQv95jeI0sj2LszcmegbtY7VOAPvpvlFPBV4
 eMFTGTvLZ4SmXF7wB9ss3Yb6YSQJmaPPK5vUSIiEcGc9PIT80SPDhiD3EzZYrU8gltqA
 P11ZrVP2eS2Oe6fSn5r0Px4QAoLlkF8yjgGb4XrrcLvDv2DQkTIsfmqtBeoSx6Y66e8g
 0EO86c0njocYB/aH4m3P+w+kSZeHcAlkoq7hA/gq9PLfWvvzo3KugBIJJQcJNrDsZ3Ys
 hZW18r18mbi12BPOqeJDD7/Q13Nlr3HHjZdkpiLDJw7Mc2EARFOl9PGwQWJfvDR7SneX
 8TwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2yI4VHuGJabs7ooQuq5prMjs6mJCDCBvKCDGtTApf90=;
 b=eCIBiPc1zAyIUH4BIoFybeCVkwEQgDUAZwnf630VIDUPrWMWofQkd+ZKQvlK+IBvuR
 KnxILyoyN1KiGX1WLxKcpHqToT3Rt8lEOdN0ga/dXCGmpNCsMgxrdVpYgwYBaOwLcxgA
 5nC2I33LLIn/R0h8rqBGPs8+NGo52Bhtr9c+1ixp7iiZYiGmC1XCrs9DHd1wNs15Ni2p
 WKNY9r+K2uAz2dPP6+dZJzRMZTiGgwpZuhsZqMqt8Su0w8D5TqG9XXn3TyrJwmel1QTl
 RrewXwDAhKdv4p0kDFPMbKypnrD2sO2ovOql2/7bWNHjCmJclCOxz/+9TbccT3mEsLYf
 NLPw==
X-Gm-Message-State: AOAM531tbca8zDCZ/G7UdEbaXSdj6iVJYasJuhPdpQ8mDzc65yMrxxV0
 qTZ1TBtdAdNUOZz/+yJ9LOVl3A==
X-Google-Smtp-Source: ABdhPJzWPK4dKug6Hg8z2BjFoQ7ubgZPPLYDWDmujFKKY4nSu09XAekU5vYsXWdF6Gd1Ok4LMZf0gQ==
X-Received: by 2002:aca:d841:: with SMTP id p62mr87833oig.38.1607466622877;
 Tue, 08 Dec 2020 14:30:22 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o6sm81671oon.7.2020.12.08.14.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 14:30:22 -0800 (PST)
Subject: Re: [PATCH 17/19] target/mips: Rename translate_init.c as cpu-defs.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-18-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56eefa47-f95a-087e-54d2-05135d2c506d@linaro.org>
Date: Tue, 8 Dec 2020 16:30:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> This file is not TCG specific, contains CPU definitions
> and is consumed by cpu.c. Rename it as such.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> cpu-defs.c still contains fpu_init()/mvp_init()/msa_reset().
> They are moved out in different series (already posted).

After the other functions are moved, then this file may be compiled separately?

Or... why is mips_cpu_list moved?  I guess it wouldn't be able to be separately
compiled, because of the ARRAY_SIZE.


r~

