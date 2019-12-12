Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0015F11C6D3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 09:12:09 +0100 (CET)
Received: from localhost ([::1]:55856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifJZw-0003kV-K8
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 03:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44892)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ifJZ9-0003It-Rk
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 03:11:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ifJZ6-0002fZ-QK
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 03:11:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40373
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ifJZ6-0002bx-2k
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 03:11:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576138274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c3c7G7DXqLydzcZ04CqNy6j9PwkXhqbQV9T5kz4ba2k=;
 b=fKyENBqtqPOww7/jPsmZuwLuAumavWLmlTngUDNkpDWUGHjtnHSP0e/+EbGX2UD+NV+Qum
 DV5tQo8g0EZW9cGmNXKb3XJS7Z74XCVxAV/VrJh9qFSaxufcnTZ28gwS2Ku1oGLuPWtkSt
 zoyrfp++l9tlw8wfDJ70nXsuqTV7ZNo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-fi7i94csNnuSDj07gac6-g-1; Thu, 12 Dec 2019 03:11:11 -0500
Received: by mail-wr1-f72.google.com with SMTP id t3so710397wrm.23
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 00:11:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c3c7G7DXqLydzcZ04CqNy6j9PwkXhqbQV9T5kz4ba2k=;
 b=KokHX+m6x4tz/Kuzq6pWC5bSTzOZ4uCnphk/T1pMCocck3SICMu/qsB5yvk2oy03TN
 w9Vf5nn+wmjni7yDe3YuRQqbJn3yc63JXyG7zakya8Hd5l0lMtD2o+tNqPMkgLQ+GiYV
 f9C07Ja9ki3pv/smlRv3IptDV2u1exMgHkvG3pzoK5Ds2BBNXSSdEstYrFrJ90QjOvgn
 6uFRuCAx7C48BMca4WSwYamXxLdX06CdyovK2vEsuzVuZy3qUw9fGjjOncrac9wU1dBk
 GvdlzgcWcBi2+tTfvYJIEa0S3Mlv/LpG0mO/SvX7VFAixh4AM+aZf9yynWz6pTcMgdd3
 aFuw==
X-Gm-Message-State: APjAAAWv5nA7zwskaVRHmS4jXnpJyvKP38Uy5atQolRC/m4WDEigUDa3
 dHPFp8lUH9oAO3FGSEM9sVA15+viQ2c28EwdoN1e95gbKgX0nNNKw7rX4dkt847m7XZ9awisK2b
 2PmPnmZM8yr4+HJ0=
X-Received: by 2002:a7b:cf01:: with SMTP id l1mr4716964wmg.86.1576138270267;
 Thu, 12 Dec 2019 00:11:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqwFXK7tzEUzoB5iTNDEarsZHzBTG1MY6gq1MLWkE48TJrthvuhOxLWprpe9LsX0qTtovLzTZg==
X-Received: by 2002:a7b:cf01:: with SMTP id l1mr4716938wmg.86.1576138270025;
 Thu, 12 Dec 2019 00:11:10 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9?
 ([2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9])
 by smtp.gmail.com with ESMTPSA id z20sm4093615wmi.45.2019.12.12.00.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2019 00:11:09 -0800 (PST)
Subject: Re: [PATCH 18/28] target/i386: Remove MMU_MODE{0,1,2}_SUFFIX
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20191212040039.26546-1-richard.henderson@linaro.org>
 <20191212040039.26546-19-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a6b9e510-ed65-b6f5-5f33-76691969fd85@redhat.com>
Date: Thu, 12 Dec 2019 09:11:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191212040039.26546-19-richard.henderson@linaro.org>
Content-Language: en-US
X-MC-Unique: fi7i94csNnuSDj07gac6-g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/12/19 05:00, Richard Henderson wrote:
> The functions generated by these macros are unused.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/cpu.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index cde2a16b94..6a8228df4f 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1949,9 +1949,6 @@ uint64_t cpu_get_tsc(CPUX86State *env);
>  #define cpu_list x86_cpu_list
>  
>  /* MMU modes definitions */
> -#define MMU_MODE0_SUFFIX _ksmap
> -#define MMU_MODE1_SUFFIX _user
> -#define MMU_MODE2_SUFFIX _knosmap /* SMAP disabled or CPL<3 && AC=1 */
>  #define MMU_KSMAP_IDX   0
>  #define MMU_USER_IDX    1
>  #define MMU_KNOSMAP_IDX 2
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


