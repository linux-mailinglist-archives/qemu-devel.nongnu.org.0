Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70C940B0DE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:35:16 +0200 (CEST)
Received: from localhost ([::1]:39420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9Wl-0003CU-Jb
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ9MT-0006CF-4H
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:37 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:39539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ9MK-0005Om-2A
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:36 -0400
Received: by mail-pf1-x42d.google.com with SMTP id e16so12382331pfc.6
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2IJeeMZ5LA8x9rZ7j5OCC1a8TuD2z4XMD+mbKK6Oqwc=;
 b=MJyHvrHIdm71LPR+ruOaWBGMdmaxeWKrBrs057kttY8YYqzgofNOV2H1NfzEciP2XX
 pbJhlNkRLKyQRHTtVMjeEJDY+526Ec95o2FkgZCjKlvbRMnqRelerNQ60VHWwdH9/gr4
 e2Nku4yUg7hS0ufb60ulUFVg7XEE/MCsn+SpL8RMWHmDQCxf7wnMC3WccqNM3EXKwFTv
 zPwfdna3F50cls7NUTAPVXR40gPymxwf5Wl8FlzcxkdOcNtVWSJIeL8UU6B91SHk+e82
 ouBmNGZBmM7h82QNmi159ilk0fpv7iwUHm0pSC0MqSbpwtGzkQG6lmvdrxmM1OZAK6+H
 84RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2IJeeMZ5LA8x9rZ7j5OCC1a8TuD2z4XMD+mbKK6Oqwc=;
 b=a8ccwpXChzcZfD3lr8EUriE3knLJsKMidL4IQ/8aibRaTyhMX1Hpb+sVVIHotBr8tK
 ZYmtefBTRFTakOEiF2J5WMfGN6wdxxWysq/AFgW0M4EkrSoBoD40d5Uad+sd9CB/lka/
 BenOMgvaUNGmRZAE/JHCNPGT1V0sk8goT7OgZKVc1xq6lOR3BGPFpRmHFQburo0eLqfy
 +zYXlmBU9XLnIGMG/IzqIncrOE3p5EuPhKYTcApiYad9LAyb6DojkW5dRXw3tFIZarO3
 5oelZxxtba0vnaQWLBoKKz25u++MAZ7JidENuNJ7ZBijBGxeqllrXM0a+pUtCA+ZMg/D
 Q6Ug==
X-Gm-Message-State: AOAM532mDMKEolZneh6QVLWvA/u2aSkPv0mwyIjZ/i2/fDD8i2JS84NB
 PhRX/hJAywHrlWJxagS4iSaJCw==
X-Google-Smtp-Source: ABdhPJy7RJN78z7ACNkngNn7Pu4CjYQr6laRqoQmOegdLkimd7bTjRTCrO13zO21Yz7Uh1eEfJjBpQ==
X-Received: by 2002:a63:4464:: with SMTP id t36mr15819756pgk.4.1631629466290; 
 Tue, 14 Sep 2021 07:24:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ch19sm2102966pjb.33.2021.09.14.07.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 07:24:25 -0700 (PDT)
Subject: Re: [PATCH v5 13/21] target/loongarch: Add floating point move
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
 <1631624431-30658-14-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2fa2e704-8c10-76fe-8852-49ce6e22ea30@linaro.org>
Date: Tue, 14 Sep 2021 07:24:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631624431-30658-14-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 yangxiaojuan@loongson.cn, laurent@vivier.eu, peterx@redhat.com,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 6:00 AM, Song Gao wrote:
> This patch implement floationg point move instruction translation.
> 
> This includes:
> - FMOV.{S/D}
> - FSEL
> - MOVGR2FR.{W/D}, MOVGR2FRH.W
> - MOVFR2GR.{S/D}, MOVFRH2GR.S
> - MOVGR2FCSR, MOVFCSR2GR
> - MOVFR2CF, MOVCF2FR
> - MOVGR2CF, MOVCF2GR
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: XiaoJuan Yang<yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/fpu_helper.c            |   6 ++
>   target/loongarch/helper.h                |   2 +
>   target/loongarch/insn_trans/trans_fmov.c | 153 +++++++++++++++++++++++++++++++
>   target/loongarch/insns.decode            |  41 +++++++++
>   target/loongarch/translate.c             |   1 +
>   5 files changed, 203 insertions(+)
>   create mode 100644 target/loongarch/insn_trans/trans_fmov.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

