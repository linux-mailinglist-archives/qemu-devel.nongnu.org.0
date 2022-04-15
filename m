Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8078950305A
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 00:57:22 +0200 (CEST)
Received: from localhost ([::1]:37526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfUsT-0004Hb-4W
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 18:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfUrd-0003cx-Jo
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 18:56:29 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:56155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfUrb-0005tr-VS
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 18:56:29 -0400
Received: by mail-pj1-x102e.google.com with SMTP id ll10so8560625pjb.5
 for <qemu-devel@nongnu.org>; Fri, 15 Apr 2022 15:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2+KiVohGXOGKAo88Nz7xqSSsV1MXddwYS3+3bOW/Vgo=;
 b=LYu9C/yN+jtRxat4SJKU80YAuM1Tx8fzRLMes2ptvodvaexWcNhDB/iZ5UTYD8CmqT
 ZFiGBJJbofxOjvZ4s4Htmr+an3SBhEUgVWubcXVmZgEXuO3/NOINhj8rEPV9/1DSx5ug
 9v/lfed1j3tzo1RVCXjuTVLr5DDRIBZLaF3895dUmd++BIDXtKtknabCKglpVUa2Lna7
 JvNQvrfezRfGezlSR0brJHyjGaV197ZP8pjMB5LGuJnV2l5i6B5ezm3NcdmCF0Gz+0OC
 AgUer2i5yzbrzsTO6fsOVyNgwx/Cqbxc2ZfPX03klTkr/34J/X+jVvtIy+G4xEUyAnLp
 k81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2+KiVohGXOGKAo88Nz7xqSSsV1MXddwYS3+3bOW/Vgo=;
 b=wsDhZrOe1GoQK0tPtS6kvpUeYaGjK2lqdXFO1eMQdy0K0f0gBU7IzjtXuXfJ31GtQB
 1PJWW+CUftlFK1u7m0AXDG/FqRc3ysJPuBBAvzzRW1NARE5USymDS5PFOS/e0UXCCf0/
 dztuxb+8KHe6pDmhhyENTCsvo4t/cXCQKuXXOLTP7kf98DJymdPWlEy5X1HHumb1wfo4
 KnZzzxUjp1HwmLBkPq9C3W03dIEe1siclVZX48EP98G8tHzTTWgNik+iM44tNvz4jbve
 kLo2LmwSQPLQxNPVG9B7VO0WVMBV5aGEeoBMVoMG5H5XnjhQPdnYun5SH+RE3E+j+ikq
 9xew==
X-Gm-Message-State: AOAM530qg8t4LKcKcxkooeJlgvjBP/TnPLiBQucUBIbtLKoDnfsSd/oC
 Jnhbq1loiL/AJUc4CV8hMAAnvg==
X-Google-Smtp-Source: ABdhPJyYXw4uEZOKqP72f84qYgrQO7flt9jNTwDjFqcf4oUqABFGkd31X2+PJ5Z1PbkzZx2CAueJ4A==
X-Received: by 2002:a17:903:11c9:b0:154:be2d:eb9 with SMTP id
 q9-20020a17090311c900b00154be2d0eb9mr1175273plh.91.1650063386251; 
 Fri, 15 Apr 2022 15:56:26 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j63-20020a636e42000000b003987df110edsm5359716pgc.42.2022.04.15.15.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 15:56:25 -0700 (PDT)
Message-ID: <8d1a2a3f-f89a-d896-579d-d02b5bf9b5f3@linaro.org>
Date: Fri, 15 Apr 2022 15:56:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 09/43] target/loongarch: Add fixed point extra
 instruction translation
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-10-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-10-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
> @@ -45,13 +47,37 @@ target_ulong helper_bitswap(target_ulong v)
>   void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
>   {
>       if (rj > rk) {
> -        do_raise_exception(env, EXCP_ADE, GETPC());
> +        do_raise_exception(env, EXCCODE_ADEM, GETPC());
>       }
>   }
>   
>   void helper_asrtgt_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
>   {
>       if (rj <= rk) {
> -        do_raise_exception(env, EXCP_ADE, GETPC());
> +        do_raise_exception(env, EXCCODE_ADEM, GETPC());
>       }
>   }

These two hunks should be pushed back to patch 7, when these functions were introduced.


r~

