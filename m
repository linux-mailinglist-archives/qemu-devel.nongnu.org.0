Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385086F77F0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 23:19:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pugM4-0006YW-Rt; Thu, 04 May 2023 17:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pugM1-0006Y6-Lh; Thu, 04 May 2023 17:19:10 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pugM0-0008DU-4d; Thu, 04 May 2023 17:19:09 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-192798cf019so891413fac.3; 
 Thu, 04 May 2023 14:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683235144; x=1685827144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gQ3JSQTE2XKa+LPTnGuDhK0X9S5VXBxazmoxTvMYkmc=;
 b=Kntd68MiHdi6sNZle27fKPY4WjSShi+NEjql1JQ5ruC80decK2aJUGv5K5pnR5mM6c
 /XmatjJNf1C3gELqTYPZyu0U2lC2JwYnSvtjsttzCzmDxUnPpfNm0a29yD0m6wS07aY4
 TWN0EPOikoni02wTp68gtIzcegeeYvgxYGaUiuJvZe9W3CDLmg3RNlaczWAM+eGEee1s
 J1YmCm/Rdt5S7IKDl6ruMFMr8x4/Iy0rCh6PedgH1QiS6HrK3X9OJDvGKmctVgqU5fmE
 TzllcNLS8pIS/VohPmeEgQgpKwaxGIn+VmjrIMtLLg+MgJUVhmnIOLcunw1Y5iL0uhdh
 3ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683235144; x=1685827144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gQ3JSQTE2XKa+LPTnGuDhK0X9S5VXBxazmoxTvMYkmc=;
 b=kk8iaMog9nfOZ7CwSd0EF9WsVnaiVsGyIi/ig3CYR1qTYG2Kbk+iCbO2AJl9rtu83w
 5Rxr4DhvWCGJUqvZOYewRR03xc3dwpZ4BAr4b2fXVeGYVsvfBcDqWloA/5/7dvT+W97p
 W2TYpc7RJ++RdZKJHxrF52C1JsIfwH0JD48h4pGbq4JBJ83jqhZIqxEjtRaZpVXEaois
 L2RMX+qEoW5MbO4/P0Ur+GHKuOPTByTFjBdfD88H6FO04GG/zK8VHft0UbHMLR9lyUVq
 KkCSjYbEsSfbbhuBu+EdUD+Sd7hvdEitFU0dg5y76pddBt2/E/jlY53xPNLeKP9ml4j7
 OAdw==
X-Gm-Message-State: AC+VfDwykfZE+x3b/i1Hb4gbDgNNBnTBPRB1a2Nx4ErZbugdDCi3dAhT
 Rht3EOanis5O3xy3uNPiRf0=
X-Google-Smtp-Source: ACHHUZ7/WqXCoQKK1/kCY0ZpXmrXa5RwdVzl01sE0lfhiFz/iwsI6nIKo2Kq5Osy4tg8JzUrQ1B4EQ==
X-Received: by 2002:a05:6870:b244:b0:180:5c1f:5446 with SMTP id
 b4-20020a056870b24400b001805c1f5446mr1484642oam.50.1683235144312; 
 Thu, 04 May 2023 14:19:04 -0700 (PDT)
Received: from [192.168.68.107] ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a056870734100b00177ba198612sm1049048oal.53.2023.05.04.14.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 14:19:03 -0700 (PDT)
Message-ID: <9b5e3d31-3e1a-eba1-e935-fb6f0dd75283@gmail.com>
Date: Thu, 4 May 2023 18:19:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/ppc/Kconfig: NVDIMM is a hard requirement for the
 pseries machine
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20230504180521.220404-1-thuth@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230504180521.220404-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 5/4/23 15:05, Thomas Huth wrote:
> When building QEMU with "--without-default-devices", the pseries
> machine fails to start even when running with the --nodefaults option:
> 
>   $ ./qemu-system-ppc64 --nodefaults -M pseries
>   Type 'spapr-nvdimm' is missing its parent 'nvdimm'
>   Aborted (core dumped)
> 
> Looks like NVDIMM is a hard requirement for this machine nowadays.

Ouch.

I believe this has to do with this comment in hw/ppc/spapr.c, in
spapr_instance_init():

     /*
      * NVDIMM support went live in 5.1 without considering that, in
      * other archs, the user needs to enable NVDIMM support with the
      * 'nvdimm' machine option and the default behavior is NVDIMM
      * support disabled. It is too late to roll back to the standard
      * behavior without breaking 5.1 guests.
      */
     if (mc->nvdimm_supported) {
         ms->nvdimms_state->is_enabled = true;
     }

It seems like you found out another side effect of this nvdimm situation that Igor
documented 2 years ago in 55810e90 ("ppc/spapr: cleanup -machine pseries,nvdimm=X
handling").


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


I'll send a PPC PR in the next few days. Let me know if you want me to queue it.


Thanks,


Daniel

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/ppc/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index c898021b5f..a689d9b219 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -3,7 +3,7 @@ config PSERIES
>       imply PCI_DEVICES
>       imply TEST_DEVICES
>       imply VIRTIO_VGA
> -    imply NVDIMM
> +    select NVDIMM
>       select DIMM
>       select PCI
>       select SPAPR_VSCSI

