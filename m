Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356611EEC12
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 22:33:56 +0200 (CEST)
Received: from localhost ([::1]:60196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgwYl-0004ps-6k
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 16:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgwS1-00047e-0j
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 16:26:57 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgwRz-0006Te-01
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 16:26:56 -0400
Received: by mail-pf1-x443.google.com with SMTP id d66so3794014pfd.6
 for <qemu-devel@nongnu.org>; Thu, 04 Jun 2020 13:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wPHuLyhdI9K6tKUn0jL6BmlikqNCx/CY/2TYID7RL8w=;
 b=DGM7KJcVIhzXTSNeUtiuZUnpQhnKtAJLHj7iNx4y9qBqkXj/dkevxdCKlRf254wykT
 30TGNNwtZsCKxvDdNw7V49cTcCKm6ioRXSlV5sGBl/X/skmv4zH8wrLKnfdvSjOa42Gg
 BQG79Tbl7AbsIhwB2/abLxejm/847sfysY31Y7zOmLW1hEystTwT/4Prz7sfP6YgqFqj
 an4NnZ/D7du/VYJktpxDBrUoFzQaZ3pXz1q0VuAmF32rOP+UKQMrt42PM7mkZnk961J5
 BZNATQY5a+akAJPCKAVglzxy6lyJ55vJaReuXGvq/ZaSRGSa2f7HsbyBxHtHBgKk6ouC
 lvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wPHuLyhdI9K6tKUn0jL6BmlikqNCx/CY/2TYID7RL8w=;
 b=ej/dVap05uPQ5VGWGxhC4lPtTvtL0BtTqpxMaRNTS9LaxozbBVLcc1BjZrX9yoRWE8
 Q6SWaUcEQQW0v7zbMzNmaarO+IUpmUwLLdLql6iwCguRu0fPwfXFNhGuc5KN0BXeLfCN
 GTAh/VI24mdt1lE/wdIXuwg0pmGh/3a7XHDooJBiFmf54R/zyR/mkBwc8ETqKREkozAW
 EYdzbzNZRMBVKlNn+QYMAKn1qodW+DCmKNM0Tvctwmyg/kL1Pw7vX+xwej567T+QK8c+
 DXnXvxV8LXi9/MAytvd+bcHbT/X2PHB7j7nPSFTkkR0mvWojhddb2E8PYiA4BH5n5ICZ
 w7MA==
X-Gm-Message-State: AOAM532qk7sfeOEgWFMxtGWecfrkldfAxRss/5siKGwzUaXhXioskBua
 SrbBMNU614NG+AMJmiO1vjBQ2A==
X-Google-Smtp-Source: ABdhPJw3wAaHI24KJWkDJrRh5zuQ1ebOSCJ56r6nBeOJaWBoWEIzG/cs7sRE0GaOU++jXmXAvvSjyg==
X-Received: by 2002:aa7:9839:: with SMTP id q25mr5973957pfl.291.1591302413349; 
 Thu, 04 Jun 2020 13:26:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id x8sm1895103pje.31.2020.06.04.13.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 13:26:52 -0700 (PDT)
Subject: Re: [PATCH v8 26/62] target/riscv: vector single-width fractional
 multiply with rounding and saturation
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
 <20200521094413.10425-27-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1b8dfb1c-a8b4-0d3c-b727-0a640e400c74@linaro.org>
Date: Thu, 4 Jun 2020 13:26:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521094413.10425-27-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: palmer@dabbelt.com, wenmeng_zhang@c-sky.com, alistair.francis@wdc.com,
 wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/20 2:43 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/helper.h                   |   9 ++
>  target/riscv/insn32.decode              |   2 +
>  target/riscv/insn_trans/trans_rvv.inc.c |   4 +
>  target/riscv/vector_helper.c            | 107 ++++++++++++++++++++++++
>  4 files changed, 122 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

