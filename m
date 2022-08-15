Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB8F593055
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 15:57:20 +0200 (CEST)
Received: from localhost ([::1]:45268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNaak-0005Ev-Kc
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 09:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNaZQ-0003uF-Jk
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 09:55:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNaZM-00088r-DX
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 09:55:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660571751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aPe+aoRO8uGiVhj+nSepOiY5C2KPPL/Z7yyFEESK6sg=;
 b=FulagsBuDo3s4HK9//X+UNMvwjGYjKfGxUbiVeLm09QkrZj8askzzaQ/rlgotZYuj9ROdO
 I4VJvr5nxTzWemAlH9DHUwHcdk5m1rGgq5Qn0YGBfC5X6iG/gL+PqcYIYw05zT5PAraHjD
 cz+SeTv+7fDNeQpPUEx5RtQN3ZJeeq0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-278-S_hQU1VlPsanByDSDtaYFw-1; Mon, 15 Aug 2022 09:55:50 -0400
X-MC-Unique: S_hQU1VlPsanByDSDtaYFw-1
Received: by mail-wr1-f69.google.com with SMTP id
 l16-20020adfbd90000000b0022073dbf2f3so1195924wrh.5
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 06:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=aPe+aoRO8uGiVhj+nSepOiY5C2KPPL/Z7yyFEESK6sg=;
 b=hlgg2vFPlz6rhfuJM9j85FX8Unj1g2eoESSNzVLJHcaIPdGTyED9HHspsH3wCF5NP8
 BGhGSXWO2I0U1G2UHCHlkCmmlZNsqCF7T4s2+wH6u+mSPIot9Oq7UgjJcuwP+EWUUDxt
 9Fc5qGsJX11+z7m6fKt/ct0tQGU/qR18dtcr1wn07mZ54VNRIi3lxDuq7C+LTkLY/Kas
 PBN/fbA5bhY7x6QNcIeq1F6Gvg3zFcmlML8uXmxmMzCNFxYVQHEYS5EdH7y3JUqyFc2p
 bbNrFa24mWhujgYGahdDZBQwLqtxduZ3V+wLTrRCDFbtBSq2/9HvY7jZRXonRsdabRxp
 zHSw==
X-Gm-Message-State: ACgBeo0w3IlEdWK5mYf7lkqPRh5pa6M3gaZUFvNVqFT+XCz6ZJk5Oruk
 0x4aJFLABy3dl1Ub/ggpUfBm8vbwNADztkoIX3+2k6stTuBtweCUf/DQy7uqWI8EZSVrEknLfDd
 yQflPZJAuVAYEBeA=
X-Received: by 2002:a5d:61d0:0:b0:220:839f:dc95 with SMTP id
 q16-20020a5d61d0000000b00220839fdc95mr8551186wrv.241.1660571748923; 
 Mon, 15 Aug 2022 06:55:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR51YOGebDO/XEjxtLT6rxzhTqyiGB6Qp2aXoBEYfSs3nNh9ey9NPxvgnvf93Yz5guNFJ8rzXQ==
X-Received: by 2002:a5d:61d0:0:b0:220:839f:dc95 with SMTP id
 q16-20020a5d61d0000000b00220839fdc95mr8551170wrv.241.1660571748682; 
 Mon, 15 Aug 2022 06:55:48 -0700 (PDT)
Received: from [192.168.8.103] (tmo-096-168.customers.d1-online.com.
 [80.187.96.168]) by smtp.gmail.com with ESMTPSA id
 p185-20020a1c29c2000000b003a4f1385f0asm10103264wmp.24.2022.08.15.06.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 06:55:47 -0700 (PDT)
Message-ID: <120f0281-8db3-932a-76e5-4dfeb872e99e@redhat.com>
Date: Mon, 15 Aug 2022 15:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 01/20] disas/nanomips: Remove namespace img
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-2-milica.lazarevic@syrmia.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220815072629.12865-2-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
> Since there's no namespace feature in C, namespace img has been replaced
> with adding the prefix "img" to the namespace members.
> 
> Prefix "img" has been added to the function names of functions that used
> to be wrapped in namespace img. Those are img::format() functions.
> I.e. replaced img::format with the img_format.
> 
> Typedef address that used to belong to namespace img now is called
> img_address.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 1433 ++++++++++++++++++++++----------------------
>   disas/nanomips.h   |   10 +-
>   2 files changed, 713 insertions(+), 730 deletions(-)
> 
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index 9be8df75dd..96b7bfd83b 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -137,131 +137,118 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
>   }
>   
>   
> -namespace img
> +std::string img_format(const char *format, ...)
>   {
> -    address addr32(address a)
> -    {
> -        return a;
> +    char buffer[256];
> +    va_list args;
> +    va_start(args, format);
> +    int err = vsprintf(buffer, format, args);
> +    if (err < 0) {
> +        perror(buffer);
>       }
> +    va_end(args);
> +    return buffer;
> +}
>   
> -    std::string format(const char *format, ...)
> -    {
> -        char buffer[256];
> -        va_list args;
> -        va_start(args, format);
> -        int err = vsprintf(buffer, format, args);
> -        if (err < 0) {
> -            perror(buffer);
> -        }
> -        va_end(args);
> -        return buffer;
> -    }
> -
> -    std::string format(const char *format,
> -                       std::string s)
> -    {
> -        char buffer[256];
> -
> -        sprintf(buffer, format, s.c_str());
> +std::string img_format(const char *format,
> +                   std::string s)
> +{
> +    char buffer[256];
>   
> -        return buffer;
> -    }
> +    sprintf(buffer, format, s.c_str());
>   
> -    std::string format(const char *format,
> -                       std::string s1,
> -                       std::string s2)
> -    {
> -        char buffer[256];
> +    return buffer;
> +}
>   
> -        sprintf(buffer, format, s1.c_str(), s2.c_str());
> +std::string img_format(const char *format,
> +                   std::string s1,
> +                   std::string s2)
> +{
> +    char buffer[256];
>   
> -        return buffer;
> -    }
> +    sprintf(buffer, format, s1.c_str(), s2.c_str());
>   
> -    std::string format(const char *format,
> -                       std::string s1,
> -                       std::string s2,
> -                       std::string s3)
> -    {
> -        char buffer[256];
> +    return buffer;
> +}
>   
> -        sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str());
> +std::string img_format(const char *format,
> +                   std::string s1,
> +                   std::string s2,
> +                   std::string s3)
> +{
> +    char buffer[256];
>   
> -        return buffer;
> -    }
> +    sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str());
>   
> -    std::string format(const char *format,
> -                       std::string s1,
> -                       std::string s2,
> -                       std::string s3,
> -                       std::string s4)
> -    {
> -        char buffer[256];
> +    return buffer;
> +}
>   
> -        sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str(),
> -                                s4.c_str());
> +std::string img_format(const char *format,
> +                   std::string s1,
> +                   std::string s2,
> +                   std::string s3,
> +                   std::string s4)
> +{
> +    char buffer[256];
>   
> -        return buffer;
> -    }
> +    sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str(),
> +                            s4.c_str());
>   
> -    std::string format(const char *format,
> -                       std::string s1,
> -                       std::string s2,
> -                       std::string s3,
> -                       std::string s4,
> -                       std::string s5)
> -    {
> -        char buffer[256];
> +    return buffer;
> +}
>   
> -        sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str(),
> -                                s4.c_str(), s5.c_str());
> +std::string img_format(const char *format,
> +                   std::string s1,
> +                   std::string s2,
> +                   std::string s3,
> +                   std::string s4,
> +                   std::string s5)
> +{
> +    char buffer[256];
>   
> -        return buffer;
> -    }
> +    sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str(),
> +                            s4.c_str(), s5.c_str());
>   
> -    std::string format(const char *format,
> -                       uint64 d,
> -                       std::string s2)
> -    {
> -        char buffer[256];
> +    return buffer;
> +}
>   
> -        sprintf(buffer, format, d, s2.c_str());
> +std::string img_format(const char *format,
> +                   uint64 d,
> +                   std::string s2)
> +{
> +    char buffer[256];
>   
> -        return buffer;
> -    }
> +    sprintf(buffer, format, d, s2.c_str());
>   
> -    std::string format(const char *format,
> -                       std::string s1,
> -                       uint64 d,
> -                       std::string s2)
> -    {
> -        char buffer[256];
> +    return buffer;
> +}
>   
> -        sprintf(buffer, format, s1.c_str(), d, s2.c_str());
> +std::string img_format(const char *format,
> +                   std::string s1,
> +                   uint64 d,
> +                   std::string s2)
> +{
> +    char buffer[256];
>   
> -        return buffer;
> -    }
> +    sprintf(buffer, format, s1.c_str(), d, s2.c_str());
>   
> -    std::string format(const char *format,
> -                       std::string s1,
> -                       std::string s2,
> -                       uint64 d)
> -    {
> -        char buffer[256];
> +    return buffer;
> +}
>   
> -        sprintf(buffer, format, s1.c_str(), s2.c_str(), d);
> +std::string img_format(const char *format,
> +                   std::string s1,
> +                   std::string s2,
> +                   uint64 d)
> +{
> +    char buffer[256];
>   
> -        return buffer;
> -    }
> +    sprintf(buffer, format, s1.c_str(), s2.c_str(), d);
>   
> -    char as_char(int c)
> -    {
> -        return static_cast<char>(c);
> -    }
> -};

Since you've removed the (unused) as_char() function here...

> @@ -764,9 +751,9 @@ std::string NMD::ADDRESS(uint64 value, int instruction_size)
>   {
>       /* token for string replace */
>       /* const char TOKEN_REPLACE = (char)0xa2; */
> -    img::address address = m_pc + value + instruction_size;
> +    img_address address = m_pc + value + instruction_size;
>       /* symbol replacement */
> -    /* return img::as_char(TOKEN_REPLACE) + to_string(address); */
> +    /* return img_as_char(TOKEN_REPLACE) + to_string(address); */
>       return to_string(address);
>   }

... you also might want to remove the comment that is using it here 
(including the TOKEN_REPLACE comment above)?

Anyway, the patch looks fine to me, so:
Reviewed-by: Thomas Huth <thuth@redhat.com>


