Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E15D67765D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 09:38:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJsKZ-0007mh-6j; Mon, 23 Jan 2023 03:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJsKX-0007mF-Jh
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:37:29 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJsKV-0007Vh-Gm
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:37:29 -0500
Received: by mail-wr1-x436.google.com with SMTP id z5so10022280wrt.6
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 00:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IUIgary9RXENMxy7nzJ7Ao0W0cQ9lm20rzbl8LXNc/o=;
 b=itGVZoO2NBBOlEp/nu8KvSS9A0QiULjjW6nlGQFTHkLrjs5bjImL+3gmcFTZm2pPWV
 0kPT78ftyX43ivIdznC07jur6L6aFsVzrVHJCjPjwwCfbQ1DbP8+8COyE87NXIdo4K1J
 uFQg6/VUlAf+pg7V3SNCqVbvUs/lJzWmnsmV/Hfqz7KdAG6iRR81b9+vOT0tC4iwhfZu
 klflg3ye8eQrYtawshYARAqxDQcSyKWXxEkjQfu+LfoekdO7EPs8JnOT1krbapHDhsW+
 9jmVMYQ19T527DZgHRNiekvsfyrcO+TB3Vb1cD2fVK01+SHKX7yQwKCByiEf5fOnU+/m
 bRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IUIgary9RXENMxy7nzJ7Ao0W0cQ9lm20rzbl8LXNc/o=;
 b=lc4NBZISKt3dYOOfW20CabSTP9nw0MuornTmPwc/k4xWcJw06hPEPoxFr6VeVLEEGN
 w8SbTsr1FqB8uKTvQXA/HwBUE0egeNasakGUGlwqqtWprB74hfE3goF7l0ijikkyxRJq
 wTO4+ny7VCcyWz+OQJa3veTNFG7km3HbeMWRR+WOyg27GS6earxJJgk3fFunF+/hHRZ/
 bKaJ0upaRlH1JVPw4sFFxTPV/1w9nCFBwLDOQcKiiTBNVAlcNxSBpC4hXCklf3x5UKS4
 Y7W8vO0+i8jDV3X3go5fGq0wNoZmtrBbkbyjWgv15HxGEzfuPkioDL/xprvI6s3swpnZ
 OigQ==
X-Gm-Message-State: AFqh2kojrOrAcORdEFSDWG+YMIEzkXaCaIayhAGNslXn3xnAkl+ldaMX
 wspsfG3zozDYt2KDTILs/C/ZZ3vS1qW97ks+
X-Google-Smtp-Source: AMrXdXuCURM8NDzKIrBS0MWqDdThBovmq1aM0KoG2jipvDoIiqzZ3r2U8vdKTe6Sek0FVm2CzdtWIA==
X-Received: by 2002:a5d:660a:0:b0:2be:5162:c8da with SMTP id
 n10-20020a5d660a000000b002be5162c8damr12272407wru.16.1674463045625; 
 Mon, 23 Jan 2023 00:37:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o15-20020a5d62cf000000b002bbedd60a9asm36055349wrv.77.2023.01.23.00.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 00:37:25 -0800 (PST)
Message-ID: <fbac07b4-8a58-b6fd-6744-2634ca863a4e@linaro.org>
Date: Mon, 23 Jan 2023 09:37:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/10] target/loongarch: Enable the disassembler for
 host tcg
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: git@xen0n.name
References: <20230118011123.392823-1-richard.henderson@linaro.org>
 <20230118011123.392823-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230118011123.392823-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 18/1/23 02:11, Richard Henderson wrote:
> Reuse the decodetree based disassembler from
> target/loongarch/ for tcg/loongarch64/.
> 
> The generation of decode-insns.c.inc into ./libcommon.fa.p/ could
> eventually result in conflict, if any other host requires the same
> trick, but this is good enough for now.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   disas.c                      | 2 ++
>   target/loongarch/meson.build | 3 ++-
>   2 files changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



