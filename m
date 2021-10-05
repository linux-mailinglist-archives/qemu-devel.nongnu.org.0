Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB45A42307D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 21:03:00 +0200 (CEST)
Received: from localhost ([::1]:52882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXpiN-00071d-Qh
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 15:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXpXf-0002l0-A4
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 14:51:55 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:39868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXpXd-0008CO-HN
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 14:51:54 -0400
Received: by mail-pf1-x432.google.com with SMTP id g2so319346pfc.6
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 11:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=cfJ3L7wPULzwcEmLrF2ebcIol/Bs+r0OT8ZJFgbLWC8=;
 b=APo7SyrVAPACfntC1ijEELDM/CHmF2y08X0A1nQx+bR3ESO+xw96zzRaEVlex3ASei
 fe16x/qJnmom5lT0ELJI8RzonobkRPxjvVzjlPw7qeQrvgbyIHa4+Rjs0D1xw7HpktAR
 VdO+bjz/3ykQXqIAl05eVxGWcKYJ2BUOUrCl0ygLmalu5IZuPU9BXjGPvONvKitCkZgq
 S//lEdxuDwuW0+WWf1audX3tJIlDJcEVroKba7S3Gc6Mdh3cW/niZVw8w7kUjTITHTnQ
 PpYntwVWAFEdADp69p/Kk64TcnGOZj2A4AmeNYOcFOcHiwqc+lBzTBTMLnHJanNeBB4w
 xVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cfJ3L7wPULzwcEmLrF2ebcIol/Bs+r0OT8ZJFgbLWC8=;
 b=qreVXSLpvaAuQFF5xV2+3u1Qwf7XckqIT7JsXxbJ/GfDEgunOwHvmLl0jZTJPH+TWW
 UHEuNyBioOlgy7zjJeQUC/T9iSdX4wTaqXgJHn0BsUUqbUJPOCDo71Eo8K6icY++pXuc
 qvTy28ZVAl8uB5qj5NPezuN1RM6/MVydHV/PTirFUlfoo8NXRFYhaH0twknlUo9ZAm2H
 KSbV9sK2lBdXYWzUrIRN/UxxKcSNTxNAk1xMiKIObiL4RWEw51g4B+TyZLYJeamv1eUt
 hS7Camz6zEedU9+cq++emWU6e4hIu0h17maKQ0TG7hqexkIkgWuY/yOco0ndT6BeoLuG
 RFKQ==
X-Gm-Message-State: AOAM532NQhiLWl2fYGBD9vHPB22w+B2VL/acb+xfxSmnyvcJ2RGnuwYI
 kbgoHQg4JkQUNiQFXsnyrBKfjN8B6CRmUQ==
X-Google-Smtp-Source: ABdhPJzeY940wnniuUq1iC/72SofNKmiodIJZrNq/p29qemj39w/+ZRwzeFxAzT9/LEldFPozV75kQ==
X-Received: by 2002:a63:1d23:: with SMTP id d35mr16775474pgd.357.1633459911620; 
 Tue, 05 Oct 2021 11:51:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 139sm18275697pfz.35.2021.10.05.11.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 11:51:50 -0700 (PDT)
Subject: Re: [RFC PATCH] meson.build: don't include libbpf in the common
 source set
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211005182443.2954499-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b3d99135-2f89-aeed-8c90-6a780382d3e0@linaro.org>
Date: Tue, 5 Oct 2021 11:51:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211005182443.2954499-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/5/21 11:24 AM, Alex Bennée wrote:
> This library is only needed for the softmmu targets and as such
> break static *-user builds where libbpf is detected and it tries to
> link it into the user binaries.
> 
> Fixes: 46627f41b6 ("ebpf: Added eBPF RSS loader.")
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 60f4f45165..d8bcf13b21 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2307,7 +2307,7 @@ subdir('bsd-user')
>   subdir('linux-user')
>   subdir('ebpf')
>   
> -common_ss.add(libbpf)
> +softmmu_ss.add(libbpf)

Indeed.  I also think it should go into ebpf/meson.build, just to keep everything 
together.  Something like

softmmu_ss.add(when: libbpf,
   if_true: files('ebpf_rss.c', libbpf),
   if_false: files('ebpf_rss-stub.c'))


r~

