Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9827B39B982
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 15:08:17 +0200 (CEST)
Received: from localhost ([::1]:46820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp9Ye-0008R8-AW
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 09:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lp9Xc-00072H-KA
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 09:07:12 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:46928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lp9Xa-0004nk-Pm
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 09:07:12 -0400
Received: by mail-ed1-x52a.google.com with SMTP id r11so11024931edt.13
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 06:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+Wm/srC1ybRngXXc0fJ+6M035ytiMlq1ubcMqMZlqK8=;
 b=Rj8ieoeg1glmDIJPN5Jdnc36ECXvhOiWVDGpPcyOjQ3jPYK+S5V2mgOzAkLJWoPLeg
 wFsqyjG80qAh/9BBPA1SBQmrhwhUAzHwB1BpXMiSMBvnd6Nt6xtB7bzO9Rxm96Hzhujb
 cXLFS/TS6ZEY/xEXc67TYCmeoCsl5+8BH6sJjRkk4LnPg+6hd7Nolpk/wdy/cegPx7ue
 ZhhQMrIN2MMshhOk9kGREesJknA1AknLfvZqAIpnNZeGYbbjCCg7rEOevcpdq5YG0PEd
 eIIuzt5RX3/OMnNF58pT5ZXICCUwKkvbw7kR1jC1WRgXMKMWXUbTNgNitDRWPBfonKX1
 uU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Wm/srC1ybRngXXc0fJ+6M035ytiMlq1ubcMqMZlqK8=;
 b=DUAuTAl/Lr7fj0j4II7CAMuslg9l6FZJtSe3539ynFGTZjqAEHS1i0m2RYjjtddhOw
 Cg+I/VXrWN/G60yWgzwWulyxIURlLhk2PU24cug91ZUD/G45DmxIQWvDtY3RNcUUiBwy
 xpsAKe2ZvatLA3YaWRUHR6oc1l5Zgk+kH9JsfOphwa/S1gJu+5RubzK41DoZx0dDjwcd
 o1+l5uMKI3b/bnoRo2n2OEszAAcmcH0zRMjmoMGkxBIxUlm9/W+Cyi0OY/mdaWCllhDf
 DDflaOTB82TbHHW24rEROLhKrCPULuodbup3r34LySy98g35ChlI3XuFXrMc7eCrrRN7
 BoQA==
X-Gm-Message-State: AOAM532yH1LWRyUpZJT6lTI6F5TuHwvFjxnB2zTfj9VlA+/zUDYFm5eD
 THVZ7Ugnp9hop8nAUb8uBzk=
X-Google-Smtp-Source: ABdhPJwsVCQp9cLXwtlEq66scMU7P2GEyP7I/4fZZrAr3nkaUtVADlfEcJ+IPQuRqG9bnh+HW2UHWw==
X-Received: by 2002:aa7:c84a:: with SMTP id g10mr4538404edt.326.1622812027730; 
 Fri, 04 Jun 2021 06:07:07 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id c7sm2785159ejs.26.2021.06.04.06.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 06:07:06 -0700 (PDT)
Subject: Re: [PATCH] vnc: avoid deprecation warnings for SASL on OS X
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210604120915.286195-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <155dcb87-c6ab-de58-e2cd-c6bfb478c56b@amsat.org>
Date: Fri, 4 Jun 2021 15:07:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604120915.286195-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.59,
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
Cc: peter.maydell@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 2:09 PM, Paolo Bonzini wrote:
> Apple has deprecated sasl.h functions in OS X 10.11.  Therefore,
> all files that use SASL API need to disable -Wdeprecated-declarations.
> Remove the only use that is outside vnc-auth-sasl.c and add the
> relevant #pragma GCC diagnostic there.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  ui/vnc-auth-sasl.c | 20 ++++++++++++++++++++
>  ui/vnc-auth-sasl.h |  1 +
>  ui/vnc.c           | 10 ++--------
>  3 files changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
> index df7dc08e9f..cf65a0b161 100644
> --- a/ui/vnc-auth-sasl.c
> +++ b/ui/vnc-auth-sasl.c
> @@ -28,10 +28,30 @@
>  #include "vnc.h"
>  #include "trace.h"
>  
> +/*
> + * Apple has deprecated sasl.h functions in OS X 10.11.  Therefore,
> + * files that use SASL API need to disable -Wdeprecated-declarations.
> + */
> +#ifdef CONFIG_DARWIN
> +#pragma GCC diagnostic warning "-Wdeprecated-declarations"
> +#endif
> +
>  /* Max amount of data we send/recv for SASL steps to prevent DOS */
>  #define SASL_DATA_MAX_LEN (1024 * 1024)
>  
>  
> +bool vnc_sasl_server_init(Error **errp)
> +{
> +    int saslErr = sasl_server_init(NULL, "qemu");

What is the plan once these functions are removed for the
distribution? Is there a replacement or should we start warning
the users here and in docs/system/deprecated.rst VNC/SASL will
go away soon?

> +    if (saslErr != SASL_OK) {
> +        error_setg(errp, "Failed to initialize SASL auth: %s",
> +                   sasl_errstring(saslErr, NULL, NULL));
> +        return false;
> +    }
> +    return true;
> +}

