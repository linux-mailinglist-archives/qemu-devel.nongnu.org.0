Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9D750AB14
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 23:59:55 +0200 (CEST)
Received: from localhost ([::1]:39134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nheqA-0004Bs-If
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 17:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nheoL-00028G-2x
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:58:01 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nheoJ-0001Ib-7q
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:58:00 -0400
Received: by mail-pl1-x62d.google.com with SMTP id q3so6693749plg.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 14:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=+cmtkYaZFu0AtZu2w1xlHIB8pjCsd+LwMaQle8Q2JkM=;
 b=D16pt2KSnjhoLIFjPJMarPMWJLwJ75+O1U0msvvkECYiNwiPLrq6ZOdX0ybHx0n8q6
 fsp1EgwwWTiXWxTVudTsSSzulUf7q2vCdITWjFVAmChxEGGZD3gEptBxeCj1i68lA8Ka
 y8M+bgZRYgDM8xNpfcVPdDjCW0G+GoneiCcqz9GGUPgnJ1bKwLb18LPjBUkMnwdJESEi
 f1FPhKTvWVt75QkqWKk48v8yZolepp9RYPRcV0J4Fp77WO7NIUuwlWYCxUH2jfaWnLWv
 pj9v3n7sgtiLi/Bkynv4gQOXLe5o50YMvWbXkxrfIdDY4m/S2J8UuPSEfLjnI9nEwr3X
 xO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+cmtkYaZFu0AtZu2w1xlHIB8pjCsd+LwMaQle8Q2JkM=;
 b=ymEpZJ+dd/vvU/ExE7cbZ9ToRZuPuUMOgclZTgRlKKEfRAN6faL0CFwIC1aJMAntAm
 u4p5CDur/QX9dE43pH0ek8SpSwLxwII4XbBTgLv0HWYPUibapQShEE5bqHcMekZU+gno
 WBB9Q6H4XjT41VEA+/twpe1ViCGhyuo+MIHslzkNliQQCKm4JpvBSDC/1DWrAJnJAFFG
 H7GlX+cuQc8QZtF8xjshI0AeuHdFzPqyEBeeh+kqUc9PqE2ZoX1NHy80srPNcBcZRYOm
 krJ/TPNBLYx/vX+mqQGjE4rYd1UWN/BFRrvrEgVOjolJgkdMja8r4mmC45gHDx6TCt/p
 FhrA==
X-Gm-Message-State: AOAM532Ab82+dtCpZfv7kgGEVVMBHEy3s9giwr1X24X87b7KlT2UH+k5
 AoYeI/5Punlk8ZosbGmSrzZtOw==
X-Google-Smtp-Source: ABdhPJzo8ohtPXziugDqsTrTCo4VnfN0NcYLwwmguNKmXKNHRdO992K/Xr4lJmazKNVZ87kJU8NIgA==
X-Received: by 2002:a17:902:8504:b0:158:914f:ca3 with SMTP id
 bj4-20020a170902850400b00158914f0ca3mr1229979plb.67.1650578277812; 
 Thu, 21 Apr 2022 14:57:57 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8060:946d:d891:f23c:e53:9d47?
 ([2607:fb90:8060:946d:d891:f23c:e53:9d47])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a17090ae51200b001cd4989fec6sm3694963pjy.18.2022.04.21.14.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 14:57:54 -0700 (PDT)
Message-ID: <b909edb5-d4aa-10d4-db2e-13c0c99ef0af@linaro.org>
Date: Thu, 21 Apr 2022 14:57:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 6/6] target/xtensa: use tcg_constant_* for remaining
 opcodes
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20220421213917.368830-1-jcmvbkbc@gmail.com>
 <20220421213917.368830-7-jcmvbkbc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220421213917.368830-7-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 4/21/22 14:39, Max Filippov wrote:
> +    TCGv_i32 pc = tcg_const_i32(dc->base.pc_next);
> +
> +    if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_waiti(cpu_env, pc, tcg_constant_i32(arg[0].imm));
> +    tcg_temp_free(pc);

Missed conversion to tcg_constant_i32 for pc.
Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

