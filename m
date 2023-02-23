Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF976A093E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:00:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBCA-0005Oa-Mg; Thu, 23 Feb 2023 07:59:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVBC8-0005HA-Rq
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:59:32 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVBC6-0002LQ-U0
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:59:32 -0500
Received: by mail-wm1-x335.google.com with SMTP id p16so6567606wmq.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 04:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dpIOgQIGZTKMW6p4ox1eZboTeg4GC7hWCIZTgT0rSwc=;
 b=AOu1Bi9QZfMzLJU1WY4mC+JHgUTWxqSn1Pj3+d+e1++F5W/2JEqAB51OG/iOl3LTv2
 Cmr6eT5KCD+wFnDTnrYcer0Pt6Od6dtDXD3eAy/VppLg6kHbaTjodNCoDhKSE8K26ixE
 2pBcVrHdpzWE4BcTHSXmKvODHAzBYhuB/rv0LaVcaxkRy4OmxUVRS7/Lq3j3xJkfHm0n
 yOeOuTd7vPLKQbgnq4iyNzAq83+yJVT6/ac5uqIDzvkNVY8KnoMsvkm5xWYGcV9UexUv
 w1sXYdLchMAFdSqr7DT9gHngMRPl4sPiFRPklWeakqbWeUF7KSW5z5iA7qHA3VWYsctq
 CQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dpIOgQIGZTKMW6p4ox1eZboTeg4GC7hWCIZTgT0rSwc=;
 b=xK4JhnkykLggKbuDfwwsK+7PYyqB67bcsgIr7ZzRFIRFNHUmA0JP/Ut+lZNWTlUx0t
 IbPCI/JkAIMDGbNX8SGX2gOTeJCwAByyxhmAwklASmK04cUYePXFnStGdNcB8juZl51o
 py0Pdcn0ahGr6hXFmpKG5V56S9ELvTkF0aLiS4/iuDd7J34FcJp6dpnzgBB+o6mUbXhL
 5VfynFVTNlZ5+H2c2irOsqhamgw8hrn4a9KlXAV+F3xgUsnDexytxN/V58YCKMtE3yRA
 teU7gEjarmXyuCiPTFnXgI0AvCJj7oE6/669coDQBhHBs5dGqrMGwpufzt5L145bFbN2
 PJdw==
X-Gm-Message-State: AO0yUKUb63HvrewWC5hWlYFyzDuxSz+3DS0KntsSsS6EMeeBtjA1K/Vz
 W1+zTGkAVgPIgJI0oEI8cEzdOg==
X-Google-Smtp-Source: AK7set92ci87NfaCTaPbXUZghN1HXC1ejUWkRb55u3GeWo07oXYyEoZF1GCXvjL0NMAjlo9ntWvRQA==
X-Received: by 2002:a05:600c:a698:b0:3e2:1e31:36bc with SMTP id
 ip24-20020a05600ca69800b003e21e3136bcmr8068486wmb.12.1677157169334; 
 Thu, 23 Feb 2023 04:59:29 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a056000108600b002c53f6c7599sm8535958wrw.29.2023.02.23.04.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 04:59:28 -0800 (PST)
Message-ID: <0d17e82c-4226-84fb-9301-644935d326e4@linaro.org>
Date: Thu, 23 Feb 2023 13:59:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL v2 00/36] Testing, docs, semihosting and plugin updates
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Richard Henderson
 <richard.henderson@linaro.org>, Emilio Cota <cota@braap.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20230202160109.2061994-1-alex.bennee@linaro.org>
 <01d13cc2-f346-71a7-d941-2d1a0dc42514@linaro.org>
In-Reply-To: <01d13cc2-f346-71a7-d941-2d1a0dc42514@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 3/2/23 18:38, Philippe Mathieu-Daudé wrote:
> On 2/2/23 17:01, Alex Bennée wrote:

>> ----------------------------------------------------------------
>> Testing, docs, semihosting and plugin updates

>> ----------------------------------------------------------------
> FTR I'm now seeing this warning on Darwin/Aarch64:
> 
> C compiler for the host machine: clang (clang 14.0.0 "Apple clang 
> version 14.0.0 (clang-1400.0.29.202)")
> C linker for the host machine: clang ld64 820.1
> Host machine cpu family: aarch64
> Host machine cpu: aarch64
> ...
> [1/3253] Linking target tests/plugin/libbb.dylib
> ld: warning: -undefined dynamic_lookup may not work with chained fixups
> [2/3253] Linking target tests/plugin/libinsn.dylib
> ld: warning: -undefined dynamic_lookup may not work with chained fixups
> [3/3253] Linking target tests/plugin/libmem.dylib
> ld: warning: -undefined dynamic_lookup may not work with chained fixups
> [4/3253] Linking target tests/plugin/libsyscall.dylib
> ld: warning: -undefined dynamic_lookup may not work with chained fixups

Googling, someone suggest to use --linkopt=-Wl,-no_fixup_chains:
https://github.com/bazelbuild/bazel/issues/16413#issuecomment-1270603343

This doesn't show up on GitLab which uses:

C compiler for the host machine: cc (clang 13.1.6 "Apple clang version 
13.1.6 (clang-1316.0.21.2.5)")
C linker for the host machine: cc ld64 764
Host machine cpu family: aarch64
Host machine cpu: aarch64

I guess I'll just ignore these warnings.

