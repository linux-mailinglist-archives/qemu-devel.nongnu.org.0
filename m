Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648775A3613
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 10:44:41 +0200 (CEST)
Received: from localhost ([::1]:50828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRrQm-0000B4-FX
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 04:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRrJF-0001mN-Ot
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 04:37:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRrJ4-0002Zz-TT
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 04:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661589402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TFAdClyB0BuWptZQBOzOmbGdONUewaJaUl6/Sg5ju1k=;
 b=InXl/cBXSvmDmWBfNdZmI+kp+mP1qHu2PfeaRFLLbh4CXZrtfbS4DZdhgQjNWBHBdIKDX5
 jfQ3rYMFl8yykMzpLjDm7Hz6qVuUdkMnp/ui+L60JWNpnrQvfB2C2i+Vsd7aasqJyyeQa+
 JAks3bhWF0sqs/cis6mHrlVZHGCOCIE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-62-Kp1JCxYfMEGwmJczM4VBZQ-1; Sat, 27 Aug 2022 04:36:40 -0400
X-MC-Unique: Kp1JCxYfMEGwmJczM4VBZQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v3-20020a1cac03000000b003a7012c430dso2507405wme.3
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 01:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=TFAdClyB0BuWptZQBOzOmbGdONUewaJaUl6/Sg5ju1k=;
 b=5fW4yfgT5sUe8IvMg82VCYDp+LSFRcdWxN9SIs+0pzhb1TPgYQQauy/NgGBnOYPvOm
 VT3E5XqhHYfZ0wy6HK5+50fu0lovH2sNAmcP4yDHtHtCfSaD0gwXECnK+ecn/qjjZoCd
 3M7ACA89YzQ57pWKq2i3yTfkTq+horcicD4xJXDqmSfbZul3LaLs2FIKNEeviwz8R6Sw
 W8ApRi4I6JQpbiWP20tCZjti/XHdmtnNKRvXpyjU1+oXSaaUYO3vjgb9jwJr9A4GU/es
 VVuigt8Cz7Y200bG6IFRk35W9zDkKioIodrR1Y3Sh2J0OuHEnPP5KQm50ywDd8S8edsn
 q67g==
X-Gm-Message-State: ACgBeo3+bTpnoFjrAiNTdOHDLIjsXcRZFxTzwqC1ssI0+znrprsX23b0
 hX+g2zEqK/xIe6+dMh/5y2lKk+ayTCFAcwxrJ8LLFtXFEERfrU+HRizFC3zc/SDa9JkB08CGjIz
 4+GX8XkP+nnz73LY=
X-Received: by 2002:a05:600c:3512:b0:3a5:e9d3:d418 with SMTP id
 h18-20020a05600c351200b003a5e9d3d418mr1816801wmq.0.1661589399813; 
 Sat, 27 Aug 2022 01:36:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR58VUPSqmEzsvZl4IzstP95QPPrpoENR327E8cssa4Sr1pnrRGxaYl1BFhqrnBLX/BwZwzO+w==
X-Received: by 2002:a05:600c:3512:b0:3a5:e9d3:d418 with SMTP id
 h18-20020a05600c351200b003a5e9d3d418mr1816784wmq.0.1661589399566; 
 Sat, 27 Aug 2022 01:36:39 -0700 (PDT)
Received: from [192.168.8.101] (tmo-097-69.customers.d1-online.com.
 [80.187.97.69]) by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c358800b003a500b612fcsm2162457wmq.12.2022.08.27.01.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Aug 2022 01:36:39 -0700 (PDT)
Message-ID: <627fcd3f-2843-7342-90b5-0baa94254c47@redhat.com>
Date: Sat, 27 Aug 2022 10:36:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 17/20] disas/nanomips: Remove argument passing by ref
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-18-milica.lazarevic@syrmia.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220815072629.12865-18-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 15/08/2022 09.26, Milica Lazarevic wrote:
> Replaced argument passing by reference with passing by address.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index 9406805367..7dfefdc5ed 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -638,7 +638,7 @@ static uint64 extract_op_code_value(const uint16 *data, int size)
>    *      disassembly string  - on error will constain error string
>    */
>   static int Disassemble(const uint16 *data, char *dis,
> -                       TABLE_ENTRY_TYPE & type, const Pool *table,
> +                       TABLE_ENTRY_TYPE *type, const Pool *table,
>                          int table_size)
>   {
>       for (int i = 0; i < table_size; i++) {
> @@ -673,7 +673,7 @@ static int Disassemble(const uint16 *data, char *dis,
>                           "disassembler failure - bad table entry");
>                           return -6;
>                       }
> -                    type = table[i].type;
> +                    *type = table[i].type;
>                       const char *dis_str = dis_fn(op_code);
>                       strcpy(dis, dis_str);
>                       free((char *)dis_str);
> @@ -22792,7 +22792,7 @@ int nanomips_dis(char *buf,
>       TABLE_ENTRY_TYPE type;
>       m_pc = address;
>       m_requested_instruction_categories = ALL_ATTRIBUTES;
> -    int size = Disassemble(bits, disasm, type, MAJOR, 2);
> +    int size = Disassemble(bits, disasm, &type, MAJOR, 2);
>   
>       strcpy(buf, disasm);
>       return size;

Reviewed-by: Thomas Huth <thuth@redhat.com>


