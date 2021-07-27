Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236803D7B37
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 18:39:57 +0200 (CEST)
Received: from localhost ([::1]:39008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Q7Y-0002Ps-5C
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 12:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8Q6V-0001hz-OZ
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:38:51 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:34558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8Q6U-0005zu-3j
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:38:51 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 b1-20020a17090a8001b029017700de3903so3467399pjn.1
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 09:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B5/XZR2YjYURokNGAElRJWSbrlf3CspfuDFs4h+qppY=;
 b=y87nU+AV9Z9cgsbCXrNC0QIt1sBsQNM00dW7fg4dHPLxZUA9I2TblmR4OryQWvzQAV
 Vr4KJ8T52uasq4ccmCowbMyD/49ENXTlJ0Lppcy8y4AQQgfMSFaBBKrn/39v7DCKBm2r
 McADDe+3TwvYWqsiElXMTOpnzEDM4dVOmrbihgBnYO40rtiymU0CwmDnxwjXtPFDHQVd
 ds3QoMSyAK9zRAVMmhNHLDusCZRtHmJMe9J4BKSsN4+WmSTFpjj6xh8G1kqpluZXuF+K
 ll0DBzcxCISMB3TMXw61mhbER4xR6hreEBkmhBzvVUzhT0SwBuzwIVtd09Fz1Q780QJa
 7kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B5/XZR2YjYURokNGAElRJWSbrlf3CspfuDFs4h+qppY=;
 b=rjGHZPH+S2Q4zBsS14cff5OT0Oa+m+Yy8xbXgMQ+uLpIMH1CbEIxGdqIXY6n2OQBOT
 2xIKojED05vuNSwA7R3mD22my/g+oujuJk6IvLpvz72CQSk/1fwte4hCUNZ1DMwQO8EY
 2+tg0+gcxoc7z+OPUeHK8UZSRqggLk5Ja8vB1uW+uGROT99iSBPYeJ7yrunRNWfw2EsY
 TXvc+07iThzjZzVLD4CPmHfTv2D2cPmMP7vyaWLqyob1+keA2ITbray6or6N9H1GlEFc
 sRFvWW1M7DsEERhGDxq/qeq+3/Pcm6q0B4H8gpxcQKYZhDvEOcaMshZPbOyY3EKbWxVs
 xctQ==
X-Gm-Message-State: AOAM532nZRdpZqAjFtCX/SH+eV2jmxv8jejj+BQ2W3MfmisZqPe0TMMG
 ZkgkACBiBV8JfCMUCAoBgJy58w==
X-Google-Smtp-Source: ABdhPJzx6b2/FrWwF5+dQNlKtMQbx7Rnkv/dKY8TQ2i7FA50HNyrhQxCAZtW5bnjqqCzlwJHaWkkdw==
X-Received: by 2002:a63:6e83:: with SMTP id j125mr23718324pgc.12.1627403928326; 
 Tue, 27 Jul 2021 09:38:48 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id q21sm4309666pff.55.2021.07.27.09.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 09:38:47 -0700 (PDT)
Subject: Re: [PATCH-for-6.1] target/mips: Check nanoMIPS DSP MULT[U]
 accumulator with Release 6
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210727083043.1504402-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2ac421d3-d462-0bb2-dbf5-c8ae56eef075@linaro.org>
Date: Tue, 27 Jul 2021 06:38:45 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727083043.1504402-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
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

On 7/26/21 10:30 PM, Philippe Mathieu-Daudé wrote:
> Per the "MIPS Architecture Extension: nanoMIPS32 DSP TRM" rev 0.04,
> MULT and MULTU opcodes:
> 
>    The value of ac selects an accumulator numbered from 0 to 3.
>    When ac=0, this refers to the original HI/LO register pair of the
>    MIPS32 architecture.
> 
>    In Release 6 of the MIPS Architecture, accumulators are eliminated
>    from MIPS32.
> 
> Ensure pre-Release 6 is restricted to HI/LO registers pair.
> 
> Fixes: 8b3698b2947 ("target/mips: Add emulation of DSP ASE for nanoMIPS - part 4")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/nanomips_translate.c.inc | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

