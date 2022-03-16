Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66C14DAAA9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:19:57 +0100 (CET)
Received: from localhost ([::1]:42386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUN0m-0002kP-Pj
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:19:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMus-0003XS-IW
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 02:13:52 -0400
Received: from [2607:f8b0:4864:20::1036] (port=43728
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMur-0008VH-2V
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 02:13:50 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so1503750pju.2
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 23:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tIdBgNjhFjnSt4NS2QCYjREshlmpKNg/NjuFLyI452U=;
 b=qtYdcDbLUPWsKeN/B65rjyVv31FY9x+JVFTmbg3gV74adwcJqClCIWdwiHsN/+8Bkr
 4kMIM1HEw/L2wyvivtmkcSQwaKDxY+gbtbtnDc/1LlBC+ho7XTlcTgaefYaH4XNq0Tix
 kJdw8AlhQQDgHoT1jX7bsb3lCtQNlOQqemkQIbaUvPcp52d/fA1KzY+EMjtq/uc/60+L
 R64JKTsFLYmFLmqKrJ8kgzhe9m1cQICnDTk3C+UjL4TT/ifXrn4OLldKkeJxhkZjmPhR
 Cmv+4le8+RR5FiOHoeV3BHiHH+A332p8EVAqXHujtD5mt4eyY1G0TCobfc17rJzpPikM
 fewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tIdBgNjhFjnSt4NS2QCYjREshlmpKNg/NjuFLyI452U=;
 b=fphqneUeQlFSKVgluU7n3Jv1IuBww2D8uU6EuqeiPAFSFkGI8VyMRA5ybJGrNAEXua
 XzuTT+5SaYHFx6FGc94q/QO+znzRo/qxNzGRPeEKtFQtVDwCWiGk/s3ZapTHz1LeIbcY
 f7EISjzVHn8nyv7PBr3aQhIQL5+CTfjdjQYjfHlGvgv3++R1gKJwUomam8coz7X+CYvP
 T2Uo+cAHM7JgP8L5seBFMvIgr9DFxh3s1LXY1RhOu1CkzCNI447K2RvJsZ7CZs+DHE2P
 2rG/dhIOh4UhvZWQi+xE6zWVvBjT/8yjTQMRoZLsp5Vt8ekWZ5orX0OLfvJs5NL/wTgd
 LHDA==
X-Gm-Message-State: AOAM530lXRCgYI086zRu8+px7O7X1iy0SmsHRaowfXSCv0/HdtRCTuUr
 UHMz66t0T6OSQixzdG625w+sUw==
X-Google-Smtp-Source: ABdhPJywRUrpFreYnzH5wALVq6GdBWQxeMBautEanU2lyiyP0QeI+mwO0HlQ8xXK2uQ/XMdscPTdhQ==
X-Received: by 2002:a17:902:9889:b0:153:abee:fbc7 with SMTP id
 s9-20020a170902988900b00153abeefbc7mr4160630plp.117.1647411227757; 
 Tue, 15 Mar 2022 23:13:47 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a056a00084200b004f761a7287dsm1345572pfk.131.2022.03.15.23.13.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 23:13:47 -0700 (PDT)
Message-ID: <733b5d86-a577-3486-57ff-aca581db6ff5@linaro.org>
Date: Tue, 15 Mar 2022 23:13:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] target/riscv: Allow software access to MIP SEIP
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20220316015901.3787779-1-alistair.francis@opensource.wdc.com>
 <20220316015901.3787779-3-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220316015901.3787779-3-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, palmer@dabbelt.com, bmeng.cn@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/22 18:59, Alistair Francis wrote:
> +    if (mask & MIP_SEIP) {
> +        env->software_seip = new_val & MIP_SEIP;
> +    }
> +    new_val |= env->external_seip << IRQ_S_EXT;

You can move the second statement inside the if as well, since you don't need bits in 
new_val set that are not in mask.

Also might be clearer as

         env->external_seip * MIP_SEIP

rather than the shift, to make it clear we're talking about the same bit.  The compiler 
will reduce the multiplication.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

