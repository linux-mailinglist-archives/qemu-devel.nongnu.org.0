Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43DF64F8DB
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 12:43:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6VaO-0001Ii-RC; Sat, 17 Dec 2022 06:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6VaN-0001HO-9Q
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 06:42:35 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6VaL-0007zn-L4
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 06:42:35 -0500
Received: by mail-ej1-x636.google.com with SMTP id kw15so11705883ejc.10
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 03:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uKOgWHR5QGXNdTnp0xQqC0IIXk3h2Uc0jhZnNlRvvNM=;
 b=RPG799XfNk9pePJbHMdtKGSAtqR4YqJI/pnpVaL3BFXRfUU8TYQGP7pHMjCqRRt5wV
 T3D2gT/AcpVKk/xMej1SwpVB24Ga5DWvlLWCeBz9tqTN6XNWIo0/Lgjbut1mBz5i8E8u
 tksu4E6E8pAP3QGF7voj58/1HSF2U8DjQnxcaWR5klt7sF98/6muXZizzDJaLClGYTn1
 QJdPARhzJghyewN7mrl1WW20za2cMglnmKiQRYjmaaw59JFCVXIgr6TSv79uc2Tvni4Y
 u3JXagkcwwZgQ5H78eF6mvPWxARxpy4mo6GmtybWkD7mzgZqxJ8weWEbAeHNvScBP9zH
 tgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uKOgWHR5QGXNdTnp0xQqC0IIXk3h2Uc0jhZnNlRvvNM=;
 b=pd6uCKCtRxdgqemWRRMdKomwwG3+QW//tBuLNwCwKnWBsvAxReuMKiBY6faS7UYjKs
 Mct958tHUguqQAAxd+WvSW5XdCJxaNnnPvE0+0o2Y95siilyoG0wHyqI3VPU6SdAMcnb
 n4pFywzP4FAgMMpCJxFN53FHLB9m66typHul5RRIRGPxGVftqvxawDVpAvlq3zE/CJ7o
 O84stqHvgACTojb1cGSpvfOSwPyRoVjsljmeL80l3dodm6CBfh2PHZZ8XqaW/o4EBlBy
 K4LH8iDpgGSEDAaws1Txk3Yd1Zt5jJxRpiaGFA4ZtzCSNPq+ap6Sjfhrw4E/0sKEtabk
 HUaA==
X-Gm-Message-State: AFqh2koG2RDtuTYa4UCGHH14c+JoKd5vPOjE88TXrOeBYppT6RHY4Lmn
 xjlnHdl5pWNRyyZ40ndsNiUiraukf8LKyLSBvBs=
X-Google-Smtp-Source: AMrXdXtckKDxU8HRPw2AWsXjG3OJxdBQKpjUGuBDDwIDOuuPBI3BtG8in/AfPo/L+P+solK6jaziPg==
X-Received: by 2002:a17:906:8d86:b0:7cd:ffd:51f2 with SMTP id
 ry6-20020a1709068d8600b007cd0ffd51f2mr13068781ejc.57.1671277351079; 
 Sat, 17 Dec 2022 03:42:31 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ox16-20020a170907101000b007c16f120aacsm1896418ejb.121.2022.12.17.03.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 03:42:30 -0800 (PST)
Message-ID: <69a006df-5673-9976-95dc-5ba54cae5e17@linaro.org>
Date: Sat, 17 Dec 2022 12:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 3/5] hw/s390x/pv: Simplify s390_is_pv() for user emulation
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
References: <20221216220411.6779-1-philmd@linaro.org>
 <20221216220411.6779-4-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216220411.6779-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
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

On 16/12/22 23:04, Philippe Mathieu-Daudé wrote:
> Protected Virtualization is irrelevant in user emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/s390x/pv.h | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
> index 5bca5bcaf1..a4814ce303 100644
> --- a/include/hw/s390x/pv.h
> +++ b/include/hw/s390x/pv.h
> @@ -12,6 +12,12 @@
>   #ifndef HW_S390_PV_H
>   #define HW_S390_PV_H
>   
> +#ifdef CONFIG_USER_ONLY
> +
> +static inline bool s390_is_pv(void) { return false; }

This change is because I'm trying to get ride of:

../target/s390x/cpu_features.c: In function ‘s390_fill_feat_block’:
../target/s390x/cpu_features.c:112:10: error: implicit declaration of 
function ‘s390_is_pv’ [-Werror=implicit-function-declaration]
   112 |     if (!s390_is_pv()) {
       |          ^~~~~~~~~~
../target/s390x/cpu_features.c:112:10: error: nested extern declaration 
of ‘s390_is_pv’ [-Werror=nested-externs]

../target/s390x/cpu_models.c: In function ‘s390_has_feat’:
../target/s390x/cpu_models.c:239:9: error: implicit declaration of 
function ‘s390_is_pv’ [-Werror=implicit-function-declaration]
   239 |     if (s390_is_pv()) {
       |         ^~~~~~~~~~
../target/s390x/cpu_models.c:239:9: error: nested extern declaration of 
‘s390_is_pv’ [-Werror=nested-externs]

without including <sysemu/kvm.h> in common code. Common code shouldn't
include hw/ header...

I'll respin guarding more code against CONFIG_USER_ONLY.

