Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEC45AD4A6
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 16:21:12 +0200 (CEST)
Received: from localhost ([::1]:33752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVCyL-0006Da-9Q
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 10:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVCuH-0004Xp-VX
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 10:16:58 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:42964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVCuG-0006t2-7t
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 10:16:57 -0400
Received: by mail-pf1-x42e.google.com with SMTP id 72so8712682pfx.9
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 07:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=vDOSXx3q8Q7IHjp1C6+dll9C485Un6XPCi3qLePN/tk=;
 b=gnXzI3djGXQFKoRyjyshHpaD5bbye8kYZsIkPnEGPh8SSLtrIMF4hPCrOdM7fwq7tK
 D0KOlOyMaApooLuNcCWo0e37/N3qPor4lDU/uHTQ9F4BoPEfgcXA9m+Fmmd/Mlf+k+IU
 MgciLqZ4OoNg9urfpeogq5gSarlyqmwrKOKu40eOaeBkFqY68CPqNR5Ot0LFsdXl8ejG
 9LWdpRkh/+tszqQSpscHs4hOHBC80vQtV1WWNPbKj5FtE3H8ReTJheOu8oAieF0w9NBj
 nyiw1je+aeDU+GzQeb9Ot6eDCduSquUxlWgg6Bb8Oj04RMYdxSg2Du6P58Sz3KU2TuVi
 EXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=vDOSXx3q8Q7IHjp1C6+dll9C485Un6XPCi3qLePN/tk=;
 b=ilvQU0Sy4uv28ZjQYwtvCutt7hQv5m8RY2XhtS0Vs58LYIvKq88yYUft3G+iHl8GtB
 n7sd/jQZC6JmGu1GPe07wEkXZu/SF57ipxpIf8A1I3Z4junNzKBOs1yiZg2XtrmkkYY8
 BKY8e9q90acI22I9mStHDIGhjJ5eynHP6fhNYopaMpEoobTV7D52oN5L5cg6+RCb5pig
 dXJ4HqlOzOVBfPi/5QSJdN5mvjIQlwv18lMcIQooHXc++qcwqOl4HCnFU2zdWOvIoU//
 HlirQdBgIBsjumwnRelxcootOuHpOmYl3GRRNnLrOK6z2FCT23dvVmiRicdn30Qc7s+w
 tcjg==
X-Gm-Message-State: ACgBeo0HiUEiBPoWrbGvUn1x2+9EPcSUnzwabX/fd+VuHFhSP3LFl4b0
 xnxpEvlLjZTbOIE94tlKd8I=
X-Google-Smtp-Source: AA6agR4HmAKYFCr07XNQ+H/aBXIp1plakIgqurWcQ8kLvax6SoBE6+S4hE+V0GfiV07j+hDsb+i/+g==
X-Received: by 2002:a65:6415:0:b0:42b:4def:ce00 with SMTP id
 a21-20020a656415000000b0042b4defce00mr41489784pgv.362.1662387414420; 
 Mon, 05 Sep 2022 07:16:54 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z127-20020a623385000000b0053abb15b3d9sm8068177pfz.19.2022.09.05.07.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 07:16:53 -0700 (PDT)
Message-ID: <3c3cb9ed-13bd-845a-a89f-47bc90837398@amsat.org>
Date: Mon, 5 Sep 2022 16:16:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] coverity: put NUBus under m68k component
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220905102633.20940-1-pbonzini@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220905102633.20940-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.716,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 5/9/22 12:26, Paolo Bonzini wrote:
> It is only used by the Q800 emulation, so put it under that architecture.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   scripts/coverity-scan/COMPONENTS.md | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
> index fc1608932e..0e6ab4936e 100644
> --- a/scripts/coverity-scan/COMPONENTS.md
> +++ b/scripts/coverity-scan/COMPONENTS.md
> @@ -22,7 +22,7 @@ i386
>     ~ (/qemu)?((/include)?/hw/i386/.*|/target/i386/.*|/hw/intc/[^/]*apic[^/]*\.c)
>   
>   m68k
> -  ~ (/qemu)?((/include)?/hw/m68k/.*|/target/m68k/.*|(/include)?/hw(/.*)?/mcf.*)
> +  ~ (/qemu)?((/include)?/hw/m68k/.*|/target/m68k/.*|(/include)?/hw(/.*)?/mcf.*|(/include)?/hw/nubus/.*)
>   
>   microblaze
>     ~ (/qemu)?((/include)?/hw/microblaze/.*|/target/microblaze/.*)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

