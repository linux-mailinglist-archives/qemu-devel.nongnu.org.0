Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168F8638B66
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 14:40:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyYtQ-0000pZ-2X; Fri, 25 Nov 2022 08:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyYtJ-0000gf-Vc
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:37:18 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyYtH-0005e4-3H
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:37:16 -0500
Received: by mail-wr1-x42f.google.com with SMTP id z4so6826389wrr.3
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 05:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nzSW1URDSmtYQZA8CQ31TVmg9NwGkam2zdguV28pr5s=;
 b=k3vc51paDPklueR104nfV6ulItQ5Tij/CtlZGdXH0puyl+a/JafVvbPFRVM08avHsT
 CIzIPIBs0cgBZHjKufjRKF6NKJWfcepfmN4fCypYSfonSNC9tqdPMFvpfygfGWRQCdov
 jKV25eMnGRdCWe9EVDcMHa6P2YHBdqTMrI5OAHwztJurs/ks/FlNNkAcOMIrtoM/KdXZ
 ObNl14j048SaorX0k3MPo2nodAYLKYRtPb0WtrxzcI6Vh2eKZ8FbKidUMkhifkvFCnOK
 /QZGa23jeKniVG4Ph/STF1ZRr+JiotLMbC0dq8rHi7lFRVt0b5hWD2Y9cxn2JOUUDWnv
 Vo4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nzSW1URDSmtYQZA8CQ31TVmg9NwGkam2zdguV28pr5s=;
 b=djH85WqjCcj7BKYQX39Op99T2r0HT6SRVH3zD7VMg9JHvbnQxrPahbna+p44S4Auwh
 6Wzlpvh95XFiXJQFvSM7UuulwKfda3i/MzFiKQDY4WddODkHc9lSNDDn0wn5l6unPNGw
 C93aVOVnrqDKiwt+JMlUH9SR3cxcmdycEYqCq0R3Hv7rldB7FjiXt/wA/4CwIzULiwaa
 XkAR9an9fXga9xh5RW+JOMiCsL8XszACUx14FCPIOQfM+ZyaJd9XGMi5ZYbJ+g0+XvUL
 K1S+Y8+c0p0RyYm1h3LGuKiqzaSPtMQxUOaGyoL+cctTCWiuRkwjrsQZn4CKzJ51h7wd
 AvFQ==
X-Gm-Message-State: ANoB5plwLRmCcLP9aM8eFBMKJHLnO+qCIG6B5pwGksroGHa7n9rmkSPj
 MCEU0rSW0/OSK/7lIQME7x8Jww==
X-Google-Smtp-Source: AA0mqf6v4GUPKVJ/W4Rf+FYSgfft37epezssWC7/LtxVOS/i32VkSpnthuOUea/kKWgiG7Wz9CDHRQ==
X-Received: by 2002:adf:fa90:0:b0:241:bc1e:762f with SMTP id
 h16-20020adffa90000000b00241bc1e762fmr23358811wrr.614.1669383432507; 
 Fri, 25 Nov 2022 05:37:12 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c310e00b003a2f2bb72d5sm11634392wmo.45.2022.11.25.05.37.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 05:37:12 -0800 (PST)
Message-ID: <4e35a2b6-12ca-e43c-6ee7-7090280c9341@linaro.org>
Date: Fri, 25 Nov 2022 14:37:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] target/i386/hax: Add XCR0 support
Content-Language: en-US
To: "Wang, Wenchao" <wenchao.wang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: haxm-team <haxm-team@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <DM6PR11MB40909B4A33D66A3100F6D219870E9@DM6PR11MB4090.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <DM6PR11MB40909B4A33D66A3100F6D219870E9@DM6PR11MB4090.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On 25/11/22 13:18, Wang, Wenchao wrote:
> Hi, maintainers,
> 
> As HAXM v7.8.0 is released and it added XCR0 support, could you help to 
> merge this patch to add corresponding support into HAX user space of 
> QEMU? The patch has been included in the attachment. Thanks.

See 
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#submitting-your-patches 
on how to send patches to a mailing list.

> 
> Best Regards,
> 
> Wenchao
> 
>  From b1789f2523d06798b8883664bfa9a9df797bfccf Mon Sep 17 00:00:00 2001
> 
> From: Wenchao Wang <wenchao.wang@intel.com>
> 
> Date: Fri, 25 Nov 2022 18:37:34 +0800
> 
> Subject: [PATCH] target/i386/hax: Add XCR0 support
> 
> Introduce extended control register XCR0 to support XSAVE feature set.
> 
> Note: This change requires at least HAXM v7.8.0 to support.
> 
> Reviewed-by: Hang Yuan <hang.yuan@intel.com>
> 
> Signed-off-by: Wenchao Wang <wenchao.wang@intel.com>
> 
> ---
> 
> target/i386/hax/hax-interface.h | 2 ++
> 
> 1 file changed, 2 insertions(+)
> 
> diff --git a/target/i386/hax/hax-interface.h 
> b/target/i386/hax/hax-interface.h
> 
> index 537ae084e9..1d13bb2380 100644
> 
> --- a/target/i386/hax/hax-interface.h
> 
> +++ b/target/i386/hax/hax-interface.h
> 
> @@ -201,6 +201,8 @@ struct vcpu_state_t {
> 
>       uint64_t _cr3;
> 
>       uint64_t _cr4;
> 
> +    uint64_t _xcr0;
> 
> +
> 
>       uint64_t _dr0;
> 
>       uint64_t _dr1;
> 
>       uint64_t _dr2;
> 
> -- 
> 
> 2.17.1
> 

Is that the full patch? It is missing the register use in 
hax_sync_vcpu_register()...

Regards,

Phil.

