Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639C852AA3E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 20:13:14 +0200 (CEST)
Received: from localhost ([::1]:40118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr1gv-0005sG-85
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1eL-0004HK-8T
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:10:25 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1eJ-0002O6-KT
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:10:24 -0400
Received: by mail-pj1-x102e.google.com with SMTP id l14so7219294pjk.2
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 11:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TaBwXtT+0sd9ltQ2iv9P1ru8EZE9weEq3vexlU2rBys=;
 b=ZgHmb4M2Efb9AYrtqRfoEZtKEysQNlcPbErttIHiIIvfFb68Bl4FoY0ldOM5wmUbWg
 VEG4gZH6GRZp4PRXDOljJ5DGC1LXqx3Il82VzNTCLPkIL5G43krmIQaFBrXK4iUOVVxZ
 I0FPa2MJvAo+IZ2RclT0ga2dIrNqoSzB3jYmMmWdWe2Q0rtqJOYIDMjZmB1KdlGGlWdi
 AY3CN19Z4aN4sOPtZLgik9/UabGWjeSzn93SZ5XymWarJZlMsQUml6oaJlrMjLm8HJ6T
 n1om3qMXqUSf/uBQF4APmjkwKg1lHEOIp7zGnqqfr+WTcd/4omqFMvbch9+EAeEUFdme
 Pt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TaBwXtT+0sd9ltQ2iv9P1ru8EZE9weEq3vexlU2rBys=;
 b=jEnTj82jRdnvAGG+40A6DAi74cQPd/ALA0GqMlo/CdoXJLKWWKQWm0e/jp8s7ubNmH
 8K+L1OK2nCBKBrtHElgfiWZnNqR+eDPYfYhPYIQrwWcXTGaBnIJEqkBW88+EjD/AzodH
 ZteE3uC/Zew8gwGlhuY9bhgiNuaB6lTh8gvTmLwZ2aj4dbtcarrRIp3d9fs01mel9w2E
 QTqTRRDz0ui0H49vATKQ5zfdjJC9AaTPjs3+MM9reJLt7xQTn5DL50HJ/1umCqzt+j8d
 g6fwv6gFVDnnVKfpQJGY/ukJ+wuQ/Bp3F6cCkcfYMbdi5tbEVU3oLzfsPRbIk18hqhcq
 nC4w==
X-Gm-Message-State: AOAM532uKsP2q7Qz5lh62vikEpvMpv5mqpUJ3uMIKnueQN7KUkBAs+aA
 0Ps+Ek2hdI+CRDy5y5hG5jdJ4w==
X-Google-Smtp-Source: ABdhPJwnZqPy/JDlOCI5N0zcUmSF9Mg6RjWe32dSbtOb7l8pih+8VZq2oG/LQHsvm0+pnJK/VGn9UA==
X-Received: by 2002:a17:90b:1d8a:b0:1dc:588b:cd5d with SMTP id
 pf10-20020a17090b1d8a00b001dc588bcd5dmr37641873pjb.229.1652811022192; 
 Tue, 17 May 2022 11:10:22 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 13-20020a630e4d000000b003c14af50626sm8619669pgo.62.2022.05.17.11.10.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 11:10:21 -0700 (PDT)
Message-ID: <ab0e0e49-c412-3544-58cf-9dd981249c14@linaro.org>
Date: Tue, 17 May 2022 11:10:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 04/16] build: do a full build before running TCG tests
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20220517092616.1272238-1-pbonzini@redhat.com>
 <20220517092616.1272238-5-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517092616.1272238-5-pbonzini@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/22 02:26, Paolo Bonzini wrote:
> TCG tests need both QEMU and firmware to be built, so do "ninja all" before
> trying to run them.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/Makefile.include | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

