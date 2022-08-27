Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57A95A35A6
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 09:40:53 +0200 (CEST)
Received: from localhost ([::1]:56310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRqR1-0000D4-3D
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 03:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRqP8-0007It-M7
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 03:38:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRqP4-00038N-1C
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 03:38:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661585928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WErXepnv2IyqSAzyrnRkmqoZ+aizqRnPiyrQfdFVXvw=;
 b=eblLGOkjPIcm2NEj4si4rvrx4MxpASqkhszf9BHusTg8eI3tnzx/ecOmDn3YFLN1sAL6ax
 Xg9BWJl8ktRsS2CeyBBjZtwyNQwM55oYUSR3RkzGk8Jz+Gq1nAnXyuQPKCKwJhnNyY+VcA
 3Kd7hlKPujqzeg9ojllqmHZ4Sm5l1JU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-178-7K8u4O0QNcqLPj3ESrZTsw-1; Sat, 27 Aug 2022 03:38:47 -0400
X-MC-Unique: 7K8u4O0QNcqLPj3ESrZTsw-1
Received: by mail-wm1-f69.google.com with SMTP id
 p19-20020a05600c1d9300b003a5c3141365so5182644wms.9
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 00:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=WErXepnv2IyqSAzyrnRkmqoZ+aizqRnPiyrQfdFVXvw=;
 b=nGup3nWvFqFXjXrqM6Eaou5vuJJAU/MuvIKHQSosyTgYsDOtYOhR2abcNSx1P1uYDh
 pnpar8JJUPoCnc48wnLbwSLqrPNQCYGlzLQuWxIGVEWee8Ybtnxv7AwG8jcui7fCip6t
 kV6zp+u6+tP+aAD9NXrtwiNJB+xMQjs+vxImU5SFt8jV6oQrzaH6ClOa5b0TiDIpIG6b
 4B0Tx/Q8t3s9y53/umnqgLbaD283nnPiSD1ngEZixGIdO6Vtd1OvjPmKaUgIxFDThUS2
 uRPzJDtwLXgWijdbKdzNezKsBNi3IZv1q8fK/xyswZqq19S2K06q2jGOkY4uoZyrBh4g
 wWMw==
X-Gm-Message-State: ACgBeo1gSBhsuVj2TpRSlcwul7XycVJEFcSVnMwJ02v6t8gAy4M5AgPS
 zHjj//ptjIV0Rc3M7TsTeEjGPtsWr/jx1mZrvRp9v+8+aafPs0OZUXm6s4oXY3bxYYt7ZsDBzaA
 pbbUUkT95tWL9KOw=
X-Received: by 2002:a5d:5985:0:b0:222:c827:11d5 with SMTP id
 n5-20020a5d5985000000b00222c82711d5mr1553941wri.323.1661585926316; 
 Sat, 27 Aug 2022 00:38:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5A8KYcqPVTulMP1BiD7Zvc1yMaEOVAS6YIr/JaOO2bjAFUfjRID078rxdmI3GqmAygNm/2uw==
X-Received: by 2002:a5d:5985:0:b0:222:c827:11d5 with SMTP id
 n5-20020a5d5985000000b00222c82711d5mr1553927wri.323.1661585926043; 
 Sat, 27 Aug 2022 00:38:46 -0700 (PDT)
Received: from [192.168.8.101] (tmo-097-69.customers.d1-online.com.
 [80.187.97.69]) by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c1d1a00b003a62052053csm2244254wms.18.2022.08.27.00.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Aug 2022 00:38:45 -0700 (PDT)
Message-ID: <94400db7-4f7e-5acc-5046-1c7ecfc0d116@redhat.com>
Date: Sat, 27 Aug 2022 09:38:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-13-milica.lazarevic@syrmia.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 12/20] disas/nanomips: Replace std::string type
In-Reply-To: <20220815072629.12865-13-milica.lazarevic@syrmia.com>
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
> The return type of typedef disassembly_function is changed to
> const char * instead of std::string. Therefore, for every particular
> disassembly_function function signature is changed.
> For example:
> - static std::string ABS_D(uint64 instruction) {...} is replaced with
> - static const char *ABS_D(uint64 instruction) {...}
> 
> Every helper function used to return std::string is changed to return
> const char *. This applies to following functions: img_format,
> to_string, GPR, save_restore_list, FPR, etc.
> 
> Now that we replaced every std::string for const char * or char *, it is
> possible to delete multiple versions of the img_format function. The
> general version:
> - static const char *img_format(const char *format, ...) {...}
> can handle all string formatting, so others have been deleted.
> 
> Where necessary, strdup() is used to malloc string. Memory leaking needs
> to be prevented, so matching free() calls will be added later.
> 
> Simple assignments like:
> - x = "string"
> are handled using the strcpy() function where needed.
> 
> String concatenation in the save_restore_list() function is handled
> using strcat() function instead of += operator.
> 
> Without applying all of these changes, the nanomips disassembler may be
> buildable but can't produce the appropriate output, so all of them are
> made together.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 4721 ++++++++++++++++++++++----------------------
>   1 file changed, 2312 insertions(+), 2409 deletions(-)
> 
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index 23db8177ef..561e4ff095 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -30,13 +30,11 @@
>   #include "qemu/osdep.h"
>   #include "disas/dis-asm.h"
>   
> -#include <cstring>
> +#include <string.h>
>   #include <stdexcept>
>   #include <stdio.h>
>   #include <stdarg.h>
>   
> -#include <string>
> -
>   typedef int64_t int64;
>   typedef uint64_t uint64;
>   typedef uint32_t uint32;
> @@ -44,7 +42,7 @@ typedef uint16_t uint16;
>   typedef uint64_t img_address;
>   
>   typedef bool(*conditional_function)(uint64 instruction);
> -typedef std::string(*disassembly_function)(uint64 instruction);
> +typedef const char *(*disassembly_function)(uint64 instruction);
>   
>   enum TABLE_ENTRY_TYPE {
>       instruction,
> @@ -93,7 +91,7 @@ struct Pool {
>   static img_address           m_pc;
>   static TABLE_ATTRIBUTE_TYPE   m_requested_instruction_categories;
>   
> -std::string img_format(const char *format, ...)
> +static const char *img_format(const char *format, ...)
>   {
>       char buffer[256];
>       va_list args;
> @@ -103,112 +101,15 @@ std::string img_format(const char *format, ...)
>           perror(buffer);
>       }
>       va_end(args);
> -    return buffer;
> +    return strdup(buffer);
>   }

If you're returning allocated memory, the return type could also be "char *" 
instead of "const char *" - that way you could get rid of a lot of casting 
in the next patch ("free((char *)....)").

> -std::string to_string(img_address a)
> +static const char *to_string(img_address a)
>   {
>       char buffer[256];
>       sprintf(buffer, "0x%" PRIx64, a);
> -    return buffer;
> +    return strdup(buffer);
>   }

Maybe it would also be better to switch to the functions from glib instead, 
you could avoid hard-coded array sizes that way. E.g. for this function:

static const char *to_string(img_address a)
{
     return g_strdup_printf("0x%" PRIx64, a);
}

See: https://docs.gtk.org/glib/func.strdup_printf.html

> @@ -617,21 +518,22 @@ static std::string GPR(uint64 reg)
>   }
>   
>   
> -static std::string save_restore_list(uint64 rt, uint64 count, uint64 gp)
> +static const char *save_restore_list(uint64 rt, uint64 count, uint64 gp)
>   {
> -    std::string str;
> +    char str[256];
> +    str[0] = '\0';
>   
>       for (uint64 counter = 0; counter != count; counter++) {
>           bool use_gp = gp && (counter == count - 1);
>           uint64 this_rt = use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & 0x1f;
> -        str += img_format(",%s", GPR(this_rt));
> +        strcat(str, img_format(",%s", GPR(this_rt)));
>       }
>   
> -    return str;
> +    return strdup(str);
>   }

Using a hard-coded array first and doing a strdup() at the end looks weird 
... why don't you malloc() the str buffer right at the beginning of the 
function? (or use g_malloc instead to avoid
checking for NULL).

  Thomas


