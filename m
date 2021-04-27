Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B272D36C96F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 18:28:47 +0200 (CEST)
Received: from localhost ([::1]:54766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbQZq-0004t2-D3
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 12:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQYu-0004Lh-VD
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:27:49 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:52949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQYt-0007mk-6e
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:27:48 -0400
Received: by mail-pj1-x102f.google.com with SMTP id lr7so13075203pjb.2
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 09:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rxN4H/3kbgKto+xO5MlkvGra7vPATPvtfSNe0eskOf4=;
 b=LJb0yk6hdhAbjLKIsow7TJhvDcicD7JI82Gagt6tTrGtZMGGNoSjf2do1uFVteQeEX
 LufiNoTFH1mdO/iRBWr4rU1ZugWklxevfTfgiaWNeAOH+fVM/uYLzvclQSmvgnsfn7Gg
 5f8WMEA9v42yO008uwEEnvQ2Tds4Lw6O1xXGkadLVUTYgMD+NMa1ODcELyYA7tXM2YJn
 DOtAmSY8IRlXhg0NcYLHBeHutVj5DrTE6TsuvEcaJKhgpbAyrTH07UGZ8QFBAZS7nSuu
 7iDMZqJ7jUzGZkl34ck236eTvdjLFPycYGNrMoLCXIH43mihbGDTFpvigb7iWwzx7Ajw
 emzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rxN4H/3kbgKto+xO5MlkvGra7vPATPvtfSNe0eskOf4=;
 b=e3FocgDQIFXkN4e+jlVMcZKBg2WTHDziun+Ncr+gYOGLfOUFAXtLNJAkSlrRgvN5QI
 XToYXU+rCTjnhtMBRSAghp1n8g2fK/b6aKWxeRL7UpCsLAY82tyXCPBE/Q0aQDvz27nY
 iTdQKXtAMpzcSkIowlbFjjgUtxnyZOdYcNySRbHVId6uAYivoZbJ+3+2Otja/PP4hoia
 7n4RsrjFzPsrm7puOow2mLK2SZ4bsKo3zyTAenYg2ms8lPAwuzAYJNZ/zPgL4yMr6TJS
 cjOXL36t7n2KYXQtS4ODe0VzwcAhj2gy/G9OklE1CLFUw01l5kSPCwJC1OX9BdGNq9/A
 dexg==
X-Gm-Message-State: AOAM533mknDK0GCz0mcVLTHjPEzvmbHLCJsXa1Tlhidb695R8sSiEvPN
 LY7+Sspu6UmMB6tqfvhCWdYjBw==
X-Google-Smtp-Source: ABdhPJzAG+EfsGnzNURE288pWZeso4ToA7yKzYKeL2pYx0RsrFl0BYNXqgncZEGSQzdMhrJlk+jnbA==
X-Received: by 2002:a17:90b:344d:: with SMTP id
 lj13mr5696289pjb.44.1619540865049; 
 Tue, 27 Apr 2021 09:27:45 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 17sm238839pgd.34.2021.04.27.09.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 09:27:44 -0700 (PDT)
Subject: Re: [PATCH v4 00/26] Hexagon (target/hexagon) update
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617930474-31979-1-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <41bd24f4-f578-05c2-bb76-41f60df439df@linaro.org>
Date: Tue, 27 Apr 2021 09:27:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617930474-31979-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 6:07 PM, Taylor Simpson wrote:
> Taylor Simpson (26):
>    Hexagon (target/hexagon) TCG generation cleanup
>    Hexagon (target/hexagon) cleanup gen_log_predicated_reg_write_pair
>    Hexagon (target/hexagon) remove unnecessary inline directives
>    Hexagon (target/hexagon) use env_archcpu and env_cpu
>    Hexagon (target/hexagon) properly generate TB end for DISAS_NORETURN
>    Hexagon (target/hexagon) decide if pred has been written at TCG gen
>      time
>    Hexagon (target/hexagon) change variables from int to bool when
>      appropriate
>    Hexagon (target/hexagon) remove unused carry_from_add64 function
>    Hexagon (target/hexagon) change type of softfloat_roundingmodes
>    Hexagon (target/hexagon) use softfloat default NaN and tininess
>    Hexagon (target/hexagon) replace float32_mul_pow2 with float32_scalbn
>    Hexagon (target/hexagon) use softfloat for float-to-int conversions
>    Hexagon (target/hexagon) cleanup ternary operators in semantics
>    Hexagon (target/hexagon) cleanup reg_field_info definition
>    Hexagon (target/hexagon) move QEMU_GENERATE to only be on during
>      macros.h
>    Hexagon (target/hexagon) compile all debug code
>    Hexagon (target/hexagon) add F2_sfrecipa instruction
>    Hexagon (target/hexagon) add F2_sfinvsqrta
>    Hexagon (target/hexagon) add A5_ACS (vacsh)
>    Hexagon (target/hexagon) add A6_vminub_RdP
>    Hexagon (target/hexagon) add A4_addp_c/A4_subp_c
>    Hexagon (target/hexagon) circular addressing
>    Hexagon (target/hexagon) bit reverse (brev) addressing
>    Hexagon (target/hexagon) load and unpack bytes instructions
>    Hexagon (target/hexagon) load into shifted register instructions
>    Hexagon (target/hexagon) CABAC decode bin

Queued, thanks.


r~

