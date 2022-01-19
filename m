Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0433149433E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 23:47:41 +0100 (CET)
Received: from localhost ([::1]:55814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAJjv-0007Q5-LT
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 17:47:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAJim-0006Zd-Ul
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 17:46:30 -0500
Received: from [2607:f8b0:4864:20::1034] (port=39506
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAJik-0001Fh-Rf
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 17:46:28 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 s61-20020a17090a69c300b001b4d0427ea2so7731294pjj.4
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 14:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yXup8XZKgWSziB+zQGHLVbmVY6FKkNr4a2kh+3qn0tg=;
 b=ihmJEUf62PxvIm38a3HpOO8ykDBz2QjQkJSG8XZz8vxxwvouvyvbeXo3c4Yn2UQpCl
 deJgjXY0nUvfzZSFgq/0Fbv23elkTkZp9sZHcuBWUxlShE3xquZy+1UcVwL2+46NKeFV
 YH5vQAcGqb0AQLytkRws1uw9px9aFbkqj/bIe4vnG4MQU7zsz00cjhDpIONdkUQhVn5f
 sEhYdN6pf8RHthKgZrmLoVR8Jxl1GqR+ZXZIFly5WyeINRUFO0nXR/KIuvZKAaYsHEaL
 DBVWxm471+CHQ/dAJBeZJwEYxMKwBe4oa2V0Sj0Mdop5QDt137vNEhCoD+9IMQX0INW2
 sBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yXup8XZKgWSziB+zQGHLVbmVY6FKkNr4a2kh+3qn0tg=;
 b=NZG2+gzQeNwLM52MQyUJxft0X7JwhPSmzNfte9eSZTPRtZM9ncqRoZ40pUuYM4Lzs4
 D9T5y6m0YOqYdK2sQpua9Q1ckrDCsqe+JJbIcxbuaocVQGjM3cx6cdod1hp9fgF8RwW2
 XAwOnUcMixIhJu5XAohMx98jcOHspO1Vh2j/2A8gtkULD1I2uuXQ9SZyP7ONSIJsHJON
 Lt21FnvFJIYuGEJV3JoUXGbQoUvrNW5256Rl+d/7GSmdUDq3YRy2CR6xSr5i/AyjkxfX
 fuuFoiv75aWp8Go6FI6AUL4TK21iDog7+lTAi08BcunbwSMkQZn8vvxD7IcGT2v48vYK
 aK8w==
X-Gm-Message-State: AOAM533Y2Iggt4DVdPDwqP7dCuSBOM2zuGFXiAvsSeWBa7wtUD+YNuq4
 b7ANnu8IApmtH+CZLHWAXcM=
X-Google-Smtp-Source: ABdhPJwTG8MYCnV95AMQ5ZOSbfBOV9GPkBoLFmgUDPsOMrs5o5iboPCwpVU8eUZuhJlVQCo7SHx3GQ==
X-Received: by 2002:a17:902:c40a:b0:14a:677d:8439 with SMTP id
 k10-20020a170902c40a00b0014a677d8439mr34577763plk.106.1642632385143; 
 Wed, 19 Jan 2022 14:46:25 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id b6sm640176pfl.126.2022.01.19.14.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 14:46:24 -0800 (PST)
Message-ID: <20ca78c8-a9f9-28f4-f1e1-255dbf384c7b@amsat.org>
Date: Wed, 19 Jan 2022 23:46:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org, alex.williamson@redhat.com
Cc: cohuck@redhat.com, david@gibson.dropbear.id.au
References: <20220118153306.282681-1-eric.auger@redhat.com>
 <20220118153306.282681-2-eric.auger@redhat.com>
In-Reply-To: <20220118153306.282681-2-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 18/1/22 16:33, Eric Auger wrote:
> Representing the CRB cmd/response buffer as a standard
> RAM region causes some trouble when the device is used
> with VFIO. Indeed VFIO attempts to DMA_MAP this region
> as usual RAM but this latter does not have a valid page
> size alignment causing such an error report:
> "vfio_listener_region_add received unaligned region".
> To allow VFIO to detect that failing dma mapping
> this region is not an issue, let's use a ram_device
> memory region type instead.
> 
> The change in meson.build is required to include the
> cpu.h header.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Stefan Berger <stefanb@linux.ibm.com>
> 
> ---
> 
> v1 -> v2:
> - Add tpm_crb_unrealize
> ---
>   hw/tpm/meson.build |  2 +-
>   hw/tpm/tpm_crb.c   | 22 ++++++++++++++++++++--
>   2 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
> index 1c68d81d6a..3e74df945b 100644
> --- a/hw/tpm/meson.build
> +++ b/hw/tpm/meson.build
> @@ -1,8 +1,8 @@
>   softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_tis_common.c'))
>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true: files('tpm_tis_isa.c'))
>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: files('tpm_tis_sysbus.c'))
> -softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
>   
> +specific_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))

We don't need to make this file target-specific.

>   specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_TIS'], if_true: files('tpm_ppi.c'))
>   specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_CRB'], if_true: files('tpm_ppi.c'))
>   specific_ss.add(when: 'CONFIG_TPM_SPAPR', if_true: files('tpm_spapr.c'))
> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
> index 58ebd1469c..6ec19a9911 100644
> --- a/hw/tpm/tpm_crb.c
> +++ b/hw/tpm/tpm_crb.c
> @@ -25,6 +25,7 @@
>   #include "sysemu/tpm_backend.h"
>   #include "sysemu/tpm_util.h"
>   #include "sysemu/reset.h"
> +#include "cpu.h"
>   #include "tpm_prop.h"
>   #include "tpm_ppi.h"
>   #include "trace.h"
> @@ -43,6 +44,7 @@ struct CRBState {
>   
>       bool ppi_enabled;
>       TPMPPI ppi;
> +    uint8_t *crb_cmd_buf;
>   };
>   typedef struct CRBState CRBState;
>   
> @@ -291,10 +293,14 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> +    s->crb_cmd_buf = qemu_memalign(ç,
> +                                HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));

HOST_PAGE_ALIGN() and qemu_real_host_page_size() actually belong
to "exec/cpu-common.h".

Alex, could you hold on a few days for this patch? I am going to send
a cleanup series. Otherwise no worry, I will clean this on top too.

Thanks,

Phil.

