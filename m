Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB03621635
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 15:24:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osPVp-0001tT-5X; Tue, 08 Nov 2022 09:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osPVn-0001t0-E2
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 09:23:35 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osPVc-00043O-50
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 09:23:35 -0500
Received: by mail-wr1-x431.google.com with SMTP id y16so21174157wrt.12
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 06:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cJcqIKV4hqGF4gqiXIh71YwD0/bUxj1G/w7iBsjN2/A=;
 b=ZRhotg1RelTMKIQ1VF5Fa2InRkFoSnuqsAiZXFO98LgX7uc3xj5+mb4x+C+ETbcTrW
 KmIgu0PKOptvVMevuSgenyqDlku3C/D4jjU33oK4r1Z/h2b71KFBsHZYduxfnSj2+rB1
 aYxjWIWqrmwL9i4fZKqF2NeF7CWAatrewgwl/hsjsKZLlE/e82MzTgy4alb9TEBG0oSZ
 4Wj/+AUx4L+Nn2unOO6K95k4qNG/Lpc99ExbCYNNYZXyoTSTHq3fE799MoCg/1xhyNoH
 ItjsqWg6ToKiJGFoP8er73kA820nps+CFRcE0Yq37UCiZnda8Oha5gmDwAAXScPFV1zf
 4+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cJcqIKV4hqGF4gqiXIh71YwD0/bUxj1G/w7iBsjN2/A=;
 b=4HdILsyWo9OKTCkUbMSXMBHs9YMuGhdniAaX3jO5KS+p20TbdoBiPFSP582EEjU3ro
 gDmk3XFZebGApT6WnxdqbEkJeKoSoRi5IeA41G812hGKkChMHoO3LnTtOoNNqRYjxqez
 VZYlw4hXlMoQZEHNSa2N78v+8jvd1QMNb64s+RExlFadqBSbl5ie++RthWxxf1+6xykM
 RiYc+JpahU6buINt4z8S/L3OnX2auuIMNvrAsXaihvwB8L72gN7H+BK35oCy79ZIVcHe
 QkGE0QMFgO4e8jIggt9t8QKNXLyAuEeUWpeHgp5C0Hama9kz0S0QzMFMFt9JRYpnQIy6
 YWVw==
X-Gm-Message-State: ACrzQf1uXZ3pZj5u0hTUb1yLGbgKWDqe00hz0LS5hyoB5kLUYm568DV5
 gop2jo9boYYVekZqB1vXtJrQWg==
X-Google-Smtp-Source: AMsMyM6Jy0euBxmwgvyTnTFkoC1uzFByg8TTML28kxDD6ZQAgi2rpxTR+3p3tx6BJgc/j1bierv4pw==
X-Received: by 2002:a05:6000:16c8:b0:236:c60d:22b9 with SMTP id
 h8-20020a05600016c800b00236c60d22b9mr31767415wrf.526.1667917402674; 
 Tue, 08 Nov 2022 06:23:22 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a1c7905000000b003cf6e1df4a8sm11035696wme.15.2022.11.08.06.23.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 06:23:22 -0800 (PST)
Message-ID: <ed6dcb59-a936-e254-4786-0630cbe80f0e@linaro.org>
Date: Tue, 8 Nov 2022 15:23:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PULL 00/55] MIPS patches for 2022-10-30
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Michael Roth
 <michael.roth@amd.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221030222841.42377-1-philmd@linaro.org>
 <CAFEAcA-d=GrGNm9vhc6Q-UnQAQt+RLnwRj=dbif=iMKTRAabpQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-d=GrGNm9vhc6Q-UnQAQt+RLnwRj=dbif=iMKTRAabpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 8/11/22 14:59, Peter Maydell wrote:
> On Sun, 30 Oct 2022 at 22:29, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> The following changes since commit 344744e148e6e865f5a57e745b02a87e5ea534ad:
>>
>>    Merge tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-26 10:53:49 -0400)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/philmd/qemu.git tags/mips-20221030
>>
>> for you to fetch changes up to 487099aee951e4966936acd3e9afd24c69de85ea:
>>
>>    hw/mips/malta: Use bootloader helper to set BAR registers (2022-10-30 23:08:10 +0100)
>>
>> ----------------------------------------------------------------
>> MIPS patches queue
>>
>> - Convert nanoMIPS disassembler from C++ to C (Milica Lazarevic)
> 
> Was this the last use of C++ in the tree, or am I forgetting
> some other part that still needs the C++ compiler?
> 
> If it is the last thing, we should put in the "Build Dependencies"
> part of the release notes that a C++ compiler is no longer required
> and mention that the configure options to specify it will go away in
> a future release.

I guess the last use is from the Guest Agent on Windows...

$ git ls-files | fgrep .cpp
qga/vss-win32/install.cpp
qga/vss-win32/provider.cpp
qga/vss-win32/requester.cpp

Cc'ing QGA & Windows teams.

