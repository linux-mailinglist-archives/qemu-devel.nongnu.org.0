Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC2A4BBF3F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 19:15:09 +0100 (CET)
Received: from localhost ([::1]:36618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL7me-0007yw-Hg
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 13:15:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nL7jN-0006Cg-2E
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 13:11:46 -0500
Received: from [2607:f8b0:4864:20::52d] (port=39617
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nL7jK-0003Je-Ie
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 13:11:44 -0500
Received: by mail-pg1-x52d.google.com with SMTP id 195so8528295pgc.6
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 10:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=glpdK+fO5Q+QLS3q1YP48ouP8KoB7zTaA/MDsrT5IHY=;
 b=auyL0Og+nRv7KHTY/rM2mEt3b34ItYWrihm9sbBN7YR3GcZTCs+DmDAfa2gUQTRuz1
 Go220yaz+azOds+nztwxFnruv+tajcF4gWhDT62csNbkl7heqHmN6L0MAUq5QmN0W5F2
 J4c8Weq40hgqcsMwbMqi0ItMOWX7RY+vVOD27u0Qf5kZJ2Ya1A2j2aBzzoXOiHOJdciR
 G4vsx9H7i5wJdCoICWpsBvXE+mVMLoCFc8Ij8sPwpmzm0ywFkro3ZeLZhbD8yFGDfPY+
 IwQmyd5dTKRVWlO2bLMuTgBbSLchl8onFu+twjHHY8smxb/7/vpz6zWE04JjsDavNdYd
 d6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=glpdK+fO5Q+QLS3q1YP48ouP8KoB7zTaA/MDsrT5IHY=;
 b=FpYQFSznNJMEEudUdhe6uVjkfq/vjPhA3jRddRZnjo+SDKFGv+yeJwIBZacHNUrQvv
 VTFjdReB55WV/lm+Q8mlkxh5yw3o/C+Kzvo8mFzZ86mNsQu7M164GdnmhR5G8O7BRSWn
 SbievHBW9d492WSt3jRig1wSUf/JcX1cf5t5vuoy1kON9mM5f788F6b05EbTOsjpi+mI
 dhyju9rups8PZSsQvolNpg3cPtV8QGDTfPB6F1+SxZ5XB9y/F4HZx//UvW0/J+xC/53D
 GPDcXV8rhQ7X8zR3o6fswXefVSGyDdsczrjv4WH+szlVI/IUEQkUVoxRA0ag+D6njlv9
 0ACw==
X-Gm-Message-State: AOAM530Ah3ED+lPKvQzjAy5lhaCZvrFrrz0qHbrrRdNtwjcNSXdQyq6w
 YY46zX3kQ74tibmUzQrjEkA=
X-Google-Smtp-Source: ABdhPJy0w37m1npebAIH9voMGVw6+qsR2ugQYOoVHV4ZoYmelTy4r1zkc56XDOh/x6UF/q6lhZdTzQ==
X-Received: by 2002:a63:5f14:0:b0:373:9e86:44d3 with SMTP id
 t20-20020a635f14000000b003739e8644d3mr7200246pgb.416.1645207898395; 
 Fri, 18 Feb 2022 10:11:38 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 l12sm4049706pfc.182.2022.02.18.10.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 10:11:38 -0800 (PST)
Message-ID: <907eb058-01ff-0542-c057-7ecb3fd46cac@gmail.com>
Date: Sat, 19 Feb 2022 03:11:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 07/15] block/file-posix: Remove a deprecation warning
 on macOS 12
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220215080307.69550-1-f4bug@amsat.org>
 <20220215080307.69550-8-f4bug@amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220215080307.69550-8-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On 2022/02/15 17:02, Philippe Mathieu-Daudé via wrote:
> When building on macOS 12 we get:
> 
>    block/file-posix.c:3335:18: warning: 'IOMasterPort' is deprecated: first deprecated in macOS 12.0 [-Wdeprecated-declarations]
>        kernResult = IOMasterPort( MACH_PORT_NULL, &masterPort );
>                     ^~~~~~~~~~~~
>                     IOMainPort
> 
> Replace by IOMainPort, redefining it to IOMasterPort if not available.
> 
> Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Reviewed by: Cameron Esfahani <dirty@apple.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   block/file-posix.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 1f1756e192..13393ad296 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -3319,17 +3319,23 @@ BlockDriver bdrv_file = {
>   #if defined(__APPLE__) && defined(__MACH__)
>   static kern_return_t GetBSDPath(io_iterator_t mediaIterator, char *bsdPath,
>                                   CFIndex maxPathSize, int flags);
> +
> +#if !defined(MAC_OS_VERSION_12_0) \
> +    || (MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_12_0)
> +#define IOMainPort IOMasterPort
> +#endif
> +
>   static char *FindEjectableOpticalMedia(io_iterator_t *mediaIterator)
>   {
>       kern_return_t kernResult = KERN_FAILURE;
> -    mach_port_t     masterPort;
> +    mach_port_t mainPort;
>       CFMutableDictionaryRef  classesToMatch;
>       const char *matching_array[] = {kIODVDMediaClass, kIOCDMediaClass};
>       char *mediaType = NULL;
>   
> -    kernResult = IOMasterPort( MACH_PORT_NULL, &masterPort );
> +    kernResult = IOMainPort(MACH_PORT_NULL, &mainPort);
>       if ( KERN_SUCCESS != kernResult ) {
> -        printf( "IOMasterPort returned %d\n", kernResult );
> +        printf("IOMainPort returned %d\n", kernResult);
>       }
>   
>       int index;
> @@ -3342,7 +3348,7 @@ static char *FindEjectableOpticalMedia(io_iterator_t *mediaIterator)
>           }
>           CFDictionarySetValue(classesToMatch, CFSTR(kIOMediaEjectableKey),
>                                kCFBooleanTrue);
> -        kernResult = IOServiceGetMatchingServices(masterPort, classesToMatch,
> +        kernResult = IOServiceGetMatchingServices(mainPort, classesToMatch,
>                                                     mediaIterator);
>           if (kernResult != KERN_SUCCESS) {
>               error_report("Note: IOServiceGetMatchingServices returned %d",


