Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EE137B323
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 02:44:25 +0200 (CEST)
Received: from localhost ([::1]:60108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgczA-0008Qu-B7
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 20:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgcvs-0005xG-Ua
 for qemu-devel@nongnu.org; Tue, 11 May 2021 20:41:01 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:37447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgcvq-0002Ew-K3
 for qemu-devel@nongnu.org; Tue, 11 May 2021 20:41:00 -0400
Received: by mail-oi1-x22a.google.com with SMTP id k25so20785571oic.4
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 17:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pDL1S4jlSlMTRNF2xDawm0tE8upVMWbMmOZLbtHcgVg=;
 b=NpV/LZn2qFc470cE6cIKBoNRxFSEZW5fVHfIiyGb3w9hnwvCr3UqywAEtVx+BBp7wv
 AomNTjJvDcLUaIo7u+cAKRmYV8jAUB/uT+BTdPdC//UFHBJ8I8HLLwCGoL18QaP2I8Bi
 qS0n3msaYcfEFVC5ekWNxT+XmZjBjP3J4EvmWwABtBUSKuv3OjCepsFBGThz4sYjMwtu
 FVDpXimCbuoIwqd+Ky1+8UczlVcMbnRFt7+lJkIh7KVDp+7XYopmgnawwDzU+8QG+VBQ
 Ld+wDoBzmUkGQRjA6wHq0lzDnq++qH+8iOneet0JYaJXcXVi6B28iHsfNIUpDaKobJAP
 8zhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pDL1S4jlSlMTRNF2xDawm0tE8upVMWbMmOZLbtHcgVg=;
 b=gdJkI43jXGNOTWL/gekpsg/j55XGHw5MH8x1uDzFJ7lx1GwlQRzPl3C0Rm0RFlu36b
 76eeaKIWeG/dVoeN5tduYyTYDFP69DD4rmPDEfm2aEdad9MLf2lzpaDPiy1G3wpzrMGe
 eH5DOvdN1KZ8NxtchmOZIUlYKgv5qC3cM6qfdrkn+Aiqd9TW3Mjvb81c136mayrm5nDH
 2I0hEnxdh2EDSAxJP2+nwn+hQW3hUKdzEzZ9FTcuqHxp23TGoqjkGibFLT9D/6c+Nb0g
 yDdmgmz5hb1g+xWA/kmfl1rh4d9E35OH5fdtqlmWjFWe3Kd0ywLQKNVp/FRF+acivadQ
 C4Tw==
X-Gm-Message-State: AOAM5303rJfe6LXbrq+LfQ7x51PP2kAX4yyeSK8HzIozb9XHXGTeiYsg
 bLORbwU0+zDQbUtNFvuw/i8tgw==
X-Google-Smtp-Source: ABdhPJy3qomrqoMd882iU+67EOk5g1LcYolwlS5GNYZZycXnfx6QLDZQKFxnNzOhZF2lpF3rhjyoeA==
X-Received: by 2002:aca:2818:: with SMTP id 24mr23531019oix.67.1620780057380; 
 Tue, 11 May 2021 17:40:57 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id f21sm454961oou.24.2021.05.11.17.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 17:40:57 -0700 (PDT)
Subject: Re: [PATCH 05/12] crypto: bump min gcrypt to 1.7.6, dropping RHEL-7
 support
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-6-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <345fd406-a212-12cf-d35b-e07e8fb7f197@linaro.org>
Date: Tue, 11 May 2021 19:40:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-6-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 8:26 AM, Daniel P. Berrangé wrote:
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target. This lets us increment the minimum required gcrypt version and
> assume that HMAC is always supported
> 
> Per repology, current shipping versions are:
> 
>               RHEL-8: 1.8.5
>       Debian Stretch: 1.7.6
>        Debian Buster: 1.8.4
>   openSUSE Leap 15.2: 1.8.2
>     Ubuntu LTS 18.04: 1.8.1
>     Ubuntu LTS 20.04: 1.8.5
>              FreeBSD: 1.9.2
>            Fedora 33: 1.8.6
>            Fedora 34: 1.9.3
>              OpenBSD: 1.9.3
>       macOS HomeBrew: 1.9.3
> 
> Debian Stretch has the oldest version and so 1.7.6 is the new minimum.
> 
> Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

