Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD6D4C01ED
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:19:39 +0100 (CET)
Received: from localhost ([::1]:37224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMahG-00016H-Lb
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:19:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMadr-0006iC-FC
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:16:09 -0500
Received: from [2607:f8b0:4864:20::1035] (port=55093
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMadl-00043R-0d
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:16:07 -0500
Received: by mail-pj1-x1035.google.com with SMTP id b8so538049pjb.4
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nPC7Gl5Tj/Cxyt+vAxeyibW75cydwNjJP6sC8gynMv8=;
 b=oCyh0Ajn6OFCZaFoP/vHkCgklF6AxqfJ+eCO+EARm/rp9l0qnKSH5U21SMZnT/LUXx
 bX1iDNVVBxXFg8ktk+oX98HLZNu1uoDx80LYLne3c+yvsCnouhuoDWF7satcuaXJYAAs
 d6BDpOx0frQb9OUMCkn9ZgTXKLcKE2+neJij05nbBYrXVY/M66OI4fyWq3SLgGCYhg7/
 eMek6YRY9+NPP754TpTNrMZsrRYJA2Rejx65eAf58sp60lGqvqpOY7pn2FnHs+G4iNTj
 XQzUyQYRnF1Bw0QiqCne3R+JfJadJte+eTuOkIDoZjQgxYulyqnh6ppgtIn1IiQNoqFN
 WLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nPC7Gl5Tj/Cxyt+vAxeyibW75cydwNjJP6sC8gynMv8=;
 b=AHAMuE0foUTOED/yz4viW9UgJ3gXjnpmLtMMV6O+zHSoffbdHSlr3rFO7OtglCDlR6
 lounRuaM/X7wqNWJu/qdgaHB1rlyZnLUcoQbaL9amI+nWHC7TZ1/rdDLsjlMc52ekbqe
 vU3QpIzRGLibxtcT9w9lAsFM0JoyysNHZA3DVVBlZZRyFZsr0kVlo+ne/McyG5zib//+
 9We5K9ag0eNnkO/VT64hwdPQrD2FI1cyG39gNA2DJwyLEpAVE0gSiSUv5miiOsujmpDc
 C7ce3cKqB/1RZUXhoNV5Hokw5Jlp+nDB2YjIJHsvoDulXlxlTrIZR7b8nI3hbd3g/x7q
 vooA==
X-Gm-Message-State: AOAM5323U/Zv8fu9Ls83acWfZQNdRw6or2N+fmUb7eYzeNYgVQOMt0M7
 ttADPVOQ2t1kKfv8zAVn0WGF4g==
X-Google-Smtp-Source: ABdhPJz8w8EWyzfn/FNaad6kqwlI98ONNgA4ZwkuAz1phJl7RMPftBaMaG7rhwZoiEUQvGzR4CNy8g==
X-Received: by 2002:a17:90a:354:b0:1bb:cfdc:c84e with SMTP id
 20-20020a17090a035400b001bbcfdcc84emr5604315pjf.213.1645557355152; 
 Tue, 22 Feb 2022 11:15:55 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id c20sm10189084pfl.131.2022.02.22.11.15.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 11:15:54 -0800 (PST)
Message-ID: <48ec423c-9fcd-dc5d-2647-02e311ca784d@linaro.org>
Date: Tue, 22 Feb 2022 09:15:51 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 15/47] target/ppc: implement vclrlb
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-16-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-16-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> +static bool trans_VCLRLB(DisasContext *ctx, arg_VX *a)
> +{
> +    TCGv_i64 rb, mh, ml, tmp,
> +             ones = tcg_constant_i64(-1),
> +             zero = tcg_constant_i64(0);
> +
> +    rb = tcg_temp_new_i64();
> +    mh = tcg_temp_new_i64();
> +    ml = tcg_temp_new_i64();
> +    tmp = tcg_temp_new_i64();
> +
> +    tcg_gen_extu_tl_i64(rb, cpu_gpr[a->vrb]);
> +    tcg_gen_andi_i64(tmp, rb, 7);
> +    tcg_gen_shli_i64(tmp, tmp, 3);
> +    tcg_gen_shl_i64(tmp, tcg_constant_i64(-1), tmp);

Reuse ones here.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

