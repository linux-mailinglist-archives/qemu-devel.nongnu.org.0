Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1E435EA39
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 03:11:27 +0200 (CEST)
Received: from localhost ([::1]:33294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWU3y-0001sM-Cj
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 21:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWU2s-0001GD-TS
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 21:10:18 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:37501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWU2p-0002w7-Tp
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 21:10:18 -0400
Received: by mail-pf1-x433.google.com with SMTP id o123so12615726pfb.4
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 18:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B4qWjoV/6Cks07qUYrv5LKf9Muue3O7TErgzl20syd0=;
 b=CS99qttKvgg9hWcoHrrlLPbi5CG6jmXsSotCBPjrrqRA1mves4Zv95d+7wKaUiwCCH
 ocdd2YnS1+9zjMwcjHuJxhbgk4H9DBTkktlZb0xHnYPXU/PIeht9Jt4+Sa6OsGLeZe3u
 9O2kYuzO86FFcvpvExXmNAhm2p1jjhs/IR1kgyBoLRx3tMHaXGs0TJ/BRgVvwpRpKJ3Y
 J2mYFQXQVhVS3MUSEx57LwxAPnSV7XR4imoJUfT/Ws+BKZavlvNW/6uNz2qWNmuKLFOX
 oUowRpaoL4GSLPtiqz+42WQ9FKwLQln9Ik3DFPnbk4KJSY0wmpXvKIxHHNn1b0IkFjSl
 PVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B4qWjoV/6Cks07qUYrv5LKf9Muue3O7TErgzl20syd0=;
 b=gGSWaXLxVIWlw6JBlCTANLkPxvGjShCUt9afrbLJ/ExMSLT0Rfdmq86YUnP6z5NafL
 Kr0jQIda1rKNSaVUiQkjz9FQXSUaJADxAwPiBcr/gJBjR7K0TGvXjOEbAh0iqlBgeWCi
 LqlglnK2IC5paPCN1JVSpxhNQ4p3ACHaD2I50KKL3u+qviDSiCY43NFMCoaefryQZzBt
 JkgHRNvEKhr8Yx8Kir06YnndNUYeGBH7gPYt1XR7Uir+2pdeMRMcVwY6Nch1P0wcJHp2
 j/ulS4VyAWYofC0KSHQQEv1ukYU7EDteMU+DZR84lHfPXAZX62lbmQ6+OXJEWdH6iPXV
 jxhw==
X-Gm-Message-State: AOAM533BED5fg5e0F2FJ5MWUstxHqcNcYleTVRBN1hxIzEcSfOaWg+iP
 bt+TrnhDGffecPeCchyXwN/Gvg==
X-Google-Smtp-Source: ABdhPJyMOYjqrBZ5Q3YKITdcKCLVx9r7IYOLr2PIRq1dy2pYJPb01JXVeD/1+2uPKibKtUvYzkJQ3w==
X-Received: by 2002:a63:eb10:: with SMTP id t16mr18416223pgh.393.1618362614225; 
 Tue, 13 Apr 2021 18:10:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id b1sm16592726pgf.84.2021.04.13.18.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 18:10:13 -0700 (PDT)
Subject: Re: [PATCH] decodetree: Allow custom var width load functions
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210413181615.414685-1-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f6cda241-4e11-cfa0-02fe-3119b5d0b8b9@linaro.org>
Date: Tue, 13 Apr 2021 18:10:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413181615.414685-1-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 11:16 AM, Luis Pires wrote:
> This is useful in situations where you want decodetree
> to handle variable width instructions but you want to
> provide custom code to load the instructions. Suppressing
> the generation of the load function is necessary to avoid
> compilation errors due to the load function being unused.
> 
> This will be used by the PowerPC decodetree code.
> 
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> ---
>   scripts/decodetree.py | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)

So, in the previous cases where we have very controlled "variable length", 
we've simply created separate decode files each with fixed length.

E.g. for arm thumb, in thumb_tr_translate_insn:

     insn = arm_lduw_code(env, dc->base.pc_next, dc->sctlr_b);
     is_16bit = thumb_insn_is_16bit(dc, dc->base.pc_next, insn);
...
     if (is_16bit) {
         disas_thumb_insn(dc, insn);
     } else {
         disas_thumb2_insn(dc, insn);
     }

Similarly, riscv's decode_opc.

I would think that Power would work the same, with 32-bit and 64-bit 
instructions.  I'd like you to talk me through what you want to do here.


r~

