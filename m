Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08F86400FD
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 08:20:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p10Ke-0000Wn-2G; Fri, 02 Dec 2022 02:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p10Kb-0000Vm-Cz
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 02:19:33 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p10KZ-0005pm-I4
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 02:19:33 -0500
Received: by mail-wr1-x42e.google.com with SMTP id z4so6497738wrr.3
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 23:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6AGdXosVaRM6yNToejqFo9FecdDcMcuPJiWoM+bR+O4=;
 b=WDh9kTq233gGos50mkI7FCbn19rh+z4Hb1wMacXNCkzSoM/ZTuk/5sDXM8ZWSLXIGA
 t0OKnduohK7Z8OEnmMF2QVHH4ZHFdyvTFp0xH4fQSxmWfDdNddIudtIqoGIs+WLu3hoS
 EtCKzbLMOWSwElu4WCvHzkomLd6W8bJ9jLcVGDzZcY5orZDyxAcwHz/8Ku+1B7RMxkzB
 M/iDlMAzfXMZxY/kCTNPAfVcPuGHWqJfS/VRg4XLHAD5o5kMGtEm//6ct622En/sEkM2
 fx04wLYqzzFyaPR3gXQUqDRYmigvOJ9o3Ij8HaEpzj/CZ27LzoIxv4D4jfXE+wBdhpHx
 icaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6AGdXosVaRM6yNToejqFo9FecdDcMcuPJiWoM+bR+O4=;
 b=CZGNVorj9Sst1cWyp9ISXjd1NYW5uvX+GhK/aEf/kZRQfaAthQ+lOECfCcEmOnUow0
 hu98SR35hDVXZbru/7emTe9qWpoKeYR8d4qglNnojzQRM58ZXu+gL/IxBIVoVC4TGbSd
 u2nGOX5676Mv2qcLzG6cGi9vH8FO4gxUpKPgEkG/Hk+99RagjPsaCTOIa6PYh70Rgr2l
 qdbbuZHaD4nJouKz8kmO98SosD0Xej5wgHA8cF5t9waX1VTFZe2l1KikrRfvQ0MvOn8U
 YOrTWH8IoYS4JjEqMjnYt6GuNMPxnQV13sRShH2ooYFeErgHlX8YxelOWlqQdH+uuO4L
 F8Tg==
X-Gm-Message-State: ANoB5pnNPnGoSKDPIu/q/MOCp3rfHdz0JjAj+jynz4JcsxZtrSCVWyk9
 pK7f5jnFMpsStCTXDq4i1mgSKg==
X-Google-Smtp-Source: AA0mqf7xc/dh8mx/yihRRVdBAa5aHsDHPj/31uoIlgXptsUgi+yG+zMMeqbPjdX0gao+chxJFxvZLg==
X-Received: by 2002:a05:6000:1e1b:b0:242:29d7:1004 with SMTP id
 bj27-20020a0560001e1b00b0024229d71004mr7617583wrb.208.1669965569566; 
 Thu, 01 Dec 2022 23:19:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n28-20020a05600c3b9c00b003d0891678f2sm453972wms.10.2022.12.01.23.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 23:19:29 -0800 (PST)
Message-ID: <a45c902a-043d-5256-7961-40c8aabd89b4@linaro.org>
Date: Fri, 2 Dec 2022 08:19:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [QEMU][PATCH v2 05/11] include/hw/xen/xen_common: return error
 from xen_create_ioreq_server
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-dev@xilinx.com
Cc: stefano.stabellini@amd.com, alex.bennee@linaro.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-6-vikram.garhwal@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202030003.11441-6-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

Hi Stefano and Vikram,

On 2/12/22 03:59, Vikram Garhwal wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> This is done to prepare for enabling xenpv support for ARM architecture.
> On ARM it is possible to have a functioning xenpv machine with only the
> PV backends and no IOREQ server. If the IOREQ server creation fails,
> continue to the PV backends initialization.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>   include/hw/xen/xen_common.h | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
> index 77ce17d8a4..6510ac15e0 100644
> --- a/include/hw/xen/xen_common.h
> +++ b/include/hw/xen/xen_common.h
> @@ -467,9 +467,10 @@ static inline void xen_unmap_pcidev(domid_t dom,
>   {
>   }
>   
> -static inline void xen_create_ioreq_server(domid_t dom,
> -                                           ioservid_t *ioservid)

How long are we supposed to maintain this code? Per [*]:

   In general XenProject.org supports stable branches for 18 months full
   support plus 18 months security fixes. When a new X.Y.0 release is
   made there is usually one more release on the to-be-retired stable
   branch to mop up any loose patches sitting in the repository at which
   point the branch is retired.

4.17 was just released. 4.5 was 7 years ago. IIUC EOL'ed 4 years ago.

[*] 
https://wiki.xenproject.org/wiki/Xen_Project_Maintenance_Releases#Stable_Maintenance_Branches

Regards,

Phil.

