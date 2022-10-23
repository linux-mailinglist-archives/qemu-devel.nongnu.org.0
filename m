Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C7F609A90
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:33:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omnb5-0002RY-Bf; Sun, 23 Oct 2022 22:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omk3I-0004Io-Ts
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 19:06:44 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omk3H-0000AH-9C
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 19:06:44 -0400
Received: by mail-pl1-x62e.google.com with SMTP id f23so7089534plr.6
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 16:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R2q6hEuAOKwOeGn0E+HzvhJHfrPiUcDbOYHWeu6YGfQ=;
 b=gEDwZqDF82xUfTkn0Sh/eOXVAyr7aI5ncl2QBgwMnReFQqnsHDTKAUY1TA+764pCUc
 5XefiCmW9Rr6cEfBDPqHqA+W2EiET4ZW7vL0WNJky9DZcMnLmUEZBmHZX3jNUjqLQn8+
 +fRnIB1IEWb3+AGXRJZy5VquscMcJ4IdAI80SpIVw7Ld7PJ3osxsdq7MbdTEQtelDNu5
 ez1YdyDSrWYSIRCaZ4kq6QyDxHjnXvDVxZn6u7uwXd754FYEOE+ynpDltQ+u5afTnXjY
 Dwp66xOEExqwjQGDmQVlMyYqot2LXjQgEtcbL5MiCAPBMyBrv87qU7woUuwabfFf4MM9
 A7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R2q6hEuAOKwOeGn0E+HzvhJHfrPiUcDbOYHWeu6YGfQ=;
 b=mST0FiHb0agzER8vUEtqW5Nsj26iIqE3+9bODs30gNToDiACXyDFqfTJ6MUjPRAlUK
 pdXeZ90SCoctMZ7BoHvgGp8dwnnjw1GqGAXUS4GljFDagkh3e02fUFl3v2pJ5re7N1jy
 HOvZbLzkvN0+r3+G50y08skDsPfWxiQAvsYX9IG7QYHHX02G2OXDDzGHm8+125kKstG/
 +zqOld3awUrdjyDl2K3n77EIXALjceQYjtCCU1Hfb58XzFi9sWi+YCuFktI0OQGf86AV
 vtJlDIFuhJmsKmci37rOBdp/6hNnwKpuD7/N1rkoKRp0zO8fkiLyDKG8B3OOZciakeRd
 V0hg==
X-Gm-Message-State: ACrzQf0PQ6c7+iYGqYuxs7CQfyZNxQt62jppmgagX1hgwRTfZxkfFQes
 lmxtGSeoTl3VADGlEQvJMEZqEg==
X-Google-Smtp-Source: AMsMyM4FL/upNT1jlpCRBE1qxGzgMD/ADUQCsdgvaq/eeSpfuu4rD4vuJ4MmYiqDKVAoYrNYPs7UMA==
X-Received: by 2002:a17:902:ce82:b0:185:47af:a0e8 with SMTP id
 f2-20020a170902ce8200b0018547afa0e8mr30593623plg.7.1666566401429; 
 Sun, 23 Oct 2022 16:06:41 -0700 (PDT)
Received: from [192.168.136.227] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a1709027e0900b001780e4e6b65sm18326698plm.114.2022.10.23.16.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Oct 2022 16:06:40 -0700 (PDT)
Message-ID: <9314d889-00c3-6096-0809-a5be734db573@linaro.org>
Date: Mon, 24 Oct 2022 09:06:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 1/7] target/arm: Don't add all MIDR aliases for cores
 that immplement PMSA
To: tobias.roehmel@rwth-aachen.de, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
 <20221023153659.121138-2-tobias.roehmel@rwth-aachen.de>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221023153659.121138-2-tobias.roehmel@rwth-aachen.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/24/22 01:36, tobias.roehmel@rwth-aachen.de wrote:
> From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

Typo "implement" in subject.

> @@ -8038,6 +8035,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                 .accessfn = access_aa64_tid1,
>                 .type = ARM_CP_CONST, .resetvalue = cpu->revidr },
>           };
> +        ARMCPRegInfo id_v8_midr_alias_cp_reginfo = {
> +              .name = "MIDR", .type = ARM_CP_ALIAS | ARM_CP_CONST,
> +              .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 4,
> +              .access = PL1_R, .resetvalue = cpu->midr
> +        };

Indentation is off: 6 spaces instead of 4 at this level.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

