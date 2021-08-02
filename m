Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934F43DE027
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:39:48 +0200 (CEST)
Received: from localhost ([::1]:45168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdmt-0007f8-67
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAdlw-0006zF-PX
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:38:48 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAdlv-0007qC-5w
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:38:48 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so447742pjm.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 12:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VaSuD8rhnw3g8tLFHIrdJTo5EQcGv09vVFdpV+6zoOg=;
 b=ik6RNbbpy+zg2XKnZX7iq5Msv5M0umyrOZT18FE0t1O8O1LiwE/aYMwWgaz75uVSzF
 eDqPZims7xK2cvu/IsLcBwIdFH7jvO6yZ8T7T/w/ELlj6nNNdwCGSzr375fgZVIZXyVv
 rwf2Igc8RbUtxYaEvYEe6deDVP4QU0E62qhYm29myfNc+VhS70nz46rlcyfRu24Jdehh
 2hF6foeHG9Duesw/EErxOHy12x12KHLB+8YxBmQSxcJA7g2QT5fnN5GmXBx2rck6DfrC
 ea+uoOdWtjiJEnJ2IkUwjUmL5pGxsvOLKDzTZSHyWRE2tpBx/0Z4XiIp4OUtm8rVOitC
 Ahvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VaSuD8rhnw3g8tLFHIrdJTo5EQcGv09vVFdpV+6zoOg=;
 b=DMSbROa4LEEAh0mb11MCvP37Nv3HkfaHkpju2CvCIlN6u5nuJBDt9l9ivaHtOiNsoh
 qW6QpmOCMeZsc4/TnHEEZWIHghds3+rtO5djOYeXhcl7NGQyh2WfVJ5MxyserKwBhr6e
 FtzC67QtSIYQ63h78XBVuprKJED98OcMmhDF/mw9VtuLvi/jV92xfWRzaifCOSO99xSS
 wrol0WjVswxyEKgTknrTmdzN8ydTo+B2y/rCOmQ+RsbGPofxpCDJlGm5wTuPAqAu4P8Z
 REP+6nNEuvhj2MRK9j6xpGFFrJFFbJj5GVrbhscZC2BXORARVB3p71YojFW0uuOl/rld
 S0TQ==
X-Gm-Message-State: AOAM531/GWr5uHsPkf/0NCMvt/9h6vk+Lau9ZGsn5N0QGpKg0rZeLQxB
 pcYm3Kyxs408+MlE4wwkRb3+Zw==
X-Google-Smtp-Source: ABdhPJzy/OWf/O7QYVPyHxUn64zhM9wNYFVtU/5W0tG4cRVv2nIgWWSU5q+Uj1pGSjtFaOV+HROsiQ==
X-Received: by 2002:a17:90a:987:: with SMTP id 7mr431592pjo.115.1627933125429; 
 Mon, 02 Aug 2021 12:38:45 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id a8sm657363pfk.219.2021.08.02.12.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 12:38:44 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 4/4] target/mips: Rename 'rtype' as 'r'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210801234202.3167676-1-f4bug@amsat.org>
 <20210801234202.3167676-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8dd3bef2-5364-391b-dbad-df7c77714d5b@linaro.org>
Date: Mon, 2 Aug 2021 09:38:42 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801234202.3167676-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/1/21 1:42 PM, Philippe Mathieu-Daudé wrote:
> We'll soon have more opcode and decoded arguments, and 'rtype'
> is not very helpful. Naming it simply 'r' ease reviewing the
> .decode files when we have many opcodes.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/msa.decode       |  4 +--
>   target/mips/tcg/rel6.decode      |  4 +--
>   target/mips/tcg/tx79.decode      | 14 ++++----
>   target/mips/tcg/msa_translate.c  |  4 +--
>   target/mips/tcg/rel6_translate.c |  4 +--
>   target/mips/tcg/tx79_translate.c | 62 ++++++++++++++++----------------
>   6 files changed, 46 insertions(+), 46 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

