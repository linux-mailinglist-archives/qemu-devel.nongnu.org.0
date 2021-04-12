Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96E435D06D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 20:35:10 +0200 (CEST)
Received: from localhost ([::1]:36348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW1Oq-0004eq-1T
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 14:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rth7680@gmail.com>)
 id 1lW1Lk-000411-9k; Mon, 12 Apr 2021 14:31:52 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:40524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rth7680@gmail.com>)
 id 1lW1Li-00009C-Fg; Mon, 12 Apr 2021 14:31:52 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 b8-20020a17090a5508b029014d0fbe9b64so9319844pji.5; 
 Mon, 12 Apr 2021 11:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xgNKECgv8ivoCnDWdSt16rUxSLJkwHrtWpoQJ4y7+Gw=;
 b=mEJd0lkKKPQBzKRbVzj26dCUgvqOr4LIrIGX9YfK7s3ryTPpPSvNrljQrODD/vJzDw
 DfrfdsdKNXORjuFeTjq3jHpEzapnntDjw4iDSVPKR65l7Ei9SzmGUR6WUvGhWMlqY19u
 x2cMctnAgl8E0lrPBa9BvA2aCFg64jMGlKOVuZTRq+qCa7RRhqHne4KXWE667SQYpf0U
 hT3q1UQf5frB7mqm7/rbrrZf9ZNlvoEa/A3bgkI5j9iU1oIOsmmKlpgeeXtf7d/fxNvJ
 pmmEoWDRpSKdC+6k73SYxdSyY7nCnrvvVZcbWzYcXdDjWKuUkkoM7YCbJDbZ+gdbXU5K
 MVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xgNKECgv8ivoCnDWdSt16rUxSLJkwHrtWpoQJ4y7+Gw=;
 b=XvwH4PWSIl7JV4WQ3yC/lsl2K+oBfuOQ0LZG94Gn1p25LEEbFwu2XMYjDz7tPTh62p
 49z9jbf280ffyn2PviLkXvPgEsDgsiDqPAU6hmAm7IrTTvu7b4oegR7PLwR3sVrb6f6v
 veJ9DgxVD8QvsDa2B0lJPw8xKc9XWdZFk+n+/B+wjF985HxRxE3PYWQAlbsAIKt1/k2o
 m8BAurhcT48h4gqq4YXZyBY4aRsYJmsm6dvbg+FDLruxbiA/2oxvrmbgjABbQCAGqiAH
 2LrF8kmlMhV2tFlANVHZv8anHjoY1c6rzDQYX/SiacRL9yGcfWFFWgQB8YpBO9KIRKuz
 Vv4A==
X-Gm-Message-State: AOAM531rezAuYZQ1JLW3gsS6SL6VqGJJ0b7zVFU4/Ln4OqkA252kQW/g
 3IaB7glNc7FJ27gUmz6jD8w=
X-Google-Smtp-Source: ABdhPJxYHNwzm2Lmvsx5exyXHGOBHsy8sZeIqfNnZGApUHep7FKu2jv/prp7kR8NVLb1puTm5BSXpg==
X-Received: by 2002:a17:90a:fe11:: with SMTP id
 ck17mr239414pjb.49.1618252307706; 
 Mon, 12 Apr 2021 11:31:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.googlemail.com with ESMTPSA id w16sm10599000pfj.87.2021.04.12.11.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 11:31:47 -0700 (PDT)
Subject: Re: [PATCH v6 6/8] hw/isa/Kconfig: Add missing dependency VIA
 VT82C686 -> APM
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1615321729.git.balaton@eik.bme.hu>
 <325bb227cea9aba1d3e6c859be830e39d08320bb.1615321729.git.balaton@eik.bme.hu>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <f0175f73-264d-df1c-8c15-ae3d0ce31915@twiddle.net>
Date: Mon, 12 Apr 2021 11:31:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <325bb227cea9aba1d3e6c859be830e39d08320bb.1615321729.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=rth7680@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, f4bug@amsat.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 12:28 PM, BALATON Zoltan wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> TYPE_VIA_PM calls apm_init() in via_pm_realize(), so
> requires APM to be selected.
> 
> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> ---
>   hw/isa/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index c7f07854f7..9c026d0c51 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -47,6 +47,7 @@ config VT82C686
>       select ACPI_SMBUS
>       select SERIAL_ISA
>       select FDC
> +    select APM
>   
>   config SMC37C669
>       bool
> 


