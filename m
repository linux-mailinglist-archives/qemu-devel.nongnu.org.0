Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87087663F44
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 12:31:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFCpS-00074u-G9; Tue, 10 Jan 2023 06:30:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFCpP-00072r-Ri
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 06:30:03 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFCpO-0007aR-6d
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 06:30:03 -0500
Received: by mail-wr1-x42d.google.com with SMTP id co23so11391078wrb.4
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 03:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ehh+Cs9PNCMirnFKKCN1I9i+Cr5geeEQ8vUW6kZb5wM=;
 b=dZoZlOoItsVw7yZCZ1MPIMJAaycLwc/yRXokFRWToHPMkhmA8NsGl52OmCfSIMsYzw
 SFwWkNaI6BQHLCeMvdNhI31ckVFaSlKFYic64HcI8VgaRh4PvxfQHHyJQrgA1ZKqwuus
 AZKyovzaPM8PEB5u9uN1kbjVGdlafupvyH3lUWJcWL6Q7NrxGgkI7Jq+nsaCC701S3IU
 ZW74ibRjFI8/qkLFHBoctYaxXUYdYRrWZb84FO37iO6n/ALd5d1LBwrywCSrD34IVi6n
 0DWuN82nNIZr8M4LMPmDH7PI1Ug22ixklaIWnAYSMsJ0MkyA/BMW2fsaC2+qCfxdFxYc
 hBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ehh+Cs9PNCMirnFKKCN1I9i+Cr5geeEQ8vUW6kZb5wM=;
 b=3y1NV1dA/M1Rg3JACwu6X2/q6Vo29W9jfNd7ZRgUPoY+a63e4VjWkSbmUztXVkRTY2
 U5yQK2z83szNr52ixPJ2yGS9MCMcOae+6wxVfwOD8hKrLQYuNH5Io7BJib3AFdfQo3fE
 Ifbo5tIOo+pKi/cyVkAE4bgoexNL/7NkwiPm60GFnC+Jq6O4g7O9yMy3Vnc7RU79kTbK
 qHgtRIjpupSZtaStGKbPt+F2kanxxjYKQMWxdLBk8FXH99purBpD2RDSozqgJzOTiJ23
 AnPmLf+Gze8Ahyl0QHQRiLE5a1WMnprikKVSOMMViWMK7625DJ+VG4vwB3Pua595Wf1+
 hzIQ==
X-Gm-Message-State: AFqh2koc3Pimg8OpvglyGeHzaMcScDSTp9TcHRt5cdlP+xdsTLKvfhZP
 w2pk6GOvVwtMDFxXd1fPq1AlRA==
X-Google-Smtp-Source: AMrXdXucJU6yVGSDQSvlvFg20uULpq5hjPchcZ4el30yvUvkKJJY9G7EKlXJVYLKhI7N4Xvy2PR5Qw==
X-Received: by 2002:a5d:6210:0:b0:236:695b:82d4 with SMTP id
 y16-20020a5d6210000000b00236695b82d4mr42528116wru.30.1673350200203; 
 Tue, 10 Jan 2023 03:30:00 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bj7-20020a0560001e0700b002b6667d3adfsm10949895wrb.80.2023.01.10.03.29.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 03:29:59 -0800 (PST)
Message-ID: <1fcba4cf-57b0-ceb4-61be-1708a74a7bfe@linaro.org>
Date: Tue, 10 Jan 2023 12:29:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] mips: always include nanomips disassembler
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20230110084942.299460-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230110084942.299460-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 10/1/23 09:49, Paolo Bonzini wrote:
> Since the nanomips disassembler is not C++ code anymore, it need not
> depend on link_language == cpp.  Always include it and remove the
> CONFIG_NANOMIPS_DIS symbol.
> 
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   disas/meson.build     | 3 +--
>   include/exec/poison.h | 1 -
>   meson.build           | 7 +------
>   target/mips/cpu.c     | 2 --
>   4 files changed, 2 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> diff --git a/meson.build b/meson.build
> index 175517eafde8..bfb461d1efac 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2478,7 +2478,7 @@ disassemblers = {
>     'x86_64' : ['CONFIG_I386_DIS'],
>     'm68k' : ['CONFIG_M68K_DIS'],
>     'microblaze' : ['CONFIG_MICROBLAZE_DIS'],
> -  'mips' : ['CONFIG_MIPS_DIS'],
> +  'mips' : [ 'CONFIG_MIPS_DIS'],

Queue to mips-next (dropping this one-space change).

>     'nios2' : ['CONFIG_NIOS2_DIS'],
>     'or1k' : ['CONFIG_OPENRISC_DIS'],
>     'ppc' : ['CONFIG_PPC_DIS'],
> @@ -2490,11 +2490,6 @@ disassemblers = {
>     'xtensa' : ['CONFIG_XTENSA_DIS'],
>     'loongarch' : ['CONFIG_LOONGARCH_DIS'],
>   }


