Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985FC2DE099
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 10:52:23 +0100 (CET)
Received: from localhost ([::1]:44098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqCQw-0006mQ-MG
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 04:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqCPn-00063z-VU
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 04:51:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqCPf-00047M-JJ
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 04:51:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608285061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IBzk+/iwD18STurBHpiN2UHvvqdnFunrg1V8dnAg428=;
 b=ecANMgqfUqsrjN3cK2d+DZ+QdOnPH6apFeRf3/envlm8G1C9DGueG8f7jl4P1m2S65mBKF
 jkT6cLa69PXA7hu1Da7rMNhK3i8gJUAEdVwchnW+4UAYOjT81zQ1xzzGvP7mKBURjh3vNv
 0bZFDzKUESqDG3k7Edqek0cWyl2nwnY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-pmtSMNDzMTCrt7Cf4Nb4Jw-1; Fri, 18 Dec 2020 04:50:59 -0500
X-MC-Unique: pmtSMNDzMTCrt7Cf4Nb4Jw-1
Received: by mail-ej1-f72.google.com with SMTP id h17so589426ejk.21
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 01:50:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IBzk+/iwD18STurBHpiN2UHvvqdnFunrg1V8dnAg428=;
 b=ltv6X+hTZGU4f1CtLUv4plV1llAA1/A0s+yj6n38teXMypZD7PrCctJF2TkVtwbUVE
 9EE7qqTXEZogs1kZUJYhSV/G1MdeHEIsT3bxP6dcMS96UMfqc/QBHXSNy4eJvIjj8dI0
 zi9ZVf3wQ2GBeNwra0ss412Sa8AkGvgaiLYbPKa26Za1dc8d3n6lxYfAWdr2gL7NdUv0
 6tlsxsQB/Ssgaz//YHoo509/H05KD64EJi6BhhcisLzNrTX9qYqDMlkKkKdg/YECVj6X
 RZ29OgGTagwqLCX92UGnfpkZASBtrsr/RoDkvSBT8iDZ0vgyMODyUd8k+csINrghPK6q
 dxpA==
X-Gm-Message-State: AOAM532IBzOU+RPNQxaeiTo5N7iMS0vTh3YxNiaGcYTcMKLUNdlMiE7W
 J7p0EcmPTWenDTpDEVDzIAXLVwZlkSsXo5vT2gN+YB5wbYzlREphG3vr48cyLaTI2gC6DGM/D4f
 SPtB1IqjhbFkQ8wo=
X-Received: by 2002:a05:6402:a52:: with SMTP id
 bt18mr3540336edb.228.1608285058338; 
 Fri, 18 Dec 2020 01:50:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsL1SPPMwxjcCo0j6NXDz+Lgxti8XLLLZ9Jl5Hv+ENbwS31HXnwM6+sGNcrTkB/moGs5t/KA==
X-Received: by 2002:a05:6402:a52:: with SMTP id
 bt18mr3540323edb.228.1608285058153; 
 Fri, 18 Dec 2020 01:50:58 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs27sm5399073ejb.21.2020.12.18.01.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 01:50:57 -0800 (PST)
Subject: Re: [PATCH] whpx: fix compilation
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20201218084611.634254-1-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <023ac901-2c57-15da-4dfe-62b1f4f1c23d@redhat.com>
Date: Fri, 18 Dec 2020 10:50:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201218084611.634254-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: sunilmut@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/12/20 09:46, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> When compiling WHPX (on msys2)
> 
> FAILED: libqemu-x86_64-softmmu.fa.p/target_i386_whpx_whpx-all.c.obj
> ../target/i386/whpx/whpx-all.c:29:10: fatal error: whp-dispatch.h: No such file or directory
>     29 | #include "whp-dispatch.h"
>        |          ^~~~~~~~~~~~~~~~
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/sysemu/whpx.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
> index 9346fd92e9..79ab3d73cf 100644
> --- a/include/sysemu/whpx.h
> +++ b/include/sysemu/whpx.h
> @@ -15,7 +15,9 @@
>   
>   #ifdef CONFIG_WHPX
>   
> -#include "whp-dispatch.h"
> +#include <windows.h>
> +#include <WinHvPlatform.h>
> +#include <WinHvEmulation.h>
>   
>   struct whpx_state {
>       uint64_t mem_quota;
> 

This is wrong, just "git mv target/i386/whpx/whp-dispatch.h 
include/sysemu" instead (and possibly change the #include line to 
sysemu/whp-dispatch.h).

But I wonder if whp-dispatch.h is needed at all in this file.  If we can 
just include it in whpx-all.c and whpx-apic.c, that would be much better.

Paolo


