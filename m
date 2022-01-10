Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624AC489A9E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:48:52 +0100 (CET)
Received: from localhost ([::1]:49884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6v2Y-0004Ff-Uq
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:48:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6ubi-00086w-Dr
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:21:09 -0500
Received: from [2a00:1450:4864:20::435] (port=33318
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6ubg-0001hs-Du
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:21:05 -0500
Received: by mail-wr1-x435.google.com with SMTP id r9so24969820wrg.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 05:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fp8iBt13bfZD4ltiZJSKC3dUYpmL/daeRgVe4gPVB+0=;
 b=hHJDzBtBjRu0b9w2sUTJdKTrRKcLOEsiXVRybL1FxG6Mko7TWxP2rSojh9993XGORv
 X3TUi/ZOHj63+wa90OwgjRWEyoDHEwHU8zciUVKmeVu4qkvxqupX/Mka6Bkotzi/CwmP
 XlZQkdhy9pW73w3zbYyriKB0U8vavx+XY69Tag0a5DCvgubA33sTxbT7IoEMUKzb9u+f
 7tYmo7H76Im0J2JFEVwN3k1zjkTyzAHs60+v4G9+2rMlXqGJTBTf+pX7pBnHNIpzqAtZ
 +RycDxBQDTnN+rRr9nX1Y4Uc6FcJyW49UwYe+7B5wMox+kGF1fs6HeP1wunNeOk0UCPW
 NUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fp8iBt13bfZD4ltiZJSKC3dUYpmL/daeRgVe4gPVB+0=;
 b=TQdP8SPV4Mmv16mh+VOW9iiEVv/Wz0GAZ6/MFE5bsdgRQpLve7iDBcFH48yfGwovU6
 0oyVy1Jp209uC64eX8YHOsTn2gKTimqQY1OjnMJK9VgbHgEvLAMQI72qckJRPqjUnQqf
 nccscatclGjLXE6E6A3C5U42Xsxi/GcaU/1OzZAZx//g3WpdjZdKkSSfjW9QzGS8cBCo
 hkTjqlwztUYJ1cciijWNlLT4vZw/PfG/k3ZycmiwOtkLyQwfZxEfLHa1zlhVt9cS6bYH
 AYBW9k4a/PKilTgGDeL9EcEuKBxfoPfFrbjD+g9yBn5XZ0kSC6gKrx8BxlsWx3JIW0ta
 6QtQ==
X-Gm-Message-State: AOAM531uG/UKrVxk/aCj1J2rGroBHs2YMVQIO5TGyCE7ttQ8cP4o4l9o
 AmfEuTmGP9by1ToGkhJxale41A21phdytg==
X-Google-Smtp-Source: ABdhPJyO8TF50/lt0cuw2m6YcrpW+y8dGt+PngbKRTkrO1eXMMTw5nQIlDXgs/+jSXBZ/U+YaWtPyQ==
X-Received: by 2002:a5d:6c6a:: with SMTP id r10mr64695551wrz.349.1641820860395; 
 Mon, 10 Jan 2022 05:21:00 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id f13sm7316873wri.51.2022.01.10.05.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 05:21:00 -0800 (PST)
Message-ID: <da52a8ca-6132-022a-0b3c-8bcb0d5e4620@amsat.org>
Date: Mon, 10 Jan 2022 14:20:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 5/7] audio/coreaudio: Remove a deprecation warning
 on macOS 12
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220110131001.614319-1-f4bug@amsat.org>
 <20220110131001.614319-6-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220110131001.614319-6-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 14:09, Philippe Mathieu-Daudé wrote:
> When building on macOS 12 we get:
> 
>   audio/coreaudio.c:50:5: error: 'kAudioObjectPropertyElementMaster' is deprecated: first deprecated in macOS 12.0 [-Werror,-Wdeprecated-declarations]
>       kAudioObjectPropertyElementMaster
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       kAudioObjectPropertyElementMain
>   /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/AudioHardwareBase.h:208:5: note: 'kAudioObjectPropertyElementMaster' has been explicitly marked deprecated here
>       kAudioObjectPropertyElementMaster API_DEPRECATED_WITH_REPLACEMENT("kAudioObjectPropertyElementMain", macos(10.0, 12.0), ios(2.0, 15.0), watchos(1.0, 8.0), tvos(9.0, 15.0)) = kAudioObjectPropertyElementMain
>       ^
> 
> Replace by kAudioObjectPropertyElementMain, redefining it to
> kAudioObjectPropertyElementMaster if not available, using
> Clang __is_identifier() feature (coreaudio is restricted to
> macOS).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Checkpatch:
> 
>  WARNING: architecture specific defines should be avoided
>  #10: FILE: audio/coreaudio.c:47:
>  +#if !__is_identifier(kAudioObjectPropertyElementMain) /* macOS >= 12.0 */
> 
> Should we define __is_identifier() to 0 for GCC on macOS?

So apparently yes:
https://lore.kernel.org/qemu-devel/2147921.xlN1UyrzLN@silver/

Christian Schoenebeck suggests:

#if !defined(MAC_OS_VERSION_12_0) ||
    (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
#define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
#endif

> ---
>  audio/coreaudio.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> index d8a21d3e507..73cbfd479ac 100644
> --- a/audio/coreaudio.c
> +++ b/audio/coreaudio.c
> @@ -44,10 +44,14 @@ typedef struct coreaudioVoiceOut {
>      bool enabled;
>  } coreaudioVoiceOut;
>  
> +#if !__is_identifier(kAudioObjectPropertyElementMain) /* macOS >= 12.0 */
> +#define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
> +#endif
> +
>  static const AudioObjectPropertyAddress voice_addr = {
>      kAudioHardwarePropertyDefaultOutputDevice,
>      kAudioObjectPropertyScopeGlobal,
> -    kAudioObjectPropertyElementMaster
> +    kAudioObjectPropertyElementMain
>  };

