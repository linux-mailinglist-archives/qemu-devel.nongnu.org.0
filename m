Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC67F5031DE
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 01:30:47 +0200 (CEST)
Received: from localhost ([::1]:46470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfVOo-0003Ue-Kd
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 19:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfVNM-0002mD-GY
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 19:29:16 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:36762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfVNL-0001z5-29
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 19:29:16 -0400
Received: by mail-pg1-x530.google.com with SMTP id r66so8935766pgr.3
 for <qemu-devel@nongnu.org>; Fri, 15 Apr 2022 16:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yk6Ow+4/41f4+nRjT6Apko7MjGvLroPVlEznMkwvKBY=;
 b=OZ8WoWXfG/vdTxnT+F/+Wub59NxWcEkvQfCuchoLHLR2xFayOJ/aGowghOW7byH8lz
 HMdkGGbd7VICR1XiAHnvp0Okzj0uuvFxxLDeupnonJ/Gtq9FNnfHb960r4Zq5zSYJAL0
 K5uh1qPctv4LL0NOgzovWVVTEV+s+NwhL7/Mn16qzpbTl55+yyXKtjil+rYcOuFsd6ax
 7zbldUFJD+/x2k9cccMUTIl99OvRtZxXGJCM8wyWsFXicfGTdeWK9mV/dLSNIuaIsnru
 vo8b8xK5qRK+FSEFIy4EfRAezL1EgTWSqo7om3eHAqw6b63F1/cdUkQwm2w3G+hF4VFz
 aT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yk6Ow+4/41f4+nRjT6Apko7MjGvLroPVlEznMkwvKBY=;
 b=W4smpAJRvGRPmQ/QUqivu14DHGABthsTlvpdVODInMcW21yOlkptEyDr3NnWPR7PE0
 zwAr3uvagL+u7O6P0tlrVbaAY55qHcT8wxvTFD0KqA/nP8vrHujS8ZMLYcyRO8Ge5oTr
 MiLO8IbxIxF6zIM7+KB7u6gm3zF/SqkLMAazzZfiHQW3+s6ba9jw3VrlBpTdAWwVRvy6
 m0lnxFTmARHtOsmQ515+IBRQcuLLR1HD0Vn+s2FM1DTmlWefWyh5QjXOX+Ik4fsBQcWu
 5mhFtanltCocFHi3ml1QOrF4Ifr/ziohq4n13hMyVCoYPy7I8DOyLAaKwSHdJp5Zrvqr
 v/uA==
X-Gm-Message-State: AOAM530oQoCBtUDT791uzpaybX9XaIRI3Qr+2g1rw5VETDrwVmby5KZe
 SAmHiKc6RCRBA+QM02xgXyguVIZMnaAWSw==
X-Google-Smtp-Source: ABdhPJyv/1RrLuGyXWHT3A7DVzAaMPaFIMdUdGLEz7QhgHuaTyAC5zxoOBCeUAxBLddJNC/J9qtV5w==
X-Received: by 2002:a63:2cd4:0:b0:39d:8636:3808 with SMTP id
 s203-20020a632cd4000000b0039d86363808mr988203pgs.290.1650065353698; 
 Fri, 15 Apr 2022 16:29:13 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a17090a294600b001cba3274bd0sm9513126pjf.28.2022.04.15.16.29.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 16:29:13 -0700 (PDT)
Message-ID: <7956551a-265a-2a9a-75dd-3881b509edbb@linaro.org>
Date: Fri, 15 Apr 2022 16:29:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 20/43] target/loongarch: Add basic vmstate description
 of CPU.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-21-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-21-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> +const VMStateDescription vmstate_loongarch_cpu = {
> +    .name = "cpu",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +
> +        VMSTATE_UINTTL_ARRAY(env.gpr, LoongArchCPU, 32),
> +        VMSTATE_UINTTL(env.pc, LoongArchCPU),
> +        VMSTATE_UINT64_ARRAY(env.fpr, LoongArchCPU, 32),
> +        VMSTATE_UINT32(env.fcsr0, LoongArchCPU),
> +
> +        /* Remaining CSRs */

Missing save of env.cf[].


r~

