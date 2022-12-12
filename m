Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210F3649E49
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 12:58:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4hD1-000559-5w; Mon, 12 Dec 2022 06:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4hCy-00053P-K7
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 06:42:56 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4hCw-0003EM-UI
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 06:42:56 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h11so11745084wrw.13
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 03:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HxzysJAGbTRtgzR8PcATgaReEVjJ2wbRqRTmaQhOyss=;
 b=P7ZmpDUW1VdXi4L9koebN28A5tnJAe4DyfN7MP717EZZRXYLgwbE2qJjreqGN4wk0U
 UubvHz4KMlYrRsOBaPhrxKQ+8/G/8Hudo/R24Qnon1DiVZPkmWXudjNgV6Eub3OPIhXg
 KcmOJYtfjkCmlEYesD1Hm34xqVXQcdN9M2Gh+ozkpPWWvUdmZGECiKmyRW2L2Jt1wnQk
 +cnR9U/z+Z6ZxFOTGmgyxuvioP5KaP2xW9Ql2nu2apxnsajiOLGNUon4iezPXJjY+Q6L
 6pDio6sSm7Y/pDg1xF3GCxWRJ2RPTBfWObHabcE5AHEqRSHrQIlUqgg9CXvuAOMk3Dj8
 AbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HxzysJAGbTRtgzR8PcATgaReEVjJ2wbRqRTmaQhOyss=;
 b=SWOnp9uUw3M0T7p1GeQNMiredf+LjcHMQAgezM0CpocPkuNK1gst2jXsOY/B+ucZZZ
 Si+He2N4mz7kSmaYKyWWhNdxgGA5KzcO6FTulGfk0x2iduKLyJX8nPY/SJklLhXuS6aT
 mEZU5t27N+/plgQfNPb5ZqcKYA1vJbaYBK4cnSZNZLNd/Cp9YASHLMJlSWUvTmlh2Uqh
 9BPfqMped6g/hKU5cjeKBo4BJieunCyR+3cbSRshOJ1aii3SJKiA4Y+cJ0amABTisbsq
 fmolZp3NfEnrF0ffu6y90WF4rYezaCkFVzqyzpWQ5NAjiF4+eFXkJSJu/PsQPDPWk+8m
 U6qA==
X-Gm-Message-State: ANoB5pm4VhF00QVV8epyDVCmUZMEeCa8FpS2xAhhFAMTHlobF+gr2qIU
 D+SUWX2pn43Z2rbCeq5wgUlEXA==
X-Google-Smtp-Source: AA0mqf4vVzs/kMtU3+qiLzZa0cmGOZ9NkXvGmdaRA+SZC8FkOwqwRYY2u6BszmBI54Td+jmMDAHIdA==
X-Received: by 2002:a5d:6304:0:b0:242:736f:d3c5 with SMTP id
 i4-20020a5d6304000000b00242736fd3c5mr9306594wru.57.1670845373378; 
 Mon, 12 Dec 2022 03:42:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e17-20020a5d5951000000b0024278304ef6sm8635966wri.13.2022.12.12.03.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 03:42:52 -0800 (PST)
Message-ID: <a311c0a1-4f08-4ed6-be8a-9cf9033afc26@linaro.org>
Date: Mon, 12 Dec 2022 12:42:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v1 04/24] vfio-user: add region cache
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <9440b5c4c72085055eaa9cdb1f4671adb04d78a4.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <9440b5c4c72085055eaa9cdb1f4671adb04d78a4.1667542066.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

On 9/11/22 00:13, John Johnson wrote:
> cache VFIO_DEVICE_GET_REGION_INFO results to reduce
> memory alloc/free cycles and as prep work for vfio-user
> 
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>   hw/vfio/ccw.c                 |  5 -----
>   hw/vfio/common.c              | 41 +++++++++++++++++++++++++++++++++++------
>   hw/vfio/igd.c                 | 23 +++++++++--------------
>   hw/vfio/migration.c           |  2 --
>   hw/vfio/pci-quirks.c          | 19 +++++--------------
>   hw/vfio/pci.c                 |  8 --------
>   include/hw/vfio/vfio-common.h |  2 ++
>   7 files changed, 51 insertions(+), 49 deletions(-)


>   void vfio_put_base_device(VFIODevice *vbasedev)
>   {
> +    if (vbasedev->regions != NULL) {
> +        int i;
> +
> +        for (i = 0; i < vbasedev->num_regions; i++) {
> +            g_free(vbasedev->regions[i]);
> +        }
> +        g_free(vbasedev->regions);
> +        vbasedev->regions = NULL;
> +    }
> +
>       if (!vbasedev->group) {
>           return;
>       }
> @@ -2432,6 +2451,17 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
>   {
>       size_t argsz = sizeof(struct vfio_region_info);
>   
> +    /* create region cache */
> +    if (vbasedev->regions == NULL) {
> +        vbasedev->regions = g_new0(struct vfio_region_info *,
> +                                   vbasedev->num_regions);
> +    }
> +    /* check cache */
> +    if (vbasedev->regions[index] != NULL) {
> +        *info = vbasedev->regions[index];
> +        return 0;
> +    }

What about simply allocating/releasing once regions[] in
vfio_instance_init / vfio_instance_finalize?

