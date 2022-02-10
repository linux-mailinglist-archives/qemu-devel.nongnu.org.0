Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0E94B17F8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 23:13:11 +0100 (CET)
Received: from localhost ([::1]:37400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIHgc-0002O5-Cg
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 17:13:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIHeP-0001WP-OV
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 17:10:54 -0500
Received: from [2607:f8b0:4864:20::102c] (port=40672
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIHeC-0003Nz-DH
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 17:10:51 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 c8-20020a17090a674800b001b91184b732so7576004pjm.5
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 14:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cCGZrD0xSjFqBkxphTSgpxjrlAEJTOtmMoHbko1mjSs=;
 b=x66dVqmZvDjV9qcK5yudw1AKjIYh/DKUfh3/soJOrjnehQqNarAxWqCczKJxslwV7K
 GPXVUT8j+7+am+IbOh58wCIH0c2b2CKb8b6/I0fn+o0JRD7pNCGnZgMFhBCVVwoSr/oh
 Fi1Tys/zztDl1oEd69pVFvCqs6oolfBBwrnI1iByRVZQLZFC8ix7ryJUboHCqB3Uo0WY
 Bx2YWhv2ro875D4DZlJGLtJ9r4MwxifPScda3qyA+91gS3cFdINv8M4OerMkP1+TQ0co
 rtSzKTF6sFQP2ajEsJRzmHzsY5vmGbtQJRq+7Dw2tDxRzIzMHRdUeDfLTfG7hAYE2DRV
 6Aug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cCGZrD0xSjFqBkxphTSgpxjrlAEJTOtmMoHbko1mjSs=;
 b=npU30M5EaHFg/zLX8neH3E/BgjayQdiiq2ZUYoDkYQ+J3vQHokfFRYx75FD1KmBaWE
 IsA8uUw96/S2WsHoRNnHjTztb9WaOsLmd51qhqaQIgoRUspqzRVRCDmdNAFlkVEmCTkm
 I9r+fzA6u2bkkBCVVq6CkMgciMRRIFpp8HKSveWPKo3YMWry1/le7Gb38WfyATGpCDRs
 db2u5GFpyFAs+wq/N8TbvB4i6Al71zYlOughGx12MrEez/lS4RfbejzysyP/cS/pnKGB
 L1M4WzB0EL3xrR/Ch8FkXklsfDHVdq0lsuoXuUVKdfRLmdNe6KD+jKXyB4zO4P0dbOoZ
 aGPw==
X-Gm-Message-State: AOAM532K7S/Yy4bG+VWnjn9FRiDncIVIKqOF6zGp2Q9dIOBqkGobRgmD
 qUVDtB3QlAtmLgjaKlG5AumBXg==
X-Google-Smtp-Source: ABdhPJw6x3HxDs7kJtoOsnzIchBcrjhbZECAvuD161F0YpTOP+sgrFYsJzeXXH8P+ZoU88M9tOMVmQ==
X-Received: by 2002:a17:902:ba98:: with SMTP id
 k24mr9425031pls.44.1644531036258; 
 Thu, 10 Feb 2022 14:10:36 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id c11sm17012508pgl.92.2022.02.10.14.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 14:10:35 -0800 (PST)
Message-ID: <313aec1f-5c19-a4a8-ef9d-ee4214e9bcd8@linaro.org>
Date: Fri, 11 Feb 2022 09:10:24 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] target/riscv: Enable Zicbo[m,z,p] instructions
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Christoph Muellner <cmuellner@linux.com>
References: <20220210163449.3859905-1-cmuellner@linux.com>
 <CAAeLtUAf-mXKupWuQR6vK3ZfEtyD57sStEDO6VCUS=4LnzGB5A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAAeLtUAf-mXKupWuQR6vK3ZfEtyD57sStEDO6VCUS=4LnzGB5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>,
 Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/22 03:48, Philipp Tomsich wrote:
>     -lq       ............   ..... 010 ..... 0001111 @i
>     +{
>     +  [
>     +    # *** RV32 Zicbom Standard Extension ***
>     +    cbo_clean  0000000 00001 ..... 010 00000 0001111 @sfence_vm
>     +    cbo_flush  0000000 00010 ..... 010 00000 0001111 @sfence_vm
>     +    cbo_inval  0000000 00000 ..... 010 00000 0001111 @sfence_vm
>     +
>     +    # *** RV32 Zicboz Standard Extension ***
>     +    cbo_zero   0000000 00100 ..... 010 00000 0001111 @sfence_vm
>     +  ]
>     +
>     +  # *** RVI128 lq ***
>     +  lq       ............   ..... 010 ..... 0001111 @i
>     +}

...
>     +#define REQUIRE_ZICBOM(ctx) do {               \
>     +    if (!RISCV_CPU(ctx->cs)->cfg.ext_icbom) {  \
>     +        return false;                          \
>     +    }                                          \
>     +} while (0)
> 
> 
> The exception semantics seem to be broken here: if Zicbom is not implemented, but the 
> requirements for lq (i.e. rv128) are satisfied, then this needs to be passed on to lq: "lq 
> zero, 0(rs1)" is still expected to raise exceptions based on the permissions for the 
> address at 0(rs1).
> 
> There are multiple ways to do this, including:
> 1) perform a tail-call to trans_lq, in case Zicbom is not enabled (instead of just 
> returning false);
> 2) use the table-based dispatch (added for XVentanaCondOps) and hook a Zicbom 
> disptacher before the RVI dispatcher: if Zicbom then falls through, the RVI dispatcher 
> would drop into trans_lq;

No, returning false will cause the next pattern in the { } group to be matched.  No need 
for other workarounds.


r~

