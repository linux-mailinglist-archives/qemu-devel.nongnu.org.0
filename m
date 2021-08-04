Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA4B3E09D8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 23:08:42 +0200 (CEST)
Received: from localhost ([::1]:59898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBO81-0005K5-KM
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 17:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mBO7H-0004ey-OB
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 17:07:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mBO7G-0003mW-1j
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 17:07:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628111273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mCs/eD26BMjFWE5cxiLdwNnQL0Eacz9atP0z8m8CzOM=;
 b=GCYphmfvGvsk/SaafXwbKD6752k/gc+1FjLvKkwtB9m3MAtKVTM9GZ6HPPSKVd6POV0tHu
 rEcXojHOAZmBQSQVUOJXIFYkwojfKQBMq5EZ6hyce8vQz4rzEUTnUZK92kCJWLpHgFaFXn
 ejWn731l5zaOhGP3qpCbGHqaiVWNauI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-HLj04uZ3OHWlsCp8Mdhcxw-1; Wed, 04 Aug 2021 17:07:51 -0400
X-MC-Unique: HLj04uZ3OHWlsCp8Mdhcxw-1
Received: by mail-wr1-f72.google.com with SMTP id
 j16-20020a5d44900000b02901549fdfd4fcso1243914wrq.6
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 14:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mCs/eD26BMjFWE5cxiLdwNnQL0Eacz9atP0z8m8CzOM=;
 b=rQv6cNscAFBlFIsL9S/ryTgunLu/mGJnMzbYDHLT3QUPBXP3rHX77mRVhsd7jQp18s
 YCYKWNQjbVaeJDDH6xt+hUREvVuPYfUgYLHoJOMOaIcQBMyLPvo3SPCBnB4VhaUZHsE/
 5qmN3Gt9eSeBcYTgqzeA0lxyh6Jq8CnH5dCTY7gn7NGOx/ylrpkok2/D4BlGogc8evq3
 ljLkGgezye/7TW7xq/47KCysQCdpe1fq+o0tvAhfO1i6+x7Nbn6Gd2lA00z7oYbMRszr
 5gd/z4DupCEPYZz037Upozas+xQ3/c4AW0cNNxKGxWBzFRfpbiy814719R8WQpSOzL5R
 JEOQ==
X-Gm-Message-State: AOAM533orbxv3o09wANvHHYECoU708mIU7iymwBXjfOSMgO/lcRThkjF
 oOaUpDluCcktASq9z+eGh9UKFBHe2Yv4kLfZYkgp/tjOowvDJ7OBpzlzpKrYWTQiJAGg+n2RhG9
 QkdvqiG+cw8KlrO8=
X-Received: by 2002:a5d:6ac4:: with SMTP id u4mr1284016wrw.166.1628111269512; 
 Wed, 04 Aug 2021 14:07:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrSn5P+pev/XuFZBAP5DreqpTzNU1MsJ7z2fX6kZa5z1PLiW5vIetRApOHtVaPzvS4rxBucg==
X-Received: by 2002:a5d:6ac4:: with SMTP id u4mr1284006wrw.166.1628111269329; 
 Wed, 04 Aug 2021 14:07:49 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id 18sm3211775wmo.2.2021.08.04.14.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 14:07:48 -0700 (PDT)
Subject: Re: [PATCH] include/qemu: Use builtins for bswap
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210708181743.750220-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7ace43a5-502b-2066-371d-b2ce7a980df4@redhat.com>
Date: Wed, 4 Aug 2021 23:07:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708181743.750220-1-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 8:17 PM, Richard Henderson wrote:
> All supported compilers have builtins for this.
> Drop all of the complicated system detection stuff.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build          |  6 -----
>  include/qemu/bswap.h | 53 +++-----------------------------------------
>  2 files changed, 3 insertions(+), 56 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 7e12de01be..6024f2d6fb 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1290,8 +1290,6 @@ config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
>  config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
>  
>  # has_header_symbol
> -config_host_data.set('CONFIG_BYTESWAP_H',
> -                     cc.has_header_symbol('byteswap.h', 'bswap_32'))
>  config_host_data.set('CONFIG_EPOLL_CREATE1',
>                       cc.has_header_symbol('sys/epoll.h', 'epoll_create1'))
>  config_host_data.set('CONFIG_HAS_ENVIRON',
> @@ -1311,10 +1309,6 @@ config_host_data.set('CONFIG_INOTIFY',
>                       cc.has_header_symbol('sys/inotify.h', 'inotify_init'))
>  config_host_data.set('CONFIG_INOTIFY1',
>                       cc.has_header_symbol('sys/inotify.h', 'inotify_init1'))
> -config_host_data.set('CONFIG_MACHINE_BSWAP_H',
> -                     cc.has_header_symbol('machine/bswap.h', 'bswap32',
> -                                          prefix: '''#include <sys/endian.h>
> -                                                     #include <sys/types.h>'''))
>  config_host_data.set('CONFIG_PRCTL_PR_SET_TIMERSLACK',
>                       cc.has_header_symbol('sys/prctl.h', 'PR_SET_TIMERSLACK'))
>  config_host_data.set('CONFIG_RTNETLINK',
> diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
> index 2d3bb8bbed..9e12bd8073 100644
> --- a/include/qemu/bswap.h
> +++ b/include/qemu/bswap.h
> @@ -1,73 +1,26 @@
>  #ifndef BSWAP_H
>  #define BSWAP_H
>  
> -#ifdef CONFIG_MACHINE_BSWAP_H
> -# include <sys/endian.h>
> -# include <machine/bswap.h>
> -#elif defined(__FreeBSD__)
> -# include <sys/endian.h>
> -#elif defined(__HAIKU__)
> -# include <endian.h>
> -#elif defined(CONFIG_BYTESWAP_H)
> -# include <byteswap.h>
> -#define BSWAP_FROM_BYTESWAP
> -# else
> -#define BSWAP_FROM_FALLBACKS
> -#endif /* ! CONFIG_MACHINE_BSWAP_H */
> -
>  #ifdef __cplusplus
>  extern "C" {
>  #endif
>  
>  #include "fpu/softfloat-types.h"
>  
> -#ifdef BSWAP_FROM_BYTESWAP
>  static inline uint16_t bswap16(uint16_t x)
>  {
> -    return bswap_16(x);
> +    return __builtin_bswap16(x);
>  }
>  
>  static inline uint32_t bswap32(uint32_t x)
>  {
> -    return bswap_32(x);
> +    return __builtin_bswap32(x);
>  }
>  
>  static inline uint64_t bswap64(uint64_t x)
>  {
> -    return bswap_64(x);
> +    return __builtin_bswap64(x);
>  }
> -#endif
> -
> -#ifdef BSWAP_FROM_FALLBACKS
> -static inline uint16_t bswap16(uint16_t x)
> -{
> -    return (((x & 0x00ff) << 8) |
> -            ((x & 0xff00) >> 8));
> -}
> -
> -static inline uint32_t bswap32(uint32_t x)
> -{
> -    return (((x & 0x000000ffU) << 24) |
> -            ((x & 0x0000ff00U) <<  8) |
> -            ((x & 0x00ff0000U) >>  8) |
> -            ((x & 0xff000000U) >> 24));
> -}
> -
> -static inline uint64_t bswap64(uint64_t x)
> -{
> -    return (((x & 0x00000000000000ffULL) << 56) |
> -            ((x & 0x000000000000ff00ULL) << 40) |
> -            ((x & 0x0000000000ff0000ULL) << 24) |
> -            ((x & 0x00000000ff000000ULL) <<  8) |
> -            ((x & 0x000000ff00000000ULL) >>  8) |
> -            ((x & 0x0000ff0000000000ULL) >> 24) |
> -            ((x & 0x00ff000000000000ULL) >> 40) |
> -            ((x & 0xff00000000000000ULL) >> 56));
> -}
> -#endif
> -
> -#undef BSWAP_FROM_BYTESWAP
> -#undef BSWAP_FROM_FALLBACKS
>  
>  static inline void bswap16s(uint16_t *s)
>  {
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


