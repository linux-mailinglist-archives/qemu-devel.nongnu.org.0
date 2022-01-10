Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D637489F4A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 19:31:47 +0100 (CET)
Received: from localhost ([::1]:46468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6zSM-0007At-1C
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 13:31:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n6zPV-0005d4-Ek
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 13:28:49 -0500
Received: from [2607:f8b0:4864:20::631] (port=37418
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1n6zPS-0004hm-0O
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 13:28:49 -0500
Received: by mail-pl1-x631.google.com with SMTP id q14so13227177plx.4
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 10:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wCWWTTPY4lLelsqPX5e08ZZkGfYOgAB53RABzK+K894=;
 b=KzRkkyNbE7ITgDhm+sOikKME1XpPvbI4mDO5eUekOlqHQT0rvpXYwBdDN4mZJElIdW
 zhDAkw3eVWMIv1UMDNnkjiL/z3eSZ9DCnBEL4dzmqzjA+Pzlou7wooZGn1/IXXpA7Hoi
 b9HDvPpY2dv8RzHMhO/iuSbIkxbqR+3Euw/CJL2N9WQ+f5KuYPQBQHgkJVnSgVkbs0iH
 ltxnT4JRANi2EVPwnFafGyL/Z8XD5bdxo+0AichS8wsYFKax//6iaZO/pm8vWcZ9o437
 YJkv+nXoo+r0A2SR9qjjwP3TWMs/YqNiceB2AtPsKsMI/hXITsp+La7XEgA5ERkDG0pb
 er2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wCWWTTPY4lLelsqPX5e08ZZkGfYOgAB53RABzK+K894=;
 b=m7L6Vp579d7z9aoVFy8K36hjR0ilyMMTzdlYNF8xZDh2QJXtpKfBSZhh36+os+nKuU
 ja6+vGddbEDf0kC76LiylqH5ljfFR+XRJjondHM3xsEhEaTri3SpifOX+GAkzmNsHTl8
 Ere/33hpXXStSXn9x0fw3vdh2sqPk1LUr2TnsWNXSli2TYr1qsYoIfQvvq+y++quOIh4
 MZn4ycpRW28ek03t/bWsxkiT37fkY0Ygay2b5/luetePIjAS7ocnZQhEk6irWtOaqpyO
 5/GFJtlEOktCMNmKrCjaewVrnXXiptbJYpmj17xYH28kiRdf7rOBJYmk3RvIVjJuLXdR
 1s3g==
X-Gm-Message-State: AOAM530mWV7UntRxZWzJ7LrrAgd2a5hk3mvVTD3kllCPDeM6Fw7wnZs7
 D/krEfFZtH1R1fEbS4bf+fI=
X-Google-Smtp-Source: ABdhPJwTFIytoJSd+g2jQe1nCn868acE1iY4+MaoE5WAMehmDBDNLuds8kn6ki49+JbcomTYqKlU7g==
X-Received: by 2002:aa7:92d1:0:b0:4bb:9d7:6951 with SMTP id
 k17-20020aa792d1000000b004bb09d76951mr1008099pfa.40.1641839324571; 
 Mon, 10 Jan 2022 10:28:44 -0800 (PST)
Received: from [192.168.64.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 e30sm5901824pgb.10.2022.01.10.10.28.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 10:28:44 -0800 (PST)
Message-ID: <ab67d300-8ed7-8731-22eb-21df9ee349a4@gmail.com>
Date: Tue, 11 Jan 2022 03:28:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 6/7] block/file-posix: Remove a deprecation warning
 on macOS 12
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220110131001.614319-1-f4bug@amsat.org>
 <20220110131001.614319-7-f4bug@amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220110131001.614319-7-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/01/10 22:10, Philippe Mathieu-Daudé wrote:
> When building on macOS 12 we get:
> 
>    block/file-posix.c:3335:18: warning: 'IOMasterPort' is deprecated: first deprecated in macOS 12.0 [-Wdeprecated-declarations]
>        kernResult = IOMasterPort( MACH_PORT_NULL, &masterPort );
>                     ^~~~~~~~~~~~
>                     IOMainPort
> 
> Replace by IOMainPort, redefining it to IOMasterPort if not
> available, using Clang __is_identifier() feature (this code
> is guarded by __APPLE__ #ifdef'ry).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Checkpatch:
> 
>   WARNING: architecture specific defines should be avoided
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   block/file-posix.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index b283093e5b7..1d0512026c5 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -3324,17 +3324,22 @@ BlockDriver bdrv_file = {
>   #if defined(__APPLE__) && defined(__MACH__)
>   static kern_return_t GetBSDPath(io_iterator_t mediaIterator, char *bsdPath,
>                                   CFIndex maxPathSize, int flags);
> +
> +#if !__is_identifier(IOMainPort) /* macOS >= 12.0 */
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
> @@ -3347,7 +3352,7 @@ static char *FindEjectableOpticalMedia(io_iterator_t *mediaIterator)
>           }
>           CFDictionarySetValue(classesToMatch, CFSTR(kIOMediaEjectableKey),
>                                kCFBooleanTrue);
> -        kernResult = IOServiceGetMatchingServices(masterPort, classesToMatch,
> +        kernResult = IOServiceGetMatchingServices(mainPort, classesToMatch,
>                                                     mediaIterator);
>           if (kernResult != KERN_SUCCESS) {
>               error_report("Note: IOServiceGetMatchingServices returned %d",

Unlike kAudioObjectPropertyElementMain, which is a constant, IOMainPort 
is a symbol, and its availability depends on the runtime. As such, the 
check the existence of the compile-time identifier is not sufficient 
here. MAC_OS_X_VERSION_MIN_REQUIRED should be used instead. (I should 
have suggested the use of MAC_OS_X_VERSION_MIN_REQUIRED at the first 
place since it can be used regardless if the identifier is for a 
constant or a symbol. My Bad.)

Regards,
Akihiko Odaki

