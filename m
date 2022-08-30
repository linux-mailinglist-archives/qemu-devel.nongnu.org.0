Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE8D5A59BE
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 05:10:59 +0200 (CEST)
Received: from localhost ([::1]:60756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSreP-0003sn-Kz
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 23:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSrcv-0002QS-FC
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 23:09:21 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:56318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSrct-0008Ip-Ni
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 23:09:21 -0400
Received: by mail-pj1-x1030.google.com with SMTP id l5so5940004pjy.5
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 20:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=ksPVcbePwo5zAwSPzVhCCzbITY30xtw3EZEMOPBEhxU=;
 b=ELtBeJGcg1wDqVg/W51bSYTwNrRY3D15Xslvi9ox2nMdCw+TD8ZD08g2uUrKZKZ0Mw
 B5YPd4x8FO92HUZPmWW8uFS7u7kjk8PDjc97mEN8voVgnjAAIKE6/QLSqR1Ery4qitoQ
 Ka61+XJzIYwWbcvb+7ToR6irEuPSV6dbwiHBkv2+eIAJBu1PAfMYOaoSVp9MH/kkGEHO
 jURSCQ9aI4BCXMyUm0mD1amaEM+ICcs3x1292TPNoH30zAzNW573fuSGrR5zp5J3FmUt
 ibXF0wz3zbV2VAtr0H535iNMahI6jDHS/ONWv5jfQWZVRSBooX/MYpoFhNxdf5cZghZu
 QOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ksPVcbePwo5zAwSPzVhCCzbITY30xtw3EZEMOPBEhxU=;
 b=IgZ4scO6hAFLYV7beXiQNaho8i6IvedtK2wLbdejLq1Gn3dL32zoRksBQIJFbQgITu
 cHgsKS1d0iE1yxBQD6MbsrT3yeQbgjqWtacGDssaX0izRX1XyiKUTcVllRTS3FA5yeRQ
 KX/R6RbjddcFAESs+yj+oU7wyUnpWZlpN0dJIrsjPPhCperVtpzjvyGrN7DpvfEvpE8B
 PVygG4+WYNBR9LYJFjdxbUm7U35vgwiL5oqRzCBcMqrpfC50+cOUryOXtQ/gfdz/LyIh
 RIlomAxIaKASilGrn0dQM3CYE5MtgpF9WuvNWWOIr0WlmjVOULRubvZPIRiqOPENDpsF
 MJVg==
X-Gm-Message-State: ACgBeo2iLmDwH1v5HBA9c535vcGPWs02AGEgTrrjmJw9KkwKS8dnSYl9
 xtejIeEyGy5eEVnZ2GJOYRZJ1w==
X-Google-Smtp-Source: AA6agR4domDtlMcJp6pbFXqY7yemzEFtUawvEST0vJr21BDu193GdOQn4ITRIFZKTq+xZWfLzZqcPA==
X-Received: by 2002:a17:90b:4a01:b0:1fb:5583:578a with SMTP id
 kk1-20020a17090b4a0100b001fb5583578amr21908452pjb.216.1661828957619; 
 Mon, 29 Aug 2022 20:09:17 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:ecdc:4f14:189e:85b3?
 ([2602:47:d49d:ec01:ecdc:4f14:189e:85b3])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902cec500b0016c574aa0fdsm8276752plg.76.2022.08.29.20.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 20:09:17 -0700 (PDT)
Message-ID: <454af39f-92a5-1223-1265-bddf89fd11a4@linaro.org>
Date: Mon, 29 Aug 2022 20:09:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/1] target/i386: Raise #GP on unaligned m128 accesses
 when required.
Content-Language: en-US
To: Ricky Zhou <ricky@rzhou.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, eduardo@habkost.net
References: <20220830021152.40618-1-ricky@rzhou.org>
 <20220830021152.40618-2-ricky@rzhou.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220830021152.40618-2-ricky@rzhou.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/29/22 19:11, Ricky Zhou wrote:
> Many instructions which load/store 128-bit values are supposed to
> raise #GP when the memory operand isn't 16-byte aligned. This includes:
>   - Instructions explicitly requiring memory alignment (Exceptions Type 1
>     in the "AVX and SSE Instruction Exception Specification" section of
>     the SDM)
>   - Legacy SSE instructions that load/store 128-bit values (Exceptions
>     Types 2 and 4).
> 
> This change sets MO_ALIGN_16 on 128-bit memory accesses that require
> 16-byte alignment. It adds cpu_record_sigbus and cpu_do_unaligned_access
> handlers that simulate a #GP exception in qemu-user and qemu-system,
> respectively.
> 


> One minor behavior change apart from what is described above: Prior to
> this change, emulation of cvttps2pi and cvtps2pi instructions would
> incorrectly read 16 bytes of memory instead of 8. I double-checked on
> real hardware that these instructions only read 8 bytes (and do not have
> any address alignment requirements).

This should really be split out to a separate patch.


> @@ -3621,7 +3629,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
>               if (mod != 3) {
>                   gen_lea_modrm(env, s, modrm);
>                   op2_offset = offsetof(CPUX86State,xmm_t0);
> -                gen_ldo_env_A0(s, op2_offset);
> +                if ((b >> 8) & 1) {

Aka b1.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

