Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA19228292
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 16:44:40 +0200 (CEST)
Received: from localhost ([::1]:53360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxtVX-0004m6-Bv
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 10:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jxtUk-0004E9-Ts; Tue, 21 Jul 2020 10:43:50 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jxtUj-000758-Av; Tue, 21 Jul 2020 10:43:50 -0400
Received: by mail-wr1-x444.google.com with SMTP id z2so21512480wrp.2;
 Tue, 21 Jul 2020 07:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qtsZMzihjfVxDE6BVI9GmuNegO8Us+Pb++4CrjGJ2b0=;
 b=H0TFMELziiJMuqusOYByQF/Z7qLWCiAdvLIm4sXMvAtojR0b4HyKh1rsVcflUxiUtY
 XLO+BfoKtf/JNGU6q9teLz3V2QfqOBjvUmR5BDaOSf0AcZgHH9eZVn7+V70hRDBAMee8
 wR798ymxcDjnM92b19QQUPRt41k+VI5X5+V1ddlaON7OHwWck0VlVar11SKHeJh10mV3
 sU1eEkWD0CoZFsJmZ6y5rYVwvszVIe0+ZlQFe3I/ce2hFQ60ZBb9fi62xl2ToR83N7QZ
 N+kQu5x/cjf8xlVwUXUcVn2gUTlhvu6CfsFoHzJsONgGrp/ZvmOUVDZoNXSUg1smkCyA
 8CTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qtsZMzihjfVxDE6BVI9GmuNegO8Us+Pb++4CrjGJ2b0=;
 b=QVPagtBPqOlvwXhQoXdNAnBw3U9eKGj+gCMqCrpC18YWIQptVmn8k0OixzquNujbzy
 nbmEXXC13cLOK5dYy5EGmkCY6OYDiGhXIBRITVDa1BKGL63IlgJUjILE87vjhy5rJvon
 Pv8Ma7P401EdgVh3mHCAIMruWg4WqzfhuML3AIoAA4lzwPNGQDzTWVMFAzqZCqB4Jp66
 01tVY7Of2GuZqcc6bucbetXIgxTUIYmOMQgKd0BW5/XtWV2bkt8iVdLKY2bqBrUC7tkL
 nKj6kYLK6ULWhuLvpOy828ru8mlPCkvN31Y/2IVXO5KACry8PnrcR0gY4xu5S70gnUBE
 yKUw==
X-Gm-Message-State: AOAM530QIsZtLJerreumYoGwhLaKO2/Sd8QloSHt3T6+d+I4ck7FZcbj
 +AKH89m6dLcLq1OHxTn1pXg=
X-Google-Smtp-Source: ABdhPJzkX9zVLx1Vqb0gKid72hS+dtaXYBzLTC3xpkJ4oWgj9ABra9j3BN5PQzfK/2N3lTyPyWaxvg==
X-Received: by 2002:adf:8024:: with SMTP id 33mr29026772wrk.117.1595342627386; 
 Tue, 21 Jul 2020 07:43:47 -0700 (PDT)
Received: from [192.168.1.36] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id b23sm3958158wmd.37.2020.07.21.07.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 07:43:46 -0700 (PDT)
Subject: Re: [PATCH for-5.1] docs/system/arm/virt: Document mte machine option
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200721143556.19484-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bdf110e6-417f-ebc3-9a98-4717c04ede0f@amsat.org>
Date: Tue, 21 Jul 2020 16:43:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200721143556.19484-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/20 4:35 PM, Peter Maydell wrote:
> Commit 6a0b7505f1fd6769c which added documentation of the virt board
> crossed in the post with commit 6f4e1405b91da0d0 which added a new
> 'mte' machine option. Update the docs to include the new option.

I'd use 'mte' between quotes in the patch subject too.

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/virt.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 6621ab7205d..32dc5eb22ee 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -79,6 +79,10 @@ virtualization
>    Set ``on``/``off`` to enable/disable emulating a guest CPU which implements the
>    Arm Virtualization Extensions. The default is ``off``.
>  
> +mte
> +  Set ``on``/``off`` to enable/disable emulating a guest CPU which implements the
> +  Arm Memory Tagging Extensions. The default is ``off``.
> +
>  highmem
>    Set ``on``/``off`` to enable/disable placing devices and RAM in physical
>    address space above 32 bits. The default is ``on`` for machine types
> 


